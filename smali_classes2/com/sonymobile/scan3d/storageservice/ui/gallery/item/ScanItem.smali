.class public Lcom/sonymobile/scan3d/storageservice/ui/gallery/item/ScanItem;
.super Ljava/lang/Object;
.source "ScanItem.java"

# interfaces
.implements Lcom/sonymobile/scan3d/storageservice/ui/gallery/item/GalleryItem;


# instance fields
.field private mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

.field private mImprovement:Lcom/sonymobile/scan3d/storageservice/provider/Improvement;

.field private mSmall:Z


# direct methods
.method public constructor <init>(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/provider/Improvement;Z)V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/item/ScanItem;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    .line 22
    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/item/ScanItem;->mImprovement:Lcom/sonymobile/scan3d/storageservice/provider/Improvement;

    .line 23
    iput-boolean p3, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/item/ScanItem;->mSmall:Z

    return-void
.end method


# virtual methods
.method public getFileSet()Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;
    .locals 1

    .line 42
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/item/ScanItem;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    return-object v0
.end method

.method public getImprovement()Lcom/sonymobile/scan3d/storageservice/provider/Improvement;
    .locals 1

    .line 46
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/item/ScanItem;->mImprovement:Lcom/sonymobile/scan3d/storageservice/provider/Improvement;

    return-object v0
.end method

.method public getItemId()J
    .locals 2

    .line 33
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/item/ScanItem;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getId()J

    move-result-wide v0

    return-wide v0
.end method

.method public getSpanCount()I
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public getViewHolderType()I
    .locals 1

    .line 28
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/item/ScanItem;->mSmall:Z

    if-eqz v0, :cond_0

    const v0, 0x7f0c006b

    goto :goto_0

    :cond_0
    const v0, 0x7f0c006a

    :goto_0
    return v0
.end method
