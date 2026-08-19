.class public final synthetic Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ShareAsVideoFragment$1$y7BPgsteOxNq4mb1aBaE9oq5Dfk;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic f$0:Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment$1;

.field private final synthetic f$1:F


# direct methods
.method public synthetic constructor <init>(Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment$1;F)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ShareAsVideoFragment$1$y7BPgsteOxNq4mb1aBaE9oq5Dfk;->f$0:Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment$1;

    iput p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ShareAsVideoFragment$1$y7BPgsteOxNq4mb1aBaE9oq5Dfk;->f$1:F

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ShareAsVideoFragment$1$y7BPgsteOxNq4mb1aBaE9oq5Dfk;->f$0:Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment$1;

    iget v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ShareAsVideoFragment$1$y7BPgsteOxNq4mb1aBaE9oq5Dfk;->f$1:F

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment$1;->lambda$onAnimationTime$0(Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment$1;F)V

    return-void
.end method
