.class public Lcom/sonymobile/scan3d/utils/SharingUtil;
.super Ljava/lang/Object;
.source "SharingUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/utils/SharingUtil$SaveImage;,
        Lcom/sonymobile/scan3d/utils/SharingUtil$SaveVideo;,
        Lcom/sonymobile/scan3d/utils/SharingUtil$ShareRiggedFile;,
        Lcom/sonymobile/scan3d/utils/SharingUtil$ShareObjFile;
    }
.end annotation


# static fields
.field private static final ALBUM_VIEW:Ljava/lang/String; = "com.sonymobile.album.action.VIEW"

.field private static final EXTENSION_JPEG:Ljava/lang/String; = "jpg"

.field private static final EXTENSION_MP4:Ljava/lang/String; = "mp4"

.field private static final FINAL_FILE_NAME:Ljava/lang/String; = "3DCreator_%s.%s"

.field private static final MIME_TYPE_JPEG:Ljava/lang/String; = "image/jpeg"

.field private static final MIME_TYPE_MP4:Ljava/lang/String; = "video/mp4"

.field public static final NOTIFY_ACTIVITY_STARTED:I = 0x2

.field public static final NOTIFY_SHARE_FAILED:I = 0x1

.field public static final NOTIFY_SHARE_READY:I = 0x0

.field public static final TEMP_VIDEO_FILE_NAME:Ljava/lang/String; = "sharevideo_temp.mp4"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
    .locals 0

    .line 40
    invoke-static {p0, p1}, Lcom/sonymobile/scan3d/utils/SharingUtil;->createDateStampedFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;
    .locals 0

    .line 40
    invoke-static {p0, p1, p2}, Lcom/sonymobile/scan3d/utils/SharingUtil;->getAlbumViewIntent(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method private static createDateStampedFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
    .locals 5

    .line 415
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyyMMdd_HHmmss"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 416
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    .line 417
    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    .line 419
    new-instance v1, Ljava/io/File;

    invoke-static {p0}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object p0

    const-string v2, "3DCreator_%s.%s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v0, 0x1

    aput-object p1, v3, v0

    .line 420
    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v1
.end method

.method private static getAlbumViewIntent(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2

    .line 433
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.sonymobile.album.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "android.intent.category.DEFAULT"

    .line 434
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 435
    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 436
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    const/4 p2, 0x0

    .line 437
    invoke-virtual {p0, v0, p2}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object p0

    .line 438
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_0

    new-instance v0, Landroid/content/Intent;

    const-string p0, "android.intent.action.VIEW"

    invoke-direct {v0, p0, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    :cond_0
    return-object v0
.end method

.method public static getResizedGLBFile(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Ljava/lang/String;I)Ljava/io/File;
    .locals 3

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    .line 127
    :cond_0
    new-instance v1, Lcom/sonymobile/scan3d/animation/GLTFExporter;

    invoke-direct {v1}, Lcom/sonymobile/scan3d/animation/GLTFExporter;-><init>()V

    .line 128
    invoke-virtual {v1, p2}, Lcom/sonymobile/scan3d/animation/GLTFExporter;->load(Ljava/lang/String;)Z

    move-result p2

    .line 129
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ".glb"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 130
    invoke-static {p0, p1}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->getShareGlbFile(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    move-result-object p0

    if-eqz p2, :cond_2

    if-lez p3, :cond_1

    .line 135
    invoke-virtual {v1, p3, p3}, Lcom/sonymobile/scan3d/animation/GLTFExporter;->reduceTextureSize(II)V

    .line 137
    :cond_1
    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Lcom/sonymobile/scan3d/animation/GLTFExporter;->save(Ljava/lang/String;)Z

    move-result p2

    :cond_2
    if-eqz p2, :cond_3

    goto :goto_0

    :cond_3
    move-object p0, v0

    :goto_0
    return-object p0
.end method

.method public static getRiggedFileForSharing(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;I)Ljava/io/File;
    .locals 2

    if-eqz p1, :cond_0

    .line 99
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ".glb"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const-string v0, ""

    .line 100
    :goto_0
    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->getShareGlbFile(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    if-eqz p1, :cond_2

    .line 102
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->getPassword(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    .line 104
    new-instance v1, Lcom/sonymobile/scan3d/animation/GLTFExporter;

    invoke-direct {v1}, Lcom/sonymobile/scan3d/animation/GLTFExporter;-><init>()V

    .line 105
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getRiggedFileUrl()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1, p0}, Lcom/sonymobile/scan3d/animation/GLTFExporter;->load(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_3

    if-lez p2, :cond_1

    .line 109
    invoke-virtual {v1, p2, p2}, Lcom/sonymobile/scan3d/animation/GLTFExporter;->reduceTextureSize(II)V

    .line 111
    :cond_1
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Lcom/sonymobile/scan3d/animation/GLTFExporter;->save(Ljava/lang/String;)Z

    move-result p0

    goto :goto_1

    :cond_2
    const/4 p0, 0x0

    :cond_3
    :goto_1
    if-eqz p0, :cond_4

    goto :goto_2

    :cond_4
    const/4 v0, 0x0

    :goto_2
    return-object v0
.end method

.method public static saveImage(Landroid/content/Context;Landroid/os/Handler;Landroid/graphics/Bitmap;)V
    .locals 1

    .line 189
    new-instance v0, Lcom/sonymobile/scan3d/utils/SharingUtil$SaveImage;

    invoke-direct {v0, p0, p1, p2}, Lcom/sonymobile/scan3d/utils/SharingUtil$SaveImage;-><init>(Landroid/content/Context;Landroid/os/Handler;Landroid/graphics/Bitmap;)V

    .line 190
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object p0

    invoke-interface {p0, v0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    return-void
.end method

.method public static saveVideo(Landroid/content/Context;Landroid/os/Handler;Ljava/lang/String;)V
    .locals 1

    .line 176
    new-instance v0, Lcom/sonymobile/scan3d/utils/SharingUtil$SaveVideo;

    invoke-direct {v0, p0, p1, p2}, Lcom/sonymobile/scan3d/utils/SharingUtil$SaveVideo;-><init>(Landroid/content/Context;Landroid/os/Handler;Ljava/lang/String;)V

    .line 177
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object p0

    invoke-interface {p0, v0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    return-void
.end method

.method public static shareRiggedFile(Landroid/content/Context;Landroid/os/Handler;Landroid/net/Uri;I)V
    .locals 1

    .line 163
    new-instance v0, Lcom/sonymobile/scan3d/utils/SharingUtil$ShareRiggedFile;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/sonymobile/scan3d/utils/SharingUtil$ShareRiggedFile;-><init>(Landroid/content/Context;Landroid/os/Handler;Landroid/net/Uri;I)V

    .line 164
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object p0

    invoke-interface {p0, v0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    return-void
.end method

.method public static shareStaticFile(Landroid/content/Context;Landroid/os/Handler;Landroid/net/Uri;)V
    .locals 1

    .line 150
    new-instance v0, Lcom/sonymobile/scan3d/utils/SharingUtil$ShareObjFile;

    invoke-direct {v0, p0, p1, p2}, Lcom/sonymobile/scan3d/utils/SharingUtil$ShareObjFile;-><init>(Landroid/content/Context;Landroid/os/Handler;Landroid/net/Uri;)V

    .line 151
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object p0

    invoke-interface {p0, v0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    return-void
.end method
