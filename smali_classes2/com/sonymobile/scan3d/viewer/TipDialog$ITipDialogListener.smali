.class public interface abstract Lcom/sonymobile/scan3d/viewer/TipDialog$ITipDialogListener;
.super Ljava/lang/Object;
.source "TipDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/TipDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "ITipDialogListener"
.end annotation


# virtual methods
.method public abstract onTipNegative()V
.end method

.method public abstract onTipPositive(Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;)V
.end method
