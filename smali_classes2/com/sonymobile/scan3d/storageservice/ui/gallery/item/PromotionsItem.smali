.class public Lcom/sonymobile/scan3d/storageservice/ui/gallery/item/PromotionsItem;
.super Ljava/lang/Object;
.source "PromotionsItem.java"

# interfaces
.implements Lcom/sonymobile/scan3d/storageservice/ui/gallery/item/GalleryItem;


# instance fields
.field private final mSpanCount:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/item/PromotionsItem;->mSpanCount:I

    return-void
.end method


# virtual methods
.method public getItemId()J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getSpanCount()I
    .locals 1

    .line 29
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/item/PromotionsItem;->mSpanCount:I

    return v0
.end method

.method public getViewHolderType()I
    .locals 1

    const v0, 0x7f0c00a9

    return v0
.end method
