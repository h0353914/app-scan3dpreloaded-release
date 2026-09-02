package com.sonymobile.scan3d.viewer.fragments;

import android.content.ComponentName;
import android.content.ContentUris;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.Resources;
import android.database.Cursor;
import android.graphics.drawable.AnimationDrawable;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.os.Parcelable;
import android.preference.PreferenceManager;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.LinearLayout;
import android.widget.PopupMenu;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.ToggleButton;
import android.widget.ViewSwitcher;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.annotation.StringRes;
import androidx.databinding.OnRebindCallback;
import androidx.databinding.ViewDataBinding;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentTransaction;
import androidx.loader.app.LoaderManager;
import androidx.loader.content.Loader;
import com.sonymobile.scan3d.PermissionUtil;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.Scan3DApp;
import com.sonymobile.scan3d.SimpleLifecycle;
import com.sonymobile.scan3d.analytics.HitEvent;
import com.sonymobile.scan3d.animation.RigModelManager;
import com.sonymobile.scan3d.databinding.ComponentSharingBarBinding;
import com.sonymobile.scan3d.editor.EditorActivity;
import com.sonymobile.scan3d.sfmc.FaceMimicActivity;
import com.sonymobile.scan3d.storageservice.Config;
import com.sonymobile.scan3d.storageservice.authentication.AccountUtils;
import com.sonymobile.scan3d.storageservice.authentication.PrivacyActivity;
import com.sonymobile.scan3d.storageservice.authentication.PrivacyPolicies;
import com.sonymobile.scan3d.storageservice.authentication.PrivacyPolicy;
import com.sonymobile.scan3d.storageservice.authentication.SigninActivity;
import com.sonymobile.scan3d.storageservice.content.Jobs;
import com.sonymobile.scan3d.storageservice.provider.Factory;
import com.sonymobile.scan3d.storageservice.provider.FileTasks;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.storageservice.provider.Improvement;
import com.sonymobile.scan3d.storageservice.ui.upload.ServiceProvider;
import com.sonymobile.scan3d.storageservice.utils.ConnectionUtils;
import com.sonymobile.scan3d.utils.UserInputReducer;
import com.sonymobile.scan3d.viewer.HintView;
import com.sonymobile.scan3d.viewer.MeshHolderFragment;
import com.sonymobile.scan3d.viewer.ModelContainer;
import com.sonymobile.scan3d.viewer.OnNameChangedListener;
import com.sonymobile.scan3d.viewer.ProxyReceiver;
import com.sonymobile.scan3d.viewer.SphanGLTextureView;
import com.sonymobile.scan3d.viewer.ViewerActivity;
import com.sonymobile.scan3d.viewer.YesNoQuestionFragment;
import com.sonymobile.scan3d.viewer.asynctasks.ImproveTask;
import com.sonymobile.scan3d.viewer.sharing.Shareable;
import com.sonymobile.scan3d.viewer.sharing.SharingFragment;
import com.sonymobile.scan3d.wallpaper.SphinxWallpaperService;
import java.math.BigInteger;
import java.util.List;

public class ViewerFragment extends BaseAnimationFragment implements YesNoQuestionFragment.OnYesNoListener, OnNameChangedListener, LoaderManager.LoaderCallbacks<Cursor>, UserInputReducer.InputReducer, ConnectionUtils.ConnectionListener, MeshHolderFragment.MeshLoadingListener, PopupMenu.OnMenuItemClickListener {
    private static final String DIALOG_TAG = "dialog_tag";
    private static final String KEY_ANIMATION_TOGGLE = "animation_toggle";
    private static final String KEY_HINT_PROMO_DISMISSED = "promo_dismissed";
    private static final String KEY_NEW_SCAN = "key_new_scan";
    private static final int PERMISSION_REQUEST_CODE_FACE_MIMIC = 1000;
    private static final int QUESTION_ID_DELETE = 0;
    private static final int QUESTION_ID_DELETE_ANIMATION = 3;
    private static final int QUESTION_ID_UNSHARE = 2;
    private static final int QUESTION_ID_WALLPAPER = 1;
    private static final int REQUEST_CODE_CHANGE_WALLPAPER_FOR_DELETE = 8002;
    private static final int REQUEST_CODE_EDIT_MODEL = 8003;
    private static final int REQUEST_CODE_PRIVACY_AGREEMENT = 8004;
    private static final int REQUEST_CODE_SIGN_IN = 8005;
    private static final String VIEWER_PREFERENCE_DISMISSED = "viewer_hints_dismissed";
    private int mAnimationToggle;
    private ViewSwitcher mAnimationViewSwitcher;
    private ComponentSharingBarBinding mBottomBar;
    private ConnectionUtils mConnectionUtils;
    private Runnable mFileSetChangeRunnable;
    private HintView mHintView;
    private List<Improvement> mImprovements;
    private boolean mIsPromoHintDismissed;
    private ModelContainer mModelContainer;
    private TextView mNameView;
    private View mPermissionsContainer;
    private Handler mPermissionsHandler;
    private ToggleButton mTextureToggle;

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
    public int getContentLayout() {
        return R.layout.fragment_viewer;
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
    int getControlsView() {
        return R.id.non_fullscreen_window;
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseAnimationFragment
    public int getTextureViewId() {
        return R.id.glTextureView;
    }

    @Override // androidx.loader.app.LoaderManager.LoaderCallbacks
    public void onLoaderReset(@NonNull Loader<Cursor> loader) {
    }

    @Override // com.sonymobile.scan3d.viewer.MeshHolderFragment.MeshLoadingListener
    public void onMeshLoading(Uri uri) {
    }

    @Override // com.sonymobile.scan3d.viewer.YesNoQuestionFragment.OnYesNoListener
    public void onNegativeAnswer(int i, Parcelable parcelable) {
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseAnimationFragment, com.sonymobile.scan3d.SimpleLifecycle.SimpleLifecycleObserver
    public void onStop(SimpleLifecycle.SimpleLifecycleOwner simpleLifecycleOwner) {
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
    protected boolean requiresFullScreen() {
        return true;
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
    protected boolean showToolbar() {
        return false;
    }

    public static Fragment newInstance(boolean z) {
        ViewerFragment viewerFragment = new ViewerFragment();
        Bundle bundle = new Bundle();
        bundle.putBoolean(KEY_NEW_SCAN, z);
        viewerFragment.setArguments(bundle);
        return viewerFragment;
    }

    public static Fragment newInstance() {
        return newInstance(false);
    }

    @Override // androidx.fragment.app.Fragment
    public void onActivityCreated(@Nullable Bundle bundle) {
        super.onActivityCreated(bundle);
        LoaderManager.getInstance(getActivity()).initLoader(0, null, this);
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, androidx.fragment.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mPermissionsHandler = new Handler();
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseAnimationFragment, com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View viewOnCreateView = super.onCreateView(layoutInflater, viewGroup, bundle);
        showProgressDialog(R.string.saving_print_geometry, true);
        this.mMeshHolderFragment.setMeshLoadingListener(this);
        this.mHintView = (HintView) viewOnCreateView.findViewById(R.id.hint_container);
        if (bundle != null) {
            this.mIsPromoHintDismissed = bundle.getBoolean(KEY_HINT_PROMO_DISMISSED, false);
            this.mAnimationToggle = bundle.getInt(KEY_ANIMATION_TOGGLE, 0);
        }
        ViewGroup viewGroup2 = (ViewGroup) viewOnCreateView.findViewById(R.id.bottom_bar);
        if (viewGroup2 != null) {
            setupBottomBar(layoutInflater, viewGroup2);
        }
        View viewFindViewById = viewOnCreateView.findViewById(R.id.navigation_button_parent);
        viewFindViewById.setOnClickListener((UserInputReducer.InputReducer) view -> onNavigationClick());
        viewFindViewById.setContentDescription(getString(getNavigationAccessibility()));
        this.mNameView = (TextView) viewOnCreateView.findViewById(R.id.viewer_name);
        View viewFindViewById2 = viewOnCreateView.findViewById(R.id.overflow_menu_parent);
        viewFindViewById2.setOnClickListener(this);
        viewFindViewById2.setContentDescription(getString(R.string.accessibility_overflow_menu));
        this.mTextureToggle = (ToggleButton) viewOnCreateView.findViewById(R.id.texture_knob);
        viewOnCreateView.findViewById(R.id.texture_knob_parent).setOnClickListener(this);
        this.mAnimationViewSwitcher = (ViewSwitcher) viewOnCreateView.findViewById(R.id.toggle_animation);
        this.mAnimationViewSwitcher.setDisplayedChild(this.mAnimationToggle);
        this.mAnimationViewSwitcher.setOnClickListener(this);
        this.mFileSetChangeRunnable = () -> {
            if (this.mModelContainer != null) {
                this.mMeshHolderFragment.getFileSet();
                updateAnimationState();
            }
        };
        this.mPermissionsContainer = viewOnCreateView.findViewById(R.id.permissions_container);
        return viewOnCreateView;
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseAnimationFragment, com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, androidx.fragment.app.Fragment
    public void onResume() {
        this.mViewMatrix = this.mMeshHolderFragment.getViewerViewMatrix();
        super.onResume();
        this.mMeshHolderFragment.setFileSetChangeRunnable(this.mFileSetChangeRunnable);
        this.mFileSetChangeRunnable.run();
        updateAnimationState();
        if (this.mConnectionUtils == null) {
            this.mConnectionUtils = new ConnectionUtils(getContext());
            notifyLoadFinished();
        }
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseAnimationFragment, com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, androidx.fragment.app.Fragment
    public void onPause() {
        super.onPause();
        if (this.mMeshHolderFragment != null) {
            this.mMeshHolderFragment.setFileSetChangeRunnable(null);
            if (this.mSphanRenderer != null) {
                this.mMeshHolderFragment.setViewerViewMatrix(this.mSphanRenderer.getViewMatrix());
            }
        }
        this.mTextureView.queueEvent(() -> {
            if (this.mSphanRenderer != null) {
                this.mSphanRenderer.stopIdleAnimation();
            }
        });
        ConnectionUtils connectionUtils = this.mConnectionUtils;
        if (connectionUtils != null) {
            connectionUtils.removeListener();
            this.mConnectionUtils = null;
        }
        dismissProgressDialog();
    }

    @Override // androidx.fragment.app.Fragment
    public void onDetach() {
        if (this.mMeshHolderFragment != null) {
            this.mMeshHolderFragment.disableFileSetObserver();
        }
        super.onDetach();
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseAnimationFragment, com.sonymobile.scan3d.SimpleLifecycle.SimpleLifecycleObserver
    public void onStart(SimpleLifecycle.SimpleLifecycleOwner simpleLifecycleOwner) {
        this.mSphanRenderer.setBackground(0);
        this.mSphanRenderer.setPlainShading(true);
        if (this.mSphanRenderer.isEffectActive()) {
            this.mSphanRenderer.stopEffect();
        }
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseAnimationFragment, com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, androidx.fragment.app.Fragment
    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putBoolean(KEY_HINT_PROMO_DISMISSED, this.mIsPromoHintDismissed);
        bundle.putInt(KEY_ANIMATION_TOGGLE, this.mAnimationToggle);
    }

    @Override // androidx.fragment.app.Fragment
    public void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        switch (i) {
            case REQUEST_CODE_CHANGE_WALLPAPER_FOR_DELETE /* 8002 */:
                if (!SphinxWallpaperService.isCurrentWallpaper(getContext(), getData())) {
                    FileTasks.deleteFileSet(getContext(), getData(), true);
                    HitEvent.DELETE.send(getContext(), 1L);
                    getActivity().finish();
                }
                break;
            case REQUEST_CODE_EDIT_MODEL /* 8003 */:
                if (i2 == -1) {
                    Uri data = intent.getData();
                    if (data != null) {
                        FragmentActivity activity = getActivity();
                        activity.startActivity(ViewerActivity.getViewerModeIntent(activity, data));
                        activity.finish();
                    } else {
                        Toast.makeText(getContext(), R.string.editor_failed_to_save_model, 1).show();
                    }
                }
                break;
            case REQUEST_CODE_PRIVACY_AGREEMENT /* 8004 */:
                if (i2 == -1) {
                    AccountUtils.acceptPostProcessing(getContext());
                }
                break;
            case REQUEST_CODE_SIGN_IN /* 8005 */:
                break;
        }
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseAnimationFragment
    public void onMeshesLoadedIntoSphan(boolean z, boolean z2) {
        if (z) {
            this.mTextureToggle.setChecked(this.mUseUntexturedShading);
            notifyLoadFinished();
        } else {
            handleFailedMesh();
        }
    }

    @Override // android.widget.PopupMenu.OnMenuItemClickListener
    public boolean onMenuItemClick(MenuItem menuItem) {
        switch (menuItem.getItemId()) {
            case R.id.menu_delete /* 2131296538 */:
                showDeleteDialog(0, R.string.dialog_delete_scan_description, R.string.storage_service_dialog_button_delete_txt);
                break;
            case R.id.menu_delete_animation /* 2131296539 */:
                showDeleteDialog(3, R.string.dialog_delete_animation_description, R.string.storage_service_dialog_button_remove_txt);
                break;
            case R.id.menu_details /* 2131296540 */:
                showDetailsDialog();
                break;
            case R.id.menu_edit_name /* 2131296541 */:
                showEditNameDialog();
                break;
            case R.id.menu_unshare /* 2131296545 */:
                showUnshareDialog();
                break;
            case R.id.menu_view_animated /* 2131296546 */:
                ServiceProvider.WEBVIEWER.view(getContext(), this.mMeshHolderFragment.getFileSet(), Shareable.Type.ANIMATION);
                break;
            case R.id.menu_view_prop /* 2131296547 */:
                ServiceProvider.WEBVIEWER.view(getContext(), this.mMeshHolderFragment.getFileSet(), Shareable.Type.PROPS);
                break;
            case R.id.menu_view_static /* 2131296548 */:
                ServiceProvider.WEBVIEWER.view(getContext(), this.mMeshHolderFragment.getFileSet(), Shareable.Type.DEFAULT);
                break;
        }
        return true;
    }

    @Override // com.sonymobile.scan3d.viewer.MeshHolderFragment.MeshLoadingListener
    public void onMeshLoaded(Uri uri, ModelContainer modelContainer) {
        if (isAdded()) {
            RigModelManager rigModelManager = RigModelManager.getInstance();
            if (uri != null && rigModelManager.isRigging(uri)) {
                rigModelManager.addListener(uri, this);
            }
            this.mModelContainer = modelContainer;
            this.mNameView.setText(this.mMeshHolderFragment.getName());
            if (isResumed()) {
                this.mMeshHolderFragment.setFileSetChangeRunnable(this.mFileSetChangeRunnable);
                this.mFileSetChangeRunnable.run();
            }
            enableWebviewStatusUpdates();
            IFileSet fileSet = this.mMeshHolderFragment.getFileSet();
            View view = getView();
            if (view != null) {
                if (fileSet.isRiggable()) {
                    view.findViewById(R.id.action_animate).setVisibility(0);
                } else {
                    view.findViewById(R.id.action_animate).setVisibility(8);
                }
                int scanType = fileSet.getScanType();
                if ((scanType == 256 || scanType == 257) && Scan3DApp.isCustomFaceMimicEnabled()) {
                    view.findViewById(R.id.action_face_mimic).setVisibility(0);
                } else {
                    view.findViewById(R.id.action_face_mimic).setVisibility(8);
                }
                updateSharingBarItemWidths();
            }
            notifyLoadFinished();
        }
    }

    @Override // com.sonymobile.scan3d.viewer.MeshHolderFragment.MeshLoadingListener
    public void onMeshLoadFailed(Uri uri) {
        handleFailedMesh();
    }

    @Override // com.sonymobile.scan3d.viewer.YesNoQuestionFragment.OnYesNoListener
    public void onPositiveAnswer(int i, Parcelable parcelable) {
        switch (i) {
            case 0:
                if (SphinxWallpaperService.isCurrentWallpaper(getContext(), getData())) {
                    showChangeWallpaperDialog();
                    return;
                }
                FileTasks.deleteFileSet(getContext(), getData(), true);
                HitEvent.DELETE.send(getContext(), 1L);
                getActivity().finish();
                return;
            case 1:
                startActivityForResult(new Intent("android.intent.action.SET_WALLPAPER"), REQUEST_CODE_CHANGE_WALLPAPER_FOR_DELETE);
                return;
            case 2:
                ServiceProvider.WEBVIEWER.unshare(getContext(), this.mMeshHolderFragment.getFileSet());
                return;
            case 3:
                FileTasks.deleteAnimation(getContext(), getData());
                this.mAnimationToggle = 0;
                this.mTextureView.queueEvent(() -> {
                    this.mSphanRenderer.onGLContextDestroyed();
                    this.mSphanRenderer.removeMeshes();
                    this.mMeshHolderFragment.loadMeshIntoSphan();
                    this.mSphanRenderer.onGLContextCreated();
                    this.mTextureView.requestRender();
                    this.mHandler.post(() -> updateAnimationState());
                });
                return;
            default:
                throw new IllegalStateException("YesNoDialog with id = " + i + " is not supported");
        }
    }

    @Override // com.sonymobile.scan3d.utils.UserInputReducer.InputReducer
    public void doClick(View view) {
        switch (view.getId()) {
            case R.id.action_animate /* 2131296298 */:
                if (TextUtils.isEmpty(this.mMeshHolderFragment.getFileSet().getRiggedFileUrl())) {
                    HitEvent.ANIMATE_MODEL_CLICKED.send(getContext());
                } else {
                    HitEvent.PLAY_WITH_ANIMATIONS_CLICKED.send(getContext());
                }
                AnimationFragment animationFragmentNewInstance = AnimationFragment.newInstance((Shareable) null, false);
                FragmentTransaction fragmentTransactionBeginTransaction = getFragmentManager().beginTransaction();
                fragmentTransactionBeginTransaction.replace(R.id.fragment_container, animationFragmentNewInstance);
                fragmentTransactionBeginTransaction.addToBackStack(AnimationFragment.class.getName());
                fragmentTransactionBeginTransaction.commit();
                return;
            case R.id.action_edit /* 2131296310 */:
                Intent intent = new Intent(getContext(), (Class<?>) EditorActivity.class);
                intent.putExtra(EditorActivity.EXTRA_MODEL, this.mModelContainer);
                intent.putExtra("name", this.mMeshHolderFragment.getName());
                intent.putExtra(EditorActivity.EXTRA_FACE_DETECTED, this.mMeshHolderFragment.getFileSet().isRiggable());
                startActivityForResult(intent, REQUEST_CODE_EDIT_MODEL);
                return;
            case R.id.action_face_mimic /* 2131296311 */:
                String[] missingPermissions = PermissionUtil.getMissingPermissions(getContext(), PermissionUtil.Permissions.CAMERA.getPermissions());
                if (missingPermissions.length > 0) {
                    setupPermissionsButton(R.string.face_mimic_camera_permissions_needed, missingPermissions, 1000);
                    requestPermissions(missingPermissions, 1000);
                    return;
                } else {
                    launchFaceMimic();
                    return;
                }
            case R.id.action_share /* 2131296323 */:
                HitEvent.SHARE_BUTTON_CLICKED.send(getContext());
                SharingFragment sharingFragmentNewInstance = SharingFragment.newInstance(this.mMeshHolderFragment.getFileSet(), this.mSphanRenderer.getViewMatrix(), SharingFragment.Tab.SHARE);
                FragmentTransaction fragmentTransactionBeginTransaction2 = getFragmentManager().beginTransaction();
                fragmentTransactionBeginTransaction2.replace(R.id.fragment_container, sharingFragmentNewInstance);
                fragmentTransactionBeginTransaction2.addToBackStack(SharingFragment.class.getName());
                fragmentTransactionBeginTransaction2.commit();
                return;
            case R.id.overflow_menu_parent /* 2131296578 */:
                PopupMenu popupMenu = new PopupMenu(view.getContext(), view);
                Menu menu = popupMenu.getMenu();
                popupMenu.getMenuInflater().inflate(R.menu.menu_viewer, menu);
                popupMenu.setOnMenuItemClickListener(this);
                MenuItem menuItemFindItem = menu.findItem(R.id.menu_delete_animation);
                IFileSet fileSet = this.mMeshHolderFragment.getFileSet();
                if (fileSet != null) {
                    menuItemFindItem.setVisible(!TextUtils.isEmpty(fileSet.getRiggedFileUrl()));
                }
                popupMenu.show();
                return;
            case R.id.texture_knob_parent /* 2131296744 */:
                final boolean z = !this.mTextureToggle.isChecked();
                this.mTextureToggle.setChecked(z);
                this.mTextureView.queueEvent(() -> {
                    this.mUseUntexturedShading = z;
                    this.mSphanRenderer.setUntexturedShading(z);
                    this.mTextureView.requestRender();
                });
                return;
            case R.id.toggle_animation /* 2131296761 */:
                this.mAnimationViewSwitcher.showNext();
                this.mAnimationToggle = this.mAnimationViewSwitcher.getDisplayedChild();
                updateAnimationState();
                return;
            case R.id.webicon_parent /* 2131296808 */:
                PopupMenu popupMenu2 = new PopupMenu(getContext(), view);
                Menu menu2 = popupMenu2.getMenu();
                popupMenu2.getMenuInflater().inflate(R.menu.menu_public, menu2);
                popupMenu2.setOnMenuItemClickListener(this);
                IFileSet fileSet2 = this.mMeshHolderFragment.getFileSet();
                if (fileSet2 != null) {
                    long sharedMeshes = fileSet2.getSharedMeshes();
                    menu2.findItem(R.id.menu_view_static).setVisible(BigInteger.valueOf(sharedMeshes).testBit(1));
                    menu2.findItem(R.id.menu_view_animated).setVisible(BigInteger.valueOf(sharedMeshes).testBit(4));
                    menu2.findItem(R.id.menu_view_prop).setVisible(BigInteger.valueOf(sharedMeshes).testBit(5));
                }
                popupMenu2.show();
                return;
            default:
                throw new RuntimeException("Unsupported View: " + view);
        }
    }

    @Override // androidx.fragment.app.Fragment
    public void onRequestPermissionsResult(int i, @NonNull String[] strArr, @NonNull int[] iArr) {
        boolean z = false;
        int i2 = 0;
        while (true) {
            if (i2 >= strArr.length) {
                z = true;
                break;
            } else if (iArr[i2] != 0) {
                break;
            } else {
                i2++;
            }
        }
        if (i == 1000) {
            this.mPermissionsHandler.removeCallbacksAndMessages(null);
            if (z) {
                if (this.mPermissionsContainer.getVisibility() == 0) {
                    this.mPermissionsHandler.post(PermissionUtil.removePermissionsContainer(this.mPermissionsContainer));
                }
                launchFaceMimic();
                return;
            }
            PermissionUtil.showPermissionsSnackbar(this.mPermissionsHandler, this.mPermissionsContainer);
            return;
        }
        throw new IllegalStateException("Unexpected permission result code, " + i);
    }

    @Override // com.sonymobile.scan3d.viewer.OnNameChangedListener
    public void onNameChanged(String str) {
        this.mMeshHolderFragment.setName(str);
        this.mNameView.setText(this.mMeshHolderFragment.getName());
    }

    @Override // androidx.loader.app.LoaderManager.LoaderCallbacks
    @NonNull
    public Loader<Cursor> onCreateLoader(int i, Bundle bundle) {
        return Factory.createImprovementLoader(getContext(), "parent_id=?", new String[]{String.valueOf(ContentUris.parseId(getActivity().getIntent().getData()))});
    }

    @Override // androidx.loader.app.LoaderManager.LoaderCallbacks
    public void onLoadFinished(@NonNull Loader<Cursor> loader, Cursor cursor) {
        this.mImprovements = Factory.createImprovementRecords(cursor);
        getActivity().reportFullyDrawn();
        notifyLoadFinished();
    }

    @Override // com.sonymobile.scan3d.storageservice.utils.ConnectionUtils.ConnectionListener
    public void onWifiConnected() {
        this.mHintView.post(this::handleHints);
    }

    @Override // com.sonymobile.scan3d.storageservice.utils.ConnectionUtils.ConnectionListener
    public void onWifiDisconnected() {
        this.mHintView.post(this::handleHints);
    }

    private void setupBottomBar(LayoutInflater layoutInflater, ViewGroup viewGroup) {
        this.mBottomBar = ComponentSharingBarBinding.inflate(layoutInflater, viewGroup, true);
        this.mBottomBar.addOnRebindCallback(new OnRebindCallback() { // from class: com.sonymobile.scan3d.viewer.fragments.ViewerFragment.1
            @Override // androidx.databinding.OnRebindCallback
            public void onBound(ViewDataBinding viewDataBinding) {
                if (ViewerFragment.this.mBottomBar.getImproveDrawable() instanceof AnimationDrawable) {
                    ((AnimationDrawable) ViewerFragment.this.mBottomBar.getImproveDrawable()).start();
                }
            }
        });
        viewGroup.findViewById(R.id.action_share).setOnClickListener(this);
        viewGroup.findViewById(R.id.action_edit).setOnClickListener(this);
        viewGroup.findViewById(R.id.action_animate).setOnClickListener(this);
        viewGroup.findViewById(R.id.action_face_mimic).setOnClickListener(this);
    }

    private void showUnshareDialog() {
        FragmentManager fragmentManager = getFragmentManager();
        YesNoQuestionFragment yesNoQuestionFragmentNewInstance = YesNoQuestionFragment.newInstance(2, R.string.dialog_unshare_scan_title, R.string.dialog_unshare_scan_description, R.string.storage_service_dialog_button_unshare_txt, null);
        yesNoQuestionFragmentNewInstance.setTargetFragment(this, 0);
        yesNoQuestionFragmentNewInstance.show(fragmentManager, DIALOG_TAG);
    }

    private void enableWebviewStatusUpdates() {
        this.mFileSetChangeRunnable.run();
        this.mMeshHolderFragment.enableFileSetObserver();
    }

    private void showDeleteDialog(int i, int i2, int i3) {
        FragmentManager fragmentManager = getFragmentManager();
        YesNoQuestionFragment yesNoQuestionFragmentNewInstance = YesNoQuestionFragment.newInstance(i, i2, i3);
        yesNoQuestionFragmentNewInstance.setTargetFragment(this, 0);
        yesNoQuestionFragmentNewInstance.show(fragmentManager, DIALOG_TAG);
    }

    private void updateAnimationState() {
        String string;
        if (this.mSphanRenderer == null || this.mTextureView == null) {
            return;
        }
        int meshCount = this.mSphanRenderer.getMeshCount();
        this.mAnimationViewSwitcher.setVisibility(meshCount > 1 ? 0 : 8);
        ComponentSharingBarBinding componentSharingBarBinding = this.mBottomBar;
        if (meshCount > 1) {
            string = getString(R.string.viewer_action_button_play_with_animations);
        } else {
            string = getString(R.string.viewer_action_button_animate_model);
        }
        componentSharingBarBinding.setAnimText(string);
        if (this.mAnimationToggle == 0) {
            this.mTextureView.setAnimationListener(null);
            this.mTextureView.queueEvent(() -> {
                this.mSphanRenderer.stopIdleAnimation();
                this.mSphanRenderer.showStaticMesh();
            });
        } else {
            this.mTextureView.queueEvent(() -> {
                this.mTextureView.setAnimationListener(() -> {
                    this.mSphanRenderer.startAnimation(0);
                    this.mTextureView.requestRender();
                });
                this.mSphanRenderer.showRiggedMesh();
                this.mSphanRenderer.startAnimation(0);
                this.mTextureView.requestRender();
            });
        }
    }

    private void updateSharingBarItemWidths() {
        View view = getView();
        if (view != null) {
            LinearLayout linearLayout = (LinearLayout) view.findViewById(R.id.sharing_bar_action_container);
            int i = 0;
            for (int i2 = 0; i2 < linearLayout.getChildCount(); i2++) {
                if (linearLayout.getChildAt(i2).getVisibility() == 0) {
                    i++;
                }
            }
            int i3 = Resources.getSystem().getDisplayMetrics().widthPixels;
            int i4 = (i < 5 || getResources().getConfiguration().orientation != 1) ? i3 / i : (int) (i3 / (i - 0.5f));
            for (int i5 = 0; i5 < linearLayout.getChildCount(); i5++) {
                linearLayout.getChildAt(i5).getLayoutParams().width = i4;
            }
        }
    }

    private void showChangeWallpaperDialog() {
        FragmentManager fragmentManager = getFragmentManager();
        YesNoQuestionFragment yesNoQuestionFragmentNewInstance = YesNoQuestionFragment.newInstance(1, R.string.dialog_change_wallpaper_title, R.string.dialog_change_wallpaper_description, R.string.dialog_change_wallpaper_positive_button_text, null);
        yesNoQuestionFragmentNewInstance.setTargetFragment(this, 0);
        yesNoQuestionFragmentNewInstance.show(fragmentManager, DIALOG_TAG);
    }

    private void showEditNameDialog() {
        EditNameFragment.newInstance(this.mMeshHolderFragment.getName(), R.string.dialog_edit_name_title, this).show(getFragmentManager(), DIALOG_TAG);
    }

    private Uri getData() {
        return getActivity().getIntent().getData();
    }

    private void notifyLoadFinished() {
        if (this.mImprovements == null || this.mModelContainer == null || this.mConnectionUtils == null || this.mSphanRenderer == null || !this.mSphanRenderer.hasLoadedMeshes()) {
            return;
        }
        dismissProgressDialog();
        updateAnimationState();
        handleHints();
    }

    private void handleHints() {
        if (handleViewerHint() || handlePromoDismissedHint()) {
            this.mHintView.showHint();
        } else {
            this.mHintView.hideHint();
        }
    }

    private boolean handleOngoingImprovement() {
        if (this.mImprovements.isEmpty()) {
            return false;
        }
        if (this.mConnectionUtils == null) {
            this.mConnectionUtils = new ConnectionUtils(getContext());
        }
        final Improvement improvement = this.mImprovements.get(0);
        View viewAddHintLayout = this.mHintView.addHintLayout(R.layout.component_hint_viewer_improvement);
        TextView textView = (TextView) viewAddHintLayout.findViewById(R.id.text_hint_improvement);
        Button button = (Button) viewAddHintLayout.findViewById(R.id.button_hint_action);
        Button button2 = (Button) viewAddHintLayout.findViewById(R.id.button_hint_cancel);
        if (improvement.isFailed()) {
            this.mConnectionUtils.removeListener();
            button.setVisibility(0);
            if (improvement.getFailState() == 2) {
                textView.setText(R.string.quality_improvement_hint_critical_failure);
                button2.setVisibility(8);
                button.setText(android.R.string.ok);
                button.setOnClickListener((UserInputReducer.InputReducer) view -> FileTasks.delete(getActivity(), improvement.getUri()));
                return true;
            }
            textView.setText(R.string.quality_improvement_hint_failure);
            button2.setVisibility(0);
            button2.setOnClickListener((UserInputReducer.InputReducer) view -> FileTasks.delete(getActivity(), improvement.getUri()));
            button.setText(R.string.quality_improvement_retry);
            button.setOnClickListener((UserInputReducer.InputReducer) view -> startImprovementJob());
            return true;
        }
        if (improvement.isImproved()) {
            this.mConnectionUtils.removeListener();
            button2.setVisibility(8);
            textView.setText(R.string.viewer_dialog_improve_text_completed);
            button.setVisibility(0);
            button.setText(R.string.viewer_hint_improve_button_completed);
            button.setOnClickListener((UserInputReducer.InputReducer) view -> getActivity().sendBroadcast(ProxyReceiver.getImprovementIntent(getContext(), getData())));
            return true;
        }
        if (!improvement.isWaiting() && !improvement.isDownloadable()) {
            return true;
        }
        button2.setVisibility(8);
        if (this.mConnectionUtils.hasWifiConnection()) {
            textView.setText(R.string.viewer_dialog_improve_text_applying);
        } else {
            textView.setText(R.string.viewer_dialog_improve_text_connect_wifi);
        }
        textView.setPadding(0, 0, 0, 36);
        button.setVisibility(8);
        this.mConnectionUtils.addWifiListener(this);
        return true;
    }

    private boolean isNewScan() {
        return getArguments().getBoolean(KEY_NEW_SCAN);
    }

    private boolean handleViewerHint() {
        final SharedPreferences defaultSharedPreferences = PreferenceManager.getDefaultSharedPreferences(getContext());
        if (defaultSharedPreferences.getBoolean(VIEWER_PREFERENCE_DISMISSED, false)) {
            return false;
        }
        this.mHintView.addHintLayout(R.layout.component_hint_viewer_tutorial).findViewById(R.id.got_it).setOnClickListener((UserInputReducer.InputReducer) view -> {
            defaultSharedPreferences.edit().putBoolean(VIEWER_PREFERENCE_DISMISSED, true).apply();
            handleHints();
        });
        return true;
    }

    private boolean handleImprovementHint() {
        final SharedPreferences defaultSharedPreferences = PreferenceManager.getDefaultSharedPreferences(getContext());
        final String string = getString(R.string.pref_show_improvement_hint_promo);
        if (!(!this.mIsPromoHintDismissed && defaultSharedPreferences.getBoolean(string, true)) || !isNewScan() || !this.mMeshHolderFragment.getFileSet().isImprovable(getContext()) || !Config.isGooglePlayEnabled(getContext())) {
            return false;
        }
        final View viewAddHintLayout = this.mHintView.addHintLayout(R.layout.component_hint_viewer_improvement_promo);
        final CheckBox checkBox = (CheckBox) viewAddHintLayout.findViewById(R.id.checkbox);
        UserInputReducer.InputReducer inputReducer = (UserInputReducer.InputReducer) view -> {
            SharedPreferences.Editor editorEdit = defaultSharedPreferences.edit();
            int id = view.getId();
            if (id == R.id.button_learn_more) {
                view.setVisibility(8);
                ((TextView) viewAddHintLayout.findViewById(R.id.description)).setVisibility(0);
            } else if (id == R.id.button_no) {
                editorEdit.putBoolean(string, !checkBox.isChecked());
                this.mIsPromoHintDismissed = true;
                handleHints();
            } else if (id == R.id.button_yes) {
                startImprovementJob();
                editorEdit.putBoolean(string, !checkBox.isChecked());
            }
            editorEdit.apply();
        };
        viewAddHintLayout.findViewById(R.id.button_yes).setOnClickListener(inputReducer);
        viewAddHintLayout.findViewById(R.id.button_no).setOnClickListener(inputReducer);
        viewAddHintLayout.findViewById(R.id.button_learn_more).setOnClickListener(inputReducer);
        return true;
    }

    private boolean handlePromoDismissedHint() {
        final SharedPreferences defaultSharedPreferences = PreferenceManager.getDefaultSharedPreferences(getContext());
        final String string = getString(R.string.pref_key_show_promo_dismiss_hint);
        boolean z = this.mIsPromoHintDismissed && defaultSharedPreferences.getBoolean(string, true);
        if (z) {
            this.mHintView.addHintLayout(R.layout.component_hint_viewer_improvement_dismissed).findViewById(R.id.button_ok).setOnClickListener((UserInputReducer.InputReducer) view -> {
                defaultSharedPreferences.edit().putBoolean(string, false).apply();
                handleHints();
            });
        }
        return z;
    }

    private void startImprovementJob() {
        Context context = getContext();
        boolean zIsSignedIn = AccountUtils.isSignedIn(context);
        boolean zIsPostProcessAccepted = AccountUtils.isPostProcessAccepted(context);
        if (zIsSignedIn && zIsPostProcessAccepted) {
            new ImproveTask(context, Jobs.TYPE_IMPROVEMENT).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, this.mMeshHolderFragment.getFileSet().getUri());
        } else {
            if (!zIsPostProcessAccepted) {
                PrivacyPolicy postProcessPrivacy = PrivacyPolicies.getPostProcessPrivacy();
                Intent intent = new Intent(context, (Class<?>) PrivacyActivity.class);
                intent.putExtra(PrivacyActivity.EXTRA_PRIVACY, postProcessPrivacy);
                startActivityForResult(intent, REQUEST_CODE_PRIVACY_AGREEMENT);
                return;
            }
            PrivacyPolicy postProcessSigninPrivacy = PrivacyPolicies.getPostProcessSigninPrivacy();
            Intent intent2 = new Intent(context, (Class<?>) SigninActivity.class);
            intent2.putExtra(PrivacyActivity.EXTRA_PRIVACY, postProcessSigninPrivacy);
            startActivityForResult(intent2, REQUEST_CODE_SIGN_IN);
        }
    }

    private void showDetailsDialog() {
        DetailsFragment.newInstance(this.mModelContainer, this.mMeshHolderFragment.getFileSet()).show(getFragmentManager(), DIALOG_TAG);
    }

    private void updateImproveDrawable() {
        List<Improvement> list = this.mImprovements;
        if (list == null || this.mBottomBar == null) {
            return;
        }
        if (list.isEmpty() || !isImprovementOngoing(this.mImprovements)) {
            this.mBottomBar.setImproveDrawable(getResources().getDrawable(R.drawable.improvement_wand, getContext().getTheme()));
        } else {
            this.mBottomBar.setImproveDrawable((AnimationDrawable) getResources().getDrawable(R.drawable.improvement_ongoing_animation, getContext().getTheme()));
        }
    }

    private boolean isImprovementOngoing(List<Improvement> list) {
        for (Improvement improvement : list) {
            if (improvement.isImproved() || improvement.isFailed()) {
                return false;
            }
        }
        return true;
    }

    private void setupPermissionsButton(@StringRes int i, final String[] strArr, final int i2) {
        ((TextView) this.mPermissionsContainer.findViewById(R.id.permissions_text)).setText(i);
        ((Button) this.mPermissionsContainer.findViewById(R.id.permissions_button)).setOnClickListener((UserInputReducer.InputReducer) view -> {
            this.mPermissionsContainer.setVisibility(4);
            if (PermissionUtil.shouldShowRequestPermissionRationale(getActivity(), strArr)) {
                requestPermissions(strArr, i2);
            } else {
                PermissionUtil.startAppSettings(getContext());
            }
        });
    }

    private void launchFaceMimic() {
        IFileSet fileSet = this.mMeshHolderFragment.getFileSet();
        ComponentName componentName = new ComponentName(getContext(), (Class<?>) FaceMimicActivity.class);
        if (fileSet != null && fileSet.isRigged()) {
            FileTasks.shareGltfMesh(getContext(), fileSet, componentName, 0, null);
            return;
        }
        Shareable shareable = new Shareable();
        shareable.setRecipient(componentName).setTextureSize(0).setScanFormat(1).setShareType(Shareable.Type.ANIMATION).setFileSet(fileSet);
        AnimationFragment animationFragmentNewInstance = AnimationFragment.newInstance(shareable, true, false);
        FragmentTransaction fragmentTransactionBeginTransaction = getFragmentManager().beginTransaction();
        fragmentTransactionBeginTransaction.setTransition(FragmentTransaction.TRANSIT_FRAGMENT_FADE);
        fragmentTransactionBeginTransaction.replace(R.id.fragment_container, animationFragmentNewInstance);
        fragmentTransactionBeginTransaction.addToBackStack(animationFragmentNewInstance.getClass().getName());
        fragmentTransactionBeginTransaction.commit();
    }
}
