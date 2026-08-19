.class public Lcom/sonymobile/scan3d/viewer/ProxyReceiver;
.super Landroid/content/BroadcastReceiver;
.source "ProxyReceiver.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/viewer/ProxyReceiver$ImprovementRunnable;
    }
.end annotation


# static fields
.field private static final ACTION_IMPROVEMENT_ACTIVITY_SELECTION:Ljava/lang/String; = "com.sonymobile.scan3d.action.SELECT_IMPROVEMENT"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method public static getImprovementIntent(Landroid/content/Context;)Landroid/content/Intent;
    .locals 1

    const/4 v0, 0x0

    .line 96
    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/viewer/ProxyReceiver;->getImprovementIntent(Landroid/content/Context;Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method public static getImprovementIntent(Landroid/content/Context;Landroid/net/Uri;)Landroid/content/Intent;
    .locals 2

    .line 107
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/sonymobile/scan3d/viewer/ProxyReceiver;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string p0, "com.sonymobile.scan3d.action.SELECT_IMPROVEMENT"

    .line 108
    invoke-virtual {v0, p0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 109
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    return-object v0
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    if-eqz p2, :cond_0

    const-string v0, "com.sonymobile.scan3d.action.SELECT_IMPROVEMENT"

    .line 116
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 117
    new-instance v0, Lcom/sonymobile/scan3d/viewer/ProxyReceiver$ImprovementRunnable;

    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p2

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/ProxyReceiver;->goAsync()Landroid/content/BroadcastReceiver$PendingResult;

    move-result-object v1

    invoke-direct {v0, p1, p2, v1}, Lcom/sonymobile/scan3d/viewer/ProxyReceiver$ImprovementRunnable;-><init>(Landroid/content/Context;Landroid/net/Uri;Landroid/content/BroadcastReceiver$PendingResult;)V

    .line 118
    new-instance p1, Ljava/lang/Thread;

    invoke-direct {p1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    :cond_0
    return-void
.end method
