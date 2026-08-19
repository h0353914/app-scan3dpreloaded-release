package com.sonymobile.scan3d.viewer.fragments;

import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.preference.PreferenceManager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.Toolbar;
import androidx.fragment.app.DialogFragment;
import androidx.fragment.app.FragmentActivity;
import androidx.fragment.app.FragmentTransaction;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.analytics.HitEvent;
import com.sonymobile.scan3d.animation.AnimationResources;
import com.sonymobile.scan3d.animation.ObjToGltfConverter;
import com.sonymobile.scan3d.animation.RigModelManager;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.provider.Factory;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.utils.SharingUtil;
import com.sonymobile.scan3d.utils.UserInputReducer;
import com.sonymobile.scan3d.viewer.DismissablePrivacyFragment;
import com.sonymobile.scan3d.viewer.MeshHolderFragment;
import com.sonymobile.scan3d.viewer.ModelContainer;
import com.sonymobile.scan3d.viewer.SphanGLTextureView;
import com.sonymobile.scan3d.viewer.ViewerActivity;
import com.sonymobile.scan3d.viewer.fragments.component.AnimationMenu;
import com.sonymobile.scan3d.viewer.fragments.component.Pickable;
import com.sonymobile.scan3d.viewer.sharing.Shareable;
import com.sonymobile.scan3d.viewer.sharing.SharingFragment;
import java.util.ArrayList;
import java.util.Optional;

public class AnimationFragment extends BaseAnimationFragment implements ObjToGltfConverter.GltfConversionListener, ObjToGltfConverter.ErrorDialog.ErrorDialogListener, AnimationMenu.AnimationMenuListener, MeshHolderFragment.MeshLoadingListener, Handler.Callback {
    private static final String KEY_ANIMATION_INDEX = "ANIMATION_INDEX";
    public static final String KEY_CLOSE_AFTER_SHARE = "CLOSE_AFTER_SHARE";
    private static final String KEY_DONT_SHOW_AGAIN = "FileShareDialog_dontShowAgain";
    public static final String KEY_PICKER_INTENT = "PICKER_INTENT";
    public static final String KEY_SHAREABLE = "SHAREABLE";
    public static final String KEY_SHARE_INSTANTLY = "SHARE_INSTANTLY";
    public static final String KEY_TEXTURE_SIZE = "TEXTURE_SIZE";
    private static final int NO_ANIMATION_ID = -1;
    private AnimationMenu mAnimationMenu;
    private boolean mNewInstance;
    private View mOngoingAnimation;
    private Toolbar mToolBar;
    private int mSelectedAnimation = 0;
    private Handler mHandler = new Handler(Looper.getMainLooper(), this);

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
    public int getContentLayout() {
        return R.layout.fragment_animation_layout;
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
    public int getNavigationDrawable() {
        return 0;
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseAnimationFragment
    public int getTextureViewId() {
        return R.id.glTextureView;
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
    protected int getTitleId() {
        return 0;
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
    public String getTitleText() {
        return "";
    }

    @Override // com.sonymobile.scan3d.viewer.MeshHolderFragment.MeshLoadingListener
    public void onMeshLoadFailed(Uri uri) {
    }

    @Override // com.sonymobile.scan3d.viewer.MeshHolderFragment.MeshLoadingListener
    public void onMeshLoading(Uri uri) {
    }

    public static AnimationFragment newInstance(Shareable shareable, boolean z) {
        return newInstance(shareable, z, true);
    }

    public static AnimationFragment newInstance(Shareable shareable, boolean z, boolean z2) {
        Bundle bundle = new Bundle();
        if (shareable == null) {
            shareable = new Shareable();
            shareable.setShareType(Shareable.Type.ANIMATION);
        }
        bundle.putBundle(KEY_SHAREABLE, shareable.toBundle());
        bundle.putBoolean(KEY_SHARE_INSTANTLY, z);
        bundle.putBoolean(KEY_CLOSE_AFTER_SHARE, z2);
        AnimationFragment animationFragment = new AnimationFragment();
        animationFragment.setArguments(bundle);
        return animationFragment;
    }

    public static AnimationFragment newInstance(boolean z, int i) {
        Bundle bundle = new Bundle();
        bundle.putBoolean(KEY_PICKER_INTENT, z);
        bundle.putInt(KEY_TEXTURE_SIZE, i);
        AnimationFragment animationFragment = new AnimationFragment();
        animationFragment.setArguments(bundle);
        return animationFragment;
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseAnimationFragment, com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View viewOnCreateView = super.onCreateView(layoutInflater, viewGroup, bundle);
        this.mMeshHolderFragment = MeshHolderFragment.getInstance(getActivity());
        this.mMeshHolderFragment.setMeshLoadingListener(this);
        this.mAnimationMenu = (AnimationMenu) viewOnCreateView.findViewById(R.id.animation_menu);
        this.mAnimationMenu.addAnimationMenuListener(this);
        this.mToolBar = (Toolbar) viewOnCreateView.findViewById(R.id.toolbar);
        this.mToolBar.setBackgroundColor(getContext().getColor(android.R.color.transparent));
        this.mOngoingAnimation = viewOnCreateView.findViewById(R.id.animation_ongoing);
        if (bundle != null) {
            this.mSelectedAnimation = bundle.getInt(KEY_ANIMATION_INDEX, -1);
            this.mMeshHolderFragment.syncFileSet();
        } else {
            this.mNewInstance = true;
        }
        return viewOnCreateView;
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseAnimationFragment, com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, androidx.fragment.app.Fragment
    public void onPause() {
        super.onPause();
        this.mTextureView.removeAnimationListener();
        if (this.mSphanRenderer == null || !this.mSphanRenderer.isEffectActive()) {
            return;
        }
        this.mTextureView.queueEvent(() -> {
            if (this.mSphanRenderer != null) {
                this.mSphanRenderer.onGLContextDestroyed();
                this.mSphanRenderer.stopEffect();
                this.mSphanRenderer.onGLContextCreated();
            }
            this.mTextureView.requestRender();
        });
    }

    @Override // androidx.fragment.app.Fragment
    public void onDestroyView() {
        super.onDestroyView();
        if (this.mSphanRenderer == null || !this.mSphanRenderer.isEffectActive() || getActivity().isFinishing()) {
            return;
        }
        this.mTextureView.queueEvent(() -> {
            if (this.mSphanRenderer != null) {
                this.mSphanRenderer.onGLContextDestroyed();
                this.mSphanRenderer.stopEffect();
                this.mSphanRenderer.onGLContextCreated();
            }
            this.mTextureView.requestRender();
        });
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseAnimationFragment, com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, androidx.fragment.app.Fragment
    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putInt(KEY_ANIMATION_INDEX, this.mSelectedAnimation);
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseAnimationFragment
    public void onMeshesLoadedIntoSphan(boolean z, boolean z2) {
        if (!z2) {
            updateToolbar(false);
            onRiggedMeshMissing();
            return;
        }
        if (this.mNewInstance) {
            HitEvent.ANIMATION_SCREEN_ENTERED.send(getContext());
        }
        updateToolbar(true);
        if (populateAnimationMenu()) {
            return;
        }
        ObjToGltfConverter.showConversionFailedDialog(this, getFragmentManager(), this.mMeshHolderFragment.getFileSet().getUri());
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
    protected void onActionClick() {
        SharedPreferences defaultSharedPreferences = PreferenceManager.getDefaultSharedPreferences(getContext());
        boolean z = defaultSharedPreferences.getBoolean(KEY_DONT_SHOW_AGAIN, false);
        boolean z2 = defaultSharedPreferences.getBoolean(ShareAllAnimationsConfirmDialog.KEY_DONT_SHOW_ANIM_INFO, false);
        IFileSet fileSet = this.mMeshHolderFragment.getFileSet();
        Shareable shareable = getShareable();
        int i = this.mSelectedAnimation != -1 ? 1 : 0;
        shareable.setFileSet(fileSet).setShareType(i != 0 ? Shareable.Type.ANIMATION : Shareable.Type.DEFAULT).setUrl(i != 0 ? fileSet.getRiggedFileUrl() : fileSet.getZipFileUrl()).setScanFormat(i).setViewMatrix(this.mSphanRenderer == null ? null : this.mSphanRenderer.getViewMatrix());
        if (shareable.getRecipient() == null && shareable.isRecipientRequired()) {
            HitEvent.ANIMATION_SHARE_BUTTON_CLICKED.send(getContext());
            if (z2) {
                SharingFragment sharingFragmentNewInstance = SharingFragment.newInstance(shareable);
                FragmentTransaction fragmentTransactionBeginTransaction = getFragmentManager().beginTransaction();
                fragmentTransactionBeginTransaction.replace(R.id.fragment_container, sharingFragmentNewInstance);
                fragmentTransactionBeginTransaction.addToBackStack(SharingFragment.class.getName());
                fragmentTransactionBeginTransaction.commit();
                return;
            }
            showAllAnimationsWillBeSharedDialog(shareable);
            return;
        }
        if (z) {
            switch (shareable.getShareType()) {
                case ANIMATION:
                    if (z2) {
                        shareable.share(getContext());
                    } else {
                        showAllAnimationsWillBeSharedDialog(shareable);
                    }
                    return;
                default:
                    shareable.share(getContext());
                    return;
            }
        }
        FileShareDialog.newInstance(KEY_DONT_SHOW_AGAIN, shareable).show(getFragmentManager(), (String) null);
    }

    private void showAllAnimationsWillBeSharedDialog(Shareable shareable) {
        ShareAllAnimationsConfirmDialog.newInstance(ShareAllAnimationsConfirmDialog.KEY_DONT_SHOW_ANIM_INFO, shareable).show(getFragmentManager(), (String) null);
    }

    @Override // com.sonymobile.scan3d.viewer.MeshHolderFragment.MeshLoadingListener
    public void onMeshLoaded(Uri uri, ModelContainer modelContainer) {
        RigModelManager rigModelManager = RigModelManager.getInstance();
        if (uri == null || !rigModelManager.isRigging(uri)) {
            return;
        }
        rigModelManager.addListener(uri, this);
    }

    @Override // android.os.Handler.Callback
    public boolean handleMessage(Message message) {
        switch (message.what) {
            case 0:
                ((ViewerActivity) getActivity()).finishWithResult((Uri) message.obj, message.arg1);
                break;
            case 1:
                getActivity().finish();
                break;
            case 2:
                getFragmentManager().popBackStack();
                break;
        }
        return true;
    }

    public static class FileShareDialog extends DismissablePrivacyFragment {
        private static final String ARG_SHAREABLE = "shareable";

        @Override // com.sonymobile.scan3d.viewer.DismissablePrivacyFragment
        protected void onPositiveAnswer() {
            boolean z = PreferenceManager.getDefaultSharedPreferences(getContext()).getBoolean(ShareAllAnimationsConfirmDialog.KEY_DONT_SHOW_ANIM_INFO, false);
            Shareable shareable = new Shareable(getArguments().getBundle("shareable"));
            if (!z && shareable.getScanFormat() == 1) {
                ShareAllAnimationsConfirmDialog.newInstance(ShareAllAnimationsConfirmDialog.KEY_DONT_SHOW_ANIM_INFO, shareable).show(getFragmentManager(), (String) null);
            } else {
                shareable.share(getContext());
            }
        }

        @Override // com.sonymobile.scan3d.viewer.DismissablePrivacyFragment
        protected String getTitle() {
            return getString(R.string.dialog_note_title);
        }

        @Override // com.sonymobile.scan3d.viewer.DismissablePrivacyFragment
        protected String getDescription() {
            return getString(R.string.consent_file_share_description);
        }

        public static FileShareDialog newInstance(String str, Shareable shareable) {
            Bundle bundle = new Bundle();
            bundle.putString(DismissablePrivacyFragment.ARG_CHECKBOX_KEY, str);
            bundle.putBundle("shareable", shareable.toBundle());
            FileShareDialog fileShareDialog = new FileShareDialog();
            fileShareDialog.setArguments(bundle);
            return fileShareDialog;
        }
    }

    public static class ShareAllAnimationsConfirmDialog extends DismissablePrivacyFragment {
        private static final String ARG_SHAREABLE = "shareable";
        public static final String KEY_DONT_SHOW_ANIM_INFO = "ShareAnimationsConfirmDialog_dontShowAgain";

        @Override // com.sonymobile.scan3d.viewer.DismissablePrivacyFragment
        protected void onPositiveAnswer() {
            Shareable shareable = new Shareable(getArguments().getBundle("shareable"));
            if (shareable.getRecipient() != null || !shareable.isRecipientRequired()) {
                shareable.share(getContext());
                return;
            }
            SharingFragment sharingFragmentNewInstance = SharingFragment.newInstance(shareable);
            FragmentTransaction fragmentTransactionBeginTransaction = getFragmentManager().beginTransaction();
            fragmentTransactionBeginTransaction.replace(R.id.fragment_container, sharingFragmentNewInstance);
            fragmentTransactionBeginTransaction.addToBackStack(SharingFragment.class.getName());
            fragmentTransactionBeginTransaction.commit();
        }

        @Override // com.sonymobile.scan3d.viewer.DismissablePrivacyFragment
        protected String getTitle() {
            return getString(R.string.dialog_note_title);
        }

        @Override // com.sonymobile.scan3d.viewer.DismissablePrivacyFragment
        protected String getDescription() {
            return getString(R.string.share_animation_dialog_text);
        }

        public static ShareAllAnimationsConfirmDialog newInstance(String str, Shareable shareable) {
            Bundle bundle = new Bundle();
            bundle.putString(DismissablePrivacyFragment.ARG_CHECKBOX_KEY, str);
            bundle.putBundle("shareable", shareable.toBundle());
            ShareAllAnimationsConfirmDialog shareAllAnimationsConfirmDialog = new ShareAllAnimationsConfirmDialog();
            shareAllAnimationsConfirmDialog.setArguments(bundle);
            return shareAllAnimationsConfirmDialog;
        }
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseAnimationFragment, com.sonymobile.scan3d.animation.ObjToGltfConverter.GltfConversionListener
    public void onConversionDone(Uri uri) {
        DebugLog.d(AnimationFragment.class.getName(), "onConversionDone()");
        Bundle arguments = getArguments();
        Shareable shareable = new Shareable(arguments.getBundle(KEY_SHAREABLE));
        if (arguments.getBoolean(KEY_SHARE_INSTANTLY)) {
            shareable.setScanFormat(1).setShareType(Shareable.Type.ANIMATION);
            shareable.share(getContext(), this.mHandler);
            if (arguments.getBoolean(KEY_CLOSE_AFTER_SHARE)) {
                getFragmentManager().popBackStack();
                return;
            }
            return;
        }
        if (arguments.getBoolean(KEY_PICKER_INTENT)) {
            if (getActivity() instanceof ViewerActivity) {
                SharingUtil.shareRiggedFile(getContext(), this.mHandler, uri, shareable.getTextureSize());
                return;
            }
            return;
        }
        super.onConversionDone(uri);
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseAnimationFragment, com.sonymobile.scan3d.animation.ObjToGltfConverter.GltfConversionListener
    public void onConversionFailed(Uri uri) {
        if (getContext() != null) {
            this.mOngoingAnimation.setVisibility(8);
            ObjToGltfConverter.showConversionFailedDialog(this, getFragmentManager(), uri);
            this.mTextureView.queueEvent(() -> {
                if (this.mSphanRenderer.isEffectActive()) {
                    this.mSphanRenderer.stopEffect();
                }
            });
        }
    }

    @Override // com.sonymobile.scan3d.animation.ObjToGltfConverter.ErrorDialog.ErrorDialogListener
    public void onConvertErrorDialogDismiss(DialogFragment dialogFragment, Uri uri) {
        if (getArguments().getBoolean(KEY_PICKER_INTENT)) {
            FragmentActivity activity = getActivity();
            if (activity instanceof ViewerActivity) {
                ((ViewerActivity) activity).pickRiggedFileFailed(Factory.create(getContext(), uri));
                return;
            } else {
                getFragmentManager().popBackStackImmediate();
                return;
            }
        }
        getFragmentManager().popBackStackImmediate();
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.component.AnimationMenu.AnimationMenuListener
    public void onItemPicked(Pickable pickable) {
        if (pickable.getWhichPicker() == 0) {
            this.mSelectedAnimation = ((Integer) pickable.getIdentifier()).intValue();
            HitEvent.ANIMATION_SELECTED.send(getContext(), this.mSphanRenderer.getAnimationName(this.mSelectedAnimation), this.mSelectedAnimation);
            if (this.mSelectedAnimation == -1) {
                showStaticMesh();
            } else {
                startAnimationPlayback();
            }
        }
        updateToolbarTitle(true);
    }

    private void onRiggedMeshMissing() {
        this.mTextureView.queueEvent(() -> {
            if (this.mSphanRenderer.isEffectActive()) {
                this.mSphanRenderer.stopEffect();
            }
            this.mSphanRenderer.startProgressEffect();
        });
        Uri uri = this.mMeshHolderFragment.getFileSet().getUri();
        if (uri != null) {
            RigModelManager.getInstance().rigModel(getContext(), this.mSphanRenderer, uri, this);
        }
    }

    private boolean populateAnimationMenu() {
        if (this.mSphanRenderer.getMeshCount() == 0) {
            return false;
        }
        Shareable shareable = new Shareable(getArguments().getBundle(KEY_SHAREABLE));
        int numAnimations = this.mSphanRenderer.getNumAnimations();
        Context context = getContext();
        if (context == null) {
            return false;
        }
        ArrayList<Pickable> arrayList = new ArrayList<>();
        if (shareable.getShareType() == Shareable.Type.DEFAULT) {
            arrayList.add(new Pickable(-1, AnimationResources.NONE.getDrawable(context), AnimationResources.NONE.getNameId(context), 0));
            if (getView() != null) {
                getView().findViewById(R.id.select_include_animations_info_text).setVisibility(0);
            }
        }
        for (int i = 0; i < numAnimations; i++) {
            AnimationResources animationResourcesFromString = AnimationResources.fromString(context, this.mSphanRenderer.getAnimationName(i));
            if (animationResourcesFromString != null) {
                arrayList.add(new Pickable(Integer.valueOf(i), animationResourcesFromString.getDrawable(context), animationResourcesFromString.getNameId(context), 0));
            }
        }
        Optional optionalFindFirst = arrayList.stream().filter(pickable -> ((Integer) pickable.getIdentifier()).intValue() == this.mSelectedAnimation).findFirst();
        if (arrayList.size() == 0) {
            return false;
        }
        this.mAnimationMenu.addPickerMenu(0, arrayList, arrayList.indexOf(optionalFindFirst.orElse(arrayList.get(0))));
        this.mAnimationMenu.setup(R.color.background_20_percent_opaque);
        if (this.mSelectedAnimation == -1) {
            showStaticMesh();
            return true;
        }
        startAnimationPlayback();
        return true;
    }

    private void showStaticMesh() {
        this.mTextureView.removeAnimationListener();
        this.mTextureView.queueEvent(() -> this.mSphanRenderer.showStaticMesh());
    }

    private void startAnimationPlayback() {
        if (!this.mTextureView.hasAnimationListener()) {
            this.mTextureView.setAnimationListener(() -> {
                this.mSphanRenderer.startAnimation(this.mSelectedAnimation);
                this.mTextureView.requestRender();
            });
        }
        if (this.mSelectedAnimation != -1 && this.mSphanRenderer.getMeshCount() > 1) {
            this.mSphanRenderer.showRiggedMesh();
        }
        this.mSphanRenderer.startAnimation(this.mSelectedAnimation);
        this.mTextureView.requestRender();
    }

    private void updateToolbar(boolean z) {
        Button button = (Button) this.mToolBar.findViewById(R.id.end_action);
        if (z) {
            this.mToolBar.setNavigationIcon(R.drawable.ic_close_24dp);
            this.mToolBar.setNavigationContentDescription(getString(R.string.accessibility_close_button));
            this.mToolBar.setBackgroundColor(getContext().getColor(R.color.toolbar_background));
            button.setText(R.string.share_tab_share);
            button.setContentDescription(getString(R.string.share_tab_share));
            button.setVisibility(0);
            button.setOnClickListener((UserInputReducer.InputReducer) view -> onActionClick());
            this.mOngoingAnimation.setVisibility(8);
        } else {
            this.mToolBar.setNavigationIcon(R.drawable.ic_arrow_back_24dp);
            this.mToolBar.setNavigationContentDescription(getString(R.string.accessibility_back_button));
            this.mToolBar.setBackgroundColor(getContext().getColor(android.R.color.transparent));
            button.setVisibility(8);
            this.mOngoingAnimation.setVisibility(0);
        }
        updateToolbarTitle(z);
    }

    private void updateToolbarTitle(boolean z) {
        View view = getView();
        if (view != null) {
            Toolbar toolbar = (Toolbar) view.findViewById(R.id.toolbar);
            if (z) {
                if (getShareable().getShareType() == Shareable.Type.DEFAULT) {
                    toolbar.setTitle(this.mSelectedAnimation == -1 ? R.string.share_without_animations_title : R.string.share_animations_title);
                    return;
                } else {
                    toolbar.setTitle(R.string.animation_title);
                    return;
                }
            }
            toolbar.setTitle("");
        }
    }

    private Shareable getShareable() {
        return new Shareable(getArguments().getBundle(KEY_SHAREABLE));
    }
}
