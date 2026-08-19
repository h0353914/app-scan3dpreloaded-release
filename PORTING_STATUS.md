# app-scan3d 手刻 Java 進度追蹤

**進度：715/715（100%）全部完成。**

來源：`App_smali/app-scan3d` 的 `smali` 分支反編譯結果。
每個項目對應一個 smali 檔案（含內部類 `$` 記法）；同一個外部類底下的多個內部類
通常會合併在同一支手刻 .java 檔案裡（Java 內部類寫法），完成外部類時一併勾掉。

總計：715 個檔案（已排除 R.smali/R$*.smali、BuildConfig.smali、
`-$$Lambda$*` 合成類、BR.smali/DataBinderMapperImpl —— 這些是編譯期由
aapt2/javac/data-binding compiler 自動產生，不需要手刻）。

## com.sonymobile.scan3d (root) (115)

- [x] `AppShortcutsManager`
- [x] `AppShortcutsManager$Shortcut`
- [x] `AudioPlayer`
- [x] `AudioPlayer$HintPlayer`
- [x] `BreakScanningDialog`
- [x] `BreakScanningDialog$OnBadStartListener`
- [x] `CameraImageProvider`
- [x] `CameraImageProvider$OnCameraStatusListener`
- [x] `CameraSettingType`
- [x] `DataBindingInfo`
- [x] `EnvConditions`
- [x] `EnvironmentError`
- [x] `EnvironmentError$ErrorType`
- [x] `EnvironmentErrorsDialog`
- [x] `EnvironmentErrorsDialog$1`
- [x] `EnvironmentErrorsDialog$BadLightFragment`
- [x] `EnvironmentErrorsDialog$BadLoopClosureFragment`
- [x] `EnvironmentErrorsDialog$BadTextureFragment`
- [x] `EnvironmentErrorsDialog$ErrorAdapter`
- [x] `EnvironmentErrorsDialog$ErrorDialogCallback`
- [x] `EnvironmentErrorsDialog$UnevenLightFragment`
- [x] `EnvironmentWarningsDialog`
- [x] `EnvironmentWarningsDialog$1`
- [x] `EnvironmentWarningsDialog$OnEnvironmentWarnings`
- [x] `Event`
- [x] `FxAdjustType`
- [x] `FxCropAndSmoothType`
- [x] `FxManagerEffects`
- [x] `FxScaleType`
- [x] `FxType`
- [x] `GLEngine`
- [x] `GLThread`
- [x] `GLThread$Renderer`
- [x] `ISphinxManager`
- [x] `ISphinxManager$ISphinxListener`
- [x] `LocaleChangeReceiver`
- [x] `Manifest`
- [x] `Manifest$permission`
- [x] `MeshType`
- [x] `MeshVariant`
- [x] `NativeEGL`
- [x] `NativeGLTextureView`
- [x] `NativeGLTextureView$TouchListener`
- [x] `OnBackPressListener`
- [x] `PermissionUtil`
- [x] `PermissionUtil$Permissions`
- [x] `PlatformType`
- [x] `PlatformTypeDetector`
- [x] `PreferenceUtils`
- [x] `PrintExecution`
- [x] `PrintMaterialType`
- [x] `PrintSelection`
- [x] `PrintSelection$1`
- [x] `PrintType`
- [x] `PropResources`
- [x] `Scan3DApp`
- [x] `Scan3DApp$1`
- [x] `Scan3DApp$AppLifecycleTracker`
- [x] `Scan3DCommon`
- [x] `Scan3dActivity`
- [x] `Scan3dActivity$1`
- [x] `ScanFormat`
- [x] `ScanType`
- [x] `ScanningPermissionsActivity`
- [x] `ScenoID`
- [x] `SimpleLifecycle`
- [x] `SimpleLifecycle$SimpleLifecycleObserver`
- [x] `SimpleLifecycle$SimpleLifecycleOwner`
- [x] `Sphan`
- [x] `Sphan$NativeAnimationListener`
- [x] `Sphinx`
- [x] `SphinxCameraTemperatureState`
- [x] `SphinxEngine`
- [x] `SphinxEngine$1`
- [x] `SphinxEnvCondition`
- [x] `SphinxFocusType`
- [x] `SphinxHint`
- [x] `SphinxHintButtonID`
- [x] `SphinxHintCode`
- [x] `SphinxHintMsgID`
- [x] `SphinxHintSoundID`
- [x] `SphinxHintStageID`
- [x] `SphinxPolicyMode`
- [x] `SphinxResourceLookup`
- [x] `SphinxService`
- [x] `SphinxService$LocalBinder`
- [x] `SphinxSettings`
- [x] `SphinxState`
- [x] `SphinxToastView`
- [x] `SphinxToastView$1`
- [x] `SphinxToastView$2`
- [x] `SphinxToastView$ISphinxToastListener`
- [x] `TextureMovieEncoder2`
- [x] `TextureMovieEncoder2$EncoderHandler`
- [x] `TextureMovieEncoder2$EncoderListener`
- [x] `ThermalAlertReceiver`
- [x] `ThermalAlertReceiver$1`
- [x] `ThermalAlertReceiver$ServiceConnectionSysmon`
- [x] `ThermalAlertReceiver$ThermalAlertCallback`
- [x] `ToastAnimationSet`
- [x] `ToastAnimationSet$1`
- [x] `ToastAnimationSet$AnimationAction`
- [x] `ToastAnimationSet$AnimationAction$1`
- [x] `ToastAnimationSet$Builder`
- [x] `ToastAnimationSet$DelayAction`
- [x] `ToastAnimationSet$IAsyncAction`
- [x] `ToastAnimationSet$ToastAnimationListener`
- [x] `ViewPagerIndicator`
- [x] `ViewPagerNavigation`
- [x] `ViewerBackground`
- [x] `WindowCallbackProxy`
- [x] `ZipResourceManager`
- [x] `ZipResourceManager$1`
- [x] `ZipResourceManager$LoadZipResourceTask`
- [x] `ZipResourceManager$ZipResourceFileListener`

## com.sonymobile.scan3d.analytics (11)

- [x] `CalibrationEvent`
- [x] `Constants`
- [x] `EngineTimeEvent`
- [x] `HitEvent`
- [x] `SBDPUtil`
- [x] `SBDPUtil$1`
- [x] `SBDPUtil$IddSender`
- [x] `ScanEvent`
- [x] `ScreenEvent`
- [x] `SignInEvent`
- [x] `SignInEvent$KeyCheckExecutionType`

## com.sonymobile.scan3d.animation (8)

- [x] `AnimationResources`
- [x] `GLTFExporter`
- [x] `ObjToGltfConverter`
- [x] `ObjToGltfConverter$ErrorDialog`
- [x] `ObjToGltfConverter$ErrorDialog$ErrorDialogListener`
- [x] `ObjToGltfConverter$GltfConversionListener`
- [x] `RigModelManager`
- [x] `RigModelManager$RigRequest`

## com.sonymobile.scan3d.databinding (11)

- [x] `ComponentFaceblendBottomBarBinding`
- [x] `ComponentFaceblendBottomBarBindingImpl`
- [x] `ComponentFaceblendBottomBarBindingLandImpl`
- [x] `ComponentFaceblendSeekbarBinding`
- [x] `ComponentFaceblendSeekbarBindingImpl`
- [x] `ComponentSharingBarBinding`
- [x] `ComponentSharingBarBindingImpl`
- [x] `ComponentSharingBarItemBinding`
- [x] `ComponentSharingBarItemBindingImpl`
- [x] `PrintPreviewBarBinding`
- [x] `PrintPreviewBarBindingImpl`

## com.sonymobile.scan3d.editor (7)

- [x] `EditorActivity`
- [x] `EditorFragment`（含全部 19 個 lambda，已內嵌為 Java lambda / method reference）
- [x] `EditorFragment$1`（匿名 SaveModelTask 子類，已內嵌於 saveModel()）
- [x] `EditorFragment$2`（switch-on-enum 的編譯期合成類，改用一般 Java switch 敘述，不需手刻對應檔案）
- [x] `EditorFragment$EffectGroup`（合併進 EditorFragment.java 的內部類）
- [x] `EditorFragment$EffectGroup$EffectDescription`（合併進 EditorFragment.java 的內部類）
- [x] `FxManager`

## com.sonymobile.scan3d.expansionfile (2)

- [x] `RemoteAlarmReceiver`
- [x] `RemoteDownloadService`

## com.sonymobile.scan3d.logging (2)

- [x] `DebugLog`
- [x] `NativeLog`

## com.sonymobile.scan3d.recording (8)

- [x] `AudioSource`
- [x] `MicAudioSource`
- [x] `Muxer`
- [x] `Muxer$1`
- [x] `Muxer$AudioEncoder`
- [x] `Muxer$Encoder`
- [x] `Muxer$VideoEncoder`
- [x] `VideoRecorder`

## com.sonymobile.scan3d.security (2)

- [x] `TrustedCertificates`
- [x] `TrustedCertificates$CertificateInfo`

## com.sonymobile.scan3d.sfmc (31)

- [x] `FaceMimicActivity`（含全部 13 個匿名內部類 $1~$13 及約 30 個 lambda，已內嵌為 Java 匿名類/lambda，全部合併於 FaceMimicActivity.java 一支檔案；注意 onRequestPermissionsResult 裡的 permission-denied 迴圈是「找到第一個被拒絕的權限就立刻 break」而非收集全部，忠實保留這個原始行為；onCreate 裡 `"scan3dpreloaded".equals("labs")` 恆為 false 的 dev-options 判斷也是原始 smali 就有的死碼，照實保留未刪除。2026-08-18 複查：內部匿名類編號 $1~$13 跟目前手刻碼重新編譯出的編號不對齊（純粹是 javac 依方法宣告順序分配匿名類編號，跟原始 Sony 原始碼的方法物理順序不同所致，不是邏輯問題），改用「interface + EnclosingMethod」比對後 13 個全部一一對應成功；比對中揪出一個真 bug 並修正：onCreate() 裡 GLThread.Renderer 匿名類（原版 $6）的 onSurfaceCreated() → loadModel 成功 callback 少呼叫了 `updateFirstTimeInstructionVisibility()`（對照 smali lambda$null$2 的 access$1400 呼叫），已補上）
- [x] `FaceMimicActivity$1`
- [x] `FaceMimicActivity$10`
- [x] `FaceMimicActivity$11`
- [x] `FaceMimicActivity$12`
- [x] `FaceMimicActivity$13`
- [x] `FaceMimicActivity$2`
- [x] `FaceMimicActivity$3`
- [x] `FaceMimicActivity$4`
- [x] `FaceMimicActivity$5`
- [x] `FaceMimicActivity$6`
- [x] `FaceMimicActivity$7`
- [x] `FaceMimicActivity$8`
- [x] `FaceMimicActivity$9`
- [x] `FaceMimicActivity$CameraImageProviderFactory`
- [x] `FaceMimicActivity$ContentOpener`
- [x] `FaceMimicActivity$MimickingEngineFactory`
- [x] `FaceMimicActivity$PictureSaver`
- [x] `FaceMimicActivity$PictureSaver$SaveListener`
- [x] `FaceMimicActivity$SavePictureTask`
- [x] `FaceMimicActivity$SaveVideoTask`
- [x] `FaceMimicActivity$SoundPlayer`
- [x] `FaceMimicActivity$UiState`
- [x] `FaceMimicActivity$VideoRecorder`
- [x] `FaceMimicActivity$VideoRecorder$RecordingListener`
- [x] `GlThread`
- [x] `MimickingEngine`（含 `MimickingEngine$StateListener`、`MimickingEngine$StateListener$State`，合併於同一檔）
- [x] `MimickingEngine$StateListener`
- [x] `MimickingEngine$StateListener$State`
- [x] `NonLeakyAsyncTask`
- [x] `Sfmc`

## com.sonymobile.scan3d.sharing (16)

- [x] `LocalPlugin`
- [x] `NamedPlugin`
- [x] `OnPluginUpdateListener`
- [x] `Plugin`
- [x] `Plugin3rdParty`
- [x] `Plugin3rdParty$1`（switch-map 合成類，已內聯為 `isEnabled()` 裡的 enum switch，不需獨立檔案）
- [x] `PrintSharePlugin`
- [x] `PrintShareStlPlugin`
- [x] `RemotePlugin`
- [x] `SharingConstants`
- [x] `SharingConstants$Category`
- [x] `SharingConstants$Meta`
- [x] `SharingManager`
- [x] `SharingManager$1`（空的合成類，僅用於私有建構子消歧，已省略）
- [x] `SharingManager$LoadPluginsTask`（合併為 SharingManager 的 non-static inner class）
- [x] `SharingManager$PackageChangedReceiver`（合併為 SharingManager 的 non-static inner class）

## com.sonymobile.scan3d.storageservice (3)

- [x] `Cancellable`
- [x] `Config`
- [x] `CustomConfig`

## com.sonymobile.scan3d.storageservice.authentication (39)

- [x] `AccountUtils`（getAuthToken() 對照原版 smali 逐分支手動追蹤驗證：strDecrypt==null
  分支與 isExpired()==true 分支共用同一段 getRefreshToken/refresh 流程位元碼且共用
  exception handler，兩條路徑在所有例外情境下行為完全一致，已確認非 bug；本機
  javac 重建出的 exception table 分段數量跟原版不同純屬編譯器版本差異——嘗試把
  strDecrypt==null 分支合併進內層 try 會導致 javac 報錯「NetworkException 在外層
  try body 從未被拋出」，證明原始碼結構本來就是 jadx 目前這樣分開寫，不是 bug）
- [x] `AccountUtils$1`（javac 自動產生的 synthetic marker class，InternalListener
  private 建構子的轉發用參數型別，不需手刻）
- [x] `AccountUtils$AccountListener`
- [x] `AccountUtils$InternalListener`
- [x] `AuthActivity`
- [x] `Crypto`
- [x] `CryptoFactory`
- [x] `CryptoFactory$1`（javac 自動產生的 synthetic 建構子消歧 marker class，僅作為 PasswordCrypto/ServerKeyCrypto private 建構子的 package-private 轉發用參數型別，不需手刻對應檔案）
- [x] `CryptoFactory$PasswordCrypto`
- [x] `CryptoFactory$ServerKeyCrypto`
- [x] `CustomAccountUtils`
- [x] `CustomDriveActions`
- [x] `DriveAction`
- [x] `DriveActions`
- [x] `DriveActions$1`（javac 自動產生的 synthetic marker class，GetAppFolder/KeyCheckExecution/GetKeyExecution private 建構子的轉發用參數型別，不需手刻）
- [x] `DriveActions$DriveSync`
- [x] `DriveActions$GetAppFolder`
- [x] `DriveActions$GetKeyExecution`
- [x] `DriveActions$KeyCheckExecution`
- [x] `DriveActions$KeyCheckExecution$CompletionReceiver`
- [x] `DriveActionsUtil`
- [x] `EncryptionDriveEventService`
- [x] `KeyPair`
- [x] `PrivacyActivity`
- [x] `PrivacyActivity$PersonalDataAdapter`
- [x] `PrivacyPolicies`
- [x] `PrivacyPolicy`
- [x] `PrivacyPolicy$1`
- [x] `PrivacyPolicy$PersonalData`
- [x] `PrivacyPolicy$PersonalData$1`
- [x] `SigninActivity`
- [x] `SigninActivity$SignInFailureType`
- [x] `SigninLearnMoreActivity`
- [x] `SignoutActivity`
- [x] `SignoutActivity$1`
- [x] `SignoutActivity$SignoutTask`
- [x] `Vault`（extract()/decrypt()/encryptForCloud() 等多處 try-with-resources desugar
  出的 catch 區塊，重建版本把 `.catch Ljava/lang/Throwable;`＋`.catchall`（同一 PC
  範圍兩條記錄）合併成單一 `.catchall`，屬於已知的 D8 版本表示法差異——兩者在
  Dalvik bytecode 語意上完全等價，try 區域數量、每個 handler 的清理邏輯逐一核對
  皆一致，非邏輯錯誤）
- [x] `Vault$ByteBufferInputStream`
- [x] `Vault$ExtractionResult`

## com.sonymobile.scan3d.storageservice.content (30)

- [x] `AbstractAuthenticatedSyncAdapter`
- [x] `AwsTask`
- [x] `AwsTaskService`
- [x] `CleanUpTask`
- [x] `CleanUpTask$Candidate`
- [x] `DeleteAccountTask`
- [x] `DeleteAllContentTask`
- [x] `Deleter`
- [x] `Downloader`
- [x] `ExecuteImprovementTask`
- [x] `ExtractDataTask`
- [x] `InitImprovementTask`
- [x] `InitKeyTask`
- [x] `Jobs`
- [x] `Jobs$RequestBuilder`
- [x] `Modifier`
- [x] `NotificationTask`
- [x] `ReceiveImprovementTask`
- [x] `RescheduleGDPRTask`
- [x] `SyncAdapter`
- [x] `SyncService`
- [x] `SyncService$SyncObserver`
- [x] `SyncTransaction`
- [x] `SyncTransaction$NetworkOperation`
- [x] `SyncTransfer`
- [x] `Task`
- [x] `TaskService`
- [x] `TransferTask`
- [x] `Uploader`
- [x] `WorkService`

## com.sonymobile.scan3d.storageservice.content.aws (6)

- [x] `Aws`
- [x] `AwsSession`
- [x] `AwsSessionException`
- [x] `GeneralAwsException`
- [x] `TransferControl`
- [x] `TransferControl$1`（javac 自動產生的 enum switchmap synthetic marker class，隨 TransferControl.java 的 switch(TransferState) 自動生成，不需手刻）

## com.sonymobile.scan3d.storageservice.network (45)

- [x] `AbstractRestExecutor`
- [x] `AbstractRestExecutor$1`
- [x] `AbstractRestExecutor$NetworkTask`
- [x] `AsyncViewSetter`
- [x] `ContentType`
- [x] `Credentials`
- [x] `Credentials$1`
- [x] `HttpConstants`
- [x] `HttpResponse`
- [x] `IHttpResponse`
- [x] `IRestExecutor`
- [x] `IRestExecutor$IRestExecutorListener`
- [x] `IRestExecutor$IRestExecutorProgressListener`
- [x] `MultipartForm`
- [x] `MultipartForm$AbstractFileWriter`
- [x] `MultipartForm$FileResourceWriter`
- [x] `MultipartForm$FileWriter`
- [x] `MultipartForm$FormTextFieldWriter`
- [x] `MultipartForm$FormWriter`
- [x] `NetworkException`
- [x] `NetworkRequest`
- [x] `NetworkRequest$INetworkProgressListener`
- [x] `NetworkRequest$Method`
- [x] `PostProcessApi`
- [x] `RestApi`
- [x] `RestApi$1`
- [x] `StreamUtils`
- [x] `SyncHubApi`
- [x] `SyncHubApi$1`
- [x] `SyncHubApi$10`
- [x] `SyncHubApi$2`
- [x] `SyncHubApi$3`
- [x] `SyncHubApi$4`
- [x] `SyncHubApi$5`
- [x] `SyncHubApi$6`
- [x] `SyncHubApi$7`（download() 的 getOutput()：極複雜的多層巢狀 try-with-resources 反編譯,修正三個真 bug——cipherInputStream 條件反了導致該關閉時反而跳過關閉、fileInputStream 的 close() 漏了 try/catch(addSuppressed) 保護、inputStream 的 suppressor 判斷式被寫死成 `0 != 0`。smali diff 比對後剩餘差異皆為 catch/catchall 合併等已知編譯器差異,但這個方法结構極度複雜,建議之後有空再抽查一次)
- [x] `SyncHubApi$8`
- [x] `SyncHubApi$9`
- [x] `SyncHubApi$CloudContent`
- [x] `SyncHubApi$Downloadable`
- [x] `SyncHubApi$MetadataUploader`
- [x] `SyncHubApi$PublicUploadable`
- [x] `SyncHubApi$UploadDataExecutor`
- [x] `SyncHubApi$Uploadable`
- [x] `TransferProgress`

## com.sonymobile.scan3d.storageservice.network.firebase (2)

- [x] `Message`
- [x] `MessagingService`

## com.sonymobile.scan3d.storageservice.network.model (1)

- [x] `S3UploadData`

## com.sonymobile.scan3d.storageservice.network.synchublib (4)

- [x] `Encryption`
- [x] `InvalidAccessTokenException`
- [x] `InvalidEncryptionKeyException`
- [x] `SphinxContent`

## com.sonymobile.scan3d.storageservice.network.synchublib.cloudaccess (2)

- [x] `AccessToken`
- [x] `KeyPair`

## com.sonymobile.scan3d.storageservice.network.synchublib.util (11)

- [x] `AccessTokenUtil`
- [x] `ContentListUtil`
- [x] `ContentListUtil$1`
- [x] `ContentUpdateUtil`
- [x] `FileDeleteUtil`
- [x] `FileDownloadUtil`
- [x] `FileUploadUtil`
- [x] `PropertiesUtil`（修正 mergeFiles() 缺少的 finally 語意，見 commit）
- [x] `RequestType`
- [x] `SignatureUtil`
- [x] `SyncHubConstants`

## com.sonymobile.scan3d.storageservice.provider (20)

- [x] `Contract`
- [x] `Contract$FileRecord`
- [x] `Contract$ImprovementRecord`
- [x] `Contract$UploadRecord`
- [x] `DatabaseHelper`
- [x] `ExpansionProvider`
- [x] `ExpansionProvider$Model`
- [x] `Factory`（修正 create(Context,String,File,File,int,int) 的 IOException catch 路徑錯誤回傳 null，見 commit）
- [x] `FileRecordService`（修正 case 9 分享網格的 IOException 吞掉錯誤、case 2 插入範例掃描的 `||` 短路邏輯，見 commit）
- [x] `FileSet`
- [x] `FileSet$1`（Parcelable.Creator，已合併為 FileSet 內的匿名類別）
- [x] `FileTasks`
- [x] `IFileSet`
- [x] `ITransientFileSet`
- [x] `Improvement`
- [x] `Improvement$1`（Parcelable.Creator，已合併為 Improvement 內的匿名類別）
- [x] `Matcher`
- [x] `StorageProvider`
- [x] `Upload`
- [x] `Upload$1`（Parcelable.Creator，已合併為 Upload 內的匿名類別）

## com.sonymobile.scan3d.storageservice.ui (2)

- [x] `IOnScanMenuItemClickListener`
- [x] `IScanListener`

## com.sonymobile.scan3d.storageservice.ui.activity (8)

- [x] `GalleryActivity`
- [x] `GalleryActivity$PickType`
- [x] `IdleMonitor`
- [x] `IdleMonitor$ListenerRegistration`
- [x] `IdleMonitor$OnIdleListener`
- [x] `OnBoardingActivity`
- [x] `OnBoardingActivity$OnBoarding`
- [x] `OnBoardingActivity$OnBoardingAdapter`

## com.sonymobile.scan3d.storageservice.ui.component (5)

- [x] `FabButton`
- [x] `ImprovementIndicator`
- [x] `OnBoardingIndicatorControl`
- [x] `TransferPreference`
- [x] `UploadIndicator`

## com.sonymobile.scan3d.storageservice.ui.fragment (17)

- [x] `BackupSyncSettings`
- [x] `BackupSyncSettings$1`
- [x] `BackupSyncSettings$FileSetObserver`
- [x] `BackupSyncSettings$MonitorStatus`
- [x] `BackupSyncSettings$MonitorTask`
- [x] `DeleteAccountMonitorFragment`
- [x] `LicenseFragment`
- [x] `OnBoardingItemFragment`
- [x] `OpenSourceFragment`
- [x] `SelectScanModeFragment`
- [x] `SelectScanModeFragment$1`
- [x] `SelectScanModeFragment$IScanChoiceListener`
- [x] `SelectScanModeFragment$ScalePageTransformer`
- [x] `SelectScanModeFragment$ScanMode`
- [x] `SelectScanModeFragment$ScanModeItemFragment`
- [x] `SettingsFragment`
- [x] `SyncFragment`

## com.sonymobile.scan3d.storageservice.ui.gallery (14)

- [x] `GalleryAdapter`
- [x] `GalleryFragment`
- [x] `GalleryFragment$1`
- [x] `GalleryFragment$2`
- [x] `ImageCache`
- [x] `ImageCache$1`
- [x] `ImageCache$2`
- [x] `ImageCache$ThumbnailTask`
- [x] `LazyLoader`
- [x] `SortOrderDialog`
- [x] `SortOrderDialog$OnSortOrderSelectionListener`
- [x] `SortType`
- [x] `SortType$1`
- [x] `SortType$2`

## com.sonymobile.scan3d.storageservice.ui.gallery.item (3)

- [x] `GalleryItem`
- [x] `PromotionsItem`
- [x] `ScanItem`

## com.sonymobile.scan3d.storageservice.ui.gallery.viewholder (8)

- [x] `GalleryViewHolder`
- [x] `PromotionItemViewHolder`
- [x] `PromotionItemViewHolder$PromotionItemListener`
- [x] `PromotionsViewHolder`
- [x] `PromotionsViewHolder$PromotionsAdapter`
- [x] `ScanSmallViewHolder`
- [x] `ScanViewHolder`
- [x] `ScanViewHolder$1`

## com.sonymobile.scan3d.storageservice.ui.gallery.wizard (14)

- [x] `FirstTimeActivity`
- [x] `FirstTimeActivity$PageListener`
- [x] `FirstTimeActivity$TipAdapter`
- [x] `OnCloseListener`
- [x] `OnFragmentSelectedListener`
- [x] `PagerIndicator`
- [x] `PagerIndicatorControl`
- [x] `QuickTipCategoriesActivity`
- [x] `QuickTipCategoriesActivity$QuickTipCategoriesAdapter`
- [x] `QuickTipCategoriesActivity$QuickTipCategoryHolder`
- [x] `ScanTutorial`
- [x] `TipVideoPlayerActivity`
- [x] `TipVideoPlayerActivity$1`
- [x] `WizardActivity`

## com.sonymobile.scan3d.storageservice.ui.gallery.wizard.fragment (5)

- [x] `AboutTechFragment`
- [x] `ExpandableListFragment`
- [x] `ExpandableListFragment$ListAdapter`
- [x] `PagerFragment`
- [x] `PagerFragment$TipAdapter`

## com.sonymobile.scan3d.storageservice.ui.gallery.wizard.item (13)

- [x] `FullscreenVideoTipFragment`
- [x] `FullscreenVideoTipFragment$1`
- [x] `FullscreenVideoTipFragment$FullscreenMediaPlayerController`
- [x] `ImageTipFragment`
- [x] `MediaPlayerController`
- [x] `MediaPlayerController$1`
- [x] `SequenceTipFragment`
- [x] `SequenceTipFragment$1`
- [x] `SequenceTipFragment$ClipSequencePlayersController`
- [x] `TipFragment`
- [x] `VideoTipFragmentOwner`
- [x] `YoutubeTipFragment`
- [x] `YoutubeTipFragment$AsyncImageSetter`

## com.sonymobile.scan3d.storageservice.ui.tips (12)

- [x] `Clip`
- [x] `Clip$1`
- [x] `Tip`
- [x] `Tip$1`
- [x] `Tip$2`
- [x] `Tip$Priority`
- [x] `TipCategory`
- [x] `TipCategory$1`
- [x] `TipParser`
- [x] `TipParser$TipPair`
- [x] `Video`
- [x] `Video$1`

## com.sonymobile.scan3d.storageservice.ui.upload (34)

- [x] `Action`
- [x] `ActionActivity`
- [x] `ActionActivity$1`
- [x] `ActionService`
- [x] `ActionService$1`
- [x] `ActionService$InitTask`
- [x] `ActionService$SetupTask`
- [x] `ActionTask`
- [x] `ActionTask$1`
- [x] `ActionTask$ActionResult`
- [x] `CallbackAuthenticationFragment`
- [x] `CartActivity`
- [x] `ErrorFragment`
- [x] `ErrorFragment$1`
- [x] `IStatusListener`
- [x] `InfoFragment`
- [x] `InfoFragment$1`
- [x] `InfoFragment$2`
- [x] `ListenableDialogFragment`
- [x] `ListenableFragment`
- [x] `MonitorFragment`
- [x] `MonitorFragment$UploadMonitorTask`
- [x] `MonitorFragment$UploadObserver`
- [x] `OauthCallbackActivity`
- [x] `OauthCallbackActivity$1`
- [x] `PrintActionTask`
- [x] `PrintMonitorFragment`
- [x] `ServiceProvider`
- [x] `ServiceProvider$1`
- [x] `ServiceProvider$2`
- [x] `UploadData`
- [x] `UploadData$1`
- [x] `UploadLoader`
- [x] `UploadLoader$1`

## com.sonymobile.scan3d.storageservice.ui.upload.webviewer (5)

- [x] `WebViewerActionTask`
- [x] `WebViewerActionTask$1`
- [x] `WebViewerAuthenticationFragment`
- [x] `WebViewerAuthenticationFragment$1`
- [x] `WebViewerAuthenticationFragment$GetAuthTask`

## com.sonymobile.scan3d.storageservice.utils (5)

- [x] `ConnectionUtils`
- [x] `ConnectionUtils$ConnectionListener`（合併為 ConnectionUtils 內的 default method 介面）
- [x] `CustomConnection`
- [x] `FsUtils`
- [x] `ScreenUtil`

## com.sonymobile.scan3d.utils (15)

- [x] `LinkUtil`
- [x] `LinkUtil$1`
- [x] `MediaStoreUtil`
- [x] `PrintMaterial`
- [x] `PrintSize`
- [x] `SharingUtil`
- [x] `SharingUtil$SaveImage`
- [x] `SharingUtil$SaveVideo`
- [x] `SharingUtil$ShareObjFile`
- [x] `SharingUtil$ShareRiggedFile`
- [x] `SphinxZipCopy`
- [x] `SphinxZipCopy$ZipCopyStream`
- [x] `SystemUtils`
- [x] `UserInputReducer`
- [x] `UserInputReducer$InputReducer`

## com.sonymobile.scan3d.utils.notification (2)

- [x] `NotificationUtil`
- [x] `Notifier`

## com.sonymobile.scan3d.viewer (52)

- [x] `BlenderGLTextureView`
- [x] `BlenderGLTextureView$SurfaceListener`
- [x] `CompareImprovedMeshViewer`
- [x] `DismissablePrivacyFragment`
- [x] `ErrorDialogFragment`
- [x] `FaceBlender`
- [x] `GestureHandler`
- [x] `GestureHandler$GestureListener`
- [x] `HintView`
- [x] `MeshHolderFragment`
- [x] `MeshHolderFragment$1`
- [x] `MeshHolderFragment$2`
- [x] `MeshHolderFragment$3`
- [x] `MeshHolderFragment$4`
- [x] `MeshHolderFragment$DbObserverTask`
- [x] `MeshHolderFragment$LoadRiggedMeshState`
- [x] `MeshHolderFragment$LoadTaskState`
- [x] `MeshHolderFragment$MeshLoadingListener`
- [x] `MeshHolderFragment$PrintMeshLoadingListener`
- [x] `MeshRenderer`
- [x] `MeshRenderer$OnDrawFrameListener`
- [x] `MeshRenderer$OnStopFlingListener`
- [x] `ModelContainer`
- [x] `ModelContainer$1`
- [x] `OnNameChangedListener`
- [x] `OpenWithInterceptActivity`
- [x] `OpenWithInterceptActivity$1`
- [x] `PrintMaterialViewer`
- [x] `PrintPreparationResult`
- [x] `PrivacyFragment`
- [x] `ProxyReceiver`
- [x] `ProxyReceiver$ImprovementRunnable`
- [x] `SelectImprovementActivity`
- [x] `SelectImprovementActivity$ImprovementAdapter`
- [x] `SelectImprovementActivity$ImprovementAdapter$1`
- [x] `SphanGLTextureView`
- [x] `SphanGLTextureView$AnimationListener`
- [x] `SphanGLTextureView$SurfaceListener`
- [x] `SphanRenderer`
- [x] `SphanRenderer$OnDrawFrameListener`
- [x] `SplitScreenView`
- [x] `SplitScreenView$1`
- [x] `SplitScreenView$OnSplitScreenViewListener`
- [x] `TipDialog`
- [x] `TipDialog$ITipDialogListener`
- [x] `ViewerActivity`
- [x] `ViewerGLTextureView`
- [x] `ViewerGLTextureView$SurfaceListener`
- [x] `YesNoQuestionFragment`
- [x] `YesNoQuestionFragment$1`
- [x] `YesNoQuestionFragment$2`
- [x] `YesNoQuestionFragment$OnYesNoListener`

## com.sonymobile.scan3d.viewer.asynctasks (8)

- [x] `ComputePrintMeshTask`
- [x] `ComputePrintMeshTask$PrintMeshLoaderResult`
- [x] `ImproveTask`
- [x] `LoadModelTask`
- [x] `LoadModelTask$MeshAsyncTaskResult`
- [x] `RigModelTask`
- [x] `SaveModelTask`
- [x] `SaveModelTask$Result`

## com.sonymobile.scan3d.viewer.fragments (46)

- [x] `ActionGLFragment`
- [x] `AnimationFragment`
- [x] `AnimationFragment$1`
- [x] `AnimationFragment$FileShareDialog`
- [x] `AnimationFragment$ShareAllAnimationsConfirmDialog`
- [x] `BaseAnimationFragment`
- [x] `BaseAnimationFragment$1`
- [x] `BaseViewerFragment`
- [x] `BaseViewerFragment$BackgroundTaskState`
- [x] `BlendActionGLFragment`
- [x] `CompareFragment`
- [x] `CompareFragment$1`
- [x] `CompareFragment$IntroAnimation`
- [x] `DataPermissionFragment`
- [x] `DetailsFragment`
- [x] `DetailsFragment$Details`
- [x] `DetailsFragment$Details$1`
- [x] `EditNameFragment`
- [x] `FaceBlendFragment`
- [x] `FaceBlendFragment$1`
- [x] `FaceBlendFragment$2`
- [x] `FaceBlendFragment$3`
- [x] `FaceBlendFragment$SaveState`
- [x] `FaceBlendFragment$SeekBarTimer`
- [x] `FaceBlendIntroFragment`
- [x] `GoodJobFragment`
- [x] `KeepDiscardFragment`
- [x] `NoLocalPrintersFragment`
- [x] `OpenWithFragment`
- [x] `Print3rdPartyPluginsFragment`
- [x] `Print3rdPartyPluginsFragment$PrintPrivacyDialog`
- [x] `Print3rdPartyPluginsFragment$PrintSharePrivacyDialog`
- [x] `Print3rdPartyPluginsFragment$PrinterPluginsAdapter`
- [x] `Print3rdPartyPluginsFragment$SaveModelForPrintPlugin`
- [x] `Print3rdPartyPluginsFragment$WorkerFragment`
- [x] `Print3rdPartyPluginsFragment$WorkerFragment$1`
- [x] `PrintEditFragment`
- [x] `PrintEditFragment$1`
- [x] `PrintPreviewFragment`
- [x] `PropsFragment`
- [x] `ScanAddedFragment`
- [x] `ShareAsVideoFragment`
- [x] `ShareAsVideoFragment$1`
- [x] `ViewerActivityInterface`
- [x] `ViewerFragment`
- [x] `ViewerFragment$1`

## com.sonymobile.scan3d.viewer.fragments.component (3)

- [x] `AnimationMenu`
- [x] `AnimationMenu$AnimationMenuListener`
- [x] `Pickable`

## com.sonymobile.scan3d.viewer.fragments.utils (1)

- [x] `ViewerUtils`

## com.sonymobile.scan3d.viewer.sharing (15)

- [x] `Shareable`
- [x] `Shareable$1`
- [x] `Shareable$Type`
- [x] `SharingFragment`
- [x] `SharingFragment$1`
- [x] `SharingFragment$SharingPagerAdapter`
- [x] `SharingFragment$Tab`
- [x] `SlidingTabLayout`
- [x] `SlidingTabLayout$1`
- [x] `SlidingTabLayout$InternalViewPagerListener`
- [x] `SlidingTabLayout$TabClickListener`
- [x] `SlidingTabLayout$TabColorizer`
- [x] `SlidingTabStrip`
- [x] `SlidingTabStrip$1`
- [x] `SlidingTabStrip$SimpleTabColorizer`

## com.sonymobile.scan3d.viewer.sharing.tabs (31)

- [x] `ShareCardView`
- [x] `TabPageBase`
- [x] `TabPageBase$1`
- [x] `TabPageBase$InfoCard`
- [x] `TabPageBase$InfoHolder`
- [x] `TabPageBase$PluginAdapter`
- [x] `TabPageBase$ViewHolder`
- [x] `TabPagePrint`
- [x] `TabPagePrint$FindMorePlugin`
- [x] `TabPagePrint$LocalPrintPlugin`
- [x] `TabPageShare`
- [x] `TabPageShare$1`
- [x] `TabPageShare$FaceBlendPlugin`
- [x] `TabPageShare$FileShareAdvPlugin`
- [x] `TabPageShare$FileShareAdvPrivacyDialog`
- [x] `TabPageShare$FileSharePlugin`
- [x] `TabPageShare$FileSharePrivacyDialog`
- [x] `TabPageShare$FindMorePlugin`
- [x] `TabPageShare$Plugin3rdPartyWithPrivacyDialog`
- [x] `TabPageShare$PropsPlugin`
- [x] `TabPageShare$RadioButtonDialogFragment`
- [x] `TabPageShare$ReduceGLTFSizeTask`
- [x] `TabPageShare$ReduceSizeManager`
- [x] `TabPageShare$ReduceSizeManager$ReduceGLTFSizeListener`
- [x] `TabPageShare$ReduceSizeManager$TaskState`
- [x] `TabPageShare$ShareAsVideoPlugin`
- [x] `TabPageShare$SharingConclusion`
- [x] `TabPageShare$ThirdPartyPrivacyDialog`
- [x] `TabPageShare$WallpaperPlugin`
- [x] `TabPageShare$WebViewerPrivacyDialog`
- [x] `TabPageShare$WebViewerSharePlugin`

## com.sonymobile.scan3d.wallpaper (11)

- [x] `SphinxWallpaperService`
- [x] `SphinxWallpaperService$1`
- [x] `SphinxWallpaperService$OpenGLES2Engine`
- [x] `SphinxWallpaperService$OpenGLES2Engine$1`
- [x] `TiltAnimationHelper`
- [x] `TiltAnimationHelper$TiltRunnable`
- [x] `TiltAnimationHelper$TiltRunnable$1`
- [x] `TiltSensor`
- [x] `WallpaperPreviewer`
- [x] `WallpaperPreviewer$WallpaperFragment`
- [x] `WallpaperPreviewer$WallpaperFragment$1`

## com.sonymobile.scan3d.widgets (10)

- [x] `SphinxProgressBar`
- [x] `SphinxProgressDialog`
- [x] `SphinxProgressIndicator`
- [x] `SphinxStepIndicator`
- [x] `SphinxStepIndicatorBullet`
- [x] `SphinxStepIndicatorBullet$1`
- [x] `SphinxStepIndicatorBullet$2`
- [x] `SphinxStepIndicatorBullet$ResizeWidthAnimation`
- [x] `VerticalSeekBar`
- [x] `ViewPagerContainer`
