package com.sonymobile.scan3d.storageservice.authentication;

import android.content.Context;
import java.util.concurrent.ExecutionException;

/* JADX INFO: loaded from: classes.dex */
public class DriveActionsUtil {
    private static CustomDriveActions sCustomDriveActions;

    public static void setCustomDriveActions(CustomDriveActions customDriveActions) {
        sCustomDriveActions = customDriveActions;
    }

    public static KeyPair getKeysExecuteWait(Context context) throws ExecutionException, InterruptedException {
        CustomDriveActions customDriveActions = sCustomDriveActions;
        if (customDriveActions == null) {
            return DriveActions.getKeys(context).executeWait();
        }
        return customDriveActions.getKeys();
    }
}
