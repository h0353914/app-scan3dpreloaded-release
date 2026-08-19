.class Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint$LocalPrintPlugin;
.super Lcom/sonymobile/scan3d/sharing/LocalPlugin;
.source "TabPagePrint.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LocalPrintPlugin"
.end annotation


# static fields
.field private static final LOCAL_PRINT_NAME:Ljava/lang/String; = "LocalPrint"


# instance fields
.field private mHasInstalledApps:Z

.field final synthetic this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint;Z)V
    .locals 3

    .line 78
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint$LocalPrintPlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint;

    .line 79
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string v0, "LocalPrint"

    const v1, 0x7f08014a

    const v2, 0x7f100210

    invoke-direct {p0, p1, v1, v2, v0}, Lcom/sonymobile/scan3d/sharing/LocalPlugin;-><init>(Landroid/content/Context;IILjava/lang/String;)V

    .line 81
    iput-boolean p2, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint$LocalPrintPlugin;->mHasInstalledApps:Z

    return-void
.end method

.method private showNoSupportedAppsInstalledFragment()V
    .locals 3

    .line 94
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint$LocalPrintPlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint;->getParentFragment()Landroidx/fragment/app/Fragment;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    .line 95
    new-instance v1, Lcom/sonymobile/scan3d/viewer/fragments/NoLocalPrintersFragment;

    invoke-direct {v1}, Lcom/sonymobile/scan3d/viewer/fragments/NoLocalPrintersFragment;-><init>()V

    .line 96
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object v0

    const/16 v2, 0x1003

    .line 97
    invoke-virtual {v0, v2}, Landroidx/fragment/app/FragmentTransaction;->setTransition(I)Landroidx/fragment/app/FragmentTransaction;

    const v2, 0x7f0900dc

    .line 98
    invoke-virtual {v0, v2, v1}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 99
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentTransaction;->addToBackStack(Ljava/lang/String;)Landroidx/fragment/app/FragmentTransaction;

    .line 100
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentTransaction;->commit()I

    return-void
.end method


# virtual methods
.method public getBackgroundColor()I
    .locals 2

    .line 105
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint$LocalPrintPlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0600ba

    invoke-virtual {v0, v1}, Landroid/content/Context;->getColor(I)I

    move-result v0

    return v0
.end method

.method public isEnabled(Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;Landroid/content/Context;I)Z
    .locals 0

    .line 110
    sget-object p2, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->DEFAULT:Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    if-ne p1, p2, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public shareMesh(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V
    .locals 0

    .line 86
    iget-boolean p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint$LocalPrintPlugin;->mHasInstalledApps:Z

    if-eqz p1, :cond_0

    .line 87
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint$LocalPrintPlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint;

    invoke-static {}, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->newInstance()Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint;->showFragment(Landroidx/fragment/app/Fragment;)V

    goto :goto_0

    .line 89
    :cond_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint$LocalPrintPlugin;->showNoSupportedAppsInstalledFragment()V

    :goto_0
    return-void
.end method
