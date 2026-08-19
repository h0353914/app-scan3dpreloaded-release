.class public Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity;
.super Landroidx/fragment/app/FragmentActivity;
.source "QuickTipCategoriesActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoryHolder;,
        Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoriesAdapter;
    }
.end annotation


# static fields
.field private static final ANIMATION_DURATION:I = 0x14


# instance fields
.field private mAdapter:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoriesAdapter;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 36
    invoke-direct {p0}, Landroidx/fragment/app/FragmentActivity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity;)Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoriesAdapter;
    .locals 0

    .line 36
    iget-object p0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity;->mAdapter:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoriesAdapter;

    return-object p0
.end method

.method public static synthetic lambda$onCreate$0(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity;Landroid/view/View;)V
    .locals 0

    .line 56
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity;->finishAfterTransition()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 47
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0c0020

    .line 48
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity;->setContentView(I)V

    const p1, 0x7f090168

    .line 49
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/recyclerview/widget/RecyclerView;

    .line 50
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoriesAdapter;

    invoke-direct {v0, p0, p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoriesAdapter;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity;->mAdapter:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoriesAdapter;

    .line 51
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity;->mAdapter:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoriesAdapter;

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 52
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 53
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 54
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    const p1, 0x7f0901f8

    .line 55
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Toolbar;

    .line 56
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/-$$Lambda$QuickTipCategoriesActivity$-SYcL5fU6IuG7l5VVgdLxPU7Az0;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/-$$Lambda$QuickTipCategoriesActivity$-SYcL5fU6IuG7l5VVgdLxPU7Az0;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/Toolbar;->setNavigationOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
