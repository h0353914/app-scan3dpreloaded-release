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
public class ViewerGLTextureView extends NativeGLTextureView implements GestureHandler.GestureListener, MeshRenderer.OnStopFlingListener, GLThread.Renderer {
    private static final float VELOCITY_MIN = 1500.0f;
    private GestureHandler mGestureHandler;
    private MeshRenderer mRenderer;
    private Vector<SurfaceListener> mSurfaceListeners;
    private NativeGLTextureView.TouchListener mTouchListener;

    public interface SurfaceListener {
        void onSurfaceChanged(int i, int i2);

        void onSurfaceCreated();

        void onSurfaceDestroyed();
    }

    @Override // com.sonymobile.scan3d.viewer.MeshRenderer.OnStopFlingListener
    public void onStopFling() {
    }

    public ViewerGLTextureView(Context context) {
        super(context);
        this.mSurfaceListeners = new Vector<>();
        this.mGestureHandler = new GestureHandler(context, this);
    }

    public ViewerGLTextureView(Context context, AttributeSet attributeSet) {
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
        return this.mRenderer.onDrawFrame(f);
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

    public void start(MeshRenderer meshRenderer, ScenoID scenoID) {
        this.mRenderer = meshRenderer;
        this.mRenderer.setScenography(scenoID);
        setRenderer(this, null);
    }

    @Override // com.sonymobile.scan3d.NativeGLTextureView
    public void onResume() {
        super.onResume();
        this.mRenderer.setOnFlingStopListener(this);
        requestRender();
    }

    @Override // com.sonymobile.scan3d.NativeGLTextureView
    public void onPause() {
        this.mRenderer.setOnFlingStopListener(null);
        super.onPause();
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent motionEvent) {
        NativeGLTextureView.TouchListener touchListener = this.mTouchListener;
        return !(touchListener == null || touchListener.allowMotion(motionEvent)) || this.mGestureHandler.handleEvent(motionEvent) || super.onTouchEvent(motionEvent);
    }

    public void setScenography(ScenoID scenoID) {
        MeshRenderer meshRenderer = this.mRenderer;
        if (meshRenderer != null) {
            meshRenderer.setScenography(scenoID);
            if (isAttachedToWindow()) {
                requestRender();
            }
        }
    }

    @Override // com.sonymobile.scan3d.viewer.GestureHandler.GestureListener
    public boolean onTransform(float f, float f2, float f3, float f4, float f5, float f6, float f7) {
        boolean zOnTransform = this.mRenderer.onTransform(f, f2, f3, f4, f5, f6, f7);
        requestRender();
        return zOnTransform;
    }

    @Override // com.sonymobile.scan3d.viewer.GestureHandler.GestureListener
    public boolean onMoveSingleTap(float f, float f2) {
        boolean zOnMoveSingleTap = this.mRenderer.onMoveSingleTap(f, f2);
        requestRender();
        return zOnMoveSingleTap;
    }

    @Override // com.sonymobile.scan3d.viewer.GestureHandler.GestureListener
    public final boolean onDoubleTap() {
        boolean zOnDoubleTap = this.mRenderer.onDoubleTap();
        requestRender();
        return zOnDoubleTap;
    }

    @Override // com.sonymobile.scan3d.viewer.GestureHandler.GestureListener
    public final boolean onSingleTap() {
        NativeGLTextureView.TouchListener touchListener;
        boolean zOnSingleTap = this.mRenderer.onSingleTap();
        if (zOnSingleTap || (touchListener = this.mTouchListener) == null) {
            return zOnSingleTap;
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
}
