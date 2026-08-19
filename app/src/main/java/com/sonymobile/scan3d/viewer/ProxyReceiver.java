package com.sonymobile.scan3d.viewer;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import com.sonymobile.scan3d.storageservice.provider.Factory;
import com.sonymobile.scan3d.storageservice.provider.Improvement;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes.dex */
public class ProxyReceiver extends BroadcastReceiver {
    private static final String ACTION_IMPROVEMENT_ACTIVITY_SELECTION = "com.sonymobile.scan3d.action.SELECT_IMPROVEMENT";

    private static class ImprovementRunnable implements Runnable {
        private final Context mContext;
        private final BroadcastReceiver.PendingResult mResult;
        private final Uri mUri;

        ImprovementRunnable(Context context, Uri uri, BroadcastReceiver.PendingResult pendingResult) {
            this.mContext = context.getApplicationContext();
            this.mUri = uri;
            this.mResult = pendingResult;
        }

        @Override // java.lang.Runnable
        public final void run() {
            Intent improvementIntent;
            ArrayList<Improvement> arrayList = new ArrayList<>();
            Uri uri = this.mUri;
            if (uri == null) {
                for (Improvement improvement : Factory.getImprovements(this.mContext)) {
                    if (improvement.isImproved()) {
                        arrayList.add(improvement);
                    }
                }
            } else {
                arrayList = Factory.getImprovements(this.mContext, uri);
            }
            if (arrayList.size() > 0) {
                if (arrayList.size() > 1) {
                    improvementIntent = SelectImprovementActivity.getStartIntent(this.mContext, arrayList);
                } else {
                    improvementIntent = ViewerActivity.getImprovementIntent(this.mContext, arrayList.get(0));
                }
                this.mContext.startActivity(improvementIntent);
            }
            this.mResult.finish();
        }
    }

    public static Intent getImprovementIntent(Context context) {
        return getImprovementIntent(context, null);
    }

    public static Intent getImprovementIntent(Context context, Uri uri) {
        Intent intent = new Intent(context, (Class<?>) ProxyReceiver.class);
        intent.setAction(ACTION_IMPROVEMENT_ACTIVITY_SELECTION);
        intent.setData(uri);
        return intent;
    }

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        if (intent == null || !ACTION_IMPROVEMENT_ACTIVITY_SELECTION.equals(intent.getAction())) {
            return;
        }
        new Thread(new ImprovementRunnable(context, intent.getData(), goAsync())).start();
    }
}
