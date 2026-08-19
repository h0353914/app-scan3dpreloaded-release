.class public final synthetic Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$aJb392WyOWb-EGi3-m3nf2D3VkM;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic f$0:Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;

.field private final synthetic f$1:Z


# direct methods
.method public synthetic constructor <init>(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$aJb392WyOWb-EGi3-m3nf2D3VkM;->f$0:Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;

    iput-boolean p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$aJb392WyOWb-EGi3-m3nf2D3VkM;->f$1:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$aJb392WyOWb-EGi3-m3nf2D3VkM;->f$0:Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;

    iget-boolean v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$aJb392WyOWb-EGi3-m3nf2D3VkM;->f$1:Z

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->lambda$doClick$4(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;Z)V

    return-void
.end method
