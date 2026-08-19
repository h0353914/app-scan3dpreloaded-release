.class public Lcom/sonymobile/scan3d/storageservice/ui/fragment/DeleteAccountMonitorFragment;
.super Landroidx/fragment/app/Fragment;
.source "DeleteAccountMonitorFragment.java"

# interfaces
.implements Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils$AccountListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    return-void
.end method

.method private exit()V
    .locals 2

    .line 94
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/DeleteAccountMonitorFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 96
    :try_start_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/DeleteAccountMonitorFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/content/Jobs;->cancelAllJobs(Landroid/content/Context;)V

    .line 97
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/DeleteAccountMonitorFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->popBackStack()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 99
    const-class v1, Lcom/sonymobile/scan3d/storageservice/ui/fragment/DeleteAccountMonitorFragment;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    :goto_0
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 48
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 49
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->INSTANCE:Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/DeleteAccountMonitorFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1, v0, p0}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->registerListener(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils$AccountListener;)V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1    # Landroid/view/LayoutInflater;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/4 p3, 0x1

    .line 33
    invoke-virtual {p0, p3}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/DeleteAccountMonitorFragment;->setHasOptionsMenu(Z)V

    .line 36
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/DeleteAccountMonitorFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    if-eqz v0, :cond_0

    const v1, 0x7f100162

    .line 38
    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setTitle(I)V

    .line 39
    invoke-virtual {v0, p3}, Landroid/app/ActionBar;->setHomeButtonEnabled(Z)V

    .line 40
    invoke-virtual {v0, p3}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    :cond_0
    const p3, 0x7f0c0063

    const/4 v0, 0x0

    .line 43
    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onDeleteAccountChanged(Z)V
    .locals 0

    if-nez p1, :cond_0

    .line 80
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/DeleteAccountMonitorFragment;->isRemoving()Z

    move-result p1

    if-nez p1, :cond_0

    .line 81
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/DeleteAccountMonitorFragment;->exit()V

    :cond_0
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .line 54
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroy()V

    .line 55
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->INSTANCE:Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/DeleteAccountMonitorFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1, p0}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->unregisterListener(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils$AccountListener;)V

    return-void
.end method

.method public onExtractAccountChanged(Z)V
    .locals 0

    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2

    .line 60
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x102002c

    if-ne v0, v1, :cond_1

    .line 61
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/DeleteAccountMonitorFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 62
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/DeleteAccountMonitorFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->popBackStack()V

    :cond_0
    const/4 p1, 0x1

    return p1

    .line 66
    :cond_1
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method

.method public onSignedOut()V
    .locals 0

    return-void
.end method
