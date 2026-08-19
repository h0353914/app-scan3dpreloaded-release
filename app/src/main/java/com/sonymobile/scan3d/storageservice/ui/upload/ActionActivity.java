package com.sonymobile.scan3d.storageservice.ui.upload;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import androidx.annotation.NonNull;
import androidx.annotation.StringRes;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentTransaction;
import androidx.lifecycle.LifecycleOwner;
import androidx.loader.app.LoaderManager;
import androidx.loader.content.Loader;
import com.google.android.gms.drive.DriveFile;
import com.google.android.vending.expansion.downloader.Constants;
import com.sonymobile.scan3d.OnBackPressListener;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.network.Credentials;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.storageservice.provider.Upload;
import com.sonymobile.scan3d.storageservice.utils.ConnectionUtils;
import com.sonymobile.scan3d.viewer.sharing.Shareable;
import java.math.BigInteger;
import java.util.UUID;

/* JADX INFO: loaded from: classes.dex */
public final class ActionActivity extends FragmentActivity implements LoaderManager.LoaderCallbacks<UploadData>, IStatusListener<Credentials> {
    private static final String DIALOG_TAG = "dialog";
    public static final String EXTRA_CREDENTIALS = "com.sonymobile.scan3d.extra.CREDENTIALS";
    private static final String EXTRA_FILESET = "com.sonymobile.scan3d.extra.FILESET";
    public static final String EXTRA_SERVICE_PROVIDER = "com.sonymobile.scan3d.extra.SERVICE_PROVIDER";
    public static final String EXTRA_SHAREABLE = "com.sonymobile.scan3d.extra.SHAREABLE";
    private static final String KEY_CREDENTIALS = "credentials";
    private static final String KEY_UID = "uid";
    private static final String KEY_UPLOAD = "upload";
    private static final int NO_RES_ID = 0;
    protected static final int STATE_AUTHENTICATE = 1;
    protected static final int STATE_ERROR = 2;
    protected static final int STATE_MONITOR = 3;
    protected static final int STATE_WELCOME = 0;
    private static final String TAG = "com.sonymobile.scan3d.storageservice.ui.upload.ActionActivity";
    private Credentials mCredentials;
    private Handler mHandler;
    private ServiceProvider mProvider;
    private String mUid;
    private UploadData mUploadData;

    @Override // androidx.loader.app.LoaderManager.LoaderCallbacks
    public void onLoaderReset(@NonNull Loader<UploadData> loader) {
    }

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mProvider = ServiceProvider.valueOf(getIntent().getStringExtra(EXTRA_SERVICE_PROVIDER));
        setContentView(R.layout.activity_upload);
        this.mHandler = new Handler();
        if (bundle != null) {
            this.mUploadData = (UploadData) bundle.getParcelable("upload");
            this.mCredentials = (Credentials) bundle.getParcelable(KEY_CREDENTIALS);
            this.mUid = bundle.getString("uid");
        } else if (!new ConnectionUtils(this).hasDataConnection()) {
            loadFragmentFromState(2, R.string.no_data_connection_description_txt);
        } else {
            LoaderManager.getInstance(this).initLoader(0, null, this);
            this.mProvider.sendActionScreenEvent(this);
        }
    }

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, android.app.Activity
    public void onSaveInstanceState(@NonNull Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putParcelable("upload", this.mUploadData);
        bundle.putParcelable(KEY_CREDENTIALS, this.mCredentials);
        bundle.putString("uid", this.mUid);
    }

    @Override // androidx.activity.ComponentActivity, android.app.Activity
    public void onBackPressed() {
        LifecycleOwner lifecycleOwnerFindFragmentById = getSupportFragmentManager().findFragmentById(R.id.fragment_container);
        if (lifecycleOwnerFindFragmentById instanceof OnBackPressListener ? ((OnBackPressListener) lifecycleOwnerFindFragmentById).onBackPressed() : false) {
            return;
        }
        super.onBackPressed();
    }

    static Intent getStartIntent(Context context, IFileSet iFileSet, ServiceProvider serviceProvider, Action action) {
        return getStartIntent(context, iFileSet, serviceProvider, action, null);
    }

    static Intent getStartIntent(Context context, IFileSet iFileSet, ServiceProvider serviceProvider, Action action, Shareable shareable) {
        Bundle bundle = new Bundle();
        bundle.putParcelable(EXTRA_FILESET, iFileSet);
        bundle.putString(EXTRA_SERVICE_PROVIDER, serviceProvider.name());
        if (shareable != null) {
            bundle.putBundle(EXTRA_SHAREABLE, shareable.toBundle());
        }
        Intent intent = new Intent(context, (Class<?>) ActionActivity.class);
        intent.setData(iFileSet.getUri());
        intent.setAction(action.getIntentAction());
        intent.setFlags(DriveFile.MODE_READ_ONLY);
        intent.putExtras(bundle);
        return intent;
    }

    private void postLoadFragmentFromState(int i, @StringRes int i2) {
        postLoadFragmentFromState(i, i2 != 0 ? getString(i2) : null);
    }

    private void postLoadFragmentFromState(final int i, final String str) {
        this.mHandler.post(() -> loadFragmentFromState(i, str));
    }

    private void startAction() {
        boolean zTestBit;
        Upload upload = this.mUploadData.getUpload();
        Intent intent = getIntent();
        IFileSet iFileSet = (IFileSet) intent.getParcelableExtra(EXTRA_FILESET);
        Shareable shareable = new Shareable(intent.getBundleExtra(EXTRA_SHAREABLE));
        int sharedMeshes = iFileSet.getSharedMeshes();
        if (shareable.getShareType() != null) {
            switch (shareable.getShareType()) {
                case DEFAULT:
                    zTestBit = BigInteger.valueOf(sharedMeshes).testBit(1);
                    break;
                case ANIMATION:
                    zTestBit = BigInteger.valueOf(sharedMeshes).testBit(4);
                    break;
                case PROPS:
                    zTestBit = BigInteger.valueOf(sharedMeshes).testBit(5);
                    break;
                default:
                    zTestBit = false;
                    break;
            }
        } else {
            zTestBit = false;
        }
        if (this.mUploadData.isValid() && zTestBit) {
            if (this.mProvider.startActivity(this, intent.getAction(), upload.getUid(), this.mCredentials, intent.getExtras())) {
                finish();
                return;
            } else {
                postLoadFragmentFromState(2, getString(R.string.upload_already_uploaded_txt, new Object[]{this.mProvider.getServiceProviderName(this)}));
                return;
            }
        }
        if (this.mProvider.isPasswordProtected()) {
            this.mCredentials = new Credentials(UUID.randomUUID().toString().replace(Constants.FILENAME_SEQUENCE_SEPARATOR, "").substring(0, 16));
        }
        ActionService.executeTask(this, intent, this.mCredentials);
        postLoadFragmentFromState(3, 0);
    }

    private void loadFragmentFromState(int i, @StringRes int i2) {
        loadFragmentFromState(i, i2 != 0 ? getString(i2) : null);
    }

    private void loadFragmentFromState(int i, String str) {
        DebugLog.d(TAG, "loadFragmentFromState() : state=" + i);
        FragmentManager supportFragmentManager = getSupportFragmentManager();
        FragmentTransaction fragmentTransactionBeginTransaction = supportFragmentManager.beginTransaction();
        Fragment fragmentFindFragmentById = supportFragmentManager.findFragmentById(R.id.fragment_container);
        if (fragmentFindFragmentById != null) {
            fragmentTransactionBeginTransaction.remove(fragmentFindFragmentById);
        }
        switch (i) {
            case 0:
                this.mProvider.getInfoFragment(this, 0).show(fragmentTransactionBeginTransaction, DIALOG_TAG);
                return;
            case 1:
                fragmentTransactionBeginTransaction.replace(R.id.fragment_container, this.mProvider.getAuthenticationFragment(this, 1));
                fragmentTransactionBeginTransaction.commit();
                return;
            case 2:
                ErrorFragment.newInstance(2, str).show(fragmentTransactionBeginTransaction, DIALOG_TAG);
                return;
            case 3:
                fragmentTransactionBeginTransaction.replace(R.id.fragment_container, this.mProvider.getMonitorFragment((IFileSet) getIntent().getParcelableExtra(EXTRA_FILESET), this.mCredentials));
                fragmentTransactionBeginTransaction.commit();
                return;
            default:
                throw new IllegalStateException("loadFragmentFromState() : Unknown state: " + i);
        }
    }

    @Override // androidx.loader.app.LoaderManager.LoaderCallbacks
    public Loader<UploadData> onCreateLoader(int i, Bundle bundle) {
        return new UploadLoader(this, getIntent(), this.mProvider);
    }

    @Override // androidx.loader.app.LoaderManager.LoaderCallbacks
    public void onLoadFinished(@NonNull Loader<UploadData> loader, UploadData uploadData) {
        this.mUploadData = uploadData;
        Upload upload = this.mUploadData.getUpload();
        if (upload != null && upload.isActive()) {
            postLoadFragmentFromState(2, R.string.upload_generic_already_active_txt);
            return;
        }
        if (this.mProvider.showInfo(this)) {
            postLoadFragmentFromState(0, 0);
        } else if (this.mProvider.needsAuthentication(this, this.mUploadData)) {
            postLoadFragmentFromState(1, 0);
        } else {
            startAction();
        }
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.upload.IStatusListener
    public void onSuccess(int i, Credentials credentials) {
        switch (i) {
            case 0:
                this.mProvider.hideInfo(this);
                if (this.mProvider.needsAuthentication(this, this.mUploadData)) {
                    loadFragmentFromState(1, 0);
                    return;
                } else {
                    startAction();
                    return;
                }
            case 1:
                this.mCredentials = credentials;
                startAction();
                return;
            default:
                throw new IllegalStateException("onSuccess() : Unknown state: " + i);
        }
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.upload.IStatusListener
    public void onFailure(int i, @StringRes int i2) {
        loadFragmentFromState(2, i2);
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.upload.IStatusListener
    public void onDismiss(int i) {
        finish();
        overridePendingTransition(0, android.R.anim.fade_out);
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.upload.IStatusListener
    public void onCancel(int i) {
        Intent learnMoreIntent;
        if (i == 0 && (learnMoreIntent = this.mProvider.getLearnMoreIntent(this)) != null) {
            startActivity(learnMoreIntent);
        }
        finish();
        overridePendingTransition(0, android.R.anim.fade_out);
    }
}
