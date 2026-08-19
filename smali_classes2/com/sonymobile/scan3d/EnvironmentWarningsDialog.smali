.class public Lcom/sonymobile/scan3d/EnvironmentWarningsDialog;
.super Landroidx/fragment/app/DialogFragment;
.source "EnvironmentWarningsDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/EnvironmentWarningsDialog$OnEnvironmentWarnings;
    }
.end annotation


# instance fields
.field private mListener:Lcom/sonymobile/scan3d/EnvironmentWarningsDialog$OnEnvironmentWarnings;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Landroidx/fragment/app/DialogFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/sonymobile/scan3d/EnvironmentWarningsDialog;)Lcom/sonymobile/scan3d/EnvironmentWarningsDialog$OnEnvironmentWarnings;
    .locals 0

    .line 19
    iget-object p0, p0, Lcom/sonymobile/scan3d/EnvironmentWarningsDialog;->mListener:Lcom/sonymobile/scan3d/EnvironmentWarningsDialog$OnEnvironmentWarnings;

    return-object p0
.end method

.method public static synthetic lambda$onCreateDialog$0(Lcom/sonymobile/scan3d/EnvironmentWarningsDialog;Landroid/content/DialogInterface;)V
    .locals 1

    .line 76
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/EnvironmentWarningsDialog;->getDialog()Landroid/app/Dialog;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    .line 77
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/EnvironmentWarningsDialog;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getSystemUiVisibility()I

    move-result v0

    .line 76
    invoke-virtual {p1, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 78
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/EnvironmentWarningsDialog;->getDialog()Landroid/app/Dialog;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/Window;->clearFlags(I)V

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1

    .line 31
    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 32
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/EnvironmentWarningsDialog;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    .line 33
    instance-of v0, p1, Lcom/sonymobile/scan3d/EnvironmentWarningsDialog$OnEnvironmentWarnings;

    if-eqz v0, :cond_0

    .line 34
    check-cast p1, Lcom/sonymobile/scan3d/EnvironmentWarningsDialog$OnEnvironmentWarnings;

    iput-object p1, p0, Lcom/sonymobile/scan3d/EnvironmentWarningsDialog;->mListener:Lcom/sonymobile/scan3d/EnvironmentWarningsDialog$OnEnvironmentWarnings;

    .line 35
    iget-object p1, p0, Lcom/sonymobile/scan3d/EnvironmentWarningsDialog;->mListener:Lcom/sonymobile/scan3d/EnvironmentWarningsDialog$OnEnvironmentWarnings;

    invoke-interface {p1}, Lcom/sonymobile/scan3d/EnvironmentWarningsDialog$OnEnvironmentWarnings;->onDialogDisplayed()V

    :cond_0
    return-void
.end method

.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 0

    .line 92
    iget-object p1, p0, Lcom/sonymobile/scan3d/EnvironmentWarningsDialog;->mListener:Lcom/sonymobile/scan3d/EnvironmentWarningsDialog$OnEnvironmentWarnings;

    invoke-interface {p1}, Lcom/sonymobile/scan3d/EnvironmentWarningsDialog$OnEnvironmentWarnings;->onIgnoreWarnings()V

    return-void
.end method

.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 86
    iget-object p1, p0, Lcom/sonymobile/scan3d/EnvironmentWarningsDialog;->mListener:Lcom/sonymobile/scan3d/EnvironmentWarningsDialog$OnEnvironmentWarnings;

    invoke-interface {p1}, Lcom/sonymobile/scan3d/EnvironmentWarningsDialog$OnEnvironmentWarnings;->onShowErrors()V

    .line 87
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/EnvironmentWarningsDialog;->dismiss()V

    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 42
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/EnvironmentWarningsDialog;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    const v0, 0x7f110132

    .line 43
    invoke-virtual {p1, v0}, Landroid/app/Activity;->setTheme(I)V

    .line 44
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const p1, 0x7f1000d2

    .line 45
    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    const p1, 0x7f1000cf

    .line 46
    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    const p1, 0x7f1000d1

    .line 47
    invoke-virtual {v0, p1, p0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    const/4 p1, 0x0

    .line 49
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/EnvironmentWarningsDialog;->setCancelable(Z)V

    .line 51
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 52
    invoke-virtual {v0, p1}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 53
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    new-instance v1, Lcom/sonymobile/scan3d/EnvironmentWarningsDialog$1;

    invoke-direct {v1, p0, v0}, Lcom/sonymobile/scan3d/EnvironmentWarningsDialog$1;-><init>(Lcom/sonymobile/scan3d/EnvironmentWarningsDialog;Landroid/view/Window$Callback;)V

    invoke-virtual {p1, v1}, Landroid/view/Window;->setCallback(Landroid/view/Window$Callback;)V

    .line 74
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/16 v1, 0x8

    invoke-virtual {p1, v1}, Landroid/view/Window;->addFlags(I)V

    .line 75
    new-instance p1, Lcom/sonymobile/scan3d/-$$Lambda$EnvironmentWarningsDialog$2HZrTFmHYPhu-fTBT9zw68CULSE;

    invoke-direct {p1, p0}, Lcom/sonymobile/scan3d/-$$Lambda$EnvironmentWarningsDialog$2HZrTFmHYPhu-fTBT9zw68CULSE;-><init>(Lcom/sonymobile/scan3d/EnvironmentWarningsDialog;)V

    invoke-virtual {v0, p1}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    return-object v0
.end method
