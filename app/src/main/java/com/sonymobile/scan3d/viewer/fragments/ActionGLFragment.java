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
import android.widget.ToggleButton;
import com.sonymobile.scan3d.NativeGLTextureView;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.ScenoID;
import com.sonymobile.scan3d.utils.UserInputReducer;
import com.sonymobile.scan3d.viewer.MeshHolderFragment;
import com.sonymobile.scan3d.viewer.MeshRenderer;
import com.sonymobile.scan3d.viewer.ModelContainer;
import com.sonymobile.scan3d.viewer.ViewerGLTextureView;

/* JADX INFO: loaded from: classes2.dex */
abstract class ActionGLFragment extends BaseViewerFragment implements PopupMenu.OnMenuItemClickListener, MeshHolderFragment.MeshLoadingListener, NativeGLTextureView.TouchListener {
    protected static final float VIEW_Y_DELTA = 0.2f;
    private ViewerGLTextureView mGLTextureView;
    MeshHolderFragment mMeshHolderFragment;
    ModelContainer mModelContainer;
    private PopupMenu mPopupMenu;
    private MeshRenderer mRenderer;

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

    void setupBottomBar(LayoutInflater layoutInflater, ViewGroup viewGroup) {
    }

    ActionGLFragment() {
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, androidx.fragment.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mRenderer = new MeshRenderer();
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        final int menuResourceId;
        View viewOnCreateView = super.onCreateView(layoutInflater, viewGroup, bundle);
        this.mGLTextureView = (ViewerGLTextureView) viewOnCreateView.findViewById(R.id.glTextureView);
        this.mMeshHolderFragment = MeshHolderFragment.getInstance(getActivity());
        this.mMeshHolderFragment.setMeshLoadingListener(this);
        this.mGLTextureView.start(this.mRenderer, ScenoID.SCENO_TEXTURED);
        ViewGroup viewGroup2 = (ViewGroup) viewOnCreateView.findViewById(R.id.bottom_bar);
        if (viewGroup2 != null) {
            setupBottomBar(layoutInflater, viewGroup2);
        }
        final ToggleButton toggleButton = (ToggleButton) viewOnCreateView.findViewById(R.id.texture_knob);
        if (toggleButton != null) {
            viewOnCreateView.findViewById(R.id.texture_knob_parent).setOnClickListener((UserInputReducer.InputReducer) view -> {
                toggleButton.setChecked(!toggleButton.isChecked());
                ScenoID scenoID = toggleButton.isChecked() ? ScenoID.SCENO_SOLID : ScenoID.SCENO_TEXTURED;
                this.mMeshHolderFragment.setScenography(scenoID);
                onScenographyChanged(scenoID);
            });
        }
        View viewFindViewById = viewOnCreateView.findViewById(R.id.overflow_menu_parent);
        if (viewFindViewById != null && (menuResourceId = getMenuResourceId()) != -1) {
            viewFindViewById.setOnClickListener((UserInputReducer.InputReducer) view -> {
                this.mPopupMenu = new PopupMenu(view.getContext(), view);
                this.mPopupMenu.getMenuInflater().inflate(menuResourceId, this.mPopupMenu.getMenu());
                this.mPopupMenu.setOnMenuItemClickListener(this);
                onPrepareMenu(this.mPopupMenu.getMenu());
                this.mPopupMenu.show();
            });
        }
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
        this.mGLTextureView.onStopFling();
        this.mGLTextureView.setTouchListener(null);
        this.mGLTextureView.onPause();
        this.mActivityInterface.unregisterOnBackPressListener(this);
        super.onPause();
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, androidx.fragment.app.Fragment
    public void onDestroy() {
        this.mRenderer.release();
        this.mRenderer = null;
        super.onDestroy();
    }

    MeshRenderer getRenderer() {
        return this.mRenderer;
    }

    void requestRenderGLTextureView() {
        if (this.mGLTextureView.isAttachedToWindow()) {
            this.mGLTextureView.requestRender();
        }
    }

    @Override // com.sonymobile.scan3d.viewer.MeshHolderFragment.MeshLoadingListener
    public void onMeshLoaded(Uri uri, ModelContainer modelContainer) {
        if (isAdded()) {
            this.mModelContainer = modelContainer;
            ToggleButton toggleButton = (ToggleButton) getView().findViewById(R.id.texture_knob);
            this.mGLTextureView.setScenography(this.mMeshHolderFragment.getScenography());
            if (toggleButton != null) {
                toggleButton.setChecked(this.mMeshHolderFragment.getScenography() == ScenoID.SCENO_SOLID);
            }
            getActivity().reportFullyDrawn();
        }
    }

    @Override // com.sonymobile.scan3d.viewer.MeshHolderFragment.MeshLoadingListener
    public void onMeshLoadFailed(Uri uri) {
        handleFailedMesh();
    }

    @Override // com.sonymobile.scan3d.viewer.MeshHolderFragment.MeshLoadingListener
    public void onMeshLoading(Uri uri) {
        showProgressDialog(R.string.saving_print_geometry, true);
    }

    @Override // com.sonymobile.scan3d.NativeGLTextureView.TouchListener
    public void onSingleTouch() {
        if (requiresFullScreen()) {
            showControls(!isFullScreen());
        }
    }

    public void onScenographyChanged(ScenoID scenoID) {
        this.mGLTextureView.setScenography(scenoID);
    }
}
