package com.sonymobile.scan3d.viewer;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import androidx.fragment.app.FragmentTransaction;
import com.google.android.gms.drive.DriveFile;
import com.sonymobile.scan3d.EnvironmentError;
import com.sonymobile.scan3d.OnBackPressListener;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.analytics.ScreenEvent;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.sharing.SharingConstants;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.storageservice.provider.Improvement;
import com.sonymobile.scan3d.storageservice.ui.upload.ActionService;
import com.sonymobile.scan3d.storageservice.utils.FsUtils;
import com.sonymobile.scan3d.utils.UserInputReducer;
import com.sonymobile.scan3d.viewer.fragments.AnimationFragment;
import com.sonymobile.scan3d.viewer.fragments.CompareFragment;
import com.sonymobile.scan3d.viewer.fragments.FaceBlendFragment;
import com.sonymobile.scan3d.viewer.fragments.GoodJobFragment;
import com.sonymobile.scan3d.viewer.fragments.KeepDiscardFragment;
import com.sonymobile.scan3d.viewer.fragments.OpenWithFragment;
import com.sonymobile.scan3d.viewer.fragments.ViewerActivityInterface;
import com.sonymobile.scan3d.viewer.fragments.ViewerFragment;
import java.util.ArrayList;
import java.util.Iterator;

/* JADX INFO: loaded from: classes.dex */
public class ViewerActivity extends FragmentActivity implements ViewerActivityInterface, UserInputReducer.InputReducer {
    private static final int COMPARE_MODE = 9;
    private static final String EXTRA_CREATION_TIME = "com.sonymobile.scan3d.extra.CALL_TIME";
    private static final String EXTRA_ENV_ERROR = "com.sonymobile.scan3d.extra.ENV_ERROR";
    private static final String EXTRA_IMPROVEMENT = "com.sonymobile.scan3d.extra.IMPROVEMENT";
    private static final String EXTRA_LONG_SCAN = "com.sonymobile.scan3d.extra.LONG_SCAN";
    private static final String EXTRA_MODELS_URI = "extra_models_uri";
    private static final String EXTRA_SHORT_SCAN = "com.sonymobile.scan3d.extra.SHORT_SCAN";
    private static final String EXTRA_TEXTURE_SIZE = "com.sonymobile.scan3d.extra.TEXTURE_SIZE";
    private static final String EXTRA_TOO_LONG = "com.sonymobile.scan3d.extra.TOO_lONG";
    private static final String EXTRA_VIEWER_MODE = "com.sonymobile.scan3d.extra.VIEWER_MODE";
    private static final int FACE_BLEND_MODE = 11;
    private static final int FACE_TUTORIAL_GOOD_JOB_MODE = 5;
    private static final int FOOD_TUTORIAL_GOOD_JOB_MODE = 7;
    private static final int HEAD_TUTORIAL_GOOD_JOB_MODE = 6;
    private static final int KEEP_DISCARD_MODE = 2;
    private static final String OPEN_NEXT_TUTORIAL = "com.sonymobile.scan3d.extra.OPEN_NEXT_TUTORIAL";
    private static final int OPEN_WITH_MODE = 4;
    private static final int RIGGING_MODE = 10;
    private static final int SELFIE_TUTORIAL_GOOD_JOB_MODE = 8;
    private static final String TAG = "ViewerActivity";
    private static final int VIEWER_MODE = 1;
    private ArrayList<OnBackPressListener> mOnBackPressListeners = new ArrayList<>();

    @Override // androidx.activity.ComponentActivity, android.app.Activity
    public void onBackPressed() {
        onClick(null);
    }

    @Override // com.sonymobile.scan3d.utils.UserInputReducer.InputReducer
    public void doClick(View view) {
        Iterator<OnBackPressListener> it = this.mOnBackPressListeners.iterator();
        boolean z = false;
        while (it.hasNext()) {
            if (it.next().onBackPressed()) {
                z = true;
            }
        }
        if (this.mOnBackPressListeners.isEmpty() || !z) {
            super.onBackPressed();
        }
    }

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(R.layout.activity_viewer);
        if (bundle == null) {
            if (getIntent().getIntExtra(EXTRA_VIEWER_MODE, -1) == 10) {
                MeshHolderFragment.getInstance(this);
            }
            setupFragment(getIntent().getIntExtra(EXTRA_VIEWER_MODE, -1));
        }
        ActionService.init(this);
    }

    private void showFragment(Fragment fragment) {
        FragmentTransaction fragmentTransactionBeginTransaction = getSupportFragmentManager().beginTransaction();
        fragmentTransactionBeginTransaction.setTransition(FragmentTransaction.TRANSIT_FRAGMENT_FADE);
        fragmentTransactionBeginTransaction.replace(R.id.fragment_container, fragment);
        fragmentTransactionBeginTransaction.commit();
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.ViewerActivityInterface
    public void registerOnBackPressListener(OnBackPressListener onBackPressListener) {
        this.mOnBackPressListeners.add(0, onBackPressListener);
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.ViewerActivityInterface
    public void unregisterOnBackPressListener(OnBackPressListener onBackPressListener) {
        this.mOnBackPressListeners.remove(onBackPressListener);
    }

    public static void showInKeepDiscardMode(Context context, Uri uri, boolean z, boolean z2, EnvironmentError.ErrorType errorType, int i) {
        DebugLog.d(TAG, "showInKeepDiscardMode(): uri=" + uri);
        Intent intent = new Intent(context, (Class<?>) ViewerActivity.class);
        intent.setData(uri);
        intent.putExtra(EXTRA_VIEWER_MODE, 2);
        intent.putExtra(EXTRA_CREATION_TIME, System.currentTimeMillis());
        intent.putExtra(EXTRA_SHORT_SCAN, z);
        intent.putExtra(EXTRA_LONG_SCAN, z2);
        intent.putExtra(EXTRA_ENV_ERROR, errorType);
        intent.putExtra(KeepDiscardFragment.POLICY_MODE, i);
        intent.setFlags(DriveFile.MODE_READ_ONLY);
        context.startActivity(intent);
    }

    public static Intent getViewerModeIntent(Context context, Uri uri) {
        Intent intent = new Intent(context, (Class<?>) ViewerActivity.class);
        intent.setData(uri);
        intent.putExtra(EXTRA_VIEWER_MODE, 1);
        intent.putExtra(EXTRA_CREATION_TIME, System.currentTimeMillis());
        intent.setFlags(DriveFile.MODE_READ_ONLY);
        return intent;
    }

    public static Intent getRiggingModeIntent(Context context, Uri uri, int i) {
        Intent intent = new Intent(context, (Class<?>) ViewerActivity.class);
        intent.setData(uri);
        intent.putExtra(EXTRA_VIEWER_MODE, 10);
        intent.putExtra(EXTRA_TEXTURE_SIZE, i);
        intent.putExtra(EXTRA_CREATION_TIME, System.currentTimeMillis());
        intent.setFlags(DriveFile.MODE_READ_ONLY);
        intent.setFlags(33554432);
        return intent;
    }

    public static Intent getImprovementIntent(Context context, Improvement improvement) {
        Intent intent = new Intent(context, (Class<?>) ViewerActivity.class);
        intent.putExtra(EXTRA_VIEWER_MODE, 9);
        intent.setData(improvement.getFileSetUri());
        intent.putExtra(EXTRA_IMPROVEMENT, improvement);
        intent.setFlags(335544320);
        return intent;
    }

    public static void showInOpenWithMode(Context context, Uri uri) {
        Intent intent = new Intent(context, (Class<?>) ViewerActivity.class);
        intent.setData(uri);
        intent.putExtra(EXTRA_VIEWER_MODE, 4);
        intent.setFlags(DriveFile.MODE_READ_ONLY);
        context.startActivity(intent);
    }

    public static Intent getGoodJobFaceScanViewIntent(Context context, Uri uri, boolean z, boolean z2) {
        return getGoodJobScanViewIntent(5, context, uri, z, z2);
    }

    public static Intent getGoodJobHeadScanViewIntent(Context context, Uri uri, boolean z, boolean z2) {
        return getGoodJobScanViewIntent(6, context, uri, z, z2);
    }

    public static Intent getGoodJobFoodScanViewIntent(Context context, Uri uri, boolean z) {
        return getGoodJobScanViewIntent(7, context, uri, z, false);
    }

    public static Intent getGoodJobSelfieScanViewIntent(Context context, Uri uri, boolean z, boolean z2) {
        return getGoodJobScanViewIntent(8, context, uri, z, z2);
    }

    public static Intent getFaceBlendIntent(Context context, ArrayList<Uri> arrayList) {
        Intent intent = new Intent(context, (Class<?>) ViewerActivity.class);
        intent.putParcelableArrayListExtra(EXTRA_MODELS_URI, arrayList);
        intent.putExtra(EXTRA_VIEWER_MODE, 11);
        intent.setFlags(DriveFile.MODE_READ_ONLY);
        return intent;
    }

    private static Intent getGoodJobScanViewIntent(int i, Context context, Uri uri, boolean z, boolean z2) {
        Intent intent = new Intent(context, (Class<?>) ViewerActivity.class);
        intent.putExtra(EXTRA_VIEWER_MODE, i);
        intent.putExtra(EXTRA_TOO_LONG, z);
        intent.putExtra(OPEN_NEXT_TUTORIAL, z2);
        intent.setData(uri);
        return intent;
    }

    private void setupFragment(int i) {
        boolean booleanExtra = getIntent().getBooleanExtra(EXTRA_TOO_LONG, false);
        boolean booleanExtra2 = getIntent().getBooleanExtra(OPEN_NEXT_TUTORIAL, false);
        Intent intent = getIntent();
        switch (i) {
            case 1:
                showFragment(ViewerFragment.newInstance());
                ScreenEvent.VIEWER_SCREEN.send(this);
                return;
            case 2:
                showFragment(KeepDiscardFragment.newInstance(intent.getBooleanExtra(EXTRA_SHORT_SCAN, false), intent.getBooleanExtra(EXTRA_LONG_SCAN, false), (EnvironmentError.ErrorType) intent.getSerializableExtra(EXTRA_ENV_ERROR)));
                ScreenEvent.VIEWER_SCREEN.send(this);
                return;
            case 3:
            default:
                throw new IllegalStateException("Unknown mode " + i);
            case 4:
                showFragment(OpenWithFragment.newInstance());
                ScreenEvent.VIEWER_SCREEN.send(this);
                return;
            case 5:
                showFragment(GoodJobFragment.newInstance(0, booleanExtra, booleanExtra2));
                ScreenEvent.VIEWER_SCREEN.send(this);
                return;
            case 6:
                showFragment(GoodJobFragment.newInstance(1, booleanExtra, booleanExtra2));
                ScreenEvent.VIEWER_SCREEN.send(this);
                return;
            case 7:
                showFragment(GoodJobFragment.newInstance(2, booleanExtra, booleanExtra2));
                ScreenEvent.VIEWER_SCREEN.send(this);
                return;
            case 8:
                showFragment(GoodJobFragment.newInstance(3, booleanExtra, booleanExtra2));
                ScreenEvent.VIEWER_SCREEN.send(this);
                return;
            case 9:
                showFragment(CompareFragment.newInstance((Improvement) intent.getParcelableExtra(EXTRA_IMPROVEMENT)));
                ScreenEvent.VIEWER_SCREEN.send(this);
                return;
            case 10:
                showFragment(AnimationFragment.newInstance(true, getIntent().getIntExtra(EXTRA_TEXTURE_SIZE, 0)));
                ScreenEvent.VIEWER_SCREEN.send(this);
                return;
            case 11:
                ArrayList parcelableArrayListExtra = intent.getParcelableArrayListExtra(EXTRA_MODELS_URI);
                if (parcelableArrayListExtra != null) {
                    showFragment(FaceBlendFragment.newInstance((ArrayList<Uri>) parcelableArrayListExtra));
                    return;
                }
                return;
        }
    }

    public void pickRiggedFileFailed(IFileSet iFileSet) {
        setResult(0, new Intent());
        finish();
    }

    public void finishWithResult(Uri uri, int i) {
        Intent intent = new Intent();
        intent.setData(uri);
        intent.addFlags(1);
        intent.putExtra(SharingConstants.EXTRA_SCAN_TYPE, FsUtils.scanTypeToString(i));
        setResult(-1, intent);
        finish();
    }
}
