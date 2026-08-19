package com.sonymobile.scan3d;

import android.view.Surface;

/* JADX INFO: loaded from: classes.dex */
abstract class GLEngine {
    private long mGLHandle;
    private Surface mSurface;

    GLEngine() {
    }

    boolean setSurface(Surface surface) {
        if (this.mSurface != surface) {
            long j = this.mGLHandle;
            if (j != 0) {
                NativeEGL.destroyContext(j);
                this.mGLHandle = 0L;
            }
            this.mSurface = surface;
            Surface surface2 = this.mSurface;
            if (surface2 != null) {
                this.mGLHandle = NativeEGL.createContext(surface2, true);
            }
        }
        return this.mGLHandle != 0;
    }

    boolean render(Sphinx sphinx) {
        if (this.mGLHandle == 0) {
            return false;
        }
        sphinx.render();
        NativeEGL.swap(this.mGLHandle);
        return true;
    }
}
