# 3.0.A.0.22 -> 3.0.A.0.36 升版追蹤

這個分支（`java-3.0.A.0.36-a9`）是從已經 715/715 完成、逐一對照 smali
驗證過的 `java-3.0.A.0.22-a9` 開出來的，**不是從零手刻**。做法是拿新版
（3.0.A.0.36，`smali-3.0.A.0.36-a9` 分支，另有常駐 worktree
`../app-scan3d-smali-0.36-ref`）跟舊版（3.0.A.0.22，`smali-3.0.A.0.22-a9`
分支，worktree `../app-scan3d-smali-ref`）的 smali 逐 class 比對，**只需要
处理真的有差異的地方**，其餘直接沿用既有已驗證的手刻 Java。

## 版本差異

- 3.0.A.0.22：versionCode 6291478，compileSdk/targetSdk 28（platformBuildVersion 9）
- 3.0.A.0.36：versionCode 6291492，compileSdk/targetSdk 30（platformBuildVersion 11）—— apk 是從 apkmirror.com 下載的
- `com.sonymobile.scan3d` 自己套件的 smali 檔案數：舊版 994、新版 984

## 檔案層級比對結果（`tools_diff/upgrade_0.36_*.txt` 是產生這些清單的原始資料）

跑法：把兩版的 `com/sonymobile/scan3d/**/*.smali` 相對路徑各自列一份排序清單，
`comm` 找差集，兩邊都有的再逐位元組比對內容。這兩份原始路徑清單本身沒有
commit 進 java 分支（純粹是兩版全部 smali 檔名的大量列表，跟 java 專案內容
無關，148K），需要時用這個指令重新產生：

```bash
cd App_smali/app-scan3d
for d in smali smali_classes2; do
  find "app-scan3d-smali-ref/$d" -path "*com/sonymobile/scan3d*" -name "*.smali" | sed "s#app-scan3d-smali-ref/$d/##"
done | sort > /tmp/old_list.txt
for d in smali smali_classes2; do
  find "app-scan3d-smali-0.36-ref/$d" -path "*com/sonymobile/scan3d*" -name "*.smali" | sed "s#app-scan3d-smali-0.36-ref/$d/##"
done | sort > /tmp/new_list.txt
comm -23 /tmp/old_list.txt /tmp/new_list.txt   # 只在舊版
comm -13 /tmp/old_list.txt /tmp/new_list.txt   # 只在新版
comm -12 /tmp/old_list.txt /tmp/new_list.txt   # 兩邊都有，再逐位元組比對內容
```

下面幾個結果清單（`upgrade_0.36_removed.txt`/`upgrade_0.36_added.txt`/
`upgrade_0.36_changed_files.txt`/`upgrade_0.36_classified.txt`）是這次分析
實際產出的紀錄，檔案不大，有留在 `tools_diff/` 裡。

- **14 個舊版有、新版沒有**（`upgrade_0.36_removed.txt`）：其中 10 個是
  `-$$Lambda$DriveActions$...` 編譯器合成的 lambda 類別（純粹是 DriveActions
  裡的 lambda 內容變了導致 hash 尾碼不同，不用特別處理，等下面 DriveActions
  本體的差異修好、重新編譯後這些合成類會自動消失/自動用新的名字重新產生）。
  **真正消失的 4 個類別**：`DriveActions$DriveSync`、`DriveActions$GetAppFolder`、
  `DriveActions$KeyCheckExecution$CompletionReceiver`、
  `storageservice/authentication/EncryptionDriveEventService` —— 這幾個真的類別
  在新版被移除了（可能跟 Google Drive App Folder API 在這幾年被 Google 收緊/棄用
  有關），對應的手刻 `.java` 檔案要處理掉（整個類別是不是真的沒用了、還是被別的
  東西取代，要對照新版 smali 確認，不能直接刪）。

- **4 個新版有、舊版沒有**（`upgrade_0.36_added.txt`）：先看內容是不是也是
  `-$$Lambda$...` 合成類（同上，DriveActions 相關的話不用理它），如果是真正的
  新類別才需要照 `AGENTS.md` 第 6 節的規則手刻。

- **208 個兩版都有、但內容不同**（`upgrade_0.36_changed_files.txt`）：**這是主要
  工作量所在**。逐一比對，注意有兩種可能：
  1. **純編譯器/工具鏈差異**：compileSdk 28→30 這兩年間 Sony 自己的建置環境
     很可能也換過 d8/aapt2 版本，會造成暫存器編號、annotation 保留方式、
     陣列初始化指令選擇等跟這個專案已經很熟悉的「良性差異」模式一樣的雜訊
     （參考 `tools_diff/smali_diff.py` 檔頭列的已知模式）。這種差異**不需要
     修改 Java 原始碼**。
  2. **真正的邏輯/功能差異**：新版本真的改了某段邏輯（bug 修正、新增功能、
     UI 微調等），這種才需要對照新版 smali 修改對應的 `.java` 檔案。
  
  分辨方法：比照這個專案已經很成熟的做法——正規化掉暫存器編號/label 編號/
  `.line`/`.locals` 這些雜訊後再比對，如果正規化後還有實質差異（新增/刪除
  的指令、不同的方法呼叫、不同的常數值、不同的控制流程），才是真的要處理的。

## 分析工具（已存進 `tools_diff/`，下個 session 可直接重跑）

- `tools_diff/compare_versions.py <相對路徑>`：正規化後比對舊版/新版 smali
  單一檔案，印出 IDENTICAL / DIFF + unified 差異區塊。正規化邏輯抄自
  `smali_diff.py` 的 `normalize()`（去掉 `.line`/`.locals`/`.registers`、
  暫存器編號、label 編號）。
- `tools_diff/classify.py <相對路徑>`：在 `compare_versions.py` 的正規化基礎上
  再進一步分類：
  - `IDENTICAL`：正規化後完全相同。
  - `RESID_ONLY`：差異全部只是 `0x..` 資源 ID 常數值不同（含被
    difflib 拆成 insert+delete、但整體 multiset 相同的「同一段落被搬到
    檔案別處」情形，例如方法宣告順序調換）。因為 Java 端都是用
    `R.xxx.yyy` 具名引用資源，這種差異不需要動 Java 原始碼。
  - `NEEDS_REVIEW`：其餘，要人工看的真正差異。
  - 用法：`for f in $(cat tools_diff/upgrade_0.36_changed_files.txt); do
    echo "$(python3 tools_diff/classify.py "$f" | head -1)  $f"; done`
- `tools_diff/upgrade_0.36_classified.txt`：對 208 個檔案跑過一輪 classify.py
  的完整結果快照（2026-08-20 產生）。結果：**17 個 IDENTICAL、167 個
  RESID_ONLY、24 個 NEEDS_REVIEW**。IDENTICAL + RESID_ONLY 共 184 個檔案
  已確認不需要修改 Java 原始碼，可視為審查完畢。

## 進度追蹤（2026-08-20 session）

### 184 個 IDENTICAL / RESID_ONLY 檔案：審查完畢，確認不需要修改

正規化後完全相同、或差異只是資源 ID 重新編號（見上面工具說明）。名單見
`tools_diff/upgrade_0.36_classified.txt` 裡 `IDENTICAL`/`RESID_ONLY` 開頭的
187 行（17+167=184；`RESID_ONLY`共167筆，注意其中 `PrivacyPolicies.smali`、
`SettingsFragment.smali` 原本被 classify.py 分到 NEEDS_REVIEW，人工確認為
「BuildConfig.FLAVOR/VERSION_NAME 常數字面值 inline 導致差異」後歸入已解決，
詳見下面「已解決」清單，不在這 184 筆之內，這 184 筆是 classify.py 自動判定
的部分）。

### 24 個 NEEDS_REVIEW：真正差異，逐一列出處理狀況

**已解決（19 個，Java 原始碼已修改或確認不需要修改）：**

1. `BuildConfig.smali` — 純建置中繼資料：`versionCode`/`versionName`/
   `FLAVOR`。已在 `app/build.gradle.kts` 更新為 `6291492`/`"3.0.A.0.36"`/
   `"scan3d"`（原本是 `"scan3dpreloaded"`）。BuildConfig 本身是 AGP 自動產生，
   沒有對應手刻 `.java` 檔案。
2. `R$id.smali` — 純資源 ID 增刪重編號，已對照確認：移除
   `action_improve`、`menu_galler_backup_sync` 兩個 id（見下面 ViewerFragment/
   GalleryFragment/ImprovementIndicator/ScanViewHolder 的處理）。R 類別本身
   由 AAPT2 自動產生，不需要手刻。
3. `R$string.smali` — 新增 `alert_dialog_text` 一個字串資源，比對整個新版
   smali/smali_classes2 沒有任何地方引用這個 id，是未使用的資源，不影響
   任何邏輯。
4. `Scan3DApp.smali` — `NativeLog.v("sculpt3d", "Version name is
   3.0.A.0.22")` 硬編碼版本字串已改成 `"3.0.A.0.36"`
   （`app/src/main/java/com/sonymobile/scan3d/Scan3DApp.java`）；另外兩處
   `"scan3dpreloaded"` 字面值是 `BuildConfig.FLAVOR.equals("labs")` 被
   javac inline 常數的結果，改完 (1) 的 buildConfigField 後自動解決，不用動
   Java。
5. `SphinxEngine.smali` — 同樣是硬編碼 log 字串，已改成 `"Sphinx version:
   3.0.A.0.36"`（`SphinxEngine.java`）。
6. `sfmc/FaceMimicActivity.smali` — `"scan3dpreloaded".equals("labs")`
   （原始 3.0.A.0.22 手刻時這裡就是硬編碼字面值，不是 `BuildConfig.FLAVOR`
   符號引用，猜測是原始 jadx 反編譯這個位置沒有還原出符號引用）已改成
   `"scan3d".equals("labs")`（`FaceMimicActivity.java` 第 886 行附近）。
7. `storageservice/authentication/AccountUtils.smali` — `isSignedIn()`
   整個方法本體被簡化成直接 `return false;`（新版 smali `.locals 0`，只有
   `const/4 p0, 0x0; return p0`）。已改 `AccountUtils.java`。這是這次升版
   最大的行為變化之一：Google Drive App Folder 相關的登入狀態判斷被整個
   停用（配合下面第 8-14 項的 Drive REST API 遷移、GalleryFragment 移除
   backup/sync 選單）。
8. `storageservice/authentication/AuthActivity.smali` — `GoogleSignInOptions
   .Builder().requestScopes(...)` 原本用
   `Drive.SCOPE_APPFOLDER`（`com.google.android.gms.drive.Drive` 這個類別
   常數），新版直接 `new Scope("https://www.googleapis.com/auth/
   drive.appdata")`。已改 `AuthActivity.java`，移除
   `import com.google.android.gms.drive.Drive;`。
9-12. `DriveActions.smali`／`DriveActions$GetKeyExecution.smali`／
   `DriveActions$KeyCheckExecution.smali`／`DriveActionsUtil.smali` —
   **整個 Google Drive 存取方式從已棄用的 Drive Android API
   （`DriveResourceClient`/`DriveClient`/`DriveFolder`，
   play-services-drive）換成 Google Drive REST API v3 官方用戶端
   （`com.google.api.services.drive.Drive`）**。已完全重寫
   `DriveActions.java`（拿掉 `DriveSync`/`GetAppFolder`/
   `KeyCheckExecution$CompletionReceiver` 三個內部類別，因為 REST API
   的 `execute()` 是同步呼叫，不再需要透過 `LocalBroadcastManager` 監聽
   非同步完成事件）、`DriveActionsUtil.java`（新增
   `getGoogleDrive(Context, GoogleSignInAccount)` 用
   `GoogleAccountCredential`/`AndroidHttp`/`GsonFactory` 組出 `Drive`
   物件）。呼叫端 `SigninActivity.java`（`handleGoogleSignInResult()`）跟著
   改成先呼叫 `DriveActionsUtil.getGoogleDrive(...)` 拿到 `Drive`
   物件再傳給 `DriveActions.handleDriveKey(...)`。
   **`app/build.gradle.kts` 已新增四個新依賴**（`com.google.api-client:
   google-api-client-android:1.32.1`、`com.google.apis:
   google-api-services-drive:v3-rev20220815-2.0.0`、
   `com.google.http-client:google-http-client-gson:1.41.8`、
   `com.google.http-client:google-http-client-android:1.41.8`）——
   **已於 2026-08-20 第二次 session 跑 `./gradlew :app:compileDebugJavaWithJavac`
   驗證通過**。原本猜的三個版本號本身沒問題，但缺一個依賴：
   `DriveActionsUtil.java` 用到的
   `com.google.api.client.extensions.android.http.AndroidHttp` 這個類別
   從 `com.google.api-client:google-api-client-android:1.32.1` 移除了
   （該 artifact 這個版本只剩 `GoogleAccountManager`/
   `GoogleAccountCredential` 等 gms/auth 相關類別，用
   `unzip -l` 核對過 jar 內容確認），實際定義在獨立的
   `com.google.http-client:google-http-client-android` artifact 裡，補上
   同版號 `1.41.8`（跟已有的 `google-http-client-gson:1.41.8` 對齊）後
   編譯通過，沒有其他版本衝突。
   對應的 `EncryptionDriveEventService`（原本接收 Drive 非同步完成事件的
   `Service`）已確認為完全不需要的死代碼，刪除
   `EncryptionDriveEventService.java`，並移除
   `AndroidManifest.xml` 裡的 `<service>` 宣告
   （新版 manifest 也確認沒有這個 service）。這就是「4 個真正移除的類別」
   裡的全部 4 個（`DriveSync`/`GetAppFolder`/`CompletionReceiver` 是
   `DriveActions.java` 重寫時自然消失，`EncryptionDriveEventService`
   單獨刪除整個檔案）。**4 個新增類別**（`-$$Lambda$DriveActions$
   GetKeyExecution$EnMnnSlCSLab...`、`-$$Lambda$DriveActions$
   KeyCheckExecution$bsqQQkLiZB6...`/`rf6d9vb0GXCVS6...`/
   `wd59rTZ1W_Je_9...`）確認都是 `DriveActions$GetKeyExecution`/
   `$KeyCheckExecution` 內部 lambda 的合成類別，重寫完 `DriveActions.java`
   後這些會在重新編譯時自動以新的 hash 產生，不用手刻。
13. `storageservice/authentication/PrivacyPolicies.smali` — 差異只有
   `"scan3dpreloaded"`→`"scan3d"`（跟第 4 項同樣是 `BuildConfig.FLAVOR`
   inline 常數，`PrivacyPolicies.java` 本來就是符號引用
   `BuildConfig.FLAVOR.equals("labs")`，改完 build.gradle.kts 自動解決）
   跟一堆資源 ID 重編號，逐位元組原始 diff 已核對過，沒有其他差異。
14. `storageservice/authentication/SigninActivity.smali` — 見第 9-12 項，
   `handleGoogleSignInResult()` 呼叫端已改。
15. `storageservice/content/WorkService.smali` — **另一個重大行為變化**：
   `newTask(JobParameters, boolean, AwsSession)` 原本用
   `jobParameters.getJobId()` 的 switch 分派出 11 種 `Task`
   （`InitImprovementTask`/`ExecuteImprovementTask`/
   `ReceiveImprovementTask`/`CleanUpTask`/`NotificationTask`/
   `DeleteAccountTask`/`ExtractDataTask`/`InitKeyTask`/
   `DeleteAllContentTask`/`RescheduleGDPRTask`/`TransferTask`），新版整個
   switch 被拿掉，只剩下呼叫一次 `jobParameters.getJobId()`（結果被捨棄，
   沒有 `move-result`）然後直接 `return null`。已改
   `WorkService.java`：`newTask()` 本體改成
   `jobParameters.getJobId(); return null;`，移除已經沒用到的
   `androidx.core.provider.FontsContractCompat` import（原本只是拿它的
   `FAIL_REASON_SECURITY_VIOLATION = -4` 常數湊 case label）。這代表新版
   整個背景工作排程（改善流程/清理/通知/刪帳號/搬移資料等）全部停用，
   猜測跟同一批 Drive/雲端後端服務關閉、`AccountUtils.isSignedIn()` 永遠
   `false` 是同一個決策底下的變化。各個 `XxxTask.java`
   本身沒有被刪除也沒有邏輯變化（`InitImprovementTask.smali` 有在 208 清單
   裡但正規化後判定只是良性重排，已在 RESID_ONLY 184 筆之列），只是不會再
   被 `WorkService` 建立、執行。
16. `storageservice/ui/component/ImprovementIndicator.smali` —
   `onBound(IFileSet, Improvement)` 原本會依 `isImprovement()`/
   `Improvement` 狀態顯示「一鍵優化」圖示或動畫，新版整個判斷邏輯被砍光，
   只剩下重置狀態＋固定 `setVisibility(GONE)`（永遠隱藏）。已改
   `ImprovementIndicator.java`，移除不再用到的
   `android.graphics.drawable.AnimationDrawable`/`com.sonymobile.scan3d.R`
   import。這是「移除 Improve 功能」這條主線的一部分，跟 `R$id` 裡
   `action_improve` 被刪除、`res/layout/component_sharing_bar.xml` 裡
   `<include android:id="@id/action_improve" .../>` 被整行刪除
   （兩版唯一內容不同的 layout 檔案，用 `diff -rq` 對照兩個 smali-ref
   worktree 的 `res/` 目錄找到的）互相呼應。
17. `storageservice/ui/fragment/SettingsFragment.smali` — 差異只有版本字串
   `"3.0.A.0.22"`→`"3.0.A.0.36"`（`findPreference(...).setSummary(
   BuildConfig.VERSION_NAME)`，符號引用，改完 build.gradle.kts 自動解決）
   跟資源 ID 重編號，逐位元組原始 diff 已核對過。
18. `storageservice/ui/gallery/GalleryFragment.smali` — 對照
   `res/menu/menu_gallery.xml`（兩版唯一內容不同的 menu 檔案）確認
   `menu_galler_backup_sync`（原文命名本身有 typo "galler"）這個選單項目
   被整個移除。`onOptionsItemSelected()` 原本是「兩個 `if` 判斷 home/sort
   id + 一個 3-case 的內層 switch（backup_sync/help_tips/settings）」，新版
   直接看完整方法體確認改寫成「一個涵蓋全部 4 個 id 的 flat switch」，已
   照新版結構重寫 `onOptionsItemSelected()`，砍掉
   `menu_galler_backup_sync` 這個 case（原本邏輯是
   `AccountUtils.isSignedIn()` ? `showFragment(new BackupSyncSettings())`
   : `signIn()`）。`onPrepareOptionsMenu()` 原本結尾有一段
   `Config.isGooglePlayEnabled(context)` 為 false 時把 backup_sync 選單項
   設成不可見的邏輯，新版整段拿掉，已同步刪除。`BackupSyncSettings`/
   `signIn()` 在檔案裡其他地方還有用到（下拉刷新等情境），保留不動。
19. `storageservice/ui/gallery/viewholder/ScanViewHolder.smali` —
   `mWebviewButton`（`R.id.webicon_parent`，Gallery 縮圖上的「Web Viewer」
   分享按鈕）欄位、建構子裡的 `findViewById`、`bind()` 裡的
   `setTag`/`setOnClickListener`/`setVisibility` 三行全部被刪除。已改
   `ScanViewHolder.java` 對應移除。`mWebviewButtonListener` 欄位跟它的
   `PopupMenu` 邏輯、`mShowWebShare` 欄位都還在 smali 裡（只是現在沒有
   view 會用到 `mWebviewButtonListener` 了，變成死代碼但原版就是這樣，
   照規則不做多餘清理），維持不動。

**全部處理完畢（2026-08-20 第二次 session）：**

- `editor/EditorFragment$1.smali` — **已處理**。查證結果：`EditorFragment$1`
  是 `EditorFragment.saveModel(String)` 裡 `new SaveModelTask(activity,
  mModel, name) { ... }` 這個匿名內部類別。新版把 `onPreExecute()` 裡的
  局部變數 `SphinxProgressDialog dialog` 改成類別欄位（`private
  SphinxProgressDialog dialog;`），並且在 `onPostExecute(Result)` 決定好
  `uri`（`fileSet != null` 分支跟 `else` 分支合流之後、組 `Intent` 之前）
  新增一行 `dialog.dismiss()` 主動關閉進度對話框。已改
  `EditorFragment.java` 對應的匿名類別：欄位化 `dialog`、`onPreExecute()`
  改成 `dialog = new SphinxProgressDialog(...)`、`onPostExecute()` 在建立
  `Intent` 前插入 `dialog.dismiss();`。
- `viewer/fragments/ViewerFragment.smali` — **已處理**，逐方法對照新版
  smali 後確認的完整變更範圍（比原本猜測的更大，`IFileSet.isRiggable()`
  其實不是新方法）：
  - **`IFileSet.isRiggable()` 查證結果**：`IFileSet`/`ITransientFileSet`
    介面本身在新舊版之間完全沒有變化（`isRiggable()`／
    `isImprovable(Context)` 兩個方法舊版就同時存在，`ViewerFragment.java`
    別的地方本來就已經在用 `isRiggable()`，例如 `EditorActivity.
    EXTRA_FACE_DETECTED`）。不需要動介面或任何 `IFileSet` 實作類別。
  - `mWebviewButton` 欄位整個移除；`onCreateView()` 裡對應的
    `findViewById(R.id.webicon_parent)` + `setOnClickListener(this)` 移除；
    `mFileSetChangeRunnable`（`onCreateView` 裡建立，對應 smali
    `lambda$onCreateView$1`）原本依 `fileSet.isVisible()` 切換
    `mWebviewButton` 顯示/隱藏，新版整段可視性邏輯被砍光，只剩
    `if (mModelContainer != null) { mMeshHolderFragment.getFileSet();
    updateAnimationState(); }`（`getFileSet()` 呼叫結果被捨棄，逐位元組
    核對新版 smali 確認無誤，不是自己多加的防禦性寫法）。
  - `setupBottomBar()`：移除 `action_improve` 的
    `findViewById(...).setOnClickListener(this)` 那行，以及方法最後的
    `updateImproveDrawable()` 呼叫。
  - `doClick(View)`：`case R.id.action_improve: startImprovementJob();
    return;` 整個 case 從 `sparse-switch` 移除（對照 `sswitch_data_0` 表，
    新版少一個 case entry）。`case R.id.webicon_parent` 對應的分支邏輯
    smali 沒變，維持不動（現在變成沒有 view 會觸發它的死代碼，跟
    `ScanViewHolder.mWebviewButtonListener` 同樣的情形，照專案慣例不清理）。
  - `onMeshLoaded(Uri, ModelContainer)`：原本
    `view.findViewById(R.id.action_improve).setVisibility((fileSet.
    isImprovable(getContext()) && Config.isGooglePlayEnabled(getContext()))
    ? 0 : 8);` 這整行被刪除，後面 `if (fileSet.isRiggable())` 的區塊
    （控制 `action_animate` 顯示/隱藏）完全不變，只是往前移動接在
    `enableWebviewStatusUpdates()` 之後。
  - `onActivityResult(int, int, Intent)`：`REQUEST_CODE_PRIVACY_AGREEMENT`
    case 裡的 `startImprovementJob();` 被移除（`acceptPostProcessing(...)`
    保留）；`REQUEST_CODE_SIGN_IN` case 整個變空（原本
    `if (resultCode == RESULT_OK) { startImprovementJob(); }`，新版對照
    `packed-switch` 目標直接落到共用的 `return-void`，代表這個 case 現在
    完全沒有任何動作，已改成空的 `case REQUEST_CODE_SIGN_IN: break;`）。
  - `onLoadFinished(Loader<Cursor>, Cursor)`：新增一行
    `getActivity().reportFullyDrawn()`，緊接在
    `mImprovements = Factory.createImprovementRecords(cursor);` 之後、
    `notifyLoadFinished()` 之前。
  - `handleHints()`：原本開頭有
    `getView().findViewById(R.id.action_improve).setEnabled(mImprovements.
    isEmpty())` + `updateImproveDrawable()` 兩行，以及判斷式裡的
    `handleOngoingImprovement() || ... || handleImprovementHint() || ...`，
    新版把這兩行跟兩個判斷式子句都拿掉，簡化成
    `if (handleViewerHint() || handlePromoDismissedHint()) { showHint(); }
    else { hideHint(); }`。`handleOngoingImprovement()`/
    `handleImprovementHint()`/`updateImproveDrawable()` 三個方法本體在新版
    smali 裡確認完全沒被任何地方呼叫了（`grep invoke-direct` 零命中），
    變成單純死代碼，但方法本身仍然存在（宣告不變，只是不可達），照專案
    慣例維持不動、不刪除。
  - 其餘全部核對過是 resid 重編號雜訊（用 per-method 正規化 diff 逐一驗證
    `enableWebviewStatusUpdates`/`handleOngoingImprovement`/
    `isImprovementOngoing`/`launchFaceMimic`/`onPositiveAnswer`/`onCreate`/
    `notifyLoadFinished`/`showDeleteDialog`/`onRequestPermissionsResult`/
    `onMenuItemClick` 等方法皆為 IDENTICAL 或純 resid，不需要修改）。
- `viewer/sharing/tabs/TabPageShare.smali` — **已處理，範圍比原本記錄的
  更大**：逐行核對 `getPlugins()` 完整方法後發現，新版不只是移除
  `WebViewerSharePlugin`、調換 `FaceBlendPlugin`/`ShareAsVideoPlugin`
  順序而已，而是**這兩個 plugin 的 `addPlugin(...)` 呼叫直接整個消失**
  （`FaceBlendPlugin`/`ShareAsVideoPlugin` 這兩個內部類別本身還在新版
  smali 裡，只是不再被 `getPlugins()` 加進清單，變成死代碼，維持類別本體
  不動）。另外 `rearrangePluginList(list, i)` 的第二個參數，舊版是
  「WebViewerSharePlugin 是否有被加到清單」的動態值（`i`，0 或 1），新版
  因為 WebViewerSharePlugin 分支整個沒了，直接變成寫死的常數
  `0`。已重寫 `TabPageShare.getPlugins()`：移除
  `zIsGooglePlayEnabled`／`WebViewerSharePlugin` 判斷區塊（改成只保留
  `Config.isGooglePlayEnabled(context)` 這個布林值供後面 `FindMorePlugin`
  判斷使用）、移除 `FaceBlendPlugin`/`ShareAsVideoPlugin` 兩行
  `addPlugin(...)`、`rearrangePluginList(arrayList, 0)` 直接傳常數 0。
  `WebViewerSharePlugin`/`FaceBlendPlugin`/`ShareAsVideoPlugin` 三個內部
  類別本體都維持不動（新版 smali 裡這三個類別定義本身沒有任何差異）。
- `databinding/ComponentSharingBarBinding.smali`／
  `databinding/ComponentSharingBarBindingImpl.smali` — **已處理**。這兩個是
  `res/layout/component_sharing_bar.xml` 被 databinding 編譯器產生的
  binding 類別，不是手刻 `.java`（databinding 產生的 `XxxBinding`/
  `XxxBindingImpl` 類別是 build 時自動產生，不在 `app/src/main/java/`
  裡）。已確認並修正三個資源檔案，讓它們跟新版一致：
  `app/src/main/res/layout/component_sharing_bar.xml` 拿掉
  `<include android:id="@id/action_improve" .../>` 那一行、
  `app/src/main/res/values/ids.xml` 拿掉 `action_improve`/
  `menu_galler_backup_sync` 兩個 `<item type="id">` 宣告、
  `app/src/main/res/menu/menu_gallery.xml` 拿掉
  `menu_galler_backup_sync` 選單項目（跟 `res/values/ids.xml`、
  `res/menu/menu_gallery.xml` 兩版 diff 出來的內容逐行核對過）。
  下次 build 時 databinding 編譯器會自動重新產生這兩個 `.smali`
  對應的 class，不需要手動再做什麼。
  `databinding/PrintPreviewBarBindingImpl.smali` **不在**這次 208 清單的
  NEEDS_REVIEW 名單裡（分類結果是 RESID_ONLY，純資源 ID 重編號，不用動）。

## 建置驗證（2026-08-20 第二次 session）

`./gradlew :app:assembleDebug` **建置成功**，產出
`app/build/outputs/apk/debug/app-debug.apk`（約 209MB）。過程：

1. `:app:compileDebugJavaWithJavac` 第一次失敗：
   `DriveActionsUtil.java` 的 `import com.google.api.client.extensions.
   android.http.AndroidHttp;` 找不到套件。原因見上面第 9-12 項的更新——
   補上 `com.google.http-client:google-http-client-android:1.41.8` 依賴後
   解決。
2. 補依賴後 `compileDebugJavaWithJavac` 跟完整 `assembleDebug` 都一次過，
   沒有其他編譯錯誤、沒有資源合併衝突（`mergeDebugResources`）、沒有
   dex 重複類別問題（`checkDebugDuplicateClasses`）。
3. 建置過程唯一的警告是 `libimagepipeline.so`（fresco imagepipeline）在
   `app/src/main/jniLibs` 跟 `com.facebook.fresco:imagepipeline:1.13.0`
   AAR 裡都有一份、AGP 自動選 app 模組那份蓋過去——這跟 `java-3.0.A.0.22-a9`
   分支的既有情況相同，不是這次升版新增的問題，不需處理。

**尚未做的**：只跑到 `assembleDebug` 產出 apk，還沒有實機安裝/操作驗證
（`java-3.0.A.0.22-a9` 分支才有做過完整的裝置驗證）。下個 session 如果要
往裝置驗證方向走，可以參考 `java-3.0.A.0.22-a9` 的驗證方法。

## 下個 session 建議切入點

1. ~~一次處理完整條「移除 Web Viewer 分享 + 移除 Improve 一鍵優化」主線~~
   **已於 2026-08-20 第二次 session 全部處理完畢**，24 個 NEEDS_REVIEW
   現在全數解決（19+5）。208 個 changed_files 審查工作正式全部結束。
2. ~~驗證 `app/build.gradle.kts` 新加的三個 Google API Client 依賴版本號~~
   **已於 2026-08-20 第二次 session 驗證完畢**，見上面「建置驗證」一節。
3. 208 個檔案本身已经全部審查完畢（184 個確認不需要修改 + 24 個
   NEEDS_REVIEW 逐一列出，全數 24 個已解決），**不需要再重跑
   classify.py 篩選**，除非發現分類邏輯有誤判需要重新檢視。
4. `./gradlew assembleDebug` 已建置成功，下個 session 可以考慮往實機安裝/
   操作驗證方向走（比照 `java-3.0.A.0.22-a9` 分支曾經做過的裝置驗證），
   或是做 release build / 簽章相關的收尾工作。

## 實機驗證（2026-09-02 session）

**這次才是真正的第一次裝機測試**（`assembleDebug` 成功不代表能跑，上一節
「唯一警告」那句話低估了問題）。用 `tools_App_java/build_push_app-scan3d.py`
建置+簽名（`platform.pk8`）+推到 `/system/app/app-scan3d-release/` 測試，
在真實 poplardcm(SO-01K) 裝置上逐一撞出並修好以下問題（詳見
`dbc75a0` commit）：

1. **RecyclerView/play-services-basement/androidx.core/drawee 的
   classes-only 陷阱**：`app/libs/resource-bearing-classes.jar` 這個機制
   （只取 AAR 的 classes.jar、不解析資源）對「建構子會讀自己 R$styleable/
   R$string/R$id」的模組完全不成立——這幾個 R 類別只有正常解析 AAR 資源時
   才會由 AGP 產生，classes-only 一律 ClassNotFoundException。逐一實測後
   只有 6 個模組（appcompat、appcompat-resources、coordinatorlayout、
   support-compat、play-services-base、material）真的跟 app/src/main/res
   撞資源名需要維持 classes-only，其餘全部改回正常 AAR。
2. **libimagepipeline.so 的 Fresco 版本不符**：這個原生檔是原始 apk 的
   原始檔案（跟 app-scan3dpreloaded-release.apk 裡的版本 md5 相同），但
   `com.facebook.fresco:fresco:1.13.0` 這個當初「猜的」版本太新，
   `JNI_OnLoad` 回傳 `JNI_ERR`。用 androguard 逐一比對原始 dex 跟編譯結果的
   native method 簽章（`Bitmaps`/`JpegTranscoder`/`NativeRoundingFilter`
   都被 1.13.0 改過名稱或簽章），改用 `1.10.0` 後簽章完全吻合；順便補上
   完全沒宣告過的 `animated-gif` 模組。
3. **驗證結果**：GalleryActivity 正常顯示（RecyclerView/SwipeRefreshLayout/
   SimpleDraweeView 都正常渲染），進 Scan3dActivity 後 `SphinxEngine.init()`
   不再 SIGABRT，相機預覽正常串流（`cald` ~29 FPS，VL53L0 深度感測器正常
   量測）。跟一開始「一開 app 就到處閃退」比起來是質的差異。
4. **唯一剩下的已知問題**：`libimagepipeline.so` 的 SoLoader 自解壓執行檔案
   會被 SELinux 擋（`avc: denied { execute }` on `app_data_file`）——這跟
   `vendor/sony/camera/sepolicy/scan3d_app.te` 是同一個問題（domain 由
   `seapp_contexts` 按套件名 `com.sonymobile.scan3d` 匹配，跟裝哪個目錄
   無關），只是這個修正還沒真的跑過 `mka` 刷進這台機器的 vendor image。
   這次測試是暫時 `setenforce 0` 繞過驗證的，不是永久解法。

## 下個 session 建議切入點（更新）

1. 把 `PRODUCT_GMS_CLIENTID_BASE`/`ro.semc.product.device` 屬性修正 + 這個
   `scan3d_app.te` sepolicy 一起跑一次真正的 `mka` 重編+刷機，驗證不開
   permissive 也能正常跑完整個掃描流程（含 SphinxEngine 通過 DetectCamera）。
2. 目前只驗證到相機預覽開始串流，還沒有實際走完一次完整 360° 掃描（需要真人
   或替代物讓鏡頭繞一圈）——等 sepolicy 真的刷進去、不用 permissive 之後，
   找機會實際完整跑一次掃描流程，確認存檔/後製都正常。
