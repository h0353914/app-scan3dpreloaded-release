.class public Lcom/sonymobile/scan3d/storageservice/ui/upload/InfoFragment;
.super Lcom/sonymobile/scan3d/storageservice/ui/upload/ListenableDialogFragment;
.source "InfoFragment.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/sonymobile/scan3d/storageservice/ui/upload/ListenableDialogFragment<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# static fields
.field private static final KEY_DESCRIPTION_TEXT:Ljava/lang/String; = "description_text"

.field private static final KEY_LOGO:Ljava/lang/String; = "logo"

.field private static final KEY_NEGATIVE_BUTTON_TEXT:Ljava/lang/String; = "negative_button_text"

.field private static final KEY_POSITIVE_BUTTON_TEXT:Ljava/lang/String; = "positive_button_text"

.field private static final KEY_TITLE_TEXT:Ljava/lang/String; = "title"

.field private static final NO_RES_ID:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 22
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ListenableDialogFragment;-><init>()V

    return-void
.end method

.method public static newInstance(IIIIII)Lcom/sonymobile/scan3d/storageservice/ui/upload/InfoFragment;
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param
    .param p2    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param
    .param p3    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param
    .param p4    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param
    .param p5    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 74
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "id"

    .line 75
    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p0, "title"

    .line 76
    invoke-virtual {v0, p0, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p0, "logo"

    .line 77
    invoke-virtual {v0, p0, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p0, "description_text"

    .line 78
    invoke-virtual {v0, p0, p3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p0, "positive_button_text"

    .line 79
    invoke-virtual {v0, p0, p4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p0, "negative_button_text"

    .line 80
    invoke-virtual {v0, p0, p5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 82
    new-instance p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/InfoFragment;

    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/InfoFragment;-><init>()V

    .line 83
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/InfoFragment;->setArguments(Landroid/os/Bundle;)V

    return-object p0
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 0

    .line 138
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/InfoFragment;->onDismiss()V

    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 7
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 91
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/InfoFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    const v0, 0x7f110132

    .line 92
    invoke-virtual {p1, v0}, Landroid/app/Activity;->setTheme(I)V

    .line 95
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/InfoFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "logo"

    .line 96
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    const-string v2, "title"

    .line 97
    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    const-string v3, "description_text"

    .line 98
    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v3

    const-string v4, "positive_button_text"

    .line 99
    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v4

    const-string v5, "negative_button_text"

    const/4 v6, 0x0

    .line 100
    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 102
    new-instance v5, Landroidx/appcompat/app/AlertDialog$Builder;

    invoke-direct {v5, p1}, Landroidx/appcompat/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 103
    invoke-virtual {v5, v2}, Landroidx/appcompat/app/AlertDialog$Builder;->setTitle(I)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object p1

    .line 104
    invoke-virtual {p1, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setIcon(I)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object p1

    .line 105
    invoke-virtual {p1, v3}, Landroidx/appcompat/app/AlertDialog$Builder;->setMessage(I)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v1, Lcom/sonymobile/scan3d/storageservice/ui/upload/InfoFragment$1;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/InfoFragment$1;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/upload/InfoFragment;)V

    .line 106
    invoke-virtual {p1, v4, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object p1

    if-eqz v0, :cond_0

    .line 121
    new-instance v1, Lcom/sonymobile/scan3d/storageservice/ui/upload/InfoFragment$2;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/InfoFragment$2;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/upload/InfoFragment;)V

    invoke-virtual {p1, v0, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 133
    :cond_0
    invoke-virtual {p1}, Landroidx/appcompat/app/AlertDialog$Builder;->create()Landroidx/appcompat/app/AlertDialog;

    move-result-object p1

    return-object p1
.end method
