.class public interface abstract Lcom/sonymobile/scan3d/sharing/Plugin;
.super Ljava/lang/Object;
.source "Plugin.java"


# virtual methods
.method public abstract getBackgroundColor()I
.end method

.method public abstract getImage()Landroid/graphics/drawable/Drawable;
.end method

.method public getPreferredMimeType()Ljava/lang/String;
    .locals 1

    const-string v0, "application/vnd.sony.scan3d"

    return-object v0
.end method

.method public abstract getSupportedMimeTypes()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public getTextColor(Landroid/content/Context;)I
    .locals 1

    const v0, 0x7f060031

    .line 72
    invoke-virtual {p1, v0}, Landroid/content/Context;->getColor(I)I

    move-result p1

    return p1
.end method

.method public getTextureSize()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public abstract getTitle()Ljava/lang/String;
.end method

.method public abstract isEnabled(Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;Landroid/content/Context;I)Z
.end method

.method public abstract shareMesh(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V
.end method

.method public shareMesh(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;I)V
    .locals 0

    .line 61
    invoke-interface {p0, p1, p2}, Lcom/sonymobile/scan3d/sharing/Plugin;->shareMesh(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V

    return-void
.end method
