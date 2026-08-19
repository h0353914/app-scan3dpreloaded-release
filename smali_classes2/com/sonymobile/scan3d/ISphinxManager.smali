.class interface abstract Lcom/sonymobile/scan3d/ISphinxManager;
.super Ljava/lang/Object;
.source "ISphinxManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/ISphinxManager$ISphinxListener;
    }
.end annotation


# virtual methods
.method public abstract clearEnvironmentErrors()V
.end method

.method public abstract onSurfaceUpdate(ZLandroid/view/Surface;Landroid/util/Size;)V
.end method

.method public abstract registerListener(Lcom/sonymobile/scan3d/ISphinxManager$ISphinxListener;)V
.end method

.method public abstract restart()V
.end method

.method public abstract setBlobScale(F)V
.end method

.method public abstract setCameraTemperature(Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;)V
.end method

.method public abstract setLocaleIsRTL(Z)V
.end method

.method public abstract setManualFocusPosition(I)V
.end method

.method public abstract setNextDebugMode()V
.end method

.method public abstract setNextState(Z)V
.end method

.method public abstract start(I)V
.end method
