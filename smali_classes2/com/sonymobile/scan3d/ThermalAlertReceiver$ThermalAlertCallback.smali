.class public interface abstract Lcom/sonymobile/scan3d/ThermalAlertReceiver$ThermalAlertCallback;
.super Ljava/lang/Object;
.source "ThermalAlertReceiver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/ThermalAlertReceiver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "ThermalAlertCallback"
.end annotation


# virtual methods
.method public abstract cameraGettingHot()V
.end method

.method public abstract cameraOverheated()V
.end method

.method public abstract cameraTooHotToStart()V
.end method
