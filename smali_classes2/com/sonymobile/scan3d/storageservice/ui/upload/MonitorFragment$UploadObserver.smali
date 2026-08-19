.class Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment$UploadObserver;
.super Landroid/database/ContentObserver;
.source "MonitorFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "UploadObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;Landroid/os/Handler;)V
    .locals 0

    .line 104
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment$UploadObserver;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;

    .line 105
    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public onChange(ZLandroid/net/Uri;)V
    .locals 0

    .line 110
    new-instance p1, Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment$UploadMonitorTask;

    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment$UploadObserver;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;

    invoke-direct {p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment$UploadMonitorTask;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;)V

    const/4 p2, 0x0

    new-array p2, p2, [Ljava/lang/Void;

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment$UploadMonitorTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method
