.class Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$ListenerRegistration;
.super Ljava/lang/Object;
.source "IdleMonitor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ListenerRegistration"
.end annotation


# instance fields
.field private mCount:I

.field private final mId:I

.field private final mListener:Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$OnIdleListener;

.field private mNextIdleTickNum:I

.field private mTicksPassed:I


# direct methods
.method constructor <init>(ILcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$OnIdleListener;I)V
    .locals 0

    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 94
    iput p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$ListenerRegistration;->mId:I

    .line 95
    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$ListenerRegistration;->mListener:Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$OnIdleListener;

    .line 96
    iput p3, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$ListenerRegistration;->mNextIdleTickNum:I

    return-void
.end method

.method static synthetic access$000(Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$ListenerRegistration;)I
    .locals 0

    .line 59
    iget p0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$ListenerRegistration;->mId:I

    return p0
.end method


# virtual methods
.method conditionalNotifyListener(I)Z
    .locals 5

    .line 108
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$ListenerRegistration;->mTicksPassed:I

    sub-int v0, p1, v0

    iget v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$ListenerRegistration;->mNextIdleTickNum:I

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    .line 109
    iput p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$ListenerRegistration;->mTicksPassed:I

    .line 110
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$ListenerRegistration;->mListener:Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$OnIdleListener;

    iget v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$ListenerRegistration;->mId:I

    iget v3, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$ListenerRegistration;->mCount:I

    const/4 v4, 0x1

    add-int/2addr v3, v4

    iput v3, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$ListenerRegistration;->mCount:I

    invoke-interface {v0, v1, p1, v3}, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$OnIdleListener;->onIdle(III)I

    move-result p1

    iput p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$ListenerRegistration;->mNextIdleTickNum:I

    .line 111
    iget p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$ListenerRegistration;->mNextIdleTickNum:I

    if-gtz p1, :cond_0

    move v2, v4

    :cond_0
    return v2
.end method

.method reset()V
    .locals 1

    const/4 v0, 0x0

    .line 120
    iput v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$ListenerRegistration;->mTicksPassed:I

    return-void
.end method
