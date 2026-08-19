.class public Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment$FileShareDialog;
.super Lcom/sonymobile/scan3d/viewer/DismissablePrivacyFragment;
.source "AnimationFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FileShareDialog"
.end annotation


# static fields
.field private static final ARG_SHAREABLE:Ljava/lang/String; = "shareable"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 417
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/DismissablePrivacyFragment;-><init>()V

    return-void
.end method

.method public static newInstance(Ljava/lang/String;Lcom/sonymobile/scan3d/viewer/sharing/Shareable;)Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment$FileShareDialog;
    .locals 2

    .line 457
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "checkbox_pref"

    .line 458
    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "shareable"

    .line 459
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->toBundle()Landroid/os/Bundle;

    move-result-object p1

    invoke-virtual {v0, p0, p1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 460
    new-instance p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment$FileShareDialog;

    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment$FileShareDialog;-><init>()V

    .line 461
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment$FileShareDialog;->setArguments(Landroid/os/Bundle;)V

    return-object p0
.end method


# virtual methods
.method protected getDescription()Ljava/lang/String;
    .locals 1

    const v0, 0x7f10009f

    .line 446
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment$FileShareDialog;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getTitle()Ljava/lang/String;
    .locals 1

    const v0, 0x7f1000d6

    .line 441
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment$FileShareDialog;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected onPositiveAnswer()V
    .locals 4

    .line 423
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment$FileShareDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "ShareAnimationsConfirmDialog_dontShowAgain"

    const/4 v2, 0x0

    .line 424
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 425
    new-instance v1, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment$FileShareDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string v3, "shareable"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;-><init>(Landroid/os/Bundle;)V

    if-nez v0, :cond_0

    .line 429
    invoke-virtual {v1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->getScanFormat()I

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    const-string v0, "ShareAnimationsConfirmDialog_dontShowAgain"

    .line 432
    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment$ShareAllAnimationsConfirmDialog;->newInstance(Ljava/lang/String;Lcom/sonymobile/scan3d/viewer/sharing/Shareable;)Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment$ShareAllAnimationsConfirmDialog;

    move-result-object v0

    .line 433
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment$FileShareDialog;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment$ShareAllAnimationsConfirmDialog;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    goto :goto_0

    .line 435
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment$FileShareDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->share(Landroid/content/Context;)V

    :goto_0
    return-void
.end method
