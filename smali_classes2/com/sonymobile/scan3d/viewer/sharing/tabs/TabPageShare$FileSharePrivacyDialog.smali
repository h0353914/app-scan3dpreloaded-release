.class public Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileSharePrivacyDialog;
.super Lcom/sonymobile/scan3d/viewer/DismissablePrivacyFragment;
.source "TabPageShare.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FileSharePrivacyDialog"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 979
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/DismissablePrivacyFragment;-><init>()V

    return-void
.end method

.method public static newInstance(Ljava/lang/String;Lcom/sonymobile/scan3d/viewer/sharing/Shareable;Landroidx/fragment/app/Fragment;)Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileSharePrivacyDialog;
    .locals 2

    .line 1016
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "checkbox_pref"

    .line 1017
    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "shareable"

    .line 1018
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->toBundle()Landroid/os/Bundle;

    move-result-object p1

    invoke-virtual {v0, p0, p1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 1019
    new-instance p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileSharePrivacyDialog;

    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileSharePrivacyDialog;-><init>()V

    .line 1020
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileSharePrivacyDialog;->setArguments(Landroid/os/Bundle;)V

    const/4 p1, 0x0

    .line 1021
    invoke-virtual {p0, p2, p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileSharePrivacyDialog;->setTargetFragment(Landroidx/fragment/app/Fragment;I)V

    return-object p0
.end method


# virtual methods
.method protected getDescription()Ljava/lang/String;
    .locals 1

    const v0, 0x7f10009f

    .line 1011
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileSharePrivacyDialog;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getTitle()Ljava/lang/String;
    .locals 1

    const v0, 0x7f1000a0

    .line 1006
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileSharePrivacyDialog;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected onPositiveAnswer()V
    .locals 3

    .line 983
    new-instance v0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileSharePrivacyDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "shareable"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;-><init>(Landroid/os/Bundle;)V

    .line 985
    sget-object v1, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$1;->$SwitchMap$com$sonymobile$scan3d$viewer$sharing$Shareable$Type:[I

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->getShareType()Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    move-result-object v2

    invoke-virtual {v2}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 992
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->getFileSet()Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v1

    .line 993
    invoke-interface {v1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->isRigged()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 994
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileSharePrivacyDialog;->getTargetFragment()Landroidx/fragment/app/Fragment;

    move-result-object v1

    check-cast v1, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    const/4 v2, 0x0

    .line 995
    invoke-static {v0, v2}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->newInstance(Lcom/sonymobile/scan3d/viewer/sharing/Shareable;Z)Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;

    move-result-object v0

    .line 994
    invoke-virtual {v1, v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->showFragment(Landroidx/fragment/app/Fragment;)V

    goto :goto_0

    .line 988
    :pswitch_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileSharePrivacyDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->share(Landroid/content/Context;)V

    goto :goto_0

    .line 997
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileSharePrivacyDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->share(Landroid/content/Context;)V

    .line 1001
    :goto_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileSharePrivacyDialog;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->popBackStack()V

    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
