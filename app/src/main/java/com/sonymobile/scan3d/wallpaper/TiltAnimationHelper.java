package com.sonymobile.scan3d.wallpaper;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ValueAnimator;
import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.os.Handler;
import com.sonymobile.scan3d.GLThread;
import com.sonymobile.scan3d.viewer.SphanRenderer;

/* JADX INFO: loaded from: classes2.dex */
public class TiltAnimationHelper implements SensorEventListener {
    private static final float DO_ANIMATION_THRESHOLD = 3.0f;
    private static final float SENSOR_NO_TILT_THRESHOLD = 0.2f;
    private static final int TILT_DEGREES = 20;
    private int mCurrentTilt;
    private GLThread mGLThread;
    private boolean mIsAnimating;
    private SphanRenderer mRenderer;
    private SensorManager mSensorManager;
    private int mSensorNoTiltCount;
    private float mSensorTiltGround;
    private float mSensorSum = 0.0f;
    private Handler mHandler = new Handler();

    @Override // android.hardware.SensorEventListener
    public void onAccuracyChanged(Sensor sensor, int i) {
    }

    private class TiltRunnable implements Runnable {
        private int mEndTilt;
        private int mOldTiltDelta = 0;
        private int mTotalTiltDelta;

        public TiltRunnable(int i) {
            this.mEndTilt = i;
        }

        @Override // java.lang.Runnable
        public void run() {
            if (TiltAnimationHelper.this.mIsAnimating) {
                return;
            }
            this.mTotalTiltDelta = this.mEndTilt - TiltAnimationHelper.this.mCurrentTilt;
            TiltAnimationHelper.this.mCurrentTilt = this.mEndTilt;
            TiltAnimationHelper.this.mIsAnimating = true;
            ValueAnimator valueAnimatorOfInt = ValueAnimator.ofInt(0, this.mTotalTiltDelta);
            valueAnimatorOfInt.addUpdateListener(valueAnimator -> TiltAnimationHelper.this.mGLThread.queueEvent(() -> {
                TiltAnimationHelper.this.mRenderer.transform(0.0f, 0.0f, 0.0f, 0.0f, ((Integer) valueAnimator.getAnimatedValue()).intValue() - this.mOldTiltDelta, 0.0f, 1.0f);
                TiltAnimationHelper.this.mGLThread.requestRender();
                this.mOldTiltDelta = ((Integer) valueAnimator.getAnimatedValue()).intValue();
            }));
            valueAnimatorOfInt.addListener(new AnimatorListenerAdapter() { // from class: com.sonymobile.scan3d.wallpaper.TiltAnimationHelper.TiltRunnable.1
                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public void onAnimationCancel(Animator animator) {
                    TiltAnimationHelper.this.mGLThread.requestRender();
                    TiltAnimationHelper.this.mIsAnimating = false;
                    super.onAnimationCancel(animator);
                }

                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public void onAnimationEnd(Animator animator) {
                    TiltAnimationHelper.this.mGLThread.requestRender();
                    TiltAnimationHelper.this.mIsAnimating = false;
                    super.onAnimationEnd(animator);
                }
            });
            valueAnimatorOfInt.setDuration(300L);
            valueAnimatorOfInt.start();
        }
    }

    public TiltAnimationHelper(Context context, GLThread gLThread, SphanRenderer sphanRenderer) {
        this.mRenderer = sphanRenderer;
        this.mGLThread = gLThread;
        this.mSensorManager = (SensorManager) context.getSystemService("sensor");
    }

    public void setEnableAnimation(boolean z) {
        this.mIsAnimating = z;
    }

    public void resume() {
        this.mSensorManager.registerListener(this, this.mSensorManager.getDefaultSensor(4), 3);
    }

    public void pause() {
        this.mSensorManager.unregisterListener(this);
        this.mHandler.removeCallbacksAndMessages(null);
    }

    @Override // android.hardware.SensorEventListener
    public void onSensorChanged(SensorEvent sensorEvent) {
        float f = sensorEvent.values[1];
        this.mSensorSum += f;
        float f2 = this.mSensorSum - this.mSensorTiltGround;
        if (Math.abs(f) < SENSOR_NO_TILT_THRESHOLD) {
            this.mSensorNoTiltCount++;
        } else {
            this.mSensorNoTiltCount = 0;
        }
        if (this.mIsAnimating) {
            return;
        }
        if (this.mSensorNoTiltCount > 5) {
            this.mSensorTiltGround = this.mSensorSum;
        }
        if (f2 > DO_ANIMATION_THRESHOLD && this.mCurrentTilt != 20) {
            this.mHandler.post(new TiltRunnable(20));
            return;
        }
        if (f2 < -3.0f && this.mCurrentTilt != -20) {
            this.mHandler.post(new TiltRunnable(-20));
            return;
        }
        if (f2 < DO_ANIMATION_THRESHOLD && f2 > -3.0f && this.mCurrentTilt != 0) {
            this.mHandler.post(new TiltRunnable(0));
        } else {
            if (this.mSensorNoTiltCount <= 5 || this.mCurrentTilt == 0) {
                return;
            }
            this.mHandler.post(new TiltRunnable(0));
        }
    }
}
