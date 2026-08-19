.class public final synthetic Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/-$$Lambda$ScanViewHolder$1$BTjiNyAGTOhK44LOUVELwc18Ls8;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Landroid/widget/PopupMenu$OnMenuItemClickListener;


# instance fields
.field private final synthetic f$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder$1;

.field private final synthetic f$1:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;


# direct methods
.method public synthetic constructor <init>(Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder$1;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/-$$Lambda$ScanViewHolder$1$BTjiNyAGTOhK44LOUVELwc18Ls8;->f$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder$1;

    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/-$$Lambda$ScanViewHolder$1$BTjiNyAGTOhK44LOUVELwc18Ls8;->f$1:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    return-void
.end method


# virtual methods
.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 2

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/-$$Lambda$ScanViewHolder$1$BTjiNyAGTOhK44LOUVELwc18Ls8;->f$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder$1;

    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/-$$Lambda$ScanViewHolder$1$BTjiNyAGTOhK44LOUVELwc18Ls8;->f$1:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    invoke-static {v0, v1, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder$1;->lambda$doClick$0(Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder$1;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Landroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method
