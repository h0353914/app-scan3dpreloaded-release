package com.sonymobile.scan3d.viewer.fragments;

import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import com.sonymobile.scan3d.NativeGLTextureView;
import com.sonymobile.scan3d.SimpleLifecycle;
import com.sonymobile.scan3d.animation.ObjToGltfConverter;
import com.sonymobile.scan3d.animation.RigModelManager;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.viewer.MeshHolderFragment;
import com.sonymobile.scan3d.viewer.SphanGLTextureView;
import com.sonymobile.scan3d.viewer.SphanRenderer;

public abstract class BaseAnimationFragment extends BaseViewerFragment implements ObjToGltfConverter.GltfConversionListener, NativeGLTextureView.TouchListener, SimpleLifecycle.SimpleLifecycleObserver {
    private static final String KEY_USE_UNTEXTUREDSHADING = "use_untexturedshading";
    private static final String KEY_VIEW_MATRIX = "view_matrix";
    Handler mHandler = new Handler(Looper.getMainLooper());
    MeshHolderFragment mMeshHolderFragment;
    SphanRenderer mSphanRenderer;
    SphanGLTextureView mTextureView;
    boolean mUseUntexturedShading;
    float[] mViewMatrix;

    @Override // com.sonymobile.scan3d.NativeGLTextureView.TouchListener
    public boolean allowMotion(MotionEvent motionEvent) {
        return true;
    }

    public abstract int getTextureViewId();

    public void onConversionFailed(Uri uri) {
    }

    public abstract void onMeshesLoadedIntoSphan(boolean z, boolean z2);

    @Override // com.sonymobile.scan3d.SimpleLifecycle.SimpleLifecycleObserver
    public void onStop(SimpleLifecycle.SimpleLifecycleOwner simpleLifecycleOwner) {
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View view = super.onCreateView(layoutInflater, viewGroup, bundle);
        if (bundle != null) {
            this.mViewMatrix = bundle.getFloatArray(KEY_VIEW_MATRIX);
            this.mUseUntexturedShading = bundle.getBoolean(KEY_USE_UNTEXTUREDSHADING);
        }
        this.mMeshHolderFragment = MeshHolderFragment.getInstance(getActivity());
        this.mTextureView = (SphanGLTextureView) view.findViewById(getTextureViewId());
        this.mSphanRenderer = this.mMeshHolderFragment.createSphanRenderer(getContext());
        this.mSphanRenderer.getLifecycle().addObserver(this);
        this.mSphanRenderer.acquire();
        this.mSphanRenderer.getLifecycle().onStart(this.mSphanRenderer);
        this.mTextureView.start(this.mSphanRenderer, () -> {
            this.mSphanRenderer.getLifecycle().onStop(this.mSphanRenderer);
            this.mSphanRenderer.getLifecycle().removeObserver(this);
            this.mSphanRenderer.release();
            this.mSphanRenderer = null;
        });
        return view;
    }

    @Override // com.sonymobile.scan3d.SimpleLifecycle.SimpleLifecycleObserver
    public void onStart(SimpleLifecycle.SimpleLifecycleOwner simpleLifecycleOwner) {
        this.mSphanRenderer.setBackground(1);
        this.mSphanRenderer.setPlainShading(false);
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, androidx.fragment.app.Fragment
    public void onResume() {
        Uri uri;
        super.onResume();
        RigModelManager rigModelManager = RigModelManager.getInstance();
        IFileSet fileSet = this.mMeshHolderFragment.getFileSet();
        if (fileSet != null && (uri = fileSet.getUri()) != null && rigModelManager.isRigging(uri)) {
            rigModelManager.addListener(uri, this);
        }
        loadMeshes();
        this.mTextureView.onResume();
        this.mTextureView.setTouchListener(this);
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, androidx.fragment.app.Fragment
    public void onPause() {
        SphanRenderer sphanRenderer = this.mSphanRenderer;
        if (sphanRenderer != null) {
            this.mViewMatrix = sphanRenderer.getViewMatrix();
        }
        this.mTextureView.setTouchListener(null);
        this.mTextureView.onPause();
        super.onPause();
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, com.sonymobile.scan3d.OnBackPressListener
    public boolean onBackPressed() {
        MeshHolderFragment meshHolderFragment = this.mMeshHolderFragment;
        if (meshHolderFragment != null && meshHolderFragment.getFileSet() != null) {
            Uri uri = this.mMeshHolderFragment.getFileSet().getUri();
            RigModelManager rigModelManager = RigModelManager.getInstance();
            if (uri != null && rigModelManager.isRigging(uri)) {
                rigModelManager.removeListener(uri, this);
            }
        }
        return super.onBackPressed();
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, androidx.fragment.app.Fragment
    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        float[] fArr = this.mViewMatrix;
        if (fArr != null) {
            bundle.putFloatArray(KEY_VIEW_MATRIX, fArr);
        }
        bundle.putBoolean(KEY_USE_UNTEXTUREDSHADING, this.mUseUntexturedShading);
    }

    @Override // com.sonymobile.scan3d.NativeGLTextureView.TouchListener
    public void onSingleTouch() {
        if (requiresFullScreen()) {
            showControls(!isFullScreen());
        }
    }

    public void onConversionDone(Uri uri) {
        this.mTextureView.queueEvent(() -> {
            boolean loaded = this.mMeshHolderFragment.loadRiggedMesh() == MeshHolderFragment.LoadRiggedMeshState.LOADED;
            if (loaded) {
                this.mSphanRenderer.stopEffect();
            }
            this.mSphanRenderer.setUntexturedShading(this.mUseUntexturedShading);
            this.mHandler.post(() -> {
                if (!isVisible() || getContext() == null) {
                    return;
                }
                onMeshesLoadedIntoSphan(true, loaded);
            });
        });
    }

    private void loadMeshes() {
        this.mTextureView.queueEvent(() -> {
            this.mSphanRenderer.setUntexturedShading(this.mUseUntexturedShading);
            this.mSphanRenderer.stopFling();
            float[] fArr = this.mViewMatrix;
            if (fArr != null) {
                this.mSphanRenderer.setViewMatrix(fArr, 0);
            } else {
                this.mSphanRenderer.resetView();
            }
            switch (this.mSphanRenderer.getMeshCount()) {
                case 0:
                    if (this.mMeshHolderFragment.loadMeshIntoSphan()) {
                        loadRiggedMesh();
                    } else {
                        this.mHandler.post(() -> onMeshesLoadedIntoSphan(false, false));
                    }
                    break;
                case 1:
                    if (this.mMeshHolderFragment.getFileSet().isRiggable()) {
                        loadRiggedMesh();
                    }
                    break;
                default:
                    this.mHandler.post(() -> onMeshesLoadedIntoSphan(true, this.mSphanRenderer.getMeshCount() >= 2));
                    break;
            }
        });
    }

    private void loadRiggedMesh() {
        switch (this.mMeshHolderFragment.loadRiggedMesh()) {
            case LOADED:
                this.mHandler.post(() -> onMeshesLoadedIntoSphan(true, true));
                break;
            case NOT_LOADED:
            case FAILED:
                this.mHandler.post(() -> onMeshesLoadedIntoSphan(true, false));
                break;
        }
    }
}
