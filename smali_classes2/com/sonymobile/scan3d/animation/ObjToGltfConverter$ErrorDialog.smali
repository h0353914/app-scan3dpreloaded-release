.class public Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$ErrorDialog;
.super Landroidx/fragment/app/DialogFragment;
.source "ObjToGltfConverter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/animation/ObjToGltfConverter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ErrorDialog"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$ErrorDialog$ErrorDialogListener;
    }
.end annotation


# static fields
.field private static final KEY_URI:Ljava/lang/String; = "URI"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 66
    invoke-direct {p0}, Landroidx/fragment/app/DialogFragment;-><init>()V

    return-void
.end method

.method public static synthetic lambda$onCreateDialog$0(Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$ErrorDialog;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 97
    invoke-direct {p0}, Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$ErrorDialog;->sendDismissDialogToTarget()V

    return-void
.end method

.method public static newInstance(Landroid/net/Uri;)Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$ErrorDialog;
    .locals 3

    .line 84
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 85
    new-instance v1, Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$ErrorDialog;

    invoke-direct {v1}, Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$ErrorDialog;-><init>()V

    const-string v2, "URI"

    .line 86
    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 87
    invoke-virtual {v1, v0}, Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$ErrorDialog;->setArguments(Landroid/os/Bundle;)V

    return-object v1
.end method

.method private sendDismissDialogToTarget()V
    .locals 4

    .line 113
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$ErrorDialog;->getTargetFragment()Landroidx/fragment/app/Fragment;

    move-result-object v0

    .line 115
    :try_start_0
    move-object v1, v0

    check-cast v1, Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$ErrorDialog$ErrorDialogListener;

    .line 116
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$ErrorDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string v3, "URI"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Landroid/net/Uri;

    .line 115
    invoke-interface {v1, p0, v2}, Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$ErrorDialog$ErrorDialogListener;->onConvertErrorDialogDismiss(Landroidx/fragment/app/DialogFragment;Landroid/net/Uri;)V
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    .line 118
    :catch_0
    new-instance v1, Ljava/lang/ClassCastException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "must implement ErrorDialogListener"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/ClassCastException;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 0

    .line 105
    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onCancel(Landroid/content/DialogInterface;)V

    .line 106
    invoke-direct {p0}, Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$ErrorDialog;->sendDismissDialogToTarget()V

    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 2

    .line 93
    new-instance p1, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$ErrorDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v0, 0x7f10007d

    .line 94
    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    const v0, 0x7f100056

    .line 95
    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 96
    new-instance v0, Lcom/sonymobile/scan3d/animation/-$$Lambda$ObjToGltfConverter$ErrorDialog$PeoHhdzEmADhB5CffNs8B4l5uT0;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/animation/-$$Lambda$ObjToGltfConverter$ErrorDialog$PeoHhdzEmADhB5CffNs8B4l5uT0;-><init>(Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$ErrorDialog;)V

    const v1, 0x7f1000b6

    invoke-virtual {p1, v1, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 98
    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    const/4 v0, 0x1

    .line 99
    invoke-virtual {p1, v0}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    return-object p1
.end method
