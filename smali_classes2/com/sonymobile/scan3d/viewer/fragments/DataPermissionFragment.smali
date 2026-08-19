.class public Lcom/sonymobile/scan3d/viewer/fragments/DataPermissionFragment;
.super Lcom/sonymobile/scan3d/storageservice/ui/upload/ListenableDialogFragment;
.source "DataPermissionFragment.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/sonymobile/scan3d/storageservice/ui/upload/ListenableDialogFragment<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# static fields
.field public static final GENERIC_RESULT:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ListenableDialogFragment;-><init>()V

    return-void
.end method

.method public static synthetic lambda$onCreateDialog$0(Lcom/sonymobile/scan3d/viewer/fragments/DataPermissionFragment;Landroid/content/DialogInterface;I)V
    .locals 0

    const/4 p1, 0x0

    .line 46
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/DataPermissionFragment;->onSuccess(Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic lambda$onCreateDialog$1(Lcom/sonymobile/scan3d/viewer/fragments/DataPermissionFragment;Landroid/content/DialogInterface;I)V
    .locals 0

    const/4 p1, 0x0

    .line 47
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/DataPermissionFragment;->onFailure(I)V

    return-void
.end method

.method public static newInstance(I)Lcom/sonymobile/scan3d/viewer/fragments/DataPermissionFragment;
    .locals 2

    .line 32
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "id"

    .line 33
    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 35
    new-instance p0, Lcom/sonymobile/scan3d/viewer/fragments/DataPermissionFragment;

    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/DataPermissionFragment;-><init>()V

    .line 36
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/DataPermissionFragment;->setArguments(Landroid/os/Bundle;)V

    return-object p0
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 0

    const/4 p1, 0x0

    .line 52
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/DataPermissionFragment;->onFailure(I)V

    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 3

    .line 42
    new-instance p1, Landroid/app/AlertDialog$Builder;

    new-instance v0, Landroid/view/ContextThemeWrapper;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/DataPermissionFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    const v2, 0x7f11013e

    invoke-direct {v0, v1, v2}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    invoke-direct {p1, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v0, 0x7f10005d

    .line 44
    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const v0, 0x7f1000c4

    .line 45
    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$DataPermissionFragment$n5nyXijG134ZGi1y3THCtT-3O5I;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$DataPermissionFragment$n5nyXijG134ZGi1y3THCtT-3O5I;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/DataPermissionFragment;)V

    const v1, 0x7f1000af

    .line 46
    invoke-virtual {p1, v1, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$DataPermissionFragment$LPmHu0bCL24-g4HdEYYDjrabQ7s;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$DataPermissionFragment$LPmHu0bCL24-g4HdEYYDjrabQ7s;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/DataPermissionFragment;)V

    const v1, 0x7f1000c7

    .line 47
    invoke-virtual {p1, v1, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    return-object p1
.end method
