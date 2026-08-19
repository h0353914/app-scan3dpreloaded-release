package com.sonymobile.scan3d.viewer.fragments;

import android.content.ContentValues;
import android.os.Bundle;
import android.os.Handler;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentTransaction;
import com.sonymobile.scan3d.PropResources;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.SimpleLifecycle;
import com.sonymobile.scan3d.ZipResourceManager;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.authentication.Vault;
import com.sonymobile.scan3d.storageservice.provider.Contract;
import com.sonymobile.scan3d.storageservice.provider.FileTasks;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.storageservice.utils.FsUtils;
import com.sonymobile.scan3d.utils.UserInputReducer;
import com.sonymobile.scan3d.viewer.SphanGLTextureView;
import com.sonymobile.scan3d.viewer.fragments.utils.ViewerUtils;
import com.sonymobile.scan3d.viewer.sharing.Shareable;
import com.sonymobile.scan3d.viewer.sharing.SharingFragment;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class PropsFragment extends BaseAnimationFragment implements UserInputReducer.InputReducer {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private static final String KEY_INIT_MESHES = "init_meshes";
    private static final String KEY_PROP_ID = "prop_id";
    private static final String KEY_SELECTED_PROP = "selected_prop";
    private static final String PROP_IDLE_ANIMATION = "PropIdle";
    private static final String SHARE_FILE_NAME = "prop_mesh.glb.zip";
    private int mInitialMeshVisible;
    private int mInitialMeshes;
    private final String TAG = PropsFragment.class.getSimpleName();
    private final int UNLOAD_LAST_PROP = -1;
    private final int NO_PROP_LOADED = -1;
    private final int UNLOAD_NO_PROP = -2;
    private final int LOAD_NO_PROP = -3;
    private int mSelectedProp = -1;
    private int mPropId = -1;
    private boolean mIsPaused = false;

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
    public int getContentLayout() {
        return R.layout.fragment_props;
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
    public int getNavigationDrawable() {
        return R.drawable.ic_close_24dp;
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseAnimationFragment
    public int getTextureViewId() {
        return R.id.glTextureView;
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
    protected int getTitleId() {
        return R.string.share_props_title;
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
    protected int getToolBarActionText() {
        return R.string.action_share_button;
    }

    public static Fragment newInstance() {
        PropsFragment propsFragment = new PropsFragment();
        propsFragment.setArguments(new Bundle());
        return propsFragment;
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseAnimationFragment, com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View viewOnCreateView = super.onCreateView(layoutInflater, viewGroup, bundle);
        showProgressDialog(R.string.saving_print_geometry, true);
        if (bundle != null) {
            this.mSelectedProp = bundle.getInt(KEY_SELECTED_PROP);
            this.mInitialMeshes = bundle.getInt(KEY_INIT_MESHES);
        }
        if (bundle == null && this.mSphanRenderer != null) {
            this.mInitialMeshes = this.mSphanRenderer.getMeshCount();
            if (this.mInitialMeshes > 1) {
                if (this.mSphanRenderer.isMeshVisible(1)) {
                    this.mInitialMeshVisible = 1;
                } else {
                    this.mInitialMeshVisible = 0;
                }
            }
        }
        enableShareButton(viewOnCreateView, this.mSelectedProp != -1);
        setupBottomBar(layoutInflater, (ViewGroup) viewOnCreateView.findViewById(R.id.list));
        return viewOnCreateView;
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseAnimationFragment, com.sonymobile.scan3d.SimpleLifecycle.SimpleLifecycleObserver
    public void onStart(SimpleLifecycle.SimpleLifecycleOwner simpleLifecycleOwner) {
        this.mSphanRenderer.setBackground(0);
        this.mSphanRenderer.setPlainShading(false);
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseAnimationFragment, com.sonymobile.scan3d.SimpleLifecycle.SimpleLifecycleObserver
    public void onStop(SimpleLifecycle.SimpleLifecycleOwner simpleLifecycleOwner) {
        this.mSphanRenderer.unloadDownTo(this.mInitialMeshes);
        this.mSphanRenderer.setMeshVisible(this.mInitialMeshVisible, true);
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseAnimationFragment, com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, androidx.fragment.app.Fragment
    public void onResume() {
        this.mIsPaused = false;
        super.onResume();
        if (this.mSphanRenderer == null || this.mViewMatrix == null) {
            return;
        }
        this.mMeshHolderFragment.setViewerViewMatrix(this.mViewMatrix);
        this.mSphanRenderer.setMeshVisible(0, false);
        if (this.mInitialMeshes > 1) {
            this.mSphanRenderer.setMeshVisible(1, false);
        }
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseAnimationFragment, com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, androidx.fragment.app.Fragment
    public void onPause() {
        this.mIsPaused = true;
        if (this.mMeshHolderFragment != null && this.mSphanRenderer != null) {
            this.mTextureView.queueEvent(() -> {
                this.mSphanRenderer.resetView();
                if (this.mSelectedProp == -1 && this.mPropId == -1) {
                    return;
                }
                unloadProp(-1, -3);
            });
        }
        super.onPause();
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseAnimationFragment, com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, androidx.fragment.app.Fragment
    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putInt(KEY_SELECTED_PROP, this.mSelectedProp);
        bundle.putInt(KEY_PROP_ID, this.mPropId);
        bundle.putInt(KEY_INIT_MESHES, this.mInitialMeshes);
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseAnimationFragment
    public void onMeshesLoadedIntoSphan(boolean z, boolean z2) {
        if (this.mIsPaused) {
            return;
        }
        if (z) {
            if (this.mSphanRenderer != null) {
                dismissProgressDialog();
                this.mHandler.post(() -> {
                    setClickable(false);
                    setSelectedProp(this.mSelectedProp);
                });
                loadProp(this.mSelectedProp);
                return;
            }
            return;
        }
        handleFailedMesh();
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
    protected void onActionClick() {
        showProgressDialog(R.string.editor_saving_model_progress, false);
        final Handler handler = new Handler();
        this.mTextureView.queueEvent(() -> {
            IFileSet fileSet = this.mMeshHolderFragment.getFileSet();
            final File shareFile = FsUtils.getShareFile(getContext(), SHARE_FILE_NAME);
            final boolean zExportGlbZip = this.mSphanRenderer.exportGlbZip(shareFile.getPath(), null);
            if (zExportGlbZip) {
                ContentValues contentValues = new ContentValues(1);
                contentValues.put(Contract.FileRecord.COLUMN_PROP_MESH_URL, shareFile.getAbsolutePath());
                getContext().getContentResolver().update(fileSet.getUri(), contentValues, null, null);
            }
            handler.post(() -> {
                dismissProgressDialog();
                if (zExportGlbZip) {
                    openSharingFramework(shareFile);
                }
                FileTasks.scheduleShareFileDeletion(getContext());
            });
        });
    }

    @Override // com.sonymobile.scan3d.utils.UserInputReducer.InputReducer
    public void doClick(View view) {
        enableShareButton(getView(), true);
        if (((Integer) view.getTag()).intValue() == this.mSelectedProp) {
            return;
        }
        setClickable(false);
        setSelectedProp(((Integer) view.getTag()).intValue());
        this.mTextureView.queueEvent(() -> unloadProp(this.mPropId, this.mSelectedProp));
    }

    private void setSelectedProp(int i) {
        this.mSelectedProp = i;
        ViewGroup viewGroup = (ViewGroup) getView().findViewById(R.id.list);
        for (int i2 = 0; i2 < viewGroup.getChildCount(); i2++) {
            View childAt = viewGroup.getChildAt(i2);
            childAt.setSelected(((Integer) childAt.getTag()).intValue() == this.mSelectedProp);
            if (((Integer) childAt.getTag()).intValue() == this.mSelectedProp) {
                viewGroup.requestChildFocus(childAt, childAt);
            }
        }
    }

    private void onPropLoadedIntoSphan(int i) {
        this.mPropId = i;
        this.mHandler.post(() -> setClickable(true));
    }

    private void onPropUnloaded(int i) {
        this.mPropId = -1;
        loadProp(i);
    }

    private void loadProp(int i) {
        if (i == -3) {
            return;
        }
        PropResources propResourcesFromInt = PropResources.fromInt(getContext(), i);
        if (propResourcesFromInt == null) {
            this.mTextureView.queueEvent(() -> {
                this.mSphanRenderer.showStaticMesh();
                this.mTextureView.requestRender();
                onPropLoadedIntoSphan(-2);
            });
        } else {
            loadProp(propResourcesFromInt.getContentPath());
        }
    }

    private void unloadProp(int i, final int i2) {
        if (i > -2 && !this.mSphanRenderer.unload(i)) {
            DebugLog.e(this.TAG, "Failed to unload PropId " + i);
        }
        this.mHandler.post(() -> onPropUnloaded(i2));
    }

    private void loadProp(final String str) {
        this.mTextureView.queueEvent(() -> {
            int iLoadContent;
            String password = Vault.getPassword(getContext());
            String str2 = ZipResourceManager.getInstance().EXPANSION_FILE_PATH;
            if (ZipResourceManager.usingOBB()) {
                iLoadContent = this.mSphanRenderer.loadZippedContent(str2, str, password, true);
            } else {
                iLoadContent = this.mSphanRenderer.loadContent("res:expansion/" + str, password, true);
            }
            onPropLoadedIntoSphan(iLoadContent);
            startAnimationPlayback(iLoadContent);
            this.mTextureView.requestRender();
        });
    }

    private void startAnimationPlayback(final int i) {
        if (i >= 0 && this.mSphanRenderer.startNamedAnimation(i, PROP_IDLE_ANIMATION, true)) {
            this.mTextureView.setAnimationListener(() -> {
                this.mSphanRenderer.startNamedAnimation(i, PROP_IDLE_ANIMATION, true);
                this.mTextureView.requestRender();
            });
        } else {
            this.mTextureView.setAnimationListener(null);
        }
    }

    private void setupBottomBar(LayoutInflater layoutInflater, ViewGroup viewGroup) {
        List<View> arrayList = new ArrayList<>();
        int i = 0;
        while (i < PropResources.values().length) {
            PropResources propResourcesFromInt = PropResources.fromInt(getContext(), i);
            if (propResourcesFromInt == null) {
                DebugLog.d(this.TAG, "Did not manage to get prop resource " + i);
            } else {
                View viewInflate = layoutInflater.inflate(R.layout.picker_item_layout, viewGroup, false);
                arrayList.add(viewInflate);
                ((ImageView) viewInflate.findViewById(R.id.picker_item_image)).setImageResource(propResourcesFromInt.getDrawable(getContext()));
                ((TextView) viewInflate.findViewById(R.id.picker_item_text)).setText(propResourcesFromInt.getNameId(getContext()));
                viewInflate.setSelected(this.mSelectedProp == i);
                viewInflate.setTag(Integer.valueOf(i));
                viewInflate.setOnClickListener(this);
                viewInflate.setClickable(true);
                viewGroup.addView(viewInflate);
            }
            i++;
        }
        int adjustedPickerItemMargin = ViewerUtils.getAdjustedPickerItemMargin(getContext(), getResources().getDimension(R.dimen.picker_item_width), arrayList.size());
        for (View view : arrayList) {
            ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) view.getLayoutParams();
            marginLayoutParams.setMargins(adjustedPickerItemMargin, 0, adjustedPickerItemMargin, 0);
            view.setLayoutParams(marginLayoutParams);
        }
    }

    private void setClickable(boolean z) {
        ViewGroup viewGroup;
        View view = getView();
        if (view == null || (viewGroup = (ViewGroup) view.findViewById(R.id.list)) == null) {
            return;
        }
        for (int i = 0; i < viewGroup.getChildCount(); i++) {
            View childAt = viewGroup.getChildAt(i);
            childAt.setClickable(z);
            if (z) {
                childAt.setPressed(false);
            }
        }
    }

    private void openSharingFramework(File file) {
        Shareable shareable = new Shareable();
        shareable.setFileSet(this.mMeshHolderFragment.getFileSet()).setScanFormat(1).setShareType(Shareable.Type.PROPS).setUrl(file.getPath());
        if (this.mSphanRenderer != null) {
            shareable.setViewMatrix(this.mSphanRenderer.getViewMatrix());
        }
        SharingFragment sharingFragmentNewInstance = SharingFragment.newInstance(shareable);
        FragmentTransaction fragmentTransactionBeginTransaction = getFragmentManager().beginTransaction();
        fragmentTransactionBeginTransaction.replace(R.id.fragment_container, sharingFragmentNewInstance);
        fragmentTransactionBeginTransaction.addToBackStack(SharingFragment.class.getName());
        fragmentTransactionBeginTransaction.commit();
    }

    private void enableShareButton(View view, boolean z) {
        if (view != null) {
            ((Button) view.findViewById(R.id.end_action)).setEnabled(z);
        }
    }
}
