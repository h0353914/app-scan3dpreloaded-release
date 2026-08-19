.class public Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBindingImpl;
.super Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;
.source "ComponentFaceblendSeekbarBindingImpl.java"


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

.field private final mboundView1:Landroid/widget/ImageView;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 16
    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    sput-object v0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBindingImpl;->sViewsWithIds:Landroid/util/SparseIntArray;

    .line 17
    sget-object v0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBindingImpl;->sViewsWithIds:Landroid/util/SparseIntArray;

    const v1, 0x7f090190

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

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

    .line 30
    sget-object v0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBindingImpl;->sIncludes:Landroidx/databinding/ViewDataBinding$IncludedLayouts;

    sget-object v1, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBindingImpl;->sViewsWithIds:Landroid/util/SparseIntArray;

    const/4 v2, 0x3

    invoke-static {p1, p2, v2, v0, v1}, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBindingImpl;->mapBindings(Landroidx/databinding/DataBindingComponent;Landroid/view/View;ILandroidx/databinding/ViewDataBinding$IncludedLayouts;Landroid/util/SparseIntArray;)[Ljava/lang/Object;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBindingImpl;-><init>(Landroidx/databinding/DataBindingComponent;Landroid/view/View;[Ljava/lang/Object;)V

    return-void
.end method

.method private constructor <init>(Landroidx/databinding/DataBindingComponent;Landroid/view/View;[Ljava/lang/Object;)V
    .locals 4

    const/4 v0, 0x2

    .line 33
    aget-object v0, p3, v0

    check-cast v0, Landroid/widget/SeekBar;

    const/4 v1, 0x0

    invoke-direct {p0, p1, p2, v1, v0}, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;-><init>(Landroidx/databinding/DataBindingComponent;Landroid/view/View;ILandroid/widget/SeekBar;)V

    const-wide/16 v2, -0x1

    .line 112
    iput-wide v2, p0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBindingImpl;->mDirtyFlags:J

    .line 36
    aget-object p1, p3, v1

    check-cast p1, Landroid/widget/LinearLayout;

    iput-object p1, p0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBindingImpl;->mboundView0:Landroid/widget/LinearLayout;

    .line 37
    iget-object p1, p0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBindingImpl;->mboundView0:Landroid/widget/LinearLayout;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    const/4 p1, 0x1

    .line 38
    aget-object p1, p3, p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBindingImpl;->mboundView1:Landroid/widget/ImageView;

    .line 39
    iget-object p1, p0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBindingImpl;->mboundView1:Landroid/widget/ImageView;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 40
    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBindingImpl;->setRootTag(Landroid/view/View;)V

    .line 42
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBindingImpl;->invalidateAll()V

    return-void
.end method


# virtual methods
.method protected executeBindings()V
    .locals 7

    .line 94
    monitor-enter p0

    .line 95
    :try_start_0
    iget-wide v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBindingImpl;->mDirtyFlags:J

    const-wide/16 v2, 0x0

    .line 96
    iput-wide v2, p0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBindingImpl;->mDirtyFlags:J

    .line 97
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 98
    iget-object v4, p0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBindingImpl;->mDrawable:Landroid/graphics/drawable/Drawable;

    const-wide/16 v5, 0x3

    and-long/2addr v0, v5

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 106
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBindingImpl;->mboundView1:Landroid/widget/ImageView;

    invoke-static {v0, v4}, Landroidx/databinding/adapters/ImageViewBindingAdapter;->setImageDrawable(Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;)V

    :cond_0
    return-void

    :catchall_0
    move-exception v0

    .line 97
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public hasPendingBindings()Z
    .locals 4

    .line 55
    monitor-enter p0

    .line 56
    :try_start_0
    iget-wide v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBindingImpl;->mDirtyFlags:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 57
    monitor-exit p0

    return v0

    .line 59
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

    .line 47
    monitor-enter p0

    const-wide/16 v0, 0x2

    .line 48
    :try_start_0
    iput-wide v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBindingImpl;->mDirtyFlags:J

    .line 49
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 50
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBindingImpl;->requestRebind()V

    return-void

    :catchall_0
    move-exception v0

    .line 49
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

    .line 76
    iput-object p1, p0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBindingImpl;->mDrawable:Landroid/graphics/drawable/Drawable;

    .line 77
    monitor-enter p0

    .line 78
    :try_start_0
    iget-wide v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBindingImpl;->mDirtyFlags:J

    const-wide/16 v2, 0x1

    or-long/2addr v0, v2

    iput-wide v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBindingImpl;->mDirtyFlags:J

    .line 79
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 p1, 0x2

    .line 80
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBindingImpl;->notifyPropertyChanged(I)V

    .line 81
    invoke-super {p0}, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;->requestRebind()V

    return-void

    :catchall_0
    move-exception p1

    .line 79
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

    .line 67
    check-cast p2, Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBindingImpl;->setDrawable(Landroid/graphics/drawable/Drawable;)V

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method
