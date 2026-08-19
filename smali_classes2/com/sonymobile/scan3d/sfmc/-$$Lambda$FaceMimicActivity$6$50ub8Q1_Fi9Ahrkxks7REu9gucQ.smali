.class public final synthetic Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$6$50ub8Q1_Fi9Ahrkxks7REu9gucQ;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic f$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$6;

.field private final synthetic f$1:Z


# direct methods
.method public synthetic constructor <init>(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$6;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$6$50ub8Q1_Fi9Ahrkxks7REu9gucQ;->f$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$6;

    iput-boolean p2, p0, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$6$50ub8Q1_Fi9Ahrkxks7REu9gucQ;->f$1:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$6$50ub8Q1_Fi9Ahrkxks7REu9gucQ;->f$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$6;

    iget-boolean v1, p0, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$6$50ub8Q1_Fi9Ahrkxks7REu9gucQ;->f$1:Z

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$6;->lambda$onSurfaceCreated$3(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$6;Z)V

    return-void
.end method
