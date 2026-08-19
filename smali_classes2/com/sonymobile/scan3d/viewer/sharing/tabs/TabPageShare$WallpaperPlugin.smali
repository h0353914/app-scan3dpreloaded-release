.class Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$WallpaperPlugin;
.super Lcom/sonymobile/scan3d/sharing/LocalPlugin;
.source "TabPageShare.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "WallpaperPlugin"
.end annotation


# static fields
.field private static final WALLPAPER_NAME:Ljava/lang/String; = "LiveWallpaper"


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;)V
    .locals 3

    .line 1342
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$WallpaperPlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    .line 1343
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string v0, "LiveWallpaper"

    const v1, 0x7f08014e

    const v2, 0x7f10027c

    invoke-direct {p0, p1, v1, v2, v0}, Lcom/sonymobile/scan3d/sharing/LocalPlugin;-><init>(Landroid/content/Context;IILjava/lang/String;)V

    return-void
.end method


# virtual methods
.method public getBackgroundColor()I
    .locals 2

    .line 1356
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$WallpaperPlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0600bd

    invoke-virtual {v0, v1}, Landroid/content/Context;->getColor(I)I

    move-result v0

    return v0
.end method

.method public getSupportedMimeTypes()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1361
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const-string v1, "application/vnd.sony.scan3d"

    .line 1362
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const-string v1, "model/gltf-binary"

    .line 1363
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method public isEnabled(Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;Landroid/content/Context;I)Z
    .locals 0

    .line 1369
    sget-object p2, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->PROPS:Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    if-eq p1, p2, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public shareMesh(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V
    .locals 2

    .line 1349
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$WallpaperPlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-interface {p2}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getUri()Landroid/net/Uri;

    move-result-object v1

    .line 1350
    invoke-interface {p2}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->isRigged()Z

    move-result p2

    .line 1349
    invoke-static {v0, v1, p2}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;->setAsWallpaper(Landroid/content/Context;Landroid/net/Uri;Z)V

    .line 1351
    sget-object p2, Lcom/sonymobile/scan3d/analytics/HitEvent;->WALLPAPER:Lcom/sonymobile/scan3d/analytics/HitEvent;

    const-wide/16 v0, 0x1

    invoke-virtual {p2, p1, v0, v1}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;J)V

    return-void
.end method
