package com.sonymobile.scan3d;

import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.os.RemoteException;
import com.sonyericsson.psm.sysmonservice.ISysmonService;
import com.sonymobile.scan3d.logging.DebugLog;

/* JADX INFO: loaded from: classes.dex */
public class ThermalAlertReceiver extends BroadcastReceiver {
    private static final String ACTION_CAMERA_COOLED_DOWN_NORMAL = "com.sonyericsson.psm.action.CAMERA_COOLED_DOWN_NORMAL";
    private static final String ACTION_CAMERA_HEATED_CLOSE_TO_SHUTDOWN = "com.sonyericsson.psm.action.CAMERA_HEATED_CLOSE_TO_SHUTDOWN";
    private static final String ACTION_CAMERA_HEATED_OVER_CRITICAL = "com.sonyericsson.psm.action.CAMERA_HEATED_OVER_CRITICAL";
    private static final int CAMERA_CLOSE_SHUTDOWN = 620;
    private static final int CAMERA_CRITICAL = 604;
    private static final String SYSMON_SERVICE_CLASS_NAME = "com.sonyericsson.psm.sysmonservice.SysmonService";
    private static final String SYSMON_SERVICE_PACKAGE_NAME = "com.sonyericsson.psm.sysmonservice";
    private static final String TAG = "ThermalAlertReceiver";
    private final Context mContext;
    private boolean mIsBound;
    private boolean mIsRegistered;
    private final ServiceConnection mServiceConnection = new ServiceConnectionSysmon();
    private ISysmonService mSysmonService;
    private final ThermalAlertCallback mThermalCallback;

    public interface ThermalAlertCallback {
        void cameraGettingHot();

        void cameraOverheated();

        void cameraTooHotToStart();
    }

    public ThermalAlertReceiver(Context context, ThermalAlertCallback thermalAlertCallback) {
        this.mContext = context;
        this.mThermalCallback = thermalAlertCallback;
    }

    private class ServiceConnectionSysmon implements ServiceConnection {
        private ServiceConnectionSysmon() {
        }

        @Override // android.content.ServiceConnection
        public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
            ThermalAlertReceiver.this.mSysmonService = ISysmonService.Stub.asInterface(iBinder);
            if (ThermalAlertReceiver.this.mSysmonService != null) {
                try {
                    ThermalAlertReceiver.this.isCameraAllowedToStart();
                } catch (Exception e) {
                    DebugLog.d(ThermalAlertReceiver.TAG, "sysmon ServiceConnection failed.", e);
                }
            }
        }

        @Override // android.content.ServiceConnection
        public void onServiceDisconnected(ComponentName componentName) {
            ThermalAlertReceiver.this.mSysmonService = null;
        }
    }

    public void bindThermalService() {
        Intent intent = new Intent();
        intent.setClassName(SYSMON_SERVICE_PACKAGE_NAME, SYSMON_SERVICE_CLASS_NAME);
        this.mIsBound = this.mContext.bindService(intent, this.mServiceConnection, 1);
        if (this.mIsBound) {
            DebugLog.d(TAG, "bind sysmon service");
        } else {
            this.mContext.unbindService(this.mServiceConnection);
        }
        register();
    }

    public void unbindThermalService() {
        if (this.mIsBound) {
            this.mIsBound = false;
            this.mContext.unbindService(this.mServiceConnection);
            this.mSysmonService = null;
            DebugLog.d(TAG, "unbind sysmon service");
        }
        unregister();
    }

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        String action = intent.getAction();
        if (ACTION_CAMERA_HEATED_CLOSE_TO_SHUTDOWN.equals(action)) {
            this.mThermalCallback.cameraGettingHot();
        } else if (ACTION_CAMERA_HEATED_OVER_CRITICAL.equals(action)) {
            this.mThermalCallback.cameraOverheated();
        } else if (ACTION_CAMERA_COOLED_DOWN_NORMAL.equals(action)) {
            DebugLog.d(TAG, "Camera cooled down");
        }
    }

    private void isCameraAllowedToStart() throws RemoteException {
        int thermalLevelForCamera = this.mSysmonService.getThermalLevelForCamera();
        if (thermalLevelForCamera == CAMERA_CRITICAL || thermalLevelForCamera == CAMERA_CLOSE_SHUTDOWN) {
            this.mThermalCallback.cameraTooHotToStart();
        }
    }

    private void register() {
        if (this.mIsRegistered) {
            return;
        }
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction(ACTION_CAMERA_HEATED_CLOSE_TO_SHUTDOWN);
        intentFilter.addAction(ACTION_CAMERA_HEATED_OVER_CRITICAL);
        intentFilter.addAction(ACTION_CAMERA_COOLED_DOWN_NORMAL);
        this.mContext.registerReceiver(this, intentFilter);
        this.mIsRegistered = true;
    }

    private void unregister() {
        if (this.mIsRegistered) {
            this.mContext.unregisterReceiver(this);
            this.mIsRegistered = false;
        }
    }
}
