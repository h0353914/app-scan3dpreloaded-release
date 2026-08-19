.class Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/YoutubeTipFragment$AsyncImageSetter;
.super Lcom/sonymobile/scan3d/storageservice/network/AsyncViewSetter;
.source "YoutubeTipFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/YoutubeTipFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AsyncImageSetter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/sonymobile/scan3d/storageservice/network/AsyncViewSetter<",
        "Landroid/widget/ImageView;",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field private mContainerView:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/widget/ImageView;Landroid/view/View;)V
    .locals 0

    .line 68
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/network/AsyncViewSetter;-><init>(Landroid/view/View;)V

    .line 69
    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/YoutubeTipFragment$AsyncImageSetter;->mContainerView:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method public bridge synthetic onSetResource(Landroid/view/View;Ljava/lang/Object;)V
    .locals 0

    .line 55
    check-cast p1, Landroid/widget/ImageView;

    check-cast p2, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/YoutubeTipFragment$AsyncImageSetter;->onSetResource(Landroid/widget/ImageView;Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public onSetResource(Landroid/widget/ImageView;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 77
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 78
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/YoutubeTipFragment$AsyncImageSetter;->mContainerView:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    if-eqz p1, :cond_0

    const/4 p2, 0x0

    .line 80
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    return-void
.end method
