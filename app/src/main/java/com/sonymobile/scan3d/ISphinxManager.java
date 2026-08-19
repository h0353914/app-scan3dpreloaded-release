package com.sonymobile.scan3d;

import android.net.Uri;
import android.util.Size;
import android.view.Surface;

/* JADX INFO: loaded from: classes.dex */
interface ISphinxManager {

    public interface ISphinxListener {
        void onCameraOpened(boolean z);

        void onCameraTemperatureShutdown(boolean z);

        void onErrorsReceived(EnvironmentError[] environmentErrorArr);

        void onFinished(Uri uri);

        void onHintReceived(SphinxHint sphinxHint);

        void onRestarting();

        void onStarted();
    }

    void clearEnvironmentErrors();

    void onSurfaceUpdate(boolean z, Surface surface, Size size);

    void registerListener(ISphinxListener iSphinxListener);

    void restart();

    void setBlobScale(float f);

    void setCameraTemperature(SphinxCameraTemperatureState sphinxCameraTemperatureState);

    void setLocaleIsRTL(boolean z);

    void setManualFocusPosition(int i);

    void setNextDebugMode();

    void setNextState(boolean z);

    void start(int i);
}
