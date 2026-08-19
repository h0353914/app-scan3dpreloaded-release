.class public abstract Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;
.super Landroidx/databinding/ViewDataBinding;
.source "ComponentFaceblendBottomBarBinding.java"


# instance fields
.field public final button1to1:Landroid/widget/Button;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final button4to3:Landroid/widget/Button;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final meshContainer:Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public final seekbarContainer:Landroid/widget/LinearLayout;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public final selectVideoBar:Landroidx/constraintlayout/widget/ConstraintLayout;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final textureContainer:Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method protected constructor <init>(Landroidx/databinding/DataBindingComponent;Landroid/view/View;ILandroid/widget/Button;Landroid/widget/Button;Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;Landroid/widget/LinearLayout;Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;)V
    .locals 0

    .line 38
    invoke-direct {p0, p1, p2, p3}, Landroidx/databinding/ViewDataBinding;-><init>(Landroidx/databinding/DataBindingComponent;Landroid/view/View;I)V

    .line 39
    iput-object p4, p0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;->button1to1:Landroid/widget/Button;

    .line 40
    iput-object p5, p0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;->button4to3:Landroid/widget/Button;

    .line 41
    iput-object p6, p0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;->meshContainer:Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;

    .line 42
    iget-object p1, p0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;->meshContainer:Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;->setContainedBinding(Landroidx/databinding/ViewDataBinding;)V

    .line 43
    iput-object p7, p0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;->seekbarContainer:Landroid/widget/LinearLayout;

    .line 44
    iput-object p8, p0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;->selectVideoBar:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 45
    iput-object p9, p0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;->textureContainer:Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;

    .line 46
    iget-object p1, p0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;->textureContainer:Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;->setContainedBinding(Landroidx/databinding/ViewDataBinding;)V

    return-void
.end method

.method public static bind(Landroid/view/View;)Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;
    .locals 1
    .param p0    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 73
    invoke-static {}, Landroidx/databinding/DataBindingUtil;->getDefaultComponent()Landroidx/databinding/DataBindingComponent;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;->bind(Landroid/view/View;Landroidx/databinding/DataBindingComponent;)Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;

    move-result-object p0

    return-object p0
.end method

.method public static bind(Landroid/view/View;Landroidx/databinding/DataBindingComponent;)Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;
    .locals 1
    .param p0    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Landroidx/databinding/DataBindingComponent;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const v0, 0x7f0c0031

    .line 78
    invoke-static {p1, p0, v0}, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;->bind(Landroidx/databinding/DataBindingComponent;Landroid/view/View;I)Landroidx/databinding/ViewDataBinding;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;

    return-object p0
.end method

.method public static inflate(Landroid/view/LayoutInflater;)Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;
    .locals 1
    .param p0    # Landroid/view/LayoutInflater;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 63
    invoke-static {}, Landroidx/databinding/DataBindingUtil;->getDefaultComponent()Landroidx/databinding/DataBindingComponent;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;->inflate(Landroid/view/LayoutInflater;Landroidx/databinding/DataBindingComponent;)Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;

    move-result-object p0

    return-object p0
.end method

.method public static inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;
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

    .line 52
    invoke-static {}, Landroidx/databinding/DataBindingUtil;->getDefaultComponent()Landroidx/databinding/DataBindingComponent;

    move-result-object v0

    invoke-static {p0, p1, p2, v0}, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;->inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;ZLandroidx/databinding/DataBindingComponent;)Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;

    move-result-object p0

    return-object p0
.end method

.method public static inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;ZLandroidx/databinding/DataBindingComponent;)Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;
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

    const v0, 0x7f0c0031

    .line 58
    invoke-static {p0, v0, p1, p2, p3}, Landroidx/databinding/DataBindingUtil;->inflate(Landroid/view/LayoutInflater;ILandroid/view/ViewGroup;ZLandroidx/databinding/DataBindingComponent;)Landroidx/databinding/ViewDataBinding;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;

    return-object p0
.end method

.method public static inflate(Landroid/view/LayoutInflater;Landroidx/databinding/DataBindingComponent;)Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;
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

    const v0, 0x7f0c0031

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 69
    invoke-static {p0, v0, v1, v2, p1}, Landroidx/databinding/DataBindingUtil;->inflate(Landroid/view/LayoutInflater;ILandroid/view/ViewGroup;ZLandroidx/databinding/DataBindingComponent;)Landroidx/databinding/ViewDataBinding;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;

    return-object p0
.end method
