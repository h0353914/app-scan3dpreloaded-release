package com.sonymobile.scan3d.viewer;

import android.content.Context;
import android.util.DisplayMetrics;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.WindowManager;

/* JADX INFO: loaded from: classes.dex */
public final class GestureHandler implements GestureDetector.OnGestureListener, GestureDetector.OnDoubleTapListener {
    private static final int ONE_FINGER = 1;
    private static final float RADIANS_TO_DEGREES = 57.295776f;
    private static final float ROTATION_FACTOR_XY = 0.2f;
    private static final float TRANSLATION_FACTOR_XY = 1.0f;
    private static final int TWO_FINGERS = 2;
    private float mDensity;
    private GestureDetector mDetector;
    private boolean mDualMode;
    private GestureListener mListener;
    private float mXCoord;
    private float mXSecondCoord;
    private float mYCoord;
    private float mYSecondCoord;

    public interface GestureListener {
        boolean onDoubleTap();

        boolean onDown();

        boolean onFling(float f, float f2);

        boolean onMoveSingleTap(float f, float f2);

        boolean onSingleTap();

        boolean onTransform(float f, float f2, float f3, float f4, float f5, float f6, float f7);

        default boolean onUp() {
            return false;
        }
    }

    @Override // android.view.GestureDetector.OnDoubleTapListener
    public final boolean onDoubleTapEvent(MotionEvent motionEvent) {
        return true;
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public final void onLongPress(MotionEvent motionEvent) {
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public final void onShowPress(MotionEvent motionEvent) {
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public final boolean onSingleTapUp(MotionEvent motionEvent) {
        return false;
    }

    public GestureHandler(Context context, GestureListener gestureListener) {
        this.mDetector = new GestureDetector(context, this);
        this.mListener = gestureListener;
        DisplayMetrics displayMetrics = new DisplayMetrics();
        ((WindowManager) context.getSystemService("window")).getDefaultDisplay().getMetrics(displayMetrics);
        this.mDensity = displayMetrics.density;
    }

    public boolean handleEvent(MotionEvent motionEvent) {
        boolean z = false;
        if (motionEvent != null) {
            float x = motionEvent.getX();
            float y = motionEvent.getY();
            if (motionEvent.getPointerCount() == 2) {
                boolean zHandleTwoFingerMotion = handleTwoFingerMotion(motionEvent);
                this.mDualMode = true;
                z = zHandleTwoFingerMotion;
            } else {
                boolean zOnTouchEvent = this.mDetector.onTouchEvent(motionEvent);
                if (!zOnTouchEvent && motionEvent.getAction() == 1) {
                    zOnTouchEvent = this.mListener.onUp();
                }
                this.mDualMode = false;
                z = zOnTouchEvent;
            }
            this.mXCoord = x;
            this.mYCoord = y;
        }
        return z;
    }

    @Override // android.view.GestureDetector.OnDoubleTapListener
    public final boolean onSingleTapConfirmed(MotionEvent motionEvent) {
        return !this.mDualMode && this.mListener.onSingleTap();
    }

    @Override // android.view.GestureDetector.OnDoubleTapListener
    public boolean onDoubleTap(MotionEvent motionEvent) {
        return this.mListener.onDoubleTap();
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public final boolean onDown(MotionEvent motionEvent) {
        return this.mListener.onDown();
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public final boolean onScroll(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2) {
        if (this.mDualMode) {
            return false;
        }
        if (this.mListener.onMoveSingleTap(f * TRANSLATION_FACTOR_XY, TRANSLATION_FACTOR_XY * f2)) {
            return true;
        }
        GestureListener gestureListener = this.mListener;
        float f3 = f * ROTATION_FACTOR_XY;
        float f4 = this.mDensity;
        return gestureListener.onTransform(0.0f, 0.0f, 0.0f, f3 / f4, (f2 * ROTATION_FACTOR_XY) / f4, 0.0f, TRANSLATION_FACTOR_XY);
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public final boolean onFling(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2) {
        return this.mListener.onFling(f, f2);
    }

    private boolean handleTwoFingerMotion(MotionEvent motionEvent) {
        boolean zOnTransform;
        float x = motionEvent.getX();
        float y = motionEvent.getY();
        float x2 = motionEvent.getX(1);
        float y2 = motionEvent.getY(1);
        if (motionEvent.getAction() != 2) {
            zOnTransform = false;
        } else {
            float fCalculateAngle = calculateAngle(x, y, x2, y2);
            float f = ((x2 + x) - (this.mXSecondCoord + this.mXCoord)) / 2.0f;
            zOnTransform = this.mListener.onTransform(-f, ((y2 + y) - (this.mYSecondCoord + this.mYCoord)) / 2.0f, 0.0f, 0.0f, 0.0f, fCalculateAngle, calculateScale(x, y, x2, y2));
        }
        this.mXSecondCoord = x2;
        this.mYSecondCoord = y2;
        return zOnTransform;
    }

    private float calculateAngle(float f, float f2, float f3, float f4) {
        return (((float) Math.atan2(f4 - f2, f3 - f)) - ((float) Math.atan2(this.mYSecondCoord - this.mYCoord, this.mXSecondCoord - this.mXCoord))) * RADIANS_TO_DEGREES;
    }

    private float calculateScale(float f, float f2, float f3, float f4) {
        return distance(f, f2, f3, f4) / distance(this.mXCoord, this.mYCoord, this.mXSecondCoord, this.mYSecondCoord);
    }

    private static float distance(float f, float f2, float f3, float f4) {
        float f5 = f - f3;
        float f6 = f2 - f4;
        return (float) Math.sqrt((f5 * f5) + (f6 * f6));
    }
}
