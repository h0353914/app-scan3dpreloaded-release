.class Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment$1;
.super Ljava/lang/Object;
.source "ShareAsVideoFragment.java"

# interfaces
.implements Lcom/sonymobile/scan3d/viewer/SphanGLTextureView$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->lambda$onCameraAnimationLoaded$3()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;)V
    .locals 0

    .line 221
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment$1;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic lambda$onAnimationTime$0(Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment$1;F)V
    .locals 2

    .line 224
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment$1;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;

    invoke-static {v0}, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->access$200(Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;)Landroid/widget/ProgressBar;

    move-result-object v0

    const/high16 v1, 0x447a0000    # 1000.0f

    mul-float/2addr p1, v1

    float-to-int p1, p1

    invoke-virtual {v0, p1}, Landroid/widget/ProgressBar;->setProgress(I)V

    return-void
.end method


# virtual methods
.method public onAnimationStopped()V
    .locals 0

    return-void
.end method

.method public onAnimationStopped(I)V
    .locals 1

    .line 230
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment$1;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;

    invoke-static {v0}, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->access$100(Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;)I

    move-result v0

    if-ne p1, v0, :cond_0

    .line 231
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment$1;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;

    iget-object p1, p1, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->stopEncoder()V

    .line 232
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment$1;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;

    iget-object p1, p1, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->resetCamera()V

    :cond_0
    return-void
.end method

.method public onAnimationTime(F)V
    .locals 2

    .line 224
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment$1;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;

    invoke-static {v0}, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->access$000(Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ShareAsVideoFragment$1$y7BPgsteOxNq4mb1aBaE9oq5Dfk;

    invoke-direct {v1, p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ShareAsVideoFragment$1$y7BPgsteOxNq4mb1aBaE9oq5Dfk;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment$1;F)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
