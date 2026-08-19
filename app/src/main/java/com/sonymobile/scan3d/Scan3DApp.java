package com.sonymobile.scan3d;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.res.AssetManager;
import android.os.Bundle;
import android.widget.Toast;
import com.facebook.drawee.backends.pipeline.Fresco;
import com.sonymobile.scan3d.analytics.SBDPUtil;
import com.sonymobile.scan3d.logging.NativeLog;
import com.sonymobile.scan3d.sharing.SharingManager;
import com.sonymobile.scan3d.storageservice.content.Jobs;
import com.sonymobile.scan3d.storageservice.network.SyncHubApi;
import com.sonymobile.scan3d.storageservice.utils.FsUtils;
import com.sonymobile.scan3d.utils.SystemUtils;
import com.sonymobile.scan3d.utils.notification.NotificationUtil;
import java.util.Locale;
import java.util.concurrent.TimeUnit;

/* JADX INFO: loaded from: classes.dex */
public class Scan3DApp extends Application {
    private static final String TAG = "sculpt3d";
    private volatile AssetManager mAssetManager = null;

    @Override // android.app.Application
    public void onCreate() {
        super.onCreate();
        this.mAssetManager = getAssets();
        Sphinx.initAssets(this.mAssetManager);
        Sphinx.setupEnvironment(getApplicationInfo().dataDir, getFilesDir().getAbsolutePath(), getCacheDir().getAbsolutePath(), getPackageName());
        SyncHubApi.setPackageName(getPackageName());
        ZipResourceManager.init(getApplicationContext());
        SharingManager.init(this);
        NotificationUtil.setup(this);
        Jobs.initPersistentJobs(this);
        new Thread(() -> FsUtils.cleanTempDir(this, null)).start();
        Fresco.initialize(this);
        if (SystemUtils.isDataAllowed(this) && SystemUtils.isGooglePlayServicesAvailable(this)) {
            SystemUtils.initFirebase(this);
        }
        NativeLog.v("sculpt3d", "Version name is 3.0.A.0.22");
        registerActivityLifecycleCallbacks(new AppLifecycleTracker());
    }

    public static boolean isPartOfBetaProgram(Context context) {
        if (!BuildConfig.FLAVOR.equals("labs") || "com.android.vending".equals(context.getPackageManager().getInstallerPackageName(context.getPackageName()))) {
            return true;
        }
        Toast.makeText(context, R.string.toast_not_part_of_beta, 1).show();
        return false;
    }

    public static boolean isJapaneseLanguage() {
        return Locale.JAPANESE.getISO3Language().equals(Locale.getDefault().getISO3Language());
    }

    public static boolean isCustomFaceMimicEnabled() {
        return BuildConfig.FLAVOR.equals("labs");
    }

    static {
        System.loadLibrary("Scan3D");
    }

    private static class AppLifecycleTracker implements Application.ActivityLifecycleCallbacks {
        private static final int MAX_DELAY_IN_MINUTES = 10;
        long lastTimeInBackGround;

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityCreated(Activity activity, Bundle bundle) {
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityDestroyed(Activity activity) {
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityPaused(Activity activity) {
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityResumed(Activity activity) {
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivitySaveInstanceState(Activity activity, Bundle bundle) {
        }

        private AppLifecycleTracker() {
            this.lastTimeInBackGround = -1L;
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityStarted(Activity activity) {
            if (this.lastTimeInBackGround == -1) {
                return;
            }
            if (TimeUnit.MILLISECONDS.toMinutes(System.currentTimeMillis() - this.lastTimeInBackGround) > 10) {
                SBDPUtil.resetInstance();
            }
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityStopped(Activity activity) {
            this.lastTimeInBackGround = System.currentTimeMillis();
        }
    }
}
