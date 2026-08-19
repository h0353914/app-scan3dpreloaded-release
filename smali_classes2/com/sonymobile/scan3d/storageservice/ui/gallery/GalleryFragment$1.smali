.class Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment$1;
.super Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;
.source "GalleryFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;)V
    .locals 0

    .line 615
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment$1;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;

    invoke-direct {p0}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;-><init>()V

    return-void
.end method


# virtual methods
.method public getSpanSize(I)I
    .locals 1

    .line 618
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment$1;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->access$000(Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;)Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->getSpanCount(I)I

    move-result p1

    return p1
.end method
