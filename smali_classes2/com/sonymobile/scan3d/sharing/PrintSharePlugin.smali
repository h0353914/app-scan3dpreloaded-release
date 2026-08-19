.class public Lcom/sonymobile/scan3d/sharing/PrintSharePlugin;
.super Lcom/sonymobile/scan3d/sharing/LocalPlugin;
.source "PrintSharePlugin.java"

# interfaces
.implements Lcom/sonymobile/scan3d/sharing/NamedPlugin;


# static fields
.field public static final KEY_DONT_SHOW_AGAIN:Ljava/lang/String; = "FileSharePlugin_dontShowAgain"

.field private static final SHARE_PRINT_AS_FILE_NAME:Ljava/lang/String; = "SharePrintAsFile"

.field private static final TAG:Ljava/lang/String; = "PrintSharePlugin"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroidx/fragment/app/Fragment;)V
    .locals 3

    .line 25
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string v0, "SharePrintAsFile"

    const v1, 0x7f080147

    const v2, 0x7f100278

    invoke-direct {p0, p1, v1, v2, v0}, Lcom/sonymobile/scan3d/sharing/LocalPlugin;-><init>(Landroid/content/Context;IILjava/lang/String;)V

    return-void
.end method


# virtual methods
.method public getAppIcon()Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 35
    iget-object v0, p0, Lcom/sonymobile/scan3d/sharing/PrintSharePlugin;->mContext:Landroid/content/Context;

    const v1, 0x7f0800e6

    invoke-virtual {v0, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public getAppName()Ljava/lang/String;
    .locals 2

    .line 30
    iget-object v0, p0, Lcom/sonymobile/scan3d/sharing/PrintSharePlugin;->mContext:Landroid/content/Context;

    const v1, 0x7f100278

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getBackgroundColor()I
    .locals 1
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation

    const/4 v0, 0x0

    return v0
.end method

.method public isEnabled(Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;Landroid/content/Context;I)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method

.method public shareMesh(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V
    .locals 0

    .line 40
    sget-object p1, Lcom/sonymobile/scan3d/sharing/PrintSharePlugin;->TAG:Ljava/lang/String;

    const-string p2, "shareMesh() called unexpectedly"

    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
