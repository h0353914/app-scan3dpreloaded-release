plugins {
    id("com.android.application")
}

android {
    compileSdkVersion(28)

    defaultConfig {
        applicationId = "com.sonymobile.scan3d"
        minSdkVersion(26)
        targetSdkVersion(28)
        versionCode = 6291478
        versionName = "3.0.A.0.22"
        multiDexEnabled = true

        // 原始 apk 是用 productFlavor "scan3dpreloaded" 建置的，BuildConfig.FLAVOR
        // 因此被 Scan3DApp/PrivacyPolicies 拿來判斷是否為 "labs" 版本（見
        // com/sonymobile/scan3d/Scan3DApp.java、storageservice/authentication/
        // PrivacyPolicies.java）。本專案沒有真的建立 flavor 維度，改用
        // buildConfigField 補回相同常數值，讓 BuildConfig 交由 AGP 正常自動產生
        // （原本手刻進來的 app/src/main/java/.../BuildConfig.java 會跟 AGP 產生的
        // BuildConfig.java 撞名，已移除）。
        buildConfigField("String", "FLAVOR", "\"scan3dpreloaded\"")
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

// 使用 JDK 8 編譯 Java（匹配原始 APK 的位元組碼版本，比照 CameraPanorama/SemcCameraUI-xxhdpi 慣例）
tasks.withType(JavaCompile::class.java) {
    options.isFork = true
    options.forkOptions.javaHome =
        file("/home/h/lineageos/prebuilts/jdk/jdk8/linux-x86")
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
// androidx / play-services / firebase / fresco 依賴：有帶 Android 資源（res/、
// AndroidManifest.xml）的 AAR 只取類別位元碼、不取資源（比照 camera/apps/
// CameraPanorama commit 45c2de8「fix: app閃退 - 修正 Support Library 依賴方式使其
// 符合原版行為」的做法）。原本用 implementation(AAR 座標) 會把這些 AAR 自帶、但原始
// APK 建置時因未使用而被裁掉的資源一併合併進來，導致 aapt2 對沒有被
// res/values/public.xml 釘住 id 的資源重新編號，使 app/src/main/res 內沿用原始
// resources.arsc 十六進位常數的程式碼對應到錯誤的資源，執行期 NPE 閃退；也會直接
// 造成 mergeDebugResources 因 attr/style/drawable 同名不同值而建置失敗
// （Duplicate value for resource 'attr/xxx'）。
//
// app/libs/resource-bearing-classes.jar 由 tools_diff/merge_resource_bearing_classes.py
// 從下列 AAR 的 classes.jar 合併而成（判斷依據見 tools_diff/check_aar_resources.py）：
//   appcompat:1.1.0, appcompat-resources:1.1.0, browser:1.0.0, cardview:1.0.0,
//   constraintlayout:1.1.3, coordinatorlayout:1.0.0, core:1.1.0, media:1.0.0,
//   preference:1.1.0, recyclerview:1.0.0, transition:1.1.0,
//   com.android.support:support-compat:26.1.0（play-services-basement 遞移拉入的舊版
//   support library）, com.android.support:support-media-compat:26.1.0,
//   com.facebook.fresco:drawee:1.13.0, play-services-auth:16.0.1,
//   play-services-base:16.0.1, play-services-basement:16.2.0,
//   material:1.0.0-rc01, firebase-messaging:17.3.4
//
// androidx.databinding:databinding-runtime/databinding-adapters 例外：雖然也是 AAR，
// 但解開後 res/ 只有 <id> 型別資源（與 app/src/main/res/values/ids.xml 同名），
// id 資源允許多處重複宣告不會被 aapt2 判定衝突，因此維持正常 AAR 座標宣告即可，
// 不需要 classes-only 處理；靠下面 configurations.all 的 resolutionStrategy.force
// 釘住 3.3.2（原始 apk 使用的版本），避免 buildFeatures.dataBinding=true 觸發 AGP
// 自動注入更高版本、連帶要求 compileSdk 31+ 的 lifecycle-runtime:2.4.0
// （:app:checkDebugAarMetadata 會失敗，因為本專案 compileSdk 固定 28）。
dependencies {
    implementation("androidx.multidex:multidex:2.0.1")

    implementation(files("libs/resource-bearing-classes.jar"))

    implementation("androidx.legacy:legacy-support-v4:1.0.0")
    implementation("com.google.android.gms:play-services-drive:16.0.0")
    implementation("com.google.firebase:firebase-common:17.0.0")
    implementation("org.apache.httpcomponents:httpmime:4.5.6")

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

    // 上面 exclude 掉的 RES AAR（constraintlayout、support-compat、play-services-auth/
    // base、firebase-messaging）本身還遞移依賴以下純邏輯函式庫（0 資源，`./gradlew
    // :app:dependencies --configuration debugRuntimeClasspath` 驗證過皆為 NORES）。
    // exclude 之後 Gradle 不會再解析被排除模組的 POM，這些子依賴也就不會被自動帶入，
    // 但 resource-bearing-classes.jar 裡的位元碼在執行期仍會用到它們，所以要顯式補回。
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

    implementation("com.facebook.fresco:fresco:1.13.0")
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
            "androidx.lifecycle:lifecycle-runtime:2.1.0"
        )
    }

    // resource-bearing-classes.jar 已經內含這些模組的位元碼；若繼續讓 Gradle
    // 解析真正的 AAR 座標（不論是直接宣告還是被 play-services-drive/fresco/
    // legacy-support-v4 等遞移拉入），會跟上面合併進來的 classes 重複，並讓
    // mergeDebugResources 再次因為這些 AAR 自帶的 res/ 失敗。
    exclude(group = "androidx.appcompat", module = "appcompat")
    exclude(group = "androidx.appcompat", module = "appcompat-resources")
    exclude(group = "androidx.browser", module = "browser")
    exclude(group = "androidx.cardview", module = "cardview")
    exclude(group = "androidx.constraintlayout", module = "constraintlayout")
    exclude(group = "androidx.coordinatorlayout", module = "coordinatorlayout")
    exclude(group = "androidx.core", module = "core")
    exclude(group = "androidx.media", module = "media")
    exclude(group = "androidx.preference", module = "preference")
    exclude(group = "androidx.recyclerview", module = "recyclerview")
    exclude(group = "androidx.transition", module = "transition")
    exclude(group = "com.android.support", module = "support-compat")
    exclude(group = "com.android.support", module = "support-media-compat")
    exclude(group = "com.facebook.fresco", module = "drawee")
    exclude(group = "com.google.android.gms", module = "play-services-auth")
    exclude(group = "com.google.android.gms", module = "play-services-base")
    exclude(group = "com.google.android.gms", module = "play-services-basement")
    exclude(group = "com.google.android.material", module = "material")
    exclude(group = "com.google.firebase", module = "firebase-messaging")
}
