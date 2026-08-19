.class public interface abstract Lcom/sonymobile/scan3d/ISphinxManager$ISphinxListener;
.super Ljava/lang/Object;
.source "ISphinxManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/ISphinxManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "ISphinxListener"
.end annotation


# virtual methods
.method public abstract onCameraOpened(Z)V
.end method

.method public abstract onCameraTemperatureShutdown(Z)V
.end method

.method public abstract onErrorsReceived([Lcom/sonymobile/scan3d/EnvironmentError;)V
.end method

.method public abstract onFinished(Landroid/net/Uri;)V
.end method

.method public abstract onHintReceived(Lcom/sonymobile/scan3d/SphinxHint;)V
.end method

.method public abstract onRestarting()V
.end method

.method public abstract onStarted()V
.end method
