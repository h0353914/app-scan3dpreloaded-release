package com.sonymobile.scan3d.storageservice.ui.gallery;

import android.app.ActionBar;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Parcelable;
import android.preference.PreferenceManager;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.annotation.StringRes;
import androidx.fragment.app.DialogFragment;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import androidx.fragment.app.FragmentTransaction;
import androidx.loader.app.LoaderManager;
import androidx.loader.content.Loader;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout;
import com.sonymobile.scan3d.AppShortcutsManager;
import com.sonymobile.scan3d.EnvironmentError;
import com.sonymobile.scan3d.PermissionUtil;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.Scan3dActivity;
import com.sonymobile.scan3d.ScanningPermissionsActivity;
import com.sonymobile.scan3d.analytics.HitEvent;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.Config;
import com.sonymobile.scan3d.storageservice.authentication.AccountUtils;
import com.sonymobile.scan3d.storageservice.authentication.SigninActivity;
import com.sonymobile.scan3d.storageservice.provider.Factory;
import com.sonymobile.scan3d.storageservice.provider.FileTasks;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.storageservice.ui.IOnScanMenuItemClickListener;
import com.sonymobile.scan3d.storageservice.ui.IScanListener;
import com.sonymobile.scan3d.storageservice.ui.activity.GalleryActivity;
import com.sonymobile.scan3d.storageservice.ui.activity.IdleMonitor;
import com.sonymobile.scan3d.storageservice.ui.component.FabButton;
import com.sonymobile.scan3d.storageservice.ui.fragment.BackupSyncSettings;
import com.sonymobile.scan3d.storageservice.ui.fragment.SelectScanModeFragment;
import com.sonymobile.scan3d.storageservice.ui.fragment.SettingsFragment;
import com.sonymobile.scan3d.storageservice.ui.fragment.SyncFragment;
import com.sonymobile.scan3d.storageservice.ui.gallery.wizard.FirstTimeActivity;
import com.sonymobile.scan3d.storageservice.ui.gallery.wizard.QuickTipCategoriesActivity;
import com.sonymobile.scan3d.storageservice.ui.gallery.wizard.ScanTutorial;
import com.sonymobile.scan3d.storageservice.ui.tips.TipCategory;
import com.sonymobile.scan3d.storageservice.ui.tips.TipParser;
import com.sonymobile.scan3d.storageservice.ui.upload.ServiceProvider;
import com.sonymobile.scan3d.utils.UserInputReducer;
import com.sonymobile.scan3d.viewer.ViewerActivity;
import com.sonymobile.scan3d.viewer.YesNoQuestionFragment;
import com.sonymobile.scan3d.viewer.sharing.Shareable;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes.dex */
public class GalleryFragment extends SyncFragment implements SwipeRefreshLayout.OnRefreshListener, LoaderManager.LoaderCallbacks<Cursor>, SharedPreferences.OnSharedPreferenceChangeListener, ScaleGestureDetector.OnScaleGestureListener, SelectScanModeFragment.IScanChoiceListener, SortOrderDialog.OnSortOrderSelectionListener, IOnScanMenuItemClickListener, YesNoQuestionFragment.OnYesNoListener, IdleMonitor.OnIdleListener {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private static final int COACH_MARK_START_SCAN = 0;
    public static final int DEFAULT_MAX_NUMBER_OF_FAB_TIP_PRESENTATIONS = 3;
    private static final int DEFAULT_SPAN_COUNT_LANDSCAPE = 3;
    static final int DEFAULT_SPAN_COUNT_PORTRAIT = 2;
    private static final String DIALOG_TAG = "dialog_tag";
    private static final int FILESET_LOADER_ID = 0;
    private static final int IMPROVEMENT_LOADER_ID = 1;
    public static final String INTENT_ACTION_SHORTCUT = "com.sonymobile.scan3d.ACTION_SHORTCUT";
    private static final String KEY_EXCLUDED_URIS = "exclude_uris";
    private static final String KEY_EXPLANATORY_TEXT = "explanatory_text";
    private static final String KEY_SCAN_TYPES = "scan_types";
    private static final String KEY_SHOW_PROMOTIONS = "show_promotions";
    private static final String LOG_TAG = "com.sonymobile.scan3d.storageservice.ui.gallery.GalleryFragment";
    private static final int PERMISSION_REQUEST_CODE_SCAN = 9000;
    private static final int QUESTION_ID_UNSHARE = 2;
    private static final int REQUEST_CODE_ADV_SCAN = 2002;
    private static final int REQUEST_CODE_ANY_SCAN_FROM_APP_SHORTCUT = 2005;
    private static final int REQUEST_CODE_CONFIRM_PERMISSIONS = 8000;
    private static final int REQUEST_CODE_FACE_SCAN = 2001;
    private static final int REQUEST_CODE_FIRST_TIME_ADVANCE_SCAN = 2203;
    private static final int REQUEST_CODE_FIRST_TIME_FOOD_SCAN = 2202;
    private static final int REQUEST_CODE_FIRST_TIME_TUTORIAL_FACE_SCAN = 2201;
    private static final int REQUEST_CODE_FIRST_TIME_TUTORIAL_HEAD_SCAN = 2200;
    private static final int REQUEST_CODE_FIRST_TIME_TUTORIAL_SELFIE_SCAN = 2204;
    private static final int REQUEST_CODE_FOOD_SCAN = 2003;
    private static final int REQUEST_CODE_GOOD_JOB_FACE_SCAN = 2301;
    private static final int REQUEST_CODE_GOOD_JOB_FOOD_SCAN = 2302;
    private static final int REQUEST_CODE_GOOD_JOB_HEAD_SCAN = 2300;
    private static final int REQUEST_CODE_GOOD_JOB_SELFIE_SCAN = 2303;
    private static final int REQUEST_CODE_HEAD_SCAN = 2000;
    private static final int REQUEST_CODE_PRACTICE_FACE_SCAN = 2101;
    private static final int REQUEST_CODE_PRACTICE_FOOD_SCAN = 2102;
    private static final int REQUEST_CODE_PRACTICE_HEAD_SCAN = 2100;
    private static final int REQUEST_CODE_PRACTICE_SELFIE_SCAN = 2103;
    private static final int REQUEST_CODE_SELFIE_SCAN = 2004;
    private static final int REQUEST_CODE_SIGN_IN = 10000;
    private static final String[] SCAN_PERMISSIONS = {"android.permission.CAMERA"};
    private static final int SECONDS_BETWEEN_FAB_TIP_PRESENTATIONS = 30;
    private static final int SHARED_MESHES_LOADER_ID = 2;
    private static final String SHARED_SCAN = "1";
    private ImageCache mCache = new ImageCache();
    private Configuration mConfig;
    private FabButton mFab;
    private GalleryAdapter mGalleryAdapter;
    private ScaleGestureDetector mGestureDetector;
    private boolean mIsPicker;
    private View mPermissionsContainer;
    private Handler mPermissionsHandler;
    private SharedPreferences mPreferences;
    private RecyclerView mRecyclerView;
    private SwipeRefreshLayout mRefreshLayout;
    private float mScaleStart;
    private boolean mShowPromotions;
    private SortType mSortType;

    @Override // androidx.loader.app.LoaderManager.LoaderCallbacks
    public void onLoaderReset(@NonNull Loader<Cursor> loader) {
    }

    @Override // com.sonymobile.scan3d.viewer.YesNoQuestionFragment.OnYesNoListener
    public void onNegativeAnswer(int i, Parcelable parcelable) {
    }

    @Override // android.view.ScaleGestureDetector.OnScaleGestureListener
    public boolean onScale(ScaleGestureDetector scaleGestureDetector) {
        return false;
    }

    public static GalleryFragment newInstance(int[] iArr, ArrayList<Uri> arrayList, @Nullable String str) {
        GalleryFragment galleryFragment = new GalleryFragment();
        Bundle bundle = new Bundle();
        bundle.putIntArray(KEY_SCAN_TYPES, iArr);
        bundle.putParcelableArrayList(KEY_EXCLUDED_URIS, arrayList);
        bundle.putString(KEY_EXPLANATORY_TEXT, str);
        galleryFragment.setArguments(bundle);
        return galleryFragment;
    }

    public GalleryFragment() {
        setHasOptionsMenu(true);
    }
    @Override // androidx.fragment.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Activity activity = getActivity();
        String action = activity != null ? activity.getIntent().getAction() : null;
        if (activity instanceof IScanListener) {
            IScanListener iScanListener = (IScanListener) activity;
            this.mPreferences = PreferenceManager.getDefaultSharedPreferences(activity);
            this.mSortType = getStoredSortType();
            if (bundle == null) {
                this.mShowPromotions = TipParser.isPromotionListPopulated(getContext());
                if (INTENT_ACTION_SHORTCUT.equals(action)) {
                    int intExtra = activity.getIntent().getIntExtra(AppShortcutsManager.INTENT_EXTRA_SHORTCUT_POLICY_MODE, -1);
                    Intent intent = new Intent(getActivity(), (Class<?>) Scan3dActivity.class);
                    intent.putExtra("policy", intExtra);
                    startActivityForResult(intent, REQUEST_CODE_ANY_SCAN_FROM_APP_SHORTCUT);
                }
            } else {
                this.mShowPromotions = bundle.getBoolean(KEY_SHOW_PROMOTIONS);
            }
            this.mIsPicker = "android.intent.action.PICK".equals(action);
            this.mGalleryAdapter = new GalleryAdapter(activity, iScanListener, this, !this.mIsPicker && this.mShowPromotions, this.mIsPicker, getArguments().getIntArray(KEY_SCAN_TYPES), getArguments().getParcelableArrayList(KEY_EXCLUDED_URIS));
            firstTimeInsertExampleScans();
            this.mPermissionsHandler = new Handler();
            return;
        }
        throw new ClassCastException(activity.toString() + " must implement IScanListener");
    }

    @Override // androidx.fragment.app.Fragment
    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putBoolean(KEY_SHOW_PROMOTIONS, this.mShowPromotions);
    }

    @Override // androidx.fragment.app.Fragment
    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        LoaderManager loaderManager = LoaderManager.getInstance(this);
        loaderManager.initLoader(0, null, this);
        loaderManager.initLoader(1, null, this);
        if (PreferenceManager.getDefaultSharedPreferences(getContext()).getBoolean(getString(R.string.pref_key_run_shared_meshes_sync), true)) {
            loaderManager.initLoader(2, null, this);
        }
    }

    @Override // androidx.fragment.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        this.mCache.stop();
    }

    @Override // androidx.fragment.app.Fragment
    public void onStart() {
        super.onStart();
        this.mPreferences.registerOnSharedPreferenceChangeListener(this);
        this.mGalleryAdapter.notifyDataSetChanged();
    }

    @Override // androidx.fragment.app.Fragment
    public void onStop() {
        super.onStop();
        this.mPreferences.unregisterOnSharedPreferenceChangeListener(this);
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.fragment.SyncFragment, androidx.fragment.app.Fragment
    public void onResume() {
        super.onResume();
        DebugLog.d(LOG_TAG, "onResume(): begin");
        if (getFragmentManager().findFragmentByTag(SelectScanModeFragment.class.getName()) != null) {
            this.mFab.hide();
        } else {
            this.mFab.show();
        }
        boolean zIsSignedIn = AccountUtils.isSignedIn(getActivity());
        this.mGalleryAdapter.setIsSignedIn(zIsSignedIn);
        if (zIsSignedIn) {
            this.mRefreshLayout.setOnRefreshListener(this.mIsPicker ? null : this);
            this.mRefreshLayout.setEnabled(!this.mIsPicker);
            return;
        }
        this.mRefreshLayout.setOnRefreshListener(null);
        this.mRefreshLayout.setEnabled(false);
        if (Config.isSigninMandatory(getContext())) {
            signIn();
        }
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.fragment.SyncFragment, androidx.fragment.app.Fragment
    public void onPause() {
        super.onPause();
        FabButton fabButton = this.mFab;
        if (fabButton != null) {
            fabButton.onPause();
        }
    }

    @Override // androidx.fragment.app.Fragment
    public void onPrepareOptionsMenu(Menu menu) {
        super.onPrepareOptionsMenu(menu);
        if (this.mIsPicker) {
            for (int i = 0; i < menu.size(); i++) {
                MenuItem item = menu.getItem(i);
                item.setVisible(item.getItemId() == R.id.sort);
            }
        }
    }

    @Override // androidx.fragment.app.Fragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater menuInflater) {
        menuInflater.inflate(R.menu.menu_gallery, menu);
    }

    @Override // androidx.fragment.app.Fragment
    public boolean onOptionsItemSelected(MenuItem menuItem) {
        switch (menuItem.getItemId()) {
            case 16908332:
                getActivity().finish();
                return true;
            case R.id.sort:
                SortOrderDialog.newInstance(this.mSortType, this).show(getFragmentManager(), SortOrderDialog.class.getName());
                return true;
            case R.id.menu_gallery_help_tips:
                startActivity(new Intent(getActivity(), (Class<?>) QuickTipCategoriesActivity.class));
                return true;
            case R.id.menu_gallery_settings:
                showFragment(new SettingsFragment());
                return true;
            default:
                return super.onOptionsItemSelected(menuItem);
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
        if (i == PERMISSION_REQUEST_CODE_SCAN) {
            if (z) {
                openScanModeSelection();
                return;
            } else {
                startConfirmPermissions();
                return;
            }
        }
        this.mPermissionsHandler.removeCallbacksAndMessages(null);
        if (z) {
            if (this.mPermissionsContainer.getVisibility() == 0) {
                this.mPermissionsHandler.post(PermissionUtil.removePermissionsContainer(this.mPermissionsContainer));
            }
            ((GalleryActivity) getActivity()).permissionRequestAccepted(i);
            return;
        }
        PermissionUtil.showPermissionsSnackbar(this.mPermissionsHandler, this.mPermissionsContainer);
    }

    @Override // androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        DebugLog.d(LOG_TAG, "onCreateView(): begin");
        FragmentActivity activity = getActivity();
        this.mConfig = getResources().getConfiguration();
        View viewInflate = layoutInflater.inflate(R.layout.fragment_scan_grid, viewGroup, false);
        this.mRecyclerView = (RecyclerView) viewInflate.findViewById(R.id.list);
        TextView textView = (TextView) viewInflate.findViewById(R.id.explanatoryText);
        String string = getArguments().getString(KEY_EXPLANATORY_TEXT);
        if (this.mIsPicker && string != null) {
            textView.setText(string);
            textView.setVisibility(0);
        } else {
            textView.setVisibility(8);
        }
        int savedSpanCount = getSavedSpanCount(activity);
        if (this.mConfig.orientation == 1) {
            savedSpanCount = Math.min(savedSpanCount, 2);
        }
        GridLayoutManager gridLayoutManager = new GridLayoutManager(activity, savedSpanCount);
        gridLayoutManager.setSpanSizeLookup(new GridLayoutManager.SpanSizeLookup() { // from class: com.sonymobile.scan3d.storageservice.ui.gallery.GalleryFragment.1
            @Override // androidx.recyclerview.widget.GridLayoutManager.SpanSizeLookup
            public int getSpanSize(int i) {
                return GalleryFragment.this.mGalleryAdapter.getSpanCount(i);
            }
        });
        this.mGalleryAdapter.setSpanCount(savedSpanCount);
        this.mRecyclerView.setLayoutManager(gridLayoutManager);
        this.mRecyclerView.setAdapter(this.mGalleryAdapter);
        this.mGestureDetector = new ScaleGestureDetector(activity, this);
        this.mRecyclerView.setOnTouchListener((view, motionEvent) -> {
            if (motionEvent.getPointerCount() != 2) {
                return false;
            }
            this.mGestureDetector.onTouchEvent(motionEvent);
            return true;
        });
        viewInflate.findViewById(R.id.gallery_scroller).setOnTouchListener((view, motionEvent) -> {
            this.mRecyclerView.scrollToPosition((int) ((motionEvent.getY() / (this.mRecyclerView.getHeight() - this.mRecyclerView.getPaddingBottom())) * this.mRecyclerView.getAdapter().getItemCount()));
            return true;
        });
        this.mPermissionsContainer = viewInflate.findViewById(R.id.permissions_container);
        ActionBar actionBar = getActivity().getActionBar();
        if (actionBar != null) {
            actionBar.setTitle(R.string.application_name);
            actionBar.setHomeButtonEnabled(false);
            actionBar.setDisplayHomeAsUpEnabled(false);
        }
        this.mFab = (FabButton) viewInflate.findViewById(R.id.fab_button);
        if (!this.mIsPicker) {
            this.mFab.setOnClickListener((UserInputReducer.InputReducer) view -> {
                HitEvent.GALLERY_3D_BUTTON_CLICKED.send(getContext());
                String[] missingPermissions = PermissionUtil.getMissingPermissions(getContext(), SCAN_PERMISSIONS);
                if (missingPermissions.length > 0) {
                    requestPermissions(missingPermissions, PERMISSION_REQUEST_CODE_SCAN);
                } else {
                    openScanModeSelection();
                }
            });
            if (canShowTip(false)) {
                addCoachMarkIdleListener();
            }
        } else {
            this.mFab.setVisibility(8);
        }
        DebugLog.d(LOG_TAG, "onCreateView(): end");
        return viewInflate;
    }

    @Override // androidx.fragment.app.Fragment
    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        this.mRefreshLayout = (SwipeRefreshLayout) view.findViewById(R.id.swipeRefreshLayout);
        this.mRefreshLayout.setColorSchemeColors(getContext().getColor(R.color.primary_color_light));
    }

    @Override // androidx.fragment.app.Fragment
    public void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        if (i == REQUEST_CODE_CONFIRM_PERMISSIONS) {
            if (i2 != 1) {
                return;
            }
            openScanModeSelection();
        }
        if (i == 10000) {
            if (i2 == -1) {
                showFragment(new BackupSyncSettings());
                sync();
                this.mGalleryAdapter.setIsSignedIn(true);
                HitEvent.USER_SIGNED_IN.send(getContext(), 1L);
                return;
            }
            return;
        }
        switch (i) {
            case 2000:
            case REQUEST_CODE_FACE_SCAN /* 2001 */:
            case REQUEST_CODE_ADV_SCAN /* 2002 */:
            case REQUEST_CODE_FOOD_SCAN /* 2003 */:
            case REQUEST_CODE_SELFIE_SCAN /* 2004 */:
            case REQUEST_CODE_ANY_SCAN_FROM_APP_SHORTCUT /* 2005 */:
                switch (i2) {
                    case 1:
                        if (intent.getData() != null) {
                            ViewerActivity.showInKeepDiscardMode(getContext(), intent.getData(), intent.getBooleanExtra(Scan3dActivity.INTENT_EXTRA_SHORT_SCAN, false), intent.getBooleanExtra(Scan3dActivity.INTENT_EXTRA_LONG_SCAN, false), (EnvironmentError.ErrorType) intent.getSerializableExtra(Scan3dActivity.INTENT_EXTRA_ENV_ERROR), intent.getIntExtra("policy", -1));
                            onScanCreated();
                        }
                        break;
                    case 2:
                        startConfirmPermissions();
                        break;
                }
                break;
            default:
                switch (i) {
                    case REQUEST_CODE_PRACTICE_HEAD_SCAN /* 2100 */:
                        switch (i2) {
                            case 1:
                                ScanTutorial.HEAD.setTrainingModeCompleted(getContext());
                                viewTutorialHeadScan(intent.getData(), intent.getBooleanExtra(Scan3dActivity.INTENT_EXTRA_LONG_SCAN, false), false);
                                onScanCreated();
                                break;
                            case 2:
                                startConfirmPermissions();
                                break;
                        }
                        break;
                    case REQUEST_CODE_PRACTICE_FACE_SCAN /* 2101 */:
                        switch (i2) {
                            case 1:
                                viewTutorialFaceScan(intent.getData(), intent.getBooleanExtra(Scan3dActivity.INTENT_EXTRA_LONG_SCAN, false), ScanTutorial.FACE.setTrainingModeCompleted(getContext()));
                                onScanCreated();
                                break;
                            case 2:
                                startConfirmPermissions();
                                break;
                        }
                        break;
                    case REQUEST_CODE_PRACTICE_FOOD_SCAN /* 2102 */:
                        switch (i2) {
                            case 1:
                                ScanTutorial.FOOD.setTrainingModeCompleted(getContext());
                                viewTutorialFoodScan(intent.getData(), intent.getBooleanExtra(Scan3dActivity.INTENT_EXTRA_LONG_SCAN, false));
                                onScanCreated();
                                break;
                            case 2:
                                startConfirmPermissions();
                                break;
                        }
                        break;
                    case REQUEST_CODE_PRACTICE_SELFIE_SCAN /* 2103 */:
                        switch (i2) {
                            case 1:
                                viewTutorialSelfieScan(intent.getData(), intent.getBooleanExtra(Scan3dActivity.INTENT_EXTRA_LONG_SCAN, false), ScanTutorial.SELFIE.setTrainingModeCompleted(getContext()));
                                onScanCreated();
                                break;
                            case 2:
                                startConfirmPermissions();
                                break;
                        }
                        break;
                    default:
                        switch (i) {
                            case REQUEST_CODE_FIRST_TIME_TUTORIAL_HEAD_SCAN /* 2200 */:
                                if (i2 == -1) {
                                    ScanTutorial.HEAD.setSlideshowCompleted(getContext());
                                    startHeadScanPractice();
                                    break;
                                }
                                break;
                            case REQUEST_CODE_FIRST_TIME_TUTORIAL_FACE_SCAN /* 2201 */:
                                if (i2 == -1) {
                                    ScanTutorial.FACE.setSlideshowCompleted(getContext());
                                    startFaceScanPractice();
                                    break;
                                }
                                break;
                            case REQUEST_CODE_FIRST_TIME_FOOD_SCAN /* 2202 */:
                                if (i2 == -1) {
                                    ScanTutorial.FOOD.setSlideshowCompleted(getContext());
                                    startFoodScanPractice();
                                    break;
                                }
                                break;
                            case REQUEST_CODE_FIRST_TIME_ADVANCE_SCAN /* 2203 */:
                                if (i2 == -1) {
                                    ScanTutorial.ADVANCE.setSlideshowCompleted(getContext());
                                    startAdvScan();
                                    break;
                                }
                                break;
                            case REQUEST_CODE_FIRST_TIME_TUTORIAL_SELFIE_SCAN /* 2204 */:
                                if (i2 == -1) {
                                    ScanTutorial.SELFIE.setSlideshowCompleted(getContext());
                                    startSelfieScanPractice();
                                    break;
                                }
                                break;
                        }
                        break;
                }
                break;
        }
    }

    private int getDefaultSpanCount() {
        return this.mConfig.orientation == 1 ? 2 : 3;
    }

    private void signIn() {
        FragmentActivity activity = getActivity();
        if (activity != null) {
            startActivityForResult(new Intent(activity, (Class<?>) SigninActivity.class), 10000);
        }
    }

    private void showFragment(Fragment fragment) {
        FragmentTransaction fragmentTransactionBeginTransaction = getFragmentManager().beginTransaction();
        fragmentTransactionBeginTransaction.setCustomAnimations(android.R.animator.fade_in, android.R.animator.fade_out);
        fragmentTransactionBeginTransaction.replace(R.id.content, fragment, fragment.getClass().getName());
        fragmentTransactionBeginTransaction.addToBackStack(null);
        fragmentTransactionBeginTransaction.commit();
    }

    private void firstTimeInsertExampleScans() {
        if (this.mPreferences.getBoolean(getString(R.string.pref_key_first_start), true)) {
            FileTasks.insertExampleScans(getContext());
            this.mPreferences.edit().putBoolean(getString(R.string.pref_key_first_start), false).apply();
        }
    }

    private void setSortType(SortType sortType) {
        if (this.mSortType != sortType) {
            this.mSortType = sortType;
            this.mPreferences.edit().putString(getString(R.string.pref_key_gallery_sort_type), this.mSortType.name()).apply();
            LoaderManager.getInstance(this).restartLoader(0, null, this);
        }
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.gallery.SortOrderDialog.OnSortOrderSelectionListener
    public void onSortOrderSelected(SortType sortType) {
        setSortType(sortType);
    }

    @Override // androidx.loader.app.LoaderManager.LoaderCallbacks
    @NonNull
    public Loader<Cursor> onCreateLoader(int i, @Nullable Bundle bundle) {
        switch (i) {
            case 0:
                return Factory.createFileRecordLoader(getActivity(), this.mSortType.getSqlExpression());
            case 1:
                return Factory.createImprovementLoader(getActivity(), null, null);
            case 2:
                return Factory.createFileRecordLoader(getActivity(), "visible=? AND (shared_meshes IS NULL OR shared_meshes = '' OR shared_meshes = 0)", new String[]{SHARED_SCAN}, null);
            default:
                return null;
        }
    }

    @Override // androidx.loader.app.LoaderManager.LoaderCallbacks
    public void onLoadFinished(@NonNull Loader<Cursor> loader, Cursor cursor) {
        switch (loader.getId()) {
            case 0:
                HitEvent.SCAN_COUNT.send(getContext(), cursor.getCount());
                this.mGalleryAdapter.setFileSets(Factory.createFileRecords(cursor));
                getActivity().reportFullyDrawn();
                break;
            case 1:
                this.mGalleryAdapter.setImprovements(Factory.createImprovementRecords(cursor));
                break;
            case 2:
                if (cursor.getCount() > 0) {
                    sync();
                } else {
                    PreferenceManager.getDefaultSharedPreferences(getContext()).edit().putBoolean(getString(R.string.pref_key_run_shared_meshes_sync), false).apply();
                }
                break;
        }
    }

    private void addCoachMarkIdleListener() {
        FragmentActivity activity = getActivity();
        if (activity instanceof GalleryActivity) {
            ((GalleryActivity) activity).addIdleListener(0, this, 5);
        }
    }

    private void removeCoachMarkIdleListener() {
        FragmentActivity activity = getActivity();
        if (activity instanceof GalleryActivity) {
            ((GalleryActivity) activity).removeIdleListener(0);
        }
    }

    private boolean canShowTip(boolean z) {
        String string = getString(R.string.pref_key_scan_coach_mark_remaining_displays_counter);
        int iMin = Math.min(this.mPreferences.getInt(string, 3), 3);
        if (iMin <= 0) {
            return false;
        }
        if (!z) {
            return true;
        }
        this.mPreferences.edit().putInt(string, iMin - 1).apply();
        return true;
    }

    private void disableTip() {
        this.mPreferences.edit().putInt(getString(R.string.pref_key_scan_coach_mark_remaining_displays_counter), 0).apply();
    }

    private void startTutorial(ScanTutorial scanTutorial, int i) {
        FragmentActivity activity = getActivity();
        TipCategory tipCategory = scanTutorial.getTipCategory(activity);
        Intent intent = new Intent(activity, (Class<?>) FirstTimeActivity.class);
        intent.putExtra("com.sonymobile.scan3d.extras.TIP_CATEGORY", tipCategory);
        if (scanTutorial.isTrainingModeCompleted(activity)) {
            intent.putExtra(FirstTimeActivity.EXTRA_HAS_RUN, true);
            startActivity(intent);
        } else {
            startActivityForResult(intent, i);
        }
    }

    private void openScanModeSelection() {
        this.mFab.hide();
        disableTip();
        DialogFragment dialogFragment = SelectScanModeFragment.newInstance(this);
        dialogFragment.show(getFragmentManager(), SelectScanModeFragment.class.getName());
    }

    private void onScanCreated() {
        disableTip();
        removeCoachMarkIdleListener();
    }

    private void startAdvScan() {
        Intent intent = new Intent(getActivity(), (Class<?>) Scan3dActivity.class);
        intent.putExtra("policy", 2);
        startActivityForResult(intent, REQUEST_CODE_ADV_SCAN);
    }

    private void startHeadScan() {
        Intent intent = new Intent(getActivity(), (Class<?>) Scan3dActivity.class);
        intent.putExtra("policy", 1);
        startActivityForResult(intent, 2000);
    }

    private void startFaceScan() {
        Intent intent = new Intent(getActivity(), (Class<?>) Scan3dActivity.class);
        intent.putExtra("policy", 0);
        startActivityForResult(intent, REQUEST_CODE_FACE_SCAN);
    }

    private void startFoodScan() {
        Intent intent = new Intent(getActivity(), (Class<?>) Scan3dActivity.class);
        intent.putExtra("policy", 3);
        startActivityForResult(intent, REQUEST_CODE_FOOD_SCAN);
    }

    private void startSelfieScan() {
        Intent intent = new Intent(getActivity(), (Class<?>) Scan3dActivity.class);
        intent.putExtra("policy", 4);
        startActivityForResult(intent, REQUEST_CODE_SELFIE_SCAN);
    }

    private void startFaceScanPractice() {
        Intent intent = new Intent(getActivity(), (Class<?>) Scan3dActivity.class);
        intent.putExtra("policy", 10);
        startActivityForResult(intent, REQUEST_CODE_PRACTICE_FACE_SCAN);
    }

    private void startHeadScanPractice() {
        Intent intent = new Intent(getActivity(), (Class<?>) Scan3dActivity.class);
        intent.putExtra("policy", 11);
        startActivityForResult(intent, REQUEST_CODE_PRACTICE_HEAD_SCAN);
    }

    private void startFoodScanPractice() {
        Intent intent = new Intent(getActivity(), (Class<?>) Scan3dActivity.class);
        intent.putExtra("policy", 13);
        startActivityForResult(intent, REQUEST_CODE_PRACTICE_FOOD_SCAN);
    }

    private void startSelfieScanPractice() {
        Intent intent = new Intent(getActivity(), (Class<?>) Scan3dActivity.class);
        intent.putExtra("policy", 14);
        startActivityForResult(intent, REQUEST_CODE_PRACTICE_SELFIE_SCAN);
    }

    private void viewTutorialFaceScan(Uri uri, boolean z, boolean z2) {
        startActivityForResult(ViewerActivity.getGoodJobFaceScanViewIntent(getActivity(), uri, z, z2), REQUEST_CODE_GOOD_JOB_FACE_SCAN);
    }

    private void viewTutorialHeadScan(Uri uri, boolean z, boolean z2) {
        startActivityForResult(ViewerActivity.getGoodJobHeadScanViewIntent(getActivity(), uri, z, z2), REQUEST_CODE_GOOD_JOB_HEAD_SCAN);
    }

    private void viewTutorialFoodScan(Uri uri, boolean z) {
        startActivityForResult(ViewerActivity.getGoodJobFoodScanViewIntent(getActivity(), uri, z), REQUEST_CODE_GOOD_JOB_FOOD_SCAN);
    }

    private void viewTutorialSelfieScan(Uri uri, boolean z, boolean z2) {
        startActivityForResult(ViewerActivity.getGoodJobSelfieScanViewIntent(getActivity(), uri, z, z2), REQUEST_CODE_GOOD_JOB_SELFIE_SCAN);
    }

    private void startConfirmPermissions() {
        startActivityForResult(new Intent(getContext(), (Class<?>) ScanningPermissionsActivity.class), REQUEST_CODE_CONFIRM_PERMISSIONS);
    }

    private int getSavedSpanCount(Context context) {
        return this.mPreferences.getInt(context.getString(R.string.pref_key_gallery_span_count), getDefaultSpanCount());
    }

    private SortType getStoredSortType() {
        return SortType.valueOf(this.mPreferences.getString(getString(R.string.pref_key_gallery_sort_type), SortType.DATE.name()));
    }

    private void showUnshareDialog(IFileSet iFileSet) {
        YesNoQuestionFragment yesNoQuestionFragmentNewInstance = YesNoQuestionFragment.newInstance(2, R.string.dialog_unshare_scan_title, R.string.dialog_unshare_scan_description, R.string.storage_service_dialog_button_unshare_txt, iFileSet);
        yesNoQuestionFragmentNewInstance.setTargetFragment(this, 0);
        yesNoQuestionFragmentNewInstance.show(getFragmentManager(), DIALOG_TAG);
    }

    @Override // com.sonymobile.scan3d.viewer.YesNoQuestionFragment.OnYesNoListener
    public void onPositiveAnswer(int i, Parcelable parcelable) {
        if (i == 2) {
            ServiceProvider.WEBVIEWER.unshare(getContext(), (IFileSet) parcelable);
            return;
        }
        throw new IllegalStateException("YesNoDialog with id = " + i + " is not supported");
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.fragment.SyncFragment
    public void onSyncChanged(boolean z) {
        this.mRefreshLayout.setRefreshing(z && !this.mIsPicker);
    }

    @Override // androidx.swiperefreshlayout.widget.SwipeRefreshLayout.OnRefreshListener
    public void onRefresh() {
        sync();
    }

    @Override // android.content.SharedPreferences.OnSharedPreferenceChangeListener
    public void onSharedPreferenceChanged(SharedPreferences sharedPreferences, String str) {
        if (isAdded()) {
            if (str.equals(getString(R.string.pref_key_promotion_items))) {
                this.mShowPromotions = TipParser.isPromotionListPopulated(getContext());
                this.mGalleryAdapter.setShowPromotions(this.mShowPromotions);
            } else if (str.equals(getString(R.string.pref_key_gallery_span_count))) {
                this.mGalleryAdapter.setSpanCount(sharedPreferences.getInt(str, getDefaultSpanCount()));
            }
        }
    }

    @Override // android.view.ScaleGestureDetector.OnScaleGestureListener
    public boolean onScaleBegin(ScaleGestureDetector scaleGestureDetector) {
        this.mScaleStart = scaleGestureDetector.getScaleFactor();
        return true;
    }

    @Override // android.view.ScaleGestureDetector.OnScaleGestureListener
    public void onScaleEnd(ScaleGestureDetector scaleGestureDetector) {
        GridLayoutManager gridLayoutManager = (GridLayoutManager) this.mRecyclerView.getLayoutManager();
        int spanCount = gridLayoutManager.getSpanCount();
        int i = 2;
        if (this.mScaleStart > scaleGestureDetector.getScaleFactor()) {
            int i2 = spanCount + 1;
            if (this.mConfig.orientation != 1 || i2 <= 2) {
                i = i2 > 3 ? 3 : i2;
            }
        } else {
            i = spanCount - 1;
            if (i < 1) {
                i = 1;
            }
        }
        gridLayoutManager.setSpanCount(i);
        this.mRecyclerView.setLayoutManager(gridLayoutManager);
        PreferenceManager.getDefaultSharedPreferences(getContext()).edit().putInt(getString(R.string.pref_key_gallery_span_count), i).apply();
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.fragment.SelectScanModeFragment.IScanChoiceListener
    public void onScanModeSelected(DialogFragment dialogFragment, SelectScanModeFragment.ScanMode scanMode) {
        switch (scanMode) {
            case SELFIE_SCAN:
                if (scanMode.getTutorial().isTrainingModeCompleted(getContext())) {
                    startSelfieScan();
                    dialogFragment.dismiss();
                } else {
                    startSelfieScanPractice();
                }
                break;
            case FACE_SCAN:
                if (scanMode.getTutorial().isTrainingModeCompleted(getContext())) {
                    startFaceScan();
                    dialogFragment.dismiss();
                } else {
                    startFaceScanPractice();
                }
                break;
            case HEAD_SCAN:
                if (scanMode.getTutorial().isTrainingModeCompleted(getContext())) {
                    startHeadScan();
                    dialogFragment.dismiss();
                } else {
                    startHeadScanPractice();
                }
                break;
            case ADV_SCAN:
                startAdvScan();
                dialogFragment.dismiss();
                break;
            case FOOD_SCAN:
                if (scanMode.getTutorial().isTrainingModeCompleted(getContext())) {
                    startFoodScan();
                    dialogFragment.dismiss();
                } else {
                    startFoodScanPractice();
                }
                break;
        }
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.fragment.SelectScanModeFragment.IScanChoiceListener
    public void onTutorialSelected(ScanTutorial scanTutorial) {
        int i;
        switch (scanTutorial) {
            case SELFIE:
                i = REQUEST_CODE_FIRST_TIME_TUTORIAL_SELFIE_SCAN;
                break;
            case FACE:
                i = REQUEST_CODE_FIRST_TIME_TUTORIAL_FACE_SCAN;
                break;
            case HEAD:
                i = REQUEST_CODE_FIRST_TIME_TUTORIAL_HEAD_SCAN;
                break;
            case FOOD:
                i = REQUEST_CODE_FIRST_TIME_FOOD_SCAN;
                break;
            case ADVANCE:
                i = REQUEST_CODE_FIRST_TIME_ADVANCE_SCAN;
                break;
            default:
                i = -1;
                break;
        }
        startTutorial(scanTutorial, i);
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.fragment.SelectScanModeFragment.IScanChoiceListener
    public void onSelectScanModeDialogDismissed() {
        this.mFab.show();
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.IOnScanMenuItemClickListener
    public boolean onScanMenuClick(MenuItem menuItem, IFileSet iFileSet) {
        if (iFileSet == null) {
            return false;
        }
        switch (menuItem.getItemId()) {
            case R.id.menu_unshare /* 2131296545 */:
                showUnshareDialog(iFileSet);
                return true;
            case R.id.menu_view_animated /* 2131296546 */:
                ServiceProvider.WEBVIEWER.view(getContext(), iFileSet, Shareable.Type.ANIMATION);
                return true;
            case R.id.menu_view_prop /* 2131296547 */:
                ServiceProvider.WEBVIEWER.view(getContext(), iFileSet, Shareable.Type.PROPS);
                return true;
            case R.id.menu_view_static /* 2131296548 */:
                ServiceProvider.WEBVIEWER.view(getContext(), iFileSet, Shareable.Type.DEFAULT);
                return true;
            default:
                return true;
        }
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.activity.IdleMonitor.OnIdleListener
    public int onIdle(int i, int i2, int i3) {
        if (i != 0 || !canShowTip(true)) {
            return -1;
        }
        this.mFab.showTip();
        return 30;
    }

    public void showPermissionRequest(String[] strArr, @StringRes int i, int i2) {
        setupPermissionsButton(i, strArr, i2);
        requestPermissions(strArr, i2);
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
}
