.class public Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment;
.super Landroidx/fragment/app/Fragment;
.source "PagerFragment.java"

# interfaces
.implements Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/OnCloseListener;
.implements Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment$TipAdapter;
    }
.end annotation


# static fields
.field public static final KEY_CATEGORY:Ljava/lang/String; = "key_category"

.field public static final KEY_TIP_INDEX:Ljava/lang/String; = "key_tip_index"


# instance fields
.field private mAdapter:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment$TipAdapter;

.field private mPager:Landroidx/viewpager/widget/ViewPager;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    return-void
.end method

.method private static getTipsWithVisuals(Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;",
            ")",
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;",
            ">;"
        }
    .end annotation

    .line 252
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 253
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->getTips()Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;

    .line 254
    invoke-virtual {v1}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->getType()I

    move-result v2

    if-lez v2, :cond_0

    .line 255
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public static newInstance(Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;I)Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment;
    .locals 2

    .line 156
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "key_category"

    .line 157
    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string p0, "key_tip_index"

    .line 158
    invoke-virtual {v0, p0, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 160
    new-instance p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment;

    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment;-><init>()V

    .line 161
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment;->setArguments(Landroid/os/Bundle;)V

    return-object p0
.end method

.method private notifyUnselected(I)V
    .locals 1

    .line 237
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment;->mAdapter:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment$TipAdapter;

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment$TipAdapter;->getFragmentSelectedListener(I)Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/OnFragmentSelectedListener;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    .line 240
    invoke-interface {p1, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/OnFragmentSelectedListener;->onFragmentSelected(Z)V

    :cond_0
    return-void
.end method


# virtual methods
.method public onClose()V
    .locals 1

    .line 200
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->finish()V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 3
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const/4 p3, 0x0

    const v0, 0x7f0c00ca

    .line 169
    invoke-virtual {p1, v0, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f0900f9

    .line 171
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicatorControl;

    .line 172
    invoke-virtual {p2, p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicatorControl;->setOnCloseListener(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/OnCloseListener;)V

    .line 175
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p2

    const-string v0, "key_category"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p2

    check-cast p2, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;

    .line 174
    invoke-static {p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment;->getTipsWithVisuals(Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;)Ljava/util/List;

    move-result-object p2

    const v0, 0x7f09021b

    .line 177
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/viewpager/widget/ViewPager;

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment;->mPager:Landroidx/viewpager/widget/ViewPager;

    .line 178
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment;->mPager:Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {v0, p0}, Landroidx/viewpager/widget/ViewPager;->addOnPageChangeListener(Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;)V

    .line 179
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment$TipAdapter;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    invoke-direct {v0, v1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment$TipAdapter;-><init>(Landroidx/fragment/app/FragmentManager;Ljava/util/List;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment;->mAdapter:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment$TipAdapter;

    .line 180
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment;->mPager:Landroidx/viewpager/widget/ViewPager;

    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment;->mAdapter:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment$TipAdapter;

    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Landroidx/viewpager/widget/PagerAdapter;)V

    .line 183
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "key_tip_index"

    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 184
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p2

    if-ge v0, p2, :cond_1

    .line 185
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/res/Configuration;->getLayoutDirection()I

    move-result p2

    const/4 v1, 0x1

    if-ne p2, v1, :cond_0

    .line 186
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment;->mPager:Landroidx/viewpager/widget/ViewPager;

    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment;->mAdapter:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment$TipAdapter;

    invoke-virtual {v2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment$TipAdapter;->getCount()I

    move-result v2

    sub-int/2addr v2, v1

    sub-int/2addr v2, v0

    invoke-virtual {p2, v2, p3}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(IZ)V

    goto :goto_0

    .line 188
    :cond_0
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment;->mPager:Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {p2, v0, p3}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(IZ)V

    :cond_1
    :goto_0
    return-object p1
.end method

.method public onPageScrollStateChanged(I)V
    .locals 2

    .line 218
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment;->mPager:Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    move-result v0

    const/4 v1, 0x1

    if-eq p1, v1, :cond_0

    goto :goto_0

    .line 222
    :cond_0
    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment;->notifyUnselected(I)V

    add-int/lit8 p1, v0, -0x1

    .line 223
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment;->notifyUnselected(I)V

    add-int/2addr v0, v1

    .line 224
    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment;->notifyUnselected(I)V

    :goto_0
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    return-void
.end method

.method public onPageSelected(I)V
    .locals 0

    return-void
.end method
