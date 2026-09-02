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
#
# 2026-09-02：原本這裡列了 18 個模組，一律 classes-only。逐一實測（見
# app/build.gradle.kts dependencies{} 開頭的說明）發現這個假設過寬——大多數模組
# 改回正常 AAR 座標都編得過，只有下面這 7 個真的會跟 app/src/main/res（從原始 APK
# 反編譯出來，已經內含這些函式庫貢獻的資源）撞名（`./gradlew :app:assembleRelease`
# 的 mergeReleaseResources 報 Duplicate value for resource 'attr/xxx'）：
RES_MODULES = [
    "androidx.appcompat:appcompat:1.1.0",
    "androidx.appcompat:appcompat-resources:1.1.0",
    "androidx.coordinatorlayout:coordinatorlayout:1.0.0",
    "com.android.support:support-compat:26.1.0",
    "com.google.android.gms:play-services-base:16.0.1",
    "com.google.android.material:material:1.0.0-rc01",
]
# com.facebook.fresco:drawee:1.10.0 也移出這份清單、改回正常 AAR 座標：
# SimpleDraweeView 建構子要讀自己的 com.facebook.drawee.R$styleable，跟
# recyclerview/play-services-basement/core 同一種問題。drawee 的 29 個屬性
# （placeholderImage/roundAsCircle 等）幾乎全部跟 app/src/main/res 撞名（drawee
# 總共只有 29 個屬性，撞了全部 29 個），已經把 app/src/main/res/values/attrs.xml、
# public.xml 裡這些重複宣告拿掉，讓 drawee 的 AAR 資源當唯一來源。
#
# androidx.core:core:1.1.0 移出這份清單、改回正常 AAR 座標（見 build.gradle.kts）：
# SwipeRefreshLayout 建構子會讀自己的 androidx.core.R$id，這個 class 只有正常解析
# AAR 資源時才會由 AGP 產生，跟 recyclerview/play-services-basement 同一種問題。
# core 原本因為跟 app/src/main/res 撞 2 個 attr（fontProviderFetchStrategy/
# fontStyle）被迫 classes-only；改成直接把 app/src/main/res/values/attrs.xml、
# public.xml 裡這兩個重複宣告拿掉，讓 core 的 AAR 資源當唯一來源——這兩個是標準
# font-provider attr，任何版本的定義都一樣，拿掉重複宣告不影響行為。
#
# support-compat 跟 core 只在 10 個 AIDL 產生的樁類別（INotificationSideChannel/
# ResultReceiver）逐位元組重複，其餘 ~480 個 class（包括 Pools$SynchronizedPool
# 這種基礎工具類別）是 core 完全沒有、本專案舊命名空間程式碼真的需要的——一開始
# 誤判成兩邊「內容重複」把 support-compat 整個排除掉，導致 Pools$SynchronizedPool
# 這類真正需要的 class 也一起消失，執行期 ClassNotFoundException。support-compat
# 放進 classes-only 合併；但 core 現在是正常 AAR（見上面），不在這份清單裡，
# 上面迴圈的「先出現的優先」自動去重機制幫不上忙，所以下面 SKIP_ENTRIES 手動把
# support-compat 這 10 個重疊 class 從合併進 jar 的內容裡拿掉，讓 core 的 AAR
# 當這 10 個類別的唯一來源。
# 其餘原本在清單裡的模組（recyclerview、browser、cardview、constraintlayout、media、
# preference、transition、play-services-auth、play-services-basement、
# firebase-messaging）改回 app/build.gradle.kts 的正常 implementation() 宣告，
# 建置驗證沒有資源衝突。其中 recyclerview 和 play-services-basement 本來就不能是
# classes-only——它們自己的程式碼在執行期會讀自己 AAR 的 R$styleable/R$string，
# classes-only 只拿 classes.jar 不解析資源，這個 R 類別永遠不會被產生，一律
# ClassNotFoundException（見 app/build.gradle.kts 同一段說明）。
#
# androidx.databinding:databinding-runtime/databinding-adapters:3.3.2 也是正常 AAR
# 宣告（res/ 底下只有 <id> 型別資源，跟 app/src/main/res/values/ids.xml 同名不衝突，
# 靠 build.gradle.kts 的 resolutionStrategy.force 釘住版本）。

# 見上面 support-compat 那段說明：這 10 個 class 跟正常 AAR 的 androidx.core:core
# 逐位元組重複，合併時要跳過，讓 core 當唯一來源。
SKIP_ENTRIES: dict[str, set[str]] = {
    "com.android.support:support-compat:26.1.0": {
        "android/support/v4/app/INotificationSideChannel$Stub$Proxy.class",
        "android/support/v4/app/INotificationSideChannel$Stub.class",
        "android/support/v4/app/INotificationSideChannel.class",
        "android/support/v4/os/IResultReceiver$Stub$Proxy.class",
        "android/support/v4/os/IResultReceiver$Stub.class",
        "android/support/v4/os/IResultReceiver.class",
        "android/support/v4/os/ResultReceiver$1.class",
        "android/support/v4/os/ResultReceiver$MyResultReceiver.class",
        "android/support/v4/os/ResultReceiver$MyRunnable.class",
        "android/support/v4/os/ResultReceiver.class",
    },
}

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
            skip = SKIP_ENTRIES.get(m, set())
            with zipfile.ZipFile(io.BytesIO(extracted[m])) as inz:
                for info in inz.infolist():
                    if info.is_dir():
                        continue
                    if info.filename in skip:
                        continue  # 跟正常 AAR 依賴撞名，讓那邊當唯一來源（見 SKIP_ENTRIES 說明）
                    if info.filename in seen:
                        dupes += 1
                        continue  # 保留第一次出現的版本（清單裡較新/較上層的優先）
                    seen[info.filename] = m
                    outz.writestr(info, inz.read(info.filename))

    print(f"\n合併完成：{OUT_PATH}")
    print(f"總 entry 數：{len(seen)}，跳過的重複 entry 數：{dupes}")


if __name__ == "__main__":
    main()
