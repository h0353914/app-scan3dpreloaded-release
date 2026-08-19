package com.sonymobile.scan3d.storageservice.content;

import android.app.job.JobInfo;
import android.app.job.JobScheduler;
import android.app.job.JobWorkItem;
import android.content.ComponentName;
import android.content.ContentUris;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.PersistableBundle;
import android.preference.PreferenceManager;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.storageservice.authentication.KeyPair;
import com.sonymobile.scan3d.storageservice.content.aws.AwsSession;
import com.sonymobile.scan3d.storageservice.provider.Contract;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.storageservice.provider.Improvement;
import java.util.Iterator;
import java.util.concurrent.TimeUnit;

/* JADX INFO: loaded from: classes.dex */
public final class Jobs {
    private static final long CONTENT_CHANGED_MAX_TRIGGER_DELAY = TimeUnit.SECONDS.toMillis(2);
    private static final String EXTRA_ENCRYPTION_KEY = "com.sonymobile.scan3d.extra.encryption_key";
    static final String EXTRA_FILESET_ID = "com.sonymobile.scan3d.extra.fileset_id";
    static final String EXTRA_IMPROVEMENT_ID = "com.sonymobile.scan3d.extra.improvement_id";
    static final String EXTRA_RECEIVING_REQUEST = "com.sonymobile.scan3d.extra.receiving_request";
    static final String EXTRA_SERVER_KEY = "com.sonymobile.scan3d.extra.server_key";
    static final String EXTRA_SESSION_ID = "com.sonymobile.scan3d.extra.session_id";
    private static final String EXTRA_SIGNING_KEY = "com.sonymobile.scan3d.extra.signing_key";
    static final String EXTRA_TYPE = "com.sonymobile.scan3d.extra.improvement_type";
    static final String EXTRA_VERSION = "com.sonymobile.scan3d.extra.protocol_version";
    static final int JOB_CLEANUP_ID = -4;
    static final int JOB_DELETE_BACKEND_ID = -6;
    static final int JOB_DELETE_SYNCHUB_ID = -9;
    static final int JOB_EXTRACT_DATA_ID = -7;
    static final int JOB_GDPR_RETENTION_ID = -10;
    static final int JOB_IMPROVEMENT_EXECUTE_ID = -2;
    static final int JOB_IMPROVEMENT_INIT_ID = -1;
    static final int JOB_IMPROVEMENT_RECEIVE_ID = -3;
    static final int JOB_INIT_KEY_ID = -8;
    private static final int JOB_SYNC_ID = 0;
    static final int JOB_TRANSFER_ID = 1;
    static final int JOB_UPDATE_IMPROVEMENT_NOTIFICATION_ID = -5;
    static final int TYPE_DELETE = 2;
    static final int TYPE_DOWNLOAD = 4;
    public static final String TYPE_IMPROVEMENT = "refinement";
    static final int TYPE_MODIFY = 1;
    static final int TYPE_UPLOAD = 3;

    private static boolean isPersistentJob(int i) {
        if (i == JOB_GDPR_RETENTION_ID) {
            return true;
        }
        switch (i) {
            case JOB_UPDATE_IMPROVEMENT_NOTIFICATION_ID /* -5 */:
            case -4:
                return true;
            default:
                return false;
        }
    }

    public static class RequestBuilder {
        private final Intent mIntent = new Intent();

        public RequestBuilder(String str) {
            this.mIntent.putExtra(Jobs.EXTRA_TYPE, str);
        }

        public RequestBuilder withProtocolVersion(int i) {
            this.mIntent.putExtra(Jobs.EXTRA_VERSION, i);
            return this;
        }

        public RequestBuilder withSessionId(String str) {
            this.mIntent.putExtra(Jobs.EXTRA_SESSION_ID, str);
            return this;
        }

        public RequestBuilder withServerKey(String str) {
            this.mIntent.putExtra(Jobs.EXTRA_SERVER_KEY, str);
            return this;
        }

        public RequestBuilder withImprovement(Improvement improvement) {
            this.mIntent.putExtra(Jobs.EXTRA_IMPROVEMENT_ID, improvement.getId());
            return this;
        }
    }

    private Jobs() {
    }

    public static void initPersistentJobs(Context context) {
        scheduleNotificationUpdate(context);
        scheduleCleanup(context);
        scheduleGDPRRetention(context);
    }

    public static boolean requestDeleteBackendDataJob(Context context) {
        return ((JobScheduler) context.getSystemService("jobscheduler")).schedule(new JobInfo.Builder(JOB_DELETE_BACKEND_ID, new ComponentName(context, (Class<?>) WorkService.class)).setRequiredNetworkType(1).setBackoffCriteria(TimeUnit.MINUTES.toMillis(1L), 0).build()) == 1;
    }

    public static boolean requestDeleteAccountJob(Context context) {
        return ((JobScheduler) context.getSystemService("jobscheduler")).schedule(new JobInfo.Builder(JOB_DELETE_SYNCHUB_ID, new ComponentName(context, (Class<?>) WorkService.class)).setRequiredNetworkType(1).setBackoffCriteria(TimeUnit.MINUTES.toMillis(1L), 0).build()) == 1;
    }

    public static boolean requestExtractDataJob(Context context, String str, String str2) {
        JobScheduler jobScheduler = (JobScheduler) context.getSystemService("jobscheduler");
        PersistableBundle persistableBundle = new PersistableBundle();
        persistableBundle.putString(EXTRA_SERVER_KEY, str);
        persistableBundle.putString(EXTRA_SESSION_ID, str2);
        return jobScheduler.schedule(new JobInfo.Builder(JOB_EXTRACT_DATA_ID, new ComponentName(context, (Class<?>) WorkService.class)).setExtras(persistableBundle).setRequiredNetworkType(1).setBackoffCriteria(TimeUnit.MINUTES.toMillis(1L), 0).build()) == 1;
    }

    public static boolean requestKeyInitJob(Context context, String str) {
        JobScheduler jobScheduler = (JobScheduler) context.getSystemService("jobscheduler");
        PersistableBundle persistableBundle = new PersistableBundle();
        persistableBundle.putString(EXTRA_RECEIVING_REQUEST, str);
        return jobScheduler.schedule(new JobInfo.Builder(JOB_INIT_KEY_ID, new ComponentName(context, (Class<?>) WorkService.class)).setExtras(persistableBundle).setRequiredNetworkType(1).setBackoffCriteria(TimeUnit.MINUTES.toMillis(1L), 0).build()) == 1;
    }

    public static boolean requestInitImprovementJob(Context context, Uri uri) {
        JobScheduler jobScheduler = (JobScheduler) context.getSystemService("jobscheduler");
        Intent intent = new Intent();
        intent.putExtra(EXTRA_RECEIVING_REQUEST, AwsSession.REQUEST_TYPE_EXECUTE);
        intent.putExtra(EXTRA_IMPROVEMENT_ID, ContentUris.parseId(uri));
        return jobScheduler.enqueue(new JobInfo.Builder(-1, new ComponentName(context, (Class<?>) WorkService.class)).setRequiredNetworkType(2).setBackoffCriteria(TimeUnit.MINUTES.toMillis(1L), 0).build(), new JobWorkItem(intent)) == 1;
    }

    public static boolean requestExecuteImprovementJob(Context context, RequestBuilder requestBuilder) {
        return ((JobScheduler) context.getSystemService("jobscheduler")).enqueue(new JobInfo.Builder(-2, new ComponentName(context, (Class<?>) WorkService.class)).setRequiredNetworkType(2).setBackoffCriteria(TimeUnit.MINUTES.toMillis(1L), 0).build(), new JobWorkItem(requestBuilder.mIntent)) == 1;
    }

    public static boolean requestReceiveImprovementJob(Context context) {
        return ((JobScheduler) context.getSystemService("jobscheduler")).schedule(new JobInfo.Builder(-3, new ComponentName(context, (Class<?>) WorkService.class)).setRequiredNetworkType(2).build()) == 1;
    }

    public static boolean requestSync(Context context, boolean z) {
        return ((JobScheduler) context.getSystemService("jobscheduler")).schedule(new JobInfo.Builder(0, new ComponentName(context, (Class<?>) SyncService.class)).setRequiredNetworkType(z ? 1 : getNetWorkType(context)).setRequiresCharging(!z && isChargingRequired(context)).setBackoffCriteria(TimeUnit.HOURS.toMillis(1L), 0).build()) == 1;
    }

    public static boolean cancelJob(Context context, Uri uri) {
        long id = ContentUris.parseId(uri);
        JobScheduler jobScheduler = (JobScheduler) context.getSystemService("jobscheduler");
        Iterator<JobInfo> it = jobScheduler.getAllPendingJobs().iterator();
        boolean z = false;
        while (it.hasNext()) {
            if (it.next().getId() == id) {
                jobScheduler.cancel((int) id);
                z = true;
            }
        }
        return z;
    }

    static boolean requestTransferJob(Context context, int i, IFileSet iFileSet, KeyPair keyPair) {
        if (!iFileSet.isValid()) {
            return false;
        }
        long id = iFileSet.getId();
        switch (i) {
            case 1:
            case 2:
            case 3:
                return start(context, id, i, keyPair);
            case 4:
                return iFileSet.isRemote() && start(context, id, i, keyPair);
            default:
                return false;
        }
    }

    public static void cancelAllJobs(Context context) {
        JobScheduler jobScheduler = (JobScheduler) context.getSystemService("jobscheduler");
        Iterator<JobInfo> it = jobScheduler.getAllPendingJobs().iterator();
        while (it.hasNext()) {
            int id = it.next().getId();
            if (!isPersistentJob(id)) {
                jobScheduler.cancel(id);
            }
        }
    }

    static KeyPair keysFromBundle(Bundle bundle) {
        String string = bundle.getString(EXTRA_ENCRYPTION_KEY, null);
        String string2 = bundle.getString(EXTRA_SIGNING_KEY, null);
        if (string == null || string2 == null) {
            return null;
        }
        return new KeyPair(string, string2);
    }

    static boolean scheduleNotificationUpdate(Context context) {
        return ((JobScheduler) context.getSystemService("jobscheduler")).schedule(new JobInfo.Builder(JOB_UPDATE_IMPROVEMENT_NOTIFICATION_ID, new ComponentName(context, (Class<?>) WorkService.class)).addTriggerContentUri(new JobInfo.TriggerContentUri(Contract.ImprovementRecord.CONTENT_URI, 1)).setTriggerContentMaxDelay(CONTENT_CHANGED_MAX_TRIGGER_DELAY).build()) == 1;
    }

    static boolean scheduleCleanup(Context context) {
        return ((JobScheduler) context.getSystemService("jobscheduler")).schedule(new JobInfo.Builder(-4, new ComponentName(context, (Class<?>) WorkService.class)).setPeriodic(TimeUnit.HOURS.toMillis(12L)).setRequiresDeviceIdle(true).build()) == 1;
    }

    static boolean scheduleGDPRRetention(Context context) {
        return ((JobScheduler) context.getSystemService("jobscheduler")).schedule(new JobInfo.Builder(JOB_GDPR_RETENTION_ID, new ComponentName(context, (Class<?>) WorkService.class)).setRequiresDeviceIdle(true).build()) == 1;
    }

    private static boolean start(Context context, long j, int i, KeyPair keyPair) {
        JobScheduler jobScheduler = (JobScheduler) context.getSystemService("jobscheduler");
        Bundle bundle = new Bundle();
        bundle.putLong(EXTRA_FILESET_ID, j);
        bundle.putInt(EXTRA_TYPE, i);
        keysToBundle(bundle, keyPair);
        return start(context, jobScheduler, bundle);
    }

    private static boolean start(Context context, JobScheduler jobScheduler, Bundle bundle) {
        return 1 == jobScheduler.enqueue(new JobInfo.Builder(1, new ComponentName(context, (Class<?>) WorkService.class)).setRequiredNetworkType(getNetWorkType(context)).setRequiresCharging(isChargingRequired(context)).setBackoffCriteria(TimeUnit.MINUTES.toMillis(1L), 1).build(), new JobWorkItem(new Intent().putExtras(bundle)));
    }

    private static int getNetWorkType(Context context) {
        return PreferenceManager.getDefaultSharedPreferences(context).getBoolean(context.getString(R.string.pref_key_sync_over_wifi), true) ? 2 : 1;
    }

    private static boolean isChargingRequired(Context context) {
        return PreferenceManager.getDefaultSharedPreferences(context).getBoolean(context.getString(R.string.pref_key_sync_when_charging), context.getResources().getBoolean(R.bool.sync_when_charging_setting));
    }

    private static void keysToBundle(Bundle bundle, KeyPair keyPair) {
        if (keyPair != null) {
            bundle.putString(EXTRA_ENCRYPTION_KEY, keyPair.getEncryptionKey());
            bundle.putString(EXTRA_SIGNING_KEY, keyPair.getSignatureKey());
        }
    }
}
