.class public Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileShareAdvPrivacyDialog;
.super Lcom/sonymobile/scan3d/viewer/DismissablePrivacyFragment;
.source "TabPageShare.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FileShareAdvPrivacyDialog"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1026
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/DismissablePrivacyFragment;-><init>()V

    return-void
.end method

.method public static newInstance(Ljava/lang/String;Lcom/sonymobile/scan3d/viewer/sharing/Shareable;Landroidx/fragment/app/Fragment;)Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileShareAdvPrivacyDialog;
    .locals 2

    .line 1050
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "shareable"

    .line 1051
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->toBundle()Landroid/os/Bundle;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    const-string p1, "checkbox_pref"

    .line 1052
    invoke-virtual {v0, p1, p0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1053
    new-instance p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileShareAdvPrivacyDialog;

    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileShareAdvPrivacyDialog;-><init>()V

    .line 1054
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileShareAdvPrivacyDialog;->setArguments(Landroid/os/Bundle;)V

    const/4 p1, 0x0

    .line 1055
    invoke-virtual {p0, p2, p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileShareAdvPrivacyDialog;->setTargetFragment(Landroidx/fragment/app/Fragment;I)V

    return-object p0
.end method


# virtual methods
.method protected getDescription()Ljava/lang/String;
    .locals 1

    const v0, 0x7f10009f

    .line 1045
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileShareAdvPrivacyDialog;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getTitle()Ljava/lang/String;
    .locals 1

    const v0, 0x7f1000a0

    .line 1040
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileShareAdvPrivacyDialog;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected onPositiveAnswer()V
    .locals 4

    .line 1030
    new-instance v0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileShareAdvPrivacyDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "shareable"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;-><init>(Landroid/os/Bundle;)V

    .line 1031
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "shareable"

    .line 1032
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->toBundle()Landroid/os/Bundle;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 1033
    invoke-static {v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$RadioButtonDialogFragment;->newInstance(Lcom/sonymobile/scan3d/viewer/sharing/Shareable;)Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$RadioButtonDialogFragment;

    move-result-object v0

    .line 1034
    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$RadioButtonDialogFragment;->setArguments(Landroid/os/Bundle;)V

    .line 1035
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileShareAdvPrivacyDialog;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$RadioButtonDialogFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method
