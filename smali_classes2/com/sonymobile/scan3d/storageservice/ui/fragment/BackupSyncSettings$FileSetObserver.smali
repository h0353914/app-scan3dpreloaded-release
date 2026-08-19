.class Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings$FileSetObserver;
.super Landroid/database/ContentObserver;
.source "BackupSyncSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FileSetObserver"
.end annotation


# instance fields
.field private mHandler:Landroid/os/Handler;


# direct methods
.method constructor <init>(Landroid/os/Handler;)V
    .locals 0

    .line 101
    invoke-direct {p0, p1}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 102
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings$FileSetObserver;->mHandler:Landroid/os/Handler;

    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .locals 1

    .line 107
    invoke-super {p0, p1}, Landroid/database/ContentObserver;->onChange(Z)V

    .line 108
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings$FileSetObserver;->mHandler:Landroid/os/Handler;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    return-void
.end method
