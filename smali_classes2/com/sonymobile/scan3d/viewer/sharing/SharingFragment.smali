.class public Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;
.super Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;
.source "SharingFragment.java"

# interfaces
.implements Lcom/sonymobile/scan3d/OnBackPressListener;
.implements Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$MeshLoadingListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$SharingPagerAdapter;,
        Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;
    }
.end annotation


# static fields
.field private static final KEY_SHAREABLE:Ljava/lang/String; = "shareable"

.field private static final KEY_TAB:Ljava/lang/String; = "tab"

.field private static final KEY_VIEW_MATRIX:Ljava/lang/String; = "view_matrix"

.field private static final LAST_TAB:Ljava/lang/String; = "last_tab"


# instance fields
.field private mLastTab:I

.field private mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 32
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;-><init>()V

    const/4 v0, -0x1

    .line 57
    iput v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;->mLastTab:I

    return-void
.end method

.method static synthetic access$000(Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;)Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    return-object p0
.end method

.method static synthetic access$100(Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;)I
    .locals 0

    .line 32
    iget p0, p0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;->mLastTab:I

    return p0
.end method

.method static synthetic access$102(Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;I)I
    .locals 0

    .line 32
    iput p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;->mLastTab:I

    return p1
.end method

.method public static newInstance(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;[FLcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;)Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;
    .locals 1

    const/4 v0, 0x0

    .line 71
    invoke-static {p0, p1, p2, v0}, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;->newInstance(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;[FLcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;Lcom/sonymobile/scan3d/viewer/sharing/Shareable;)Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;

    move-result-object p0

    return-object p0
.end method

.method private static newInstance(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;[FLcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;Lcom/sonymobile/scan3d/viewer/sharing/Shareable;)Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;
    .locals 2

    .line 97
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "view_matrix"

    .line 99
    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putFloatArray(Ljava/lang/String;[F)V

    const-string v1, "tab"

    .line 100
    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    if-nez p3, :cond_0

    .line 105
    new-instance p3, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    invoke-direct {p3}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;-><init>()V

    .line 106
    invoke-virtual {p3, p0}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setFileSet(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    move-result-object p0

    sget-object p2, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->DEFAULT:Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    .line 107
    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setShareType(Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    move-result-object p0

    const/4 p2, 0x0

    .line 108
    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setScanFormat(I)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    move-result-object p0

    .line 109
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setViewMatrix([F)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    :cond_0
    const-string p0, "shareable"

    .line 111
    invoke-virtual {p3}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->toBundle()Landroid/os/Bundle;

    move-result-object p1

    invoke-virtual {v0, p0, p1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 112
    new-instance p0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;

    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;-><init>()V

    .line 113
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;->setArguments(Landroid/os/Bundle;)V

    return-object p0
.end method

.method public static newInstance(Lcom/sonymobile/scan3d/viewer/sharing/Shareable;)Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;
    .locals 3

    .line 83
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->getFileSet()Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v0

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->getViewMatrix()[F

    move-result-object v1

    sget-object v2, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;->SHARE:Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;

    invoke-static {v0, v1, v2, p0}, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;->newInstance(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;[FLcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;Lcom/sonymobile/scan3d/viewer/sharing/Shareable;)Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;

    move-result-object p0

    return-object p0
.end method

.method public static tabToString(Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;)Ljava/lang/String;
    .locals 1

    .line 63
    sget-object v0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$1;->$SwitchMap$com$sonymobile$scan3d$viewer$sharing$SharingFragment$Tab:[I

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;->ordinal()I

    move-result p0

    aget p0, v0, p0

    packed-switch p0, :pswitch_data_0

    const-string p0, "Not Valid Tab"

    return-object p0

    :pswitch_0
    const-string p0, "Share"

    return-object p0

    :pswitch_1
    const-string p0, "Print"

    return-object p0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public getContentLayout()I
    .locals 1

    const v0, 0x7f0c0072

    return v0
.end method

.method public getTitleText()Ljava/lang/String;
    .locals 1

    const-string v0, ""

    return-object v0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 0
    .param p2    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 121
    invoke-super {p0, p1, p2, p3}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object p1

    if-eqz p3, :cond_0

    const-string p2, "last_tab"

    .line 124
    invoke-virtual {p3, p2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p2

    iput p2, p0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;->mLastTab:I

    .line 126
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p2

    invoke-static {p2}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getInstance(Landroidx/fragment/app/FragmentActivity;)Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    move-result-object p2

    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    .line 127
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {p2, p0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->setMeshLoadingListener(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$MeshLoadingListener;)V

    return-object p1
.end method

.method public onMeshLoadFailed(Landroid/net/Uri;)V
    .locals 0

    .line 171
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;->handleFailedMesh()V

    return-void
.end method

.method public onMeshLoaded(Landroid/net/Uri;Lcom/sonymobile/scan3d/viewer/ModelContainer;)V
    .locals 3

    .line 150
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;->isAdded()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 151
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;->getView()Landroid/view/View;

    move-result-object p1

    const p2, 0x7f090142

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/viewpager/widget/ViewPager;

    .line 152
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;->getView()Landroid/view/View;

    move-result-object p2

    const v0, 0x7f0901f8

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/Toolbar;

    .line 153
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/widget/Toolbar;->setTitle(Ljava/lang/CharSequence;)V

    .line 154
    new-instance p2, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$SharingPagerAdapter;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-direct {p2, p0, v0}, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$SharingPagerAdapter;-><init>(Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;Landroidx/fragment/app/FragmentManager;)V

    .line 155
    invoke-virtual {p1, p2}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Landroidx/viewpager/widget/PagerAdapter;)V

    .line 156
    iget v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;->mLastTab:I

    if-ltz v0, :cond_0

    goto :goto_0

    .line 157
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "tab"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;

    invoke-virtual {p2, v0}, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$SharingPagerAdapter;->getPageNumber(Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;)I

    move-result v0

    .line 158
    :goto_0
    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 159
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;->getView()Landroid/view/View;

    move-result-object p2

    const v0, 0x7f0901cf

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;

    .line 160
    invoke-virtual {p2, p1}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->setViewPager(Landroidx/viewpager/widget/ViewPager;)V

    const p1, 0x7f0c00b3

    const v0, 0x7f0901d9

    .line 161
    invoke-virtual {p2, p1, v0}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->setCustomTabView(II)V

    const/4 p1, 0x1

    .line 162
    new-array v0, p1, [I

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f060097

    invoke-virtual {v1, v2}, Landroid/content/Context;->getColor(I)I

    move-result v1

    const/4 v2, 0x0

    aput v1, v0, v2

    invoke-virtual {p2, v0}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->setSelectedIndicatorColors([I)V

    .line 163
    new-array p1, p1, [I

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0600c9

    invoke-virtual {v0, v1}, Landroid/content/Context;->getColor(I)I

    move-result v0

    aput v0, p1, v2

    invoke-virtual {p2, p1}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->setDividerColors([I)V

    .line 165
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;->dismissProgressDialog()V

    :cond_1
    return-void
.end method

.method public onMeshLoading(Landroid/net/Uri;)V
    .locals 1

    const p1, 0x7f10024a

    const/4 v0, 0x0

    .line 176
    invoke-virtual {p0, p1, v0}, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;->showProgressDialog(IZ)V

    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    .line 144
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    const-string v0, "last_tab"

    .line 145
    iget v1, p0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;->mLastTab:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 2
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 134
    invoke-super {p0, p1, p2}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 136
    new-instance p2, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "shareable"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/os/Bundle;

    invoke-direct {p2, v0}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;-><init>(Landroid/os/Bundle;)V

    .line 137
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->getScanFormat()I

    move-result p2

    const/4 v0, 0x1

    if-ne p2, v0, :cond_0

    const p2, 0x7f0901cf

    .line 138
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    return-void
.end method
