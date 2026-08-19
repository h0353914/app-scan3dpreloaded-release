package com.sonymobile.scan3d.viewer;

import android.content.Context;
import android.util.AttributeSet;
import android.view.MotionEvent;
import com.sonymobile.scan3d.GLThread;
import com.sonymobile.scan3d.NativeGLTextureView;
import com.sonymobile.scan3d.ScenoID;
import java.util.Iterator;
import java.util.Vector;

/* JADX INFO: loaded from: classes.dex */
public class BlenderGLTextureView extends NativeGLTextureView implements GestureHandler.GestureListener, MeshRenderer.OnStopFlingListener, GLThread.Renderer {
    private static final float VELOCITY_MIN = 1500.0f;
    private FaceBlender mFaceBlender;
    protected GestureHandler mGestureHandler;
    protected Vector<SurfaceListener> mSurfaceListeners;
    protected NativeGLTextureView.TouchListener mTouchListener;

    public interface SurfaceListener {
        void onSurfaceChanged(int i, int i2);

        void onSurfaceCreated();

        void onSurfaceDestroyed();
    }

    @Override // com.sonymobile.scan3d.viewer.GestureHandler.GestureListener
    public final boolean onSingleTap() {
        return true;
    }

    public BlenderGLTextureView(Context context) {
        super(context);
        this.mSurfaceListeners = new Vector<>();
        this.mGestureHandler = new GestureHandler(context, this);
    }

    public BlenderGLTextureView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.mSurfaceListeners = new Vector<>();
        this.mGestureHandler = new GestureHandler(context, this);
    }

    public void start(FaceBlender faceBlender, ScenoID scenoID) {
        this.mFaceBlender = faceBlender;
        setRenderer(this, null);
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

    @Override // com.sonymobile.scan3d.GLThread.Renderer
    public void onSurfaceCreated() {
        this.mFaceBlender.onSurfaceCreated();
        Iterator<SurfaceListener> it = this.mSurfaceListeners.iterator();
        while (it.hasNext()) {
            it.next().onSurfaceCreated();
        }
    }

    @Override // com.sonymobile.scan3d.GLThread.Renderer
    public void onSurfaceChanged(int i, int i2) {
        this.mFaceBlender.onSurfaceChanged(i, i2);
        Iterator<SurfaceListener> it = this.mSurfaceListeners.iterator();
        while (it.hasNext()) {
            it.next().onSurfaceChanged(i, i2);
        }
        requestRender();
    }

    @Override // com.sonymobile.scan3d.GLThread.Renderer
    public boolean onDrawFrame(float f) {
        return this.mFaceBlender.onDrawFrame(f);
    }

    @Override // com.sonymobile.scan3d.GLThread.Renderer
    public void onSurfaceDestroyed() {
        Iterator<SurfaceListener> it = this.mSurfaceListeners.iterator();
        while (it.hasNext()) {
            it.next().onSurfaceDestroyed();
        }
        this.mFaceBlender.onSurfaceDestroyed();
    }

    public void setTouchListener(NativeGLTextureView.TouchListener touchListener) {
        this.mTouchListener = touchListener;
    }

    public void addSurfaceListener(SurfaceListener surfaceListener) {
        this.mSurfaceListeners.add(surfaceListener);
    }

    @Override // com.sonymobile.scan3d.viewer.GestureHandler.GestureListener
    public boolean onTransform(float f, float f2, float f3, float f4, float f5, float f6, float f7) {
        boolean zTransform = this.mFaceBlender.transform(-f, -f2, -f3, -f5, f4, f6, f7);
        requestRender();
        return zTransform;
    }

    @Override // com.sonymobile.scan3d.viewer.GestureHandler.GestureListener
    public boolean onMoveSingleTap(float f, float f2) {
        boolean z = this.mFaceBlender.touchDrag(f, f2);
        requestRender();
        return z;
    }

    @Override // com.sonymobile.scan3d.viewer.GestureHandler.GestureListener
    public final boolean onDoubleTap() {
        boolean zResetView = this.mFaceBlender.resetView();
        requestRender();
        return zResetView;
    }

    @Override // com.sonymobile.scan3d.viewer.GestureHandler.GestureListener
    public final boolean onFling(float f, float f2) {
        if (Math.abs(f) <= VELOCITY_MIN && Math.abs(f2) <= VELOCITY_MIN) {
            return true;
        }
        this.mFaceBlender.onFling(f, f2);
        return true;
    }

    @Override // com.sonymobile.scan3d.viewer.GestureHandler.GestureListener
    public boolean onDown() {
        return this.mFaceBlender.onDown();
    }

    @Override // com.sonymobile.scan3d.viewer.MeshRenderer.OnStopFlingListener
    public void onStopFling() {
        this.mFaceBlender.onStopFling();
    }
}
