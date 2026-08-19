package com.sonymobile.scan3d.wallpaper;

import android.app.WallpaperInfo;
import android.app.WallpaperManager;
import android.content.ComponentName;
import android.content.ContentUris;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.net.Uri;
import android.os.Handler;
import android.preference.PreferenceManager;
import android.service.wallpaper.WallpaperService;
import android.text.TextUtils;
import android.view.MotionEvent;
import android.view.SurfaceHolder;
import androidx.annotation.FloatRange;
import com.sonymobile.scan3d.GLThread;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.ViewerBackground;
import com.sonymobile.scan3d.storageservice.authentication.Vault;
import com.sonymobile.scan3d.storageservice.provider.Contract;
import com.sonymobile.scan3d.storageservice.provider.Factory;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.viewer.GestureHandler;
import com.sonymobile.scan3d.viewer.SphanRenderer;
import java.util.Random;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class SphinxWallpaperService extends WallpaperService {
    private static final float CALCULATE_SPEED_MULTIPLIER = 0.027777778f;
    private static final float DEFAULT_ROTATION_SPEED = 0.0027692309f;
    private static final int FACE_FRONT_ANGLE_LIMIT = 60;
    private static final int FACE_FRONT_SEGMENTS = 6;
    private static final float GET_BACK_ROTATION_MULTIPLIER = 5.0f;
    private static final int MAX_TILT_DEGREES = 45;
    private static final String PREF_JSON_VIEW_MAT = "view_mat";
    private static final String PREF_POSE = "pref_lw_pose";
    private static final long PREVIEW_ANIMATION_DELAY = 3000;
    private static final float ROTATION_DECELERATION_MULTIPLIER = 0.98f;
    private static final float VELOCITY_MIN = 1500.0f;
    private static final Object sMutex = new Object();

    @Override // android.service.wallpaper.WallpaperService
    public WallpaperService.Engine onCreateEngine() {
        return new OpenGLES2Engine();
    }

    private class OpenGLES2Engine extends WallpaperService.Engine implements SphanRenderer.OnDrawFrameListener, SharedPreferences.OnSharedPreferenceChangeListener, GestureHandler.GestureListener {
        private static final float MAX_ABS_SPIN_SPEED = 0.9f;
        private TiltAnimationHelper mAnimationHelper;
        private Runnable mAnimator;
        private ViewerBackground mBackground;
        float mCurrentRotation;

        @FloatRange(from = -1.0d, fromInclusive = true, to = 1.0d, toInclusive = true)
        private float mDefaultRotationDirection;
        private GLThread mGLThread;
        private GestureHandler mGestureHandler;
        private Handler mMainHandler;
        private float mPreviousOffset;
        private Random mRandom;

        @FloatRange(from = -0.8999999761581421d, fromInclusive = true, to = 0.8999999761581421d, toInclusive = true)
        private float mSpinSpeed;
        private TiltSensor mTiltSensor;
        private boolean mUpdatePending;
        private Uri mUri;
        private boolean mUseMovement;
        private boolean mUseRigged;
        private float[] mViewM;
        private SphanRenderer mViewerRenderer;

        @Override // com.sonymobile.scan3d.viewer.GestureHandler.GestureListener
        public final boolean onSingleTap() {
            return true;
        }

        private OpenGLES2Engine() {
            this.mViewM = null;
            this.mCurrentRotation = 0.0f;
            this.mDefaultRotationDirection = 1.0f;
            this.mPreviousOffset = 0.5f;
            this.mRandom = new Random();
            this.mMainHandler = new Handler();
            this.mAnimator = () -> {
                int numAnimations;
                SphanRenderer sphanRenderer = this.mViewerRenderer;
                if (sphanRenderer == null || (numAnimations = sphanRenderer.getNumAnimations()) <= 0) {
                    return;
                }
                this.mViewerRenderer.startAnimation(0, this.mRandom.nextInt(numAnimations));
                this.mGLThread.requestRender();
                this.mMainHandler.postDelayed(this.mAnimator, SphinxWallpaperService.PREVIEW_ANIMATION_DELAY);
            };
        }

        @Override // android.service.wallpaper.WallpaperService.Engine
        public void onCreate(SurfaceHolder surfaceHolder) {
            super.onCreate(surfaceHolder);
            loadSharedPrefs();
            this.mPreviousOffset = 0.5f;
            this.mViewM = null;
            this.mViewerRenderer = new SphanRenderer(SphinxWallpaperService.this);
            this.mViewerRenderer.setBackground(this.mBackground.ordinal());
            PreferenceManager.getDefaultSharedPreferences(SphinxWallpaperService.this.getBaseContext()).registerOnSharedPreferenceChangeListener(this);
            this.mGestureHandler = new GestureHandler(SphinxWallpaperService.this, this);
            initZipModel();
            initGLThread();
            applySavedObjectPose();
            this.mGLThread.onResume();
            if (isPreview()) {
                this.mAnimator.run();
            }
        }

        private void initGLThread() {
            this.mGLThread = new GLThread(new Object(), this.mViewerRenderer);
            getSurfaceHolder().addCallback(new SurfaceHolder.Callback() { // from class: com.sonymobile.scan3d.wallpaper.SphinxWallpaperService.OpenGLES2Engine.1
                @Override // android.view.SurfaceHolder.Callback
                public void surfaceCreated(SurfaceHolder surfaceHolder) {
                    OpenGLES2Engine.this.mGLThread.surfaceCreated(surfaceHolder.getSurface());
                }

                @Override // android.view.SurfaceHolder.Callback
                public void surfaceChanged(SurfaceHolder surfaceHolder, int i, int i2, int i3) {
                    OpenGLES2Engine.this.mGLThread.onWindowResize(i2, i3);
                }

                @Override // android.view.SurfaceHolder.Callback
                public void surfaceDestroyed(SurfaceHolder surfaceHolder) {
                    OpenGLES2Engine.this.mGLThread.surfaceDestroyed();
                }
            });
            this.mGLThread.start();
            this.mAnimationHelper = new TiltAnimationHelper(SphinxWallpaperService.this.getBaseContext(), this.mGLThread, this.mViewerRenderer);
            this.mTiltSensor = new TiltSensor(SphinxWallpaperService.this, this.mGLThread);
        }

        private void loadSharedPrefs() {
            SharedPreferences defaultSharedPreferences = PreferenceManager.getDefaultSharedPreferences(SphinxWallpaperService.this);
            String string = defaultSharedPreferences.getString(SphinxWallpaperService.this.getString(R.string.pref_live_wallpaper_uri), "");
            this.mUri = !TextUtils.isEmpty(string) ? Uri.parse(string) : null;
            this.mUseRigged = defaultSharedPreferences.getBoolean(SphinxWallpaperService.this.getString(R.string.pref_live_wallpaper_isanimated), false);
            this.mBackground = ViewerBackground.valueOf(defaultSharedPreferences.getString(SphinxWallpaperService.this.getString(R.string.pref_live_wallpaper_background), ViewerBackground.BACKGROUND_SIMPLE.name()));
            this.mUseMovement = defaultSharedPreferences.getBoolean(SphinxWallpaperService.this.getString(R.string.pref_live_wallpaper_rotate), false);
        }

        @Override // android.service.wallpaper.WallpaperService.Engine
        public void onDestroy() {
            this.mMainHandler.removeCallbacks(this.mAnimator);
            PreferenceManager.getDefaultSharedPreferences(SphinxWallpaperService.this.getBaseContext()).unregisterOnSharedPreferenceChangeListener(this);
            this.mGLThread.requestExitAndWait();
            this.mViewerRenderer.release();
            this.mViewerRenderer = null;
            super.onDestroy();
        }

        private boolean initZipModel() {
            String zipFileUrl;
            Uri defaultModelUri = this.mUri;
            if (defaultModelUri == null) {
                defaultModelUri = getDefaultModelUri();
            }
            boolean zLoad = false;
            if (defaultModelUri == null) {
                return false;
            }
            IFileSet iFileSetCreate = Factory.create(SphinxWallpaperService.this, defaultModelUri);
            if (iFileSetCreate != null && iFileSetCreate.getSyncState() != 7 && !TextUtils.isEmpty(iFileSetCreate.getZipFileUrl())) {
                if (this.mUseRigged && !TextUtils.isEmpty(iFileSetCreate.getRiggedFileUrl())) {
                    zipFileUrl = iFileSetCreate.getRiggedFileUrl();
                } else {
                    zipFileUrl = iFileSetCreate.getZipFileUrl();
                }
                synchronized (SphinxWallpaperService.sMutex) {
                    zLoad = this.mViewerRenderer.load(zipFileUrl, Vault.getPassword(SphinxWallpaperService.this.getApplicationContext()));
                }
            }
            return zLoad;
        }

        private Uri getDefaultModelUri() {
            Cursor cursorQuery = SphinxWallpaperService.this.getBaseContext().getContentResolver().query(Contract.FileRecord.CONTENT_URI, new String[]{"_id", "created"}, null, null, "created DESC");
            Throwable th = null;
            try {
                if (cursorQuery != null) {
                    if (cursorQuery.moveToFirst()) {
                        Uri uriWithAppendedId = ContentUris.withAppendedId(Contract.FileRecord.CONTENT_URI, cursorQuery.getInt(0));
                        if (cursorQuery != null) {
                            cursorQuery.close();
                        }
                        return uriWithAppendedId;
                    }
                }
                if (cursorQuery != null) {
                    cursorQuery.close();
                }
                return null;
            } catch (Throwable th2) {
                if (cursorQuery != null) {
                    if (0 != 0) {
                        try {
                            cursorQuery.close();
                        } catch (Throwable th3) {
                            th.addSuppressed(th3);
                        }
                    } else {
                        cursorQuery.close();
                    }
                }
                throw th2;
            }
        }

        @Override // com.sonymobile.scan3d.viewer.SphanRenderer.OnDrawFrameListener
        public void onDrawFrameDelta(long j) {
            float[] currentTilt = this.mTiltSensor.getCurrentTilt();
            float f = this.mCurrentRotation;
            int i = (((int) f) / 60) + (((int) (((-Math.signum(f)) * 360.0f) + this.mCurrentRotation)) / 60);
            int iAbs = Math.abs(i);
            float f2 = SphinxWallpaperService.DEFAULT_ROTATION_SPEED;
            if (iAbs != 5) {
                this.mDefaultRotationDirection = Math.signum(i);
                if (this.mSpinSpeed < SphinxWallpaperService.DEFAULT_ROTATION_SPEED) {
                    f2 = 0.013846154f;
                }
            }
            setSpinSpeed(this.mSpinSpeed * SphinxWallpaperService.ROTATION_DECELERATION_MULTIPLIER);
            this.mCurrentRotation = (this.mCurrentRotation + (j * (this.mSpinSpeed + (this.mDefaultRotationDirection * f2)))) % 360.0f;
            float[] fArr = this.mViewM;
            if (fArr != null) {
                this.mViewerRenderer.setViewMatrix(fArr, 0);
            }
            this.mViewerRenderer.transform(0.0f, 0.0f, 0.0f, (currentTilt[1] * 45.0f) / 1.5707964f, this.mCurrentRotation - ((currentTilt[0] * 45.0f) / 1.5707964f), 0.0f, 1.0f);
        }

        private void updateModel() {
            this.mMainHandler.removeCallbacks(this.mAnimator);
            this.mViewerRenderer.resetView();
            this.mViewerRenderer.onGLContextDestroyed();
            this.mViewerRenderer.removeMeshes();
            this.mViewerRenderer.setBackground(this.mBackground.ordinal());
            initZipModel();
            applySavedObjectPose();
            this.mViewerRenderer.onGLContextCreated();
            this.mGLThread.requestRender();
            if (isPreview()) {
                this.mAnimator.run();
            }
        }

        @Override // android.service.wallpaper.WallpaperService.Engine
        public void onOffsetsChanged(float f, float f2, float f3, float f4, int i, int i2) {
            if (this.mGLThread != null && !isPreview()) {
                if (this.mPreviousOffset < 0.0f) {
                    this.mPreviousOffset = f;
                }
                float f5 = this.mPreviousOffset;
                float f6 = (f - f5) * 180.0f;
                if (this.mUseMovement && f5 != 0.0f) {
                    calculateSpin(f6);
                } else {
                    rotate(f6);
                    this.mGLThread.requestRender();
                }
            } else {
                GLThread gLThread = this.mGLThread;
                if (gLThread != null) {
                    gLThread.requestRender();
                }
            }
            this.mPreviousOffset = f;
        }

        private void calculateSpin(float f) {
            float f2 = f * SphinxWallpaperService.CALCULATE_SPEED_MULTIPLIER;
            float f3 = this.mSpinSpeed;
            if (f3 < 0.0f) {
                if (f2 < f3 || f2 > 0.0f) {
                    setSpinSpeed(f2);
                    this.mDefaultRotationDirection = Math.signum(this.mSpinSpeed);
                    return;
                }
                return;
            }
            if (f2 > f3 || f2 < 0.0f) {
                setSpinSpeed(f2);
                this.mDefaultRotationDirection = Math.signum(this.mSpinSpeed);
            }
        }

        private void setSpinSpeed(float f) {
            this.mSpinSpeed = Math.max(-0.9f, Math.min(MAX_ABS_SPIN_SPEED, f));
        }

        private void rotate(float f) {
            this.mGLThread.queueEvent(() -> this.mViewerRenderer.transform(0.0f, 0.0f, 0.0f, 0.0f, f, 0.0f, 1.0f));
        }

        @Override // android.service.wallpaper.WallpaperService.Engine
        public void onTouchEvent(MotionEvent motionEvent) {
            if (motionEvent.getAction() == 0) {
                this.mAnimationHelper.setEnableAnimation(true);
                if (!isPreview()) {
                    setSpinSpeed(0.0f);
                    int numAnimations = this.mViewerRenderer.getNumAnimations();
                    if (numAnimations > 0) {
                        this.mViewerRenderer.startAnimation(0, this.mRandom.nextInt(numAnimations));
                    }
                }
            } else if (motionEvent.getAction() == 1) {
                this.mAnimationHelper.setEnableAnimation(false);
            }
            if (!isPreview() || this.mGLThread == null) {
                return;
            }
            this.mGestureHandler.handleEvent(motionEvent);
        }

        @Override // android.service.wallpaper.WallpaperService.Engine
        public void onVisibilityChanged(boolean z) {
            super.onVisibilityChanged(z);
            if (this.mGLThread != null) {
                if (z) {
                    restart(this.mUpdatePending);
                    this.mUpdatePending = false;
                } else {
                    pause();
                }
            }
        }

        private void pause() {
            this.mGLThread.onPause();
            this.mViewerRenderer.setOnDrawFrameListener(null);
            if (this.mUseMovement) {
                this.mTiltSensor.onPause();
            } else {
                this.mAnimationHelper.pause();
            }
        }

        private void restart(boolean z) {
            if (z) {
                this.mGLThread.queueEvent(this::updateModel);
            }
            this.mGLThread.onResume();
            if (this.mUseMovement && !isPreview()) {
                this.mCurrentRotation = 1.0f;
                this.mTiltSensor.onResume();
                this.mViewerRenderer.setOnDrawFrameListener(this);
            } else {
                if (isPreview()) {
                    return;
                }
                this.mCurrentRotation = 0.0f;
                this.mAnimationHelper.resume();
            }
        }

        private void applySavedObjectPose() {
            String string = PreferenceManager.getDefaultSharedPreferences(SphinxWallpaperService.this.getBaseContext()).getString(SphinxWallpaperService.PREF_POSE, "");
            if (TextUtils.isEmpty(string)) {
                return;
            }
            try {
                JSONArray jSONArray = new JSONObject(string).getJSONArray(SphinxWallpaperService.PREF_JSON_VIEW_MAT);
                this.mViewM = new float[16];
                for (int i = 0; i < this.mViewM.length; i++) {
                    this.mViewM[i] = (float) jSONArray.getDouble(i);
                }
                this.mViewerRenderer.setViewMatrix(this.mViewM, 0);
                this.mGLThread.requestRender();
            } catch (JSONException unused) {
            }
        }

        private void saveObjectPose() {
            float[] viewMatrix = this.mViewerRenderer.getViewMatrix();
            SharedPreferences.Editor editorEdit = PreferenceManager.getDefaultSharedPreferences(SphinxWallpaperService.this.getBaseContext()).edit();
            JSONObject jSONObject = new JSONObject();
            try {
                jSONObject.put(SphinxWallpaperService.PREF_JSON_VIEW_MAT, new JSONArray(viewMatrix));
                editorEdit.putString(SphinxWallpaperService.PREF_POSE, jSONObject.toString());
                editorEdit.apply();
            } catch (JSONException unused) {
            }
        }

        @Override // android.content.SharedPreferences.OnSharedPreferenceChangeListener
        public void onSharedPreferenceChanged(SharedPreferences sharedPreferences, String str) {
            if (!isPreview() && SphinxWallpaperService.PREF_POSE.equals(str)) {
                applySavedObjectPose();
            } else if (str.equals(SphinxWallpaperService.this.getString(R.string.pref_live_wallpaper_uri))) {
                String string = sharedPreferences.getString(str, null);
                this.mUri = TextUtils.isEmpty(string) ? null : Uri.parse(string);
            } else if (str.equals(SphinxWallpaperService.this.getString(R.string.pref_live_wallpaper_background))) {
                this.mBackground = ViewerBackground.valueOf(sharedPreferences.getString(str, ViewerBackground.BACKGROUND_SIMPLE.name()));
            } else if (str.equals(SphinxWallpaperService.this.getString(R.string.pref_live_wallpaper_isanimated))) {
                this.mUseRigged = sharedPreferences.getBoolean(str, false);
            } else if (!str.equals(SphinxWallpaperService.this.getString(R.string.pref_live_wallpaper_rotate))) {
                return;
            } else {
                this.mUseMovement = sharedPreferences.getBoolean(str, false);
            }
            if (isVisible()) {
                restart(true);
            } else {
                this.mUpdatePending = true;
            }
        }

        @Override // com.sonymobile.scan3d.viewer.GestureHandler.GestureListener
        public boolean onTransform(float f, float f2, float f3, float f4, float f5, float f6, float f7) {
            this.mViewerRenderer.transform(-f, -f2, -f3, f5, -f4, f6, f7);
            this.mGLThread.requestRender();
            return true;
        }

        @Override // com.sonymobile.scan3d.viewer.GestureHandler.GestureListener
        public boolean onMoveSingleTap(float f, float f2) {
            this.mViewerRenderer.touchDrag(f, f2);
            this.mGLThread.requestRender();
            return true;
        }

        @Override // com.sonymobile.scan3d.viewer.GestureHandler.GestureListener
        public final boolean onDoubleTap() {
            this.mViewerRenderer.resetView();
            this.mGLThread.requestRender();
            return true;
        }

        @Override // com.sonymobile.scan3d.viewer.GestureHandler.GestureListener
        public final boolean onFling(float f, float f2) {
            if (Math.abs(f) <= SphinxWallpaperService.VELOCITY_MIN && Math.abs(f2) <= SphinxWallpaperService.VELOCITY_MIN) {
                return true;
            }
            this.mViewerRenderer.onFling(f, f2);
            return true;
        }

        @Override // com.sonymobile.scan3d.viewer.GestureHandler.GestureListener
        public boolean onDown() {
            return this.mViewerRenderer.onDown();
        }

        @Override // com.sonymobile.scan3d.viewer.GestureHandler.GestureListener
        public boolean onUp() {
            saveObjectPose();
            return false;
        }
    }

    public static void setAsWallpaper(Context context, Uri uri, boolean z) {
        PreferenceManager.getDefaultSharedPreferences(context).edit().putString(context.getString(R.string.pref_live_wallpaper_uri), uri.toString()).putString(PREF_POSE, "").putBoolean(context.getString(R.string.pref_live_wallpaper_isanimated), z).apply();
        Intent intent = new Intent();
        intent.setAction("android.service.wallpaper.CHANGE_LIVE_WALLPAPER");
        intent.putExtra("android.service.wallpaper.extra.LIVE_WALLPAPER_COMPONENT", new ComponentName(context.getPackageName(), SphinxWallpaperService.class.getCanonicalName()));
        intent.setFlags(1082130432);
        context.startActivity(intent);
    }

    public static boolean isCurrentWallpaper(Context context, Uri uri) {
        WallpaperInfo wallpaperInfo = WallpaperManager.getInstance(context).getWallpaperInfo();
        if (wallpaperInfo == null) {
            return false;
        }
        return wallpaperInfo.getPackageName().equals(context.getPackageName()) && Uri.parse(PreferenceManager.getDefaultSharedPreferences(context).getString(context.getString(R.string.pref_live_wallpaper_uri), "")).equals(uri);
    }
}
