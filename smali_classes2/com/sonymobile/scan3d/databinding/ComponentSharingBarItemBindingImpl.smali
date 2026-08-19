.class public Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBindingImpl;
.super Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;
.source "ComponentSharingBarItemBindingImpl.java"


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

.field private final mboundView0:Landroid/widget/TextView;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
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

    .line 27
    sget-object v0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBindingImpl;->sIncludes:Landroidx/databinding/ViewDataBinding$IncludedLayouts;

    sget-object v1, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBindingImpl;->sViewsWithIds:Landroid/util/SparseIntArray;

    const/4 v2, 0x1

    invoke-static {p1, p2, v2, v0, v1}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBindingImpl;->mapBindings(Landroidx/databinding/DataBindingComponent;Landroid/view/View;ILandroidx/databinding/ViewDataBinding$IncludedLayouts;Landroid/util/SparseIntArray;)[Ljava/lang/Object;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBindingImpl;-><init>(Landroidx/databinding/DataBindingComponent;Landroid/view/View;[Ljava/lang/Object;)V

    return-void
.end method

.method private constructor <init>(Landroidx/databinding/DataBindingComponent;Landroid/view/View;[Ljava/lang/Object;)V
    .locals 3

    const/4 v0, 0x0

    .line 30
    invoke-direct {p0, p1, p2, v0}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;-><init>(Landroidx/databinding/DataBindingComponent;Landroid/view/View;I)V

    const-wide/16 v1, -0x1

    .line 125
    iput-wide v1, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBindingImpl;->mDirtyFlags:J

    .line 32
    aget-object p1, p3, v0

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBindingImpl;->mboundView0:Landroid/widget/TextView;

    .line 33
    iget-object p1, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBindingImpl;->mboundView0:Landroid/widget/TextView;

    const/4 p3, 0x0

    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 34
    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBindingImpl;->setRootTag(Landroid/view/View;)V

    .line 36
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBindingImpl;->invalidateAll()V

    return-void
.end method


# virtual methods
.method protected executeBindings()V
    .locals 9

    .line 99
    monitor-enter p0

    .line 100
    :try_start_0
    iget-wide v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBindingImpl;->mDirtyFlags:J

    const-wide/16 v2, 0x0

    .line 101
    iput-wide v2, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBindingImpl;->mDirtyFlags:J

    .line 102
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 103
    iget-object v4, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBindingImpl;->mDrawable:Landroid/graphics/drawable/Drawable;

    .line 104
    iget-object v5, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBindingImpl;->mText:Ljava/lang/String;

    const-wide/16 v6, 0x5

    and-long/2addr v6, v0

    cmp-long v6, v6, v2

    const-wide/16 v7, 0x6

    and-long/2addr v0, v7

    cmp-long v0, v0, v2

    if-eqz v6, :cond_0

    .line 114
    iget-object v1, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBindingImpl;->mboundView0:Landroid/widget/TextView;

    invoke-static {v1, v4}, Landroidx/databinding/adapters/TextViewBindingAdapter;->setDrawableTop(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    :cond_0
    if-eqz v0, :cond_1

    .line 119
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBindingImpl;->mboundView0:Landroid/widget/TextView;

    invoke-static {v0, v5}, Landroidx/databinding/adapters/TextViewBindingAdapter;->setText(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    :cond_1
    return-void

    :catchall_0
    move-exception v0

    .line 102
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public hasPendingBindings()Z
    .locals 4

    .line 49
    monitor-enter p0

    .line 50
    :try_start_0
    iget-wide v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBindingImpl;->mDirtyFlags:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 51
    monitor-exit p0

    return v0

    .line 53
    :cond_0
    monitor-exit p0

    const/4 v0, 0x0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public invalidateAll()V
    .locals 2

    .line 41
    monitor-enter p0

    const-wide/16 v0, 0x4

    .line 42
    :try_start_0
    iput-wide v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBindingImpl;->mDirtyFlags:J

    .line 43
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBindingImpl;->requestRebind()V

    return-void

    :catchall_0
    move-exception v0

    .line 43
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method protected onFieldChange(ILjava/lang/Object;I)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public setDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 4
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 73
    iput-object p1, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBindingImpl;->mDrawable:Landroid/graphics/drawable/Drawable;

    .line 74
    monitor-enter p0

    .line 75
    :try_start_0
    iget-wide v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBindingImpl;->mDirtyFlags:J

    const-wide/16 v2, 0x1

    or-long/2addr v0, v2

    iput-wide v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBindingImpl;->mDirtyFlags:J

    .line 76
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 p1, 0x2

    .line 77
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBindingImpl;->notifyPropertyChanged(I)V

    .line 78
    invoke-super {p0}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;->requestRebind()V

    return-void

    :catchall_0
    move-exception p1

    .line 76
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public setText(Ljava/lang/String;)V
    .locals 4
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 81
    iput-object p1, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBindingImpl;->mText:Ljava/lang/String;

    .line 82
    monitor-enter p0

    .line 83
    :try_start_0
    iget-wide v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBindingImpl;->mDirtyFlags:J

    const-wide/16 v2, 0x2

    or-long/2addr v0, v2

    iput-wide v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBindingImpl;->mDirtyFlags:J

    .line 84
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 p1, 0x5

    .line 85
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBindingImpl;->notifyPropertyChanged(I)V

    .line 86
    invoke-super {p0}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;->requestRebind()V

    return-void

    :catchall_0
    move-exception p1

    .line 84
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

    const/4 v0, 0x2

    if-ne v0, p1, :cond_0

    .line 61
    check-cast p2, Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBindingImpl;->setDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x5

    if-ne v0, p1, :cond_1

    .line 64
    check-cast p2, Ljava/lang/String;

    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBindingImpl;->setText(Ljava/lang/String;)V

    :goto_0
    const/4 p1, 0x1

    goto :goto_1

    :cond_1
    const/4 p1, 0x0

    :goto_1
    return p1
.end method
