#!/usr/bin/env python3
"""
把「有帶 Android 資源（res/、AndroidManifest.xml）」的 androidx / 第三方 AAR
依賴，只取其 classes.jar（純位元組碼），合併成單一 app/libs/resource-bearing-classes.jar，
供 app/build.gradle.kts 以 implementation(files(...)) 引入。

背景：app/src/main/res 是從原始 APK 反編譯出來的，已經包含當初建置時這些函式庫
實際貢獻進最終 apk 的資源版本（含 res/values/public.xml 釘住的資源 ID）。若直接用
implementation("group:artifact:version") 宣告依賴，Gradle 會把 AAR 自帶的 res/ 一併
合併進來，導致 aapt2 資源衝突/重新編號，執行期對應到錯誤資源而 NPE 閃退。

用法：
    1. 先確保 ~/.gradle/caches/modules-2/files-2.1 底下已經有這些 AAR 的快取
       （跑一次 `./gradlew :app:dependencies --configuration debugRuntimeClasspath`
       或任何會觸發依賴解析的 task 即可）。
    2. 視需要修改下面 RES_MODULES 清單（新增/移除「有資源的」依賴時同步更新）。
    3. python3 tools_diff/merge_resource_bearing_classes.py
    4. 輸出：app/libs/resource-bearing-classes.jar

判斷一個 AAR 是否「有資源」：解開 AAR 看 res/ 底下是否有非空檔案。可用
tools_diff/check_aar_resources.py 重新掃描目前完整依賴樹逐一檢查。
"""
import os
import zipfile

# 目前判定為「有資源」的依賴（group:artifact:version）。
# 這份清單來自對完整 debugRuntimeClasspath 依賴樹逐一解開 AAR 檢查 res/ 資料夾的結果
# （2026-08-19 這次 session 的掃描結果，可用 check_aar_resources.py 重新驗證）。
#
# 注意：androidx.databinding:databinding-runtime/databinding-adapters:3.3.2 雖然也是
# AAR，但解開後 res/ 底下只有 <id> 型別資源（dataBinding/onAttachStateChangeListener/
# onDateChanged/textWatcher），這些名稱在 app/src/main/res/values/ids.xml 已有完全
# 同名宣告。Android 資源系統允許同一個 id 資源被多處重複宣告（不像 attr/style/drawable
# 那樣會因為「內容不同」而衝突），aapt2 不會因此報 Duplicate value 錯誤，所以刻意不放進
# 這份清單、繼續讓它們以正常 AAR 座標宣告（配合 build.gradle.kts 的
# resolutionStrategy.force 釘住 3.3.2，避免 AGP 自動注入更高版本連帶要求
# compileSdk 31+ 的 lifecycle-runtime）。
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

CACHE_ROOT = os.path.expanduser("~/.gradle/caches/modules-2/files-2.1")
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
OUT_PATH = os.path.join(SCRIPT_DIR, "..", "app", "libs", "resource-bearing-classes.jar")


def find_aar(group: str, artifact: str, version: str) -> str:
    d = os.path.join(CACHE_ROOT, group, artifact, version)
    if not os.path.isdir(d):
        raise FileNotFoundError(
            f"找不到 {group}:{artifact}:{version} 的 gradle cache 目錄：{d}\n"
            "先跑 './gradlew :app:dependencies --configuration debugRuntimeClasspath' 讓 Gradle 解析依賴。"
        )
    for hashdir in os.listdir(d):
        hd = os.path.join(d, hashdir)
        if not os.path.isdir(hd):
            continue
        for f in os.listdir(hd):
            if f.endswith(".aar"):
                return os.path.join(hd, f)
    raise FileNotFoundError(f"{group}:{artifact}:{version} 目錄裡沒有 .aar 檔：{d}")


def main() -> None:
    extracted = {}
    for m in RES_MODULES:
        g, a, v = m.split(":")
        aar_path = find_aar(g, a, v)
        with zipfile.ZipFile(aar_path) as z:
            if "classes.jar" not in z.namelist():
                print(f"WARNING: {m} 沒有 classes.jar，略過")
                continue
            extracted[m] = z.read("classes.jar")
        print(f"OK  {m}  <- {aar_path}")

    seen = {}
    dupes = 0
    os.makedirs(os.path.dirname(OUT_PATH), exist_ok=True)
    with zipfile.ZipFile(OUT_PATH, "w", zipfile.ZIP_DEFLATED) as outz:
        for m in RES_MODULES:
            if m not in extracted:
                continue
            import io
            with zipfile.ZipFile(io.BytesIO(extracted[m])) as inz:
                for info in inz.infolist():
                    if info.is_dir():
                        continue
                    if info.filename in seen:
                        dupes += 1
                        continue  # 保留第一次出現的版本（清單裡較新/較上層的優先）
                    seen[info.filename] = m
                    outz.writestr(info, inz.read(info.filename))

    print(f"\n合併完成：{OUT_PATH}")
    print(f"總 entry 數：{len(seen)}，跳過的重複 entry 數：{dupes}")


if __name__ == "__main__":
    main()
