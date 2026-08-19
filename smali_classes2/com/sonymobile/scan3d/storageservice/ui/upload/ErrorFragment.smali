.class public Lcom/sonymobile/scan3d/storageservice/ui/upload/ErrorFragment;
.super Lcom/sonymobile/scan3d/storageservice/ui/upload/ListenableDialogFragment;
.source "ErrorFragment.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/sonymobile/scan3d/storageservice/ui/upload/ListenableDialogFragment<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# static fields
.field private static final ARG_MESSAGE:Ljava/lang/String; = "message"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ListenableDialogFragment;-><init>()V

    return-void
.end method

.method private getMessage()Ljava/lang/String;
    .locals 2

    .line 76
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ErrorFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "message"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static newInstance(ILjava/lang/String;)Lcom/sonymobile/scan3d/storageservice/ui/upload/ErrorFragment;
    .locals 2

    .line 34
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "id"

    .line 35
    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p0, "message"

    .line 36
    invoke-virtual {v0, p0, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    new-instance p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ErrorFragment;

    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ErrorFragment;-><init>()V

    .line 39
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ErrorFragment;->setArguments(Landroid/os/Bundle;)V

    return-object p0
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 0

    .line 67
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ErrorFragment;->onCancel()V

    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 2

    .line 46
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ErrorFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    const v0, 0x7f110132

    .line 47
    invoke-virtual {p1, v0}, Landroid/app/Activity;->setTheme(I)V

    .line 49
    new-instance v0, Landroidx/appcompat/app/AlertDialog$Builder;

    invoke-direct {v0, p1}, Landroidx/appcompat/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 50
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ErrorFragment;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroidx/appcompat/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ErrorFragment$1;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ErrorFragment$1;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/upload/ErrorFragment;)V

    const v1, 0x104000a

    .line 51
    invoke-virtual {p1, v1, v0}, Landroidx/appcompat/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object p1

    .line 62
    invoke-virtual {p1}, Landroidx/appcompat/app/AlertDialog$Builder;->create()Landroidx/appcompat/app/AlertDialog;

    move-result-object p1

    return-object p1
.end method
