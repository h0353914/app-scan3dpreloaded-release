.class public Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanSmallViewHolder;
.super Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder;
.source "ScanSmallViewHolder.java"


# static fields
.field public static final VIEW_TYPE:I = 0x7f0c006b


# direct methods
.method private constructor <init>(Landroid/view/View;Lcom/sonymobile/scan3d/storageservice/ui/IScanListener;Lcom/sonymobile/scan3d/storageservice/ui/IOnScanMenuItemClickListener;Z)V
    .locals 0

    .line 32
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder;-><init>(Landroid/view/View;Lcom/sonymobile/scan3d/storageservice/ui/IScanListener;Lcom/sonymobile/scan3d/storageservice/ui/IOnScanMenuItemClickListener;Z)V

    return-void
.end method

.method public static newInstance(Landroid/content/Context;Landroid/view/ViewGroup;Lcom/sonymobile/scan3d/storageservice/ui/IScanListener;Lcom/sonymobile/scan3d/storageservice/ui/IOnScanMenuItemClickListener;Z)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 2

    .line 24
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p0

    const v0, 0x7f0c006b

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    .line 26
    new-instance p1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanSmallViewHolder;

    invoke-direct {p1, p0, p2, p3, p4}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanSmallViewHolder;-><init>(Landroid/view/View;Lcom/sonymobile/scan3d/storageservice/ui/IScanListener;Lcom/sonymobile/scan3d/storageservice/ui/IOnScanMenuItemClickListener;Z)V

    return-object p1
.end method
