package com.sonymobile.scan3d.wallpaper;

import android.R;
import android.app.ActivityManager;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.preference.PreferenceManager;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import androidx.annotation.FloatRange;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentTransaction;
import com.sonymobile.scan3d.NativeGLTextureView;
import com.sonymobile.scan3d.OnBackPressListener;
import com.sonymobile.scan3d.PreferenceUtils;
import com.sonymobile.scan3d.Scan3DApp;
import com.sonymobile.scan3d.ViewerBackground;
import com.sonymobile.scan3d.analytics.ScreenEvent;
import com.sonymobile.scan3d.sharing.SharingConstants;
import com.sonymobile.scan3d.storageservice.authentication.Vault;
import com.sonymobile.scan3d.storageservice.provider.Contract;
import com.sonymobile.scan3d.storageservice.provider.Factory;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.storageservice.ui.activity.GalleryActivity;
import com.sonymobile.scan3d.utils.UserInputReducer;
import com.sonymobile.scan3d.viewer.SphanGLTextureView;
import com.sonymobile.scan3d.viewer.SphanRenderer;
import com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment;
import com.sonymobile.scan3d.viewer.fragments.ViewerActivityInterface;
import com.sonymobile.scan3d.viewer.fragments.component.AnimationMenu;
import com.sonymobile.scan3d.viewer.fragments.component.Pickable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Random;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class WallpaperPreviewer extends FragmentActivity implements ViewerActivityInterface {
    private static final long ANIMATION_DELAY = 3000;
    private static final float DEFAULT_ROTATION_SPEED = 0.006f;
    private static final int FACE_FRONT_ANGLE_LIMIT = 60;
    private static final int FACE_FRONT_SEGMENTS = 6;
    private static final int MAX_TILT_DEGREES = 45;
    private static final String PREF_JSON_VIEW_MAT = "view_mat";
    private static final String PREF_POSE = "pref_lw_pose";
    private static final int RESET_CLICKED_TIMEOUT = 500;
    private static String STATE_FRAGMENT = "state_fragment";
    private static final Runnable mResetSettingsIconClicked = () -> {
        sSettingsIconClicked = false;
    };
    private static boolean sSettingsIconClicked;
    private Fragment mFragment;

    @Override // com.sonymobile.scan3d.viewer.fragments.ViewerActivityInterface
    public void registerOnBackPressListener(OnBackPressListener onBackPressListener) {
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.ViewerActivityInterface
    public void unregisterOnBackPressListener(OnBackPressListener onBackPressListener) {
    }

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (!Scan3DApp.isPartOfBetaProgram(this)) {
            finish();
            return;
        }
        if (sSettingsIconClicked) {
            finish();
            return;
        }
        sSettingsIconClicked = true;
        new Handler().postDelayed(mResetSettingsIconClicked, 500L);
        requestWindowFeature(1);
        FragmentManager supportFragmentManager = getSupportFragmentManager();
        if (bundle != null) {
            this.mFragment = supportFragmentManager.getFragment(bundle, STATE_FRAGMENT);
            return;
        }
        FragmentTransaction fragmentTransactionBeginTransaction = supportFragmentManager.beginTransaction();
        this.mFragment = new WallpaperFragment();
        fragmentTransactionBeginTransaction.replace(R.id.content, this.mFragment);
        fragmentTransactionBeginTransaction.commit();
    }

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, android.app.Activity
    protected void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        getSupportFragmentManager().putFragment(bundle, STATE_FRAGMENT, this.mFragment);
    }

    public static class WallpaperFragment extends BaseViewerFragment implements AnimationMenu.AnimationMenuListener, SphanRenderer.OnDrawFrameListener, SharedPreferences.OnSharedPreferenceChangeListener {
        private static final String STATE_ANIMATION = "state_animation";
        private static final String STATE_BACKGROUND = "state_background";
        private static final String STATE_MODEL = "state_model";
        private static final String STATE_ROTATION = "state_rotation";
        static final int WALLPAPER_REQUEST = 1;
        private AnimationMenu mAnimationMenu;
        private SphanGLTextureView mAnimationView;
        private boolean mDisableAnimate;
        private IFileSet mFileSet;
        private boolean mPrefAnimate;
        private ViewerBackground mPrefBackground;
        private Uri mPrefModel;
        private boolean mPrefRotate;
        private SphanRenderer mSphanRenderer;
        private TiltSensor mTiltSensor;
        private Random mRandom = new Random();
        private Handler mMainHandler = new Handler();
        private float[] mViewM = null;
        private float[] mTransformedViewM = null;
        private float mCurrentRotation = 0.0f;

        @FloatRange(from = -1.0d, fromInclusive = true, to = 1.0d, toInclusive = true)
        private float mDefaultRotationDirection = 1.0f;
        private Runnable mAnimator = () -> {
            int numAnimations = this.mSphanRenderer.getNumAnimations();
            if (numAnimations > 0) {
                this.mSphanRenderer.startAnimation(0, this.mRandom.nextInt(numAnimations));
                this.mAnimationView.requestRender();
                this.mMainHandler.postDelayed(this.mAnimator, WallpaperPreviewer.ANIMATION_DELAY);
            }
        };

        @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
        public int getContentLayout() {
            return com.sonymobile.scan3d.R.layout.fragment_wallpaper_layout;
        }

        @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
        public int getNavigationAccessibility() {
            return com.sonymobile.scan3d.R.string.accessibility_close_button;
        }

        @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
        public int getNavigationDrawable() {
            return com.sonymobile.scan3d.R.drawable.ic_close_24dp;
        }

        @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
        protected int getToolBarActionText() {
            return com.sonymobile.scan3d.R.string.done;
        }

        private void startAnimating() {
            stopAnimating();
            if (!this.mPrefAnimate || this.mDisableAnimate) {
                return;
            }
            this.mAnimator.run();
        }

        private void stopAnimating() {
            this.mMainHandler.removeCallbacks(this.mAnimator);
        }

        @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, androidx.fragment.app.Fragment
        @Nullable
        public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
            View viewOnCreateView = super.onCreateView(layoutInflater, viewGroup, bundle);
            this.mSphanRenderer = new SphanRenderer(getContext());
            this.mAnimationView = (SphanGLTextureView) viewOnCreateView.findViewById(com.sonymobile.scan3d.R.id.glTextureView);
            this.mAnimationView.start(this.mSphanRenderer, () -> {
                this.mSphanRenderer.release();
                this.mSphanRenderer = null;
            });
            this.mViewM = this.mSphanRenderer.getViewMatrix();
            if (bundle == null) {
                readPreferences();
            } else {
                loadState(bundle);
            }
            if (this.mPrefModel == null) {
                startActivityForResult(getPickerIntent(), 1);
                ScreenEvent.WALLPAPER_SCREEN.send(getContext());
            }
            this.mAnimationView.queueEvent(this::loadModel);
            if (this.mPrefRotate) {
                this.mCurrentRotation = 1.0f;
                this.mDefaultRotationDirection = 1.0f;
            }
            setupAnimationMenu(viewOnCreateView);
            viewOnCreateView.findViewById(com.sonymobile.scan3d.R.id.select_model).setOnClickListener((UserInputReducer.InputReducer) view -> {
                startActivityForResult(getPickerIntent(), 1);
                ScreenEvent.WALLPAPER_SCREEN.send(getContext());
            });
            this.mAnimationView.setTouchListener(new NativeGLTextureView.TouchListener() { // from class: com.sonymobile.scan3d.wallpaper.WallpaperPreviewer.WallpaperFragment.1
                @Override // com.sonymobile.scan3d.NativeGLTextureView.TouchListener
                public boolean allowMotion(MotionEvent motionEvent) {
                    return false;
                }

                @Override // com.sonymobile.scan3d.NativeGLTextureView.TouchListener
                public void onSingleTouch() {
                }
            });
            this.mTiltSensor = new TiltSensor(getContext().getApplicationContext(), this.mAnimationView.getGLThread());
            return viewOnCreateView;
        }

        @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, androidx.fragment.app.Fragment
        public void onResume() {
            super.onResume();
            PreferenceManager.getDefaultSharedPreferences(getContext()).registerOnSharedPreferenceChangeListener(this);
            this.mAnimationView.onResume();
            this.mTiltSensor.onResume();
            this.mSphanRenderer.setOnDrawFrameListener(this);
            startAnimating();
        }

        @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, androidx.fragment.app.Fragment
        public void onPause() {
            super.onPause();
            PreferenceManager.getDefaultSharedPreferences(getContext()).unregisterOnSharedPreferenceChangeListener(this);
            stopAnimating();
            this.mSphanRenderer.setOnDrawFrameListener(null);
            this.mTiltSensor.onPause();
            this.mAnimationView.onPause();
        }

        @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, androidx.fragment.app.Fragment
        public void onDestroy() {
            super.onDestroy();
        }

        @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, androidx.fragment.app.Fragment
        public void onSaveInstanceState(Bundle bundle) {
            super.onSaveInstanceState(bundle);
            bundle.putBoolean(STATE_ANIMATION, this.mPrefAnimate);
            bundle.putBoolean(STATE_ROTATION, this.mPrefRotate);
            bundle.putString(STATE_BACKGROUND, this.mPrefBackground.name());
            Uri uri = this.mPrefModel;
            if (uri != null) {
                bundle.putString(STATE_MODEL, uri.toString());
            }
        }

        private void loadState(Bundle bundle) {
            this.mPrefAnimate = bundle.getBoolean(STATE_ANIMATION);
            this.mPrefRotate = bundle.getBoolean(STATE_ROTATION);
            this.mPrefBackground = ViewerBackground.valueOf(bundle.getString(STATE_BACKGROUND));
            String string = bundle.getString(STATE_MODEL);
            if (TextUtils.isEmpty(string)) {
                return;
            }
            setModel(Uri.parse(string));
            updateAnimateState();
        }

        @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
        public void onActionClick() {
            saveSharedPrefs();
            if (shouldRestartWallpaperService()) {
                SphinxWallpaperService.setAsWallpaper(getContext(), this.mFileSet.getUri(), this.mPrefAnimate);
            }
            getActivity().finish();
        }

        @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, com.sonymobile.scan3d.OnBackPressListener
        public boolean onBackPressed() {
            getActivity().finish();
            return true;
        }

        @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
        public void onNavigationClick() {
            getActivity().finish();
        }

        private void setupAnimationMenu(View view) {
            this.mAnimationMenu = (AnimationMenu) view.findViewById(com.sonymobile.scan3d.R.id.animation_menu);
            this.mAnimationMenu.addSettingsMenu(this.mDisableAnimate, this.mPrefAnimate, this.mPrefRotate);
            ArrayList<Pickable> arrayList = new ArrayList<>();
            arrayList.add(new Pickable(ViewerBackground.BACKGROUND_SIMPLE, com.sonymobile.scan3d.R.drawable.background_simple, com.sonymobile.scan3d.R.string.wallpaper_background_simple_desc));
            arrayList.add(new Pickable(ViewerBackground.BACKGROUND_DEFAULT, com.sonymobile.scan3d.R.drawable.background_wooden_lounge, com.sonymobile.scan3d.R.string.wallpaper_background_wooden_lounge_desc));
            arrayList.add(new Pickable(ViewerBackground.BACKGROUND_OUTDOORS, com.sonymobile.scan3d.R.drawable.background_shanghai, com.sonymobile.scan3d.R.string.wallpaper_background_shanghai_desc));
            arrayList.add(new Pickable(ViewerBackground.BACKGROUND_STUDIO, com.sonymobile.scan3d.R.drawable.background_studio, com.sonymobile.scan3d.R.string.wallpaper_background_studio_desc));
            this.mAnimationMenu.addPickerMenu(1, arrayList, this.mPrefBackground.ordinal());
            this.mAnimationMenu.addAnimationMenuListener(this);
            this.mAnimationMenu.setup(com.sonymobile.scan3d.R.color.background_60_percent_opaque);
        }

        private boolean shouldRestartWallpaperService() {
            ActivityManager activityManager = (ActivityManager) getContext().getSystemService("activity");
            if (activityManager == null) {
                return false;
            }
            Iterator<ActivityManager.AppTask> it = activityManager.getAppTasks().iterator();
            while (it.hasNext()) {
                ActivityManager.RecentTaskInfo taskInfo = it.next().getTaskInfo();
                if (taskInfo != null && taskInfo.topActivity != null && taskInfo.topActivity.getClassName().equals(WallpaperPreviewer.class.getName())) {
                    return true;
                }
            }
            return false;
        }

        private void readPreferences() {
            PreferenceUtils.updatePreferences(getContext());
            SharedPreferences defaultSharedPreferences = PreferenceManager.getDefaultSharedPreferences(getContext());
            String string = defaultSharedPreferences.getString(getString(com.sonymobile.scan3d.R.string.pref_live_wallpaper_uri), null);
            this.mPrefAnimate = defaultSharedPreferences.getBoolean(getString(com.sonymobile.scan3d.R.string.pref_live_wallpaper_isanimated), false);
            this.mPrefRotate = defaultSharedPreferences.getBoolean(getString(com.sonymobile.scan3d.R.string.pref_live_wallpaper_rotate), false);
            this.mPrefBackground = ViewerBackground.valueOf(defaultSharedPreferences.getString(getString(com.sonymobile.scan3d.R.string.pref_live_wallpaper_background), ViewerBackground.BACKGROUND_SIMPLE.name()));
            if (TextUtils.isEmpty(string)) {
                return;
            }
            setModel(Uri.parse(string));
            updateAnimateState();
        }

        private void applySavedObjectPose() {
            String string = PreferenceManager.getDefaultSharedPreferences(getContext()).getString(WallpaperPreviewer.PREF_POSE, "");
            if (TextUtils.isEmpty(string)) {
                return;
            }
            try {
                JSONArray jSONArray = new JSONObject(string).getJSONArray(WallpaperPreviewer.PREF_JSON_VIEW_MAT);
                this.mViewM = new float[16];
                for (int i = 0; i < this.mViewM.length; i++) {
                    this.mViewM[i] = (float) jSONArray.getDouble(i);
                }
                this.mSphanRenderer.setViewMatrix(this.mViewM, 0);
                this.mAnimationView.requestRender();
                this.mTransformedViewM = null;
            } catch (JSONException unused) {
            }
        }

        private void loadModel() {
            if (this.mFileSet != null) {
                String password = Vault.getPassword(getContext());
                if (!this.mPrefAnimate || this.mDisableAnimate) {
                    this.mSphanRenderer.load(this.mFileSet.getZipFileUrl(), password);
                } else {
                    this.mSphanRenderer.load(this.mFileSet.getRiggedFileUrl(), password);
                }
                this.mSphanRenderer.setBackground(this.mPrefBackground.ordinal());
                float[] fArr = this.mTransformedViewM;
                if (fArr != null) {
                    this.mSphanRenderer.setViewMatrix(fArr, 0);
                } else {
                    applySavedObjectPose();
                }
            }
            startAnimating();
        }

        private void updateModel() {
            this.mSphanRenderer.resetView();
            this.mSphanRenderer.onGLContextDestroyed();
            this.mSphanRenderer.removeMeshes();
            this.mSphanRenderer.setBackground(this.mPrefBackground.ordinal());
            loadModel();
            this.mSphanRenderer.onGLContextCreated();
            this.mAnimationView.requestRender();
        }

        private void updateBackground() {
            this.mSphanRenderer.setBackground(this.mPrefBackground.ordinal());
            this.mAnimationView.requestRender();
        }

        @Override // androidx.fragment.app.Fragment
        public void onActivityResult(int i, int i2, Intent intent) {
            if (i2 == 0) {
                getActivity().finish();
            } else {
                if (i == 1 && intent != null) {
                    Uri data = intent.getData();
                    boolean z = this.mPrefModel == null;
                    setModel(data);
                    this.mPrefAnimate = isRigged();
                    updateAnimateState();
                    this.mAnimationView.queueEvent(z ? this::loadModel : this::updateModel);
                }
            }
            super.onActivityResult(i, i2, intent);
        }

        private void setModel(Uri uri) {
            this.mPrefModel = uri;
            this.mFileSet = Factory.create(getContext(), this.mPrefModel);
            this.mDisableAnimate = !isRigged();
        }

        private void updateAnimateState() {
            AnimationMenu animationMenu = this.mAnimationMenu;
            if (animationMenu != null) {
                animationMenu.setFaceAnimationsSwitchState(this.mDisableAnimate, this.mPrefAnimate);
            }
        }

        private boolean isRigged() {
            IFileSet iFileSet = this.mFileSet;
            return (iFileSet == null || TextUtils.isEmpty(iFileSet.getRiggedFileUrl())) ? false : true;
        }

        private Intent getPickerIntent() {
            Intent intent = new Intent("android.intent.action.PICK", Contract.FileRecord.CONTENT_URI);
            intent.setPackage(getContext().getPackageName());
            intent.setType(SharingConstants.SCAN_3D_MIME_TYPE);
            intent.putExtra(GalleryActivity.PICK_INTENT_EXTRA_INTERNAL, true);
            intent.putExtra(SharingConstants.EXTRA_EXPLANATORY_TEXT, getString(com.sonymobile.scan3d.R.string.explanatory_text_wallpaper_picker));
            return intent;
        }

        private void saveSharedPrefs() {
            PreferenceManager.getDefaultSharedPreferences(getContext()).edit().putBoolean(getString(com.sonymobile.scan3d.R.string.pref_live_wallpaper_isanimated), this.mPrefAnimate).putBoolean(getString(com.sonymobile.scan3d.R.string.pref_live_wallpaper_rotate), this.mPrefRotate).putString(getString(com.sonymobile.scan3d.R.string.pref_live_wallpaper_background), this.mPrefBackground.name()).putString(getString(com.sonymobile.scan3d.R.string.pref_live_wallpaper_uri), this.mPrefModel.toString()).apply();
        }

        @Override // com.sonymobile.scan3d.viewer.fragments.component.AnimationMenu.AnimationMenuListener
        public void onAnimateChanged(boolean z) {
            this.mPrefAnimate = z;
            this.mAnimationView.queueEvent(this::updateModel);
        }

        @Override // com.sonymobile.scan3d.viewer.fragments.component.AnimationMenu.AnimationMenuListener
        public void onItemPicked(Pickable pickable) {
            this.mPrefBackground = (ViewerBackground) pickable.getIdentifier();
            this.mAnimationView.queueEvent(this::updateBackground);
        }

        @Override // com.sonymobile.scan3d.viewer.fragments.component.AnimationMenu.AnimationMenuListener
        public void onRotateChanged(boolean z) {
            if (z != this.mPrefRotate) {
                this.mCurrentRotation = z ? 1.0f : 0.0f;
                this.mDefaultRotationDirection = 1.0f;
                this.mAnimationView.requestRender();
                this.mPrefRotate = z;
            }
        }

        @Override // com.sonymobile.scan3d.viewer.SphanRenderer.OnDrawFrameListener
        public void onDrawFrameDelta(long j) {
            float[] currentTilt = this.mTiltSensor.getCurrentTilt();
            float f = this.mCurrentRotation;
            int i = (((int) f) / 60) + (((int) (((-Math.signum(f)) * 360.0f) + this.mCurrentRotation)) / 60);
            if (Math.abs(i) != 5) {
                this.mDefaultRotationDirection = Math.signum(i);
            }
            this.mCurrentRotation = (this.mCurrentRotation + (j * (this.mDefaultRotationDirection * WallpaperPreviewer.DEFAULT_ROTATION_SPEED))) % 360.0f;
            this.mSphanRenderer.setViewMatrix(this.mViewM, 0);
            this.mSphanRenderer.transform(0.0f, 0.0f, 0.0f, (currentTilt[1] * 45.0f) / 1.5707964f, this.mCurrentRotation - ((currentTilt[0] * 45.0f) / 1.5707964f), 0.0f, 1.0f);
            this.mTransformedViewM = this.mSphanRenderer.getViewMatrix();
        }

        @Override // android.content.SharedPreferences.OnSharedPreferenceChangeListener
        public void onSharedPreferenceChanged(SharedPreferences sharedPreferences, String str) {
            if (WallpaperPreviewer.PREF_POSE.equals(str)) {
                applySavedObjectPose();
            }
        }
    }
}
