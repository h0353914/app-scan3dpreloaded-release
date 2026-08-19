package com.sonymobile.scan3d.viewer.fragments;

import android.content.SharedPreferences;
import android.content.res.Resources;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcelable;
import android.preference.PreferenceManager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentTransaction;
import com.sonymobile.scan3d.EnvironmentError;
import com.sonymobile.scan3d.MeshType;
import com.sonymobile.scan3d.MeshVariant;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.analytics.ScanEvent;
import com.sonymobile.scan3d.storageservice.authentication.AccountUtils;
import com.sonymobile.scan3d.storageservice.provider.FileTasks;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.storageservice.ui.gallery.wizard.WizardActivity;
import com.sonymobile.scan3d.storageservice.ui.tips.Tip;
import com.sonymobile.scan3d.storageservice.ui.tips.TipCategory;
import com.sonymobile.scan3d.storageservice.ui.tips.TipParser;
import com.sonymobile.scan3d.utils.UserInputReducer;
import com.sonymobile.scan3d.viewer.ModelContainer;
import com.sonymobile.scan3d.viewer.OnNameChangedListener;
import com.sonymobile.scan3d.viewer.TipDialog;
import com.sonymobile.scan3d.viewer.YesNoQuestionFragment;
import com.sonymobile.scan3d.viewer.sharing.SharingFragment;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.Set;

/* JADX INFO: loaded from: classes2.dex */
public class KeepDiscardFragment extends ActionGLFragment implements YesNoQuestionFragment.OnYesNoListener, OnNameChangedListener, TipDialog.ITipDialogListener {
    private static final String DIALOG_TAG = "dialog_tag";
    private static final String KEY_ENV_ERROR = "env_error";
    private static final String KEY_LONG_SCAN = "long_scan";
    private static final String KEY_SCAN_DELETED = "scan_deleted";
    private static final String KEY_SHORT_SCAN = "short_scan";
    public static final String POLICY_MODE = "policy_mode";
    private static final int QUESTION_ID_DELETE = 0;
    private static final String WIZARD_DIALOG_TAG = "wizard_tag";
    private boolean mScanDeleted;

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
    public int getNavigationAccessibility() {
        return R.string.accessibility_close_button;
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
    public int getNavigationDrawable() {
        return R.drawable.ic_close_24dp;
    }

    @Override // com.sonymobile.scan3d.viewer.YesNoQuestionFragment.OnYesNoListener
    public void onNegativeAnswer(int i, Parcelable parcelable) {
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
    protected boolean showToolbar() {
        return false;
    }

    public static Fragment newInstance(boolean z, boolean z2, EnvironmentError.ErrorType errorType) {
        Bundle bundle = new Bundle();
        bundle.putBoolean("short_scan", z);
        bundle.putBoolean("long_scan", z2);
        bundle.putSerializable("env_error", errorType);
        KeepDiscardFragment keepDiscardFragment = new KeepDiscardFragment();
        keepDiscardFragment.setArguments(bundle);
        return keepDiscardFragment;
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.ActionGLFragment, com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, androidx.fragment.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (bundle != null) {
            this.mScanDeleted = bundle.getBoolean(KEY_SCAN_DELETED);
        }
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.ActionGLFragment, com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View viewOnCreateView = super.onCreateView(layoutInflater, viewGroup, bundle);
        View viewFindViewById = viewOnCreateView.findViewById(R.id.navigation_button_parent);
        viewFindViewById.setVisibility(0);
        viewFindViewById.setOnClickListener((UserInputReducer.InputReducer) view -> onNavigationClick());
        ImageView imageView = (ImageView) viewFindViewById.findViewById(R.id.navigation_button);
        imageView.setImageResource(getNavigationDrawable());
        imageView.setContentDescription(getString(getNavigationAccessibility()));
        layoutInflater.inflate(R.layout.component_hint_viewer_no_face_detected, (FrameLayout) viewOnCreateView.findViewById(R.id.hint_container));
        return viewOnCreateView;
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, androidx.fragment.app.Fragment
    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putBoolean(KEY_SCAN_DELETED, this.mScanDeleted);
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.ActionGLFragment
    protected void setupBottomBar(LayoutInflater layoutInflater, ViewGroup viewGroup) {
        layoutInflater.inflate(R.layout.keep_discard_view, viewGroup);
        UserInputReducer.InputReducer inputReducer = (UserInputReducer.InputReducer) view -> {
            int id = view.getId();
            if (id == R.id.discard) {
                showDiscardDialog();
            } else if (id == R.id.keep) {
                showEditNameDialog();
            }
        };
        viewGroup.findViewById(R.id.keep).setOnClickListener(inputReducer);
        viewGroup.findViewById(R.id.discard).setOnClickListener(inputReducer);
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.ActionGLFragment, com.sonymobile.scan3d.viewer.MeshHolderFragment.MeshLoadingListener
    public void onMeshLoaded(Uri uri, ModelContainer modelContainer) {
        super.onMeshLoaded(uri, modelContainer);
        if (isAdded()) {
            showMesh();
            dismissProgressDialog();
        }
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, com.sonymobile.scan3d.OnBackPressListener
    public boolean onBackPressed() {
        showDiscardDialog();
        return true;
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
    protected void onNavigationClick() {
        showDiscardDialog();
    }

    @Override // com.sonymobile.scan3d.viewer.YesNoQuestionFragment.OnYesNoListener
    public void onPositiveAnswer(int i, Parcelable parcelable) {
        if (i == 0) {
            FileTasks.deleteFileSet(getContext(), getData(), true);
            this.mScanDeleted = true;
            ScanEvent.SCAN_DISCARDED.send(getContext(), getActivity().getIntent().getIntExtra(POLICY_MODE, -1));
            Tip priorityTip = getPriorityTip();
            if (priorityTip != null) {
                showTipDialog(priorityTip, null, true);
                return;
            } else {
                showTipDialog(purgeTips(TipParser.getScanDiscardedTips(getContext(), this.mMeshHolderFragment.getScanType(), this.mMeshHolderFragment.getScanPolicyMode())), false);
                return;
            }
        }
        throw new IllegalStateException("YesNoDialog with id = " + i + " is not supported");
    }

    @Override // com.sonymobile.scan3d.viewer.OnNameChangedListener
    public void onNameChanged(String str) {
        this.mMeshHolderFragment.setName(str);
        ScanEvent.SCAN_SAVED.send(getContext(), getActivity().getIntent().getIntExtra(POLICY_MODE, -1));
        Tip priorityTip = getPriorityTip();
        if (priorityTip != null) {
            showTipDialog(priorityTip, null, true);
        } else {
            showTipDialog(purgeTips(TipParser.getScanKeptTips(getContext(), this.mMeshHolderFragment.getScanType(), this.mMeshHolderFragment.getScanPolicyMode())), false);
        }
    }

    @Override // com.sonymobile.scan3d.viewer.TipDialog.ITipDialogListener
    public void onTipPositive(TipCategory tipCategory, Tip tip) {
        switch (tip.getPositiveAction()) {
            case R.string.tip_dialog_action_open_share /* 2131755734 */:
                openSharingFramework(this.mMeshHolderFragment.getFileSet(), SharingFragment.Tab.SHARE);
                break;
            case R.string.tip_dialog_action_open_wizard /* 2131755735 */:
                WizardActivity.showWizard(getContext(), tipCategory, tip);
                getActivity().finish();
                break;
            default:
                if (this.mScanDeleted) {
                    getActivity().finish();
                } else {
                    gotoViewer();
                }
                break;
        }
    }

    @Override // com.sonymobile.scan3d.viewer.TipDialog.ITipDialogListener
    public void onTipNegative() {
        if (this.mScanDeleted) {
            getActivity().finish();
        } else {
            gotoViewer();
        }
    }

    private void showMesh() {
        int scanPolicyMode = this.mMeshHolderFragment.getScanPolicyMode();
        int scanType = this.mMeshHolderFragment.getScanType();
        if ((scanPolicyMode == 0 || scanPolicyMode == 1) && scanType != 256 && scanType != 257) {
            getView().findViewById(R.id.hint_container).setVisibility(0);
        }
        getRenderer().addMesh(this.mModelContainer, MeshVariant.MESH_VARIANT_ORIGINAL, MeshType.TYPE_ORIGINAL);
        requestRenderGLTextureView();
    }

    private void showDiscardDialog() {
        FragmentManager fragmentManager = getFragmentManager();
        YesNoQuestionFragment yesNoQuestionFragmentNewInstance = YesNoQuestionFragment.newInstance(0, R.string.dialog_discard_scan_description, R.string.storage_service_dialog_button_discard_txt);
        yesNoQuestionFragmentNewInstance.setTargetFragment(this, 0);
        yesNoQuestionFragmentNewInstance.show(fragmentManager, DIALOG_TAG);
    }

    private void showTipDialog(List<TipParser.TipPair> list, boolean z) {
        if (!list.isEmpty()) {
            TipParser.TipPair tipPair = list.get(new Random().nextInt(list.size()));
            showTipDialog(tipPair.getTip(), tipPair.getCategory(), z);
        } else if (this.mScanDeleted) {
            getActivity().finish();
        } else {
            gotoViewer();
        }
    }

    private void showTipDialog(Tip tip, TipCategory tipCategory, boolean z) {
        ((FrameLayout) getView().findViewById(R.id.hint_container)).setVisibility(8);
        FragmentTransaction fragmentTransactionBeginTransaction = getFragmentManager().beginTransaction();
        TipDialog tipDialogNewInstance = TipDialog.newInstance(tipCategory, tip, z);
        tipDialogNewInstance.setTargetFragment(this, 0);
        fragmentTransactionBeginTransaction.show(tipDialogNewInstance);
        tipDialogNewInstance.show(fragmentTransactionBeginTransaction, WIZARD_DIALOG_TAG);
    }

    private List<TipParser.TipPair> purgeTips(List<TipParser.TipPair> list) {
        Set<String> stringSet = PreferenceManager.getDefaultSharedPreferences(getContext()).getStringSet(getString(R.string.pref_key_excluded_tips), null);
        if (stringSet != null) {
            Iterator<TipParser.TipPair> it = list.iterator();
            Resources resources = getResources();
            while (it.hasNext()) {
                if (stringSet.contains(resources.getResourceEntryName(it.next().getTip().getShortDescription()))) {
                    it.remove();
                }
            }
        }
        return list;
    }

    private void gotoViewer() {
        FragmentTransaction fragmentTransactionBeginTransaction = getFragmentManager().beginTransaction();
        fragmentTransactionBeginTransaction.setTransition(FragmentTransaction.TRANSIT_FRAGMENT_FADE);
        fragmentTransactionBeginTransaction.replace(R.id.fragment_container, ViewerFragment.newInstance(true));
        fragmentTransactionBeginTransaction.commit();
    }

    private void showEditNameDialog() {
        ScanAddedFragment.newInstance(getData(), this).show(getFragmentManager(), DIALOG_TAG);
    }

    private Uri getData() {
        return getActivity().getIntent().getData();
    }

    private Tip getPriorityTip() {
        Bundle arguments = getArguments();
        List<Tip> arrayList = new ArrayList<>();
        if (arguments.getSerializable("env_error") != null) {
            arrayList.add(Tip.newInstance((EnvironmentError.ErrorType) arguments.getSerializable("env_error")));
        } else if (arguments.getBoolean("short_scan")) {
            arrayList.add(Tip.Priority.SHORT_SCAN.getAsTip());
        } else if (arguments.getBoolean("long_scan")) {
            arrayList.add(Tip.Priority.LONG_SCAN.getAsTip());
        }
        if (!AccountUtils.isSignedIn(getContext()) && !this.mScanDeleted) {
            SharedPreferences defaultSharedPreferences = PreferenceManager.getDefaultSharedPreferences(getContext());
            int i = defaultSharedPreferences.getInt(getString(R.string.pref_key_kept_scan_counter), 1);
            if (i > getResources().getInteger(R.integer.tip_dialog_backup_tip_threshold)) {
                defaultSharedPreferences.edit().putInt(getString(R.string.pref_key_kept_scan_counter), 1).apply();
                arrayList.add(Tip.Priority.RESTORE.getAsTip());
            } else {
                defaultSharedPreferences.edit().putInt(getString(R.string.pref_key_kept_scan_counter), i + 1).apply();
            }
        }
        if (arrayList.isEmpty()) {
            return null;
        }
        Set<String> stringSet = PreferenceManager.getDefaultSharedPreferences(getContext()).getStringSet(getString(R.string.pref_key_excluded_tips), new HashSet());
        Resources resources = getResources();
        for (Tip tip : arrayList) {
            if (!stringSet.contains(resources.getResourceEntryName(tip.getShortDescription()))) {
                return tip;
            }
        }
        return null;
    }

    private void openSharingFramework(IFileSet iFileSet, SharingFragment.Tab tab) {
        gotoViewer();
        SharingFragment sharingFragmentNewInstance = SharingFragment.newInstance(iFileSet, getRenderer().getViewM(), tab);
        FragmentTransaction fragmentTransactionBeginTransaction = getFragmentManager().beginTransaction();
        fragmentTransactionBeginTransaction.setTransition(FragmentTransaction.TRANSIT_FRAGMENT_FADE);
        fragmentTransactionBeginTransaction.replace(R.id.fragment_container, sharingFragmentNewInstance);
        fragmentTransactionBeginTransaction.addToBackStack(SharingFragment.class.getName());
        fragmentTransactionBeginTransaction.commit();
    }
}
