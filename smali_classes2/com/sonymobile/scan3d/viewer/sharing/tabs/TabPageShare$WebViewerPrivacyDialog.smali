.class public Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$WebViewerPrivacyDialog;
.super Lcom/sonymobile/scan3d/viewer/DismissablePrivacyFragment;
.source "TabPageShare.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "WebViewerPrivacyDialog"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 880
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/DismissablePrivacyFragment;-><init>()V

    return-void
.end method

.method public static newInstance(Ljava/lang/String;Lcom/sonymobile/scan3d/viewer/sharing/Shareable;Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;)Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$WebViewerPrivacyDialog;
    .locals 2

    .line 918
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "checkbox_pref"

    .line 919
    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "shareable"

    .line 920
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->toBundle()Landroid/os/Bundle;

    move-result-object p1

    invoke-virtual {v0, p0, p1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 921
    new-instance p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$WebViewerPrivacyDialog;

    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$WebViewerPrivacyDialog;-><init>()V

    const/4 p1, 0x0

    .line 922
    invoke-virtual {p0, p2, p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$WebViewerPrivacyDialog;->setTargetFragment(Landroidx/fragment/app/Fragment;I)V

    .line 923
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$WebViewerPrivacyDialog;->setArguments(Landroid/os/Bundle;)V

    return-object p0
.end method


# virtual methods
.method protected getDescription()Ljava/lang/String;
    .locals 1

    const v0, 0x7f1000a3

    .line 913
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$WebViewerPrivacyDialog;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getTitle()Ljava/lang/String;
    .locals 1

    const v0, 0x7f1000a4

    .line 908
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$WebViewerPrivacyDialog;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected onPositiveAnswer()V
    .locals 4

    .line 884
    new-instance v0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$WebViewerPrivacyDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "shareable"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;-><init>(Landroid/os/Bundle;)V

    .line 885
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->getFileSet()Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v1

    .line 887
    sget-object v2, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$1;->$SwitchMap$com$sonymobile$scan3d$viewer$sharing$Shareable$Type:[I

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->getShareType()Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    move-result-object v3

    invoke-virtual {v3}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    .line 894
    invoke-interface {v1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->isRigged()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 895
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$WebViewerPrivacyDialog;->getTargetFragment()Landroidx/fragment/app/Fragment;

    move-result-object v1

    check-cast v1, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    const/4 v2, 0x0

    .line 896
    invoke-static {v0, v2}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->newInstance(Lcom/sonymobile/scan3d/viewer/sharing/Shareable;Z)Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;

    move-result-object v0

    .line 895
    invoke-virtual {v1, v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->showFragment(Landroidx/fragment/app/Fragment;)V

    goto :goto_0

    .line 890
    :pswitch_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$WebViewerPrivacyDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->share(Landroid/content/Context;)V

    goto :goto_0

    .line 899
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$WebViewerPrivacyDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->share(Landroid/content/Context;)V

    .line 903
    :goto_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$WebViewerPrivacyDialog;->dismiss()V

    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
