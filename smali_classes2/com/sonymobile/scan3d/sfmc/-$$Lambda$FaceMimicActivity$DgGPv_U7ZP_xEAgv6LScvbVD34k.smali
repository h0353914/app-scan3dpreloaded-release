.class public final synthetic Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$DgGPv_U7ZP_xEAgv6LScvbVD34k;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic f$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$DgGPv_U7ZP_xEAgv6LScvbVD34k;->f$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$DgGPv_U7ZP_xEAgv6LScvbVD34k;->f$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    invoke-static {v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->lambda$takePicture$6(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)V

    return-void
.end method
