.class public Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/ExpandableListFragment;
.super Landroidx/fragment/app/Fragment;
.source "ExpandableListFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/ExpandableListFragment$ListAdapter;
    }
.end annotation


# static fields
.field public static final KEY_CATEGORY:Ljava/lang/String; = "key_category"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    return-void
.end method

.method private static getExpandableTips(Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;)Ljava/util/List;
    .locals 4
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

    .line 157
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 158
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

    .line 159
    invoke-virtual {v1}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->getType()I

    move-result v2

    const/4 v3, 0x1

    if-gt v2, v3, :cond_0

    .line 160
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public static newInstance(Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;)Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/ExpandableListFragment;
    .locals 2

    .line 126
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "key_category"

    .line 127
    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 129
    new-instance p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/ExpandableListFragment;

    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/ExpandableListFragment;-><init>()V

    .line 130
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/ExpandableListFragment;->setArguments(Landroid/os/Bundle;)V

    return-object p0
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const p3, 0x7f0c00c9

    const/4 v0, 0x0

    .line 138
    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 141
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/ExpandableListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p2

    const-string p3, "key_category"

    invoke-virtual {p2, p3}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p2

    check-cast p2, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;

    .line 140
    invoke-static {p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/ExpandableListFragment;->getExpandableTips(Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;)Ljava/util/List;

    move-result-object p2

    const p3, 0x7f09010f

    .line 143
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/widget/ListView;

    .line 144
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/ExpandableListFragment$ListAdapter;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/ExpandableListFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/ExpandableListFragment$ListAdapter;-><init>(Landroid/content/Context;Ljava/util/List;)V

    invoke-virtual {p3, v0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 145
    invoke-virtual {p3, p0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    return-object p1
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    const p1, 0x7f0900c3

    .line 42
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    const p3, 0x7f090099

    .line 43
    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    .line 45
    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    move-result p3

    xor-int/lit8 p4, p3, 0x1

    .line 51
    invoke-virtual {p1, p4}, Landroid/view/View;->setSelected(Z)V

    if-eqz p3, :cond_0

    const/16 p1, 0x8

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 52
    :goto_0
    invoke-virtual {p2, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method
