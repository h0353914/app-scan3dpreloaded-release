.class Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoriesAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "QuickTipCategoriesActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "QuickTipCategoriesAdapter"
.end annotation


# instance fields
.field private mCategories:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;",
            ">;"
        }
    .end annotation
.end field

.field private mExpandedItemPosition:I

.field final synthetic this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity;Landroid/content/Context;)V
    .locals 0

    .line 64
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoriesAdapter;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity;

    .line 65
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    const/4 p1, 0x0

    .line 62
    iput p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoriesAdapter;->mExpandedItemPosition:I

    .line 66
    invoke-static {p2}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipParser;->getQuickTutorials(Landroid/content/Context;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoriesAdapter;->mCategories:Ljava/util/List;

    return-void
.end method

.method static synthetic access$100(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoriesAdapter;I)V
    .locals 0

    .line 59
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoriesAdapter;->toggleExpand(I)V

    return-void
.end method

.method private toggleExpand(I)V
    .locals 2

    .line 88
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoriesAdapter;->mExpandedItemPosition:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoriesAdapter;->notifyItemChanged(I)V

    .line 89
    :cond_0
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoriesAdapter;->notifyItemChanged(I)V

    .line 90
    iput p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoriesAdapter;->mExpandedItemPosition:I

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .line 84
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoriesAdapter;->mCategories:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 1

    .line 78
    check-cast p1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoryHolder;

    .line 79
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoriesAdapter;->mCategories:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;

    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoriesAdapter;->mExpandedItemPosition:I

    invoke-virtual {p1, p2, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoryHolder;->bind(Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;I)V

    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 2

    .line 71
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v0, 0x7f0c00aa

    const/4 v1, 0x0

    .line 72
    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 73
    new-instance p2, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoryHolder;

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoriesAdapter;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity;

    invoke-direct {p2, v0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoryHolder;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity;Landroid/view/View;)V

    return-object p2
.end method
