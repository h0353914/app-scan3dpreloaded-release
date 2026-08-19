package com.sonymobile.scan3d;

import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Environment;
import android.os.StatFs;

public class EnvConditions {
    private final Context mContext;
    private long mFreeStorageMB;

    public EnvConditions(Context context) {
        mContext = context.getApplicationContext();
        StatFs statFs = new StatFs(Environment.getExternalStorageDirectory().getPath());
        mFreeStorageMB = statFs.getAvailableBytes() / 0x100000;
    }

    public synchronized void sendData(Sphinx sphinx) {
        Intent intent = mContext.registerReceiver(null, new IntentFilter("android.intent.action.BATTERY_CHANGED"));
        int level = intent.getIntExtra("level", -1);
        int temperature = intent.getIntExtra("temperature", -1);
        sphinx.setEnvCondition(SphinxEnvCondition.kEnvCondBattery, (float) level);
        sphinx.setEnvCondition(SphinxEnvCondition.kEnvCondTemp, (float) temperature * 0.1f);
        sphinx.setEnvCondition(SphinxEnvCondition.kEnvCondFreeStorageMB, (float) mFreeStorageMB);
    }
}
