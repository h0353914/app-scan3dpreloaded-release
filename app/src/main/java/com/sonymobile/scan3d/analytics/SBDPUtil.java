package com.sonymobile.scan3d.analytics;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.AsyncTask;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.utils.SystemUtils;

import org.json.JSONException;
import org.json.JSONObject;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

public class SBDPUtil {
    private static final String IDD_CLASS_NAME = "com.sonyericsson.idd.api.Idd";
    private static final String IDD_METHOD_NAME = "addAppDataJSON";
    private static final String JSON_SESSION_ID = "session_id";
    private static final String JSON_VERSION = "json_version";
    private static final String JSON_VERSION_VALUE = "2";
    private static final String TAG = IddSender.class.getName();
    private static final String TYPE = "type";
    private static final String TYPE_CONFIG_VALUES = "config-values";
    private static final String TYPE_EVENT = "event";
    private static final String TYPE_SCAN_EVENT = "scanEvent";
    private static final String TYPE_SCREENVIEW = "screenview";
    private static final String TYPE_SCREEN_LEAVE = "screenview-exit";
    private static final String TYPE_SIGNIN_EVENT = "signinEvent";
    private static final String TYPE_TIMING_ENGINE = "timing-engine";
    private static final int UNKNOWN_SCAN_POLICY = -2;

    private static SBDPUtil sInstance;

    private Context mAppContext;
    private Executor mExecutor;
    private Method mMethodAddAppDataJSON;
    private String mPackageName;
    private List<IddSender> mQueue;
    private UUID mSessionId;
    private int mVersionCode;
    private String mVersionName;

    private SBDPUtil(Context context) {
        mVersionName = "";
        mVersionCode = -1;
        mSessionId = null;
        mExecutor = Executors.newSingleThreadExecutor();
        mQueue = new ArrayList<>();
        mAppContext = context.getApplicationContext();
        mSessionId = UUID.randomUUID();
        PackageManager pm = context.getPackageManager();
        try {
            mPackageName = context.getPackageName();
            PackageInfo packageInfo = pm.getPackageInfo(mPackageName, 0);
            mVersionName = packageInfo.versionName;
            mVersionCode = packageInfo.versionCode;
        } catch (PackageManager.NameNotFoundException e) {
            DebugLog.e(TAG, "Error getting package info: ", e);
        }
        try {
            Class<?> iddClass = Class.forName(IDD_CLASS_NAME);
            mMethodAddAppDataJSON = iddClass.getMethod(IDD_METHOD_NAME, String.class, String.class, Integer.TYPE, JSONObject.class);
        } catch (ClassNotFoundException | NoSuchMethodException | ExceptionInInitializerError e) {
            DebugLog.d(TAG, "Idd.addAppDataJSON is not supported");
        }
    }

    public static synchronized SBDPUtil getInstance(Context context) {
        if (sInstance == null) {
            sInstance = new SBDPUtil(context);
        }
        return sInstance;
    }

    private boolean isIddSupported() {
        return mMethodAddAppDataJSON != null;
    }

    public static synchronized void resetInstance() {
        sInstance = null;
    }

    private synchronized void sendDataToIdd(@NonNull String packageName, @NonNull String type, @NonNull JSONObject payload) throws JSONException {
        if (isIddSupported()) {
            payload.put(TYPE, type);
            payload.put(JSON_VERSION, JSON_VERSION_VALUE);
            payload.put(JSON_SESSION_ID, mSessionId);

            IddSender sender = new IddSender(mMethodAddAppDataJSON, packageName, mVersionName, mVersionCode, payload);

            if (SystemUtils.isDataAllowed(mAppContext)) {
                for (Iterator<IddSender> it = mQueue.iterator(); it.hasNext(); ) {
                    IddSender queued = it.next();
                    queued.executeOnExecutor(mExecutor, new Void[0]);
                }
                mQueue.clear();
                sender.executeOnExecutor(mExecutor, new Void[0]);
            } else {
                mQueue.add(sender);
            }
        }
    }

    public void pushAppView(String screen, boolean entering) {
        JSONObject payload = new JSONObject();
        try {
            payload.put("screen", screen);
            String type = entering ? TYPE_SCREENVIEW : TYPE_SCREEN_LEAVE;
            sendDataToIdd(mPackageName, type, payload);
        } catch (JSONException e) {
            DebugLog.e(TAG, e.getMessage(), e);
        }
    }

    public void pushConfigValues(JSONObject payload) {
        try {
            sendDataToIdd(mPackageName, TYPE_CONFIG_VALUES, payload);
        } catch (JSONException e) {
            DebugLog.e(TAG, e.getMessage(), e);
        }
    }

    public void pushEngineTiming(JSONObject payload) {
        try {
            sendDataToIdd(mPackageName, TYPE_TIMING_ENGINE, payload);
        } catch (JSONException e) {
            DebugLog.e(TAG, e.getMessage(), e);
        }
    }

    public void pushEvent(String action, String label, long hits) {
        pushEvent(action, label, hits, UNKNOWN_SCAN_POLICY);
    }

    public void pushEvent(String action, String label, long hits, int scanPolicy) {
        JSONObject payload = new JSONObject();
        try {
            payload.put("action", action);
            payload.put("label", label);
            payload.put("hits", hits);
            if (scanPolicy > UNKNOWN_SCAN_POLICY) {
                payload.put("mode", scanPolicy);
            }
            sendDataToIdd(mPackageName, TYPE_EVENT, payload);
        } catch (JSONException e) {
            DebugLog.e(TAG, e.getMessage(), e);
        }
    }

    public void pushScanEvent(JSONObject payload) {
        try {
            sendDataToIdd(mPackageName, TYPE_SCAN_EVENT, payload);
        } catch (JSONException e) {
            DebugLog.e(TAG, e.getMessage(), e);
        }
    }

    public void pushSignInEvent(String action, int sessionId) {
        JSONObject payload = new JSONObject();
        try {
            payload.put("signin_action", action);
            payload.put("signin_session_id", sessionId);
            sendDataToIdd(mPackageName, TYPE_SIGNIN_EVENT, payload);
        } catch (JSONException e) {
            DebugLog.e(TAG, e.getMessage(), e);
        }
    }

    public void pushSignInEvent(String action, int sessionId, int resultCode, @Nullable String exception) {
        JSONObject payload = new JSONObject();
        try {
            payload.put("signin_action", action);
            payload.put("signin_session_id", sessionId);
            payload.put("signin_result_code", resultCode);
            if (exception != null) {
                payload.put("signin_exception", exception);
            }
            sendDataToIdd(mPackageName, TYPE_SIGNIN_EVENT, payload);
        } catch (JSONException e) {
            DebugLog.e(TAG, e.getMessage(), e);
        }
    }

    private static class IddSender extends AsyncTask<Void, Void, Void> {
        private Method mMethodAddAppDataJSON;
        private String mPackageName;
        private JSONObject mPayload;
        private int mVersionCode;
        private String mVersionName;

        private IddSender(Method methodAddAppDataJSON, String packageName, String versionName, int versionCode, JSONObject payload) {
            mMethodAddAppDataJSON = methodAddAppDataJSON;
            mVersionName = versionName;
            mVersionCode = versionCode;
            mPackageName = packageName;
            mPayload = payload;
        }

        @Override
        protected Void doInBackground(Void... voids) {
            try {
                mMethodAddAppDataJSON.invoke(null, mPackageName, mVersionName, mVersionCode, mPayload);
            } catch (IllegalAccessException | InvocationTargetException e) {
                DebugLog.e(TAG, "Error when sending to IDD");
            }
            DebugLog.d(TAG, mPayload.toString());
            return null;
        }
    }
}
