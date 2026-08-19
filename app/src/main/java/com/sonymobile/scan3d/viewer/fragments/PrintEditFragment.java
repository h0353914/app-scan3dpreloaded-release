package com.sonymobile.scan3d.viewer.fragments;

import android.net.Uri;
import android.os.Bundle;
import android.os.Parcelable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.SeekBar;
import androidx.annotation.NonNull;
import androidx.fragment.app.FragmentManager;
import com.sonymobile.scan3d.MeshType;
import com.sonymobile.scan3d.MeshVariant;
import com.sonymobile.scan3d.PrintSelection;
import com.sonymobile.scan3d.PrintType;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.ScenoID;
import com.sonymobile.scan3d.analytics.HitEvent;
import com.sonymobile.scan3d.viewer.MeshHolderFragment;
import com.sonymobile.scan3d.viewer.MeshRenderer;
import com.sonymobile.scan3d.viewer.ModelContainer;
import com.sonymobile.scan3d.viewer.PrintPreparationResult;
import com.sonymobile.scan3d.viewer.YesNoQuestionFragment;

/* JADX INFO: loaded from: classes2.dex */
public class PrintEditFragment extends ActionGLFragment implements YesNoQuestionFragment.OnYesNoListener, MeshHolderFragment.PrintMeshLoadingListener {
    private static final String ARG_PRINT_MESH_COMPUTED = "arg_mesh_computed";
    private static final String DIALOG_TAG = "PrintEditFragmentDialog";
    private static final float SCALE_FACTOR = 0.9f;
    public static final String TAG = "PrintEditFragment";
    private ModelContainer mPrintEditMesh;
    private PrintSelection mPrintSelection;
    private boolean mSeekBarChanged = false;
    private SeekBar mSeekbar;

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
    public int getNavigationDrawable() {
        return R.drawable.ic_close_24dp;
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
    protected int getTitleId() {
        return R.string.edit_print_geometry;
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
    protected int getToolBarActionText() {
        return R.string.done;
    }

    @Override // com.sonymobile.scan3d.viewer.YesNoQuestionFragment.OnYesNoListener
    public void onNegativeAnswer(int i, Parcelable parcelable) {
    }

    public static PrintEditFragment newInstance(boolean z) {
        PrintEditFragment printEditFragment = new PrintEditFragment();
        Bundle bundle = new Bundle();
        bundle.putBoolean(ARG_PRINT_MESH_COMPUTED, z);
        printEditFragment.setArguments(bundle);
        return printEditFragment;
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.ActionGLFragment, com.sonymobile.scan3d.viewer.MeshHolderFragment.MeshLoadingListener
    public void onMeshLoaded(Uri uri, ModelContainer modelContainer) {
        super.onMeshLoaded(uri, modelContainer);
        if (isAdded()) {
            this.mMeshHolderFragment.computePrintMesh(this);
        }
    }

    private void handlePrintMesh(ModelContainer modelContainer, ModelContainer modelContainer2) {
        if (isAdded()) {
            MeshRenderer renderer = getRenderer();
            renderer.removeMeshes();
            this.mPrintEditMesh = modelContainer;
            this.mPrintSelection = this.mMeshHolderFragment.getPendingPrintSelection();
            renderer.set180Mode(this.mPrintSelection.getPrintType() != PrintType.TYPE_TABLE_STAND);
            renderer.addMesh(modelContainer, MeshVariant.MESH_VARIANT_ORIGINAL, MeshType.TYPE_PRINT_CUT);
            renderer.addMesh(modelContainer2, MeshVariant.MESH_VARIANT_ORIGINAL, MeshType.TYPE_CYLINDER);
            renderer.resetInitView();
            renderer.reset();
            renderer.setEditMode(true);
            renderer.adjustViewToMesh(SCALE_FACTOR, true);
            modelContainer.setTransform(this.mPrintSelection.getTransform());
            if (!modelContainer.is180Scan()) {
                renderer.translateView(0.0f, 0.2f, 0.0f);
            }
            if (this.mSeekbar.getProgress() == 0) {
                SeekBar seekBar = this.mSeekbar;
                seekBar.setProgress((int) (seekBar.getMax() * renderer.getSeekDefault()));
            } else {
                renderer.onSeek(((float) this.mSeekbar.getProgress()) / ((float) this.mSeekbar.getMax()));
            }
            requestRenderGLTextureView();
            dismissProgressDialog();
        }
    }

    @Override // com.sonymobile.scan3d.viewer.MeshHolderFragment.PrintMeshLoadingListener
    public void onPrintMeshComputed(ModelContainer modelContainer, ModelContainer modelContainer2, ModelContainer modelContainer3, ModelContainer modelContainer4) {
        handlePrintMesh(modelContainer3, modelContainer4);
    }

    @Override // com.sonymobile.scan3d.viewer.MeshHolderFragment.PrintMeshLoadingListener
    public void onPrintMeshFailed(ModelContainer modelContainer, ModelContainer modelContainer2, ModelContainer modelContainer3, ModelContainer modelContainer4, PrintPreparationResult printPreparationResult) {
        if (!modelContainer3.isEmpty() && !modelContainer4.isEmpty()) {
            handlePrintMesh(modelContainer3, modelContainer4);
        } else {
            cancelPrintEdit();
        }
    }

    @Override // com.sonymobile.scan3d.viewer.MeshHolderFragment.PrintMeshLoadingListener
    public void onPrintMeshLoading() {
        showProgressDialog(R.string.saving_print_geometry, true);
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.ActionGLFragment
    void setupBottomBar(LayoutInflater layoutInflater, ViewGroup viewGroup) {
        layoutInflater.inflate(R.layout.print_edit_slider, viewGroup);
        this.mSeekbar = (SeekBar) viewGroup.findViewById(R.id.seekBar);
        if (this.mMeshHolderFragment.getPrintEditorSeek() >= 0) {
            this.mSeekbar.setProgress(this.mMeshHolderFragment.getPrintEditorSeek());
        }
        this.mSeekbar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() { // from class: com.sonymobile.scan3d.viewer.fragments.PrintEditFragment.1
            @Override // android.widget.SeekBar.OnSeekBarChangeListener
            public void onStopTrackingTouch(SeekBar seekBar) {
            }

            @Override // android.widget.SeekBar.OnSeekBarChangeListener
            public void onProgressChanged(SeekBar seekBar, int i, boolean z) {
                PrintEditFragment.this.getRenderer().onSeek(((float) i) / ((float) seekBar.getMax()));
                PrintEditFragment.this.requestRenderGLTextureView();
            }

            @Override // android.widget.SeekBar.OnSeekBarChangeListener
            public void onStartTrackingTouch(SeekBar seekBar) {
                PrintEditFragment.this.mSeekBarChanged = true;
            }
        });
    }

    @Override // androidx.fragment.app.Fragment
    public void onViewCreated(@NonNull View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        getRenderer().onSeek(((float) this.mSeekbar.getProgress()) / ((float) this.mSeekbar.getMax()));
        view.findViewById(R.id.texture_knob_parent).setVisibility(8);
        if (this.mMeshHolderFragment.getScenography() != ScenoID.SCENO_SOLID) {
            this.mMeshHolderFragment.setScenography(ScenoID.SCENO_SOLID);
            onScenographyChanged(ScenoID.SCENO_SOLID);
        }
        requestRenderGLTextureView();
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
    protected void onActionClick() {
        this.mMeshHolderFragment.setPrintEditorSeek(this.mSeekbar.getProgress());
        this.mMeshHolderFragment.setNotLoaded();
        this.mPrintSelection.setTransform(this.mPrintEditMesh.getTransform());
        HitEvent.PRINTING_MODEL_EDIT_DONE.send(getContext(), this.mPrintSelection.getPrintType().ordinal());
        getFragmentManager().popBackStackImmediate();
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, com.sonymobile.scan3d.OnBackPressListener
    public boolean onBackPressed() {
        if (this.mSeekBarChanged) {
            FragmentManager fragmentManager = getFragmentManager();
            YesNoQuestionFragment yesNoQuestionFragmentNewInstance = YesNoQuestionFragment.newInstance(0, R.string.dialog_discard_print_description, R.string.discard_print_edit);
            yesNoQuestionFragmentNewInstance.setTargetFragment(this, 0);
            yesNoQuestionFragmentNewInstance.show(fragmentManager, DIALOG_TAG);
            return true;
        }
        cancelPrintEdit();
        return true;
    }

    @Override // com.sonymobile.scan3d.viewer.YesNoQuestionFragment.OnYesNoListener
    public void onPositiveAnswer(int i, Parcelable parcelable) {
        cancelPrintEdit();
    }

    private void cancelPrintEdit() {
        if (!getArguments().getBoolean(ARG_PRINT_MESH_COMPUTED)) {
            this.mMeshHolderFragment.resetPendingPrintSelection();
        }
        if (this.mSeekbar != null) {
            this.mMeshHolderFragment.setPrintEditorSeek(this.mSeekbar.getProgress());
        }
        getFragmentManager().popBackStackImmediate();
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
    protected void onNavigationClick() {
        onBackPressed();
    }
}
