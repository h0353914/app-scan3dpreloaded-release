#!/usr/bin/env python3
"""
幫 RES_MODULES 清單裡「用 classes-only jar 引入、沒有透過正常 AAR 流程」的每個
函式庫，補產生它們自己的 R.class（library-scoped R class，AGP 正常處理 AAR
依賴時會自動產生，這裡因為改用 implementation(files(resource-bearing-classes.jar))
而沒有了，但這些函式庫內部程式碼有時會直接引用自己的 R$xxx 存取資源，例如
com.google.android.gms.common.R$string、androidx.core.R$id 等，缺了會在該
程式碼路徑第一次被呼叫到時 NoClassDefFoundError）。

作法：
    1. 讀每個 AAR 裡的 R.txt（資源符號清單，沒有最終 id，只有型別/名稱）。
    2. 對照 app/src/main/res/values/public.xml（我們專案的資源反編譯結果釘住的
       最終 id）取得正確數值——同一個資源名稱/型別，兩邊理論上要指向同一筆
       resources.arsc 條目，用 public.xml 的值才會跟我們自己重新編譯出的
       resources.arsc 一致（不能直接抄 R.txt 或原始 apk 反編譯出的 smali 裡的
       數值，那些是「原始建置當時」的 id，可能跟我們重編出來的不一樣，見
       commit 說明的 com.google.android.gms.common.R$string 0x7f100095 vs
       0x7f100094 案例）。
    3. public.xml 找不到的（該函式庫宣告了資源符號，但這個 app 版本根本沒用到
       所以没有出現在 public.xml），略過（不產生該欄位）。
    4. 輸出每個函式庫一個 <package>.R.java（含所有型別的巢狀類別），供
       javac/d8 編譯後併入 dex。

用法：
    python3 tools_diff/gen_library_r_stubs.py
輸出：
    tools_diff/library_r_stubs/<package>/R.java（每個函式庫一份）
"""
import os
import re
import zipfile

REPO_ROOT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..")
CACHE_ROOT = os.path.expanduser("~/.gradle/caches/modules-2/files-2.1")
PUBLIC_XML = os.path.join(REPO_ROOT, "app/src/main/res/values/public.xml")
OUT_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "library_r_stubs")

# 跟 merge_resource_bearing_classes.py 的 RES_MODULES 保持一致。
RES_MODULES = [
    "androidx.appcompat:appcompat:1.1.0",
    "androidx.appcompat:appcompat-resources:1.1.0",
    "androidx.browser:browser:1.0.0",
    "androidx.cardview:cardview:1.0.0",
    "androidx.constraintlayout:constraintlayout:1.1.3",
    "androidx.coordinatorlayout:coordinatorlayout:1.0.0",
    "androidx.core:core:1.1.0",
    "androidx.media:media:1.0.0",
    "androidx.preference:preference:1.1.0",
    "androidx.recyclerview:recyclerview:1.0.0",
    "androidx.transition:transition:1.1.0",
    "com.android.support:support-compat:26.1.0",
    "com.android.support:support-media-compat:26.1.0",
    "com.facebook.fresco:drawee:1.13.0",
    "com.google.android.gms:play-services-auth:16.0.1",
    "com.google.android.gms:play-services-base:16.0.1",
    "com.google.android.gms:play-services-basement:16.2.0",
    "com.google.android.material:material:1.0.0-rc01",
    "com.google.firebase:firebase-messaging:17.3.4",
]


def find_aar(group: str, artifact: str, version: str) -> str:
    d = os.path.join(CACHE_ROOT, group, artifact, version)
    for hashdir in os.listdir(d):
        hd = os.path.join(d, hashdir)
        if not os.path.isdir(hd):
            continue
        for f in os.listdir(hd):
            if f.endswith(".aar"):
                return os.path.join(hd, f)
    raise FileNotFoundError(f"{group}:{artifact}:{version} 沒有 .aar 檔")


def load_public_ids() -> dict[tuple[str, str], int]:
    """回傳 {(type, name): id} ，從 public.xml 解析。"""
    ids: dict[tuple[str, str], int] = {}
    pattern = re.compile(
        r'<public\s+type="([^"]+)"\s+name="([^"]+)"\s+id="(0x[0-9a-fA-F]+)"'
    )
    with open(PUBLIC_XML, encoding="utf-8") as f:
        for line in f:
            m = pattern.search(line)
            if m:
                ids[(m.group(1), m.group(2))] = int(m.group(3), 16)
    return ids


# R.txt 每行格式：int <type> <name> <value>  或  int[] styleable <name> { ... }
RTXT_LINE = re.compile(r'^int\s+(\S+)\s+(\S+)\s+')


def parse_java_package(aar_path: str) -> str:
    with zipfile.ZipFile(aar_path) as z:
        manifest = z.read("AndroidManifest.xml").decode("utf-8", errors="ignore")
    m = re.search(r'package="([^"]+)"', manifest)
    if not m:
        raise ValueError(f"{aar_path} 的 AndroidManifest.xml 找不到 package 屬性")
    return m.group(1)


def parse_rtxt_symbols(aar_path: str) -> list[tuple[str, str]]:
    """回傳 [(type, name), ...]，styleable 跳過（int[]，不是單一 id，用不到）。"""
    out = []
    with zipfile.ZipFile(aar_path) as z:
        if "R.txt" not in z.namelist():
            return out
        content = z.read("R.txt").decode("utf-8", errors="ignore")
    for line in content.splitlines():
        if not line.startswith("int "):
            continue  # 跳過 int[] styleable
        m = RTXT_LINE.match(line)
        if m:
            out.append((m.group(1), m.group(2)))
    return out


def main() -> None:
    public_ids = load_public_ids()
    print(f"public.xml 裡有 {len(public_ids)} 筆資源 id")

    os.makedirs(OUT_DIR, exist_ok=True)
    for m in RES_MODULES:
        g, a, v = m.split(":")
        aar_path = find_aar(g, a, v)
        package = parse_java_package(aar_path)
        symbols = parse_rtxt_symbols(aar_path)

        by_type: dict[str, dict[str, int]] = {}
        missing = 0
        for typ, name in symbols:
            key = (typ, name)
            if key in public_ids:
                by_type.setdefault(typ, {})[name] = public_ids[key]
            else:
                missing += 1

        total_fields = sum(len(v) for v in by_type.values())
        print(f"{m:55s} package={package:40s} 符號數={len(symbols):4d} 可對照={total_fields:4d} 略過={missing:4d}")

        if total_fields == 0:
            continue  # 這個函式庫的資源這個 app 版本完全沒用到，不用產生 R stub

        pkg_dir = os.path.join(OUT_DIR, *package.split("."))
        os.makedirs(pkg_dir, exist_ok=True)
        lines = [f"package {package};", "", "public final class R {"]
        for typ in sorted(by_type):
            lines.append(f"    public static final class {typ} {{")
            for name, val in sorted(by_type[typ].items()):
                # Java 識別字不能是數字開頭；資源名稱理論上都合法，但保險起見過濾一下。
                if not re.match(r'^[A-Za-z_][A-Za-z0-9_]*$', name):
                    continue
                lines.append(f"        public static final int {name} = {hex(val)};")
            lines.append("    }")
        lines.append("}")
        lines.append("")

        with open(os.path.join(pkg_dir, "R.java"), "w", encoding="utf-8") as f:
            f.write("\n".join(lines))

    print(f"\n輸出目錄：{OUT_DIR}")


if __name__ == "__main__":
    main()
