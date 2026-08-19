.class Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment$TipAdapter;
.super Landroidx/fragment/app/FragmentStatePagerAdapter;
.source "PagerFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TipAdapter"
.end annotation


# instance fields
.field private mListeners:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/OnFragmentSelectedListener;",
            ">;"
        }
    .end annotation
.end field

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
.method constructor <init>(Landroidx/fragment/app/FragmentManager;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/fragment/app/FragmentManager;",
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x1

    .line 77
    invoke-direct {p0, p1, v0}, Landroidx/fragment/app/FragmentStatePagerAdapter;-><init>(Landroidx/fragment/app/FragmentManager;I)V

    .line 78
    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment$TipAdapter;->mTips:Ljava/util/List;

    .line 79
    new-instance p1, Landroid/util/SparseArray;

    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment$TipAdapter;->mTips:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p2

    invoke-direct {p1, p2}, Landroid/util/SparseArray;-><init>(I)V

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment$TipAdapter;->mListeners:Landroid/util/SparseArray;

    return-void
.end method

.method private notifySelected(Landroidx/fragment/app/Fragment;)V
    .locals 1

    .line 139
    instance-of v0, p1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/OnFragmentSelectedListener;

    if-eqz v0, :cond_0

    .line 140
    check-cast p1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/OnFragmentSelectedListener;

    const/4 v0, 0x1

    invoke-interface {p1, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/OnFragmentSelectedListener;->onFragmentSelected(Z)V

    :cond_0
    return-void
.end method


# virtual methods
.method public destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0

    .line 127
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/FragmentStatePagerAdapter;->destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V

    .line 128
    instance-of p1, p3, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/OnFragmentSelectedListener;

    if-eqz p1, :cond_0

    .line 129
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment$TipAdapter;->mListeners:Landroid/util/SparseArray;

    invoke-virtual {p1, p2}, Landroid/util/SparseArray;->delete(I)V

    :cond_0
    return-void
.end method

.method public getCount()I
    .locals 1

    .line 107
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment$TipAdapter;->mTips:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method getFragmentSelectedListener(I)Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/OnFragmentSelectedListener;
    .locals 2

    .line 151
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment$TipAdapter;->mListeners:Landroid/util/SparseArray;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/util/SparseArray;->get(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/OnFragmentSelectedListener;

    return-object p1
.end method

.method public getItem(I)Landroidx/fragment/app/Fragment;
    .locals 2

    .line 84
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment$TipAdapter;->mTips:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;

    .line 87
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->getType()I

    move-result v0

    const/4 v1, 0x4

    if-eq v0, v1, :cond_0

    packed-switch v0, :pswitch_data_0

    .line 99
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/TipFragment;->newInstance(Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;)Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/TipFragment;

    move-result-object p1

    goto :goto_0

    .line 92
    :pswitch_0
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/YoutubeTipFragment;->newInstance(Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;)Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/YoutubeTipFragment;

    move-result-object p1

    goto :goto_0

    .line 89
    :pswitch_1
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/ImageTipFragment;->newInstance(Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;)Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/ImageTipFragment;

    move-result-object p1

    goto :goto_0

    .line 95
    :cond_0
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment;->newInstance(Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;)Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/TipFragment;

    move-result-object p1

    :goto_0
    return-object p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 2

    .line 118
    invoke-super {p0, p1, p2}, Landroidx/fragment/app/FragmentStatePagerAdapter;->instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;

    move-result-object p1

    .line 119
    instance-of v0, p1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/OnFragmentSelectedListener;

    if-eqz v0, :cond_0

    .line 120
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment$TipAdapter;->mListeners:Landroid/util/SparseArray;

    move-object v1, p1

    check-cast v1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/OnFragmentSelectedListener;

    invoke-virtual {v0, p2, v1}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    :cond_0
    return-object p1
.end method

.method public setPrimaryItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0

    .line 112
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/FragmentStatePagerAdapter;->setPrimaryItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V

    .line 113
    check-cast p3, Landroidx/fragment/app/Fragment;

    invoke-direct {p0, p3}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment$TipAdapter;->notifySelected(Landroidx/fragment/app/Fragment;)V

    return-void
.end method
