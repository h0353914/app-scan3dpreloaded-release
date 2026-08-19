.class Lcom/sonymobile/scan3d/sharing/SharingManager$PackageChangedReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SharingManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/sharing/SharingManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PackageChangedReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/sharing/SharingManager;


# direct methods
.method private constructor <init>(Lcom/sonymobile/scan3d/sharing/SharingManager;)V
    .locals 0

    .line 335
    iput-object p1, p0, Lcom/sonymobile/scan3d/sharing/SharingManager$PackageChangedReceiver;->this$0:Lcom/sonymobile/scan3d/sharing/SharingManager;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/sonymobile/scan3d/sharing/SharingManager;Lcom/sonymobile/scan3d/sharing/SharingManager$1;)V
    .locals 0

    .line 335
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/sharing/SharingManager$PackageChangedReceiver;-><init>(Lcom/sonymobile/scan3d/sharing/SharingManager;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    .line 338
    new-instance p1, Lcom/sonymobile/scan3d/sharing/SharingManager$LoadPluginsTask;

    iget-object p2, p0, Lcom/sonymobile/scan3d/sharing/SharingManager$PackageChangedReceiver;->this$0:Lcom/sonymobile/scan3d/sharing/SharingManager;

    const/4 v0, 0x0

    invoke-direct {p1, p2, v0}, Lcom/sonymobile/scan3d/sharing/SharingManager$LoadPluginsTask;-><init>(Lcom/sonymobile/scan3d/sharing/SharingManager;Lcom/sonymobile/scan3d/sharing/SharingManager$1;)V

    iget-object p2, p0, Lcom/sonymobile/scan3d/sharing/SharingManager$PackageChangedReceiver;->this$0:Lcom/sonymobile/scan3d/sharing/SharingManager;

    invoke-static {p2}, Lcom/sonymobile/scan3d/sharing/SharingManager;->access$500(Lcom/sonymobile/scan3d/sharing/SharingManager;)Ljava/util/concurrent/Executor;

    move-result-object p2

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Void;

    invoke-virtual {p1, p2, v0}, Lcom/sonymobile/scan3d/sharing/SharingManager$LoadPluginsTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method
