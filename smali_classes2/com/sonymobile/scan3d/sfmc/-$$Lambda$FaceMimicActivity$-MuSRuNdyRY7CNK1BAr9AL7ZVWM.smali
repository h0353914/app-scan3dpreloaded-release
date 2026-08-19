.class public final synthetic Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$-MuSRuNdyRY7CNK1BAr9AL7ZVWM;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field private final synthetic f$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

.field private final synthetic f$1:Landroid/net/Uri;


# direct methods
.method public synthetic constructor <init>(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Landroid/net/Uri;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$-MuSRuNdyRY7CNK1BAr9AL7ZVWM;->f$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    iput-object p2, p0, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$-MuSRuNdyRY7CNK1BAr9AL7ZVWM;->f$1:Landroid/net/Uri;

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 2

    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$-MuSRuNdyRY7CNK1BAr9AL7ZVWM;->f$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    iget-object v1, p0, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$-MuSRuNdyRY7CNK1BAr9AL7ZVWM;->f$1:Landroid/net/Uri;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, v1, p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->lambda$onActivityResult$21(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Landroid/net/Uri;Ljava/lang/Boolean;)V

    return-void
.end method
