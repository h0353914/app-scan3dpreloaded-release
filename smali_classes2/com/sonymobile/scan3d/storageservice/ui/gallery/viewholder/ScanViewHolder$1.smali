.class Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder$1;
.super Ljava/lang/Object;
.source "ScanViewHolder.java"

# interfaces
.implements Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder;)V
    .locals 0

    .line 80
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder$1;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic lambda$doClick$0(Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder$1;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Landroid/view/MenuItem;)Z
    .locals 1

    .line 88
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder$1;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder;

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder;->access$000(Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder;)Lcom/sonymobile/scan3d/storageservice/ui/IOnScanMenuItemClickListener;

    move-result-object v0

    invoke-interface {v0, p2, p1}, Lcom/sonymobile/scan3d/storageservice/ui/IOnScanMenuItemClickListener;->onScanMenuClick(Landroid/view/MenuItem;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)Z

    move-result p1

    return p1
.end method


# virtual methods
.method public doClick(Landroid/view/View;)V
    .locals 6

    .line 83
    new-instance v0, Landroid/widget/PopupMenu;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroid/widget/PopupMenu;-><init>(Landroid/content/Context;Landroid/view/View;)V

    .line 84
    invoke-virtual {v0}, Landroid/widget/PopupMenu;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v1

    const v2, 0x7f090007

    .line 85
    invoke-virtual {p1, v2}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    .line 86
    invoke-virtual {v0}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v2

    const v3, 0x7f0d0001

    invoke-virtual {v1, v3, v2}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 87
    new-instance v1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/-$$Lambda$ScanViewHolder$1$BTjiNyAGTOhK44LOUVELwc18Ls8;

    invoke-direct {v1, p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/-$$Lambda$ScanViewHolder$1$BTjiNyAGTOhK44LOUVELwc18Ls8;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder$1;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V

    invoke-virtual {v0, v1}, Landroid/widget/PopupMenu;->setOnMenuItemClickListener(Landroid/widget/PopupMenu$OnMenuItemClickListener;)V

    .line 89
    invoke-virtual {v0}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v1

    if-eqz p1, :cond_0

    .line 91
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getSharedMeshes()I

    move-result p1

    const v2, 0x7f090122

    .line 93
    invoke-interface {v1, v2}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v2

    int-to-long v3, p1

    invoke-static {v3, v4}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object p1

    const/4 v5, 0x1

    .line 94
    invoke-virtual {p1, v5}, Ljava/math/BigInteger;->testBit(I)Z

    move-result p1

    .line 93
    invoke-interface {v2, p1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    const p1, 0x7f090120

    .line 96
    invoke-interface {v1, p1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    invoke-static {v3, v4}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v2

    const/4 v5, 0x4

    .line 97
    invoke-virtual {v2, v5}, Ljava/math/BigInteger;->testBit(I)Z

    move-result v2

    .line 96
    invoke-interface {p1, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    const p1, 0x7f090121

    .line 99
    invoke-interface {v1, p1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    invoke-static {v3, v4}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v1

    const/4 v2, 0x5

    .line 100
    invoke-virtual {v1, v2}, Ljava/math/BigInteger;->testBit(I)Z

    move-result v1

    .line 99
    invoke-interface {p1, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 102
    :cond_0
    invoke-virtual {v0}, Landroid/widget/PopupMenu;->show()V

    return-void
.end method
