.class public Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrintSharePrivacyDialog;
.super Lcom/sonymobile/scan3d/viewer/DismissablePrivacyFragment;
.source "Print3rdPartyPluginsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PrintSharePrivacyDialog"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 271
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/DismissablePrivacyFragment;-><init>()V

    return-void
.end method

.method public static newInstance(Ljava/lang/String;)Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrintSharePrivacyDialog;
    .locals 2

    .line 289
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "checkbox_pref"

    .line 290
    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 291
    new-instance p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrintSharePrivacyDialog;

    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrintSharePrivacyDialog;-><init>()V

    .line 292
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrintSharePrivacyDialog;->setArguments(Landroid/os/Bundle;)V

    return-object p0
.end method


# virtual methods
.method protected getDescription()Ljava/lang/String;
    .locals 1

    const v0, 0x7f10009f

    .line 285
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrintSharePrivacyDialog;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getTitle()Ljava/lang/String;
    .locals 1

    const v0, 0x7f1000a0

    .line 280
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrintSharePrivacyDialog;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected onPositiveAnswer()V
    .locals 1

    .line 275
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrintSharePrivacyDialog;->getTargetFragment()Landroidx/fragment/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;

    invoke-static {v0}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->access$000(Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;)V

    return-void
.end method
