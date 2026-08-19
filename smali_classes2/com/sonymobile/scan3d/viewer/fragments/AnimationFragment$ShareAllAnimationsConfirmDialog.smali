.class public Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment$ShareAllAnimationsConfirmDialog;
.super Lcom/sonymobile/scan3d/viewer/DismissablePrivacyFragment;
.source "AnimationFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ShareAllAnimationsConfirmDialog"
.end annotation


# static fields
.field private static final ARG_SHAREABLE:Ljava/lang/String; = "shareable"

.field public static final KEY_DONT_SHOW_ANIM_INFO:Ljava/lang/String; = "ShareAnimationsConfirmDialog_dontShowAgain"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 472
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/DismissablePrivacyFragment;-><init>()V

    return-void
.end method

.method public static newInstance(Ljava/lang/String;Lcom/sonymobile/scan3d/viewer/sharing/Shareable;)Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment$ShareAllAnimationsConfirmDialog;
    .locals 2

    .line 516
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "checkbox_pref"

    .line 517
    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "shareable"

    .line 518
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->toBundle()Landroid/os/Bundle;

    move-result-object p1

    invoke-virtual {v0, p0, p1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 519
    new-instance p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment$ShareAllAnimationsConfirmDialog;

    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment$ShareAllAnimationsConfirmDialog;-><init>()V

    .line 520
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment$ShareAllAnimationsConfirmDialog;->setArguments(Landroid/os/Bundle;)V

    return-object p0
.end method


# virtual methods
.method protected getDescription()Ljava/lang/String;
    .locals 1

    const v0, 0x7f10026f

    .line 504
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment$ShareAllAnimationsConfirmDialog;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getTitle()Ljava/lang/String;
    .locals 1

    const v0, 0x7f1000d6

    .line 499
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment$ShareAllAnimationsConfirmDialog;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected onPositiveAnswer()V
    .locals 3

    .line 483
    new-instance v0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment$ShareAllAnimationsConfirmDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "shareable"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;-><init>(Landroid/os/Bundle;)V

    .line 484
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->getRecipient()Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_1

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->isRecipientRequired()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 489
    :cond_0
    invoke-static {v0}, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;->newInstance(Lcom/sonymobile/scan3d/viewer/sharing/Shareable;)Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;

    move-result-object v0

    .line 490
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment$ShareAllAnimationsConfirmDialog;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object v1

    const v2, 0x7f0900dc

    .line 491
    invoke-virtual {v1, v2, v0}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 492
    const-class v0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroidx/fragment/app/FragmentTransaction;->addToBackStack(Ljava/lang/String;)Landroidx/fragment/app/FragmentTransaction;

    .line 493
    invoke-virtual {v1}, Landroidx/fragment/app/FragmentTransaction;->commit()I

    goto :goto_1

    .line 487
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment$ShareAllAnimationsConfirmDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->share(Landroid/content/Context;)V

    :goto_1
    return-void
.end method
