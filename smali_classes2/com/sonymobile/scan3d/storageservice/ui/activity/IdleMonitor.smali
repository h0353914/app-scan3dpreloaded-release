.class public Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;
.super Ljava/lang/Object;
.source "IdleMonitor.java"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$OnIdleListener;,
        Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$ListenerRegistration;
    }
.end annotation


# static fields
.field private static final DEFAULT_TICK_INTERVAL:J = 0x3e8L

.field private static final MESSAGE_TICK:I = 0x1


# instance fields
.field private final mIdleHandler:Landroid/os/Handler;

.field private final mListenerRegistrations:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$ListenerRegistration;",
            ">;"
        }
    .end annotation
.end field

.field private mMonitorEnabled:Z

.field private final mTickInterval:J

.field private mTicksSinceInteraction:I


# direct methods
.method public constructor <init>()V
    .locals 2

    const-wide/16 v0, 0x3e8

    .line 161
    invoke-direct {p0, v0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;-><init>(J)V

    return-void
.end method

.method public constructor <init>(J)V
    .locals 1

    .line 152
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0, p0}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;->mIdleHandler:Landroid/os/Handler;

    .line 54
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;->mListenerRegistrations:Ljava/util/ArrayList;

    .line 153
    iput-wide p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;->mTickInterval:J

    const/4 p1, 0x0

    .line 154
    iput p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;->mTicksSinceInteraction:I

    return-void
.end method

.method static synthetic lambda$onIdle$1(ILcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$ListenerRegistration;)Z
    .locals 0

    .line 218
    invoke-virtual {p1, p0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$ListenerRegistration;->conditionalNotifyListener(I)Z

    move-result p0

    return p0
.end method

.method static synthetic lambda$removeIdleListener$0(ILcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$ListenerRegistration;)Z
    .locals 0

    .line 208
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$ListenerRegistration;->access$000(Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$ListenerRegistration;)I

    move-result p1

    if-ne p1, p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private reset()V
    .locals 2

    const/4 v0, 0x0

    .line 290
    iput v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;->mTicksSinceInteraction:I

    .line 291
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;->mListenerRegistrations:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$ListenerRegistration;

    .line 292
    invoke-virtual {v1}, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$ListenerRegistration;->reset()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private sendTick()V
    .locals 4

    .line 283
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;->mIdleHandler:Landroid/os/Handler;

    iget-wide v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;->mTickInterval:J

    const/4 v3, 0x1

    invoke-virtual {v0, v3, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    return-void
.end method


# virtual methods
.method public addIdleListener(ILcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$OnIdleListener;I)V
    .locals 2

    .line 194
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;->mListenerRegistrations:Ljava/util/ArrayList;

    new-instance v1, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$ListenerRegistration;

    invoke-direct {v1, p1, p2, p3}, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$ListenerRegistration;-><init>(ILcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$OnIdleListener;I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 196
    iget-boolean p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;->mMonitorEnabled:Z

    if-nez p1, :cond_0

    const/4 p1, 0x1

    .line 197
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;->mMonitorEnabled:Z

    .line 198
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;->sendTick()V

    :cond_0
    return-void
.end method

.method public getIdleHandler()Landroid/os/Handler;
    .locals 1

    .line 174
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;->mIdleHandler:Landroid/os/Handler;

    return-object v0
.end method

.method public getNumberOfIdleListeners()I
    .locals 1

    .line 183
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;->mListenerRegistrations:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public handleMessage(Landroid/os/Message;)Z
    .locals 1

    .line 266
    iget p1, p1, Landroid/os/Message;->what:I

    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    .line 267
    iget p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;->mTicksSinceInteraction:I

    add-int/2addr p1, v0

    iput p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;->mTicksSinceInteraction:I

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;->onIdle(I)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 268
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;->sendTick()V

    :cond_0
    return v0

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public onDestroy()V
    .locals 1

    .line 230
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;->mListenerRegistrations:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    return-void
.end method

.method public onIdle(I)Z
    .locals 2

    .line 218
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;->mListenerRegistrations:Ljava/util/ArrayList;

    new-instance v1, Lcom/sonymobile/scan3d/storageservice/ui/activity/-$$Lambda$IdleMonitor$5mHX2ARZV3JMYSJVYjyaLhxgnUU;

    invoke-direct {v1, p1}, Lcom/sonymobile/scan3d/storageservice/ui/activity/-$$Lambda$IdleMonitor$5mHX2ARZV3JMYSJVYjyaLhxgnUU;-><init>(I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->removeIf(Ljava/util/function/Predicate;)Z

    .line 219
    iget-boolean p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;->mMonitorEnabled:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;->mListenerRegistrations:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-lez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public onPause()V
    .locals 2

    .line 247
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;->reset()V

    .line 249
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;->mIdleHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    const/4 v0, 0x0

    .line 250
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;->mMonitorEnabled:Z

    return-void
.end method

.method public onResume()V
    .locals 1

    .line 237
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;->mMonitorEnabled:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;->mListenerRegistrations:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    .line 238
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;->mMonitorEnabled:Z

    .line 239
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;->sendTick()V

    :cond_0
    return-void
.end method

.method public onUserInteraction()V
    .locals 0

    .line 257
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;->reset()V

    return-void
.end method

.method public removeIdleListener(I)V
    .locals 2

    .line 208
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;->mListenerRegistrations:Ljava/util/ArrayList;

    new-instance v1, Lcom/sonymobile/scan3d/storageservice/ui/activity/-$$Lambda$IdleMonitor$16CTs2_19b6xS_eUOn6tZrtO2g8;

    invoke-direct {v1, p1}, Lcom/sonymobile/scan3d/storageservice/ui/activity/-$$Lambda$IdleMonitor$16CTs2_19b6xS_eUOn6tZrtO2g8;-><init>(I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->removeIf(Ljava/util/function/Predicate;)Z

    return-void
.end method
