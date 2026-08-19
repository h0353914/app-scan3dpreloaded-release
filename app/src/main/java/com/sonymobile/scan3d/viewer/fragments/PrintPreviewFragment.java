package com.sonymobile.scan3d.viewer.fragments;

import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentTransaction;
import com.sonymobile.scan3d.MeshType;
import com.sonymobile.scan3d.MeshVariant;
import com.sonymobile.scan3d.PrintSelection;
import com.sonymobile.scan3d.PrintType;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.ScenoID;
import com.sonymobile.scan3d.analytics.HitEvent;
import com.sonymobile.scan3d.databinding.PrintPreviewBarBinding;
import com.sonymobile.scan3d.utils.PrintMaterial;
import com.sonymobile.scan3d.utils.UserInputReducer;
import com.sonymobile.scan3d.viewer.MeshHolderFragment;
import com.sonymobile.scan3d.viewer.ModelContainer;
import com.sonymobile.scan3d.viewer.OnNameChangedListener;
import com.sonymobile.scan3d.viewer.PrintPreparationResult;

/* JADX INFO: loaded from: classes2.dex */
public class PrintPreviewFragment extends ActionGLFragment implements MeshHolderFragment.PrintMeshLoadingListener, OnNameChangedListener {
    private static final String DIALOG_TAG = "dialog_tag";
    private static final float SCALE_FACTOR = 0.7f;
    public static final String TAG = "PrintPreviewFragment";
    private PrintPreviewBarBinding mBottomBarBinding;
    private PrintSelection mPrintSelection;

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
    protected int getTitleId() {
        return R.string.title_model_print_preview;
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
    protected int getToolBarActionText() {
        return R.string.next;
    }

    public static PrintPreviewFragment newInstance() {
        Bundle bundle = new Bundle();
        PrintPreviewFragment printPreviewFragment = new PrintPreviewFragment();
        printPreviewFragment.setArguments(bundle);
        return printPreviewFragment;
    }

    @Override // androidx.fragment.app.Fragment
    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        view.findViewById(R.id.texture_knob_parent).setVisibility(8);
        if (this.mMeshHolderFragment.getScenography() != ScenoID.SCENO_SOLID) {
            this.mMeshHolderFragment.setScenography(ScenoID.SCENO_SOLID);
            onScenographyChanged(ScenoID.SCENO_SOLID);
        }
        view.findViewById(R.id.action_edit).setVisibility(8);
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.ActionGLFragment, com.sonymobile.scan3d.viewer.MeshHolderFragment.MeshLoadingListener
    public void onMeshLoaded(Uri uri, ModelContainer modelContainer) {
        super.onMeshLoaded(uri, modelContainer);
        if (isAdded()) {
            this.mPrintSelection = this.mMeshHolderFragment.getPendingPrintSelection();
            View view = getView();
            if (this.mMeshHolderFragment.getScanType() != 256 && view != null) {
                view.findViewById(R.id.action_toggle_base).setVisibility(0);
                updateToggleSocleDrawable();
            }
            this.mPrintSelection.setMaterial(PrintMaterial.SANDSTONE_COLOUR);
            if (this.mPrintSelection.getPrintType() == null) {
                if (this.mMeshHolderFragment.getScanType() == 256) {
                    this.mPrintSelection.setPrintType(PrintType.TYPE_WALL_MOUNT);
                } else {
                    this.mPrintSelection.setPrintType(PrintType.TYPE_TABLE_STAND);
                }
                this.mPrintSelection.setTextOverride(this.mMeshHolderFragment.getName());
            }
            loadPrintPreviewIfNeeded();
        }
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
    protected void onActionClick() {
        if (this.mMeshHolderFragment.getTextLimit() > 0) {
            showEditNameDialog(this.mMeshHolderFragment.getTextLimit());
        } else {
            HitEvent.PRINTING_EDIT_DONE.send(getContext(), getPrintTypeId());
            show3rdPartyPrinterPlugins();
        }
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.ActionGLFragment
    protected void setupBottomBar(LayoutInflater layoutInflater, ViewGroup viewGroup) {
        this.mBottomBarBinding = PrintPreviewBarBinding.inflate(layoutInflater, viewGroup, true);
        viewGroup.findViewById(R.id.action_print_edit).setOnClickListener((UserInputReducer.InputReducer) view -> {
            startPrintEdit(true);
            HitEvent.PRINTING_MODEL_EDIT_CLICKED.send(getContext(), getPrintTypeId());
        });
        viewGroup.findViewById(R.id.action_edit).setOnClickListener((UserInputReducer.InputReducer) view -> {
            showEditNameDialog(0);
            HitEvent.PRINTING_TEXT_EDIT_CLICKED.send(getContext(), getPrintTypeId());
        });
        viewGroup.findViewById(R.id.action_toggle_base).setOnClickListener((UserInputReducer.InputReducer) view -> {
            PrintSelection printSelection = this.mPrintSelection;
            if (printSelection != null) {
                printSelection.setPrintType(printSelection.getPrintType() == PrintType.TYPE_WALL_MOUNT ? PrintType.TYPE_TABLE_STAND : PrintType.TYPE_WALL_MOUNT);
                getRenderer().removeMeshes();
                this.mMeshHolderFragment.setPrintModel(null);
                this.mPrintSelection.resetTransform();
                this.mMeshHolderFragment.setPrintEditorSeek(-1);
                loadPrintPreviewIfNeeded();
                HitEvent.PRINTING_SOCLE_EDITED.send(getContext(), getPrintTypeId());
            }
        });
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, com.sonymobile.scan3d.OnBackPressListener
    public boolean onBackPressed() {
        PrintSelection printSelection = this.mPrintSelection;
        if (printSelection != null) {
            printSelection.resetTransform();
        }
        this.mMeshHolderFragment.setPrintEditorSeek(-1);
        return super.onBackPressed();
    }

    private int getPrintTypeId() {
        PrintSelection printSelection = this.mPrintSelection;
        if (printSelection != null) {
            return printSelection.getPrintType().ordinal();
        }
        return 1;
    }

    @Override // com.sonymobile.scan3d.viewer.OnNameChangedListener
    public void onNameChanged(String str) {
        this.mPrintSelection.setTextOverride(str);
        loadPrintPreviewIfNeeded();
    }

    @Override // com.sonymobile.scan3d.viewer.MeshHolderFragment.PrintMeshLoadingListener
    public void onPrintMeshComputed(ModelContainer modelContainer, ModelContainer modelContainer2, ModelContainer modelContainer3, ModelContainer modelContainer4) {
        dismissProgressDialog();
        if (getRenderer() != null) {
            updateToggleSocleDrawable();
            PrintType printType = this.mPrintSelection.getPrintType();
            getRenderer().removeMeshes();
            getRenderer().set180Mode(printType == PrintType.TYPE_WALL_MOUNT);
            getRenderer().addMesh(modelContainer, MeshVariant.MESH_VARIANT_ORIGINAL, MeshType.TYPE_PRINT_PREVIEW);
            getRenderer().adjustViewToMesh(SCALE_FACTOR, true);
            requestRenderGLTextureView();
        }
    }

    @Override // com.sonymobile.scan3d.viewer.MeshHolderFragment.PrintMeshLoadingListener
    public void onPrintMeshFailed(ModelContainer modelContainer, ModelContainer modelContainer2, ModelContainer modelContainer3, ModelContainer modelContainer4, PrintPreparationResult printPreparationResult) {
        Context context = getContext();
        dismissProgressDialog();
        if (this.mMeshHolderFragment.getPrintEditorSeek() >= 0 && printPreparationResult == PrintPreparationResult.FAIL_EMPTY_MODEL) {
            if (context != null) {
                Toast.makeText(context, printPreparationResult.getString(context), 1).show();
            }
            this.mMeshHolderFragment.setPrintEditorSeek(-1);
            getFragmentManager().popBackStackImmediate();
            return;
        }
        if (printPreparationResult != PrintPreparationResult.FAIL_EMPTY_MODEL && context != null) {
            Toast.makeText(context, printPreparationResult.getString(context), 1).show();
        }
        startPrintEdit(false);
    }

    @Override // com.sonymobile.scan3d.viewer.MeshHolderFragment.PrintMeshLoadingListener
    public void onPrintMeshLoading() {
        showProgressDialog(R.string.saving_print_geometry, true);
    }

    private void updateToggleSocleDrawable() {
        this.mBottomBarBinding.setSocleDrawable(getResources().getDrawable(this.mPrintSelection.getPrintType() == PrintType.TYPE_WALL_MOUNT ? R.drawable.ic_toggle_base_wall_24dp : R.drawable.ic_toggle_base_stand_24dp, null));
    }

    private void startPrintEdit(boolean z) {
        FragmentManager fragmentManager = getFragmentManager();
        PrintEditFragment printEditFragmentNewInstance = PrintEditFragment.newInstance(z);
        printEditFragmentNewInstance.setTargetFragment(this, 0);
        FragmentTransaction fragmentTransactionBeginTransaction = fragmentManager.beginTransaction();
        fragmentTransactionBeginTransaction.setTransition(FragmentTransaction.TRANSIT_FRAGMENT_FADE);
        fragmentTransactionBeginTransaction.replace(R.id.fragment_container, printEditFragmentNewInstance);
        fragmentTransactionBeginTransaction.addToBackStack(PrintEditFragment.TAG);
        fragmentTransactionBeginTransaction.commit();
    }

    private void showEditNameDialog(int i) {
        FragmentManager fragmentManager = getFragmentManager();
        String textOverride = this.mPrintSelection.getTextOverride();
        if (textOverride == null) {
            textOverride = this.mMeshHolderFragment.getName();
        }
        EditNameFragment.newInstance(textOverride, i > 0 ? R.string.dialog_edit_text_too_long_title : R.string.dialog_edit_text_title, i, this).show(fragmentManager, DIALOG_TAG);
    }

    private void show3rdPartyPrinterPlugins() {
        FragmentManager fragmentManager = getFragmentManager();
        Print3rdPartyPluginsFragment print3rdPartyPluginsFragmentNewInstance = Print3rdPartyPluginsFragment.newInstance(this.mPrintSelection);
        FragmentTransaction fragmentTransactionBeginTransaction = fragmentManager.beginTransaction();
        fragmentTransactionBeginTransaction.setTransition(FragmentTransaction.TRANSIT_FRAGMENT_FADE);
        fragmentTransactionBeginTransaction.replace(R.id.fragment_container, print3rdPartyPluginsFragmentNewInstance);
        fragmentTransactionBeginTransaction.addToBackStack(print3rdPartyPluginsFragmentNewInstance.getClass().getName());
        fragmentTransactionBeginTransaction.commit();
    }

    private void loadPrintPreviewIfNeeded() {
        if (!this.mMeshHolderFragment.computePrintMesh(this) || getRenderer() == null) {
            return;
        }
        getRenderer().removeMeshes();
    }
}
