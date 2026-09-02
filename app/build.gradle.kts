plugins {
    id("com.android.application")
}

android {
    compileSdkVersion(30)

    defaultConfig {
        applicationId = "com.sonymobile.scan3d"
        minSdkVersion(26)
        targetSdkVersion(30)
        versionCode = 6291492
        versionName = "3.0.A.0.36"
        multiDexEnabled = true

        // 原始 apk 是用 productFlavor 建置的，BuildConfig.FLAVOR 因此被
        // Scan3DApp/PrivacyPolicies 拿來判斷是否為 "labs" 版本（見
        // com/sonymobile/scan3d/Scan3DApp.java、storageservice/authentication/
        // PrivacyPolicies.java）。本專案沒有真的建立 flavor 維度，改用
        // buildConfigField 補回相同常數值，讓 BuildConfig 交由 AGP 正常自動產生
        // （原本手刻進來的 app/src/main/java/.../BuildConfig.java 會跟 AGP 產生的
        // BuildConfig.java 撞名，已移除）。3.0.A.0.36 的 productFlavor 名稱從
        // "scan3dpreloaded" 改成 "scan3d"（見 BuildConfig.smali 差異）。
        buildConfigField("String", "FLAVOR", "\"scan3d\"")
        buildConfigField("String", "EXPANSION_PROVIDER_AUTHORITY", "\"com.sonymobile.scan3d.expansionprovider\"")
        buildConfigField("String", "STORAGE_PROVIDER_AUTHORITY", "\"com.sonymobile.scan3d.storageprovider\"")
    }

    buildTypes {
        getByName("release") {
            isMinifyEnabled = false
            isShrinkResources = false
            proguardFiles(
                getDefaultProguardFile("proguard-android.txt"),
                "proguard-rules.pro"
            )
            isDebuggable = false
        }

        getByName("debug") {
            isMinifyEnabled = false
            isDebuggable = true
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }

    buildFeatures {
        dataBinding = true
    }

    lintOptions {
        isAbortOnError = false
        isCheckReleaseBuilds = false
    }

    aaptOptions {
        noCompress("apk", "so", "arsc", "dex", "m4a", "png")
    }

    sourceSets {
        getByName("main") {
            // vendor-stubs/src：org.apache.http.legacy、com.android.vending.expansion.
            // zipfile/downloader、com.google.android.vending.licensing 這幾個套件在
            // Maven 上沒有對應構件（LVL/Downloader/zipfile 從來沒發布到 Maven，一律是
            // 各 app 自己 vendor 原始碼；xmltojsonlib 同理），從 jadx 反編譯結果修好、
            // 存放於此。這些是原始 apk 真的會用到的第三方原始碼（GalleryActivity 的
            // expansion 檔下載、PropResources 的 zip 資源讀取等），要跟著一起編譯進
            // classes.dex，不只是掛在編譯期 classpath 而已。
            java.srcDirs("src/main/java", "../vendor-stubs/src")
            jniLibs.srcDirs("src/main/jniLibs")
        }
    }

    packagingOptions {
        exclude("META-INF/DEPENDENCIES")
        exclude("META-INF/LICENSE")
        exclude("META-INF/LICENSE.txt")
        exclude("META-INF/NOTICE")
        exclude("META-INF/NOTICE.txt")
        doNotStrip("**/*.so")
    }
}

// 注意：不能像 CameraPanorama/SemcCameraUI-xxhdpi 那樣用 prebuilts/jdk/jdk8 執行 javac ——
// 那個 AOSP 附帶的舊版 JDK8（1.8.0_152-android）跟本專案用到的 DataBinding annotation
// processor（androidx.databinding:databinding-compiler:7.4.2，是給新版 javac 用的）不相容，
// annotation processing 階段會悄悄失敗、完全不輸出任何 .class 檔，但 Gradle 任務卻回報成功
// （FROM-CACHE/UP-TO-DATE 也會把這個空結果快取住）。改用 JDK 11 執行 javac 本體，
// compileOptions 的 sourceCompatibility/targetCompatibility 仍固定 1.8，位元組碼版本不變。
tasks.withType(JavaCompile::class.java) {
    options.isFork = true
    options.forkOptions.javaHome =
        file("/home/h/lineageos/prebuilts/jdk/jdk11/linux-x86")
}

// 依賴套件版本：從 App_smali/app-scan3d 的 smali-3.0.A.0.22-a9 分支裡
// unknown/META-INF/*.version、unknown/*.properties、unknown/fabric/*.properties
// 查到的真實版本號；查不到明確版本字串的（Fresco/SoLoader）用當時（2019 前後）
// 常見版本先試，之後編譯出錯再逐一校正。
// 注意：org.apache.http.legacy、com.android.vending.expansion.zipfile/downloader、
// com.google.android.vending.licensing 這幾個套件在 Maven 上沒有對應構件
// （Android Q 已移除內建 org.apache.http.legacy；LVL/Downloader 從來沒發布到
// Maven，一律是各 app 自己 vendor 原始碼），改成從 jadx 反編譯結果修好、
// 存放於 vendor-stubs/src/ 底下，編譯時另外併入 classpath，不算在
// PORTING_STATUS 的手刻進度內（純粹是編譯期需要的第三方原始碼引用）。
// androidx / play-services / firebase / fresco 依賴：原本這一整批「有帶 Android
// 資源的 AAR」（18 個）都被改成只取 classes.jar、丟進
// app/libs/resource-bearing-classes.jar（比照 camera/apps/CameraPanorama
// commit 45c2de8 的做法），理由是怕 app/src/main/res（從原始 APK 反編譯出來，已經
// 含這些函式庫貢獻的資源版本）跟 AAR 自帶的 res/ 重複造成 aapt2 衝突/重新編號。
//
// 但這個做法對 RecyclerView/play-services-basement 完全踩雷：RecyclerView 建構子
// 會用 obtainStyledAttributes() 讀自己 AAR 帶的 R$styleable，play-services-basement
// 的 StringResourceValueReader 要讀自己的 R$string——這些 R 類別只有在正常解析 AAR
// 資源時才會由 AGP 產生，classes-only 完全不解析資源，執行期一律
// ClassNotFoundException（實機 logcat 撞到才發現）。
//
// 逐一實測 18 個模組改回正常 AAR 座標的結果（`./gradlew :app:assembleRelease`）：
// 下面 6 個真的跟 app/src/main/res 撞資源名（mergeReleaseResources 報
// Duplicate value for resource 'attr/xxx'），維持 classes-only、留在
// tools_diff/merge_resource_bearing_classes.py 的 RES_MODULES 裡：
//   appcompat:1.1.0, appcompat-resources:1.1.0, coordinatorlayout:1.0.0,
//   com.android.support:support-compat:26.1.0, play-services-base:16.0.1,
//   material:1.0.0-rc01
// 其餘（recyclerview、androidx.core、com.facebook.fresco:drawee、browser、
// cardview、constraintlayout、media、preference、transition、play-services-auth、
// play-services-basement、firebase-messaging）改回正常 implementation() 座標，
// 見下面。
//
// drawee（SimpleDraweeView）也是同一種問題：建構子要讀自己的
// com.facebook.drawee.R$styleable，classes-only 不解析資源永遠不會產生這個 class。
// 它的 29 個屬性（placeholderImage/roundAsCircle 等）幾乎全部（29 個裡 29 個）
// 跟 app/src/main/res 撞名，已經把 attrs.xml/public.xml 裡這些重複宣告拿掉，讓
// drawee 的 AAR 資源當唯一來源。
//
// androidx.core 本來也在 classes-only 清單裡（跟 app/src/main/res 撞
// fontProviderFetchStrategy/fontStyle/fontProviderFetchTimeout 等整組
// font-provider attr），但 SwipeRefreshLayout 建構子要讀自己的
// androidx.core.R$id——跟 RecyclerView/play-services-basement 同一種問題，
// classes-only 不解析資源，R$id 永遠不會被產生。改成直接把
// app/src/main/res/values/attrs.xml、public.xml 裡這兩個重複宣告拿掉（標準
// font-provider attr，任何版本定義都一樣，不影響行為），讓 core 的 AAR 資源正常
// 解析、當唯一來源。
//
// support-compat 不能跟著一起變正常 AAR：它是被 support-v4（本專案舊命名空間程式碼
// 真正依賴的入口）遞移拉入的，跟 core 只在 10 個 AIDL 產生的樁類別
// （INotificationSideChannel/ResultReceiver）逐位元組重複，其餘 ~470 個 class
// （包括 Pools$SynchronizedPool 這種基礎工具類別）是 core 完全沒有、真的需要的——
// 一開始誤判成「跟 core 內容重複可以整個排除」，導致 Pools$SynchronizedPool 這類
// class 也一起消失，執行期 ClassNotFoundException。改成 support-compat 維持
// classes-only，靠 merge_resource_bearing_classes.py 的 SKIP_ENTRIES 手動拿掉
// 那 10 個重疊 class（core 現在是正常 AAR，當這 10 個類別的唯一來源）。
//
// com.android.support:support-media-compat 不宣告：androidx.media:1.0.0 內含
// 幾乎一模一樣的 android.support.v4.media.* 舊命名空間 class（235 個裡 160 個逐位元組
// 重複，AndroidX 遷移過渡期的產物，尚未完全改名），一起宣告會被
// checkReleaseDuplicateClasses 判定 duplicate class 而建置失敗；這個舊版模組原本就
// 只是被 support-v4 遞移拉入，不是本專案程式碼直接需要的座標，靠下面
// configurations.all 的 exclude() 擋掉，讓 androidx.media 頂替。
//
// androidx.databinding:databinding-runtime/databinding-adapters 一樣是正常 AAR
// 座標宣告，靠下面 configurations.all 的 resolutionStrategy.force 釘住 3.3.2
// （原始 apk 使用的版本），避免 buildFeatures.dataBinding=true 觸發 AGP 自動注入
// 更高版本、連帶要求 compileSdk 31+ 的 lifecycle-runtime:2.4.0（:app:checkDebugAarMetadata
// 會失敗，因為本專案 compileSdk 固定 28）。
dependencies {
    implementation("androidx.multidex:multidex:2.0.1")

    implementation(files("libs/resource-bearing-classes.jar"))

    implementation("androidx.legacy:legacy-support-v4:1.0.0")
    implementation("com.google.android.gms:play-services-drive:16.0.0")
    implementation("com.google.firebase:firebase-common:17.0.0")
    implementation("org.apache.httpcomponents:httpmime:4.5.6")

    // 3.0.A.0.36 把 DriveActions 從已棄用的 Drive Android API
    // （DriveResourceClient/DriveClient，上面的 play-services-drive）改成
    // Google Drive REST API v3 官方用戶端（com.google.api.services.drive.Drive，
    // 見 DriveActions.java/DriveActionsUtil.java）。TODO：以下座標版本是依 smali
    // 裡出現的 package（com.google.api.client.json.gson.GsonFactory、
    // com.google.api.client.extensions.android.http.AndroidHttp、
    // com.google.api.client.googleapis.extensions.android.gms.auth.
    // GoogleAccountCredential）反推的合理版本，還沒有實際跑過 gradle 依賴解析/
    // 編譯驗證，下個 session 要跑一次確認版本正確、沒有跟既有 exclude/force
    // 規則衝突。
    implementation("com.google.api-client:google-api-client-android:1.32.1")
    implementation("com.google.apis:google-api-services-drive:v3-rev20220815-2.0.0")
    implementation("com.google.http-client:google-http-client-gson:1.41.8")
    implementation("com.google.http-client:google-http-client-android:1.41.8")

    implementation("com.amazonaws:aws-android-sdk-core:2.6.5")
    implementation("com.amazonaws:aws-android-sdk-s3:2.6.5")
    implementation("com.amazonaws:aws-android-sdk-cognito:2.6.5")
    implementation("com.amazonaws:aws-android-sdk-kms:2.6.5")
    implementation("com.amazonaws:aws-android-sdk-sqs:2.6.5")

    implementation("androidx.fragment:fragment:1.1.0")
    implementation("androidx.lifecycle:lifecycle-runtime:2.1.0")
    implementation("androidx.lifecycle:lifecycle-extensions:2.1.0")
    implementation("androidx.drawerlayout:drawerlayout:1.0.0")
    implementation("androidx.viewpager:viewpager:1.0.0")
    implementation("androidx.swiperefreshlayout:swiperefreshlayout:1.0.0")
    implementation("androidx.print:print:1.0.0")
    implementation("androidx.loader:loader:1.0.0")
    implementation("androidx.documentfile:documentfile:1.0.0")
    implementation("androidx.versionedparcelable:versionedparcelable:1.1.0")
    implementation("androidx.vectordrawable:vectordrawable-animated:1.0.0")
    implementation("androidx.palette:palette:1.0.0")
    implementation("androidx.annotation:annotation:1.1.0")
    implementation("androidx.databinding:databinding-runtime:3.3.2")
    implementation("androidx.databinding:databinding-adapters:3.3.2")

    // 原本被丟進 resource-bearing-classes.jar 的模組，改回正常 AAR 座標宣告
    // （見上面 dependencies { } 開頭的說明；appcompat/appcompat-resources/
    // coordinatorlayout/support-compat/play-services-base/material 因為跟
    // app/src/main/res 撞資源名，維持在 resource-bearing-classes.jar 裡不動）。
    implementation("androidx.recyclerview:recyclerview:1.0.0")
    implementation("androidx.core:core:1.1.0")
    implementation("com.facebook.fresco:drawee:1.10.0")
    implementation("androidx.browser:browser:1.0.0")
    implementation("androidx.cardview:cardview:1.0.0")
    implementation("androidx.constraintlayout:constraintlayout:1.1.3")
    implementation("androidx.media:media:1.0.0")
    implementation("androidx.preference:preference:1.1.0")
    implementation("androidx.transition:transition:1.1.0")
    implementation("com.google.android.gms:play-services-auth:16.0.1")
    implementation("com.google.android.gms:play-services-basement:16.2.0")
    implementation("com.google.firebase:firebase-messaging:17.3.4")

    // 這批模組本身還遞移依賴以下純邏輯函式庫（0 資源，`./gradlew
    // :app:dependencies --configuration debugRuntimeClasspath` 驗證過皆為 NORES）；
    // 現在父模組已改回正常 AAR，理論上 Gradle 會自動解析到，這幾行顯式宣告留著
    // 純粹是釘住版本、避免依賴解析選到其他版本。
    implementation("androidx.constraintlayout:constraintlayout-solver:1.1.3")
    implementation("com.android.support:support-v4:26.1.0")
    implementation("com.android.support:support-fragment:26.1.0")
    implementation("com.android.support:support-core-ui:26.1.0")
    implementation("com.android.support:support-core-utils:26.1.0")
    implementation("com.android.support:support-annotations:26.1.0")
    implementation("android.arch.lifecycle:runtime:1.0.0")
    implementation("android.arch.lifecycle:common:1.0.0")
    implementation("android.arch.core:common:1.0.0")
    implementation("com.google.android.gms:play-services-auth-api-phone:16.0.0")
    implementation("com.google.android.gms:play-services-auth-base:16.0.0")
    implementation("com.google.android.gms:play-services-stats:16.0.1")
    implementation("com.google.firebase:firebase-iid:17.0.4")
    implementation("com.google.firebase:firebase-iid-interop:16.0.1")
    implementation("com.google.firebase:firebase-measurement-connector:17.0.1")

    implementation("com.facebook.fresco:fresco:1.10.0")
    implementation("com.facebook.fresco:animated-gif:1.10.0")
    implementation("com.facebook.soloader:soloader:0.8.2")
    implementation("com.google.code.gson:gson:2.8.5")
    implementation("com.google.code.findbugs:jsr305:3.0.2")
    implementation("com.googlecode.plist:dd-plist:1.28")
    implementation("commons-io:commons-io:2.6")
}

configurations.all {
    resolutionStrategy {
        force(
            "androidx.databinding:databinding-runtime:3.3.2",
            "androidx.databinding:databinding-common:3.3.2",
            "androidx.databinding:databinding-adapters:3.3.2",
            "androidx.lifecycle:lifecycle-runtime:2.1.0",
            "androidx.recyclerview:recyclerview:1.0.0",
            "androidx.core:core:1.1.0",
            "com.facebook.fresco:drawee:1.10.0",
            "androidx.browser:browser:1.0.0",
            "androidx.cardview:cardview:1.0.0",
            "androidx.constraintlayout:constraintlayout:1.1.3",
            "androidx.media:media:1.0.0",
            "androidx.preference:preference:1.1.0",
            "androidx.transition:transition:1.1.0",
            "com.google.android.gms:play-services-auth:16.0.1",
            "com.google.android.gms:play-services-basement:16.2.0",
            "com.google.firebase:firebase-messaging:17.3.4"
        )
    }

    // androidx.media 已內含同一套 android.support.v4.media.* class；這個舊版模組
    // 只會被 support-v4/play-services-basement 遞移拉入，擋掉避免
    // checkReleaseDuplicateClasses 判定 duplicate class。
    exclude(group = "com.android.support", module = "support-media-compat")

    // resource-bearing-classes.jar 已經內含這 6 個模組的位元碼；若繼續讓 Gradle
    // 解析真正的 AAR 座標，會跟上面合併進來的 classes 重複，並讓
    // mergeReleaseResources 因為這些 AAR 自帶的 res/ 撞名再次失敗。
    exclude(group = "androidx.appcompat", module = "appcompat")
    exclude(group = "androidx.appcompat", module = "appcompat-resources")
    exclude(group = "com.android.support", module = "support-compat")
    exclude(group = "androidx.coordinatorlayout", module = "coordinatorlayout")
    exclude(group = "com.google.android.gms", module = "play-services-base")
    exclude(group = "com.google.android.material", module = "material")
}
