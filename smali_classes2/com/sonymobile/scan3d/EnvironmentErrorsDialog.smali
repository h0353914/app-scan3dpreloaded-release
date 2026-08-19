.class public Lcom/sonymobile/scan3d/EnvironmentErrorsDialog;
.super Landroidx/fragment/app/DialogFragment;
.source "EnvironmentErrorsDialog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$UnevenLightFragment;,
        Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$BadLoopClosureFragment;,
        Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$BadTextureFragment;,
        Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$BadLightFragment;,
        Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$ErrorAdapter;,
        Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$ErrorDialogCallback;
    }
.end annotation


# instance fields
.field private mCallback:Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$ErrorDialogCallback;

.field private mErrors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/EnvironmentError;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 50
    invoke-direct {p0}, Landroidx/fragment/app/DialogFragment;-><init>()V

    .line 51
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog;->mErrors:Ljava/util/List;

    return-void
.end method

.method public static synthetic lambda$onCreateDialog$0(Lcom/sonymobile/scan3d/EnvironmentErrorsDialog;Landroid/content/DialogInterface;)V
    .locals 1

    .line 69
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog;->getDialog()Landroid/app/Dialog;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    .line 70
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getSystemUiVisibility()I

    move-result v0

    .line 69
    invoke-virtual {p1, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 71
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog;->getDialog()Landroid/app/Dialog;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/Window;->clearFlags(I)V

    return-void
.end method

.method public static synthetic lambda$onViewCreated$1(Lcom/sonymobile/scan3d/EnvironmentErrorsDialog;Landroid/view/View;)V
    .locals 1

    .line 112
    iget-object p1, p0, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog;->mCallback:Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$ErrorDialogCallback;

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$ErrorDialogCallback;->onRestartScanClicked(Z)V

    .line 113
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog;->dismiss()V

    return-void
.end method

.method public static synthetic lambda$onViewCreated$2(Lcom/sonymobile/scan3d/EnvironmentErrorsDialog;Landroid/view/View;)V
    .locals 0

    .line 116
    iget-object p1, p0, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog;->mCallback:Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$ErrorDialogCallback;

    invoke-interface {p1}, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$ErrorDialogCallback;->onIgnoreErrors()V

    .line 117
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog;->dismiss()V

    return-void
.end method


# virtual methods
.method public onAttach(Landroid/content/Context;)V
    .locals 4

    .line 79
    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onAttach(Landroid/content/Context;)V

    .line 80
    instance-of v0, p1, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$ErrorDialogCallback;

    if-eqz v0, :cond_1

    .line 81
    check-cast p1, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$ErrorDialogCallback;

    iput-object p1, p0, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog;->mCallback:Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$ErrorDialogCallback;

    .line 82
    iget-object p1, p0, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog;->mCallback:Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$ErrorDialogCallback;

    invoke-interface {p1}, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$ErrorDialogCallback;->getErrors()[Lcom/sonymobile/scan3d/EnvironmentError;

    move-result-object p1

    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    aget-object v2, p1, v1

    .line 83
    iget-boolean v3, v2, Lcom/sonymobile/scan3d/EnvironmentError;->critical:Z

    if-eqz v3, :cond_0

    .line 84
    iget-object v3, p0, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog;->mErrors:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 0
    .param p1    # Landroid/content/DialogInterface;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 123
    iget-object p1, p0, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog;->mCallback:Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$ErrorDialogCallback;

    invoke-interface {p1}, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$ErrorDialogCallback;->onIgnoreErrors()V

    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    const/4 p1, 0x0

    .line 57
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog;->setCancelable(Z)V

    .line 59
    new-instance v0, Landroid/app/Dialog;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    const v2, 0x7f110132

    invoke-direct {v0, v1, v2}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 60
    invoke-virtual {v0, p1}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 67
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/16 v1, 0x8

    invoke-virtual {p1, v1}, Landroid/view/Window;->addFlags(I)V

    .line 68
    new-instance p1, Lcom/sonymobile/scan3d/-$$Lambda$EnvironmentErrorsDialog$o6cy7EQKfpMtewztrWO5WeVGzww;

    invoke-direct {p1, p0}, Lcom/sonymobile/scan3d/-$$Lambda$EnvironmentErrorsDialog$o6cy7EQKfpMtewztrWO5WeVGzww;-><init>(Lcom/sonymobile/scan3d/EnvironmentErrorsDialog;)V

    invoke-virtual {v0, p1}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    return-object v0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1
    .param p1    # Landroid/view/LayoutInflater;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const p3, 0x7f0c0056

    const/4 v0, 0x0

    .line 95
    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 4
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 100
    invoke-super {p0, p1, p2}, Landroidx/fragment/app/DialogFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    const p2, 0x7f09021b

    .line 102
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroidx/viewpager/widget/ViewPager;

    .line 104
    new-instance v0, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$ErrorAdapter;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    iget-object v2, p0, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog;->mErrors:Ljava/util/List;

    iget-object v3, p0, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog;->mCallback:Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$ErrorDialogCallback;

    invoke-direct {v0, v1, v2, v3}, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$ErrorAdapter;-><init>(Landroidx/fragment/app/FragmentManager;Ljava/util/List;Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$ErrorDialogCallback;)V

    .line 105
    invoke-virtual {p2, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Landroidx/viewpager/widget/PagerAdapter;)V

    .line 107
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Configuration;->getLayoutDirection()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 108
    invoke-virtual {v0}, Landroidx/viewpager/widget/PagerAdapter;->getCount()I

    move-result v0

    sub-int/2addr v0, v2

    invoke-virtual {p2, v0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    :cond_0
    const p2, 0x7f09007c

    .line 111
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    new-instance v0, Lcom/sonymobile/scan3d/-$$Lambda$EnvironmentErrorsDialog$T-nZWZBlBhAqjKzqdRPsj0mPJs0;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/-$$Lambda$EnvironmentErrorsDialog$T-nZWZBlBhAqjKzqdRPsj0mPJs0;-><init>(Lcom/sonymobile/scan3d/EnvironmentErrorsDialog;)V

    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p2, 0x7f090078

    .line 115
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    new-instance p2, Lcom/sonymobile/scan3d/-$$Lambda$EnvironmentErrorsDialog$xLGZIiYJWLJxn84luTEGFdfT6io;

    invoke-direct {p2, p0}, Lcom/sonymobile/scan3d/-$$Lambda$EnvironmentErrorsDialog$xLGZIiYJWLJxn84luTEGFdfT6io;-><init>(Lcom/sonymobile/scan3d/EnvironmentErrorsDialog;)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
