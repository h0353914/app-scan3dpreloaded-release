.class public Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "PromotionsViewHolder.java"

# interfaces
.implements Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/GalleryViewHolder;
.implements Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder$PromotionItemListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder$PromotionsAdapter;
    }
.end annotation


# static fields
.field public static final VIEW_TYPE:I = 0x7f0c00a9


# instance fields
.field private mAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

.field private final mContext:Landroid/content/Context;

.field private mPromotionTipsList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;",
            ">;"
        }
    .end annotation
.end field

.field private mScanListener:Lcom/sonymobile/scan3d/storageservice/ui/IScanListener;


# direct methods
.method private constructor <init>(Landroid/content/Context;Landroidx/recyclerview/widget/RecyclerView;Lcom/sonymobile/scan3d/storageservice/ui/IScanListener;)V
    .locals 1

    .line 67
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 68
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder;->mContext:Landroid/content/Context;

    .line 69
    iput-object p3, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder;->mScanListener:Lcom/sonymobile/scan3d/storageservice/ui/IScanListener;

    .line 71
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipParser;->getPromotionCards(Landroid/content/Context;)Ljava/util/List;

    move-result-object p3

    iput-object p3, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder;->mPromotionTipsList:Ljava/util/List;

    .line 73
    new-instance p3, Landroidx/recyclerview/widget/LinearLayoutManager;

    const/4 v0, 0x0

    invoke-direct {p3, p1, v0, v0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 75
    invoke-virtual {p2, p3}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 76
    new-instance p3, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder$PromotionsAdapter;

    invoke-direct {p3, p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder$PromotionsAdapter;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder;Landroid/content/Context;Landroidx/recyclerview/widget/RecyclerView;)V

    iput-object p3, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder;->mAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 77
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder;->mAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    invoke-virtual {p2, p1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    return-void
.end method

.method static synthetic access$000(Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder;)Lcom/sonymobile/scan3d/storageservice/ui/IScanListener;
    .locals 0

    .line 26
    iget-object p0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder;->mScanListener:Lcom/sonymobile/scan3d/storageservice/ui/IScanListener;

    return-object p0
.end method

.method static synthetic access$100(Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder;)Ljava/util/List;
    .locals 0

    .line 26
    iget-object p0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder;->mPromotionTipsList:Ljava/util/List;

    return-object p0
.end method

.method public static newInstance(Landroid/content/Context;Landroid/view/ViewGroup;Lcom/sonymobile/scan3d/storageservice/ui/IScanListener;)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 3

    .line 54
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0c00a9

    const/4 v2, 0x0

    .line 55
    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/recyclerview/widget/RecyclerView;

    .line 56
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder;

    invoke-direct {v0, p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder;-><init>(Landroid/content/Context;Landroidx/recyclerview/widget/RecyclerView;Lcom/sonymobile/scan3d/storageservice/ui/IScanListener;)V

    return-object v0
.end method


# virtual methods
.method public bind(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/ui/gallery/item/GalleryItem;Z)V
    .locals 0

    return-void
.end method

.method public onClose(Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;)V
    .locals 4

    .line 85
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder;->mPromotionTipsList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;

    .line 86
    invoke-virtual {v1}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->getDescription()I

    move-result v2

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->getDescriptionId()I

    move-result v3

    if-ne v2, v3, :cond_0

    .line 87
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder;->mPromotionTipsList:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 88
    invoke-virtual {v1}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->getDescription()I

    move-result v0

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->getExpireDate()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder;->mContext:Landroid/content/Context;

    invoke-static {v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipParser;->saveRemovedItemToPrefs(ILjava/lang/String;Landroid/content/Context;)V

    .line 89
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder;->mAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->getAdapterPosition()I

    move-result p1

    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRemoved(I)V

    .line 90
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder;->mAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder;->mPromotionTipsList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRangeChanged(II)V

    return-void

    :cond_1
    return-void
.end method
