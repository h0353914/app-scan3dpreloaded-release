.class public Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/ImageTipFragment;
.super Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/TipFragment;
.source "ImageTipFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 22
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/TipFragment;-><init>()V

    return-void
.end method

.method public static newInstance(Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;)Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/ImageTipFragment;
    .locals 3

    .line 31
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/ImageTipFragment;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/ImageTipFragment;-><init>()V

    .line 32
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "tip"

    .line 33
    invoke-virtual {v1, v2, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 34
    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/ImageTipFragment;->setArguments(Landroid/os/Bundle;)V

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

    const p3, 0x7f0c00bd

    const/4 v0, 0x0

    .line 48
    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;)V
    .locals 0

    .line 40
    invoke-virtual {p3}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->getImage()I

    move-result p2

    const p3, 0x7f0900f1

    .line 41
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    .line 42
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    return-void
.end method
