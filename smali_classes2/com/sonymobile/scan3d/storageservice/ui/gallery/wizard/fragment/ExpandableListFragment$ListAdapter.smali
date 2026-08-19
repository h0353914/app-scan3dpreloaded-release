.class Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/ExpandableListFragment$ListAdapter;
.super Landroid/widget/BaseAdapter;
.source "ExpandableListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/ExpandableListFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ListAdapter"
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field private final mTips:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;",
            ">;)V"
        }
    .end annotation

    .line 75
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 76
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/ExpandableListFragment$ListAdapter;->mContext:Landroid/content/Context;

    .line 77
    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/ExpandableListFragment$ListAdapter;->mTips:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .line 115
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/ExpandableListFragment$ListAdapter;->mTips:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;
    .locals 1

    .line 82
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/ExpandableListFragment$ListAdapter;->mTips:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;

    return-object p1
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 58
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/ExpandableListFragment$ListAdapter;->getItem(I)Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;

    move-result-object p1

    return-object p1
.end method

.method public getItemId(I)J
    .locals 2

    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    const/4 v0, 0x0

    if-nez p2, :cond_0

    .line 93
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/ExpandableListFragment$ListAdapter;->mContext:Landroid/content/Context;

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v1, 0x7f0c00bc

    invoke-virtual {p2, v1, p3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 97
    :cond_0
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/ExpandableListFragment$ListAdapter;->getItem(I)Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;

    move-result-object p1

    const p3, 0x7f0901f3

    .line 98
    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/widget/TextView;

    .line 99
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->getTitle()I

    move-result v1

    invoke-virtual {p3, v1}, Landroid/widget/TextView;->setText(I)V

    const p3, 0x7f0900a4

    .line 101
    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/widget/TextView;

    .line 102
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->getDescription()I

    move-result v1

    invoke-virtual {p3, v1}, Landroid/widget/TextView;->setText(I)V

    .line 104
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->getImage()I

    move-result p3

    if-eqz p3, :cond_1

    const p3, 0x7f0900f1

    .line 105
    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/widget/ImageView;

    .line 106
    invoke-virtual {p3, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 107
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->getImage()I

    move-result p1

    invoke-virtual {p3, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    :cond_1
    return-object p2
.end method
