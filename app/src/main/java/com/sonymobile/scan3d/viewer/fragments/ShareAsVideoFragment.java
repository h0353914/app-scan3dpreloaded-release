package com.sonymobile.scan3d.viewer.fragments;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.view.View;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;
import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.SimpleLifecycle;
import com.sonymobile.scan3d.TextureMovieEncoder2;
import com.sonymobile.scan3d.storageservice.authentication.Vault;
import com.sonymobile.scan3d.utils.SharingUtil;
import com.sonymobile.scan3d.utils.SystemUtils;
import com.sonymobile.scan3d.viewer.SphanGLTextureView;
import com.sonymobile.scan3d.viewer.sharing.Shareable;
import com.sonymobile.scan3d.viewer.sharing.SharingFragment;
import java.io.File;

/* JADX INFO: loaded from: classes2.dex */
public class ShareAsVideoFragment extends BaseAnimationFragment implements TextureMovieEncoder2.EncoderListener, Handler.Callback {
    private static final String CAMERA_NAME = "video_share";
    private static final long FRAME_PERIOD_NS = 33333333;
    private static final String KEY_IS_PROP = "is_prop";
    private static final String KEY_SHAREABLE = "extra_shareable";
    private ProgressBar mProgress;
    private Handler mHandler = new Handler(this);
    private int mCameraIndex = -1;
    private boolean mPropLoaded = false;
    private BaseViewerFragment.BackgroundTaskState mBackgroundTaskState = BaseViewerFragment.BackgroundTaskState.IDLE;

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
    public int getContentLayout() {
        return R.layout.share_as_video_fragment;
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseAnimationFragment
    public int getTextureViewId() {
        return R.id.glTextureView;
    }

    public static Fragment newInstance(Shareable shareable) {
        ShareAsVideoFragment shareAsVideoFragment = new ShareAsVideoFragment();
        Bundle bundle = new Bundle();
        bundle.putBundle(KEY_SHAREABLE, shareable.toBundle());
        bundle.putBoolean(KEY_IS_PROP, shareable.getShareType() == Shareable.Type.PROPS);
        shareAsVideoFragment.setArguments(bundle);
        return shareAsVideoFragment;
    }

    @Override // androidx.fragment.app.Fragment
    public void onViewCreated(@NonNull View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        this.mTextureView.queueEvent(() -> {
            if (this.mSphanRenderer != null) {
                Bundle arguments = getArguments();
                if (arguments != null && arguments.getBoolean(KEY_IS_PROP)) {
                    this.mSphanRenderer.setBackground(0);
                    this.mSphanRenderer.setMeshVisible(0, false);
                    this.mSphanRenderer.setMeshVisible(1, false);
                    return;
                }
                this.mSphanRenderer.showStaticMesh();
            }
        });
        view.findViewById(R.id.toolbar).setVisibility(8);
        this.mProgress = (ProgressBar) view.findViewById(R.id.share_video_progress_bar);
        this.mProgress.setProgress(0);
        TextView textView = (TextView) view.findViewById(R.id.share_video_text_view);
        textView.setText(R.string.video_creating);
        textView.setVisibility(0);
        SystemUtils.setCurrentOrientation(getActivity(), true);
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseAnimationFragment, com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, com.sonymobile.scan3d.OnBackPressListener
    public boolean onBackPressed() {
        getActivity().getSupportFragmentManager().popBackStack();
        if (this.mProgress == null || this.mTextureView == null) {
            return true;
        }
        this.mProgress.setVisibility(8);
        resetSphanRenderer();
        this.mTextureView.stopEncoder();
        return true;
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseAnimationFragment, com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, androidx.fragment.app.Fragment
    public void onPause() {
        super.onPause();
        this.mHandler.removeCallbacksAndMessages(null);
    }

    @Override // androidx.fragment.app.Fragment
    public void onDetach() {
        super.onDetach();
        if (this.mMeshHolderFragment != null) {
            resetSphanRenderer();
        }
        SystemUtils.setCurrentOrientation(getActivity(), false);
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseAnimationFragment, com.sonymobile.scan3d.SimpleLifecycle.SimpleLifecycleObserver
    public void onStart(SimpleLifecycle.SimpleLifecycleOwner simpleLifecycleOwner) {
        this.mSphanRenderer.setBackground(1);
        this.mSphanRenderer.setPlainShading(false);
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseAnimationFragment, com.sonymobile.scan3d.SimpleLifecycle.SimpleLifecycleObserver
    public void onStop(SimpleLifecycle.SimpleLifecycleOwner simpleLifecycleOwner) {
        if (this.mCameraIndex != -1) {
            this.mSphanRenderer.unload(this.mCameraIndex);
        }
        if (this.mPropLoaded) {
            this.mSphanRenderer.unload(-1);
            if (this.mSphanRenderer.setMeshVisible(1, true)) {
                return;
            }
            this.mSphanRenderer.setMeshVisible(0, true);
        }
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseAnimationFragment
    public void onMeshesLoadedIntoSphan(boolean z, boolean z2) {
        Bundle arguments = getArguments();
        if (arguments != null && arguments.getBoolean(KEY_IS_PROP)) {
            loadProp(new Shareable(arguments.getBundle(KEY_SHAREABLE)).getUrl());
        }
        loadCameraAnimation();
    }

    private void loadProp(final String str) {
        if (this.mPropLoaded) {
            return;
        }
        this.mTextureView.queueEvent(() -> {
            if (this.mSphanRenderer != null) {
                this.mPropLoaded = this.mSphanRenderer.load(str, Vault.getPassword(getContext()));
            }
        });
    }

    private void loadCameraAnimation() {
        this.mTextureView.queueEvent(() -> {
            if (this.mCameraIndex != -1 || this.mSphanRenderer == null) {
                return;
            }
            this.mCameraIndex = this.mSphanRenderer.loadContent("res:data/cam_animation.glb", Vault.getPassword(getContext()), false);
            this.mHandler.post(() -> onCameraAnimationLoaded());
        });
    }

    private void onCameraAnimationLoaded() {
        this.mTextureView.queueEvent(() -> {
            if (this.mCameraIndex == -1) {
                return;
            }
            this.mBackgroundTaskState = BaseViewerFragment.BackgroundTaskState.RUNNING;
            this.mTextureView.startEncoder(new File(getContext().getFilesDir(), SharingUtil.TEMP_VIDEO_FILE_NAME), this, -33333333L);
            this.mSphanRenderer.setCamera(this.mCameraIndex, CAMERA_NAME);
            this.mSphanRenderer.setPostProcShading(true);
            this.mSphanRenderer.startAnimationNoWarmup(this.mCameraIndex, 0);
            this.mTextureView.requestRender();
            this.mProgress.setMax((int) (this.mSphanRenderer.getAnimationDuration(this.mCameraIndex, 0) * 1000.0f));
            this.mTextureView.setAnimationListener(new SphanGLTextureView.AnimationListener() {
                @Override // com.sonymobile.scan3d.viewer.SphanGLTextureView.AnimationListener
                public void onAnimationStopped() {
                }

                @Override // com.sonymobile.scan3d.viewer.SphanGLTextureView.AnimationListener
                public void onAnimationTime(final float f) {
                    ShareAsVideoFragment.this.mHandler.post(() -> ShareAsVideoFragment.this.mProgress.setProgress((int) (f * 1000.0f)));
                }

                @Override // com.sonymobile.scan3d.viewer.SphanGLTextureView.AnimationListener
                public void onAnimationStopped(int i) {
                    if (i == ShareAsVideoFragment.this.mCameraIndex) {
                        ShareAsVideoFragment.this.mTextureView.stopEncoder();
                        ShareAsVideoFragment.this.mSphanRenderer.resetCamera();
                    }
                }
            }, true);
        });
    }

    @Override // com.sonymobile.scan3d.TextureMovieEncoder2.EncoderListener
    public void onEncoderFinished() {
        if (isAdded()) {
            SharingUtil.saveVideo(getContext(), this.mHandler, SharingUtil.TEMP_VIDEO_FILE_NAME);
            resetSphanRenderer();
        }
    }

    @Override // android.os.Handler.Callback
    public boolean handleMessage(Message message) {
        switch (message.what) {
            case 0:
                this.mBackgroundTaskState = BaseViewerFragment.BackgroundTaskState.FINISHED;
                startActivity((Intent) message.obj);
                getFragmentManager().popBackStackImmediate(SharingFragment.class.getName(), 1);
                SystemUtils.setCurrentOrientation(getActivity(), false);
                return true;
            case 1:
                this.mBackgroundTaskState = BaseViewerFragment.BackgroundTaskState.FINISHED;
                Toast.makeText(getContext(), R.string.failed_creating_video, 1).show();
                SystemUtils.setCurrentOrientation(getActivity(), false);
                return true;
            default:
                return false;
        }
    }

    private void resetSphanRenderer() {
        this.mTextureView.queueEvent(() -> {
            if (this.mSphanRenderer != null) {
                this.mSphanRenderer.setPostProcShading(false);
                this.mSphanRenderer.resetCamera();
                this.mSphanRenderer.resetView();
                this.mSphanRenderer.unload(this.mCameraIndex);
                if (this.mPropLoaded) {
                    this.mSphanRenderer.unload(-1);
                    this.mPropLoaded = false;
                }
                this.mCameraIndex = -1;
                this.mTextureView.removeAnimationListener();
            }
        });
    }
}
