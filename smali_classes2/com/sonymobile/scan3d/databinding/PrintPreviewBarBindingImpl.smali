.class public Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;
.super Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBinding;
.source "PrintPreviewBarBindingImpl.java"


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

.field private final mboundView0:Landroid/widget/LinearLayout;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 15
    new-instance v0, Landroidx/databinding/ViewDataBinding$IncludedLayouts;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Landroidx/databinding/ViewDataBinding$IncludedLayouts;-><init>(I)V

    sput-object v0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->sIncludes:Landroidx/databinding/ViewDataBinding$IncludedLayouts;

    .line 16
    sget-object v0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->sIncludes:Landroidx/databinding/ViewDataBinding$IncludedLayouts;

    const-string v1, "component_sharing_bar_item"

    const-string v2, "component_sharing_bar_item"

    const-string v3, "component_sharing_bar_item"

    filled-new-array {v1, v2, v3}, [Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x3

    new-array v3, v2, [I

    fill-array-data v3, :array_0

    new-array v2, v2, [I

    fill-array-data v2, :array_1

    const/4 v4, 0x0

    invoke-virtual {v0, v4, v1, v3, v2}, Landroidx/databinding/ViewDataBinding$IncludedLayouts;->setIncludes(I[Ljava/lang/String;[I[I)V

    const/4 v0, 0x0

    .line 22
    sput-object v0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->sViewsWithIds:Landroid/util/SparseIntArray;

    return-void

    nop

    :array_0
    .array-data 4
        0x1
        0x2
        0x3
    .end array-data

    :array_1
    .array-data 4
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

    .line 33
    sget-object v0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->sIncludes:Landroidx/databinding/ViewDataBinding$IncludedLayouts;

    sget-object v1, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->sViewsWithIds:Landroid/util/SparseIntArray;

    const/4 v2, 0x4

    invoke-static {p1, p2, v2, v0, v1}, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->mapBindings(Landroidx/databinding/DataBindingComponent;Landroid/view/View;ILandroidx/databinding/ViewDataBinding$IncludedLayouts;Landroid/util/SparseIntArray;)[Ljava/lang/Object;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;-><init>(Landroidx/databinding/DataBindingComponent;Landroid/view/View;[Ljava/lang/Object;)V

    return-void
.end method

.method private constructor <init>(Landroidx/databinding/DataBindingComponent;Landroid/view/View;[Ljava/lang/Object;)V
    .locals 8

    const/4 v0, 0x1

    .line 36
    aget-object v0, p3, v0

    move-object v5, v0

    check-cast v5, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    const/4 v0, 0x2

    aget-object v0, p3, v0

    move-object v6, v0

    check-cast v6, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    const/4 v0, 0x3

    aget-object v0, p3, v0

    move-object v7, v0

    check-cast v7, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    const/4 v4, 0x3

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v1 .. v7}, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBinding;-><init>(Landroidx/databinding/DataBindingComponent;Landroid/view/View;ILcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;)V

    const-wide/16 v0, -0x1

    .line 180
    iput-wide v0, p0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->mDirtyFlags:J

    const/4 p1, 0x0

    .line 41
    aget-object p1, p3, p1

    check-cast p1, Landroid/widget/LinearLayout;

    iput-object p1, p0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->mboundView0:Landroid/widget/LinearLayout;

    .line 42
    iget-object p1, p0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->mboundView0:Landroid/widget/LinearLayout;

    const/4 p3, 0x0

    invoke-virtual {p1, p3}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 43
    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->setRootTag(Landroid/view/View;)V

    .line 45
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->invalidateAll()V

    return-void
.end method

.method private onChangeActionEdit(Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;I)Z
    .locals 2

    if-nez p2, :cond_0

    .line 139
    monitor-enter p0

    .line 140
    :try_start_0
    iget-wide p1, p0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->mDirtyFlags:J

    const-wide/16 v0, 0x4

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->mDirtyFlags:J

    .line 141
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

.method private onChangeActionPrintEdit(Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;I)Z
    .locals 2

    if-nez p2, :cond_0

    .line 121
    monitor-enter p0

    .line 122
    :try_start_0
    iget-wide p1, p0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->mDirtyFlags:J

    const-wide/16 v0, 0x1

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->mDirtyFlags:J

    .line 123
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

.method private onChangeActionToggleBase(Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;I)Z
    .locals 2

    if-nez p2, :cond_0

    .line 130
    monitor-enter p0

    .line 131
    :try_start_0
    iget-wide p1, p0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->mDirtyFlags:J

    const-wide/16 v0, 0x2

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->mDirtyFlags:J

    .line 132
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

    .line 150
    monitor-enter p0

    .line 151
    :try_start_0
    iget-wide v0, p0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->mDirtyFlags:J

    const-wide/16 v2, 0x0

    .line 152
    iput-wide v2, p0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->mDirtyFlags:J

    .line 153
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 154
    iget-object v4, p0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->mSocleDrawable:Landroid/graphics/drawable/Drawable;

    const-wide/16 v5, 0x18

    and-long/2addr v5, v0

    cmp-long v5, v5, v2

    const-wide/16 v6, 0x10

    and-long/2addr v0, v6

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 162
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->actionEdit:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->getRoot()Landroid/view/View;

    move-result-object v1

    const v2, 0x7f0800d7

    invoke-static {v1, v2}, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->getDrawableFromResource(Landroid/view/View;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;->setDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 163
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->actionEdit:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->getRoot()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f1000ef

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;->setText(Ljava/lang/String;)V

    .line 164
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->actionPrintEdit:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->getRoot()Landroid/view/View;

    move-result-object v1

    const v2, 0x7f0800c9

    invoke-static {v1, v2}, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->getDrawableFromResource(Landroid/view/View;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;->setDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 165
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->actionPrintEdit:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->getRoot()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f1000ee

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;->setText(Ljava/lang/String;)V

    .line 166
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->actionToggleBase:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->getRoot()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f100332

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;->setText(Ljava/lang/String;)V

    :cond_0
    if-eqz v5, :cond_1

    .line 171
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->actionToggleBase:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-virtual {v0, v4}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;->setDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 173
    :cond_1
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->actionEdit:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-static {v0}, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->executeBindingsOn(Landroidx/databinding/ViewDataBinding;)V

    .line 174
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->actionPrintEdit:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-static {v0}, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->executeBindingsOn(Landroidx/databinding/ViewDataBinding;)V

    .line 175
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->actionToggleBase:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-static {v0}, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->executeBindingsOn(Landroidx/databinding/ViewDataBinding;)V

    return-void

    :catchall_0
    move-exception v0

    .line 153
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public hasPendingBindings()Z
    .locals 4

    .line 61
    monitor-enter p0

    .line 62
    :try_start_0
    iget-wide v0, p0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->mDirtyFlags:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 63
    monitor-exit p0

    return v1

    .line 65
    :cond_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 66
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->actionEdit:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;->hasPendingBindings()Z

    move-result v0

    if-eqz v0, :cond_1

    return v1

    .line 69
    :cond_1
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->actionPrintEdit:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;->hasPendingBindings()Z

    move-result v0

    if-eqz v0, :cond_2

    return v1

    .line 72
    :cond_2
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->actionToggleBase:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;->hasPendingBindings()Z

    move-result v0

    if-eqz v0, :cond_3

    return v1

    :cond_3
    const/4 v0, 0x0

    return v0

    :catchall_0
    move-exception v0

    .line 65
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public invalidateAll()V
    .locals 2

    .line 50
    monitor-enter p0

    const-wide/16 v0, 0x10

    .line 51
    :try_start_0
    iput-wide v0, p0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->mDirtyFlags:J

    .line 52
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->actionEdit:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;->invalidateAll()V

    .line 54
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->actionPrintEdit:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;->invalidateAll()V

    .line 55
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->actionToggleBase:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;->invalidateAll()V

    .line 56
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->requestRebind()V

    return-void

    :catchall_0
    move-exception v0

    .line 52
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

    .line 115
    :pswitch_0
    check-cast p2, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-direct {p0, p2, p3}, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->onChangeActionEdit(Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;I)Z

    move-result p1

    return p1

    .line 113
    :pswitch_1
    check-cast p2, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-direct {p0, p2, p3}, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->onChangeActionToggleBase(Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;I)Z

    move-result p1

    return p1

    .line 111
    :pswitch_2
    check-cast p2, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-direct {p0, p2, p3}, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->onChangeActionPrintEdit(Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;I)Z

    move-result p1

    return p1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setLifecycleOwner(Landroidx/lifecycle/LifecycleOwner;)V
    .locals 1
    .param p1    # Landroidx/lifecycle/LifecycleOwner;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 101
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBinding;->setLifecycleOwner(Landroidx/lifecycle/LifecycleOwner;)V

    .line 102
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->actionEdit:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;->setLifecycleOwner(Landroidx/lifecycle/LifecycleOwner;)V

    .line 103
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->actionPrintEdit:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;->setLifecycleOwner(Landroidx/lifecycle/LifecycleOwner;)V

    .line 104
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->actionToggleBase:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;->setLifecycleOwner(Landroidx/lifecycle/LifecycleOwner;)V

    return-void
.end method

.method public setSocleDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 4
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 91
    iput-object p1, p0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->mSocleDrawable:Landroid/graphics/drawable/Drawable;

    .line 92
    monitor-enter p0

    .line 93
    :try_start_0
    iget-wide v0, p0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->mDirtyFlags:J

    const-wide/16 v2, 0x8

    or-long/2addr v0, v2

    iput-wide v0, p0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->mDirtyFlags:J

    .line 94
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 p1, 0x3

    .line 95
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->notifyPropertyChanged(I)V

    .line 96
    invoke-super {p0}, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBinding;->requestRebind()V

    return-void

    :catchall_0
    move-exception p1

    .line 94
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public setVariable(ILjava/lang/Object;)Z
    .locals 1
    .param p2    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x3

    if-ne v0, p1, :cond_0

    .line 82
    check-cast p2, Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBindingImpl;->setSocleDrawable(Landroid/graphics/drawable/Drawable;)V

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method
