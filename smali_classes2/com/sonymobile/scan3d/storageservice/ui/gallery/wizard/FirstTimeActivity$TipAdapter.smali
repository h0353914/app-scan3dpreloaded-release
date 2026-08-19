.class Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity$TipAdapter;
.super Landroidx/fragment/app/FragmentStatePagerAdapter;
.source "FirstTimeActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TipAdapter"
.end annotation


# instance fields
.field private mHasRun:Z

.field private mListeners:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity$PageListener;",
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

.field private mZipResourceFile:Lcom/android/vending/expansion/zipfile/ZipResourceFile;


# direct methods
.method constructor <init>(Landroidx/fragment/app/FragmentManager;Ljava/util/List;ZLcom/android/vending/expansion/zipfile/ZipResourceFile;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/fragment/app/FragmentManager;",
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;",
            ">;Z",
            "Lcom/android/vending/expansion/zipfile/ZipResourceFile;",
            ")V"
        }
    .end annotation

    const/4 v0, 0x1

    .line 109
    invoke-direct {p0, p1, v0}, Landroidx/fragment/app/FragmentStatePagerAdapter;-><init>(Landroidx/fragment/app/FragmentManager;I)V

    .line 110
    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity$TipAdapter;->mTips:Ljava/util/List;

    .line 111
    new-instance p1, Landroid/util/SparseArray;

    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity$TipAdapter;->mTips:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p2

    invoke-direct {p1, p2}, Landroid/util/SparseArray;-><init>(I)V

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity$TipAdapter;->mListeners:Landroid/util/SparseArray;

    .line 112
    iput-boolean p3, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity$TipAdapter;->mHasRun:Z

    .line 113
    iput-object p4, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity$TipAdapter;->mZipResourceFile:Lcom/android/vending/expansion/zipfile/ZipResourceFile;

    return-void
.end method

.method private notifySelected(ZI)V
    .locals 1

    .line 168
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity$TipAdapter;->mListeners:Landroid/util/SparseArray;

    invoke-virtual {v0, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity$PageListener;

    if-eqz p2, :cond_0

    .line 170
    invoke-interface {p2, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity$PageListener;->onPageSelected(Z)V

    :cond_0
    return-void
.end method


# virtual methods
.method public destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 155
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/FragmentStatePagerAdapter;->destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V

    .line 156
    instance-of p1, p3, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity$PageListener;

    if-eqz p1, :cond_0

    .line 157
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity$TipAdapter;->mListeners:Landroid/util/SparseArray;

    invoke-virtual {p1, p2}, Landroid/util/SparseArray;->delete(I)V

    :cond_0
    return-void
.end method

.method public getCount()I
    .locals 1

    .line 132
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity$TipAdapter;->mTips:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Landroidx/fragment/app/Fragment;
    .locals 4

    .line 118
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity$TipAdapter;->mTips:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;

    .line 119
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->getType()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 126
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity$TipAdapter;->mZipResourceFile:Lcom/android/vending/expansion/zipfile/ZipResourceFile;

    invoke-static {v0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/TipFragment;->newInstance(Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;Lcom/android/vending/expansion/zipfile/ZipResourceFile;)Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/TipFragment;

    move-result-object p1

    return-object p1

    .line 121
    :pswitch_0
    iget-boolean v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity$TipAdapter;->mHasRun:Z

    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity$TipAdapter;->mTips:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    iget-object v3, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity$TipAdapter;->mZipResourceFile:Lcom/android/vending/expansion/zipfile/ZipResourceFile;

    invoke-static {v0, v1, p1, v2, v3}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment;->newInstance(Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;ZIILcom/android/vending/expansion/zipfile/ZipResourceFile;)Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment;

    move-result-object p1

    return-object p1

    .line 123
    :pswitch_1
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity$TipAdapter;->mZipResourceFile:Lcom/android/vending/expansion/zipfile/ZipResourceFile;

    invoke-static {v0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment;->newInstance(Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;Lcom/android/vending/expansion/zipfile/ZipResourceFile;)Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment;

    move-result-object p1

    return-object p1

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 2
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 146
    invoke-super {p0, p1, p2}, Landroidx/fragment/app/FragmentStatePagerAdapter;->instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;

    move-result-object p1

    .line 147
    instance-of v0, p1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity$PageListener;

    if-eqz v0, :cond_0

    .line 148
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity$TipAdapter;->mListeners:Landroid/util/SparseArray;

    move-object v1, p1

    check-cast v1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity$PageListener;

    invoke-virtual {v0, p2, v1}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    :cond_0
    return-object p1
.end method

.method public setPrimaryItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 137
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/FragmentStatePagerAdapter;->setPrimaryItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V

    add-int/lit8 p1, p2, -0x1

    const/4 p3, 0x0

    .line 138
    invoke-direct {p0, p3, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity$TipAdapter;->notifySelected(ZI)V

    const/4 p1, 0x1

    .line 139
    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity$TipAdapter;->notifySelected(ZI)V

    add-int/2addr p2, p1

    .line 140
    invoke-direct {p0, p3, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity$TipAdapter;->notifySelected(ZI)V

    return-void
.end method
