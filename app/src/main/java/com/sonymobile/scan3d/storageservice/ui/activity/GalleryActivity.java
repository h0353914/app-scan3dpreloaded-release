package com.sonymobile.scan3d.storageservice.ui.activity;

import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.os.Messenger;
import android.os.Parcelable;
import android.text.TextUtils;
import android.widget.Toolbar;
import androidx.annotation.StringRes;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import androidx.fragment.app.FragmentTransaction;
import com.google.android.vending.expansion.downloader.DownloadProgressInfo;
import com.google.android.vending.expansion.downloader.DownloaderClientMarshaller;
import com.google.android.vending.expansion.downloader.DownloaderServiceMarshaller;
import com.google.android.vending.expansion.downloader.IDownloaderClient;
import com.google.android.vending.expansion.downloader.IStub;
import com.sonymobile.scan3d.PermissionUtil;
import com.sonymobile.scan3d.PreferenceUtils;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.Scan3DApp;
import com.sonymobile.scan3d.ZipResourceManager;
import com.sonymobile.scan3d.analytics.ScreenEvent;
import com.sonymobile.scan3d.expansionfile.RemoteDownloadService;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.sfmc.FaceMimicActivity;
import com.sonymobile.scan3d.sharing.SharingConstants;
import com.sonymobile.scan3d.sharing.SharingManager;
import com.sonymobile.scan3d.storageservice.provider.ExpansionProvider;
import com.sonymobile.scan3d.storageservice.provider.FileTasks;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.storageservice.ui.IScanListener;
import com.sonymobile.scan3d.storageservice.ui.fragment.BackupSyncSettings;
import com.sonymobile.scan3d.storageservice.ui.gallery.GalleryFragment;
import com.sonymobile.scan3d.storageservice.utils.FsUtils;
import com.sonymobile.scan3d.utils.SharingUtil;
import com.sonymobile.scan3d.viewer.ViewerActivity;
import com.sonymobile.scan3d.viewer.YesNoQuestionFragment;
import com.sonymobile.scan3d.widgets.SphinxProgressDialog;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes.dex */
public class GalleryActivity extends FragmentActivity implements IScanListener, YesNoQuestionFragment.OnYesNoListener, Handler.Callback, IDownloaderClient {
    private static final int ANIMATE_MODEL_DIALOG_ID = 10;
    private static final int BACKUP_SYNC_FRAGMENT = 1;
    public static final String EXTRA_STARTING_FRAGMENT = "com.sonymobile.scan3d.extra.STARTING_FRAGMENT";
    public static final String EXTRA_WHATS_NEW_FACE_BLEND = "extra_whats_new_face_blend_flow";
    private static final String EXTRA_WHATS_NEW_FACE_BLEND_SELECT_ANOTHER_MODEL = "extra_second_model";
    public static final String EXTRA_WHATS_NEW_FLOW_TYPE = "extra_whats_new_flow_flow";
    private static final int GALLERY_FRAGMENT = 0;
    private static final int PERMISSION_REQUEST_CODE_FACE_MIMIC = 1000;
    public static final String PICK_INTENT_EXTRA_INTERNAL = "pick_internal";
    private Runnable mAddIdleListener;
    private IFileSet mFileset;
    private Handler mHandler;
    private boolean mIsPicker;
    private IStub mMarshalledDownloader;
    private IdleMonitor mMonitor;
    private PickType mPickType = PickType.OBJ_ONLY;
    private SphinxProgressDialog mProgressDialog;
    private boolean mScanClicked;
    private int[] mScanTypesToDisplay;
    private int mTextureSize;

    enum PickType {
        OBJ_ONLY,
        GLTF_ONLY,
        GLTF_WITH_FALLBACK
    }

    @Override // com.google.android.vending.expansion.downloader.IDownloaderClient
    public void onDownloadProgress(DownloadProgressInfo downloadProgressInfo) {
    }

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (!Scan3DApp.isPartOfBetaProgram(this)) {
            finish();
            return;
        }
        setContentView(R.layout.activity_sphinx_gallery);
        PreferenceUtils.updatePreferences(this);
        Intent intent = getIntent();
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        if ("android.intent.action.PICK".equals(intent.getAction())) {
            this.mIsPicker = true;
            if (toolbar != null && toolbar.getMenu() != null) {
                toolbar.getMenu().clear();
            }
            String stringExtra = intent.getStringExtra(SharingConstants.EXTRA_SCAN_TYPE);
            String[] stringArrayExtra = intent.getStringArrayExtra(SharingConstants.PICKER_EXTRA_MIME_TYPES);
            if (stringExtra != null) {
                this.mScanTypesToDisplay = SharingManager.parseType(stringExtra);
            }
            if (stringArrayExtra != null && stringArrayExtra.length > 0 && stringArrayExtra[0].equals(SharingConstants.GLTF_MIME_TYPE)) {
                if (stringArrayExtra.length > 1 && stringArrayExtra[1].equals(SharingConstants.OBJ_MIME_TYPE)) {
                    this.mPickType = PickType.GLTF_WITH_FALLBACK;
                } else {
                    this.mPickType = PickType.GLTF_ONLY;
                }
            }
        }
        int[] iArr = this.mScanTypesToDisplay;
        if (iArr == null || iArr.length == 0) {
            this.mScanTypesToDisplay = new int[1];
            this.mScanTypesToDisplay[0] = Integer.MAX_VALUE;
        }
        setActionBar(toolbar);
        if (bundle == null) {
            ScreenEvent.GALLERY_SCREEN.send(this);
            setupFragment(intent.getIntExtra(EXTRA_STARTING_FRAGMENT, 0), false);
            FileTasks.checkIntegrity(this);
            FileTasks.checkEncryption(this);
        }
        this.mMonitor = new IdleMonitor();
        this.mHandler = new Handler(this);
        if (ZipResourceManager.expansionLoaded()) {
            return;
        }
        Intent intent2 = new Intent(this, (Class<?>) GalleryActivity.class);
        intent2.setFlags(335544320);
        try {
            if (DownloaderClientMarshaller.startDownloadServiceIfRequired(this, PendingIntent.getActivity(this, 0, intent2, 134217728), (Class<?>) RemoteDownloadService.class) != 0) {
                showProgressDialog(R.string.wait_progress);
                this.mMarshalledDownloader = DownloaderClientMarshaller.CreateStub(this, RemoteDownloadService.class);
            }
        } catch (PackageManager.NameNotFoundException e) {
            e.printStackTrace();
        }
    }

    @Override // androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        Fragment fragmentFindFragmentByTag = getSupportFragmentManager().findFragmentByTag(BackupSyncSettings.class.getName());
        if (fragmentFindFragmentByTag == null || !fragmentFindFragmentByTag.isVisible()) {
            setIntent(intent);
            setupFragment(intent.getIntExtra(EXTRA_STARTING_FRAGMENT, 0), true);
        }
    }

    @Override // androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onPause() {
        super.onPause();
        this.mMonitor.onPause();
    }

    @Override // androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onResume() {
        super.onResume();
        this.mScanClicked = false;
        this.mMonitor.onResume();
    }

    @Override // androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onStart() {
        IStub iStub = this.mMarshalledDownloader;
        if (iStub != null) {
            iStub.connect(this);
        }
        super.onStart();
    }

    @Override // androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onStop() {
        IStub iStub = this.mMarshalledDownloader;
        if (iStub != null) {
            iStub.disconnect(this);
        }
        super.onStop();
    }

    @Override // android.app.Activity
    public void onUserInteraction() {
        super.onUserInteraction();
        this.mMonitor.onUserInteraction();
    }

    @Override // androidx.activity.ComponentActivity, android.app.Activity
    public void onBackPressed() {
        Intent intent;
        if ((getSupportFragmentManager().findFragmentById(R.id.content) instanceof GalleryFragment) && (intent = getIntent()) != null) {
            if (EXTRA_WHATS_NEW_FACE_BLEND_SELECT_ANOTHER_MODEL.equals(intent.getStringExtra(EXTRA_WHATS_NEW_FLOW_TYPE))) {
                intent.putExtra(EXTRA_WHATS_NEW_FLOW_TYPE, EXTRA_WHATS_NEW_FACE_BLEND);
            } else {
                intent.putExtra(EXTRA_WHATS_NEW_FLOW_TYPE, "");
                intent.setAction("");
            }
        }
        if (getSupportFragmentManager().popBackStackImmediate()) {
            return;
        }
        super.onBackPressed();
    }

    static /* synthetic */ void lambda$addIdleListener$0(GalleryActivity galleryActivity, int i, IdleMonitor.OnIdleListener onIdleListener, int i2) {
        galleryActivity.mMonitor.addIdleListener(i, onIdleListener, i2);
    }

    public void addIdleListener(final int i, final IdleMonitor.OnIdleListener onIdleListener, final int i2) {
        if (this.mMarshalledDownloader != null) {
            this.mAddIdleListener = new Runnable() { // from class: com.sonymobile.scan3d.storageservice.ui.activity.-$$Lambda$GalleryActivity$dMgU-L2PaZoWkYVEGkwyJojHVqw
                @Override // java.lang.Runnable
                public final void run() {
                    GalleryActivity.lambda$addIdleListener$0(GalleryActivity.this, i, onIdleListener, i2);
                }
            };
        } else {
            this.mMonitor.addIdleListener(i, onIdleListener, i2);
        }
    }

    public void removeIdleListener(int i) {
        this.mMonitor.removeIdleListener(i);
    }

    public static Intent getBackupSyncIntent(Context context) {
        Intent intent = new Intent(context, (Class<?>) GalleryActivity.class);
        intent.setFlags(335544320);
        intent.putExtra(EXTRA_STARTING_FRAGMENT, 1);
        return intent;
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.IScanListener
    public void onScanClicked(IFileSet iFileSet) {
        if (this.mScanClicked) {
            return;
        }
        if (startPromotionModeIfNeeded(iFileSet)) {
            this.mScanClicked = false;
            return;
        }
        this.mScanClicked = true;
        if (this.mIsPicker) {
            try {
                PackageManager packageManager = getPackageManager();
                ComponentName callingActivity = getCallingActivity();
                if (callingActivity != null) {
                    ActivityInfo activityInfo = packageManager.getActivityInfo(callingActivity, 128);
                    if (activityInfo.metaData != null) {
                        this.mTextureSize = activityInfo.metaData.getInt(SharingConstants.Meta.REDUCED_TEXTURE, 0);
                    } else {
                        this.mTextureSize = 0;
                    }
                }
                boolean booleanExtra = getIntent().getBooleanExtra(PICK_INTENT_EXTRA_INTERNAL, false);
                this.mFileset = iFileSet;
                if (booleanExtra) {
                    finishWithResult(this.mFileset.getUri(), this.mFileset.getScanType());
                    return;
                }
                if (this.mPickType != PickType.OBJ_ONLY && this.mFileset.isRiggable()) {
                    if (!TextUtils.isEmpty(this.mFileset.getRiggedFileUrl())) {
                        showProgressDialog(R.string.saving_print_geometry);
                        SharingUtil.shareRiggedFile(this, this.mHandler, this.mFileset.getUri(), this.mTextureSize);
                        return;
                    } else {
                        showAnimationDialog(packageManager.getApplicationLabel(packageManager.getPackageInfo(getCallingPackage(), 0).applicationInfo).toString());
                        this.mScanClicked = false;
                        return;
                    }
                }
                showProgressDialog(R.string.saving_print_geometry);
                SharingUtil.shareStaticFile(this, this.mHandler, this.mFileset.getUri());
                return;
            } catch (PackageManager.NameNotFoundException e) {
                DebugLog.d(getLocalClassName(), "Failed to get package info: " + e.getMessage());
                return;
            }
        }
        startActivity(ViewerActivity.getViewerModeIntent(this, iFileSet.getUri()));
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.IScanListener
    public void onFaceMimicPromotionClicked() {
        String[] permissions = PermissionUtil.Permissions.CAMERA.getPermissions();
        if (!PermissionUtil.hasPermissions(this, permissions)) {
            Fragment fragmentFindFragmentByTag = getSupportFragmentManager().findFragmentByTag(GalleryFragment.class.getName());
            if (fragmentFindFragmentByTag instanceof GalleryFragment) {
                ((GalleryFragment) fragmentFindFragmentByTag).showPermissionRequest(PermissionUtil.getMissingPermissions(this, permissions), R.string.face_mimic_camera_permissions_needed, 1000);
                return;
            }
            return;
        }
        startActivity(getStartFaceMimicEntryPointIntent());
    }

    public void permissionRequestAccepted(int i) {
        if (i == 1000) {
            startActivity(getStartFaceMimicEntryPointIntent());
        }
    }

    @Override // android.os.Handler.Callback
    public boolean handleMessage(Message message) {
        SphinxProgressDialog sphinxProgressDialog = this.mProgressDialog;
        if (sphinxProgressDialog != null) {
            sphinxProgressDialog.dismiss();
        }
        if (message.what == 0) {
            finishWithResult((Uri) message.obj, message.arg1);
            return true;
        }
        setResult(0);
        finish();
        return true;
    }

    @Override // com.sonymobile.scan3d.viewer.YesNoQuestionFragment.OnYesNoListener
    public void onPositiveAnswer(int i, Parcelable parcelable) {
        startActivity(ViewerActivity.getRiggingModeIntent(this, this.mFileset.getUri(), this.mTextureSize));
        finish();
    }

    @Override // com.sonymobile.scan3d.viewer.YesNoQuestionFragment.OnYesNoListener
    public void onNegativeAnswer(int i, Parcelable parcelable) {
        showProgressDialog(R.string.saving_print_geometry);
        SharingUtil.shareStaticFile(this, this.mHandler, this.mFileset.getUri());
    }

    @Override // com.google.android.vending.expansion.downloader.IDownloaderClient
    public void onServiceConnected(Messenger messenger) {
        DownloaderServiceMarshaller.CreateProxy(messenger).onClientUpdated(this.mMarshalledDownloader.getMessenger());
    }

    @Override // com.google.android.vending.expansion.downloader.IDownloaderClient
    public void onDownloadStateChanged(int i) {
        if (i == 5) {
            ZipResourceManager.reload(this);
            this.mProgressDialog.dismiss();
            Runnable runnable = this.mAddIdleListener;
            if (runnable != null) {
                runnable.run();
                this.mAddIdleListener = null;
            }
        }
    }

    private void setupFragment(int i, boolean z) {
        switch (i) {
            case 0:
                Intent intent = getIntent();
                ArrayList parcelableArrayListExtra = intent.getParcelableArrayListExtra(SharingConstants.EXTRA_EXCLUDE_URIS);
                String stringExtra = intent.getStringExtra(SharingConstants.EXTRA_EXPLANATORY_TEXT);
                String stringExtra2 = intent.getStringExtra(SharingConstants.EXTRA_SCAN_TYPE);
                if (stringExtra2 != null) {
                    this.mScanTypesToDisplay = SharingManager.parseType(stringExtra2);
                }
                showFragment(GalleryFragment.newInstance(this.mScanTypesToDisplay, parcelableArrayListExtra, stringExtra), z);
                return;
            case 1:
                showFragment(new BackupSyncSettings(), z);
                return;
            default:
                throw new IllegalStateException("Unknown mode " + i);
        }
    }

    private void showAnimationDialog(String str) {
        ArrayList arrayList = new ArrayList();
        arrayList.add(str);
        YesNoQuestionFragment.newInstance(10, R.string.animate_before_share_title, R.string.animate_before_share_desc, arrayList, R.string.dialog_button_yes, R.string.dialog_button_no, null).show(getSupportFragmentManager(), (String) null);
    }

    private void showFragment(Fragment fragment, boolean z) {
        FragmentTransaction fragmentTransactionBeginTransaction = getSupportFragmentManager().beginTransaction();
        fragmentTransactionBeginTransaction.setCustomAnimations(android.R.animator.fade_in, android.R.animator.fade_out);
        fragmentTransactionBeginTransaction.replace(R.id.content, fragment, fragment.getClass().getName());
        if (z) {
            fragmentTransactionBeginTransaction.addToBackStack(null);
        }
        fragmentTransactionBeginTransaction.commit();
    }

    private void showProgressDialog(@StringRes int i) {
        this.mProgressDialog = new SphinxProgressDialog(this, i, false);
        this.mProgressDialog.setCancelable(false);
        this.mProgressDialog.setCanceledOnTouchOutside(false);
        this.mProgressDialog.show();
    }

    private void finishWithResult(Uri uri, int i) {
        Intent intent = new Intent();
        intent.setData(uri);
        intent.addFlags(1);
        intent.putExtra(SharingConstants.EXTRA_SCAN_TYPE, FsUtils.scanTypeToString(i));
        setResult(-1, intent);
        finish();
    }

    private boolean startPromotionModeIfNeeded(IFileSet iFileSet) {
        String stringExtra = getIntent().getStringExtra(EXTRA_WHATS_NEW_FLOW_TYPE);
        if (TextUtils.isEmpty(stringExtra)) {
            return false;
        }
        switch (stringExtra) {
            case "extra_whats_new_face_blend_flow":
                startGallery(iFileSet, EXTRA_WHATS_NEW_FACE_BLEND_SELECT_ANOTHER_MODEL, getResources().getString(R.string.explanatory_text_face_blend_another_model_picker));
                return true;
            case "extra_second_model":
                startFaceBlendIntent(iFileSet);
                return true;
            default:
                return false;
        }
    }

    private void startFaceBlendIntent(IFileSet iFileSet) {
        ArrayList parcelableArrayListExtra = getIntent().getParcelableArrayListExtra(SharingConstants.EXTRA_EXCLUDE_URIS);
        Uri uri = (parcelableArrayListExtra == null || parcelableArrayListExtra.size() < 1) ? null : (Uri) parcelableArrayListExtra.get(0);
        ArrayList arrayList = new ArrayList();
        arrayList.add(uri);
        arrayList.add(iFileSet.getUri());
        this.mScanClicked = false;
        startActivity(ViewerActivity.getFaceBlendIntent(this, arrayList));
    }

    private Intent getStartFaceMimicEntryPointIntent() {
        Intent intent = new Intent(this, (Class<?>) FaceMimicActivity.class);
        intent.putExtra(FaceMimicActivity.STARTED_FROM_ENTRY_POINT, true);
        intent.setData(ExpansionProvider.getModelUri(ExpansionProvider.Model.MANGA));
        return intent;
    }

    private void startGallery(IFileSet iFileSet, String str, String str2) {
        Intent intent = getIntent();
        Uri uri = iFileSet.getUri();
        ArrayList<Uri> arrayList = new ArrayList<>();
        arrayList.add(uri);
        intent.putParcelableArrayListExtra(SharingConstants.EXTRA_EXCLUDE_URIS, arrayList);
        intent.putExtra(EXTRA_WHATS_NEW_FLOW_TYPE, str);
        intent.putExtra(SharingConstants.EXTRA_EXPLANATORY_TEXT, str2);
        startActivity(intent);
    }
}
