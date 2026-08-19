package com.sonymobile.scan3d.viewer.fragments;

import android.content.ContentValues;
import android.net.Uri;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentTransaction;
import com.sonymobile.scan3d.MeshType;
import com.sonymobile.scan3d.MeshVariant;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.storageservice.provider.FileTasks;
import com.sonymobile.scan3d.utils.UserInputReducer;
import com.sonymobile.scan3d.viewer.ModelContainer;
import com.sonymobile.scan3d.viewer.OnNameChangedListener;

/* JADX INFO: loaded from: classes2.dex */
public class OpenWithFragment extends ActionGLFragment implements OnNameChangedListener {
    private static final String DIALOG_TAG = "dialog_tag";

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
    protected boolean showToolbar() {
        return false;
    }

    public static Fragment newInstance() {
        return new OpenWithFragment();
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.ActionGLFragment
    protected void setupBottomBar(LayoutInflater layoutInflater, ViewGroup viewGroup) {
        layoutInflater.inflate(R.layout.open_with_view, viewGroup);
        viewGroup.findViewById(R.id.save).setOnClickListener((UserInputReducer.InputReducer) view -> showEditNameDialog());
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.ActionGLFragment, com.sonymobile.scan3d.viewer.MeshHolderFragment.MeshLoadingListener
    public void onMeshLoaded(Uri uri, ModelContainer modelContainer) {
        super.onMeshLoaded(uri, modelContainer);
        ContentValues contentValues = new ContentValues(1);
        contentValues.put("scan_type", Integer.valueOf(modelContainer.getScanType()));
        FileTasks.update(getContext(), getData(), contentValues, false);
        if (isAdded()) {
            showMesh();
            dismissProgressDialog();
        }
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, com.sonymobile.scan3d.OnBackPressListener
    public boolean onBackPressed() {
        FileTasks.deleteFileSet(getContext(), getData(), true);
        getActivity().finish();
        return true;
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
    protected void onNavigationClick() {
        FileTasks.deleteFileSet(getContext(), getData(), true);
        getActivity().finish();
    }

    private void showMesh() {
        getRenderer().addMesh(this.mModelContainer, MeshVariant.MESH_VARIANT_ORIGINAL, MeshType.TYPE_ORIGINAL);
        requestRenderGLTextureView();
    }

    private void gotoViewer() {
        FragmentTransaction fragmentTransactionBeginTransaction = getFragmentManager().beginTransaction();
        fragmentTransactionBeginTransaction.setTransition(FragmentTransaction.TRANSIT_FRAGMENT_FADE);
        fragmentTransactionBeginTransaction.replace(R.id.fragment_container, ViewerFragment.newInstance());
        fragmentTransactionBeginTransaction.commit();
    }

    private void showEditNameDialog() {
        EditNameFragment.newInstance(null, R.string.dialog_edit_name_title, this).show(getFragmentManager(), DIALOG_TAG);
    }

    private Uri getData() {
        return getActivity().getIntent().getData();
    }

    @Override // com.sonymobile.scan3d.viewer.OnNameChangedListener
    public void onNameChanged(String str) {
        this.mMeshHolderFragment.setName(str);
        gotoViewer();
    }
}
