.class Lcom/sonymobile/scan3d/sharing/RemotePlugin;
.super Ljava/lang/Object;
.source "RemotePlugin.java"

# interfaces
.implements Lcom/sonymobile/scan3d/sharing/Plugin;


# instance fields
.field private mColor:I

.field private mContext:Landroid/content/Context;

.field private mDrawable:I

.field private mPkgName:Ljava/lang/String;

.field private mTitle:I


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/String;III)V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lcom/sonymobile/scan3d/sharing/RemotePlugin;->mContext:Landroid/content/Context;

    .line 35
    iput-object p2, p0, Lcom/sonymobile/scan3d/sharing/RemotePlugin;->mPkgName:Ljava/lang/String;

    .line 36
    iput p3, p0, Lcom/sonymobile/scan3d/sharing/RemotePlugin;->mTitle:I

    .line 37
    iput p4, p0, Lcom/sonymobile/scan3d/sharing/RemotePlugin;->mDrawable:I

    .line 38
    iput p5, p0, Lcom/sonymobile/scan3d/sharing/RemotePlugin;->mColor:I

    return-void
.end method

.method private createLayerDrawable(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    .locals 2

    const/4 v0, 0x2

    .line 76
    new-array v0, v0, [Landroid/graphics/drawable/Drawable;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    .line 78
    iget-object p1, p0, Lcom/sonymobile/scan3d/sharing/RemotePlugin;->mContext:Landroid/content/Context;

    const v1, 0x7f08012e

    invoke-virtual {p1, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    .line 79
    new-instance p1, Landroid/graphics/drawable/LayerDrawable;

    invoke-direct {p1, v0}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    return-object p1
.end method


# virtual methods
.method public getBackgroundColor()I
    .locals 1

    .line 71
    iget v0, p0, Lcom/sonymobile/scan3d/sharing/RemotePlugin;->mColor:I

    return v0
.end method

.method public getImage()Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 43
    iget-object v0, p0, Lcom/sonymobile/scan3d/sharing/RemotePlugin;->mContext:Landroid/content/Context;

    iget v1, p0, Lcom/sonymobile/scan3d/sharing/RemotePlugin;->mDrawable:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 44
    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/sharing/RemotePlugin;->createLayerDrawable(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public getSupportedMimeTypes()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 2

    .line 49
    iget-object v0, p0, Lcom/sonymobile/scan3d/sharing/RemotePlugin;->mContext:Landroid/content/Context;

    iget v1, p0, Lcom/sonymobile/scan3d/sharing/RemotePlugin;->mTitle:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isEnabled(Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;Landroid/content/Context;I)Z
    .locals 0

    .line 84
    sget-object p2, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->DEFAULT:Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    if-ne p1, p2, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public shareMesh(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V
    .locals 2

    .line 60
    :try_start_0
    new-instance p2, Landroid/content/Intent;

    const-string v0, "android.intent.action.VIEW"

    invoke-direct {p2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v0, "com.android.vending"

    .line 61
    invoke-virtual {p2, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 62
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "market://details?id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/sonymobile/scan3d/sharing/RemotePlugin;->mPkgName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 63
    invoke-virtual {p1, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method
