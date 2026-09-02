package com.sonymobile.scan3d;

import android.content.Context;
import android.media.AudioManager;
import android.net.Uri;
import android.os.Handler;
import android.os.Message;
import android.os.Process;
import android.util.Size;
import android.view.Surface;
import com.sonymobile.scan3d.analytics.CalibrationEvent;
import com.sonymobile.scan3d.analytics.EngineTimeEvent;
import com.sonymobile.scan3d.analytics.ScanEvent;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.logging.NativeLog;
import com.sonymobile.scan3d.storageservice.Config;
import com.sonymobile.scan3d.storageservice.authentication.Vault;
import com.sonymobile.scan3d.storageservice.provider.Contract;
import com.sonymobile.scan3d.storageservice.provider.Factory;
import com.sonymobile.scan3d.storageservice.provider.ITransientFileSet;
import java.io.File;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONException;

/* JADX INFO: loaded from: classes.dex */
class SphinxEngine extends GLEngine implements CameraImageProvider.OnCameraStatusListener, Runnable {
    private static final boolean DEBUG = true;
    private static final int MAX_EVENTS = 5;
    static final int MSG_BREAK_ESTABLISH = 8;
    static final int MSG_CAMERA_OPENED = 3;
    static final int MSG_CAMERA_TEMPERATURE_SHUTDOWN = 7;
    static final int MSG_ENVIRONMENT_ERRORS = 1;
    static final int MSG_FINISHED = 0;
    static final int MSG_HINT = 2;
    static final int MSG_RESTARTING = 6;
    static final int MSG_STARTED = 4;
    static final int MSG_STOPPED = 5;
    private static final String TAG = "com.sonymobile.scan3d.SphinxEngine";
    private static final String THREAD_NAME = "SphinxThread";
    private Context mContext;
    private SphinxState mCurrentState;
    private EnvConditions mEnvConditions;
    private Handler mHandler;
    private CameraImageProvider mImageProvider;
    private int mPolicy;
    private SphinxSettings mSettings;
    private Size mSize;
    private Sphinx mSphinx;
    private long mScaleTime = 0;
    private long mBlobTime = 0;
    private long mSculptTime = 0;
    private long mSprayPaintingTime = 0;
    private AtomicBoolean mStopped = new AtomicBoolean(false);
    private BlockingQueue<Event> mEventQueue = new ArrayBlockingQueue(5);

    SphinxEngine(Context context, int i, Handler handler) {
        this.mContext = context;
        this.mPolicy = i;
        this.mHandler = handler;
        this.mSettings = new SphinxSettings(this.mContext);
    }

    void stop() {
        NativeLog.v(TAG, "stop()");
        this.mStopped.set(true);
    }

    boolean isStopped() {
        return this.mStopped.get();
    }

    @Override // java.lang.Runnable
    public final void run() {
        NativeLog.v(TAG, "run()");
        Process.setThreadPriority(-4);
        Thread.currentThread().setName(THREAD_NAME);
        while (isRunning()) {
            handleEvents();
            if (iterate()) {
                SphinxState state = this.mSphinx.getState();
                while (true) {
                    SphinxHint sphinxHintPopHint = this.mSphinx.popHint();
                    if (sphinxHintPopHint == null) {
                        break;
                    }
                    handleAnalyticsStats(sphinxHintPopHint);
                    notify(2, sphinxHintPopHint, null, null);
                }
                SphinxState sphinxState = this.mCurrentState;
                if (sphinxState != state) {
                    onStateChanged(sphinxState, state);
                    this.mCurrentState = state;
                }
            }
        }
        destroy();
        setSurface(null);
        notify(5, null, null, null);
        NativeLog.v(TAG, "/run()");
    }

    boolean postEvent(Event event) {
        BlockingQueue<Event> blockingQueue;
        return isRunning() && (blockingQueue = this.mEventQueue) != null && blockingQueue.offer(event);
    }

    @Override // com.sonymobile.scan3d.GLEngine
    boolean setSurface(Surface surface) {
        NativeLog.v(TAG, "setSurface(" + surface + ")");
        return super.setSurface(surface);
    }

    void destroy() {
        NativeLog.v(TAG, "destroy()");
        BlockingQueue<Event> blockingQueue = this.mEventQueue;
        if (blockingQueue != null) {
            blockingQueue.clear();
        }
        CameraImageProvider cameraImageProvider = this.mImageProvider;
        if (cameraImageProvider != null) {
            cameraImageProvider.closeCamera();
            this.mImageProvider = null;
        }
        Sphinx sphinx = this.mSphinx;
        if (sphinx != null) {
            sphinx.done();
            this.mSphinx.release();
            this.mSphinx = null;
        }
        NativeLog.v(TAG, "/destroy()");
    }

    private boolean iterate() {
        Sphinx sphinx = this.mSphinx;
        if (sphinx == null || !render(sphinx) || this.mSphinx.isDone() || !this.mImageProvider.isStreaming()) {
            return false;
        }
        this.mEnvConditions.sendData(this.mSphinx);
        this.mSphinx.runOneIteration();
        return true;
    }

    private boolean isRunning() {
        return (this.mStopped.get() || SphinxState.kStateDone == this.mCurrentState) ? false : true;
    }

    private void handleEvents() {
        Event eventPoll = this.mEventQueue.poll();
        while (eventPoll != null && !this.mStopped.get()) {
            NativeLog.v(TAG, "handleEvents(): type=" + eventPoll.getType());
            switch (eventPoll.getType()) {
                case 0:
                    this.mImageProvider.setFocusPosition(((Integer) eventPoll.getArg1()).intValue());
                    break;
                case 1:
                    if (setSurface((Surface) eventPoll.getArg1())) {
                        this.mSize = (Size) eventPoll.getArg2();
                        init(this.mSize.getWidth(), this.mSize.getHeight());
                    }
                    break;
                case 3:
                    this.mSphinx.setNextState(((Boolean) eventPoll.getArg1()).booleanValue());
                    break;
                case 4:
                    this.mSphinx.setBlobScaleZoom(((Float) eventPoll.getArg1()).floatValue());
                    break;
                case 6:
                    this.mSphinx.setNextDebugMode(-1);
                    break;
                case 7:
                    destroy();
                    setSurface(null);
                    break;
                case 9:
                    restart();
                    break;
                case 10:
                    this.mSphinx.setCameraTemperature((SphinxCameraTemperatureState) eventPoll.getArg1());
                    break;
                case 11:
                    notify(7, Boolean.valueOf(this.mSphinx.setCameraTemperature((SphinxCameraTemperatureState) eventPoll.getArg1())), null, null);
                    break;
                case 12:
                    this.mSphinx.clearEnvironmentErrors();
                    break;
                case 13:
                    this.mSphinx.setLocaleIsRTL(((Boolean) eventPoll.getArg1()).booleanValue());
                    break;
            }
            NativeLog.v(TAG, "/handleEvents(): type=" + eventPoll.getType());
            eventPoll = this.mEventQueue.poll();
        }
    }

    private void restart() {
        NativeLog.v(TAG, "restart()");
        notify(6, null, null, null);
        destroy();
        init(this.mSize.getWidth(), this.mSize.getHeight());
        NativeLog.v(TAG, "/restart()");
    }

    private void init(int i, int i2) {
        NativeLog.v(TAG, "init(" + i + "," + i2 + ") mSphinx=" + this.mSphinx);
        if (this.mSphinx != null) {
            destroy();
        }
        this.mEnvConditions = new EnvConditions(this.mContext);
        this.mImageProvider = new CameraImageProvider(this.mContext, this, getFocusType(), useFrontCamera());
        this.mSphinx = new Sphinx(PlatformTypeDetector.detectPlatform(), this.mPolicy);
        this.mSphinx.setLocaleIsRTL(this.mContext.getResources().getConfiguration().getLayoutDirection() == 1);
        this.mSphinx.setPassword(Vault.getPassword(this.mContext));
        this.mEnvConditions.sendData(this.mSphinx);
        this.mSphinx.setDisplaySize(i, i2);
        this.mImageProvider.openCamera();
        this.mSphinx.setImageProvider(this.mImageProvider.getNativeHandle());
        this.mSphinx.init();
        NativeLog.v(TAG, "/init()");
    }

    private void onStateChanged(SphinxState sphinxState, SphinxState sphinxState2) {
        NativeLog.v(TAG, "onStateChanged(): old state=" + sphinxState + ", new state=" + sphinxState2);
        switch (sphinxState2) {
            case kStateInitTrack:
                ScanEvent.SCAN_STARTED.send(this.mContext, this.mPolicy);
                try {
                    CalibrationEvent.VALUES.send(this.mContext, this.mPolicy);
                } catch (JSONException e) {
                    DebugLog.e(TAG, e.getMessage(), e);
                }
                break;
            case kStateUninitialized:
                notify(4, null, null, null);
                if (this.mSettings.useLamp()) {
                    this.mImageProvider.setLamp(true);
                }
                break;
            case kStateEstablishScaleDone:
                EnvironmentError[] errors = this.mSphinx.getErrors();
                if (errors.length > 0) {
                    notify(1, errors, null, null);
                }
                break;
            case kStateDone:
                sendAnalyticsData();
                notify(0, saveFileRecord(), null, null);
                break;
        }
        if (isFinishedScanning(sphinxState2) && !isFinishedScanning(sphinxState) && this.mSettings.useLamp()) {
            this.mImageProvider.setLamp(false);
        }
        handleAnalyticsStats(sphinxState, sphinxState2);
    }

    private void notify(int i, Object obj, Integer num, Integer num2) {
        if (this.mStopped.get()) {
            if (i == 5) {
                Message.obtain(this.mHandler, 5).sendToTarget();
            }
        } else {
            Message messageObtain = Message.obtain(this.mHandler, i, obj);
            if (num != null) {
                messageObtain.arg1 = num.intValue();
            }
            if (num2 != null) {
                messageObtain.arg2 = num2.intValue();
            }
            messageObtain.sendToTarget();
        }
    }

    private Uri saveFileRecord() {
        String string;
        int i;
        switch (this.mPolicy) {
            case 10:
            case 11:
            case 13:
            case 14:
                string = this.mContext.getString(R.string.tutorial_practice_scan_name);
                i = 0;
                break;
            case 12:
            default:
                string = this.mContext.getString(R.string.file_set_no_name);
                i = 9;
                break;
        }
        String lastLogFile = this.mSphinx.getLastLogFile();
        String lastResultFile = this.mSphinx.getLastResultFile();
        int scanType = this.mSphinx.getScanType();
        File file = new File(lastResultFile);
        File file2 = new File(lastLogFile);
        if (!Config.isPostProcessEnabled(this.mContext)) {
            if (file2.delete()) {
                file2 = null;
            } else {
                NativeLog.e(TAG, "Failed to delete logfile " + file2.getAbsolutePath());
            }
        }
        ITransientFileSet iTransientFileSetCreate = Factory.create(this.mContext, string, file, file2, i, scanType);
        if (iTransientFileSetCreate != null) {
            return this.mContext.getContentResolver().insert(Contract.FileRecord.CONTENT_URI, iTransientFileSetCreate.toContentValues());
        }
        NativeLog.v(TAG, "Deleting scan file after failing to create record: " + file.delete());
        if (file2 == null || !file2.exists()) {
            return null;
        }
        NativeLog.v(TAG, "Deleting log file after failing to create record: " + file2.delete());
        return null;
    }

    private static boolean isFinishedScanning(SphinxState sphinxState) {
        switch (sphinxState) {
            case kStateDone:
            case kStateStopping:
            case kStateSprayPainting:
            case kStateSaving:
            case kStateDestroyed:
                return true;
            default:
                return false;
        }
    }

    @Override // com.sonymobile.scan3d.CameraImageProvider.OnCameraStatusListener
    public void onOpen(CameraImageProvider cameraImageProvider) {
        NativeLog.v(TAG, "Sphinx version: 3.0.A.0.36");
        notify(3, Integer.valueOf(getFocusType().ordinal()), null, null);
        this.mImageProvider.setEdgeEnhancement(this.mSettings.useEdgeEnhancement());
        this.mImageProvider.setNoiseReduction(this.mSettings.useNoiseReduction());
        this.mImageProvider.setAWBLock(this.mSettings.useAutoWhiteBalanceLock());
    }

    @Override // com.sonymobile.scan3d.CameraImageProvider.OnCameraStatusListener
    public void onClose(CameraImageProvider cameraImageProvider) {
        NativeLog.v(TAG, "CameraImageProvider onClose");
    }

    private void handleAnalyticsStats(SphinxState sphinxState, SphinxState sphinxState2) {
        switch (sphinxState2) {
            case kStateEstablishScaleDone:
                if (this.mScaleTime > 0) {
                    this.mScaleTime = System.currentTimeMillis() - this.mScaleTime;
                    this.mBlobTime = System.currentTimeMillis();
                }
                ScanEvent.CALIBRATION_ENDED.send(this.mContext, this.mPolicy);
                break;
            case kStateStopping:
                if (this.mSculptTime > 0) {
                    this.mSculptTime = System.currentTimeMillis() - this.mSculptTime;
                }
                ScanEvent.STOP_SCULPTING.send(this.mContext, this.mPolicy);
                break;
            case kStateSprayPainting:
                if (this.mSprayPaintingTime == 0) {
                    this.mSprayPaintingTime = System.currentTimeMillis();
                }
                ScanEvent.SPRAY_PAINTING_STARTED.send(this.mContext, this.mPolicy);
                break;
            case kStateSaving:
                if (this.mSprayPaintingTime > 0) {
                    this.mSprayPaintingTime = System.currentTimeMillis() - this.mSprayPaintingTime;
                }
                ScanEvent.SPRAY_PAINTING_ENDED.send(this.mContext, this.mPolicy);
                break;
            case kStateEstablishScale:
                if (this.mScaleTime == 0) {
                    this.mScaleTime = System.currentTimeMillis();
                }
                if (sphinxState == SphinxState.kStateEstablishScaleLostTrack) {
                    ScanEvent.REGAINED_TRACK_DURING_CALIBRATION.send(this.mContext, this.mPolicy);
                } else {
                    ScanEvent.CALIBRATION_STARTED.send(this.mContext, this.mPolicy);
                }
                break;
            case kStateEstablishScaleLostTrack:
                ScanEvent.LOST_TRACK_DURING_CALIBRATION.send(this.mContext, this.mPolicy);
                break;
            case kStateSculpting:
                if (this.mSculptTime == 0) {
                    this.mSculptTime = System.currentTimeMillis();
                    this.mBlobTime = System.currentTimeMillis() - this.mBlobTime;
                }
                if (sphinxState == SphinxState.kStateSculptingLostTrack) {
                    ScanEvent.REGAINED_TRACK_DURING_SCULPTING.send(this.mContext, this.mPolicy);
                } else {
                    ScanEvent.START_SCULPTING.send(this.mContext, this.mPolicy);
                }
                break;
            case kStateSculptingLostTrack:
                ScanEvent.SCULPTING_LOST_TRACK.send(this.mContext, this.mPolicy);
                break;
        }
    }

    private void handleAnalyticsStats(SphinxHint sphinxHint) {
        if (sphinxHint.code != 1 || sphinxHint.arg2 == 0) {
            return;
        }
        int i = sphinxHint.arg1;
        if (i == 4) {
            ScanEvent.WARNING_TOO_FAST.send(this.mContext, this.mPolicy);
        }
        if (i == 17) {
            ScanEvent.WARNING_TOO_CLOSE.send(this.mContext, this.mPolicy);
            return;
        }
        switch (i) {
            case 0:
                ScanEvent.WARNING_TOO_HOT.send(this.mContext, this.mPolicy);
                break;
            case 1:
                ScanEvent.WARNING_LOW_BATTERY.send(this.mContext, this.mPolicy);
                break;
            case 2:
                ScanEvent.WARNING_LOW_STORAGE.send(this.mContext, this.mPolicy);
                break;
        }
    }

    private void sendAnalyticsData() {
        EngineTimeEvent.ENGINE.send(this.mContext, this.mScaleTime, this.mSculptTime, this.mBlobTime, this.mSprayPaintingTime, this.mPolicy);
        switch (getFocusType()) {
            case kFocusFixed:
                ScanEvent.SETTING_FOCUS_TYPE_FIXED.send(this.mContext, this.mPolicy);
                break;
            case kFocusAuto:
                ScanEvent.SETTING_FOCUS_TYPE_AUTO.send(this.mContext, this.mPolicy);
                break;
            case kFocusManual:
                ScanEvent.SETTING_FOCUS_TYPE_MANUAL.send(this.mContext, this.mPolicy);
                break;
            case kFocusTof:
                ScanEvent.SETTING_FOCUS_TYPE_TOF.send(this.mContext, this.mPolicy);
                break;
        }
        if (((AudioManager) this.mContext.getSystemService("audio")).getStreamVolume(3) <= 0 || !this.mSettings.useSound()) {
            return;
        }
        ScanEvent.SOUND_HEARD.send(this.mContext, this.mPolicy);
    }

    private SphinxFocusType getFocusType() {
        if (useFrontCamera()) {
            return SphinxFocusType.kFocusFixed;
        }
        if (this.mSettings.getFocusType().equals(this.mContext.getString(R.string.focus_type_auto))) {
            return SphinxFocusType.kFocusAuto;
        }
        if (this.mSettings.getFocusType().equals(this.mContext.getString(R.string.focus_type_manual))) {
            return SphinxFocusType.kFocusManual;
        }
        if (this.mSettings.getFocusType().equals(this.mContext.getString(R.string.focus_type_tof))) {
            return SphinxFocusType.kFocusTof;
        }
        return SphinxFocusType.kFocusFixed;
    }

    private boolean useFrontCamera() {
        int i = this.mPolicy;
        return i == 4 || i == 14;
    }
}
