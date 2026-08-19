package com.sonymobile.scan3d.viewer;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.AttributeSet;
import android.view.MotionEvent;
import androidx.annotation.Nullable;
import com.sonymobile.scan3d.GLThread;
import com.sonymobile.scan3d.NativeGLTextureView;
import com.sonymobile.scan3d.Sphan;
import java.util.Iterator;
import java.util.Vector;

/* JADX INFO: loaded from: classes.dex */
public class SphanGLTextureView extends NativeGLTextureView implements GestureHandler.GestureListener, MeshRenderer.OnStopFlingListener, GLThread.Renderer, Sphan.NativeAnimationListener {
    private static final float VELOCITY_MIN = 1500.0f;
    private AnimationListener mAnimationListener;
    private GestureHandler mGestureHandler;
    private SphanRenderer mRenderer;
    private Vector<SurfaceListener> mSurfaceListeners;
    private NativeGLTextureView.TouchListener mTouchListener;
    private boolean mWasAnimating;

    public interface AnimationListener {
        void onAnimationStopped();

        default void onAnimationStopped(int i) {
        }

        default void onAnimationTime(float f) {
        }
    }

    public interface SurfaceListener {
        void onSurfaceChanged(int i, int i2);

        void onSurfaceCreated();

        void onSurfaceDestroyed();
    }

    @Override // com.sonymobile.scan3d.viewer.MeshRenderer.OnStopFlingListener
    public void onStopFling() {
    }

    public SphanGLTextureView(Context context) {
        super(context);
        this.mSurfaceListeners = new Vector<>();
        this.mGestureHandler = new GestureHandler(context, this);
    }

    public SphanGLTextureView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.mSurfaceListeners = new Vector<>();
        this.mGestureHandler = new GestureHandler(context, this);
    }

    @Override // com.sonymobile.scan3d.GLThread.Renderer
    public void onSurfaceCreated() {
        this.mRenderer.onSurfaceCreated();
        Iterator<SurfaceListener> it = this.mSurfaceListeners.iterator();
        while (it.hasNext()) {
            it.next().onSurfaceCreated();
        }
    }

    @Override // com.sonymobile.scan3d.GLThread.Renderer
    public void onSurfaceChanged(int i, int i2) {
        this.mRenderer.onSurfaceChanged(i, i2);
        Iterator<SurfaceListener> it = this.mSurfaceListeners.iterator();
        while (it.hasNext()) {
            it.next().onSurfaceChanged(i, i2);
        }
        requestRender();
    }

    @Override // com.sonymobile.scan3d.GLThread.Renderer
    public boolean onDrawFrame(float f) {
        boolean zOnDrawFrame = this.mRenderer.onDrawFrame(f);
        AnimationListener animationListener = this.mAnimationListener;
        if (animationListener != null) {
            if (zOnDrawFrame) {
                animationListener.onAnimationTime(f);
            }
            if (this.mWasAnimating && !zOnDrawFrame) {
                this.mAnimationListener.onAnimationStopped();
            }
        }
        this.mWasAnimating = zOnDrawFrame;
        return zOnDrawFrame;
    }

    @Override // com.sonymobile.scan3d.GLThread.Renderer
    public void onSurfaceDestroyed() {
        Iterator<SurfaceListener> it = this.mSurfaceListeners.iterator();
        while (it.hasNext()) {
            it.next().onSurfaceDestroyed();
        }
        this.mRenderer.onSurfaceDestroyed();
    }

    public void setTouchListener(NativeGLTextureView.TouchListener touchListener) {
        this.mTouchListener = touchListener;
    }

    public void addSurfaceListener(SurfaceListener surfaceListener) {
        this.mSurfaceListeners.add(surfaceListener);
    }

    public void setAnimationListener(AnimationListener animationListener) {
        setAnimationListener(animationListener, false);
    }

    public void setAnimationListener(AnimationListener animationListener, boolean z) {
        this.mAnimationListener = animationListener;
        if (z) {
            this.mRenderer.setNativeAnimationListener(this);
        }
    }

    public void removeAnimationListener() {
        this.mAnimationListener = null;
        this.mRenderer.setNativeAnimationListener(null);
    }

    public boolean hasAnimationListener() {
        return this.mAnimationListener != null;
    }

    public void start(SphanRenderer sphanRenderer, @Nullable Runnable runnable) {
        this.mRenderer = sphanRenderer;
        setRenderer(this, runnable);
    }

    @Override // com.sonymobile.scan3d.NativeGLTextureView
    public void onResume() {
        super.onResume();
        requestRender();
    }

    @Override // com.sonymobile.scan3d.NativeGLTextureView
    public void onPause() {
        super.onPause();
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent motionEvent) {
        NativeGLTextureView.TouchListener touchListener = this.mTouchListener;
        return !(touchListener == null || touchListener.allowMotion(motionEvent)) || this.mGestureHandler.handleEvent(motionEvent) || super.onTouchEvent(motionEvent);
    }

    @Override // com.sonymobile.scan3d.viewer.GestureHandler.GestureListener
    public boolean onTransform(float f, float f2, float f3, float f4, float f5, float f6, float f7) {
        this.mRenderer.transform(-f, -f2, -f3, f5, -f4, f6, f7);
        requestRender();
        return true;
    }

    @Override // com.sonymobile.scan3d.viewer.GestureHandler.GestureListener
    public boolean onMoveSingleTap(float f, float f2) {
        this.mRenderer.touchDrag(f, f2);
        requestRender();
        return true;
    }

    @Override // com.sonymobile.scan3d.viewer.GestureHandler.GestureListener
    public final boolean onDoubleTap() {
        this.mRenderer.resetView();
        requestRender();
        return true;
    }

    @Override // com.sonymobile.scan3d.viewer.GestureHandler.GestureListener
    public final boolean onSingleTap() {
        NativeGLTextureView.TouchListener touchListener = this.mTouchListener;
        if (touchListener == null) {
            return true;
        }
        touchListener.onSingleTouch();
        return true;
    }

    @Override // com.sonymobile.scan3d.viewer.GestureHandler.GestureListener
    public final boolean onFling(float f, float f2) {
        if (Math.abs(f) <= VELOCITY_MIN && Math.abs(f2) <= VELOCITY_MIN) {
            return true;
        }
        this.mRenderer.onFling(f, f2);
        return true;
    }

    @Override // com.sonymobile.scan3d.viewer.GestureHandler.GestureListener
    public boolean onDown() {
        return this.mRenderer.onDown();
    }

    @Override // com.sonymobile.scan3d.Sphan.NativeAnimationListener
    public void animationStopped(final int i) {
        new Handler(Looper.getMainLooper()).post(() -> lambda$animationStopped$0(this, i));
    }

    public static /* synthetic */ void lambda$animationStopped$0(SphanGLTextureView sphanGLTextureView, int i) {
        AnimationListener animationListener = sphanGLTextureView.mAnimationListener;
        if (animationListener != null) {
            animationListener.onAnimationStopped(i);
        }
    }
}
