.class Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment$1;
.super Landroidx/databinding/OnRebindCallback;
.source "ViewerFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->setupBottomBar(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;)V
    .locals 0

    .line 837
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment$1;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;

    invoke-direct {p0}, Landroidx/databinding/OnRebindCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onBound(Landroidx/databinding/ViewDataBinding;)V
    .locals 0

    .line 840
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment$1;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;

    invoke-static {p1}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->access$000(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;)Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;

    move-result-object p1

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;->getImproveDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    instance-of p1, p1, Landroid/graphics/drawable/AnimationDrawable;

    if-eqz p1, :cond_0

    .line 841
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment$1;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;

    invoke-static {p1}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->access$000(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;)Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;

    move-result-object p1

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;->getImproveDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    check-cast p1, Landroid/graphics/drawable/AnimationDrawable;

    invoke-virtual {p1}, Landroid/graphics/drawable/AnimationDrawable;->start()V

    :cond_0
    return-void
.end method
