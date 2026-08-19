package com.sonymobile.scan3d.editor;

import com.sonymobile.scan3d.FxManagerEffects;
import com.sonymobile.scan3d.FxType;
import com.sonymobile.scan3d.viewer.MeshRenderer;
import com.sonymobile.scan3d.viewer.ModelContainer;

public class FxManager {
    private long mNativeHandle;

    static {
        classInit();
    }

    public FxManager(ModelContainer modelContainer, MeshRenderer meshRenderer) {
        mNativeHandle = create(modelContainer.getNativeHandle(), meshRenderer.getNativeHandle());
    }

    private native void beginImpl(int effect);

    private static native void classInit();

    private static native long create(long modelHandle, long rendererHandle);

    private native void destroy();

    private native int getTypeImpl();

    public void begin(FxManagerEffects effect) {
        beginImpl(effect.ordinal());
    }

    public native void doAction();

    public native void end(boolean apply);

    public native int getEffectCount();

    public native int getParamCount();

    public native float getParamValue(int index);

    public FxType getType() {
        return FxType.values()[getTypeImpl()];
    }

    public native boolean isChanged();

    public native boolean isParamChanged(int index);

    public void release() {
        destroy();
        mNativeHandle = 0;
    }

    public native void restoreParams();

    public native void saveParams();

    public native void setParamValue(int index, float value);

    public native void updateModel();
}
