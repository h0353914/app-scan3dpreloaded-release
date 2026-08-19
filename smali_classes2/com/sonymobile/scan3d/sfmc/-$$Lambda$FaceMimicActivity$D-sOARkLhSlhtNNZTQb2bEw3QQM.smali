.class public final synthetic Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$D-sOARkLhSlhtNNZTQb2bEw3QQM;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic f$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

.field private final synthetic f$1:Landroid/net/Uri;

.field private final synthetic f$2:Landroid/net/Uri;

.field private final synthetic f$3:Ljava/util/function/Consumer;


# direct methods
.method public synthetic constructor <init>(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Landroid/net/Uri;Landroid/net/Uri;Ljava/util/function/Consumer;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$D-sOARkLhSlhtNNZTQb2bEw3QQM;->f$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    iput-object p2, p0, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$D-sOARkLhSlhtNNZTQb2bEw3QQM;->f$1:Landroid/net/Uri;

    iput-object p3, p0, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$D-sOARkLhSlhtNNZTQb2bEw3QQM;->f$2:Landroid/net/Uri;

    iput-object p4, p0, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$D-sOARkLhSlhtNNZTQb2bEw3QQM;->f$3:Ljava/util/function/Consumer;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$D-sOARkLhSlhtNNZTQb2bEw3QQM;->f$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    iget-object v1, p0, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$D-sOARkLhSlhtNNZTQb2bEw3QQM;->f$1:Landroid/net/Uri;

    iget-object v2, p0, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$D-sOARkLhSlhtNNZTQb2bEw3QQM;->f$2:Landroid/net/Uri;

    iget-object v3, p0, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$D-sOARkLhSlhtNNZTQb2bEw3QQM;->f$3:Ljava/util/function/Consumer;

    invoke-static {v0, v1, v2, v3}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->lambda$loadModel$5(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Landroid/net/Uri;Landroid/net/Uri;Ljava/util/function/Consumer;)V

    return-void
.end method
