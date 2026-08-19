.class public final Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;
.super Landroid/app/IntentService;
.source "FileRecordService.java"


# static fields
.field private static final ACTION_CHECK_ENCRYPTION:I = 0xc

.field private static final ACTION_CHECK_INTEGRITY:I = 0x5

.field private static final ACTION_DELETE:I = 0xb

.field private static final ACTION_DELETE_ANIMATION:I = 0xd

.field private static final ACTION_DELETE_FILESET:I = 0x1

.field private static final ACTION_DELETE_SHARE_FILES:I = 0xa

.field private static final ACTION_INSERT:I = 0x4

.field private static final ACTION_INSERT_EXAMPLES:I = 0x2

.field private static final ACTION_SHARE_GLB:I = 0xf

.field private static final ACTION_SHARE_GLB_MESH:I = 0xe

.field private static final ACTION_SHARE_MESH:I = 0x9

.field private static final ACTION_STORE_FILE:I = 0x6

.field private static final ACTION_UPDATE:I = 0x0

.field private static final ACTION_UPDATE_METADATA:I = 0x8

.field private static final EXAMPLE_CARD_NAME_FACE:Ljava/lang/String; = "example_face.zip"

.field private static final EXAMPLE_CARD_NAME_FOOD:Ljava/lang/String; = "example_food.zip"

.field private static final EXAMPLE_CARD_NAME_FREEFORM:Ljava/lang/String; = "example_freeform.zip"

.field private static final EXAMPLE_CARD_NAME_HEAD:Ljava/lang/String; = "example_head.zip"

.field private static final EXTRA_COMPONENT_NAME:Ljava/lang/String; = "com.sonymobile.scan3d.extra.COMPONENT_NAME"

.field private static final EXTRA_CONTENT_ACTION:Ljava/lang/String; = "com.sonymobile.scan3d.extra.CONTENT_ACTION"

.field private static final EXTRA_CONTENT_VALUES:Ljava/lang/String; = "com.sonymobile.scan3d.extra.CONTENT_VALUES"

.field public static final EXTRA_EXPORT_GLB_URL:Ljava/lang/String; = "com.sonymobile.scan3d.extra.EXTRA_EXPORT_GLB_URL"

.field public static final EXTRA_IS_TESSELLATED:Ljava/lang/String; = "com.sonymobile.scan3d.extra.IS_TESSELLATED"

.field public static final EXTRA_MESSENGER:Ljava/lang/String; = "com.sonymobile.scan3d.extra.EXTRA_MESSENGER"

.field private static final EXTRA_PERFORM_SYNC:Ljava/lang/String; = "com.sonymobile.scan3d.extra.PERFORM_SYNC"

.field private static final EXTRA_TEXTURE_SIZE:Ljava/lang/String; = "com.sonymobile.scan3d.extra.TEXTURE_SIZE"

.field private static final PREF_KEY_ENCRYPTION_CHECKED:Ljava/lang/String; = "pref_key_encryption_checked"

.field private static final SELECTION:Ljava/lang/String; = "sync_state=?"

.field private static final SELECTION_ARGS:[Ljava/lang/String;

.field private static final SHARE_DELETE_TIME_MILLIS:J

.field private static final TAG:Ljava/lang/String; = "com.sonymobile.scan3d.storageservice.provider.FileRecordService"

.field private static final WORKER_THREAD:Ljava/lang/String; = "FileRecordService#WorkerThread"


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 71
    sget-object v0, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0xc

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    sput-wide v0, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->SHARE_DELETE_TIME_MILLIS:J

    const/4 v0, 0x1

    .line 85
    new-array v0, v0, [Ljava/lang/String;

    const/16 v1, 0x9

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->SELECTION_ARGS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const-string v0, "FileRecordService#WorkerThread"

    .line 441
    invoke-direct {p0, v0}, Landroid/app/IntentService;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method private addExampleScan(Ljava/lang/String;Lcom/android/vending/expansion/zipfile/ZipResourceFile;II)Z
    .locals 8

    .line 724
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->getFilesDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/results"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 726
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 728
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->getFilesDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/results"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 729
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    const/4 v7, 0x0

    if-nez v1, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-nez v0, :cond_0

    .line 730
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->TAG:Ljava/lang/String;

    const-string p2, "Failed to create result directory"

    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return v7

    .line 733
    :cond_0
    :try_start_0
    invoke-virtual {p2, p1}, Lcom/android/vending/expansion/zipfile/ZipResourceFile;->getInputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    const/4 v0, 0x0

    if-eqz p2, :cond_3

    .line 735
    :try_start_1
    invoke-static {v3, p2}, Lcom/sonymobile/scan3d/storageservice/network/StreamUtils;->saveToDisc(Ljava/io/File;Ljava/io/InputStream;)V

    .line 736
    invoke-virtual {p0, p3}, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v4, 0x0

    const/16 v5, 0x8

    move-object v1, p0

    move v6, p4

    invoke-static/range {v1 .. v6}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->insertFromFile(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;Ljava/io/File;II)Landroid/net/Uri;

    .line 738
    invoke-virtual {p2}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception p3

    goto :goto_0

    :catch_0
    move-exception p3

    move-object v0, p3

    .line 733
    :try_start_2
    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :goto_0
    if-eqz p2, :cond_2

    if-eqz v0, :cond_1

    .line 740
    :try_start_3
    invoke-virtual {p2}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_1

    :catch_1
    move-exception p2

    :try_start_4
    invoke-virtual {v0, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_1

    :cond_1
    invoke-virtual {p2}, Ljava/io/InputStream;->close()V

    :cond_2
    :goto_1
    throw p3

    :cond_3
    :goto_2
    if-eqz p2, :cond_4

    invoke-virtual {p2}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    :cond_4
    const/4 p1, 0x1

    return p1

    :catch_2
    move-exception p2

    .line 741
    sget-object p3, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->TAG:Ljava/lang/String;

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Failed to Add Example scan "

    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ": "

    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p3, p1}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return v7
.end method

.method private checkEncryption()V
    .locals 11

    .line 753
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->shouldCheckEncryption()Z

    move-result v0

    if-eqz v0, :cond_5

    const/4 v0, 0x0

    .line 756
    invoke-static {p0, v0, v0}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->create(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, 0x1

    move v3, v2

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    .line 757
    invoke-interface {v4}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->isRemote()Z

    move-result v5

    if-eqz v5, :cond_0

    goto :goto_0

    .line 758
    :cond_0
    invoke-interface {v4}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getSyncState()I

    move-result v5

    const/16 v6, 0x8

    if-ne v5, v6, :cond_1

    goto :goto_0

    .line 759
    :cond_1
    invoke-interface {v4}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getZipFileUrl()Ljava/lang/String;

    move-result-object v4

    .line 760
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 761
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->getTempDirectory(Landroid/content/Context;)Ljava/io/File;

    move-result-object v6

    .line 762
    new-instance v7, Lcom/sonymobile/scan3d/viewer/ModelContainer;

    invoke-direct {v7}, Lcom/sonymobile/scan3d/viewer/ModelContainer;-><init>()V

    const/4 v8, 0x0

    .line 764
    :try_start_0
    invoke-virtual {v7, v4, v0}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->importZip(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 765
    new-instance v4, Ljava/io/File;

    const-string v9, "temp.zip"

    invoke-direct {v4, v6, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 766
    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v9

    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->getPassword(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v9, v10}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->exportZip(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 767
    invoke-virtual {v4}, Ljava/io/File;->toPath()Ljava/nio/file/Path;

    move-result-object v4

    invoke-virtual {v5}, Ljava/io/File;->toPath()Ljava/nio/file/Path;

    move-result-object v5

    new-array v9, v2, [Ljava/nio/file/CopyOption;

    sget-object v10, Ljava/nio/file/StandardCopyOption;->REPLACE_EXISTING:Ljava/nio/file/StandardCopyOption;

    aput-object v10, v9, v8

    invoke-static {v4, v5, v9}, Ljava/nio/file/Files;->move(Ljava/nio/file/Path;Ljava/nio/file/Path;[Ljava/nio/file/CopyOption;)Ljava/nio/file/Path;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :cond_2
    move v3, v8

    .line 775
    :cond_3
    :goto_1
    invoke-virtual {v7}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->release()V

    .line 776
    invoke-static {v6, v2}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->deleteFiles(Ljava/io/File;Z)Z

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 775
    invoke-virtual {v7}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->release()V

    .line 776
    invoke-static {v6, v2}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->deleteFiles(Ljava/io/File;Z)Z

    .line 777
    throw v0

    .line 775
    :catch_0
    invoke-virtual {v7}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->release()V

    .line 776
    invoke-static {v6, v2}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->deleteFiles(Ljava/io/File;Z)Z

    move v3, v8

    goto :goto_0

    :cond_4
    if-eqz v3, :cond_5

    .line 781
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 782
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "pref_key_encryption_checked"

    .line 783
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 784
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_5
    return-void
.end method

.method static checkEncryption(Landroid/content/Context;)V
    .locals 3

    .line 240
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "com.sonymobile.scan3d.extra.CONTENT_ACTION"

    const/16 v2, 0xc

    .line 241
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 242
    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method

.method static checkIntegrity(Landroid/content/Context;)V
    .locals 3

    .line 229
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "com.sonymobile.scan3d.extra.CONTENT_ACTION"

    const/4 v2, 0x5

    .line 230
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 231
    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method

.method private checkIntegrity()Z
    .locals 7

    .line 795
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 796
    new-instance v1, Landroid/content/ContentValues;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Landroid/content/ContentValues;-><init>(I)V

    const-string v3, "sync_state"

    const/4 v4, 0x0

    .line 797
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1, v3, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 798
    sget-object v3, Lcom/sonymobile/scan3d/storageservice/provider/Contract$FileRecord;->CONTENT_URI:Landroid/net/Uri;

    const-string v5, "sync_state=?"

    sget-object v6, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->SELECTION_ARGS:[Ljava/lang/String;

    invoke-virtual {v0, v3, v1, v5, v6}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    if-lez v0, :cond_0

    goto :goto_0

    :cond_0
    move v2, v4

    :goto_0
    return v2
.end method

.method static delete(Landroid/content/Context;Landroid/net/Uri;)V
    .locals 2

    .line 295
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 296
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const-string p1, "com.sonymobile.scan3d.extra.CONTENT_ACTION"

    const/16 v1, 0xb

    .line 297
    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 298
    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method

.method static deleteAnimation(Landroid/content/Context;Landroid/net/Uri;)V
    .locals 2

    .line 308
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 309
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const-string p1, "com.sonymobile.scan3d.extra.CONTENT_ACTION"

    const/16 v1, 0xd

    .line 310
    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 311
    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method

.method static deleteFileSet(Landroid/content/Context;Landroid/net/Uri;Z)V
    .locals 2

    .line 281
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 282
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const-string p1, "com.sonymobile.scan3d.extra.CONTENT_ACTION"

    const/4 v1, 0x1

    .line 283
    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p1, "com.sonymobile.scan3d.extra.PERFORM_SYNC"

    .line 284
    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 285
    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method

.method private getMessengerFromIntent(Landroid/content/Intent;)Landroid/os/Messenger;
    .locals 1
    .param p1    # Landroid/content/Intent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 710
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    if-eqz p1, :cond_0

    const-string v0, "com.sonymobile.scan3d.extra.EXTRA_MESSENGER"

    .line 712
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/Messenger;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method private static hasValues(Landroid/content/ContentValues;)Z
    .locals 0

    if-eqz p0, :cond_0

    .line 809
    invoke-virtual {p0}, Landroid/content/ContentValues;->size()I

    move-result p0

    if-lez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method static insertExampleScans(Landroid/content/Context;)V
    .locals 3

    .line 251
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "com.sonymobile.scan3d.extra.CONTENT_ACTION"

    const/4 v2, 0x2

    .line 252
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 253
    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method

.method static insertRecord(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ContentValues;Z)V
    .locals 2

    .line 265
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 266
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const-string p1, "com.sonymobile.scan3d.extra.CONTENT_ACTION"

    const/4 v1, 0x4

    .line 267
    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p1, "com.sonymobile.scan3d.extra.CONTENT_VALUES"

    .line 268
    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const-string p1, "com.sonymobile.scan3d.extra.PERFORM_SYNC"

    .line 269
    invoke-virtual {v0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 270
    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method

.method static scheduleShareFileDeletion(Landroid/content/Context;)V
    .locals 5

    const-string v0, "alarm"

    .line 395
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 396
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v2, "com.sonymobile.scan3d.extra.CONTENT_ACTION"

    const/16 v3, 0xa

    .line 397
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const/4 v2, 0x0

    const/high16 v3, 0x8000000

    .line 400
    invoke-static {p0, v2, v1, v3}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0

    .line 402
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    sget-wide v3, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->SHARE_DELETE_TIME_MILLIS:J

    add-long/2addr v1, v3

    const/4 v3, 0x3

    .line 401
    invoke-virtual {v0, v3, v1, v2, p0}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    return-void
.end method

.method static shareGlb(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;Landroid/content/ComponentName;I)V
    .locals 2

    .line 363
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 364
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const-string p1, "com.sonymobile.scan3d.extra.EXTRA_EXPORT_GLB_URL"

    .line 365
    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "com.sonymobile.scan3d.extra.COMPONENT_NAME"

    .line 366
    invoke-virtual {v0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const-string p1, "com.sonymobile.scan3d.extra.TEXTURE_SIZE"

    .line 367
    invoke-virtual {v0, p1, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p1, "com.sonymobile.scan3d.extra.CONTENT_ACTION"

    const/16 p2, 0xf

    .line 368
    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 369
    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method

.method static shareGlbMesh(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ComponentName;ILandroid/os/Handler;)V
    .locals 2

    .line 342
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 343
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const-string p1, "com.sonymobile.scan3d.extra.COMPONENT_NAME"

    .line 344
    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const-string p1, "com.sonymobile.scan3d.extra.TEXTURE_SIZE"

    .line 345
    invoke-virtual {v0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p1, "com.sonymobile.scan3d.extra.CONTENT_ACTION"

    const/16 p2, 0xe

    .line 346
    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    if-eqz p4, :cond_0

    const-string p1, "com.sonymobile.scan3d.extra.EXTRA_MESSENGER"

    .line 348
    new-instance p2, Landroid/os/Messenger;

    invoke-direct {p2, p4}, Landroid/os/Messenger;-><init>(Landroid/os/Handler;)V

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 350
    :cond_0
    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method

.method static shareMesh(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ComponentName;Z)V
    .locals 2

    .line 324
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 325
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const-string p1, "com.sonymobile.scan3d.extra.COMPONENT_NAME"

    .line 326
    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const-string p1, "com.sonymobile.scan3d.extra.IS_TESSELLATED"

    .line 327
    invoke-virtual {v0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p1, "com.sonymobile.scan3d.extra.CONTENT_ACTION"

    const/16 p2, 0x9

    .line 328
    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 329
    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method

.method private shouldCheckEncryption()Z
    .locals 3

    .line 718
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 719
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/Config;->encrypt(Landroid/content/Context;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    const-string v1, "pref_key_encryption_checked"

    .line 720
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v2, 0x1

    :cond_0
    return v2
.end method

.method static storeFile(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ContentValues;)V
    .locals 2

    .line 413
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 414
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const-string p1, "com.sonymobile.scan3d.extra.CONTENT_ACTION"

    const/4 v1, 0x6

    .line 415
    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p1, "com.sonymobile.scan3d.extra.CONTENT_VALUES"

    .line 416
    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 417
    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method

.method static update(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ContentValues;Z)V
    .locals 2

    .line 380
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 381
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const-string p1, "com.sonymobile.scan3d.extra.CONTENT_ACTION"

    const/4 v1, 0x0

    .line 382
    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p1, "com.sonymobile.scan3d.extra.CONTENT_VALUES"

    .line 383
    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const-string p1, "com.sonymobile.scan3d.extra.PERFORM_SYNC"

    .line 384
    invoke-virtual {v0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 385
    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method

.method static updateMetaData(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ContentValues;Z)V
    .locals 2

    .line 429
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 430
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const-string p1, "com.sonymobile.scan3d.extra.CONTENT_ACTION"

    const/16 v1, 0x8

    .line 431
    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p1, "com.sonymobile.scan3d.extra.CONTENT_VALUES"

    .line 432
    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const-string p1, "com.sonymobile.scan3d.extra.PERFORM_SYNC"

    .line 433
    invoke-virtual {v0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 434
    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method


# virtual methods
.method protected onHandleIntent(Landroid/content/Intent;)V
    .locals 12

    if-eqz p1, :cond_e

    const-string v0, "com.sonymobile.scan3d.extra.CONTENT_ACTION"

    const/4 v1, -0x1

    .line 450
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    const-string v1, "com.sonymobile.scan3d.extra.PERFORM_SYNC"

    const/4 v2, 0x0

    .line 451
    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    .line 456
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const v4, 0x10000001

    const v5, 0x7f100274

    const v6, 0x7f100123

    const/4 v7, 0x1

    const/4 v8, 0x0

    packed-switch v0, :pswitch_data_0

    .line 694
    :pswitch_0
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onHandleIntent(): Unknown action "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_8

    .line 610
    :pswitch_1
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    .line 611
    invoke-static {p0, v1}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->create(Landroid/content/Context;Landroid/net/Uri;)Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v1

    const-string v3, "com.sonymobile.scan3d.extra.TEXTURE_SIZE"

    .line 612
    invoke-virtual {p1, v3, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    if-eqz v1, :cond_e

    const/16 v9, 0xe

    if-ne v0, v9, :cond_0

    .line 617
    invoke-static {p0, v1, v3}, Lcom/sonymobile/scan3d/utils/SharingUtil;->getRiggedFileForSharing(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;I)Ljava/io/File;

    move-result-object v8

    goto :goto_0

    :cond_0
    const/16 v9, 0xf

    if-ne v0, v9, :cond_2

    const-string v0, "com.sonymobile.scan3d.extra.EXTRA_EXPORT_GLB_URL"

    .line 619
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v3, :cond_1

    .line 621
    new-instance v8, Ljava/io/File;

    invoke-direct {v8, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    goto :goto_0

    .line 625
    :cond_1
    invoke-static {p0, v1, v0, v3}, Lcom/sonymobile/scan3d/utils/SharingUtil;->getResizedGLBFile(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Ljava/lang/String;I)Ljava/io/File;

    move-result-object v8

    :cond_2
    :goto_0
    if-eqz v8, :cond_5

    const-string v0, "com.sonymobile.scan3d.extra.COMPONENT_NAME"

    .line 630
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/content/ComponentName;

    .line 631
    new-instance v3, Landroid/content/Intent;

    const-string v9, "android.intent.action.SEND"

    invoke-direct {v3, v9}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 633
    invoke-virtual {p0, v6}, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 632
    invoke-static {p0, v6, v8}, Landroidx/core/content/FileProvider;->getUriForFile(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Landroid/net/Uri;

    move-result-object v6

    const-string v8, "android.intent.extra.STREAM"

    .line 634
    invoke-virtual {v3, v8, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const-string v8, "android.intent.extra.SUBJECT"

    .line 636
    invoke-virtual {p0, v5}, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->getString(I)Ljava/lang/String;

    move-result-object v5

    new-array v7, v7, [Ljava/lang/Object;

    .line 637
    invoke-interface {v1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getName()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v2

    .line 636
    invoke-static {v5, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 635
    invoke-virtual {v3, v8, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v2, "android.intent.extra.TEXT"

    .line 638
    invoke-interface {v1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v2, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v2, "com.sonymobile.scan3d.intent.extra.SCAN_TYPE"

    .line 640
    invoke-interface {v1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getScanType()I

    move-result v1

    invoke-static {v1}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->scanTypeToString(I)Ljava/lang/String;

    move-result-object v1

    .line 639
    invoke-virtual {v3, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 641
    invoke-virtual {v3, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 642
    invoke-virtual {v3, v4}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    if-eqz v0, :cond_4

    const-string v1, "model/gltf-binary"

    .line 645
    invoke-virtual {v3, v6, v1}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 646
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->getMessengerFromIntent(Landroid/content/Intent;)Landroid/os/Messenger;

    move-result-object p1

    if-eqz p1, :cond_3

    const-string v1, "com.sonymobile.scan3d.extra.EXTRA_MESSENGER"

    .line 648
    invoke-virtual {v3, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 650
    :cond_3
    sget-object p1, Lcom/sonymobile/scan3d/analytics/HitEvent;->ANIMATION_SHARED:Lcom/sonymobile/scan3d/analytics/HitEvent;

    invoke-virtual {v0}, Landroid/content/ComponentName;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p0, v0}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_1

    :cond_4
    const-string p1, "model/gltf-binary"

    .line 652
    invoke-virtual {v3, p1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 654
    :goto_1
    invoke-virtual {p0, v3}, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_8

    :cond_5
    const-string p1, "Unable to share this file."

    .line 657
    invoke-static {p0, p1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    .line 658
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    goto/16 :goto_8

    .line 671
    :pswitch_2
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    .line 672
    invoke-static {p0, p1}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->create(Landroid/content/Context;Landroid/net/Uri;)Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v0

    .line 675
    new-instance v1, Landroid/content/ContentValues;

    const/4 v2, 0x2

    invoke-direct {v1, v2}, Landroid/content/ContentValues;-><init>(I)V

    const-string v2, "rigged_scan_url"

    const-string v4, ""

    .line 676
    invoke-virtual {v1, v2, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "rigged_preview_url"

    const-string v4, ""

    .line 677
    invoke-virtual {v1, v2, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 678
    invoke-virtual {v3, p1, v1, v8, v8}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 681
    new-instance p1, Ljava/io/File;

    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getRiggedFileUrl()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p1, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 682
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    move-result p1

    if-nez p1, :cond_6

    .line 683
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to remove file "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getRiggedFileUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 687
    :cond_6
    new-instance p1, Ljava/io/File;

    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getRiggedPreviewUrl()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p1, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 688
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    move-result p1

    if-eqz p1, :cond_e

    .line 689
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to remove file "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getRiggedPreviewUrl()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_8

    .line 668
    :pswitch_3
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->checkEncryption()V

    goto/16 :goto_8

    .line 664
    :pswitch_4
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    .line 665
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-virtual {v0, p1, v8, v8}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    goto/16 :goto_8

    .line 523
    :pswitch_5
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->deleteShareFile(Landroid/content/Context;)V

    goto/16 :goto_8

    :pswitch_6
    const-string v0, "com.sonymobile.scan3d.extra.IS_TESSELLATED"

    .line 551
    invoke-virtual {p1, v0, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    const-string v1, "com.sonymobile.scan3d.extra.COMPONENT_NAME"

    .line 552
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/content/ComponentName;

    .line 553
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    .line 554
    invoke-static {p0, p1}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->create(Landroid/content/Context;Landroid/net/Uri;)Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object p1

    if-eqz p1, :cond_e

    .line 557
    new-instance v3, Ljava/io/File;

    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getZipFileUrl()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v3, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 559
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->getShareFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object v9

    .line 564
    :try_start_0
    invoke-static {p0, v3, v9}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->decrypt(Landroid/content/Context;Ljava/io/File;Ljava/io/File;)V

    .line 567
    new-instance v3, Lcom/sonymobile/scan3d/viewer/ModelContainer;

    invoke-direct {v3}, Lcom/sonymobile/scan3d/viewer/ModelContainer;-><init>()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 568
    :try_start_1
    invoke-virtual {v9}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v9, v8}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->importZip(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_8

    if-eqz v0, :cond_7

    move v0, v7

    goto :goto_2

    :cond_7
    move v0, v2

    .line 569
    :goto_2
    invoke-virtual {v3, v0}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->tessellate(I)Z

    .line 570
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, ".zip"

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->getShareFile(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 571
    :try_start_2
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v9, v8}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->exportZip(Ljava/lang/String;Ljava/lang/String;)Z
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_3

    :catch_0
    move-exception v8

    move-object v11, v3

    move-object v3, v0

    move-object v0, v8

    move-object v8, v11

    goto :goto_4

    :cond_8
    move-object v0, v8

    .line 576
    :goto_3
    invoke-virtual {v3}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->release()V

    goto :goto_5

    :catchall_0
    move-exception p1

    goto/16 :goto_7

    :catch_1
    move-exception v0

    move-object v11, v8

    move-object v8, v3

    move-object v3, v11

    goto :goto_4

    :catchall_1
    move-exception p1

    move-object v3, v8

    goto/16 :goto_7

    :catch_2
    move-exception v0

    move-object v3, v8

    .line 574
    :goto_4
    :try_start_3
    sget-object v9, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->TAG:Ljava/lang/String;

    const-string v10, "Failed to share the file."

    invoke-static {v9, v10, v0}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-eqz v8, :cond_9

    .line 576
    invoke-virtual {v8}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->release()V

    :cond_9
    move-object v0, v3

    :goto_5
    if-eqz v0, :cond_b

    .line 581
    new-instance v3, Landroid/content/Intent;

    const-string v8, "android.intent.action.SEND"

    invoke-direct {v3, v8}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 583
    invoke-virtual {p0, v6}, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 582
    invoke-static {p0, v6, v0}, Landroidx/core/content/FileProvider;->getUriForFile(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    .line 584
    invoke-virtual {v3, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    const-string v6, "android.intent.extra.STREAM"

    .line 585
    invoke-virtual {v3, v6, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const-string v6, "android.intent.extra.SUBJECT"

    .line 587
    invoke-virtual {p0, v5}, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->getString(I)Ljava/lang/String;

    move-result-object v5

    new-array v7, v7, [Ljava/lang/Object;

    .line 588
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getName()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v2

    .line 587
    invoke-static {v5, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 586
    invoke-virtual {v3, v6, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v2, "android.intent.extra.TEXT"

    .line 589
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v2, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v2, "com.sonymobile.scan3d.intent.extra.SCAN_TYPE"

    .line 591
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getScanType()I

    move-result p1

    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->scanTypeToString(I)Ljava/lang/String;

    move-result-object p1

    .line 590
    invoke-virtual {v3, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 592
    invoke-virtual {v3, v4}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    if-nez v1, :cond_a

    .line 596
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->ZIP:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->toMimeString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_6

    .line 599
    :cond_a
    sget-object p1, Lcom/sonymobile/scan3d/analytics/HitEvent;->SHARE_MESH:Lcom/sonymobile/scan3d/analytics/HitEvent;

    invoke-virtual {v1}, Landroid/content/ComponentName;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, p0, v1}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;Ljava/lang/String;)V

    const-string p1, "application/vnd.sony.scan3d"

    .line 600
    invoke-virtual {v3, v0, p1}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 602
    :goto_6
    invoke-virtual {p0, v3}, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->startActivity(Landroid/content/Intent;)V

    .line 605
    :cond_b
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->scheduleShareFileDeletion(Landroid/content/Context;)V

    goto/16 :goto_8

    :goto_7
    if-eqz v3, :cond_c

    .line 576
    invoke-virtual {v3}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->release()V

    .line 577
    :cond_c
    throw p1

    .line 478
    :pswitch_7
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    const-string v4, "com.sonymobile.scan3d.extra.CONTENT_VALUES"

    .line 479
    invoke-virtual {p1, v4}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/content/ContentValues;

    if-eqz v0, :cond_e

    .line 481
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->hasValues(Landroid/content/ContentValues;)Z

    move-result v4

    if-eqz v4, :cond_e

    .line 482
    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->create(Landroid/content/Context;Landroid/net/Uri;)Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v4

    .line 484
    invoke-interface {v4}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->isSynced()Z

    move-result v4

    if-eqz v4, :cond_d

    const-string v4, "sync_state"

    const/4 v5, 0x6

    .line 485
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {p1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 487
    :cond_d
    invoke-virtual {v3, v0, p1, v8, v8}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p1

    if-lez p1, :cond_e

    if-eqz v1, :cond_e

    .line 489
    invoke-static {p0, v2}, Lcom/sonymobile/scan3d/storageservice/content/Jobs;->requestSync(Landroid/content/Context;Z)Z

    goto/16 :goto_8

    .line 541
    :pswitch_8
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    const-string v1, "com.sonymobile.scan3d.extra.CONTENT_VALUES"

    .line 542
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/content/ContentValues;

    .line 543
    new-instance v3, Ljava/io/File;

    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v3, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const-string v0, "name"

    .line 544
    invoke-virtual {p1, v0}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v0, "scan_type"

    .line 545
    invoke-virtual {p1, v0}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v6

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v1, p0

    .line 547
    invoke-static/range {v1 .. v6}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->insertFromFile(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;Ljava/io/File;II)Landroid/net/Uri;

    goto/16 :goto_8

    .line 535
    :pswitch_9
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->checkIntegrity()Z

    move-result p1

    if-eqz p1, :cond_e

    .line 537
    invoke-static {p0, v2}, Lcom/sonymobile/scan3d/storageservice/content/Jobs;->requestSync(Landroid/content/Context;Z)Z

    goto/16 :goto_8

    .line 526
    :pswitch_a
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    const-string v3, "com.sonymobile.scan3d.extra.CONTENT_VALUES"

    .line 527
    invoke-virtual {p1, v3}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/content/ContentValues;

    .line 528
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    invoke-virtual {v3, v0, p1}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object p1

    if-eqz p1, :cond_e

    if-eqz v1, :cond_e

    .line 531
    invoke-static {p0, v2}, Lcom/sonymobile/scan3d/storageservice/content/Jobs;->requestSync(Landroid/content/Context;Z)Z

    goto/16 :goto_8

    .line 509
    :pswitch_b
    :try_start_4
    invoke-static {}, Lcom/sonymobile/scan3d/ZipResourceManager;->getInstance()Lcom/sonymobile/scan3d/ZipResourceManager;

    move-result-object p1

    iget-object p1, p1, Lcom/sonymobile/scan3d/ZipResourceManager;->EXPANSION_FILE_PATH:Ljava/lang/String;

    invoke-static {p1}, Lcom/sonymobile/scan3d/ZipResourceManager;->newInstance(Ljava/lang/String;)Lcom/android/vending/expansion/zipfile/ZipResourceFile;

    move-result-object p1

    const-string v0, "example_face.zip"

    const v1, 0x7f100124

    const/16 v3, 0x100

    .line 511
    invoke-direct {p0, v0, p1, v1, v3}, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->addExampleScan(Ljava/lang/String;Lcom/android/vending/expansion/zipfile/ZipResourceFile;II)Z

    move-result v0

    and-int/2addr v0, v7

    const-string v1, "example_head.zip"

    const v3, 0x7f100127

    const/16 v4, 0x101

    .line 512
    invoke-direct {p0, v1, p1, v3, v4}, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->addExampleScan(Ljava/lang/String;Lcom/android/vending/expansion/zipfile/ZipResourceFile;II)Z

    move-result v1

    and-int/2addr v0, v1

    const-string v1, "example_food.zip"

    const v3, 0x7f100125

    const/16 v4, 0x200

    .line 513
    invoke-direct {p0, v1, p1, v3, v4}, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->addExampleScan(Ljava/lang/String;Lcom/android/vending/expansion/zipfile/ZipResourceFile;II)Z

    move-result v1

    and-int/2addr v0, v1

    const-string v1, "example_freeform.zip"

    const v3, 0x7f100126

    .line 514
    invoke-direct {p0, v1, p1, v3, v2}, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->addExampleScan(Ljava/lang/String;Lcom/android/vending/expansion/zipfile/ZipResourceFile;II)Z

    move-result p1

    and-int/2addr p1, v0

    if-nez p1, :cond_e

    .line 516
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->TAG:Ljava/lang/String;

    const-string v0, "Failed exporting example scans from expansions file."

    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    goto :goto_8

    .line 519
    :catch_3
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->TAG:Ljava/lang/String;

    const-string v0, "Failed exporting example scans from expansions file."

    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_8

    .line 460
    :pswitch_c
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    .line 461
    invoke-static {p0, p1}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->create(Landroid/content/Context;Landroid/net/Uri;)Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v0

    if-eqz v0, :cond_e

    .line 462
    invoke-interface {v0, p0}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->deleteAllFiles(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 463
    invoke-virtual {v3, p1, v8, v8}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    if-lez v0, :cond_e

    .line 467
    invoke-static {p0, p1}, Lcom/sonymobile/scan3d/storageservice/content/Jobs;->cancelJob(Landroid/content/Context;Landroid/net/Uri;)Z

    if-eqz v1, :cond_e

    .line 471
    invoke-static {p0, v2}, Lcom/sonymobile/scan3d/storageservice/content/Jobs;->requestSync(Landroid/content/Context;Z)Z

    goto :goto_8

    .line 494
    :pswitch_d
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    const-string v4, "com.sonymobile.scan3d.extra.CONTENT_VALUES"

    .line 495
    invoke-virtual {p1, v4}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/content/ContentValues;

    if-eqz v0, :cond_e

    .line 497
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->hasValues(Landroid/content/ContentValues;)Z

    move-result v4

    if-eqz v4, :cond_e

    .line 498
    invoke-virtual {v3, v0, p1, v8, v8}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p1

    if-lez p1, :cond_e

    if-eqz v1, :cond_e

    .line 501
    invoke-static {p0, v2}, Lcom/sonymobile/scan3d/storageservice/content/Jobs;->requestSync(Landroid/content/Context;Z)Z

    :cond_e
    :goto_8
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_0
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method
