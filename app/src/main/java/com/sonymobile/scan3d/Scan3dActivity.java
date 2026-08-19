package com.sonymobile.scan3d;

import android.annotation.SuppressLint;
import android.content.ComponentName;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.ServiceConnection;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.VibrationEffect;
import android.os.Vibrator;
import android.preference.PreferenceManager;
import android.util.Size;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.View;
import android.view.WindowManager;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.SeekBar;
import androidx.annotation.StringRes;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.view.ContextThemeWrapper;
import androidx.core.view.ViewCompat;
import androidx.fragment.app.DialogFragment;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import androidx.fragment.app.FragmentManager;
import com.sonymobile.scan3d.analytics.ScanEvent;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.utils.ScreenUtil;
import com.sonymobile.scan3d.utils.UserInputReducer;
import com.sonymobile.scan3d.widgets.SphinxProgressBar;
import com.sonymobile.scan3d.widgets.SphinxStepIndicator;
import java.util.LinkedList;
import java.util.Queue;

/* JADX INFO: loaded from: classes.dex */
public class Scan3dActivity extends FragmentActivity implements ScaleGestureDetector.OnScaleGestureListener, View.OnTouchListener, SphinxToastView.ISphinxToastListener, UserInputReducer.InputReducer, SeekBar.OnSeekBarChangeListener, EnvironmentWarningsDialog.OnEnvironmentWarnings, EnvironmentErrorsDialog.ErrorDialogCallback, ServiceConnection, SurfaceHolder.Callback, ISphinxManager.ISphinxListener, ThermalAlertReceiver.ThermalAlertCallback, BreakScanningDialog.OnBadStartListener {
    private static final float BLOB_INITIAL_SCALE_FACTOR = 1.0f;
    private static final float BLOB_SCALE_FACTOR_MAX = 1.5f;
    private static final float BLOB_SCALE_FACTOR_MIN = 0.5f;
    private static final boolean DEBUG_LIFECYCLE = false;
    private static final String DIALOG_TAG = "dialog";
    public static final String INTENT_EXTRA_ENV_ERROR = "env_error";
    public static final String INTENT_EXTRA_LONG_SCAN = "long_scan";
    public static final String INTENT_EXTRA_SHORT_SCAN = "short_scan";
    public static final String INTENT_EXTRA_SPHINX_POLICY = "policy";
    private static final String[] PERMISSIONS = {"android.permission.CAMERA"};
    public static final int RESULT_CODE_COULD_NOT_SAVE = 3;
    public static final int RESULT_CODE_NO_PERMISSON = 2;
    public static final int RESULT_CODE_SUCCESS = 1;
    private static final long SHORT_SCAN_THRESHOLD = 2000;
    private static final String TAG = "com.sonymobile.scan3d.Scan3dActivity";
    private Button mActionButton;
    private boolean mBound;
    private View mCloseButton;
    private AlertDialog mConfirmCancelDialog;
    private long mDoneButtonTimestamp;
    private SphinxToastView mDoneToastView;
    private EnvironmentError[] mEnvironmentErrors;
    private ScaleGestureDetector mGestureDetector;
    private boolean mLongScan;
    private SphinxToastView mMainToastView;
    private SeekBar mManualFocusSeekBar;
    private AudioPlayer mPlayer;
    protected int mPolicy;
    private SphinxProgressBar mProgressBar;
    private boolean mShortScan;
    private ISphinxManager mSphinxManager;
    private View mStartingProgressView;
    private SphinxStepIndicator mStepIndicator;
    private ThermalAlertReceiver mThermalAlertReceiver;
    private boolean mTooHotToStart;
    private float mCurrentScale = BLOB_INITIAL_SCALE_FACTOR;
    private Queue<SphinxHint> mHintQueue = new LinkedList();
    private SphinxResourceLookup mResourceLookup = new SphinxResourceLookup();
    private boolean mScanStarted = false;

    @Override // android.view.ScaleGestureDetector.OnScaleGestureListener
    public boolean onScaleBegin(ScaleGestureDetector scaleGestureDetector) {
        return true;
    }

    @Override // android.view.ScaleGestureDetector.OnScaleGestureListener
    public void onScaleEnd(ScaleGestureDetector scaleGestureDetector) {
    }

    @Override // android.widget.SeekBar.OnSeekBarChangeListener
    public void onStartTrackingTouch(SeekBar seekBar) {
    }

    @Override // android.widget.SeekBar.OnSeekBarChangeListener
    public void onStopTrackingTouch(SeekBar seekBar) {
    }

    @Override // android.view.SurfaceHolder.Callback
    public void surfaceCreated(SurfaceHolder surfaceHolder) {
    }

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (!PermissionUtil.hasPermissions(this, PERMISSIONS)) {
            setResult(2);
            finish();
            return;
        }
        getWindow().getDecorView().setOnSystemUiVisibilityChangeListener(i -> hideSystemUi());
        this.mThermalAlertReceiver = new ThermalAlertReceiver(this, this);
        this.mThermalAlertReceiver.bindThermalService();
        int i = 1;
        this.mPolicy = getIntent().getIntExtra("policy", 1);
        int i2 = this.mPolicy;
        if (i2 == 4 || i2 == 14) {
            WindowManager.LayoutParams attributes = getWindow().getAttributes();
            attributes.screenBrightness = BLOB_INITIAL_SCALE_FACTOR;
            getWindow().setAttributes(attributes);
        } else {
            i = 0;
        }
        setRequestedOrientation(i);
        setContentView(R.layout.activity_scan3d);
        PreferenceUtils.updatePreferences(this);
        PreferenceManager.setDefaultValues(this, R.xml.dev_preferences, false);
        this.mActionButton = (Button) findViewById(R.id.start_stop_button);
        this.mActionButton.setOnClickListener(this);
        this.mProgressBar = (SphinxProgressBar) findViewById(R.id.progress_bar);
        this.mCloseButton = findViewById(R.id.close_button);
        this.mCloseButton.setOnClickListener(this);
        this.mMainToastView = (SphinxToastView) findViewById(R.id.toast_view_left);
        this.mMainToastView.setAnimations(R.anim.slide_in_left, R.anim.slide_out_left, R.anim.text_slide_in_left);
        this.mDoneToastView = (SphinxToastView) findViewById(R.id.toast_view_right);
        this.mDoneToastView.setAnimations(R.anim.slide_in_right, R.anim.slide_out_right, R.anim.text_slide_in_right);
        this.mManualFocusSeekBar = (SeekBar) findViewById(R.id.focusAdjust);
        this.mStartingProgressView = findViewById(R.id.busy_loading);
        this.mStepIndicator = (SphinxStepIndicator) findViewById(R.id.step_indicator);
        this.mManualFocusSeekBar.setOnSeekBarChangeListener(this);
        if (new SphinxSettings(this).useSound()) {
            this.mPlayer = new AudioPlayer(this);
        }
        if (bundle == null) {
            this.mStartingProgressView.setVisibility(0);
        }
    }

    @Override // androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onDestroy() {
        SeekBar seekBar = this.mManualFocusSeekBar;
        if (seekBar != null) {
            seekBar.setOnSeekBarChangeListener(null);
        }
        ThermalAlertReceiver thermalAlertReceiver = this.mThermalAlertReceiver;
        if (thermalAlertReceiver != null) {
            thermalAlertReceiver.unbindThermalService();
            this.mThermalAlertReceiver = null;
        }
        super.onDestroy();
    }

    @Override // androidx.activity.ComponentActivity, android.app.Activity
    public void onBackPressed() {
        if (this.mScanStarted) {
            confirmCancelScan(this);
        } else {
            super.onBackPressed();
        }
    }

    @Override // androidx.fragment.app.FragmentActivity, android.app.Activity
    public void onResume() {
        super.onResume();
        hideSystemUi();
    }

    @Override // androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onPause() {
        super.onPause();
    }

    @Override // androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onStart() {
        super.onStart();
        if (this.mTooHotToStart) {
            return;
        }
        this.mBound = bindService(new Intent(this, (Class<?>) SphinxService.class), this, 1);
    }

    @Override // androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onStop() {
        if (this.mBound) {
            unbindService(this);
            this.mBound = false;
        }
        this.mScanStarted = false;
        super.onStop();
    }

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, android.app.Activity
    protected void onSaveInstanceState(Bundle bundle) {
        if (this.mScanStarted) {
            ScanEvent.RESTART.send(this, this.mPolicy);
        }
        resetActivity();
        super.onSaveInstanceState(bundle);
    }

    @Override // androidx.core.app.ComponentActivity, android.app.Activity, android.view.Window.Callback
    @SuppressLint({"RestrictedApi"})
    public boolean dispatchKeyEvent(KeyEvent keyEvent) {
        if (PreferenceManager.getDefaultSharedPreferences(this).getBoolean(getString(R.string.pref_key_debug_buttons_enabled), false)) {
            if (keyEvent.getKeyCode() == 24) {
                return true;
            }
            if (keyEvent.getKeyCode() == 25) {
                if (keyEvent.getAction() == 0 && this.mSphinxManager != null) {
                    ScanEvent.VOLUME_DOWN.send(this, this.mPolicy);
                    this.mSphinxManager.setNextDebugMode();
                }
                return true;
            }
            if (keyEvent.getKeyCode() == 80) {
                if (keyEvent.getAction() == 0) {
                    ScanEvent.CAMERA_BUTTON_PRESSED.send(this, this.mPolicy);
                    ISphinxManager iSphinxManager = this.mSphinxManager;
                    if (iSphinxManager != null) {
                        iSphinxManager.setNextState(true);
                    }
                }
                return true;
            }
        }
        return super.dispatchKeyEvent(keyEvent);
    }

    @Override // android.app.Activity, android.view.KeyEvent.Callback
    public boolean onKeyDown(int i, KeyEvent keyEvent) {
        if (i == 27) {
            return true;
        }
        return super.onKeyDown(i, keyEvent);
    }

    private void resetActivity() {
        AlertDialog alertDialog = this.mConfirmCancelDialog;
        if (alertDialog != null) {
            alertDialog.dismiss();
        }
        FragmentManager supportFragmentManager = getSupportFragmentManager();
        Fragment fragmentFindFragmentByTag = supportFragmentManager.findFragmentByTag(DIALOG_TAG);
        if (fragmentFindFragmentByTag != null) {
            supportFragmentManager.beginTransaction().remove(fragmentFindFragmentByTag).commitAllowingStateLoss();
        }
        this.mStartingProgressView.setVisibility(0);
        AudioPlayer audioPlayer = this.mPlayer;
        if (audioPlayer != null) {
            audioPlayer.stopAll();
        }
        this.mStepIndicator.reset();
        this.mProgressBar.hide();
        this.mMainToastView.hide();
        this.mDoneToastView.hide();
        hideActionButton();
        this.mHintQueue.clear();
        this.mEnvironmentErrors = null;
    }

    private void startProcessingHints() {
        SphinxHint sphinxHintPeek = this.mHintQueue.peek();
        while (sphinxHintPeek != null && handleHint(sphinxHintPeek)) {
            this.mHintQueue.remove();
            sphinxHintPeek = this.mHintQueue.peek();
        }
    }

    private void showErrorsDialog() {
        showDialog(new EnvironmentErrorsDialog());
    }

    private void showBreakScanningDialog(int i, int i2) {
        showDialog(BreakScanningDialog.newInstance(i, i2));
    }

    private void showEnvironmentWarningDialog() {
        showDialog(new EnvironmentWarningsDialog());
    }

    private void showCameraTooHotDialog(@StringRes int i, final boolean z) {
        AlertDialog.Builder builder = new AlertDialog.Builder(new ContextThemeWrapper(this, R.style.SphinxAppCompactDialog));
        builder.setTitle(R.string.thermal_dialog_title).setMessage(i).setPositiveButton(android.R.string.ok, (dialogInterface, i2) -> {
            if (z) {
                finish();
            }
        }).setCancelable(false);
        AlertDialog alertDialogCreate = builder.create();
        alertDialogCreate.setCanceledOnTouchOutside(false);
        alertDialogCreate.show();
    }

    private void showDialog(DialogFragment dialogFragment) {
        if (isFinishing() || isDestroyed()) {
            return;
        }
        dialogFragment.show(getSupportFragmentManager(), DIALOG_TAG);
    }

    private boolean handleHint(SphinxHint sphinxHint) {
        SphinxToastView sphinxToastView;
        SphinxToastView sphinxToastView2;
        switch (sphinxHint.code) {
            case 1:
                if (sphinxHint.arg1 == 24) {
                    this.mLongScan = true;
                }
                int[] msgResources = this.mResourceLookup.getMsgResources(sphinxHint.arg1);
                if ((sphinxHint.arg3 >= 0) && this.mPlayer != null) {
                    this.mPlayer.play(sphinxHint.arg1, this.mResourceLookup.getSoundResource(sphinxHint.arg3));
                }
                boolean z = sphinxHint.arg2 != 0;
                if (sphinxHint.arg1 == 6) {
                    sphinxToastView = this.mDoneToastView;
                    sphinxToastView2 = this.mMainToastView;
                } else {
                    sphinxToastView = this.mMainToastView;
                    sphinxToastView2 = this.mDoneToastView;
                }
                sphinxToastView2.hide();
                sphinxToastView.show(msgResources, z, this);
                return false;
            case 2:
                AudioPlayer audioPlayer = this.mPlayer;
                if (audioPlayer != null) {
                    audioPlayer.stop(sphinxHint.arg1);
                }
                this.mDoneToastView.hide();
                this.mMainToastView.hide();
                break;
            case 3:
                if (sphinxHint.arg1 == 2 && this.mDoneButtonTimestamp == 0) {
                    this.mDoneButtonTimestamp = System.currentTimeMillis();
                }
                showActionButton(this.mResourceLookup.getButtonResource(sphinxHint.arg1));
                break;
            case 4:
                hideActionButton();
                break;
            case 5:
                int stageResource = this.mResourceLookup.getStageResource(sphinxHint.arg1);
                this.mStepIndicator.setNbrOfSteps(sphinxHint.arg3);
                this.mStepIndicator.selectStep(sphinxHint.arg2, stageResource);
                this.mStepIndicator.setVisibility(0);
                break;
            case 6:
                this.mStepIndicator.setVisibility(8);
                break;
            case 7:
                if (sphinxHint.arg1 != 0) {
                    enableBlobResizing();
                } else {
                    disableBlobResizing();
                }
                break;
            case 8:
            default:
                DebugLog.e(TAG, "Cannot handle hint.code=" + sphinxHint.code);
                break;
            case 9:
                this.mProgressBar.show();
                break;
            case 10:
                this.mProgressBar.hide();
                break;
            case 11:
                this.mProgressBar.setProgress(sphinxHint.arg1);
                break;
            case 12:
                showBreakScanningDialog(sphinxHint.arg1, sphinxHint.arg2);
                break;
        }
        return true;
    }

    private void showActionButton(@StringRes final int i) {
        int visibility = this.mActionButton.getVisibility();
        if (visibility == 0 && isNewText(this.mActionButton, i)) {
            this.mActionButton.setVisibility(0);
            Animation animationLoadAnimation = AnimationUtils.loadAnimation(this, R.anim.scale_out_in);
            new Handler().postDelayed(() -> this.mActionButton.setText(i), animationLoadAnimation.getDuration());
            this.mActionButton.startAnimation(animationLoadAnimation);
            return;
        }
        if (visibility != 0) {
            this.mActionButton.setText(i);
            this.mActionButton.setVisibility(0);
            this.mActionButton.startAnimation(AnimationUtils.loadAnimation(this, R.anim.scale_in));
        }
    }

    private void hideActionButton() {
        if (this.mActionButton.getVisibility() != 4) {
            this.mActionButton.setVisibility(4);
            this.mActionButton.startAnimation(AnimationUtils.loadAnimation(this, R.anim.scale_out));
        }
    }

    private void hideSystemUi() {
        getWindow().getDecorView().setSystemUiVisibility(5894);
    }

    private void enableBlobResizing() {
        this.mGestureDetector = new ScaleGestureDetector(this, this);
        findViewById(R.id.glRoot).setOnTouchListener(this);
    }

    private void disableBlobResizing() {
        if (this.mGestureDetector != null) {
            findViewById(R.id.glRoot).setOnTouchListener(null);
            this.mGestureDetector = null;
        }
    }

    private boolean isNewText(Button button, @StringRes int i) {
        return !getText(i).equals(button.getText());
    }

    @Override // com.sonymobile.scan3d.EnvironmentWarningsDialog.OnEnvironmentWarnings
    public void onShowErrors() {
        showErrorsDialog();
    }

    @Override // com.sonymobile.scan3d.EnvironmentWarningsDialog.OnEnvironmentWarnings
    public void onIgnoreWarnings() {
        this.mSphinxManager.clearEnvironmentErrors();
    }

    @Override // com.sonymobile.scan3d.EnvironmentWarningsDialog.OnEnvironmentWarnings
    public void onDialogDisplayed() {
        ScanEvent.CRITICAL_ERROR_DISPLAYED.send(this, this.mPolicy);
    }

    @Override // com.sonymobile.scan3d.EnvironmentErrorsDialog.ErrorDialogCallback
    public EnvironmentError[] getErrors() {
        return this.mEnvironmentErrors;
    }

    @Override // com.sonymobile.scan3d.EnvironmentErrorsDialog.ErrorDialogCallback
    public void onIgnoreErrors() {
        this.mSphinxManager.clearEnvironmentErrors();
    }

    @Override // com.sonymobile.scan3d.EnvironmentErrorsDialog.ErrorDialogCallback
    public void onErrorShown(EnvironmentError environmentError, boolean z) {
        if (environmentError == null || environmentError.type == null) {
            return;
        }
        switch (environmentError.type) {
            case TYPE_TOO_DARK:
                if (z) {
                    ScanEvent.CRITICAL_TOO_DARK.send(this, this.mPolicy);
                } else {
                    ScanEvent.WARNING_TOO_DARK.send(this, this.mPolicy);
                }
                break;
            case TYPE_TOO_BRIGHT:
                if (z) {
                    ScanEvent.CRITICAL_TOO_BRIGHT.send(this, this.mPolicy);
                } else {
                    ScanEvent.WARNING_TOO_BRIGHT.send(this, this.mPolicy);
                }
                break;
            case TYPE_UNEVEN_LIGHT:
                if (z) {
                    ScanEvent.CRITICAL_UNEVEN_LIGHT.send(this, this.mPolicy);
                } else {
                    ScanEvent.WARNING_UNEVEN_LIGHT.send(this, this.mPolicy);
                }
                break;
            case TYPE_LOW_TEXTURE_AREA:
                if (z) {
                    ScanEvent.CRITICAL_LOW_TEXTURE_AREA.send(this, this.mPolicy);
                } else {
                    ScanEvent.WARNING_LOW_TEXTURE_AREA.send(this, this.mPolicy);
                }
                break;
            case TYPE_BAD_LOOP_CLOSURE:
                if (z) {
                    ScanEvent.CRITICAL_BAD_LOOP_CLOSURE.send(this, this.mPolicy);
                } else {
                    ScanEvent.WARNING_BAD_LOOP_CLOSURE.send(this, this.mPolicy);
                }
                break;
        }
    }

    @Override // com.sonymobile.scan3d.EnvironmentErrorsDialog.ErrorDialogCallback, com.sonymobile.scan3d.BreakScanningDialog.OnBadStartListener
    public void onRestartScanClicked(boolean z) {
        if (z) {
            ScanEvent.RESTART_CLICKED.send(this, this.mPolicy);
        } else {
            ScanEvent.SCAN_RESTARTED_AFTER_WARNING.send(this, this.mPolicy);
        }
        this.mSphinxManager.restart();
        this.mScanStarted = false;
    }

    @Override // com.sonymobile.scan3d.BreakScanningDialog.OnBadStartListener
    public void onCancelScanClicked() {
        ScanEvent.SCAN_CANCELED_BY_USER.send(this, this.mPolicy);
        finish();
    }

    @Override // android.content.ServiceConnection
    public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        this.mSphinxManager = ((SphinxService.LocalBinder) iBinder).getSphinxManager();
        this.mSphinxManager.registerListener(this);
        this.mSphinxManager.start(this.mPolicy);
        SurfaceView surfaceView = new SurfaceView(this);
        surfaceView.getHolder().addCallback(this);
        FrameLayout frameLayout = (FrameLayout) findViewById(R.id.glRoot);
        frameLayout.removeAllViews();
        frameLayout.addView(surfaceView);
        double height = frameLayout.getHeight();
        double width = frameLayout.getWidth();
        if (height / width > 2.0d || width / height > 2.0d) {
            ScreenUtil.setAspectRatio(frameLayout);
        }
    }

    @Override // android.content.ServiceConnection
    public void onServiceDisconnected(ComponentName componentName) {
        this.mSphinxManager = null;
    }

    @Override // android.view.SurfaceHolder.Callback
    public void surfaceChanged(SurfaceHolder surfaceHolder, int i, int i2, int i3) {
        ISphinxManager iSphinxManager = this.mSphinxManager;
        if (iSphinxManager != null) {
            iSphinxManager.onSurfaceUpdate(!isFinishing(), surfaceHolder.getSurface(), new Size(i2, i3));
            this.mSphinxManager.setLocaleIsRTL(ViewCompat.getLayoutDirection(findViewById(android.R.id.content)) == 1);
        }
    }

    @Override // android.view.SurfaceHolder.Callback
    public void surfaceDestroyed(SurfaceHolder surfaceHolder) {
        ISphinxManager iSphinxManager = this.mSphinxManager;
        if (iSphinxManager != null) {
            iSphinxManager.onSurfaceUpdate(false, null, null);
        }
    }

    @Override // android.view.View.OnTouchListener
    public boolean onTouch(View view, MotionEvent motionEvent) {
        if (motionEvent.getPointerCount() != 2) {
            return true;
        }
        this.mGestureDetector.onTouchEvent(motionEvent);
        return true;
    }

    @Override // android.view.ScaleGestureDetector.OnScaleGestureListener
    public boolean onScale(ScaleGestureDetector scaleGestureDetector) {
        float scaleFactor = scaleGestureDetector.getScaleFactor() - BLOB_INITIAL_SCALE_FACTOR;
        this.mCurrentScale += scaleFactor;
        this.mCurrentScale = Math.max(BLOB_SCALE_FACTOR_MIN, Math.min(this.mCurrentScale + scaleFactor, BLOB_SCALE_FACTOR_MAX));
        this.mSphinxManager.setBlobScale(this.mCurrentScale);
        return true;
    }

    @Override // com.sonymobile.scan3d.SphinxToastView.ISphinxToastListener
    public void onToastShown() {
        this.mHintQueue.remove();
        startProcessingHints();
    }

    @Override // com.sonymobile.scan3d.ISphinxManager.ISphinxListener
    public void onHintReceived(SphinxHint sphinxHint) {
        DebugLog.d(TAG, "onHintReceived() : received hint with code=" + sphinxHint.code + " and arg=[" + sphinxHint.arg1 + " " + sphinxHint.arg2 + " " + sphinxHint.arg3 + "]");
        boolean zIsEmpty = this.mHintQueue.isEmpty();
        if (sphinxHint.code == 8) {
            AudioPlayer audioPlayer = this.mPlayer;
            if (audioPlayer != null) {
                audioPlayer.play(sphinxHint.arg1, this.mResourceLookup.getSoundResource(sphinxHint.arg1));
            }
            if (sphinxHint.arg2 == 1) {
                ((Vibrator) getSystemService("vibrator")).vibrate(VibrationEffect.createOneShot(150L, -1));
                return;
            }
            return;
        }
        this.mHintQueue.add(sphinxHint);
        if (zIsEmpty) {
            startProcessingHints();
        }
    }

    @Override // com.sonymobile.scan3d.ISphinxManager.ISphinxListener
    public void onStarted() {
        if (this.mStartingProgressView.getVisibility() == 0) {
            this.mStartingProgressView.setVisibility(8);
        }
        reportFullyDrawn();
    }

    @Override // com.sonymobile.scan3d.ISphinxManager.ISphinxListener
    public void onRestarting() {
        resetActivity();
    }

    @Override // com.sonymobile.scan3d.ISphinxManager.ISphinxListener
    public void onCameraOpened(boolean z) {
        if (z) {
            this.mManualFocusSeekBar.setVisibility(0);
        } else {
            this.mManualFocusSeekBar.setVisibility(8);
        }
    }

    @Override // com.sonymobile.scan3d.ISphinxManager.ISphinxListener
    public void onCameraTemperatureShutdown(boolean z) {
        if (z && this.mBound) {
            unbindService(this);
            this.mBound = false;
        }
        showCameraTooHotDialog(R.string.thermal_dialog_too_hot_shutdown_description, z);
    }

    @Override // com.sonymobile.scan3d.ISphinxManager.ISphinxListener
    public void onErrorsReceived(EnvironmentError[] environmentErrorArr) {
        this.mEnvironmentErrors = environmentErrorArr;
        for (EnvironmentError environmentError : environmentErrorArr) {
            if (environmentError.critical) {
                showEnvironmentWarningDialog();
                return;
            }
        }
    }

    private EnvironmentError.ErrorType selectEnvironmentError() {
        EnvironmentError[] environmentErrorArr = this.mEnvironmentErrors;
        if (environmentErrorArr == null) {
            return null;
        }
        for (EnvironmentError environmentError : environmentErrorArr) {
            if (!environmentError.critical) {
                onErrorShown(environmentError, false);
                return environmentError.type;
            }
        }
        return null;
    }

    @Override // com.sonymobile.scan3d.ISphinxManager.ISphinxListener
    public void onFinished(Uri uri) {
        Intent intent = new Intent();
        if (uri != null) {
            intent.setData(uri);
            intent.putExtra(INTENT_EXTRA_SHORT_SCAN, this.mShortScan);
            intent.putExtra(INTENT_EXTRA_LONG_SCAN, this.mLongScan);
            intent.putExtra(INTENT_EXTRA_ENV_ERROR, selectEnvironmentError());
            intent.putExtra("policy", this.mPolicy);
            setResult(1, intent);
            AppShortcutsManager.updateShortcut(getApplicationContext(), this.mPolicy);
        } else {
            setResult(3);
        }
        finish();
    }

    @Override // android.widget.SeekBar.OnSeekBarChangeListener
    public void onProgressChanged(SeekBar seekBar, int i, boolean z) {
        this.mSphinxManager.setManualFocusPosition(i);
    }

    @Override // com.sonymobile.scan3d.utils.UserInputReducer.InputReducer
    public void doClick(View view) {
        if (view == this.mActionButton) {
            if (this.mDoneButtonTimestamp > 0) {
                this.mShortScan = SHORT_SCAN_THRESHOLD > System.currentTimeMillis() - this.mDoneButtonTimestamp;
            }
            if (!this.mScanStarted) {
                this.mScanStarted = true;
            }
            this.mSphinxManager.setNextState(false);
            return;
        }
        if (view == this.mCloseButton) {
            if (this.mScanStarted) {
                confirmCancelScan(this);
            } else {
                finish();
            }
        }
    }

    private void confirmCancelScan(final Context context) {
        AlertDialog.Builder builder = new AlertDialog.Builder(new ContextThemeWrapper(this, R.style.SphinxAppCompactDialog));
        builder.setMessage(R.string.dialog_cancel_scan_message);
        builder.setPositiveButton(R.string.dialog_cancel_scan_button, (dialogInterface, i) -> {
            ScanEvent.SCAN_CANCELED_BY_USER.send(context, this.mPolicy);
            finish();
        });
        builder.setNegativeButton(R.string.dialog_continue_scan_button, (DialogInterface.OnClickListener) null);
        this.mConfirmCancelDialog = builder.create();
        this.mConfirmCancelDialog.setOnShowListener(dialogInterface -> {
            float dimension = getResources().getDimension(R.dimen.error_dialog_button_text_size);
            this.mConfirmCancelDialog.getButton(-1).setTextSize(0, dimension);
            this.mConfirmCancelDialog.getButton(-2).setTextSize(0, dimension);
        });
        this.mConfirmCancelDialog.show();
    }

    @Override // com.sonymobile.scan3d.ThermalAlertReceiver.ThermalAlertCallback
    public void cameraTooHotToStart() {
        DebugLog.d(TAG, "Thermal: Camera too hot to start");
        if (this.mBound) {
            unbindService(this);
            this.mBound = false;
        }
        showCameraTooHotDialog(R.string.thermal_dialog_too_hot_to_start_description, true);
        this.mTooHotToStart = true;
    }

    @Override // com.sonymobile.scan3d.ThermalAlertReceiver.ThermalAlertCallback
    public void cameraGettingHot() {
        DebugLog.d(TAG, "Thermal: Camera getting hot");
        this.mSphinxManager.setCameraTemperature(SphinxCameraTemperatureState.kWarm);
    }

    @Override // com.sonymobile.scan3d.ThermalAlertReceiver.ThermalAlertCallback
    public void cameraOverheated() {
        DebugLog.d(TAG, "Thermal: Camera too hot to continue");
        this.mSphinxManager.setCameraTemperature(SphinxCameraTemperatureState.kHot);
        this.mTooHotToStart = true;
    }
}
