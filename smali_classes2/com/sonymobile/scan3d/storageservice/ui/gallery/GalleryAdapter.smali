.class Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "GalleryAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Landroidx/recyclerview/widget/RecyclerView$ViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field private mExcludedUris:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation
.end field

.field private mFileSets:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;",
            ">;"
        }
    .end annotation
.end field

.field private mImprovements:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/net/Uri;",
            "Lcom/sonymobile/scan3d/storageservice/provider/Improvement;",
            ">;"
        }
    .end annotation
.end field

.field private mIsSignedIn:Z

.field private mList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/ui/gallery/item/GalleryItem;",
            ">;"
        }
    .end annotation
.end field

.field private final mOnScanMenuClicked:Lcom/sonymobile/scan3d/storageservice/ui/IOnScanMenuItemClickListener;

.field private final mScanListener:Lcom/sonymobile/scan3d/storageservice/ui/IScanListener;

.field private final mScanTypesToInclude:[I

.field private mShowPromotions:Z

.field private final mShowWebShare:Z

.field private mSpanCount:I


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/ui/IScanListener;Lcom/sonymobile/scan3d/storageservice/ui/IOnScanMenuItemClickListener;ZZ[ILjava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/sonymobile/scan3d/storageservice/ui/IScanListener;",
            "Lcom/sonymobile/scan3d/storageservice/ui/IOnScanMenuItemClickListener;",
            "ZZ[I",
            "Ljava/util/ArrayList<",
            "Landroid/net/Uri;",
            ">;)V"
        }
    .end annotation

    .line 106
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    const/4 v0, 0x2

    .line 81
    iput v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mSpanCount:I

    .line 88
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mList:Ljava/util/List;

    .line 93
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mImprovements:Ljava/util/Map;

    .line 107
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mContext:Landroid/content/Context;

    .line 108
    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mScanListener:Lcom/sonymobile/scan3d/storageservice/ui/IScanListener;

    .line 109
    iput-object p3, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mOnScanMenuClicked:Lcom/sonymobile/scan3d/storageservice/ui/IOnScanMenuItemClickListener;

    .line 110
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mFileSets:Ljava/util/List;

    .line 111
    iput-boolean p4, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mShowPromotions:Z

    const/4 p2, 0x1

    xor-int/lit8 p3, p5, 0x1

    .line 112
    iput-boolean p3, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mShowWebShare:Z

    .line 113
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->isSignedIn(Landroid/content/Context;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mIsSignedIn:Z

    .line 114
    iput-object p6, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mScanTypesToInclude:[I

    .line 115
    iput-object p7, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mExcludedUris:Ljava/util/ArrayList;

    .line 118
    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->setHasStableIds(Z)V

    .line 120
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->createContentList()V

    return-void
.end method

.method private createContentList()V
    .locals 7

    .line 124
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 125
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mShowPromotions:Z

    if-eqz v0, :cond_0

    .line 126
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mList:Ljava/util/List;

    new-instance v1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/item/PromotionsItem;

    iget v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mSpanCount:I

    invoke-direct {v1, v2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/item/PromotionsItem;-><init>(I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 129
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mFileSets:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    .line 130
    invoke-direct {p0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->shouldIncludeScan(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 131
    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mList:Ljava/util/List;

    new-instance v3, Lcom/sonymobile/scan3d/storageservice/ui/gallery/item/ScanItem;

    iget-object v4, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mImprovements:Ljava/util/Map;

    invoke-interface {v1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getUri()Landroid/net/Uri;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;

    iget v5, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mSpanCount:I

    const/4 v6, 0x1

    if-eq v5, v6, :cond_2

    goto :goto_1

    :cond_2
    const/4 v6, 0x0

    :goto_1
    invoke-direct {v3, v1, v4, v6}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/item/ScanItem;-><init>(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/provider/Improvement;Z)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_3
    return-void
.end method

.method static synthetic lambda$shouldIncludeScan$0(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;I)Z
    .locals 0

    .line 140
    invoke-interface {p0}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getScanType()I

    move-result p0

    if-eq p1, p0, :cond_1

    const p0, 0x7fffffff

    if-ne p1, p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method private shouldIncludeScan(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)Z
    .locals 4

    .line 139
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mScanTypesToInclude:[I

    invoke-static {v0}, Ljava/util/stream/IntStream;->of([I)Ljava/util/stream/IntStream;

    move-result-object v0

    new-instance v1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/-$$Lambda$GalleryAdapter$ILFUoGaBNV87WfKDma9okvc__XE;

    invoke-direct {v1, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/-$$Lambda$GalleryAdapter$ILFUoGaBNV87WfKDma9okvc__XE;-><init>(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V

    invoke-interface {v0, v1}, Ljava/util/stream/IntStream;->anyMatch(Ljava/util/function/IntPredicate;)Z

    move-result v0

    .line 142
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mExcludedUris:Ljava/util/ArrayList;

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_0

    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getUri()Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    move p1, v2

    goto :goto_0

    :cond_0
    move p1, v3

    :goto_0
    if-eqz v0, :cond_1

    if-nez p1, :cond_1

    goto :goto_1

    :cond_1
    move v2, v3

    :goto_1
    return v2
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .line 173
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItemId(I)J
    .locals 2

    .line 178
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/item/GalleryItem;

    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/item/GalleryItem;->getItemId()J

    move-result-wide v0

    return-wide v0
.end method

.method public getItemViewType(I)I
    .locals 1

    .line 168
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/item/GalleryItem;

    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/item/GalleryItem;->getViewHolderType()I

    move-result p1

    return p1
.end method

.method getSpanCount(I)I
    .locals 1

    .line 253
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/item/GalleryItem;

    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/item/GalleryItem;->getSpanCount()I

    move-result p1

    return p1
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 2
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 163
    check-cast p1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/GalleryViewHolder;

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mList:Ljava/util/List;

    invoke-interface {v1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/sonymobile/scan3d/storageservice/ui/gallery/item/GalleryItem;

    iget-boolean v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mIsSignedIn:Z

    invoke-interface {p1, v0, p2, v1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/GalleryViewHolder;->bind(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/ui/gallery/item/GalleryItem;Z)V

    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 3
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    const v0, 0x7f0c00a9

    if-eq p2, v0, :cond_0

    packed-switch p2, :pswitch_data_0

    .line 157
    new-instance p1, Ljava/lang/RuntimeException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unknown ViewType: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 155
    :pswitch_0
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mContext:Landroid/content/Context;

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mScanListener:Lcom/sonymobile/scan3d/storageservice/ui/IScanListener;

    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mOnScanMenuClicked:Lcom/sonymobile/scan3d/storageservice/ui/IOnScanMenuItemClickListener;

    iget-boolean v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mShowWebShare:Z

    invoke-static {p2, p1, v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanSmallViewHolder;->newInstance(Landroid/content/Context;Landroid/view/ViewGroup;Lcom/sonymobile/scan3d/storageservice/ui/IScanListener;Lcom/sonymobile/scan3d/storageservice/ui/IOnScanMenuItemClickListener;Z)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    move-result-object p1

    return-object p1

    .line 153
    :pswitch_1
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mContext:Landroid/content/Context;

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mScanListener:Lcom/sonymobile/scan3d/storageservice/ui/IScanListener;

    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mOnScanMenuClicked:Lcom/sonymobile/scan3d/storageservice/ui/IOnScanMenuItemClickListener;

    iget-boolean v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mShowWebShare:Z

    invoke-static {p2, p1, v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder;->newInstance(Landroid/content/Context;Landroid/view/ViewGroup;Lcom/sonymobile/scan3d/storageservice/ui/IScanListener;Lcom/sonymobile/scan3d/storageservice/ui/IOnScanMenuItemClickListener;Z)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    move-result-object p1

    return-object p1

    .line 151
    :cond_0
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mContext:Landroid/content/Context;

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mScanListener:Lcom/sonymobile/scan3d/storageservice/ui/IScanListener;

    invoke-static {p2, p1, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionsViewHolder;->newInstance(Landroid/content/Context;Landroid/view/ViewGroup;Lcom/sonymobile/scan3d/storageservice/ui/IScanListener;)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    move-result-object p1

    return-object p1

    :pswitch_data_0
    .packed-switch 0x7f0c006a
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method setFileSets(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;",
            ">;)V"
        }
    .end annotation

    .line 199
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mFileSets:Ljava/util/List;

    .line 201
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->createContentList()V

    .line 202
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method setImprovements(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/provider/Improvement;",
            ">;)V"
        }
    .end annotation

    if-nez p1, :cond_0

    return-void

    .line 215
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mImprovements:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 217
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;

    .line 218
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mImprovements:Ljava/util/Map;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->getParentUri()Landroid/net/Uri;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 222
    :cond_1
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mFileSets:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_2

    .line 223
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->createContentList()V

    .line 224
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->notifyDataSetChanged()V

    :cond_2
    return-void
.end method

.method public setIsSignedIn(Z)V
    .locals 1

    .line 187
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mIsSignedIn:Z

    if-eq v0, p1, :cond_0

    .line 188
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mIsSignedIn:Z

    .line 189
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->notifyDataSetChanged()V

    :cond_0
    return-void
.end method

.method setShowPromotions(Z)V
    .locals 1

    .line 234
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mShowPromotions:Z

    if-eq v0, p1, :cond_0

    .line 235
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mShowPromotions:Z

    .line 236
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->createContentList()V

    .line 237
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->notifyDataSetChanged()V

    :cond_0
    return-void
.end method

.method setSpanCount(I)V
    .locals 0

    .line 247
    iput p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->mSpanCount:I

    .line 248
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->createContentList()V

    .line 249
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->notifyDataSetChanged()V

    return-void
.end method
