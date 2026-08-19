.class public interface abstract Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$ErrorDialogCallback;
.super Ljava/lang/Object;
.source "EnvironmentErrorsDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/EnvironmentErrorsDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "ErrorDialogCallback"
.end annotation


# virtual methods
.method public abstract getErrors()[Lcom/sonymobile/scan3d/EnvironmentError;
.end method

.method public abstract onErrorShown(Lcom/sonymobile/scan3d/EnvironmentError;Z)V
.end method

.method public abstract onIgnoreErrors()V
.end method

.method public abstract onRestartScanClicked(Z)V
.end method
