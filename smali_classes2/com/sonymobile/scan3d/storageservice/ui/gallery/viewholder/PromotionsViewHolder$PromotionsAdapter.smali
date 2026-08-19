.class Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder$PromotionsAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "PromotionsViewHolder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PromotionsAdapter"
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field private mItemView:Landroidx/recyclerview/widget/RecyclerView;

.field final synthetic this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder;Landroid/content/Context;Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 0

    .line 104
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder$PromotionsAdapter;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder;

    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 105
    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder$PromotionsAdapter;->mContext:Landroid/content/Context;

    .line 106
    iput-object p3, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder$PromotionsAdapter;->mItemView:Landroidx/recyclerview/widget/RecyclerView;

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .line 130
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder$PromotionsAdapter;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder;

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder;->access$100(Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 1

    .line 115
    check-cast p1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;

    .line 116
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder$PromotionsAdapter;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder;

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder;->access$100(Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;

    .line 117
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder$PromotionsAdapter;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder;

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder;->access$100(Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->updateViewWidth(I)V

    .line 118
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->getBackgroundColor()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->setBackgroundColor(I)V

    .line 119
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->getTitle()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->setTitle(I)V

    .line 120
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->getDescription()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->setDescription(I)V

    .line 121
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->getImage()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->setImage(I)V

    .line 122
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder$PromotionsAdapter;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder;

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->setListener(Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder$PromotionItemListener;)V

    .line 123
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->isRemovable()Z

    move-result v0

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->setRemovable(Z)V

    .line 124
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->getLinkText()I

    move-result v0

    .line 125
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->getActionOnClick()I

    move-result p2

    invoke-virtual {p1, v0, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->setLink(II)V

    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 1

    .line 110
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder$PromotionsAdapter;->mContext:Landroid/content/Context;

    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder$PromotionsAdapter;->mItemView:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder$PromotionsAdapter;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder;

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder;->access$000(Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder;)Lcom/sonymobile/scan3d/storageservice/ui/IScanListener;

    move-result-object v0

    invoke-static {p1, p2, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->newInstance(Landroid/content/Context;Landroid/view/ViewGroup;Lcom/sonymobile/scan3d/storageservice/ui/IScanListener;)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    move-result-object p1

    return-object p1
.end method
