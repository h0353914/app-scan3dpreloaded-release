.class public abstract Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;
.super Landroidx/fragment/app/Fragment;
.source "BaseViewerFragment.java"

# interfaces
.implements Lcom/sonymobile/scan3d/OnBackPressListener;
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;
    }
.end annotation


# static fields
.field private static final KEY_FULLSCREEN_ENABLED:Ljava/lang/String; = "FULLSCREEN_ENABLED"


# instance fields
.field protected mActivityInterface:Lcom/sonymobile/scan3d/viewer/fragments/ViewerActivityInterface;

.field private mControlsView:Landroid/view/View;

.field private mIsFullscreen:Z

.field private mProgressDialog:Lcom/sonymobile/scan3d/widgets/SphinxProgressDialog;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 72
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    return-void
.end method

.method public static synthetic lambda$onCreateView$0(Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;Landroid/view/View;)V
    .locals 0

    .line 119
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->onNavigationClick()V

    return-void
.end method

.method public static synthetic lambda$onCreateView$1(Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;Landroid/view/View;)V
    .locals 0

    .line 125
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->onActionClick()V

    return-void
.end method


# virtual methods
.method allowProgressDialogCancellation()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public dismissProgressDialog()V
    .locals 1

    .line 252
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->mProgressDialog:Lcom/sonymobile/scan3d/widgets/SphinxProgressDialog;

    if-eqz v0, :cond_0

    .line 253
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/widgets/SphinxProgressDialog;->dismiss()V

    :cond_0
    return-void
.end method

.method exitFullscreen()V
    .locals 2

    const/4 v0, 0x0

    .line 198
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->mIsFullscreen:Z

    .line 202
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x700

    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    return-void
.end method

.method public abstract getContentLayout()I
    .annotation build Landroidx/annotation/LayoutRes;
    .end annotation
.end method

.method getControlsView()I
    .locals 1
    .annotation build Landroidx/annotation/IdRes;
    .end annotation

    const/4 v0, 0x0

    return v0
.end method

.method public getNavigationAccessibility()I
    .locals 1
    .annotation build Landroidx/annotation/StringRes;
    .end annotation

    const v0, 0x7f10002a

    return v0
.end method

.method public getNavigationDrawable()I
    .locals 1
    .annotation build Landroidx/annotation/DrawableRes;
    .end annotation

    const v0, 0x7f0800cb

    return v0
.end method

.method protected getTitleId()I
    .locals 1
    .annotation build Landroidx/annotation/StringRes;
    .end annotation

    const/4 v0, 0x0

    return v0
.end method

.method public getTitleText()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method protected getToolBarActionText()I
    .locals 1
    .annotation build Landroidx/annotation/StringRes;
    .end annotation

    const/4 v0, 0x0

    return v0
.end method

.method protected handleFailedMesh()V
    .locals 3

    .line 261
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 262
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->mProgressDialog:Lcom/sonymobile/scan3d/widgets/SphinxProgressDialog;

    if-eqz v0, :cond_0

    .line 263
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/widgets/SphinxProgressDialog;->dismiss()V

    .line 265
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f100363

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 266
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->finish()V

    :cond_1
    return-void
.end method

.method isFullScreen()Z
    .locals 1

    .line 211
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->mIsFullscreen:Z

    return v0
.end method

.method protected onActionClick()V
    .locals 0

    return-void
.end method

.method public onAttach(Landroid/content/Context;)V
    .locals 0

    .line 78
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onAttach(Landroid/content/Context;)V

    .line 79
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    check-cast p1, Lcom/sonymobile/scan3d/viewer/fragments/ViewerActivityInterface;

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->mActivityInterface:Lcom/sonymobile/scan3d/viewer/fragments/ViewerActivityInterface;

    return-void
.end method

.method public onBackPressed()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 0

    .line 441
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentActivity;->onBackPressed()V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 84
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    if-eqz p1, :cond_0

    const-string v0, "FULLSCREEN_ENABLED"

    const/4 v1, 0x0

    .line 86
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iput-boolean p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->mIsFullscreen:Z

    :cond_0
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1
    .param p1    # Landroid/view/LayoutInflater;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 94
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->getContentLayout()I

    move-result p3

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 96
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->showToolbar()Z

    move-result p2

    if-eqz p2, :cond_4

    const p2, 0x7f0901f8

    .line 97
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/Toolbar;

    .line 99
    invoke-virtual {p2, v0}, Landroid/widget/Toolbar;->setVisibility(I)V

    .line 101
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->getTitleId()I

    move-result p3

    if-eqz p3, :cond_0

    .line 103
    invoke-virtual {p2, p3}, Landroid/widget/Toolbar;->setTitle(I)V

    goto :goto_0

    .line 104
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->getTitleText()Ljava/lang/String;

    move-result-object p3

    if-eqz p3, :cond_1

    .line 105
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->getTitleText()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/widget/Toolbar;->setTitle(Ljava/lang/CharSequence;)V

    .line 109
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p3

    invoke-virtual {p3, p2}, Landroidx/fragment/app/FragmentActivity;->setActionBar(Landroid/widget/Toolbar;)V

    .line 111
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->getNavigationDrawable()I

    move-result p3

    if-eqz p3, :cond_2

    .line 113
    invoke-virtual {p2, p3}, Landroid/widget/Toolbar;->setNavigationIcon(I)V

    .line 115
    :cond_2
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->getNavigationAccessibility()I

    move-result p3

    if-eqz p3, :cond_3

    .line 117
    invoke-virtual {p2, p3}, Landroid/widget/Toolbar;->setNavigationContentDescription(I)V

    .line 119
    :cond_3
    new-instance p3, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$BaseViewerFragment$MCNiXxB0ubofCwWFbA7mGZfddfY;

    invoke-direct {p3, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$BaseViewerFragment$MCNiXxB0ubofCwWFbA7mGZfddfY;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;)V

    invoke-virtual {p2, p3}, Landroid/widget/Toolbar;->setNavigationOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 121
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->getToolBarActionText()I

    move-result p3

    if-eqz p3, :cond_4

    const p3, 0x7f0900bc

    .line 122
    invoke-virtual {p2, p3}, Landroid/widget/Toolbar;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/Button;

    .line 123
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->getToolBarActionText()I

    move-result p3

    invoke-virtual {p2, p3}, Landroid/widget/Button;->setText(I)V

    .line 124
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->getToolBarActionText()I

    move-result p3

    invoke-virtual {p0, p3}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->getString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 125
    new-instance p3, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$BaseViewerFragment$if7CUQwcZJrYWzoDiKNew95_uYA;

    invoke-direct {p3, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$BaseViewerFragment$if7CUQwcZJrYWzoDiKNew95_uYA;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;)V

    invoke-virtual {p2, p3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 129
    :cond_4
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->getControlsView()I

    move-result p2

    if-lez p2, :cond_5

    .line 131
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->mControlsView:Landroid/view/View;

    .line 132
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->isFullScreen()Z

    move-result p2

    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->showControls(Z)V

    :cond_5
    return-object p1
.end method

.method public onDestroy()V
    .locals 1

    .line 174
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->mProgressDialog:Lcom/sonymobile/scan3d/widgets/SphinxProgressDialog;

    if-eqz v0, :cond_0

    .line 175
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/widgets/SphinxProgressDialog;->dismiss()V

    .line 177
    :cond_0
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroy()V

    return-void
.end method

.method protected onNavigationClick()V
    .locals 1

    .line 393
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->popBackStackImmediate()Z

    move-result v0

    if-nez v0, :cond_0

    .line 394
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->finish()V

    :cond_0
    return-void
.end method

.method public onPause()V
    .locals 1

    .line 162
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onPause()V

    .line 163
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->mActivityInterface:Lcom/sonymobile/scan3d/viewer/fragments/ViewerActivityInterface;

    invoke-interface {v0, p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerActivityInterface;->unregisterOnBackPressListener(Lcom/sonymobile/scan3d/OnBackPressListener;)V

    return-void
.end method

.method public onResume()V
    .locals 3

    .line 140
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onResume()V

    .line 141
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->mActivityInterface:Lcom/sonymobile/scan3d/viewer/fragments/ViewerActivityInterface;

    invoke-interface {v0, p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerActivityInterface;->registerOnBackPressListener(Lcom/sonymobile/scan3d/OnBackPressListener;)V

    .line 142
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 145
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 146
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    const/16 v2, 0x100

    invoke-virtual {v1, v2}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 149
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->requiresFullScreen()Z

    move-result v1

    if-eqz v1, :cond_0

    const/16 v1, 0x600

    .line 152
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 154
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->mIsFullscreen:Z

    if-eqz v0, :cond_0

    .line 155
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->showFullscreen()V

    :cond_0
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    .line 168
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    const-string v0, "FULLSCREEN_ENABLED"

    .line 169
    iget-boolean v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->mIsFullscreen:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method protected requiresFullScreen()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method setToolbarActionVisibility(Z)V
    .locals 2

    .line 276
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->showToolbar()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 277
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->getView()Landroid/view/View;

    move-result-object v0

    const v1, 0x7f0901f8

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Toolbar;

    const v1, 0x7f0900bc

    .line 278
    invoke-virtual {v0, v1}, Landroid/widget/Toolbar;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/16 p1, 0x8

    :goto_0
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    :cond_1
    return-void
.end method

.method showControls(Z)V
    .locals 2

    if-eqz p1, :cond_0

    .line 414
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->showFullscreen()V

    .line 415
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->mControlsView:Landroid/view/View;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 416
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->mControlsView:Landroid/view/View;

    .line 417
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x10a0001

    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 416
    invoke-virtual {p1, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_0

    .line 419
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->exitFullscreen()V

    .line 420
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->mControlsView:Landroid/view/View;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 421
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->mControlsView:Landroid/view/View;

    .line 422
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const/high16 v1, 0x10a0000

    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 421
    invoke-virtual {p1, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    :goto_0
    return-void
.end method

.method showFullscreen()V
    .locals 2

    const/4 v0, 0x1

    .line 184
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->mIsFullscreen:Z

    .line 191
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    const/16 v1, 0xf06

    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    return-void
.end method

.method public showProgressDialog(IZ)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 236
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 237
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->mProgressDialog:Lcom/sonymobile/scan3d/widgets/SphinxProgressDialog;

    if-nez v0, :cond_0

    .line 238
    new-instance v0, Lcom/sonymobile/scan3d/widgets/SphinxProgressDialog;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1, p2}, Lcom/sonymobile/scan3d/widgets/SphinxProgressDialog;-><init>(Landroid/content/Context;IZ)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->mProgressDialog:Lcom/sonymobile/scan3d/widgets/SphinxProgressDialog;

    goto :goto_0

    .line 240
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1, p1, p2}, Lcom/sonymobile/scan3d/widgets/SphinxProgressDialog;->setContent(Landroid/content/Context;IZ)V

    .line 242
    :goto_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->mProgressDialog:Lcom/sonymobile/scan3d/widgets/SphinxProgressDialog;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->allowProgressDialogCancellation()Z

    move-result p2

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/widgets/SphinxProgressDialog;->setCancelable(Z)V

    .line 243
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->mProgressDialog:Lcom/sonymobile/scan3d/widgets/SphinxProgressDialog;

    invoke-virtual {p1, p0}, Lcom/sonymobile/scan3d/widgets/SphinxProgressDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 244
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->mProgressDialog:Lcom/sonymobile/scan3d/widgets/SphinxProgressDialog;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/widgets/SphinxProgressDialog;->show()V

    :cond_1
    return-void
.end method

.method protected showToolbar()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method
