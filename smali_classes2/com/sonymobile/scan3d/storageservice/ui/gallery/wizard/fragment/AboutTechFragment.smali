.class public Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/AboutTechFragment;
.super Landroidx/fragment/app/Fragment;
.source "AboutTechFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 22
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    return-void
.end method

.method public static newInstance()Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/AboutTechFragment;
    .locals 1

    .line 30
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/AboutTechFragment;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/AboutTechFragment;-><init>()V

    return-object v0
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1
    .param p1    # Landroid/view/LayoutInflater;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const p3, 0x7f0c00c8

    const/4 v0, 0x0

    .line 37
    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method
