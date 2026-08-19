package com.sonymobile.scan3d.storageservice.authentication;

import android.content.Intent;
import androidx.localbroadcastmanager.content.LocalBroadcastManager;
import com.google.android.gms.drive.events.CompletionEvent;
import com.google.android.gms.drive.events.DriveEventService;

/* JADX INFO: loaded from: classes.dex */
public class EncryptionDriveEventService extends DriveEventService {
    @Override // com.google.android.gms.drive.events.DriveEventService, com.google.android.gms.drive.events.CompletionListener
    public void onCompletion(CompletionEvent completionEvent) {
        sendResult(completionEvent);
        completionEvent.dismiss();
    }

    private void sendResult(CompletionEvent completionEvent) {
        Intent intent = new Intent("com.sonymobile.scan3d.action.DRIVE_EVENT");
        intent.putExtra("com.sonymobile.scan3d.extra.DRIVE_ID", completionEvent.getDriveId());
        intent.putExtra("com.sonymobile.scan3d.extra.DRIVE_RESULT", completionEvent.getStatus() == 0);
        LocalBroadcastManager.getInstance(this).sendBroadcast(intent);
    }
}
