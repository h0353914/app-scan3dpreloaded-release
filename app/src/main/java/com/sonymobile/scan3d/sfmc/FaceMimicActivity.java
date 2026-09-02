package com.sonymobile.scan3d.sfmc;

import android.animation.ValueAnimator;
import android.app.Activity;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.ResolveInfo;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.media.AudioAttributes;
import android.media.MediaMetadataRetriever;
import android.media.SoundPool;
import android.net.Uri;
import android.os.Bundle;
import android.os.CountDownTimer;
import android.os.Environment;
import android.os.Handler;
import android.os.Message;
import android.os.Messenger;
import android.os.RemoteException;
import android.preference.PreferenceManager;
import android.provider.MediaStore;
import android.util.Log;
import android.util.Pair;
import android.util.SparseIntArray;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.WindowManager;
import android.view.animation.AnimationUtils;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.ScrollView;
import android.widget.SeekBar;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toolbar;

import androidx.annotation.AnyThread;
import androidx.annotation.IdRes;
import androidx.annotation.MainThread;
import androidx.annotation.NonNull;
import androidx.annotation.RawRes;
import androidx.annotation.StringRes;
import androidx.annotation.VisibleForTesting;
import androidx.annotation.WorkerThread;
import androidx.fragment.app.FragmentActivity;

import com.sonymobile.scan3d.CameraImageProvider;
import com.sonymobile.scan3d.GLThread;
import com.sonymobile.scan3d.NativeGLTextureView;
import com.sonymobile.scan3d.PermissionUtil;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.SphinxFocusType;
import com.sonymobile.scan3d.ZipResourceManager;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.network.StreamUtils;
import com.sonymobile.scan3d.storageservice.provider.ExpansionProvider;
import com.sonymobile.scan3d.storageservice.utils.FsUtils;
import com.sonymobile.scan3d.utils.MediaStoreUtil;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.atomic.AtomicReference;
import java.util.function.Consumer;

public class FaceMimicActivity extends FragmentActivity {

    private static final String ALBUM_VIEW = "com.sonymobile.album.action.VIEW";

    @VisibleForTesting
    static final CameraImageProviderFactory DEFAULT_CAMERA_IMAGE_PROVIDER_FACTORY =
            (context, listener, focusType, allowContinuousFocus) ->
                    new CameraImageProvider(context, listener, focusType, allowContinuousFocus);

    @VisibleForTesting
    static final ContentOpener DEFAULT_CONTENT_OPENER = (context, uri) -> {
        if (ZipResourceManager.usingOBB()) {
            return context.getContentResolver().openInputStream(uri);
        }
        return ZipResourceManager.getZipResourceFile().getInputStream(uri.getLastPathSegment());
    };

    @VisibleForTesting
    static final MimickingEngineFactory DEFAULT_MIMICKING_ENGINE_FACTORY = Sfmc::new;

    @VisibleForTesting
    static final PictureSaver DEFAULT_PICTURE_SAVER = (activity, bitmap, dest, listener) ->
            new SavePictureTask(activity.mThis, bitmap, dest, listener).execute();

    @VisibleForTesting
    static final SoundPlayer DEFAULT_SOUND_PLAYER = (activity, soundId) -> {
        SoundPool pool = activity.mSoundPool;
        if (pool != null) {
            int streamId = activity.mSounds.get(soundId);
            pool.play(streamId, 1.0f, 1.0f, 1, 0, 1.0f);
        }
    };

    @VisibleForTesting
    static final VideoRecorder DEFAULT_VIDEO_RECORDER = new VideoRecorder() {
        @Override
        public void start(FaceMimicActivity activity, NativeGLTextureView surfaceView, File encoderFile,
                File outputFile, RecordingListener listener, long displayRefreshNsec, int unusedX, int unusedY,
                int width, int height, boolean recordAudio) {
            surfaceView.startEncoder(encoderFile,
                    () -> new SaveVideoTask(activity.mThis, encoderFile, outputFile, listener).execute(),
                    displayRefreshNsec, unusedX, unusedY, width, height, recordAudio);
        }

        @Override
        public void stop(NativeGLTextureView surfaceView) {
            surfaceView.stopEncoder();
        }
    };

    private static final String EXTENSION_JPEG = "jpg";
    private static final String EXTENSION_MP4 = "mp4";
    private static final DateTimeFormatter FILE_DATE_FORMAT =
            DateTimeFormatter.ofPattern("yyyyMMdd_HHmmss_SSS", Locale.ENGLISH);
    private static final String FILE_NAME = "3DCreator_FaceMimic_%s.%s";
    private static final int FIRST_TIME_INFO_TEXT_TIMEOUT = 10000;
    private static final String MIME_TYPE_JPEG = "image/jpeg";
    private static final String MIME_TYPE_MP4 = "video/mp4";
    private static final int REQUEST_CODE_MODEL_PICKING = 1;
    public static final String STARTED_FROM_ENTRY_POINT = "started_from_entry_point";

    private static final HashMap<MimickingEngine.StateListener.State, Integer> STATE_STRINGS =
            new HashMap<MimickingEngine.StateListener.State, Integer>() {{
                put(MimickingEngine.StateListener.State.IDLE, R.string.face_mimic_lost_face);
                put(MimickingEngine.StateListener.State.SEARCHING, R.string.face_mimic_lost_face);
            }};

    private static final String TAG = "com.sonymobile.scan3d.sfmc.FaceMimicActivity";
    private static final String TEMP_VIDEO_FILE_NAME = "face_mimic_temp.mp4";

    private static CameraImageProviderFactory sCameraProviderFactory = DEFAULT_CAMERA_IMAGE_PROVIDER_FACTORY;
    private static ContentOpener sContentOpener = DEFAULT_CONTENT_OPENER;
    private static MimickingEngineFactory sEngineFactory = DEFAULT_MIMICKING_ENGINE_FACTORY;
    private static PictureSaver sPictureSaver = DEFAULT_PICTURE_SAVER;
    private static SoundPlayer sSoundPlayer = DEFAULT_SOUND_PLAYER;
    private static VideoRecorder sVideoRecorder = DEFAULT_VIDEO_RECORDER;

    @GlThread
    private Runnable mAfterRender;
    private Uri mCurrentModel;
    private Uri mCustomModel;
    private MimickingEngine mEngine;
    private CountDownTimer mFirstTimeInfoTimer;
    @GlThread
    private boolean mHasSurface;
    @GlThread
    private CameraImageProvider mImageProvider;
    private Integer mInstruction;
    private Uri mLastPicture;
    private Uri mLastVideo;
    private final Handler mMainHandler;
    private View mParentView;
    private View mPermissionsContainer;
    private final Handler mPermissionsHandler;
    private int mPrevSelection;
    private Runnable mRecTimer;
    private int mRecordingStartSoundDuration;
    private SoundPool mSoundPool;
    private SparseIntArray mSounds;
    private UiState mState;
    private NativeGLTextureView mSurfaceView;
    private final AtomicReference<FaceMimicActivity> mThis;

    public FaceMimicActivity() {
        mMainHandler = new Handler();
        mPermissionsHandler = new Handler();
        mPrevSelection = -1;
        mThis = new AtomicReference<>(this);
    }

    private void addDevOptions() {
        ViewGroup uiLayer = (ViewGroup) findViewById(R.id.ui_layer);
        View.inflate(this, R.layout.face_mimic_dev_opts, uiLayer);

        ((SeekBar) findViewById(R.id.dev_opts_transp)).setOnSeekBarChangeListener(
                new SeekBar.OnSeekBarChangeListener() {
                    @Override
                    public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                        ((TextView) findViewById(R.id.dev_opts_transp_val))
                                .setText(String.format(Locale.ENGLISH, "%d%%", progress));
                        findViewById(R.id.dev_opts_menu)
                                .setBackgroundColor(((100 - progress) * 255 / 100) << 24);
                    }

                    @Override
                    public void onStartTrackingTouch(SeekBar seekBar) {
                    }

                    @Override
                    public void onStopTrackingTouch(SeekBar seekBar) {
                    }
                });

        ((SeekBar) findViewById(R.id.viewfinder_scale)).setOnSeekBarChangeListener(
                new SeekBar.OnSeekBarChangeListener() {
                    @Override
                    public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                        ((TextView) findViewById(R.id.viewfinder_scale_val))
                                .setText(String.format(Locale.ENGLISH, "%d%%", progress));
                        mEngine.setProperty("/debug/camera/viewfinder_scale", progress / 100f);
                    }

                    @Override
                    public void onStartTrackingTouch(SeekBar seekBar) {
                    }

                    @Override
                    public void onStopTrackingTouch(SeekBar seekBar) {
                    }
                });

        ((SeekBar) findViewById(R.id.pos_reg)).setOnSeekBarChangeListener(
                new SeekBar.OnSeekBarChangeListener() {
                    @Override
                    public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                        float value = progress / 50f;
                        ((TextView) findViewById(R.id.pos_reg_val))
                                .setText(String.format(Locale.ENGLISH, "%.2f", value));
                        mEngine.setProperty("/ceres/pos_reg", value);
                    }

                    @Override
                    public void onStartTrackingTouch(SeekBar seekBar) {
                    }

                    @Override
                    public void onStopTrackingTouch(SeekBar seekBar) {
                    }
                });

        ((SeekBar) findViewById(R.id.action_reg)).setOnSeekBarChangeListener(
                new SeekBar.OnSeekBarChangeListener() {
                    @Override
                    public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                        float value = progress / 50f;
                        ((TextView) findViewById(R.id.action_reg_val))
                                .setText(String.format(Locale.ENGLISH, "%.2f", value));
                        mEngine.setProperty("/ceres/action_reg", value);
                    }

                    @Override
                    public void onStartTrackingTouch(SeekBar seekBar) {
                    }

                    @Override
                    public void onStopTrackingTouch(SeekBar seekBar) {
                    }
                });

        ((Switch) findViewById(R.id.viewing_angle_comp)).setOnCheckedChangeListener((button, checked) ->
                mEngine.setProperty("/filters/viewing_angle_compensation", checked ? 1.0f : 0f));

        ((Switch) findViewById(R.id.user_gazing)).setOnCheckedChangeListener((button, checked) ->
                mEngine.setProperty("/effects/user_gazing_", checked ? 1.0f : 0f));

        ViewTreeObserver observer = findViewById(R.id.dev_options).getViewTreeObserver();
        observer.addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() {
            @Override
            public void onGlobalLayout() {
                findViewById(R.id.dev_options).getViewTreeObserver().removeOnGlobalLayoutListener(this);
                int height = findViewById(R.id.dev_options).getHeight() - findViewById(R.id.icon).getHeight();
                findViewById(R.id.space).setLayoutParams(new LinearLayout.LayoutParams(-1, height));
            }
        });

        observer.addOnScrollChangedListener(() -> {
            View icon = findViewById(R.id.icon);
            int iconHeightX2 = icon.getHeight() * 2;
            int scrollY = findViewById(R.id.dev_options).getScrollY();
            float alpha = Math.max(0, iconHeightX2 - scrollY) / (float) iconHeightX2;
            icon.setAlpha(alpha);
            icon.setVisibility(alpha == 0 ? View.GONE : View.VISIBLE);
        });

        findViewById(R.id.icon).setOnClickListener(v -> {
            ScrollView scrollView = (ScrollView) findViewById(R.id.dev_options);
            int height = findViewById(R.id.dev_options).getHeight();
            scrollView.smoothScrollTo(0, height);
        });

        findViewById(R.id.scrolled).setOnClickListener(v ->
                ((ScrollView) findViewById(R.id.dev_options)).smoothScrollTo(0, 0));

        findViewById(R.id.dev_opts_menu).setOnTouchListener((v, event) -> true);
    }

    @MainThread
    private void checkButton(@IdRes int id) {
        RadioGroup group = (RadioGroup) findViewById(R.id.model_selection);
        group.clearCheck();
        group.check(id);
    }

    @GlThread
    private void closeCamera() {
        if (mImageProvider != null && mImageProvider.isStreaming()) {
            mImageProvider.closeCamera();
            mImageProvider = null;
        }
    }

    private boolean contentExists(@NonNull Uri uri) {
        if (!PermissionUtil.hasPermission(getApplicationContext(), "android.permission.READ_EXTERNAL_STORAGE")) {
            return false;
        }
        try (Cursor cursor = getApplicationContext().getContentResolver()
                .query(uri, null, null, null, null)) {
            return cursor != null && cursor.getCount() > 0;
        }
    }

    @AnyThread
    private static File createDateStampedFile(String directoryType, String extension) {
        File dir = Environment.getExternalStoragePublicDirectory(directoryType);
        String name = String.format(FILE_NAME, LocalDateTime.now().format(FILE_DATE_FORMAT), extension);
        return new File(dir, name);
    }

    private boolean deniedOnlyOptionalPermissions(List<String> denied, String[] optionalPermissions) {
        List<String> optionalList = Arrays.asList(optionalPermissions);
        for (String permission : denied) {
            if (!optionalList.contains(permission)) {
                return false;
            }
        }
        return true;
    }

    @AnyThread
    private Intent getAlbumViewIntent(Uri uri, String mimeType) {
        Intent intent = new Intent(ALBUM_VIEW);
        intent.addCategory(Intent.CATEGORY_DEFAULT);
        intent.setDataAndType(uri, mimeType);
        List<ResolveInfo> activities = getPackageManager().queryIntentActivities(intent, 0);
        if (activities.isEmpty()) {
            intent = new Intent(Intent.ACTION_VIEW, uri);
        }
        return intent;
    }

    @AnyThread
    private long getDisplayRefreshNsec(Activity activity) {
        WindowManager windowManager = (WindowManager) activity.getSystemService(Context.WINDOW_SERVICE);
        float refreshRate = windowManager.getDefaultDisplay().getRefreshRate();
        return Math.round(1.0E9 / refreshRate);
    }

    @AnyThread
    private Uri getResourceUri(int resId) {
        return Uri.parse("android.resource://" + getPackageName() + "/" + resId);
    }

    private boolean hasShownAudioPermissionsRequest() {
        SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
        return preferences.getBoolean(getString(R.string.pref_audio_permissions_requested), false);
    }

    @MainThread
    private void hide(@IdRes int id) {
        View view = findViewById(id);
        if (view != null) {
            view.setVisibility(View.GONE);
        }
    }

    @MainThread
    private void hideTimer() {
        if (mRecTimer != null) {
            mMainHandler.removeCallbacks(mRecTimer);
        }
        mRecTimer = null;
        hide(R.id.rec_timer);
    }

    private boolean isAudioPreferred() {
        SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
        return preferences.getBoolean(getString(R.string.pref_face_mimic_microphone_on), false);
    }

    @MainThread
    private void loadModel(Uri modelUri, Uri maskUri, Consumer<Boolean> callback) {
        runOnGlThread(() -> {
            try (InputStream modelStream = sContentOpener.openInputStream(this, modelUri);
                    InputStream maskStream = sContentOpener.openInputStream(this, maskUri)) {
                if (modelStream == null || maskStream == null) {
                    throw new IOException("Could not open input stream");
                }
                byte[] modelData = StreamUtils.toByteArray(modelStream);
                byte[] maskData = StreamUtils.toByteArray(maskStream);
                if (!mEngine.loadTarget(modelData, maskData)) {
                    throw new IOException("Failed to load model");
                }
                mAfterRender = () -> callback.accept(true);
            } catch (IOException e) {
                runOnUiThread(() -> callback.accept(false));
            }
        });
    }

    @GlThread
    private void openCamera() {
        if (mImageProvider == null && mHasSurface) {
            mImageProvider = sCameraProviderFactory.newCameraImageProvider(this,
                    new CameraImageProvider.OnCameraStatusListener() {
                        @Override
                        @GlThread
                        public void onClose(CameraImageProvider provider) {
                            mEngine.setImageProvider(null);
                        }

                        @Override
                        @GlThread
                        public void onOpen(CameraImageProvider provider) {
                            mEngine.setImageProvider(mImageProvider);
                        }
                    }, SphinxFocusType.kFocusAuto, true);
            mImageProvider.openCamera();
        }
    }

    private boolean requestMissingPermissions(PermissionUtil.Permissions permissions,
            @StringRes int rationaleTextResId) {
        String[] missing = PermissionUtil.getMissingPermissions(this, permissions.getPermissions());
        setupViewPermissionsButton(rationaleTextResId, permissions.getPermissions(), permissions.getRequestCode());
        boolean hasMissing = missing.length > 0;
        if (hasMissing) {
            requestPermissions(missing, permissions.getRequestCode());
        }
        return hasMissing;
    }

    @MainThread
    private void runOnGlThread(Runnable runnable) {
        mSurfaceView.getGLThread().queueEvent(runnable);
    }

    private void setAudioPermissionsRequestShown() {
        PreferenceManager.getDefaultSharedPreferences(getApplicationContext()).edit()
                .putBoolean(getString(R.string.pref_audio_permissions_requested), true)
                .apply();
    }

    private void setAudioPreferred(boolean preferred) {
        PreferenceManager.getDefaultSharedPreferences(getApplicationContext()).edit()
                .putBoolean(getString(R.string.pref_face_mimic_microphone_on), preferred)
                .apply();
    }

    @MainThread
    @VisibleForTesting
    static void setCameraImageProviderFactory(@NonNull CameraImageProviderFactory factory) {
        sCameraProviderFactory = factory;
    }

    @MainThread
    @VisibleForTesting
    static void setContentOpener(@NonNull ContentOpener opener) {
        sContentOpener = opener;
    }

    @MainThread
    private void setLastPicture(Uri uri) {
        mLastPicture = uri;
        mLastVideo = null;
    }

    @MainThread
    private void setLastVideo(Uri uri) {
        mLastPicture = null;
        mLastVideo = uri;
    }

    @MainThread
    @VisibleForTesting
    static void setMimickingEngineFactory(@NonNull MimickingEngineFactory factory) {
        sEngineFactory = factory;
    }

    @MainThread
    @VisibleForTesting
    static void setPictureSaver(@NonNull PictureSaver saver) {
        sPictureSaver = saver;
    }

    @MainThread
    @VisibleForTesting
    static void setSoundPlayer(@NonNull SoundPlayer player) {
        sSoundPlayer = player;
    }

    @MainThread
    private void setState(UiState state) {
        updateInstruction(state);
        switch (state) {
            case IDLE:
                show(R.id.dev_options);
                hide(R.id.stop_recording);
                hide(R.id.model_loading_progress);
                hide(R.id.scrim);
                hideTimer();
                show(R.id.start_recording);
                show(R.id.take_picture);
                show(R.id.include_audio);
                show(R.id.use_manga_model);
                hide(R.id.select_other_model);
                show(R.id.use_monster_model);
                if (mLastPicture != null) {
                    show(R.id.picture_preview);
                } else {
                    hide(R.id.picture_preview);
                }
                if (mLastVideo != null) {
                    show(R.id.video_preview);
                } else {
                    hide(R.id.video_preview);
                }
                break;
            case PREPARING_TO_RECORD:
                hide(R.id.dev_options);
                hide(R.id.use_manga_model);
                hide(R.id.select_other_model);
                hide(R.id.use_monster_model);
                hide(R.id.start_recording);
                hide(R.id.take_picture);
                hide(R.id.include_audio);
                hide(R.id.picture_preview);
                hide(R.id.video_preview);
                break;
            case RECORDING:
                hide(R.id.dev_options);
                show(R.id.stop_recording);
                showTimer();
                hide(R.id.model_loading_progress);
                hide(R.id.scrim);
                hide(R.id.start_recording);
                hide(R.id.take_picture);
                hide(R.id.include_audio);
                hide(R.id.use_manga_model);
                hide(R.id.select_other_model);
                hide(R.id.use_monster_model);
                hide(R.id.picture_preview);
                hide(R.id.video_preview);
                break;
            case TAKING_PICTURE:
                hide(R.id.picture_preview);
                hide(R.id.video_preview);
                break;
            case LOADING_MODEL:
                hide(R.id.dev_options);
                show(R.id.model_loading_progress);
                show(R.id.scrim);
                hide(R.id.use_manga_model);
                hide(R.id.select_other_model);
                hide(R.id.use_monster_model);
                hide(R.id.start_recording);
                hide(R.id.take_picture);
                hide(R.id.include_audio);
                hide(R.id.picture_preview);
                hide(R.id.video_preview);
                break;
            default:
                break;
        }
        mState = state;
    }

    @MainThread
    @VisibleForTesting
    static void setVideoRecorder(@NonNull VideoRecorder recorder) {
        sVideoRecorder = recorder;
    }

    private void setupToolbar(@IdRes int selectedId) {
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        toolbar.setTitle(R.string.title_face_mimic);
        toolbar.setNavigationContentDescription(getString(R.string.accessibility_back_button));
        toolbar.setNavigationOnClickListener(v -> finish());
        if (selectedId != R.id.use_manga_model) {
            toolbar.setTitleTextColor(getColor(android.R.color.white));
            toolbar.setNavigationIcon(R.drawable.ic_arrow_back_24dp);
            ((RadioButton) findViewById(R.id.use_manga_model)).setChecked(false);
        } else {
            toolbar.setTitleTextColor(getColor(android.R.color.black));
            toolbar.setNavigationIcon(R.drawable.ic_arrow_back_24dp_black);
        }
    }

    private void setupViewPermissionsButton(@StringRes int textResId, String[] permissions, int requestCode) {
        TextView text = (TextView) mPermissionsContainer.findViewById(R.id.permissions_text);
        text.setText(textResId);
        Button button = (Button) mPermissionsContainer.findViewById(R.id.permissions_button);
        button.setOnClickListener(v -> {
            mPermissionsContainer.setVisibility(View.GONE);
            if (PermissionUtil.shouldShowRequestPermissionRationale(this, permissions)) {
                requestPermissions(permissions, requestCode);
            } else {
                PermissionUtil.startAppSettings(this);
            }
        });
    }

    @MainThread
    private void show(@IdRes int id) {
        View view = findViewById(id);
        if (view != null) {
            view.setVisibility(View.VISIBLE);
        }
    }

    @MainThread
    private void showTimer() {
        mRecTimer = new Runnable() {
            private final long mStart = System.currentTimeMillis();

            @Override
            @MainThread
            public void run() {
                long elapsedSeconds = (System.currentTimeMillis() - mStart) / 1000;
                long hours = elapsedSeconds / 3600;
                long minutes = (elapsedSeconds - hours * 60 * 60) / 60;
                long seconds = elapsedSeconds % 60;
                TextView timer = (TextView) findViewById(R.id.rec_timer);
                timer.setText(String.format(Locale.ENGLISH, "%02d:%02d:%02d", hours, minutes, seconds));
                mMainHandler.postDelayed(this, 500);
            }
        };
        mRecTimer.run();
        show(R.id.rec_timer);
    }

    @WorkerThread
    private static boolean storeBitmap(Bitmap bitmap, File dest) {
        try (FileOutputStream out = new FileOutputStream(dest)) {
            bitmap.compress(Bitmap.CompressFormat.JPEG, 75, out);
            return true;
        } catch (IOException e) {
            Log.e(TAG, "Failed to store bitmap", e);
            return false;
        }
    }

    private void updateFirstTimeInstructionVisibility() {
        SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
        boolean alreadySkipped = preferences.getBoolean(getString(R.string.pref_skip_face_mimic_info_text), false);
        if (!alreadySkipped && mState != UiState.LOADING_MODEL) {
            findViewById(R.id.first_time_info_text).setVisibility(View.VISIBLE);
            mFirstTimeInfoTimer = new CountDownTimer(FIRST_TIME_INFO_TEXT_TIMEOUT, FIRST_TIME_INFO_TEXT_TIMEOUT) {
                @Override
                public void onFinish() {
                    findViewById(R.id.first_time_info_text).setVisibility(View.GONE);
                    preferences.edit()
                            .putBoolean(getString(R.string.pref_skip_face_mimic_info_text), true)
                            .apply();
                }

                @Override
                public void onTick(long millisUntilFinished) {
                }
            }.start();
        }
    }

    @MainThread
    private void updateInstruction(UiState state) {
        if (state == UiState.LOADING_MODEL || mInstruction == null) {
            hide(R.id.focus_frame);
            hide(R.id.instruction);
            findViewById(R.id.focus_frame).clearAnimation();
            return;
        }
        TextView instruction = (TextView) findViewById(R.id.instruction);
        instruction.setText(mInstruction.intValue());
        show(R.id.focus_frame);
        show(R.id.instruction);
        View focusFrame = findViewById(R.id.focus_frame);
        if (ValueAnimator.areAnimatorsEnabled() && focusFrame.getAnimation() == null) {
            focusFrame.startAnimation(AnimationUtils.loadAnimation(this, R.anim.cam_core_frame_anim));
        }
    }

    @MainThread
    @VisibleForTesting
    GLThread getGlThread() {
        return mSurfaceView.getGLThread();
    }

    @MainThread
    @VisibleForTesting
    UiState getUiState() {
        return mState;
    }

    @Override
    @MainThread
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode != REQUEST_CODE_MODEL_PICKING) {
            return;
        }
        setState(UiState.IDLE);
        if (data != null) {
            Uri uri = data.getData();
            if (uri != null) {
                setState(UiState.LOADING_MODEL);
                Uri maskUri = getResourceUri(R.raw.rigged_expr);
                loadModel(uri, maskUri, success -> {
                    setState(UiState.IDLE);
                    if (success) {
                        mCustomModel = uri;
                        mCurrentModel = uri;
                    } else {
                        mCurrentModel = null;
                    }
                    checkButton(mPrevSelection);
                });
            }
        }
    }

    @Override
    @MainThread
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Intent intent = getIntent();
        Uri data = (intent != null) ? intent.getData() : null;
        if (data == null) {
            Log.e(TAG, "URI missing from intent");
            finish();
            return;
        }
        if (savedInstanceState == null) {
            Bundle extras = getIntent().getExtras();
            if (extras != null) {
                Messenger messenger = (Messenger) extras.get("com.sonymobile.scan3d.extra.EXTRA_MESSENGER");
                if (messenger != null) {
                    try {
                        Message message = Message.obtain();
                        message.what = 2;
                        messenger.send(message);
                    } catch (RemoteException e) {
                        DebugLog.d(TAG, "Failed to notify activity started on messenger.");
                    }
                }
            }
        }
        mCustomModel = getIntent().getData();
        getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
        mEngine = sEngineFactory.newMimickingEngine();
        setContentView(R.layout.activity_face_mimic);
        mParentView = findViewById(R.id.content);
        boolean isStartedFromEntryPoint = getIntent().getBooleanExtra(STARTED_FROM_ENTRY_POINT, false);
        if (!isStartedFromEntryPoint) {
            ((RadioGroup) findViewById(R.id.model_selection)).setVisibility(View.GONE);
        }
        mPrevSelection = isStartedFromEntryPoint ? R.id.use_manga_model : -1;
        setupToolbar(mPrevSelection);
        mPermissionsContainer = findViewById(R.id.permissions_container);
        mSurfaceView = (NativeGLTextureView) findViewById(R.id.model);
        int width = getResources().getDisplayMetrics().widthPixels * 5 / 4;
        ViewGroup.LayoutParams layoutParams = mSurfaceView.getLayoutParams();
        layoutParams.width = width;
        layoutParams.height = width;
        mSurfaceView.requestLayout();
        mSurfaceView.setOpaque(false);
        mSurfaceView.setRenderer(new GLThread.Renderer() {
            @Override
            @GlThread
            public boolean onDrawFrame(float deltaSeconds) {
                mEngine.render();
                mEngine.runOneIteration();
                if (mAfterRender != null) {
                    runOnUiThread(mAfterRender);
                    mAfterRender = null;
                }
                return true;
            }

            @Override
            @GlThread
            public void onSurfaceChanged(int surfaceWidth, int surfaceHeight) {
                mEngine.setDisplaySize(surfaceWidth, surfaceHeight);
            }

            @Override
            @GlThread
            public void onSurfaceCreated() {
                mHasSurface = true;
                mEngine.init(state -> runOnUiThread(() -> {
                    mInstruction = STATE_STRINGS.get(state);
                    updateInstruction(mState);
                }));
                runOnUiThread(() -> {
                    setState(UiState.LOADING_MODEL);
                    Uri maskUri;
                    if (isStartedFromEntryPoint) {
                        maskUri = ExpansionProvider.getExpressionUri(ExpansionProvider.Model.MANGA);
                    } else {
                        maskUri = getResourceUri(R.raw.rigged_expr);
                        mParentView.setBackground(null);
                    }
                    loadModel(mCustomModel, maskUri, success -> {
                        if (success) {
                            setState(UiState.IDLE);
                            updateFirstTimeInstructionVisibility();
                        } else {
                            finish();
                        }
                    });
                });
                openCamera();
            }

            @Override
            @GlThread
            public void onSurfaceDestroyed() {
                closeCamera();
                mEngine.done();
                mHasSurface = false;
                if (mThis.get() == null) {
                    mEngine.release();
                }
            }
        }, null);
        ((RadioGroup) findViewById(R.id.model_selection)).setOnCheckedChangeListener((group, checkedId) -> {
            if (mState != UiState.IDLE) {
                return;
            }
            if (checkedId == -1 || checkedId == 0) {
                return;
            }
            Pair<Uri, Uri> pair;
            if (checkedId == R.id.use_manga_model) {
                pair = Pair.create(ExpansionProvider.getModelUri(ExpansionProvider.Model.MANGA),
                        ExpansionProvider.getExpressionUri(ExpansionProvider.Model.MANGA));
            } else if (checkedId == R.id.use_monster_model) {
                pair = Pair.create(ExpansionProvider.getModelUri(ExpansionProvider.Model.MONSTER),
                        ExpansionProvider.getExpressionUri(ExpansionProvider.Model.MONSTER));
            } else {
                pair = null;
            }
            if (pair != null) {
                ((RadioButton) findViewById(checkedId)).setChecked(true);
            }
            if (pair != null && !pair.first.equals(mCurrentModel)) {
                setState(UiState.LOADING_MODEL);
                Uri model = pair.first;
                Uri mask = pair.second;
                loadModel(model, mask, success -> {
                    setState(UiState.IDLE);
                    if (success) {
                        mCurrentModel = model;
                        mPrevSelection = checkedId;
                        if (checkedId == R.id.use_manga_model) {
                            mParentView.setBackgroundColor(getColor(android.R.color.black));
                        } else {
                            mParentView.setBackground(null);
                        }
                        setupToolbar(checkedId);
                    } else {
                        mCurrentModel = null;
                        checkButton(mPrevSelection);
                    }
                });
            }
        });
        if ("scan3d".equals("labs")) {
            SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(this);
            boolean devEnabled = preferences.getBoolean(getString(R.string.pref_key_dev_enabled), false);
            if (devEnabled) {
                addDevOptions();
            }
        }
        MediaMetadataRetriever retriever = new MediaMetadataRetriever();
        retriever.setDataSource(this, getResourceUri(R.raw.start_rec));
        String duration = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION);
        retriever.release();
        mRecordingStartSoundDuration = Integer.parseInt(duration);
        setState(UiState.LOADING_MODEL);
    }

    @Override
    @MainThread
    protected void onDestroy() {
        if (mSurfaceView != null) {
            runOnGlThread(() -> {
                if (!mHasSurface) {
                    mEngine.release();
                }
            });
        }
        mThis.set(null);
        super.onDestroy();
    }

    @Override
    @MainThread
    protected void onPause() {
        stopRecording(null);
        boolean recordAudio = ((CheckBox) findViewById(R.id.include_audio)).isChecked();
        setAudioPreferred(recordAudio);
        mSurfaceView.onPause();
        runOnGlThread(this::closeCamera);
        if (mFirstTimeInfoTimer != null) {
            mFirstTimeInfoTimer.cancel();
            mFirstTimeInfoTimer = null;
        }
        super.onPause();
    }

    @Override
    @MainThread
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions,
            @NonNull int[] grantResults) {
        List<String> denied = new ArrayList<>();
        boolean allGranted = false;
        boolean audioGranted = false;
        int i = 0;
        while (i < permissions.length) {
            if (grantResults[i] != 0) {
                denied.add(permissions[i]);
                break;
            }
            if (permissions[i].equals("android.permission.RECORD_AUDIO")) {
                audioGranted = true;
            }
            i++;
        }
        if (i >= permissions.length) {
            allGranted = true;
        }
        mPermissionsHandler.removeCallbacksAndMessages(null);
        if (requestCode == PermissionUtil.Permissions.AUDIO.getRequestCode()) {
            if (allGranted) {
                mPermissionsHandler.post(PermissionUtil.removePermissionsContainer(mPermissionsContainer));
            } else {
                PermissionUtil.showPermissionsSnackbar(mPermissionsHandler, mPermissionsContainer);
            }
            ((CheckBox) findViewById(R.id.include_audio)).setChecked(allGranted);
        } else if (requestCode == PermissionUtil.Permissions.VIDEO_RECORDING.getRequestCode()) {
            if (!allGranted) {
                String[] optionalPermissions = PermissionUtil.Permissions.VIDEO_RECORDING.getOptionalPermissions();
                if (!deniedOnlyOptionalPermissions(denied, optionalPermissions)) {
                    PermissionUtil.showPermissionsSnackbar(mPermissionsHandler, mPermissionsContainer);
                    return;
                }
            }
            mPermissionsHandler.post(PermissionUtil.removePermissionsContainer(mPermissionsContainer));
            if (audioGranted) {
                ((CheckBox) findViewById(R.id.include_audio)).setChecked(true);
            }
        } else if (requestCode == PermissionUtil.Permissions.STORAGE.getRequestCode()) {
            if (allGranted) {
                mPermissionsHandler.post(PermissionUtil.removePermissionsContainer(mPermissionsContainer));
            } else {
                PermissionUtil.showPermissionsSnackbar(mPermissionsHandler, mPermissionsContainer);
            }
        }
    }

    @Override
    @MainThread
    protected void onResume() {
        super.onResume();
        CheckBox checkBox = (CheckBox) findViewById(R.id.include_audio);
        boolean checked = isAudioPreferred()
                && PermissionUtil.hasPermissions(this, PermissionUtil.Permissions.AUDIO.getPermissions());
        checkBox.setChecked(checked);
        mSurfaceView.onResume();
        updateFirstTimeInstructionVisibility();
        runOnGlThread(this::openCamera);
        if (mLastVideo != null && !contentExists(mLastVideo)) {
            hide(R.id.video_preview);
            mLastVideo = null;
        }
        if (mLastPicture != null && !contentExists(mLastPicture)) {
            hide(R.id.picture_preview);
            mLastPicture = null;
        }
    }

    @Override
    @MainThread
    protected void onStart() {
        mSoundPool = new SoundPool.Builder()
                .setMaxStreams(1)
                .setAudioAttributes(new AudioAttributes.Builder().setLegacyStreamType(1).build())
                .build();
        mSounds = new SparseIntArray() {{
            put(R.raw.shutter, mSoundPool.load(FaceMimicActivity.this, R.raw.shutter, 1));
            put(R.raw.start_rec, mSoundPool.load(FaceMimicActivity.this, R.raw.start_rec, 1));
            put(R.raw.stop_rec, mSoundPool.load(FaceMimicActivity.this, R.raw.stop_rec, 1));
        }};
        super.onStart();
    }

    @Override
    @MainThread
    protected void onStop() {
        mSoundPool.release();
        mSoundPool = null;
        mSounds = null;
        super.onStop();
    }

    @MainThread
    public void openPicture(View view) {
        if (mState != UiState.IDLE) {
            return;
        }
        if (mLastPicture != null) {
            startActivity(getAlbumViewIntent(mLastPicture, MIME_TYPE_JPEG));
        }
    }

    @MainThread
    public void openVideo(View view) {
        if (mState != UiState.IDLE) {
            return;
        }
        if (mLastVideo != null) {
            startActivity(getAlbumViewIntent(mLastVideo, MIME_TYPE_MP4));
        }
    }

    @MainThread
    public void selectOther(View view) {
        if (mState != UiState.IDLE) {
            return;
        }
        Intent intent = new Intent("android.intent.action.PICK");
        intent.setPackage(getPackageName());
        intent.setType("application/vnd.sony.scan3d");
        intent.putExtra("com.sonymobile.scan3d.intent.extra.SCAN_TYPE", "face,head");
        intent.putExtra("com.sonymobile.scan3d.intent.extra.MIME_TYPES", new String[]{"model/gltf-binary"});
        intent.putExtra("com.sonymobile.scan3d.intent.extra.EXPLANATORY_TEXT",
                getString(R.string.explanatory_text_face_mimic_picker));
        startActivityForResult(intent, REQUEST_CODE_MODEL_PICKING);
        setState(UiState.PICKING_MODEL);
    }

    @MainThread
    public void startRecording(View view) {
        if (mState != UiState.IDLE) {
            return;
        }
        if (!hasShownAudioPermissionsRequest()) {
            if (requestMissingPermissions(PermissionUtil.Permissions.VIDEO_RECORDING,
                    R.string.storage_permissons_needed)) {
                setAudioPermissionsRequestShown();
                return;
            }
        }
        if (requestMissingPermissions(PermissionUtil.Permissions.STORAGE, R.string.storage_permissons_needed)) {
            return;
        }
        setState(UiState.PREPARING_TO_RECORD);
        sSoundPlayer.play(this, R.raw.start_rec);
        mMainHandler.postDelayed(() -> {
            setState(UiState.RECORDING);
            findViewById(R.id.take_picture);
            File tempFile = new File(getFilesDir(), TEMP_VIDEO_FILE_NAME);
            File finalFile = createDateStampedFile(Environment.DIRECTORY_MOVIES, EXTENSION_MP4);
            boolean recordAudio = ((CheckBox) findViewById(R.id.include_audio)).isChecked();
            sVideoRecorder.start(this, mSurfaceView, tempFile, finalFile,
                    (activity, uri) -> {
                        sSoundPlayer.play(activity, R.raw.stop_rec);
                        activity.setLastVideo(uri);
                        activity.setState(UiState.IDLE);
                    },
                    getDisplayRefreshNsec(this), 0, 0, mSurfaceView.getWidth(), mSurfaceView.getHeight(),
                    recordAudio);
        }, mRecordingStartSoundDuration + 20);
    }

    @MainThread
    public void stopRecording(View view) {
        if (mState != UiState.RECORDING) {
            return;
        }
        ImageView imageView = (ImageView) findViewById(R.id.video_preview);
        imageView.setImageBitmap(mSurfaceView.getBitmap());
        sVideoRecorder.stop(mSurfaceView);
    }

    @MainThread
    public void takePicture(View view) {
        if (mState != UiState.IDLE) {
            return;
        }
        if (requestMissingPermissions(PermissionUtil.Permissions.STORAGE, R.string.storage_permissons_needed)) {
            return;
        }
        setState(UiState.TAKING_PICTURE);
        show(R.id.flash);
        mMainHandler.postDelayed(() -> hide(R.id.flash), 100);
        sSoundPlayer.play(this, R.raw.shutter);
        Bitmap bitmap = mSurfaceView.getBitmap();
        ((ImageView) findViewById(R.id.picture_preview)).setImageBitmap(bitmap);
        File dest = createDateStampedFile(Environment.DIRECTORY_PICTURES, EXTENSION_JPEG);
        sPictureSaver.save(this, bitmap, dest, (activity, uri) -> {
            activity.setLastPicture(uri);
            activity.setState(UiState.IDLE);
        });
    }

    @MainThread
    public void toggleAudio(View view) {
        CheckBox checkBox = (CheckBox) view;
        if (checkBox.isChecked()) {
            String[] permissions = PermissionUtil.Permissions.AUDIO.getPermissions();
            int requestCode = PermissionUtil.Permissions.AUDIO.getRequestCode();
            String[] missingPermissions = PermissionUtil.getMissingPermissions(this, permissions);
            if (missingPermissions.length > 0) {
                setupViewPermissionsButton(R.string.audio_permissons_needed, permissions, requestCode);
                requestPermissions(missingPermissions, requestCode);
                setAudioPermissionsRequestShown();
            }
        }
    }

    @VisibleForTesting
    enum UiState {
        IDLE,
        PREPARING_TO_RECORD,
        RECORDING,
        TAKING_PICTURE,
        PICKING_MODEL,
        LOADING_MODEL
    }

    @VisibleForTesting
    interface CameraImageProviderFactory {
        @GlThread
        CameraImageProvider newCameraImageProvider(Context context,
                CameraImageProvider.OnCameraStatusListener listener, SphinxFocusType focusType,
                boolean allowContinuousFocus);
    }

    @VisibleForTesting
    interface ContentOpener {
        @MainThread
        InputStream openInputStream(Context context, Uri uri) throws IOException;
    }

    @VisibleForTesting
    interface MimickingEngineFactory {
        @MainThread
        MimickingEngine newMimickingEngine();
    }

    @VisibleForTesting
    interface PictureSaver {
        @MainThread
        void save(FaceMimicActivity activity, Bitmap bitmap, File dest, SaveListener listener);

        public interface SaveListener {
            @MainThread
            void onPictureSaved(FaceMimicActivity activity, Uri uri);
        }
    }

    private static class SavePictureTask extends NonLeakyAsyncTask<FaceMimicActivity, Void, Void, Uri> {
        private final File mDest;
        private final PictureSaver.SaveListener mListener;
        private final Bitmap mSnapshot;

        SavePictureTask(AtomicReference<FaceMimicActivity> reference, Bitmap snapshot, File dest,
                PictureSaver.SaveListener listener) {
            super(reference);
            mSnapshot = snapshot;
            mListener = listener;
            mDest = dest;
        }

        @Override
        @WorkerThread
        protected Uri doInBackground(FaceMimicActivity activity, Void... params) {
            if (!storeBitmap(mSnapshot, mDest)) {
                return null;
            }
            ContentValues values = new ContentValues(3);
            values.put("title", mDest.getName());
            values.put("mime_type", MIME_TYPE_JPEG);
            values.put("_data", mDest.getAbsolutePath());
            return activity.getContentResolver().insert(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, values);
        }

        @Override
        @MainThread
        protected void onPostExecute(FaceMimicActivity activity, Uri uri) {
            mListener.onPictureSaved(activity, uri);
        }
    }

    private static class SaveVideoTask extends NonLeakyAsyncTask<FaceMimicActivity, Void, Void, Uri> {
        private final File mDest;
        private final VideoRecorder.RecordingListener mListener;
        private final File mSource;

        public SaveVideoTask(AtomicReference<FaceMimicActivity> reference, File source, File dest,
                VideoRecorder.RecordingListener listener) {
            super(reference);
            mSource = source;
            mDest = dest;
            mListener = listener;
        }

        @Override
        @WorkerThread
        protected Uri doInBackground(FaceMimicActivity activity, Void... params) {
            if (!FsUtils.moveFile(mSource, mDest)) {
                return null;
            }
            return MediaStoreUtil.insertVideo(activity, mDest);
        }

        @Override
        @MainThread
        protected void onPostExecute(FaceMimicActivity activity, Uri uri) {
            mListener.onRecordingStored(activity, uri);
        }
    }

    @VisibleForTesting
    interface SoundPlayer {
        @MainThread
        void play(FaceMimicActivity activity, @RawRes int soundId);
    }

    @VisibleForTesting
    interface VideoRecorder {
        @MainThread
        void start(FaceMimicActivity activity, NativeGLTextureView surfaceView, File encoderFile, File outputFile,
                RecordingListener listener, long displayRefreshNsec, int unusedX, int unusedY, int width,
                int height, boolean recordAudio);

        @MainThread
        void stop(NativeGLTextureView surfaceView);

        public interface RecordingListener {
            @MainThread
            void onRecordingStored(FaceMimicActivity activity, Uri uri);
        }
    }
}
