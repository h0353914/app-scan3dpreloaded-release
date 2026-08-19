.class public Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;
.super Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;
.source "ComponentSharingBarBindingImpl.java"


# static fields
.field private static final sIncludes:Landroidx/databinding/ViewDataBinding$IncludedLayouts;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private static final sViewsWithIds:Landroid/util/SparseIntArray;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# instance fields
.field private mDirtyFlags:J

.field private final mboundView0:Landroid/widget/HorizontalScrollView;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 15
    new-instance v0, Landroidx/databinding/ViewDataBinding$IncludedLayouts;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Landroidx/databinding/ViewDataBinding$IncludedLayouts;-><init>(I)V

    sput-object v0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->sIncludes:Landroidx/databinding/ViewDataBinding$IncludedLayouts;

    .line 16
    sget-object v0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->sIncludes:Landroidx/databinding/ViewDataBinding$IncludedLayouts;

    const-string v1, "component_sharing_bar_item"

    const-string v2, "component_sharing_bar_item"

    const-string v3, "component_sharing_bar_item"

    const-string v4, "component_sharing_bar_item"

    filled-new-array {v1, v2, v3, v4}, [Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x4

    new-array v3, v2, [I

    fill-array-data v3, :array_0

    new-array v2, v2, [I

    fill-array-data v2, :array_1

    const/4 v4, 0x1

    invoke-virtual {v0, v4, v1, v3, v2}, Landroidx/databinding/ViewDataBinding$IncludedLayouts;->setIncludes(I[Ljava/lang/String;[I[I)V

    const/4 v0, 0x0

    .line 23
    sput-object v0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->sViewsWithIds:Landroid/util/SparseIntArray;

    return-void

    nop

    :array_0
    .array-data 4
        0x2
        0x3
        0x4
        0x5
    .end array-data

    :array_1
    .array-data 4
        0x7f0c003f
        0x7f0c003f
        0x7f0c003f
        0x7f0c003f
    .end array-data
.end method

.method public constructor <init>(Landroidx/databinding/DataBindingComponent;Landroid/view/View;)V
    .locals 3
    .param p1    # Landroidx/databinding/DataBindingComponent;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 34
    sget-object v0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->sIncludes:Landroidx/databinding/ViewDataBinding$IncludedLayouts;

    sget-object v1, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->sViewsWithIds:Landroid/util/SparseIntArray;

    const/4 v2, 0x6

    invoke-static {p1, p2, v2, v0, v1}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->mapBindings(Landroidx/databinding/DataBindingComponent;Landroid/view/View;ILandroidx/databinding/ViewDataBinding$IncludedLayouts;Landroid/util/SparseIntArray;)[Ljava/lang/Object;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;-><init>(Landroidx/databinding/DataBindingComponent;Landroid/view/View;[Ljava/lang/Object;)V

    return-void
.end method

.method private constructor <init>(Landroidx/databinding/DataBindingComponent;Landroid/view/View;[Ljava/lang/Object;)V
    .locals 10

    const/4 v0, 0x4

    .line 37
    aget-object v0, p3, v0

    move-object v5, v0

    check-cast v5, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    const/4 v0, 0x2

    aget-object v0, p3, v0

    move-object v6, v0

    check-cast v6, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    const/4 v0, 0x5

    aget-object v0, p3, v0

    move-object v7, v0

    check-cast v7, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    const/4 v0, 0x3

    aget-object v0, p3, v0

    move-object v8, v0

    check-cast v8, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    const/4 v0, 0x1

    aget-object v0, p3, v0

    move-object v9, v0

    check-cast v9, Landroid/widget/LinearLayout;

    const/4 v4, 0x4

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v1 .. v9}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;-><init>(Landroidx/databinding/DataBindingComponent;Landroid/view/View;ILcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;Landroid/widget/LinearLayout;)V

    const-wide/16 v0, -0x1

    .line 209
    iput-wide v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->mDirtyFlags:J

    const/4 p1, 0x0

    .line 44
    aget-object p1, p3, p1

    check-cast p1, Landroid/widget/HorizontalScrollView;

    iput-object p1, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->mboundView0:Landroid/widget/HorizontalScrollView;

    .line 45
    iget-object p1, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->mboundView0:Landroid/widget/HorizontalScrollView;

    const/4 p3, 0x0

    invoke-virtual {p1, p3}, Landroid/widget/HorizontalScrollView;->setTag(Ljava/lang/Object;)V

    .line 46
    iget-object p1, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->sharingBarActionContainer:Landroid/widget/LinearLayout;

    invoke-virtual {p1, p3}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 47
    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->setRootTag(Landroid/view/View;)V

    .line 49
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->invalidateAll()V

    return-void
.end method

.method private onChangeActionAnimate(Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;I)Z
    .locals 2

    if-nez p2, :cond_0

    .line 147
    monitor-enter p0

    .line 148
    :try_start_0
    iget-wide p1, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->mDirtyFlags:J

    const-wide/16 v0, 0x2

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->mDirtyFlags:J

    .line 149
    monitor-exit p0

    const/4 p1, 0x1

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method private onChangeActionEdit(Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;I)Z
    .locals 2

    if-nez p2, :cond_0

    .line 165
    monitor-enter p0

    .line 166
    :try_start_0
    iget-wide p1, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->mDirtyFlags:J

    const-wide/16 v0, 0x8

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->mDirtyFlags:J

    .line 167
    monitor-exit p0

    const/4 p1, 0x1

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method private onChangeActionFaceMimic(Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;I)Z
    .locals 2

    if-nez p2, :cond_0

    .line 138
    monitor-enter p0

    .line 139
    :try_start_0
    iget-wide p1, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->mDirtyFlags:J

    const-wide/16 v0, 0x1

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->mDirtyFlags:J

    .line 140
    monitor-exit p0

    const/4 p1, 0x1

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method private onChangeActionShare(Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;I)Z
    .locals 2

    if-nez p2, :cond_0

    .line 156
    monitor-enter p0

    .line 157
    :try_start_0
    iget-wide p1, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->mDirtyFlags:J

    const-wide/16 v0, 0x4

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->mDirtyFlags:J

    .line 158
    monitor-exit p0

    const/4 p1, 0x1

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method


# virtual methods
.method protected executeBindings()V
    .locals 8

    .line 176
    monitor-enter p0

    .line 177
    :try_start_0
    iget-wide v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->mDirtyFlags:J

    const-wide/16 v2, 0x0

    .line 178
    iput-wide v2, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->mDirtyFlags:J

    .line 179
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 180
    iget-object v4, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->mAnimText:Ljava/lang/String;

    const-wide/16 v5, 0x60

    and-long/2addr v5, v0

    cmp-long v5, v5, v2

    const-wide/16 v6, 0x40

    and-long/2addr v0, v6

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 188
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->actionAnimate:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->getRoot()Landroid/view/View;

    move-result-object v1

    const v2, 0x7f0800ca

    invoke-static {v1, v2}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->getDrawableFromResource(Landroid/view/View;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;->setDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 189
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->actionEdit:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->getRoot()Landroid/view/View;

    move-result-object v1

    const v2, 0x7f0800f1

    invoke-static {v1, v2}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->getDrawableFromResource(Landroid/view/View;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;->setDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 190
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->actionEdit:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->getRoot()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f100352

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;->setText(Ljava/lang/String;)V

    .line 191
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->actionFaceMimic:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->getRoot()Landroid/view/View;

    move-result-object v1

    const v2, 0x7f0800da

    invoke-static {v1, v2}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->getDrawableFromResource(Landroid/view/View;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;->setDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 192
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->actionFaceMimic:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->getRoot()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f100353

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;->setText(Ljava/lang/String;)V

    .line 193
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->actionShare:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->getRoot()Landroid/view/View;

    move-result-object v1

    const v2, 0x7f0800e6

    invoke-static {v1, v2}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->getDrawableFromResource(Landroid/view/View;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;->setDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 194
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->actionShare:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->getRoot()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f100356

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;->setText(Ljava/lang/String;)V

    :cond_0
    if-eqz v5, :cond_1

    .line 199
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->actionAnimate:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-virtual {v0, v4}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;->setText(Ljava/lang/String;)V

    .line 201
    :cond_1
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->actionEdit:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-static {v0}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->executeBindingsOn(Landroidx/databinding/ViewDataBinding;)V

    .line 202
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->actionShare:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-static {v0}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->executeBindingsOn(Landroidx/databinding/ViewDataBinding;)V

    .line 203
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->actionAnimate:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-static {v0}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->executeBindingsOn(Landroidx/databinding/ViewDataBinding;)V

    .line 204
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->actionFaceMimic:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-static {v0}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->executeBindingsOn(Landroidx/databinding/ViewDataBinding;)V

    return-void

    :catchall_0
    move-exception v0

    .line 179
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public hasPendingBindings()Z
    .locals 4

    .line 66
    monitor-enter p0

    .line 67
    :try_start_0
    iget-wide v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->mDirtyFlags:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 68
    monitor-exit p0

    return v1

    .line 70
    :cond_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 71
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->actionEdit:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;->hasPendingBindings()Z

    move-result v0

    if-eqz v0, :cond_1

    return v1

    .line 74
    :cond_1
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->actionShare:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;->hasPendingBindings()Z

    move-result v0

    if-eqz v0, :cond_2

    return v1

    .line 77
    :cond_2
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->actionAnimate:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;->hasPendingBindings()Z

    move-result v0

    if-eqz v0, :cond_3

    return v1

    .line 80
    :cond_3
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->actionFaceMimic:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;->hasPendingBindings()Z

    move-result v0

    if-eqz v0, :cond_4

    return v1

    :cond_4
    const/4 v0, 0x0

    return v0

    :catchall_0
    move-exception v0

    .line 70
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public invalidateAll()V
    .locals 2

    .line 54
    monitor-enter p0

    const-wide/16 v0, 0x40

    .line 55
    :try_start_0
    iput-wide v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->mDirtyFlags:J

    .line 56
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 57
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->actionEdit:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;->invalidateAll()V

    .line 58
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->actionShare:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;->invalidateAll()V

    .line 59
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->actionAnimate:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;->invalidateAll()V

    .line 60
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->actionFaceMimic:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;->invalidateAll()V

    .line 61
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->requestRebind()V

    return-void

    :catchall_0
    move-exception v0

    .line 56
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method protected onFieldChange(ILjava/lang/Object;I)Z
    .locals 0

    packed-switch p1, :pswitch_data_0

    const/4 p1, 0x0

    return p1

    .line 132
    :pswitch_0
    check-cast p2, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-direct {p0, p2, p3}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->onChangeActionEdit(Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;I)Z

    move-result p1

    return p1

    .line 130
    :pswitch_1
    check-cast p2, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-direct {p0, p2, p3}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->onChangeActionShare(Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;I)Z

    move-result p1

    return p1

    .line 128
    :pswitch_2
    check-cast p2, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-direct {p0, p2, p3}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->onChangeActionAnimate(Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;I)Z

    move-result p1

    return p1

    .line 126
    :pswitch_3
    check-cast p2, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-direct {p0, p2, p3}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->onChangeActionFaceMimic(Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;I)Z

    move-result p1

    return p1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setAnimText(Ljava/lang/String;)V
    .locals 4
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 105
    iput-object p1, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->mAnimText:Ljava/lang/String;

    .line 106
    monitor-enter p0

    .line 107
    :try_start_0
    iget-wide v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->mDirtyFlags:J

    const-wide/16 v2, 0x20

    or-long/2addr v0, v2

    iput-wide v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->mDirtyFlags:J

    .line 108
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 p1, 0x4

    .line 109
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->notifyPropertyChanged(I)V

    .line 110
    invoke-super {p0}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;->requestRebind()V

    return-void

    :catchall_0
    move-exception p1

    .line 108
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public setImproveDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 102
    iput-object p1, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->mImproveDrawable:Landroid/graphics/drawable/Drawable;

    return-void
.end method

.method public setLifecycleOwner(Landroidx/lifecycle/LifecycleOwner;)V
    .locals 1
    .param p1    # Landroidx/lifecycle/LifecycleOwner;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 115
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;->setLifecycleOwner(Landroidx/lifecycle/LifecycleOwner;)V

    .line 116
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->actionEdit:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;->setLifecycleOwner(Landroidx/lifecycle/LifecycleOwner;)V

    .line 117
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->actionShare:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;->setLifecycleOwner(Landroidx/lifecycle/LifecycleOwner;)V

    .line 118
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->actionAnimate:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;->setLifecycleOwner(Landroidx/lifecycle/LifecycleOwner;)V

    .line 119
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->actionFaceMimic:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;->setLifecycleOwner(Landroidx/lifecycle/LifecycleOwner;)V

    return-void
.end method

.method public setVariable(ILjava/lang/Object;)Z
    .locals 2
    .param p2    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x1

    if-ne v0, p1, :cond_0

    .line 90
    check-cast p2, Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->setImproveDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    :cond_0
    const/4 v1, 0x4

    if-ne v1, p1, :cond_1

    .line 93
    check-cast p2, Ljava/lang/String;

    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBindingImpl;->setAnimText(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
