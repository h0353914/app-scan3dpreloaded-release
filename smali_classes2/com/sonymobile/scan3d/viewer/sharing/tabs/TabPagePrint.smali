.class public Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint;
.super Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;
.source "TabPagePrint.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint$FindMorePlugin;,
        Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint$LocalPrintPlugin;
    }
.end annotation


# instance fields
.field private mHasFacePlugins:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 32
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;-><init>()V

    const/4 v0, 0x0

    .line 34
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint;->mHasFacePlugins:Z

    return-void
.end method

.method public static newInstance(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;I)Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint;
    .locals 1

    .line 37
    new-instance v0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint;-><init>()V

    .line 38
    invoke-static {p0, p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint;->getBaseArguments(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;I)Landroid/os/Bundle;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint;->setArguments(Landroid/os/Bundle;)V

    return-object v0
.end method

.method public static showFragment(Landroidx/fragment/app/FragmentManager;Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;)V
    .locals 0

    .line 47
    invoke-static {p0, p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint;->showFragment(Landroidx/fragment/app/FragmentManager;Landroidx/fragment/app/Fragment;)V

    return-void
.end method


# virtual methods
.method protected getPlugins()Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/sharing/Plugin;",
            ">;"
        }
    .end annotation

    .line 52
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 53
    invoke-static {}, Lcom/sonymobile/scan3d/sharing/SharingManager;->getInstance()Lcom/sonymobile/scan3d/sharing/SharingManager;

    move-result-object v1

    .line 54
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/sonymobile/scan3d/storageservice/Config;->isGooglePlayEnabled(Landroid/content/Context;)Z

    move-result v2

    .line 55
    iget-object v3, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    invoke-interface {v3}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getScanType()I

    move-result v3

    if-eqz v2, :cond_0

    .line 58
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->hasPrintProviders(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 59
    iget-boolean v4, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint;->mHasFacePlugins:Z

    or-int/lit8 v4, v4, 0x1

    iput-boolean v4, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint;->mHasFacePlugins:Z

    .line 61
    :cond_0
    iget-boolean v4, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint;->mHasFacePlugins:Z

    sget-object v5, Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;->PRINT:Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;

    const/16 v6, 0x100

    invoke-virtual {v1, v5, v6}, Lcom/sonymobile/scan3d/sharing/SharingManager;->hasPluginsExact(Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;I)Z

    move-result v5

    or-int/2addr v4, v5

    iput-boolean v4, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint;->mHasFacePlugins:Z

    .line 62
    iget-boolean v4, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint;->mHasFacePlugins:Z

    sget-object v5, Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;->PRINT:Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;

    const/16 v6, 0x101

    invoke-virtual {v1, v5, v6}, Lcom/sonymobile/scan3d/sharing/SharingManager;->hasPluginsExact(Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;I)Z

    move-result v5

    or-int/2addr v4, v5

    iput-boolean v4, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint;->mHasFacePlugins:Z

    .line 63
    sget-object v4, Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;->PRINT:Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;

    invoke-virtual {v1, v4, v3}, Lcom/sonymobile/scan3d/sharing/SharingManager;->hasPlugins(Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;I)Z

    move-result v1

    .line 64
    new-instance v3, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint$LocalPrintPlugin;

    invoke-direct {v3, p0, v1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint$LocalPrintPlugin;-><init>(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint;Z)V

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    if-eqz v2, :cond_1

    .line 66
    new-instance v1, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint$FindMorePlugin;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint$FindMorePlugin;-><init>(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    return-object v0
.end method

.method protected hasFacePlugins()Z
    .locals 1

    .line 43
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint;->mHasFacePlugins:Z

    return v0
.end method
