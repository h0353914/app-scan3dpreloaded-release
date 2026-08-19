.class Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment$1;
.super Ljava/lang/Object;
.source "PrintEditFragment.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->setupBottomBar(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;)V
    .locals 0

    .line 131
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment$1;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 0

    .line 136
    iget-object p3, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment$1;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;

    invoke-virtual {p3}, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->getRenderer()Lcom/sonymobile/scan3d/viewer/MeshRenderer;

    move-result-object p3

    int-to-float p2, p2

    invoke-virtual {p1}, Landroid/widget/SeekBar;->getMax()I

    move-result p1

    int-to-float p1, p1

    div-float/2addr p2, p1

    invoke-virtual {p3, p2}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->onSeek(F)Z

    .line 137
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment$1;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->requestRenderGLTextureView()V

    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 1

    .line 142
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment$1;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->access$002(Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;Z)Z

    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method
