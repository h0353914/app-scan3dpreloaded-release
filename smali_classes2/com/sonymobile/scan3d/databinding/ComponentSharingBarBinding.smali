.class public abstract Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;
.super Landroidx/databinding/ViewDataBinding;
.source "ComponentSharingBarBinding.java"


# instance fields
.field public final actionAnimate:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public final actionEdit:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public final actionFaceMimic:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public final actionShare:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field protected mAnimText:Ljava/lang/String;
    .annotation runtime Landroidx/databinding/Bindable;
    .end annotation
.end field

.field protected mImproveDrawable:Landroid/graphics/drawable/Drawable;
    .annotation runtime Landroidx/databinding/Bindable;
    .end annotation
.end field

.field public final sharingBarActionContainer:Landroid/widget/LinearLayout;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method protected constructor <init>(Landroidx/databinding/DataBindingComponent;Landroid/view/View;ILcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;Landroid/widget/LinearLayout;)V
    .locals 0

    .line 42
    invoke-direct {p0, p1, p2, p3}, Landroidx/databinding/ViewDataBinding;-><init>(Landroidx/databinding/DataBindingComponent;Landroid/view/View;I)V

    .line 43
    iput-object p4, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;->actionAnimate:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    .line 44
    iget-object p1, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;->actionAnimate:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;->setContainedBinding(Landroidx/databinding/ViewDataBinding;)V

    .line 45
    iput-object p5, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;->actionEdit:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    .line 46
    iget-object p1, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;->actionEdit:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;->setContainedBinding(Landroidx/databinding/ViewDataBinding;)V

    .line 47
    iput-object p6, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;->actionFaceMimic:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    .line 48
    iget-object p1, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;->actionFaceMimic:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;->setContainedBinding(Landroidx/databinding/ViewDataBinding;)V

    .line 49
    iput-object p7, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;->actionShare:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    .line 50
    iget-object p1, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;->actionShare:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarItemBinding;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;->setContainedBinding(Landroidx/databinding/ViewDataBinding;)V

    .line 51
    iput-object p8, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;->sharingBarActionContainer:Landroid/widget/LinearLayout;

    return-void
.end method

.method public static bind(Landroid/view/View;)Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;
    .locals 1
    .param p0    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 92
    invoke-static {}, Landroidx/databinding/DataBindingUtil;->getDefaultComponent()Landroidx/databinding/DataBindingComponent;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;->bind(Landroid/view/View;Landroidx/databinding/DataBindingComponent;)Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;

    move-result-object p0

    return-object p0
.end method

.method public static bind(Landroid/view/View;Landroidx/databinding/DataBindingComponent;)Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;
    .locals 1
    .param p0    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Landroidx/databinding/DataBindingComponent;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const v0, 0x7f0c003e

    .line 97
    invoke-static {p1, p0, v0}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;->bind(Landroidx/databinding/DataBindingComponent;Landroid/view/View;I)Landroidx/databinding/ViewDataBinding;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;

    return-object p0
.end method

.method public static inflate(Landroid/view/LayoutInflater;)Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;
    .locals 1
    .param p0    # Landroid/view/LayoutInflater;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 82
    invoke-static {}, Landroidx/databinding/DataBindingUtil;->getDefaultComponent()Landroidx/databinding/DataBindingComponent;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;->inflate(Landroid/view/LayoutInflater;Landroidx/databinding/DataBindingComponent;)Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;

    move-result-object p0

    return-object p0
.end method

.method public static inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;
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

    .line 71
    invoke-static {}, Landroidx/databinding/DataBindingUtil;->getDefaultComponent()Landroidx/databinding/DataBindingComponent;

    move-result-object v0

    invoke-static {p0, p1, p2, v0}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;->inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;ZLandroidx/databinding/DataBindingComponent;)Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;

    move-result-object p0

    return-object p0
.end method

.method public static inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;ZLandroidx/databinding/DataBindingComponent;)Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;
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

    const v0, 0x7f0c003e

    .line 77
    invoke-static {p0, v0, p1, p2, p3}, Landroidx/databinding/DataBindingUtil;->inflate(Landroid/view/LayoutInflater;ILandroid/view/ViewGroup;ZLandroidx/databinding/DataBindingComponent;)Landroidx/databinding/ViewDataBinding;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;

    return-object p0
.end method

.method public static inflate(Landroid/view/LayoutInflater;Landroidx/databinding/DataBindingComponent;)Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;
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

    const v0, 0x7f0c003e

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 88
    invoke-static {p0, v0, v1, v2, p1}, Landroidx/databinding/DataBindingUtil;->inflate(Landroid/view/LayoutInflater;ILandroid/view/ViewGroup;ZLandroidx/databinding/DataBindingComponent;)Landroidx/databinding/ViewDataBinding;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;

    return-object p0
.end method


# virtual methods
.method public getAnimText()Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 65
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;->mAnimText:Ljava/lang/String;

    return-object v0
.end method

.method public getImproveDrawable()Landroid/graphics/drawable/Drawable;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 58
    iget-object v0, p0, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;->mImproveDrawable:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public abstract setAnimText(Ljava/lang/String;)V
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public abstract setImproveDrawable(Landroid/graphics/drawable/Drawable;)V
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
.end method
