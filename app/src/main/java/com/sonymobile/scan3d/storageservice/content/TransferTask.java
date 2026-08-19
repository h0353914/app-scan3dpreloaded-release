package com.sonymobile.scan3d.storageservice.content;

import android.app.job.JobParameters;
import android.app.job.JobWorkItem;
import android.content.ContentUris;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Bundle;
import android.preference.PreferenceManager;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.authentication.KeyPair;
import com.sonymobile.scan3d.storageservice.provider.Contract;
import com.sonymobile.scan3d.storageservice.provider.Factory;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.storageservice.utils.ConnectionUtils;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.function.Consumer;

/* JADX INFO: loaded from: classes.dex */
final class TransferTask extends Task {
    private static final String TAG = "com.sonymobile.scan3d.storageservice.content.TransferTask";

    TransferTask(TaskService taskService, JobParameters jobParameters) {
        super(taskService, jobParameters, true, false);
    }

    @Override // com.sonymobile.scan3d.storageservice.content.Task
    void doWork(Context context, final JobParameters jobParameters) {
        JobWorkItem jobWorkItemDequeueWork = jobParameters.dequeueWork();
        ArrayList arrayList = new ArrayList();
        while (jobWorkItemDequeueWork != null) {
            arrayList.add(jobWorkItemDequeueWork);
            jobWorkItemDequeueWork = jobParameters.dequeueWork();
            if (isCancelled()) {
                return;
            }
        }
        if (arrayList.isEmpty()) {
            return;
        }
        List<JobWorkItem> listTransferAll = transferAll(context, arrayList);
        jobParameters.getClass();
        listTransferAll.forEach(new Consumer() { // from class: com.sonymobile.scan3d.storageservice.content.-$$Lambda$DYxCPdvdj3LHfHcx-PYvCbd9sxE
            @Override // java.util.function.Consumer
            public final void accept(Object obj) {
                jobParameters.completeWork((JobWorkItem) obj);
            }
        });
    }

    private List<JobWorkItem> transferAll(Context context, List<JobWorkItem> list) {
        ArrayList arrayList = new ArrayList();
        list.sort(new Comparator() { // from class: com.sonymobile.scan3d.storageservice.content.-$$Lambda$TransferTask$Jjwa_N1v8-S9r0PfJNeITSIm8Qs
            @Override // java.util.Comparator
            public final int compare(Object obj, Object obj2) {
                return TransferTask.lambda$transferAll$0((JobWorkItem) obj, (JobWorkItem) obj2);
            }
        });
        for (JobWorkItem jobWorkItem : list) {
            if (isCancelled() || !isTransferAllowed(context)) {
                break;
            }
            SyncTransfer transfer = getTransfer(context, jobWorkItem.getIntent().getExtras());
            if (transfer != null) {
                try {
                    if (!transfer.isValid() || transfer.transfer()) {
                    }
                } catch (Exception unused) {
                }
            }
            arrayList.add(jobWorkItem);
        }
        return arrayList;
    }

    static /* synthetic */ int lambda$transferAll$0(JobWorkItem jobWorkItem, JobWorkItem jobWorkItem2) {
        return jobWorkItem.getIntent().getExtras().getInt("com.sonymobile.scan3d.extra.improvement_type") - jobWorkItem2.getIntent().getExtras().getInt("com.sonymobile.scan3d.extra.improvement_type");
    }

    private static SyncTransfer getTransfer(Context context, Bundle bundle) {
        SyncTransfer modifier;
        Uri uriWithAppendedId = ContentUris.withAppendedId(Contract.FileRecord.CONTENT_URI, bundle.getLong("com.sonymobile.scan3d.extra.fileset_id"));
        KeyPair keyPairKeysFromBundle = Jobs.keysFromBundle(bundle);
        IFileSet iFileSetCreate = Factory.create(context, uriWithAppendedId);
        if (iFileSetCreate != null) {
            switch (bundle.getInt("com.sonymobile.scan3d.extra.improvement_type")) {
                case 1:
                    modifier = new Modifier(context, iFileSetCreate);
                    break;
                case 2:
                    modifier = new Deleter(context, iFileSetCreate);
                    break;
                case 3:
                    modifier = new Uploader(context, iFileSetCreate, keyPairKeysFromBundle);
                    break;
                case 4:
                    modifier = new Downloader(context, iFileSetCreate, keyPairKeysFromBundle);
                    break;
                default:
                    modifier = null;
                    break;
            }
        } else {
            modifier = null;
        }
        DebugLog.d(TAG, "getTransfer(): " + modifier);
        return modifier;
    }

    private boolean isTransferAllowed(Context context) {
        SharedPreferences defaultSharedPreferences = PreferenceManager.getDefaultSharedPreferences(context);
        boolean z = defaultSharedPreferences.getBoolean(context.getString(R.string.pref_key_sync_over_wifi), true);
        boolean z2 = defaultSharedPreferences.getBoolean(context.getString(R.string.pref_key_sync_when_charging), context.getResources().getBoolean(R.bool.sync_when_charging_setting));
        boolean zIsWifiConnection = z ? ConnectionUtils.isWifiConnection(context) : true;
        return (z2 && zIsWifiConnection) ? isCharging(context) : zIsWifiConnection;
    }

    private static boolean isCharging(Context context) {
        Intent intentRegisterReceiver = context.registerReceiver(null, new IntentFilter("android.intent.action.BATTERY_CHANGED"));
        int intExtra = intentRegisterReceiver != null ? intentRegisterReceiver.getIntExtra("plugged", -1) : -1;
        return intExtra == 1 || intExtra == 2;
    }
}
