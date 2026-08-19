.class public Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ThirdPartyPrivacyDialog;
.super Lcom/sonymobile/scan3d/viewer/PrivacyFragment;
.source "TabPageShare.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ThirdPartyPrivacyDialog"
.end annotation


# static fields
.field private static final ARG_APP_NAME:Ljava/lang/String; = "appName"

.field private static final ARG_PREFERRED_MIMETYPE:Ljava/lang/String; = "preferredMimeType"

.field private static final ARG_SHAREABLE:Ljava/lang/String; = "shareable"

.field private static final ARG_SUPPORTED_MIMETYPE:Ljava/lang/String; = "supportedMimeType"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 771
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/PrivacyFragment;-><init>()V

    return-void
.end method

.method public static newInstance(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;Lcom/sonymobile/scan3d/viewer/sharing/Shareable;)Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ThirdPartyPrivacyDialog;
    .locals 2

    .line 823
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "shareable"

    .line 824
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->toBundle()Landroid/os/Bundle;

    move-result-object p2

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    const-string p2, "component_name"

    .line 825
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->getComponentName()Landroid/content/ComponentName;

    move-result-object v1

    invoke-virtual {v0, p2, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string p2, "appName"

    .line 826
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->getAppName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "supportedMimeType"

    .line 827
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->getSupportedMimeTypes()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0, p2, v1}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    const-string p2, "preferredMimeType"

    .line 828
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->getPreferredMimeType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "texture_size"

    .line 829
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->getTextureSize()I

    move-result p1

    invoke-virtual {v0, p2, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 830
    new-instance p1, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ThirdPartyPrivacyDialog;

    invoke-direct {p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ThirdPartyPrivacyDialog;-><init>()V

    .line 831
    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ThirdPartyPrivacyDialog;->setArguments(Landroid/os/Bundle;)V

    const/4 p2, 0x0

    .line 832
    invoke-virtual {p1, p0, p2}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ThirdPartyPrivacyDialog;->setTargetFragment(Landroidx/fragment/app/Fragment;I)V

    return-object p1
.end method


# virtual methods
.method protected getApplicationName()Ljava/lang/String;
    .locals 2

    .line 813
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ThirdPartyPrivacyDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "appName"

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
    .locals 9

    .line 780
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ThirdPartyPrivacyDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 781
    new-instance v2, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    const-string v1, "shareable"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    invoke-direct {v2, v1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;-><init>(Landroid/os/Bundle;)V

    const-string v1, "supportedMimeType"

    .line 783
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    const-string v3, "preferredMimeType"

    .line 784
    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v3, "texture_size"

    const/4 v5, 0x0

    .line 785
    invoke-virtual {v0, v3, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v7

    const-string v3, "component_name"

    .line 786
    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v3

    move-object v6, v3

    check-cast v6, Landroid/content/ComponentName;

    const-string v3, "appName"

    .line 787
    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 789
    invoke-virtual {v2, v6}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setRecipient(Landroid/content/ComponentName;)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    move-result-object v0

    .line 790
    invoke-virtual {v0, v7}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setTextureSize(I)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    if-nez v1, :cond_0

    .line 793
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-object v3, v0

    goto :goto_0

    :cond_0
    move-object v3, v1

    .line 796
    :goto_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ThirdPartyPrivacyDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 803
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ThirdPartyPrivacyDialog;->getTargetFragment()Landroidx/fragment/app/Fragment;

    move-result-object v0

    move-object v8, v0

    check-cast v8, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    .line 796
    invoke-static/range {v1 .. v8}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->access$000(Landroid/content/Context;Lcom/sonymobile/scan3d/viewer/sharing/Shareable;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Landroid/content/ComponentName;ILcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;)V

    return-void
.end method
