.class public Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBindingLandImpl;
.super Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;
.source "ComponentFaceblendBottomBarBindingLandImpl.java"


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


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 15
    new-instance v0, Landroidx/databinding/ViewDataBinding$IncludedLayouts;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Landroidx/databinding/ViewDataBinding$IncludedLayouts;-><init>(I)V

    sput-object v0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBindingLandImpl;->sIncludes:Landroidx/databinding/ViewDataBinding$IncludedLayouts;

    .line 16
    sget-object v0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBindingLandImpl;->sIncludes:Landroidx/databinding/ViewDataBinding$IncludedLayouts;

    const-string v1, "component_faceblend_seekbar"

    const-string v2, "component_faceblend_seekbar"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x2

    new-array v3, v2, [I

    fill-array-data v3, :array_0

    new-array v2, v2, [I

    fill-array-data v2, :array_1

    const/4 v4, 0x0

    invoke-virtual {v0, v4, v1, v3, v2}, Landroidx/databinding/ViewDataBinding$IncludedLayouts;->setIncludes(I[Ljava/lang/String;[I[I)V

    const/4 v0, 0x0

    .line 21
    sput-object v0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBindingLandImpl;->sViewsWithIds:Landroid/util/SparseIntArray;

    return-void

    nop

    :array_0
    .array-data 4
        0x1
        0x2
    .end array-data

    :array_1
    .array-data 4
        0x7f0c0032
        0x7f0c0032
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

    .line 30
    sget-object v0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBindingLandImpl;->sIncludes:Landroidx/databinding/ViewDataBinding$IncludedLayouts;

    sget-object v1, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBindingLandImpl;->sViewsWithIds:Landroid/util/SparseIntArray;

    const/4 v2, 0x3

    invoke-static {p1, p2, v2, v0, v1}, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBindingLandImpl;->mapBindings(Landroidx/databinding/DataBindingComponent;Landroid/view/View;ILandroidx/databinding/ViewDataBinding$IncludedLayouts;Landroid/util/SparseIntArray;)[Ljava/lang/Object;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBindingLandImpl;-><init>(Landroidx/databinding/DataBindingComponent;Landroid/view/View;[Ljava/lang/Object;)V

    return-void
.end method

.method private constructor <init>(Landroidx/databinding/DataBindingComponent;Landroid/view/View;[Ljava/lang/Object;)V
    .locals 11

    const/4 v0, 0x2

    .line 33
    aget-object v0, p3, v0

    move-object v7, v0

    check-cast v7, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;

    const/4 v0, 0x0

    aget-object v0, p3, v0

    move-object v8, v0

    check-cast v8, Landroid/widget/LinearLayout;

    const/4 v0, 0x1

    aget-object p3, p3, v0

    move-object v10, p3

    check-cast v10, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;

    const/4 v4, 0x2

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v9, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v1 .. v10}, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;-><init>(Landroidx/databinding/DataBindingComponent;Landroid/view/View;ILandroid/widget/Button;Landroid/widget/Button;Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;Landroid/widget/LinearLayout;Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;)V

    const-wide/16 v0, -0x1

    .line 135
    iput-wide v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBindingLandImpl;->mDirtyFlags:J

    .line 41
    iget-object p1, p0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBindingLandImpl;->seekbarContainer:Landroid/widget/LinearLayout;

    const/4 p3, 0x0

    invoke-virtual {p1, p3}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 42
    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBindingLandImpl;->setRootTag(Landroid/view/View;)V

    .line 44
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBindingLandImpl;->invalidateAll()V

    return-void
.end method

.method private onChangeMeshContainer(Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;I)Z
    .locals 2

    if-nez p2, :cond_0

    .line 98
    monitor-enter p0

    .line 99
    :try_start_0
    iget-wide p1, p0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBindingLandImpl;->mDirtyFlags:J

    const-wide/16 v0, 0x1

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBindingLandImpl;->mDirtyFlags:J

    .line 100
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

.method private onChangeTextureContainer(Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;I)Z
    .locals 2

    if-nez p2, :cond_0

    .line 107
    monitor-enter p0

    .line 108
    :try_start_0
    iget-wide p1, p0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBindingLandImpl;->mDirtyFlags:J

    const-wide/16 v0, 0x2

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBindingLandImpl;->mDirtyFlags:J

    .line 109
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
    .locals 6

    .line 118
    monitor-enter p0

    .line 119
    :try_start_0
    iget-wide v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBindingLandImpl;->mDirtyFlags:J

    const-wide/16 v2, 0x0

    .line 120
    iput-wide v2, p0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBindingLandImpl;->mDirtyFlags:J

    .line 121
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-wide/16 v4, 0x4

    and-long/2addr v0, v4

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 126
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBindingLandImpl;->meshContainer:Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBindingLandImpl;->getRoot()Landroid/view/View;

    move-result-object v1

    const v2, 0x7f0800bd

    invoke-static {v1, v2}, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBindingLandImpl;->getDrawableFromResource(Landroid/view/View;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;->setDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 127
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBindingLandImpl;->textureContainer:Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBindingLandImpl;->getRoot()Landroid/view/View;

    move-result-object v1

    const v2, 0x7f0800be

    invoke-static {v1, v2}, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBindingLandImpl;->getDrawableFromResource(Landroid/view/View;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;->setDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 129
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBindingLandImpl;->textureContainer:Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;

    invoke-static {v0}, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBindingLandImpl;->executeBindingsOn(Landroidx/databinding/ViewDataBinding;)V

    .line 130
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBindingLandImpl;->meshContainer:Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;

    invoke-static {v0}, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBindingLandImpl;->executeBindingsOn(Landroidx/databinding/ViewDataBinding;)V

    return-void

    :catchall_0
    move-exception v0

    .line 121
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public hasPendingBindings()Z
    .locals 4

    .line 59
    monitor-enter p0

    .line 60
    :try_start_0
    iget-wide v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBindingLandImpl;->mDirtyFlags:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 61
    monitor-exit p0

    return v1

    .line 63
    :cond_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 64
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBindingLandImpl;->textureContainer:Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;->hasPendingBindings()Z

    move-result v0

    if-eqz v0, :cond_1

    return v1

    .line 67
    :cond_1
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBindingLandImpl;->meshContainer:Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;->hasPendingBindings()Z

    move-result v0

    if-eqz v0, :cond_2

    return v1

    :cond_2
    const/4 v0, 0x0

    return v0

    :catchall_0
    move-exception v0

    .line 63
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public invalidateAll()V
    .locals 2

    .line 49
    monitor-enter p0

    const-wide/16 v0, 0x4

    .line 50
    :try_start_0
    iput-wide v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBindingLandImpl;->mDirtyFlags:J

    .line 51
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 52
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBindingLandImpl;->textureContainer:Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;->invalidateAll()V

    .line 53
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBindingLandImpl;->meshContainer:Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;->invalidateAll()V

    .line 54
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBindingLandImpl;->requestRebind()V

    return-void

    :catchall_0
    move-exception v0

    .line 51
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

    .line 92
    :pswitch_0
    check-cast p2, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;

    invoke-direct {p0, p2, p3}, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBindingLandImpl;->onChangeTextureContainer(Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;I)Z

    move-result p1

    return p1

    .line 90
    :pswitch_1
    check-cast p2, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;

    invoke-direct {p0, p2, p3}, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBindingLandImpl;->onChangeMeshContainer(Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;I)Z

    move-result p1

    return p1

    nop

    :pswitch_data_0
    .packed-switch 0x0
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

    .line 81
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;->setLifecycleOwner(Landroidx/lifecycle/LifecycleOwner;)V

    .line 82
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBindingLandImpl;->textureContainer:Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;->setLifecycleOwner(Landroidx/lifecycle/LifecycleOwner;)V

    .line 83
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBindingLandImpl;->meshContainer:Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;->setLifecycleOwner(Landroidx/lifecycle/LifecycleOwner;)V

    return-void
.end method

.method public setVariable(ILjava/lang/Object;)Z
    .locals 0
    .param p2    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 p1, 0x1

    return p1
.end method
