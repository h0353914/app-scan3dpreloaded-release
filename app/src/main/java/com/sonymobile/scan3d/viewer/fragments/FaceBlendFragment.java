package com.sonymobile.scan3d.viewer.fragments;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.CountDownTimer;
import android.os.Handler;
import android.os.Message;
import android.util.DisplayMetrics;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.TranslateAnimation;
import android.widget.Button;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.SeekBar;
import android.widget.TextView;
import androidx.annotation.NonNull;
import androidx.annotation.Size;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.fragment.app.FragmentActivity;
import com.sonymobile.scan3d.PermissionUtil;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.TextureMovieEncoder2;
import com.sonymobile.scan3d.databinding.ComponentFaceblendBottomBarBinding;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.authentication.Vault;
import com.sonymobile.scan3d.utils.SharingUtil;
import com.sonymobile.scan3d.utils.SystemUtils;
import com.sonymobile.scan3d.utils.UserInputReducer;
import com.sonymobile.scan3d.viewer.MeshHolderFragment;
import com.sonymobile.scan3d.viewer.ModelContainer;
import java.io.File;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes2.dex */
public class FaceBlendFragment extends BlendActionGLFragment implements TextureMovieEncoder2.EncoderListener, Handler.Callback {
    private static final int ANIMATION_TIME = 400;
    private static final String KEY_IS_SQUARE = "view_is_square";
    private static final String KEY_SECONDARY_URI = "secondary_uri";
    private static final String KEY_VIDEO_INTENT = "video_intent";
    private static final long LENGTH_LONG = 8000;
    private static final int SEEKBAR_MESH_ID = 2;
    private static final int SEEKBAR_TEXTURE_ID = 1;
    private static final String TAG = "com.sonymobile.scan3d.viewer.fragments.FaceBlendFragment";
    private ComponentFaceblendBottomBarBinding mBottomBar;
    private Handler mHandler;
    private int mMeshProgress;
    private Button mOblongButton;
    private Intent mOpenAlbumIntent;
    private View mPermissionsContainer;
    private Handler mPermissionsHandler;
    private View mSaveAsContainer;
    private MeshHolderFragment mSecondaryMeshHolderFragment;
    private SeekBarTimer mSeekBarTimer;
    private boolean mShowRatioControls;
    private Button mSquareButton;
    private int mTextureProgress;
    private View mViewResultContainer;
    private boolean mIsSquare = true;
    private SaveState mSaveState = SaveState.IDLE;
    private SeekBar.OnSeekBarChangeListener mSeekBarListener = new SeekBar.OnSeekBarChangeListener() { // from class: com.sonymobile.scan3d.viewer.fragments.FaceBlendFragment.1
        @Override // android.widget.SeekBar.OnSeekBarChangeListener
        public void onStartTrackingTouch(SeekBar seekBar) {
        }

        @Override // android.widget.SeekBar.OnSeekBarChangeListener
        public void onStopTrackingTouch(SeekBar seekBar) {
        }

        @Override // android.widget.SeekBar.OnSeekBarChangeListener
        public void onProgressChanged(SeekBar seekBar, int i, boolean z) {
            float max = ((float) i) / ((float) seekBar.getMax());
            switch (seekBar.getId()) {
                case 1:
                    FaceBlendFragment.this.getFaceBlender().setTextureSlider(max);
                    break;
                case 2:
                    FaceBlendFragment.this.getFaceBlender().setMeshSlider(max);
                    break;
            }
            FaceBlendFragment.this.requestRenderGLTextureView();
        }
    };

    private enum SaveState {
        IDLE,
        WAITING,
        IMAGE,
        VIDEO
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BlendActionGLFragment, com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
    public int getContentLayout() {
        return R.layout.fragment_faceblend;
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
    protected int getTitleId() {
        return R.string.face_blend_title;
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
    protected int getToolBarActionText() {
        return R.string.save_scan;
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BlendActionGLFragment, com.sonymobile.scan3d.viewer.MeshHolderFragment.MeshLoadingListener
    public void onMeshLoadFailed(Uri uri) {
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BlendActionGLFragment, com.sonymobile.scan3d.NativeGLTextureView.TouchListener
    public void onSingleTouch() {
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
    protected boolean showToolbar() {
        return true;
    }

    private class SeekBarTimer extends CountDownTimer {
        private static final long INTERVAL = 10;
        private static final int NUMBER_OF_SWEEPS = 2;
        private static final int TIMESTAMP_TO_PROGRESS_RATIO = 20;
        private static final int TIME_PER_SWEEP = 2000;
        private ProgressBar mProgressBar;
        private long mTotalTime;

        SeekBarTimer(int i) {
            super((i * 20) + 4000, INTERVAL);
            long j = (i * 20) + 4000;
            this.mTotalTime = j;
            if (FaceBlendFragment.this.getView() != null) {
                this.mProgressBar = (ProgressBar) FaceBlendFragment.this.getView().findViewById(R.id.save_progress);
                this.mProgressBar.setMax((int) this.mTotalTime);
            }
        }

        @Override // android.os.CountDownTimer
        public void onTick(long j) {
            if (this.mProgressBar.getVisibility() != 0) {
                this.mProgressBar.setVisibility(0);
            }
            this.mProgressBar.setProgress((int) (this.mTotalTime - j));
            float fAbs = (float) ((2000.0d - Math.abs(((this.mTotalTime - j) % 4000.0d) - 2000.0d)) * 5.0E-4d);
            if (4000 <= this.mTotalTime - j) {
                int i = (int) (100.0f * fAbs);
                if (i < FaceBlendFragment.this.mMeshProgress) {
                    FaceBlendFragment.this.getFaceBlender().setMeshSlider(fAbs);
                }
                if (i < FaceBlendFragment.this.mTextureProgress) {
                    FaceBlendFragment.this.getFaceBlender().setTextureSlider(fAbs);
                }
            } else {
                FaceBlendFragment.this.getFaceBlender().setMeshSlider(fAbs);
                FaceBlendFragment.this.getFaceBlender().setTextureSlider(fAbs);
            }
            FaceBlendFragment.this.requestRenderGLTextureView();
        }

        @Override // android.os.CountDownTimer
        public void onFinish() {
            this.mProgressBar.setVisibility(8);
            FaceBlendFragment.this.mGLTextureView.stopEncoder();
        }
    }

    public static FaceBlendFragment newInstance(Uri uri) {
        FaceBlendFragment faceBlendFragment = new FaceBlendFragment();
        Bundle bundle = new Bundle();
        bundle.putParcelable(KEY_SECONDARY_URI, uri);
        faceBlendFragment.setArguments(bundle);
        return faceBlendFragment;
    }

    public static FaceBlendFragment newInstance(@NonNull @Size(2) ArrayList<Uri> arrayList) {
        FaceBlendFragment faceBlendFragment = new FaceBlendFragment();
        Bundle bundle = new Bundle();
        if (arrayList.size() == 2) {
            bundle.putParcelable("first_uri", arrayList.get(0));
            bundle.putParcelable(KEY_SECONDARY_URI, arrayList.get(1));
        }
        faceBlendFragment.setArguments(bundle);
        return faceBlendFragment;
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BlendActionGLFragment, com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, androidx.fragment.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mHandler = new Handler(this);
        this.mPermissionsHandler = new Handler();
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BlendActionGLFragment, com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View viewOnCreateView = super.onCreateView(layoutInflater, viewGroup, bundle);
        this.mMeshHolderFragment.setMeshLoadingListener(this);
        if (bundle == null && this.mMeshHolderFragment != null) {
            this.mMeshHolderFragment.resetFaceBlender();
        }
        if (bundle != null) {
            this.mOpenAlbumIntent = (Intent) bundle.getParcelable(KEY_VIDEO_INTENT);
            this.mIsSquare = bundle.getBoolean(KEY_IS_SQUARE);
        }
        ViewGroup viewGroup2 = (ViewGroup) viewOnCreateView.findViewById(R.id.bottom_bar);
        if (viewGroup2 != null) {
            setupBottomBar(layoutInflater, viewGroup2);
        }
        this.mViewResultContainer = viewOnCreateView.findViewById(R.id.view_result_container);
        this.mSaveAsContainer = viewOnCreateView.findViewById(R.id.save_as_container);
        this.mPermissionsContainer = viewOnCreateView.findViewById(R.id.permissions_container);
        DisplayMetrics displayMetrics = getActivity().getResources().getDisplayMetrics();
        this.mShowRatioControls = displayMetrics.heightPixels * 9 > displayMetrics.widthPixels * 19;
        if (this.mShowRatioControls) {
            ((ConstraintLayout) viewOnCreateView.findViewById(R.id.select_video_bar)).setVisibility(0);
            this.mSquareButton = (Button) viewOnCreateView.findViewById(R.id.button_1to1);
            this.mOblongButton = (Button) viewOnCreateView.findViewById(R.id.button_4to3);
            this.mSquareButton.setOnClickListener(view -> setViewRatio(true));
            this.mOblongButton.setOnClickListener(view -> setViewRatio(false));
            setViewRatio(this.mIsSquare);
            RelativeLayout.LayoutParams layoutParams = (RelativeLayout.LayoutParams) this.mSaveAsContainer.getLayoutParams();
            layoutParams.addRule(6, R.id.bottom_bar);
            this.mSaveAsContainer.setLayoutParams(layoutParams);
        } else {
            setViewRatio(true);
        }
        setupViewPermissionsButton();
        this.mSecondaryMeshHolderFragment = MeshHolderFragment.getInstance(getActivity(), (Uri) getArguments().getParcelable(KEY_SECONDARY_URI));
        this.mSecondaryMeshHolderFragment.setMeshLoadingListener(this);
        return viewOnCreateView;
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BlendActionGLFragment, com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, androidx.fragment.app.Fragment
    public void onResume() {
        super.onResume();
        if (this.mOpenAlbumIntent != null) {
            this.mViewResultContainer.setVisibility(0);
            setupViewResultButton();
            this.mHandler.postDelayed(createRemoveViewResultContainerRunnable(), 8000L);
        }
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, androidx.fragment.app.Fragment
    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putParcelable(KEY_VIDEO_INTENT, this.mOpenAlbumIntent);
        bundle.putBoolean(KEY_IS_SQUARE, this.mIsSquare);
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BlendActionGLFragment, com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, androidx.fragment.app.Fragment
    public void onPause() {
        super.onPause();
        if (this.mSaveState == SaveState.VIDEO || this.mSaveState == SaveState.IMAGE) {
            interruptOngoingSave();
        }
        this.mHandler.removeCallbacksAndMessages(null);
    }

    @Override // androidx.fragment.app.Fragment
    public void onRequestPermissionsResult(int i, @NonNull String[] strArr, @NonNull int[] iArr) {
        boolean z;
        if (i == PermissionUtil.Permissions.STORAGE.getRequestCode()) {
            int i2 = 0;
            while (true) {
                if (i2 >= strArr.length) {
                    z = true;
                    break;
                } else {
                    if (iArr[i2] != 0) {
                        z = false;
                        break;
                    }
                    i2++;
                }
            }
            this.mPermissionsHandler.removeCallbacksAndMessages(null);
            if (z) {
                showSaveAs();
                if (this.mPermissionsContainer.getVisibility() == 0) {
                    this.mPermissionsHandler.post(createRemovePermissionsContainerRunnable());
                    return;
                }
                return;
            }
            TranslateAnimation translateAnimation = new TranslateAnimation(0.0f, 0.0f, this.mPermissionsContainer.getHeight(), 0.0f);
            translateAnimation.setDuration(400L);
            this.mPermissionsContainer.startAnimation(translateAnimation);
            this.mPermissionsContainer.setVisibility(0);
            this.mPermissionsHandler.postDelayed(createRemovePermissionsContainerRunnable(), 8000L);
        }
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
    protected void onActionClick() {
        String[] missingPermissions = PermissionUtil.getMissingPermissions(getContext(), PermissionUtil.Permissions.STORAGE.getPermissions());
        if (missingPermissions.length > 0) {
            requestPermissions(missingPermissions, PermissionUtil.Permissions.STORAGE.getRequestCode());
        } else {
            showSaveAs();
        }
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, com.sonymobile.scan3d.OnBackPressListener
    public boolean onBackPressed() {
        this.mHandler.removeCallbacksAndMessages(null);
        switch (this.mSaveState) {
            case IMAGE:
            case VIDEO:
                interruptOngoingSave();
                return true;
            case WAITING:
                this.mSaveState = SaveState.IDLE;
                setSaveAsContainerVisibility(false);
                return true;
            default:
                getFragmentManager().beginTransaction().remove(this.mSecondaryMeshHolderFragment).commit();
                SystemUtils.setCurrentOrientation(getActivity(), false);
                return super.onBackPressed();
        }
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
    protected void onNavigationClick() {
        getFragmentManager().beginTransaction().remove(this.mSecondaryMeshHolderFragment).commit();
        SystemUtils.setCurrentOrientation(getActivity(), false);
        super.onNavigationClick();
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BlendActionGLFragment, com.sonymobile.scan3d.viewer.MeshHolderFragment.MeshLoadingListener
    public void onMeshLoaded(Uri uri, ModelContainer modelContainer) {
        if (!isAdded() || this.mMeshHolderFragment.getFileSet() == null || this.mSecondaryMeshHolderFragment.getFileSet() == null) {
            return;
        }
        final String path = this.mMeshHolderFragment.getPath();
        final String path2 = this.mSecondaryMeshHolderFragment.getPath();
        final String password = Vault.getPassword(getContext());
        showProgressDialog(R.string.face_blend_loading_models, true);
        queueGlEvent(() -> {
            getFaceBlender().load(path, path2, password);
            dismissProgressDialog();
            requestRenderGLTextureView();
        });
        requestRenderGLTextureView();
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BlendActionGLFragment, com.sonymobile.scan3d.viewer.MeshHolderFragment.MeshLoadingListener
    public void onMeshLoading(Uri uri) {
        showProgressDialog(R.string.face_blend_loading_models, true);
    }

    @Override // com.sonymobile.scan3d.TextureMovieEncoder2.EncoderListener
    public void onEncoderFinished() {
        DebugLog.d(TAG, "onEncoderFinished()");
        if (this.mSaveState == SaveState.VIDEO) {
            SharingUtil.saveVideo(getContext(), this.mHandler, SharingUtil.TEMP_VIDEO_FILE_NAME);
        }
    }

    @Override // android.os.Handler.Callback
    public boolean handleMessage(Message message) {
        DebugLog.d(TAG, "handleMessage(): " + message.what);
        View view = getView();
        if (view != null) {
            TextView textView = (TextView) view.findViewById(R.id.creating_video);
            textView.setText("");
            textView.setVisibility(4);
        }
        FragmentActivity activity = getActivity();
        boolean z = false;
        if (activity != null) {
            SystemUtils.setCurrentOrientation(activity, false);
        }
        switch (message.what) {
            case 0:
                this.mOpenAlbumIntent = (Intent) message.obj;
                setupViewResultButton();
                showViewResultContainer();
                this.mHandler.postDelayed(createRemoveViewResultContainerRunnable(), 8000L);
                z = true;
                break;
            case 1:
                z = true;
                break;
        }
        this.mSaveState = SaveState.IDLE;
        setToolbarActionVisibility(true);
        return z;
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BlendActionGLFragment, com.sonymobile.scan3d.NativeGLTextureView.TouchListener
    public boolean allowMotion(MotionEvent motionEvent) {
        return this.mSaveState == SaveState.IDLE;
    }

    private void showSaveAs() {
        final View view = getView();
        if (view != null) {
            this.mSaveState = SaveState.WAITING;
            this.mHandler.post(createRemoveViewResultContainerRunnable());
            setSaveAsContainerVisibility(true);
            view.findViewById(R.id.save_as_image).setOnClickListener(view2 -> {
                setSaveAsContainerVisibility(false);
                saveImage();
            });
            view.findViewById(R.id.save_as_video).setOnClickListener(view2 -> {
                ((TextView) view.findViewById(R.id.creating_video)).setText(R.string.face_blend_creating_video);
                setSaveAsContainerVisibility(false);
                saveVideo();
            });
        }
    }

    private void saveImage() {
        DebugLog.d(TAG, "saveImage(): " + this.mSaveState);
        if (this.mSaveState == SaveState.WAITING) {
            this.mSaveState = SaveState.IMAGE;
            SystemUtils.setCurrentOrientation(getActivity(), true);
            this.mViewResultContainer.setVisibility(4);
            this.mHandler.removeCallbacksAndMessages(null);
            SharingUtil.saveImage(getContext(), this.mHandler, this.mGLTextureView.getBitmap());
            setToolbarActionVisibility(false);
        }
    }

    private void saveVideo() {
        DebugLog.d(TAG, "saveVideo(): " + this.mSaveState);
        if (this.mSaveState == SaveState.WAITING) {
            this.mSaveState = SaveState.VIDEO;
            SystemUtils.setCurrentOrientation(getActivity(), true);
            this.mViewResultContainer.setVisibility(4);
            this.mHandler.removeCallbacksAndMessages(null);
            this.mGLTextureView.startEncoder(new File(getContext().getFilesDir(), SharingUtil.TEMP_VIDEO_FILE_NAME), this, SystemUtils.getDisplayRefreshNsec(getActivity()));
            this.mTextureProgress = this.mBottomBar.textureContainer.seekbar.getProgress();
            this.mMeshProgress = this.mBottomBar.meshContainer.seekbar.getProgress();
            this.mSeekBarTimer = new SeekBarTimer(Math.max(this.mTextureProgress, this.mMeshProgress));
            this.mSeekBarTimer.start();
            setToolbarActionVisibility(false);
        }
    }

    private void setupBottomBar(LayoutInflater layoutInflater, ViewGroup viewGroup) {
        this.mBottomBar = ComponentFaceblendBottomBarBinding.inflate(layoutInflater, viewGroup, true);
        this.mBottomBar.textureContainer.seekbar.setId(1);
        this.mBottomBar.meshContainer.seekbar.setId(2);
        this.mBottomBar.textureContainer.seekbar.setContentDescription(getString(R.string.accessibility_texture_slider));
        this.mBottomBar.meshContainer.seekbar.setContentDescription(getString(R.string.accessibility_mesh_slider));
        this.mBottomBar.textureContainer.seekbar.setProgress((int) (((double) this.mBottomBar.textureContainer.seekbar.getMax()) * 0.5d));
        this.mBottomBar.meshContainer.seekbar.setProgress((int) (((double) this.mBottomBar.meshContainer.seekbar.getMax()) * 0.5d));
        this.mBottomBar.textureContainer.seekbar.setOnSeekBarChangeListener(this.mSeekBarListener);
        this.mBottomBar.meshContainer.seekbar.setOnSeekBarChangeListener(this.mSeekBarListener);
    }

    private void setupViewResultButton() {
        ((Button) this.mViewResultContainer.findViewById(R.id.view_result)).setOnClickListener((UserInputReducer.InputReducer) view -> {
            this.mHandler.removeCallbacksAndMessages(null);
            this.mViewResultContainer.setVisibility(4);
            Intent intent = this.mOpenAlbumIntent;
            if (intent != null) {
                startActivity(intent);
            }
            this.mOpenAlbumIntent = null;
        });
    }

    private void setupViewPermissionsButton() {
        ((Button) this.mPermissionsContainer.findViewById(R.id.permissions_button)).setOnClickListener((UserInputReducer.InputReducer) view -> {
            this.mPermissionsContainer.setVisibility(4);
            String[] permissions = PermissionUtil.Permissions.STORAGE.getPermissions();
            if (PermissionUtil.shouldShowRequestPermissionRationale(getActivity(), permissions)) {
                requestPermissions(permissions, PermissionUtil.Permissions.STORAGE.getRequestCode());
            } else {
                PermissionUtil.startAppSettings(getContext());
            }
        });
    }

    private void interruptOngoingSave() {
        this.mSaveState = SaveState.IDLE;
        SeekBarTimer seekBarTimer = this.mSeekBarTimer;
        if (seekBarTimer != null) {
            seekBarTimer.cancel();
        }
        this.mOpenAlbumIntent = null;
        if (getView() != null) {
            getView().findViewById(R.id.save_progress).setVisibility(8);
            getView().findViewById(R.id.creating_video).setVisibility(8);
        }
        this.mGLTextureView.stopEncoder();
        setToolbarActionVisibility(true);
        this.mBottomBar.textureContainer.seekbar.setProgress(this.mTextureProgress);
        this.mBottomBar.meshContainer.seekbar.setProgress(this.mMeshProgress);
        SystemUtils.setCurrentOrientation(getActivity(), false);
    }

    @NonNull
    private Runnable createRemoveViewResultContainerRunnable() {
        return () -> {
            this.mOpenAlbumIntent = null;
            if (getView() == null || this.mViewResultContainer.getVisibility() != 0) {
                return;
            }
            TranslateAnimation translateAnimation = new TranslateAnimation(0.0f, 0.0f, 0.0f, this.mViewResultContainer.getHeight());
            translateAnimation.setDuration(400L);
            this.mViewResultContainer.startAnimation(translateAnimation);
            this.mViewResultContainer.setVisibility(4);
        };
    }

    private void showViewResultContainer() {
        if (getView() == null || this.mViewResultContainer.getVisibility() != 4) {
            return;
        }
        TextView textView = (TextView) getView().findViewById(R.id.view_result_text);
        if (this.mSaveState == SaveState.VIDEO) {
            textView.setText(R.string.face_blend_video_created);
        } else if (this.mSaveState == SaveState.IMAGE) {
            textView.setText(R.string.face_blend_image_created);
        }
        TranslateAnimation translateAnimation = new TranslateAnimation(0.0f, 0.0f, this.mViewResultContainer.getHeight(), 0.0f);
        translateAnimation.setDuration(400L);
        this.mViewResultContainer.startAnimation(translateAnimation);
        this.mViewResultContainer.setVisibility(0);
    }

    private void setSaveAsContainerVisibility(final boolean z) {
        if (getView() == null || !z) {
            if (this.mSaveAsContainer.getVisibility() != 0) {
                return;
            }
        } else if (this.mSaveAsContainer.getVisibility() != 4) {
            return;
        }
        TranslateAnimation translateAnimation = new TranslateAnimation(0.0f, 0.0f, z ? this.mSaveAsContainer.getHeight() : 0, z ? 0 : this.mSaveAsContainer.getHeight());
        translateAnimation.setAnimationListener(new Animation.AnimationListener() { // from class: com.sonymobile.scan3d.viewer.fragments.FaceBlendFragment.2
            @Override // android.view.animation.Animation.AnimationListener
            public void onAnimationRepeat(Animation animation) {
            }

            @Override // android.view.animation.Animation.AnimationListener
            public void onAnimationStart(Animation animation) {
                if (z || FaceBlendFragment.this.getView() == null || FaceBlendFragment.this.mSaveState != SaveState.IDLE) {
                    return;
                }
                FaceBlendFragment.this.getView().findViewById(R.id.creating_video).setVisibility(4);
            }

            @Override // android.view.animation.Animation.AnimationListener
            public void onAnimationEnd(Animation animation) {
                if (!z || FaceBlendFragment.this.getView() == null) {
                    return;
                }
                FaceBlendFragment.this.getView().findViewById(R.id.creating_video).setVisibility(0);
            }
        });
        translateAnimation.setDuration(400L);
        this.mSaveAsContainer.startAnimation(translateAnimation);
        this.mSaveAsContainer.setVisibility(z ? 0 : 4);
    }

    private void setViewRatio(boolean z) {
        if (this.mSaveState != SaveState.IDLE) {
            return;
        }
        DisplayMetrics displayMetrics = getResources().getDisplayMetrics();
        ViewGroup.LayoutParams layoutParams = this.mGLTextureView.getLayoutParams();
        layoutParams.width = Math.min(displayMetrics.widthPixels, displayMetrics.heightPixels);
        layoutParams.height = z ? layoutParams.width : (layoutParams.width * 4) / 3;
        this.mIsSquare = z;
        if (this.mShowRatioControls) {
            if (z) {
                this.mSquareButton.setBackgroundResource(R.drawable.button_bracket);
                this.mOblongButton.setBackgroundColor(getContext().getColor(R.color.transparent));
            } else {
                this.mOblongButton.setBackgroundResource(R.drawable.button_bracket);
                this.mSquareButton.setBackgroundColor(getContext().getColor(R.color.transparent));
            }
        }
        this.mGLTextureView.requestLayout();
    }

    @NonNull
    private Runnable createRemovePermissionsContainerRunnable() {
        return () -> {
            if (getView() != null) {
                View viewFindViewById = getView().findViewById(R.id.permissions_container);
                TranslateAnimation translateAnimation = new TranslateAnimation(0.0f, 0.0f, 0.0f, viewFindViewById.getHeight());
                translateAnimation.setDuration(400L);
                viewFindViewById.startAnimation(translateAnimation);
                viewFindViewById.setVisibility(4);
            }
        };
    }
}
