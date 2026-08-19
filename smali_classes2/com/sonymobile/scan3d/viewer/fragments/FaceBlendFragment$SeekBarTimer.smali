.class Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SeekBarTimer;
.super Landroid/os/CountDownTimer;
.source "FaceBlendFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SeekBarTimer"
.end annotation


# static fields
.field private static final INTERVAL:J = 0xaL

.field private static final NUMBER_OF_SWEEPS:I = 0x2

.field private static final TIMESTAMP_TO_PROGRESS_RATIO:I = 0x14

.field private static final TIME_PER_SWEEP:I = 0x7d0


# instance fields
.field private mProgressBar:Landroid/widget/ProgressBar;

.field private mTotalTime:J

.field final synthetic this$0:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;I)V
    .locals 4

    .line 258
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SeekBarTimer;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;

    mul-int/lit8 p2, p2, 0x14

    add-int/lit16 p2, p2, 0xfa0

    int-to-long v0, p2

    const-wide/16 v2, 0xa

    .line 259
    invoke-direct {p0, v0, v1, v2, v3}, Landroid/os/CountDownTimer;-><init>(JJ)V

    .line 260
    iput-wide v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SeekBarTimer;->mTotalTime:J

    .line 262
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getView()Landroid/view/View;

    move-result-object p2

    if-eqz p2, :cond_0

    .line 263
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getView()Landroid/view/View;

    move-result-object p1

    const p2, 0x7f090179

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ProgressBar;

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SeekBarTimer;->mProgressBar:Landroid/widget/ProgressBar;

    .line 264
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SeekBarTimer;->mProgressBar:Landroid/widget/ProgressBar;

    iget-wide v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SeekBarTimer;->mTotalTime:J

    long-to-int p2, v0

    invoke-virtual {p1, p2}, Landroid/widget/ProgressBar;->setMax(I)V

    :cond_0
    return-void
.end method


# virtual methods
.method public onFinish()V
    .locals 2

    .line 313
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SeekBarTimer;->mProgressBar:Landroid/widget/ProgressBar;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 314
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SeekBarTimer;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;

    iget-object v0, v0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mGLTextureView:Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;->stopEncoder()V

    return-void
.end method

.method public onTick(J)V
    .locals 6

    .line 270
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SeekBarTimer;->mProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_0

    .line 271
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SeekBarTimer;->mProgressBar:Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 273
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SeekBarTimer;->mProgressBar:Landroid/widget/ProgressBar;

    iget-wide v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SeekBarTimer;->mTotalTime:J

    sub-long/2addr v1, p1

    long-to-int v1, v1

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 288
    iget-wide v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SeekBarTimer;->mTotalTime:J

    sub-long/2addr v0, p1

    long-to-double v0, v0

    const-wide v2, 0x3f40624dd2f1a9fcL    # 5.0E-4

    const-wide v4, 0x40af400000000000L    # 4000.0

    rem-double/2addr v0, v4

    const-wide v4, 0x409f400000000000L    # 2000.0

    sub-double/2addr v0, v4

    .line 290
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    move-result-wide v0

    sub-double/2addr v4, v0

    mul-double/2addr v4, v2

    double-to-float v0, v4

    const-wide/16 v1, 0xfa0

    .line 296
    iget-wide v3, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SeekBarTimer;->mTotalTime:J

    sub-long/2addr v3, p1

    cmp-long p1, v1, v3

    if-lez p1, :cond_1

    .line 297
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SeekBarTimer;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getFaceBlender()Lcom/sonymobile/scan3d/viewer/FaceBlender;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/viewer/FaceBlender;->setMeshSlider(F)V

    .line 298
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SeekBarTimer;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getFaceBlender()Lcom/sonymobile/scan3d/viewer/FaceBlender;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/viewer/FaceBlender;->setTextureSlider(F)V

    goto :goto_0

    :cond_1
    const/high16 p1, 0x42c80000    # 100.0f

    mul-float/2addr p1, v0

    float-to-int p1, p1

    .line 301
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SeekBarTimer;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;

    invoke-static {p2}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->access$000(Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;)I

    move-result p2

    if-ge p1, p2, :cond_2

    .line 302
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SeekBarTimer;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getFaceBlender()Lcom/sonymobile/scan3d/viewer/FaceBlender;

    move-result-object p2

    invoke-virtual {p2, v0}, Lcom/sonymobile/scan3d/viewer/FaceBlender;->setMeshSlider(F)V

    .line 304
    :cond_2
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SeekBarTimer;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;

    invoke-static {p2}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->access$100(Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;)I

    move-result p2

    if-ge p1, p2, :cond_3

    .line 305
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SeekBarTimer;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getFaceBlender()Lcom/sonymobile/scan3d/viewer/FaceBlender;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/viewer/FaceBlender;->setTextureSlider(F)V

    .line 308
    :cond_3
    :goto_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SeekBarTimer;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->requestRenderGLTextureView()V

    return-void
.end method
