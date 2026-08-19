.class public final synthetic Lcom/sonymobile/scan3d/storageservice/ui/gallery/-$$Lambda$GalleryAdapter$ILFUoGaBNV87WfKDma9okvc__XE;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/util/function/IntPredicate;


# instance fields
.field private final synthetic f$0:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;


# direct methods
.method public synthetic constructor <init>(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/-$$Lambda$GalleryAdapter$ILFUoGaBNV87WfKDma9okvc__XE;->f$0:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    return-void
.end method


# virtual methods
.method public final test(I)Z
    .locals 1

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/-$$Lambda$GalleryAdapter$ILFUoGaBNV87WfKDma9okvc__XE;->f$0:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    invoke-static {v0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->lambda$shouldIncludeScan$0(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;I)Z

    move-result p1

    return p1
.end method
