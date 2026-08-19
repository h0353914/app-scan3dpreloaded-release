.class public final synthetic Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PropsFragment$quY_E2-5RQ-WwhvgGDF1E1azb6o;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic f$0:Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;

.field private final synthetic f$1:I


# direct methods
.method public synthetic constructor <init>(Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PropsFragment$quY_E2-5RQ-WwhvgGDF1E1azb6o;->f$0:Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;

    iput p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PropsFragment$quY_E2-5RQ-WwhvgGDF1E1azb6o;->f$1:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PropsFragment$quY_E2-5RQ-WwhvgGDF1E1azb6o;->f$0:Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;

    iget v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PropsFragment$quY_E2-5RQ-WwhvgGDF1E1azb6o;->f$1:I

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->lambda$unloadProp$7(Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;I)V

    return-void
.end method
