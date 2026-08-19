.class Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$1;
.super Ljava/lang/Object;
.source "FaceBlendFragment.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;)V
    .locals 0

    .line 194
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$1;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 0

    int-to-float p2, p2

    .line 198
    invoke-virtual {p1}, Landroid/widget/SeekBar;->getMax()I

    move-result p3

    int-to-float p3, p3

    div-float/2addr p2, p3

    .line 199
    invoke-virtual {p1}, Landroid/widget/SeekBar;->getId()I

    move-result p1

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 204
    :pswitch_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$1;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getFaceBlender()Lcom/sonymobile/scan3d/viewer/FaceBlender;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/viewer/FaceBlender;->setMeshSlider(F)V

    goto :goto_0

    .line 201
    :pswitch_1
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$1;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getFaceBlender()Lcom/sonymobile/scan3d/viewer/FaceBlender;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/viewer/FaceBlender;->setTextureSlider(F)V

    .line 209
    :goto_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$1;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->requestRenderGLTextureView()V

    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method
