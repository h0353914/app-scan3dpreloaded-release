package com.sonymobile.scan3d.viewer.fragments;

import android.net.Uri;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.PopupMenu;
import com.sonymobile.scan3d.NativeGLTextureView;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.ScenoID;
import com.sonymobile.scan3d.viewer.BlenderGLTextureView;
import com.sonymobile.scan3d.viewer.FaceBlender;
import com.sonymobile.scan3d.viewer.MeshHolderFragment;
import com.sonymobile.scan3d.viewer.ModelContainer;

/* JADX INFO: loaded from: classes2.dex */
abstract class BlendActionGLFragment extends BaseViewerFragment implements PopupMenu.OnMenuItemClickListener, MeshHolderFragment.MeshLoadingListener, NativeGLTextureView.TouchListener {
    protected static final String KEY_FIRST_URI = "first_uri";
    protected static final float VIEW_Y_DELTA = 0.2f;
    protected BlenderGLTextureView mGLTextureView;
    protected MeshHolderFragment mMeshHolderFragment;

    @Override // com.sonymobile.scan3d.NativeGLTextureView.TouchListener
    public boolean allowMotion(MotionEvent motionEvent) {
        return true;
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
    public int getContentLayout() {
        return R.layout.fragment_action_gl_base_layout;
    }

    int getMenuResourceId() {
        return -1;
    }

    @Override // android.widget.PopupMenu.OnMenuItemClickListener
    public boolean onMenuItemClick(MenuItem menuItem) {
        return true;
    }

    void onPrepareMenu(Menu menu) {
    }

    BlendActionGLFragment() {
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, androidx.fragment.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View viewOnCreateView = super.onCreateView(layoutInflater, viewGroup, bundle);
        this.mGLTextureView = (BlenderGLTextureView) viewOnCreateView.findViewById(R.id.glTextureView);
        Uri uri = (Uri) getArguments().getParcelable(KEY_FIRST_URI);
        if (uri != null) {
            this.mMeshHolderFragment = MeshHolderFragment.getInstance(getActivity(), uri);
        } else {
            this.mMeshHolderFragment = MeshHolderFragment.getInstance(getActivity());
        }
        this.mMeshHolderFragment.setMeshLoadingListener(this);
        this.mGLTextureView.start(this.mMeshHolderFragment.createOrGetFaceBlender(), ScenoID.SCENO_TEXTURED);
        return viewOnCreateView;
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, androidx.fragment.app.Fragment
    public void onResume() {
        super.onResume();
        this.mGLTextureView.onResume();
        this.mGLTextureView.setTouchListener(this);
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, androidx.fragment.app.Fragment
    public void onPause() {
        this.mGLTextureView.setTouchListener(null);
        this.mGLTextureView.onPause();
        this.mActivityInterface.unregisterOnBackPressListener(this);
        super.onPause();
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, androidx.fragment.app.Fragment
    public void onDestroy() {
        super.onDestroy();
    }

    FaceBlender getFaceBlender() {
        return this.mMeshHolderFragment.createOrGetFaceBlender();
    }

    void requestRenderGLTextureView() {
        if (this.mGLTextureView.isAttachedToWindow()) {
            this.mGLTextureView.requestRender();
        }
    }

    public void queueGlEvent(Runnable runnable) {
        getFaceBlender().queueOnRender(runnable);
    }

    @Override // com.sonymobile.scan3d.viewer.MeshHolderFragment.MeshLoadingListener
    public void onMeshLoaded(Uri uri, ModelContainer modelContainer) {
        if (isAdded()) {
            getActivity().reportFullyDrawn();
        }
    }

    @Override // com.sonymobile.scan3d.viewer.MeshHolderFragment.MeshLoadingListener
    public void onMeshLoadFailed(Uri uri) {
        handleFailedMesh();
    }

    @Override // com.sonymobile.scan3d.viewer.MeshHolderFragment.MeshLoadingListener
    public void onMeshLoading(Uri uri) {
        showProgressDialog(R.string.saving_print_geometry, false);
    }

    @Override // com.sonymobile.scan3d.NativeGLTextureView.TouchListener
    public void onSingleTouch() {
        if (requiresFullScreen()) {
            showControls(!isFullScreen());
        }
    }
}
