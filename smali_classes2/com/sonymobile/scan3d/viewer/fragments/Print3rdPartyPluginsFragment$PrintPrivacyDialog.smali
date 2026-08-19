.class public Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrintPrivacyDialog;
.super Lcom/sonymobile/scan3d/viewer/PrivacyFragment;
.source "Print3rdPartyPluginsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PrintPrivacyDialog"
.end annotation


# static fields
.field private static final ARG_NAME:Ljava/lang/String; = "arg_name"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 243
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/PrivacyFragment;-><init>()V

    return-void
.end method

.method public static newInstance(Ljava/lang/String;)Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrintPrivacyDialog;
    .locals 2

    .line 263
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "arg_name"

    .line 264
    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 265
    new-instance p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrintPrivacyDialog;

    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrintPrivacyDialog;-><init>()V

    .line 266
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrintPrivacyDialog;->setArguments(Landroid/os/Bundle;)V

    return-object p0
.end method


# virtual methods
.method protected getApplicationName()Ljava/lang/String;
    .locals 2

    .line 254
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrintPrivacyDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "arg_name"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getPrivacyLink()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method protected onPositiveAnswer()V
    .locals 1

    .line 249
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrintPrivacyDialog;->getTargetFragment()Landroidx/fragment/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;

    invoke-static {v0}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->access$000(Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;)V

    return-void
.end method
