.class Lcom/sonymobile/scan3d/viewer/ProxyReceiver$ImprovementRunnable;
.super Ljava/lang/Object;
.source "ProxyReceiver.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/ProxyReceiver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ImprovementRunnable"
.end annotation


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mResult:Landroid/content/BroadcastReceiver$PendingResult;

.field private final mUri:Landroid/net/Uri;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/net/Uri;Landroid/content/BroadcastReceiver$PendingResult;)V
    .locals 0

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/ProxyReceiver$ImprovementRunnable;->mContext:Landroid/content/Context;

    .line 57
    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/ProxyReceiver$ImprovementRunnable;->mUri:Landroid/net/Uri;

    .line 58
    iput-object p3, p0, Lcom/sonymobile/scan3d/viewer/ProxyReceiver$ImprovementRunnable;->mResult:Landroid/content/BroadcastReceiver$PendingResult;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 63
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 65
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/ProxyReceiver$ImprovementRunnable;->mUri:Landroid/net/Uri;

    if-nez v1, :cond_1

    .line 66
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/ProxyReceiver$ImprovementRunnable;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->getImprovements(Landroid/content/Context;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;

    .line 67
    invoke-virtual {v2}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->isImproved()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 68
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 72
    :cond_1
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/ProxyReceiver$ImprovementRunnable;->mContext:Landroid/content/Context;

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->getImprovements(Landroid/content/Context;Landroid/net/Uri;)Ljava/util/ArrayList;

    move-result-object v0

    .line 75
    :cond_2
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_4

    .line 78
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x1

    if-le v1, v2, :cond_3

    .line 79
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/ProxyReceiver$ImprovementRunnable;->mContext:Landroid/content/Context;

    invoke-static {v1, v0}, Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity;->getStartIntent(Landroid/content/Context;Ljava/util/ArrayList;)Landroid/content/Intent;

    move-result-object v0

    goto :goto_1

    .line 81
    :cond_3
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/ProxyReceiver$ImprovementRunnable;->mContext:Landroid/content/Context;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;

    invoke-static {v1, v0}, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->getImprovementIntent(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/Improvement;)Landroid/content/Intent;

    move-result-object v0

    .line 83
    :goto_1
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/ProxyReceiver$ImprovementRunnable;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 85
    :cond_4
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/ProxyReceiver$ImprovementRunnable;->mResult:Landroid/content/BroadcastReceiver$PendingResult;

    invoke-virtual {v0}, Landroid/content/BroadcastReceiver$PendingResult;->finish()V

    return-void
.end method
