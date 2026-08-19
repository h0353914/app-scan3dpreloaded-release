.class public abstract Lcom/sonymobile/scan3d/sharing/LocalPlugin;
.super Ljava/lang/Object;
.source "LocalPlugin.java"

# interfaces
.implements Lcom/sonymobile/scan3d/sharing/Plugin;


# instance fields
.field protected final mContext:Landroid/content/Context;

.field private final mDescriptor:Ljava/lang/String;

.field private final mDrawableId:I
    .annotation build Landroidx/annotation/DrawableRes;
    .end annotation
.end field

.field private final mTitleId:I
    .annotation build Landroidx/annotation/StringRes;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;IILjava/lang/String;)V
    .locals 0
    .param p2    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param
    .param p3    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput p2, p0, Lcom/sonymobile/scan3d/sharing/LocalPlugin;->mDrawableId:I

    .line 22
    iput p3, p0, Lcom/sonymobile/scan3d/sharing/LocalPlugin;->mTitleId:I

    .line 23
    iput-object p1, p0, Lcom/sonymobile/scan3d/sharing/LocalPlugin;->mContext:Landroid/content/Context;

    .line 24
    iput-object p4, p0, Lcom/sonymobile/scan3d/sharing/LocalPlugin;->mDescriptor:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getDescriptor()Ljava/lang/String;
    .locals 1

    .line 37
    iget-object v0, p0, Lcom/sonymobile/scan3d/sharing/LocalPlugin;->mDescriptor:Ljava/lang/String;

    return-object v0
.end method

.method public getImage()Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 29
    iget-object v0, p0, Lcom/sonymobile/scan3d/sharing/LocalPlugin;->mContext:Landroid/content/Context;

    iget v1, p0, Lcom/sonymobile/scan3d/sharing/LocalPlugin;->mDrawableId:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

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

    .line 34
    iget-object v0, p0, Lcom/sonymobile/scan3d/sharing/LocalPlugin;->mContext:Landroid/content/Context;

    iget v1, p0, Lcom/sonymobile/scan3d/sharing/LocalPlugin;->mTitleId:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
