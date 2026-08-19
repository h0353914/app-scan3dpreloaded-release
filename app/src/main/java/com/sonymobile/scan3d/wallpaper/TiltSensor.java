package com.sonymobile.scan3d.wallpaper;

import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.view.WindowManager;
import com.sonymobile.scan3d.GLThread;

/* JADX INFO: loaded from: classes2.dex */
public class TiltSensor implements SensorEventListener {
    public static final float MAX_TILT = 1.5707964f;
    private final GLThread mGLThread;
    private long mNanosOfLastUpdate;
    private boolean mRegisteredSensor = false;
    private int mScreenRotation;
    private SensorManager mSensorManager;
    private float[] mTilt;

    @Override // android.hardware.SensorEventListener
    public void onAccuracyChanged(Sensor sensor, int i) {
    }

    public TiltSensor(Context context, GLThread gLThread) {
        this.mSensorManager = (SensorManager) context.getSystemService("sensor");
        this.mScreenRotation = ((WindowManager) context.getSystemService("window")).getDefaultDisplay().getRotation();
        this.mGLThread = gLThread;
    }

    public void onResume() {
        this.mNanosOfLastUpdate = 0L;
        this.mTilt = new float[]{0.0f, 0.0f};
        Sensor defaultSensor = this.mSensorManager.getDefaultSensor(4);
        if (defaultSensor != null) {
            this.mSensorManager.registerListener(this, defaultSensor, 1);
            this.mRegisteredSensor = true;
        }
    }

    public void onPause() {
        if (this.mRegisteredSensor) {
            this.mSensorManager.unregisterListener(this);
            this.mRegisteredSensor = false;
        }
    }

    @Override // android.hardware.SensorEventListener
    public void onSensorChanged(SensorEvent sensorEvent) {
        handleGyro(sensorEvent);
    }

    private void handleGyro(SensorEvent sensorEvent) {
        if (this.mNanosOfLastUpdate != 0) {
            float f = (sensorEvent.timestamp - this.mNanosOfLastUpdate) / 1.0E9f;
            switch (this.mScreenRotation) {
                case 0:
                    float[] fArr = this.mTilt;
                    fArr[0] = fArr[0] + (sensorEvent.values[1] * f);
                    float[] fArr2 = this.mTilt;
                    fArr2[1] = fArr2[1] + (sensorEvent.values[0] * f);
                    break;
                case 1:
                    float[] fArr3 = this.mTilt;
                    fArr3[0] = fArr3[0] + (sensorEvent.values[0] * f);
                    float[] fArr4 = this.mTilt;
                    fArr4[1] = fArr4[1] - (sensorEvent.values[1] * f);
                    break;
                case 2:
                    float[] fArr5 = this.mTilt;
                    fArr5[0] = fArr5[0] - (sensorEvent.values[1] * f);
                    float[] fArr6 = this.mTilt;
                    fArr6[1] = fArr6[1] - (sensorEvent.values[0] * f);
                    break;
                case 3:
                    float[] fArr7 = this.mTilt;
                    fArr7[0] = fArr7[0] - (sensorEvent.values[0] * f);
                    float[] fArr8 = this.mTilt;
                    fArr8[1] = fArr8[1] + (sensorEvent.values[1] * f);
                    break;
            }
            float[] fArr9 = this.mTilt;
            float fSqrt = (float) Math.sqrt((fArr9[0] * fArr9[0]) + (fArr9[1] * fArr9[1]));
            if (fSqrt > 1.5707964f) {
                float f2 = 1.5707964f / fSqrt;
                float[] fArr10 = this.mTilt;
                fArr10[0] = fArr10[0] * f2;
                fArr10[1] = fArr10[1] * f2;
            }
        }
        this.mNanosOfLastUpdate = sensorEvent.timestamp;
        this.mGLThread.requestRender();
    }

    public float[] getCurrentTilt() {
        return (float[]) this.mTilt.clone();
    }
}
