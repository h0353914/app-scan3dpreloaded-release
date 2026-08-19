.class public abstract Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBinding;
.super Landroidx/databinding/ViewDataBinding;
.source "PrintPreviewBarBinding.java"


# instance fields
.field public final actionEdit:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public final actionPrintEdit:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public final actionToggleBase:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field protected mSocleDrawable:Landroid/graphics/drawable/Drawable;
    .annotation runtime Landroidx/databinding/Bindable;
    .end annotation
.end field


# direct methods
.method protected constructor <init>(Landroidx/databinding/DataBindingComponent;Landroid/view/View;ILcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;)V
    .locals 0

    .line 31
    invoke-direct {p0, p1, p2, p3}, Landroidx/databinding/ViewDataBinding;-><init>(Landroidx/databinding/DataBindingComponent;Landroid/view/View;I)V

    .line 32
    iput-object p4, p0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBinding;->actionEdit:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    .line 33
    iget-object p1, p0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBinding;->actionEdit:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBinding;->setContainedBinding(Landroidx/databinding/ViewDataBinding;)V

    .line 34
    iput-object p5, p0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBinding;->actionPrintEdit:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    .line 35
    iget-object p1, p0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBinding;->actionPrintEdit:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBinding;->setContainedBinding(Landroidx/databinding/ViewDataBinding;)V

    .line 36
    iput-object p6, p0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBinding;->actionToggleBase:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    .line 37
    iget-object p1, p0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBinding;->actionToggleBase:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBinding;->setContainedBinding(Landroidx/databinding/ViewDataBinding;)V

    return-void
.end method

.method public static bind(Landroid/view/View;)Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBinding;
    .locals 1
    .param p0    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 71
    invoke-static {}, Landroidx/databinding/DataBindingUtil;->getDefaultComponent()Landroidx/databinding/DataBindingComponent;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBinding;->bind(Landroid/view/View;Landroidx/databinding/DataBindingComponent;)Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBinding;

    move-result-object p0

    return-object p0
.end method

.method public static bind(Landroid/view/View;Landroidx/databinding/DataBindingComponent;)Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBinding;
    .locals 1
    .param p0    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Landroidx/databinding/DataBindingComponent;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const v0, 0x7f0c00a3

    .line 76
    invoke-static {p1, p0, v0}, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBinding;->bind(Landroidx/databinding/DataBindingComponent;Landroid/view/View;I)Landroidx/databinding/ViewDataBinding;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBinding;

    return-object p0
.end method

.method public static inflate(Landroid/view/LayoutInflater;)Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBinding;
    .locals 1
    .param p0    # Landroid/view/LayoutInflater;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 61
    invoke-static {}, Landroidx/databinding/DataBindingUtil;->getDefaultComponent()Landroidx/databinding/DataBindingComponent;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBinding;->inflate(Landroid/view/LayoutInflater;Landroidx/databinding/DataBindingComponent;)Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBinding;

    move-result-object p0

    return-object p0
.end method

.method public static inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBinding;
    .locals 1
    .param p0    # Landroid/view/LayoutInflater;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 50
    invoke-static {}, Landroidx/databinding/DataBindingUtil;->getDefaultComponent()Landroidx/databinding/DataBindingComponent;

    move-result-object v0

    invoke-static {p0, p1, p2, v0}, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBinding;->inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;ZLandroidx/databinding/DataBindingComponent;)Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBinding;

    move-result-object p0

    return-object p0
.end method

.method public static inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;ZLandroidx/databinding/DataBindingComponent;)Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBinding;
    .locals 1
    .param p0    # Landroid/view/LayoutInflater;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroidx/databinding/DataBindingComponent;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    const v0, 0x7f0c00a3

    .line 56
    invoke-static {p0, v0, p1, p2, p3}, Landroidx/databinding/DataBindingUtil;->inflate(Landroid/view/LayoutInflater;ILandroid/view/ViewGroup;ZLandroidx/databinding/DataBindingComponent;)Landroidx/databinding/ViewDataBinding;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBinding;

    return-object p0
.end method

.method public static inflate(Landroid/view/LayoutInflater;Landroidx/databinding/DataBindingComponent;)Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBinding;
    .locals 3
    .param p0    # Landroid/view/LayoutInflater;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Landroidx/databinding/DataBindingComponent;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    const v0, 0x7f0c00a3

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 67
    invoke-static {p0, v0, v1, v2, p1}, Landroidx/databinding/DataBindingUtil;->inflate(Landroid/view/LayoutInflater;ILandroid/view/ViewGroup;ZLandroidx/databinding/DataBindingComponent;)Landroidx/databinding/ViewDataBinding;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBinding;

    return-object p0
.end method


# virtual methods
.method public getSocleDrawable()Landroid/graphics/drawable/Drawable;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 44
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBinding;->mSocleDrawable:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public abstract setSocleDrawable(Landroid/graphics/drawable/Drawable;)V
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
.end method
