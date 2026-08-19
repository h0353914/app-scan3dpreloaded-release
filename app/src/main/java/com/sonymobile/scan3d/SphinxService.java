package com.sonymobile.scan3d;

import android.app.Service;
import android.content.Intent;
import android.net.Uri;
import android.os.Binder;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.util.Size;
import android.view.Surface;
import androidx.annotation.Nullable;
import com.sonymobile.scan3d.logging.NativeLog;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/* JADX INFO: loaded from: classes.dex */
public class SphinxService extends Service implements ISphinxManager, Handler.Callback {
    private static final String TAG = "com.sonymobile.scan3d.SphinxService";
    private Binder mBinder = new LocalBinder();
    private SphinxEngine mEngine;
    private ExecutorService mExecutorService;
    private Handler mHandler;
    private ISphinxManager.ISphinxListener mListener;
    private int mSubmitCount;

    public class LocalBinder extends Binder {
        public LocalBinder() {
        }

        ISphinxManager getSphinxManager() {
            return SphinxService.this;
        }
    }

    @Override // android.app.Service
    public void onCreate() {
        super.onCreate();
        this.mExecutorService = Executors.newSingleThreadExecutor();
        this.mHandler = new Handler(this);
        NativeLog.v(TAG, "onCreate(): ");
    }

    @Override // android.app.Service
    public void onDestroy() {
        super.onDestroy();
        SphinxEngine sphinxEngine = this.mEngine;
        if (sphinxEngine != null) {
            sphinxEngine.stop();
            this.mEngine = null;
        }
        this.mExecutorService.shutdown();
        this.mListener = null;
        NativeLog.v(TAG, "onDestroy(): ");
    }

    @Override // android.app.Service
    @Nullable
    public IBinder onBind(Intent intent) {
        keepAlive();
        return this.mBinder;
    }

    @Override // android.app.Service
    public boolean onUnbind(Intent intent) {
        SphinxEngine sphinxEngine = this.mEngine;
        if (sphinxEngine != null) {
            sphinxEngine.stop();
        } else {
            stopSelf();
        }
        this.mListener = null;
        return true;
    }

    @Override // com.sonymobile.scan3d.ISphinxManager
    public void setCameraTemperature(SphinxCameraTemperatureState sphinxCameraTemperatureState) {
        if (sphinxCameraTemperatureState == SphinxCameraTemperatureState.kWarm) {
            sendEvent(10, sphinxCameraTemperatureState);
        } else if (sphinxCameraTemperatureState == SphinxCameraTemperatureState.kHot) {
            sendEvent(11, sphinxCameraTemperatureState);
        }
    }

    @Override // com.sonymobile.scan3d.ISphinxManager
    public void start(int i) {
        SphinxEngine sphinxEngine = this.mEngine;
        if (sphinxEngine != null) {
            sphinxEngine.stop();
        }
        this.mEngine = new SphinxEngine(this, i, this.mHandler);
        this.mExecutorService.submit(this.mEngine);
        this.mSubmitCount++;
    }

    @Override // com.sonymobile.scan3d.ISphinxManager
    public void restart() {
        sendEvent(9);
    }

    @Override // com.sonymobile.scan3d.ISphinxManager
    public void onSurfaceUpdate(boolean z, Surface surface, Size size) {
        if (z) {
            sendEvent(1, surface, size);
        } else {
            sendEvent(7);
        }
    }

    @Override // com.sonymobile.scan3d.ISphinxManager
    public void registerListener(ISphinxManager.ISphinxListener iSphinxListener) {
        this.mListener = iSphinxListener;
    }

    @Override // com.sonymobile.scan3d.ISphinxManager
    public void setManualFocusPosition(int i) {
        sendEvent(0, Integer.valueOf(i));
    }

    @Override // com.sonymobile.scan3d.ISphinxManager
    public void setLocaleIsRTL(boolean z) {
        sendEvent(13, Boolean.valueOf(z));
    }

    @Override // com.sonymobile.scan3d.ISphinxManager
    public void setNextState(boolean z) {
        sendEvent(3, Boolean.valueOf(z));
    }

    @Override // com.sonymobile.scan3d.ISphinxManager
    public void clearEnvironmentErrors() {
        sendEvent(12);
    }

    @Override // com.sonymobile.scan3d.ISphinxManager
    public void setBlobScale(float f) {
        sendEvent(4, Float.valueOf(f));
    }

    @Override // com.sonymobile.scan3d.ISphinxManager
    public void setNextDebugMode() {
        sendEvent(6);
    }

    @Override // android.os.Handler.Callback
    public final boolean handleMessage(Message message) {
        switch (message.what) {
            case 0:
                ISphinxManager.ISphinxListener iSphinxListener = this.mListener;
                if (iSphinxListener != null) {
                    iSphinxListener.onFinished((Uri) message.obj);
                }
                return true;
            case 1:
                ISphinxManager.ISphinxListener iSphinxListener2 = this.mListener;
                if (iSphinxListener2 != null) {
                    iSphinxListener2.onErrorsReceived((EnvironmentError[]) message.obj);
                }
                return true;
            case 2:
                ISphinxManager.ISphinxListener iSphinxListener3 = this.mListener;
                if (iSphinxListener3 != null) {
                    iSphinxListener3.onHintReceived((SphinxHint) message.obj);
                }
                return true;
            case 3:
                ISphinxManager.ISphinxListener iSphinxListener4 = this.mListener;
                if (iSphinxListener4 != null) {
                    iSphinxListener4.onCameraOpened(((Integer) message.obj).intValue() == SphinxFocusType.kFocusManual.ordinal());
                }
                return true;
            case 4:
                ISphinxManager.ISphinxListener iSphinxListener5 = this.mListener;
                if (iSphinxListener5 != null) {
                    iSphinxListener5.onStarted();
                }
                return true;
            case 5:
                int i = this.mSubmitCount - 1;
                this.mSubmitCount = i;
                if (i <= 0) {
                    stopSelf();
                }
                return true;
            case 6:
                ISphinxManager.ISphinxListener iSphinxListener6 = this.mListener;
                if (iSphinxListener6 != null) {
                    iSphinxListener6.onRestarting();
                }
                return true;
            case 7:
                ISphinxManager.ISphinxListener iSphinxListener7 = this.mListener;
                if (iSphinxListener7 != null) {
                    iSphinxListener7.onCameraTemperatureShutdown(((Boolean) message.obj).booleanValue());
                }
                return true;
            default:
                return true;
        }
    }

    private void sendEvent(int i, Object obj, Object obj2) {
        SphinxEngine sphinxEngine = this.mEngine;
        if (sphinxEngine == null || sphinxEngine.isStopped()) {
            return;
        }
        Event event = new Event(i);
        if (obj != null) {
            event.setArg1(obj);
        }
        if (obj2 != null) {
            event.setArg2(obj2);
        }
        this.mEngine.postEvent(event);
    }

    private void sendEvent(int i, Object obj) {
        sendEvent(i, obj, null);
    }

    private void sendEvent(int i) {
        sendEvent(i, null, null);
    }

    private void keepAlive() {
        startService(new Intent(this, (Class<?>) SphinxService.class));
    }
}
