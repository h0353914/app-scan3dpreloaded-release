.class public final synthetic Lcom/sonymobile/scan3d/storageservice/ui/activity/-$$Lambda$IdleMonitor$16CTs2_19b6xS_eUOn6tZrtO2g8;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/util/function/Predicate;


# instance fields
.field private final synthetic f$0:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/-$$Lambda$IdleMonitor$16CTs2_19b6xS_eUOn6tZrtO2g8;->f$0:I

    return-void
.end method


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .locals 1

    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/-$$Lambda$IdleMonitor$16CTs2_19b6xS_eUOn6tZrtO2g8;->f$0:I

    check-cast p1, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$ListenerRegistration;

    invoke-static {v0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;->lambda$removeIdleListener$0(ILcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$ListenerRegistration;)Z

    move-result p1

    return p1
.end method
