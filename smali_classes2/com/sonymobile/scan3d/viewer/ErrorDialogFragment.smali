.class public abstract Lcom/sonymobile/scan3d/viewer/ErrorDialogFragment;
.super Landroidx/fragment/app/DialogFragment;
.source "ErrorDialogFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Landroidx/fragment/app/DialogFragment;-><init>()V

    return-void
.end method

.method public static synthetic lambda$onCreateDialog$0(Lcom/sonymobile/scan3d/viewer/ErrorDialogFragment;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 39
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/ErrorDialogFragment;->onPositiveAnswer()V

    return-void
.end method


# virtual methods
.method protected abstract getMessage()I
    .annotation build Landroidx/annotation/StringRes;
    .end annotation
.end method

.method protected getNegativeButton()I
    .locals 1
    .annotation build Landroidx/annotation/StringRes;
    .end annotation

    const/high16 v0, 0x1040000

    return v0
.end method

.method protected getPositiveButton()I
    .locals 1
    .annotation build Landroidx/annotation/StringRes;
    .end annotation

    const v0, 0x104000a

    return v0
.end method

.method protected abstract getProviderName()I
    .annotation build Landroidx/annotation/StringRes;
    .end annotation
.end method

.method protected abstract getTitle()I
    .annotation build Landroidx/annotation/StringRes;
    .end annotation
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 6
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InflateParams"
        }
    .end annotation

    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 29
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/ErrorDialogFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const/4 v0, 0x0

    const/4 v1, 0x0

    const v2, 0x7f0c0051

    invoke-virtual {p1, v2, v1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const v2, 0x7f090124

    .line 31
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 32
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/ErrorDialogFragment;->getMessage()I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/sonymobile/scan3d/viewer/ErrorDialogFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/ErrorDialogFragment;->getProviderName()I

    move-result v5

    invoke-virtual {p0, v5}, Lcom/sonymobile/scan3d/viewer/ErrorDialogFragment;->getString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v0

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 34
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/ErrorDialogFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    .line 35
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 36
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/ErrorDialogFragment;->getTitle()I

    move-result v0

    invoke-virtual {v2, v0}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 37
    invoke-virtual {v2, p1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 38
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/ErrorDialogFragment;->getPositiveButton()I

    move-result p1

    if-eqz p1, :cond_0

    .line 39
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/ErrorDialogFragment;->getPositiveButton()I

    move-result p1

    new-instance v0, Lcom/sonymobile/scan3d/viewer/-$$Lambda$ErrorDialogFragment$g-LxVSz4X6Zzva1OQf_RXi4JCjE;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/viewer/-$$Lambda$ErrorDialogFragment$g-LxVSz4X6Zzva1OQf_RXi4JCjE;-><init>(Lcom/sonymobile/scan3d/viewer/ErrorDialogFragment;)V

    invoke-virtual {v2, p1, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 41
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/ErrorDialogFragment;->getNegativeButton()I

    move-result p1

    if-eqz p1, :cond_1

    .line 42
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/ErrorDialogFragment;->getNegativeButton()I

    move-result p1

    invoke-virtual {v2, p1, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 45
    :cond_1
    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    return-object p1
.end method

.method protected abstract onPositiveAnswer()V
.end method
