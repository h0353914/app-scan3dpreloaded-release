.class public abstract Lcom/sonymobile/scan3d/storageservice/ui/fragment/SyncFragment;
.super Landroidx/fragment/app/Fragment;
.source "SyncFragment.java"

# interfaces
.implements Lcom/sonymobile/scan3d/storageservice/content/SyncService$SyncObserver;


# static fields
.field private static final SYNC_CHECK_TIMEOUT:J = 0x7d0L


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    return-void
.end method

.method public static synthetic lambda$onSync$0(Lcom/sonymobile/scan3d/storageservice/ui/fragment/SyncFragment;Z)V
    .locals 1

    .line 48
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SyncFragment;->isResumed()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 49
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SyncFragment;->onSyncChanged(Z)V

    :cond_0
    return-void
.end method

.method public static synthetic lambda$sync$1(Lcom/sonymobile/scan3d/storageservice/ui/fragment/SyncFragment;)V
    .locals 1

    .line 68
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SyncFragment;->isResumed()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 69
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/content/SyncService;->isSyncActive()Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SyncFragment;->onSync(Z)V

    :cond_0
    return-void
.end method


# virtual methods
.method public onPause()V
    .locals 0

    .line 38
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onPause()V

    .line 39
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/content/SyncService;->unregisterObserver(Lcom/sonymobile/scan3d/storageservice/content/SyncService$SyncObserver;)V

    return-void
.end method

.method public onResume()V
    .locals 1

    .line 29
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onResume()V

    .line 30
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/content/SyncService;->registerObserver(Lcom/sonymobile/scan3d/storageservice/content/SyncService$SyncObserver;)V

    .line 31
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/content/SyncService;->isSyncActive()Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SyncFragment;->onSync(Z)V

    return-void
.end method

.method public final onSync(Z)V
    .locals 2

    .line 44
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SyncFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 47
    new-instance v1, Lcom/sonymobile/scan3d/storageservice/ui/fragment/-$$Lambda$SyncFragment$pqXGAF7OPQlOdfZe-uT4lTzG4ec;

    invoke-direct {v1, p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/-$$Lambda$SyncFragment$pqXGAF7OPQlOdfZe-uT4lTzG4ec;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/fragment/SyncFragment;Z)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public abstract onSyncChanged(Z)V
.end method

.method public sync()V
    .locals 4

    .line 66
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    .line 67
    new-instance v1, Lcom/sonymobile/scan3d/storageservice/ui/fragment/-$$Lambda$SyncFragment$i3EMiyrOXmbEybwRTIGpbebc5v8;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/-$$Lambda$SyncFragment$i3EMiyrOXmbEybwRTIGpbebc5v8;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/fragment/SyncFragment;)V

    const-wide/16 v2, 0x7d0

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 73
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SyncFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/storageservice/content/Jobs;->requestSync(Landroid/content/Context;Z)Z

    return-void
.end method
