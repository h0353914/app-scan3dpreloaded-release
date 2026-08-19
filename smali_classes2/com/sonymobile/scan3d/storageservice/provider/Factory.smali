.class public Lcom/sonymobile/scan3d/storageservice/provider/Factory;
.super Ljava/lang/Object;
.source "Factory.java"


# static fields
.field private static final FILE_PROJECTION:[Ljava/lang/String;

.field private static final IMPROVEMENT_PROJECTION:[Ljava/lang/String;

.field private static final SELECTION:Ljava/lang/String; = "sync_state!=? AND sync_state!=? AND sync_state!=? AND sync_state!=? AND sync_state!=?"

.field private static final SELECTION_ARG:[Ljava/lang/String;

.field private static final TAG:Ljava/lang/String; = "com.sonymobile.scan3d.storageservice.provider.Factory"

.field private static final UPLOAD_PROJECTION:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 21

    const-string v0, "_id"

    const-string v1, "identifier"

    const-string v2, "name"

    const-string v3, "url"

    const-string v4, "thumb_url"

    const-string v5, "eTag"

    const-string v6, "created"

    const-string v7, "sync_state"

    const-string v8, "log_url"

    const-string v9, "scan_type"

    const-string v10, "downloadable"

    const-string v11, "visible"

    const-string v12, "share_hash"

    const-string v13, "transfer_flags"

    const-string v14, "log_transfer_id"

    const-string v15, "is_improvement"

    const-string v16, "rigged_scan_url"

    const-string v17, "riggable"

    const-string v18, "rigged_preview_url"

    const-string v19, "prop_mesh_url"

    const-string v20, "shared_meshes"

    .line 48
    filled-new-array/range {v0 .. v20}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->FILE_PROJECTION:[Ljava/lang/String;

    const-string v0, "_id"

    const-string v1, "state"

    const-string v2, "uid"

    .line 75
    filled-new-array {v0, v1, v2}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->UPLOAD_PROJECTION:[Ljava/lang/String;

    const-string v1, "_id"

    const-string v2, "parent_id"

    const-string v3, "name"

    const-string v4, "s3_key"

    const-string v5, "improvement_type"

    const-string v6, "file_set_id"

    const-string v7, "sqs_message_id"

    const-string v8, "scan_type"

    const-string v9, "fail_state"

    .line 84
    filled-new-array/range {v1 .. v9}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->IMPROVEMENT_PROJECTION:[Ljava/lang/String;

    const/4 v0, 0x5

    .line 106
    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x7

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const/4 v1, 0x1

    .line 107
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x4

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x2

    aput-object v2, v0, v3

    const/16 v2, 0x9

    .line 108
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x3

    aput-object v2, v0, v3

    const/16 v2, 0xa

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->SELECTION_ARG:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(Landroid/content/Context;Landroid/net/Uri;)Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;
    .locals 7
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    .line 178
    :cond_0
    new-instance v1, Lcom/sonymobile/scan3d/storageservice/provider/Matcher;

    invoke-direct {v1}, Lcom/sonymobile/scan3d/storageservice/provider/Matcher;-><init>()V

    invoke-virtual {v1, p1}, Lcom/sonymobile/scan3d/storageservice/provider/Matcher;->match(Landroid/net/Uri;)I

    move-result v1

    if-eqz v1, :cond_1

    .line 193
    sget-object p0, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "create(): unknown uri "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 182
    :cond_1
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v3, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->FILE_PROJECTION:[Ljava/lang/String;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v2, p1

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    if-eqz p0, :cond_2

    .line 185
    :try_start_0
    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 186
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->createFileSet(Landroid/database/Cursor;)Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object p1

    move-object v0, p1

    goto :goto_0

    .line 188
    :cond_2
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->TAG:Ljava/lang/String;

    const-string v1, "create(): Could not get cursor."

    invoke-static {p1, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    if-eqz p0, :cond_3

    .line 190
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    :cond_3
    :goto_1
    return-object v0

    :catchall_0
    move-exception p1

    goto :goto_2

    :catch_0
    move-exception p1

    move-object v0, p1

    .line 182
    :try_start_1
    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_2
    if-eqz p0, :cond_5

    if-eqz v0, :cond_4

    .line 190
    :try_start_2
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_3

    :catch_1
    move-exception p0

    invoke-virtual {v0, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_3

    :cond_4
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    :cond_5
    :goto_3
    throw p1
.end method

.method public static create(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;Ljava/io/File;II)Lcom/sonymobile/scan3d/storageservice/provider/ITransientFileSet;
    .locals 6

    const/4 v0, 0x0

    if-eqz p2, :cond_1

    .line 127
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 131
    :try_start_0
    invoke-static {p0, p2}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->extract(Landroid/content/Context;Ljava/io/File;)Lcom/sonymobile/scan3d/storageservice/authentication/Vault$ExtractionResult;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 133
    invoke-virtual {v1}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault$ExtractionResult;->success()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 134
    invoke-virtual {v1}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault$ExtractionResult;->getIdentifier()Ljava/lang/String;

    move-result-object v2

    .line 135
    invoke-virtual {v1}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault$ExtractionResult;->getPreviewPath()Ljava/lang/String;

    move-result-object v1

    .line 137
    new-instance v3, Ljava/util/Date;

    invoke-virtual {p2}, Ljava/io/File;->lastModified()J

    move-result-wide v4

    invoke-direct {v3, v4, v5}, Ljava/util/Date;-><init>(J)V

    .line 138
    invoke-static {p0, p2, v2}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->moveFile(Landroid/content/Context;Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object p2

    .line 139
    invoke-static {p0, p3, v2}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->moveFile(Landroid/content/Context;Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object p0

    .line 142
    new-instance p3, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;

    invoke-direct {p3}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;-><init>()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 143
    :try_start_1
    invoke-virtual {p3, v2}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->setIdentifier(Ljava/lang/String;)V

    .line 144
    invoke-virtual {p3, p1}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->setName(Ljava/lang/String;)V

    .line 145
    invoke-virtual {p2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->setZipFileUrl(Ljava/lang/String;)V

    if-eqz p0, :cond_0

    .line 147
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 148
    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p3, p0}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->setLogUrl(Ljava/lang/String;)V

    .line 150
    :cond_0
    invoke-virtual {p3, v1}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->setPreviewUrl(Ljava/lang/String;)V

    .line 151
    invoke-virtual {p3, p4}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->setSyncState(I)V

    .line 152
    invoke-virtual {p3, v3}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->setCreated(Ljava/util/Date;)V

    .line 153
    invoke-virtual {p3, p5}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->setScanType(I)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    move-object v0, p3

    goto :goto_1

    :catch_0
    move-exception p0

    move-object v0, p3

    goto :goto_0

    :catch_1
    move-exception p0

    .line 156
    :goto_0
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->TAG:Ljava/lang/String;

    const-string p2, "create(): Failed to create file set."

    invoke-static {p1, p2, p0}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 159
    :cond_1
    sget-object p0, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->TAG:Ljava/lang/String;

    const-string p1, "create(): The file does not exist."

    invoke-static {p0, p1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    :goto_1
    return-object v0
.end method

.method public static create(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;",
            ">;"
        }
    .end annotation

    .line 270
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 271
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Lcom/sonymobile/scan3d/storageservice/provider/Contract$FileRecord;->CONTENT_URI:Landroid/net/Uri;

    sget-object v3, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->FILE_PROJECTION:[Ljava/lang/String;

    const/4 v6, 0x0

    move-object v4, p1

    move-object v5, p2

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    if-eqz p0, :cond_3

    const/4 p1, 0x0

    .line 273
    :try_start_0
    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result p2

    if-eqz p2, :cond_3

    .line 275
    :cond_0
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->createFileSet(Landroid/database/Cursor;)Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object p2

    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 276
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result p2
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez p2, :cond_0

    goto :goto_2

    :catchall_0
    move-exception p2

    goto :goto_0

    :catch_0
    move-exception p1

    .line 271
    :try_start_1
    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    if-eqz p0, :cond_2

    if-eqz p1, :cond_1

    .line 278
    :try_start_2
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    :catch_1
    move-exception p0

    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_1

    :cond_1
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    :cond_2
    :goto_1
    throw p2

    :cond_3
    :goto_2
    if-eqz p0, :cond_4

    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    :cond_4
    return-object v0
.end method

.method static create(Landroid/database/sqlite/SQLiteDatabase;)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            ")",
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;",
            ">;"
        }
    .end annotation

    const-string v1, "file"

    .line 290
    sget-object v2, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->FILE_PROJECTION:[Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    .line 292
    :try_start_0
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->createFileRecords(Landroid/database/Cursor;)Ljava/util/List;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p0, :cond_0

    .line 293
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    :cond_0
    return-object v0

    :catchall_0
    move-exception v0

    const/4 v1, 0x0

    goto :goto_0

    :catch_0
    move-exception v1

    .line 290
    :try_start_1
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :catchall_1
    move-exception v0

    :goto_0
    if-eqz p0, :cond_2

    if-eqz v1, :cond_1

    .line 293
    :try_start_2
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    :catch_1
    move-exception p0

    invoke-virtual {v1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_1

    :cond_1
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    :cond_2
    :goto_1
    throw v0
.end method

.method public static createFileRecordLoader(Landroid/content/Context;Ljava/lang/String;)Landroidx/loader/content/CursorLoader;
    .locals 8

    .line 322
    new-instance v7, Landroidx/loader/content/CursorLoader;

    sget-object v2, Lcom/sonymobile/scan3d/storageservice/provider/Contract$FileRecord;->CONTENT_URI:Landroid/net/Uri;

    sget-object v3, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->FILE_PROJECTION:[Ljava/lang/String;

    const-string v4, "sync_state!=? AND sync_state!=? AND sync_state!=? AND sync_state!=? AND sync_state!=?"

    sget-object v5, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->SELECTION_ARG:[Ljava/lang/String;

    move-object v0, v7

    move-object v1, p0

    move-object v6, p1

    invoke-direct/range {v0 .. v6}, Landroidx/loader/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    return-object v7
.end method

.method public static createFileRecordLoader(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroidx/loader/content/CursorLoader;
    .locals 8

    .line 338
    new-instance v7, Landroidx/loader/content/CursorLoader;

    sget-object v2, Lcom/sonymobile/scan3d/storageservice/provider/Contract$FileRecord;->CONTENT_URI:Landroid/net/Uri;

    sget-object v3, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->FILE_PROJECTION:[Ljava/lang/String;

    move-object v0, v7

    move-object v1, p0

    move-object v4, p1

    move-object v5, p2

    move-object v6, p3

    invoke-direct/range {v0 .. v6}, Landroidx/loader/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    return-object v7
.end method

.method public static createFileRecords(Landroid/database/Cursor;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            ")",
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;",
            ">;"
        }
    .end annotation

    .line 231
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    if-eqz p0, :cond_1

    .line 233
    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 235
    :cond_0
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->createFileSet(Landroid/database/Cursor;)Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v1

    .line 236
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 237
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-nez v1, :cond_0

    :cond_1
    return-object v0
.end method

.method private static createFileSet(Landroid/database/Cursor;)Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;
    .locals 5

    .line 490
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;-><init>()V

    const/4 v1, 0x0

    .line 491
    invoke-interface {p0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->setId(J)V

    const/4 v2, 0x1

    .line 492
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->setIdentifier(Ljava/lang/String;)V

    const/4 v3, 0x2

    .line 493
    invoke-interface {p0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->setName(Ljava/lang/String;)V

    const/4 v3, 0x3

    .line 494
    invoke-interface {p0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->setZipFileUrl(Ljava/lang/String;)V

    const/4 v3, 0x4

    .line 495
    invoke-interface {p0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->setPreviewUrl(Ljava/lang/String;)V

    const/4 v3, 0x5

    .line 496
    invoke-interface {p0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->setEtag(Ljava/lang/String;)V

    const/4 v3, 0x6

    .line 497
    invoke-interface {p0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->setCreated(Ljava/lang/String;)V

    const/4 v3, 0x7

    .line 498
    invoke-interface {p0, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    invoke-virtual {v0, v3}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->setSyncState(I)V

    const/16 v3, 0x8

    .line 499
    invoke-interface {p0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->setLogUrl(Ljava/lang/String;)V

    const/16 v3, 0x9

    .line 500
    invoke-interface {p0, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    invoke-virtual {v0, v3}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->setScanType(I)V

    const/16 v3, 0xa

    .line 501
    invoke-interface {p0, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    if-lez v3, :cond_0

    move v3, v2

    goto :goto_0

    :cond_0
    move v3, v1

    :goto_0
    invoke-virtual {v0, v3}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->setDownloadable(Z)V

    const/16 v3, 0xc

    const/16 v4, 0xb

    .line 502
    invoke-interface {p0, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    if-lez v4, :cond_1

    move v4, v2

    goto :goto_1

    :cond_1
    move v4, v1

    :goto_1
    invoke-virtual {v0, v4}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->setVisible(Z)V

    const/16 v4, 0xd

    .line 503
    invoke-interface {p0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->setShareHash(Ljava/lang/String;)V

    const/16 v3, 0xe

    .line 504
    invoke-interface {p0, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    invoke-virtual {v0, v4}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->setTransferFlags(I)V

    const/16 v4, 0xf

    .line 505
    invoke-interface {p0, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    invoke-virtual {v0, v3}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->setLogTransferId(I)V

    const/16 v3, 0x10

    .line 506
    invoke-interface {p0, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    if-lez v4, :cond_2

    move v4, v2

    goto :goto_2

    :cond_2
    move v4, v1

    :goto_2
    invoke-virtual {v0, v4}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->setIsImprovement(Z)V

    const/16 v4, 0x11

    .line 507
    invoke-interface {p0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->setRiggedFileUrl(Ljava/lang/String;)V

    const/16 v3, 0x12

    .line 508
    invoke-interface {p0, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    if-lez v4, :cond_3

    move v1, v2

    :cond_3
    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->setIsRiggable(Z)V

    const/16 v1, 0x13

    .line 509
    invoke-interface {p0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->setRiggedPreviewUrl(Ljava/lang/String;)V

    const/16 v2, 0x14

    .line 510
    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->setPropFileUrl(Ljava/lang/String;)V

    .line 511
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result p0

    invoke-virtual {v0, p0}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->setSharedMeshes(I)V

    return-object v0
.end method

.method private static createImprovement(Landroid/database/Cursor;)Lcom/sonymobile/scan3d/storageservice/provider/Improvement;
    .locals 3

    .line 538
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;-><init>()V

    const/4 v1, 0x0

    .line 539
    invoke-interface {p0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->setId(J)V

    const/4 v1, 0x1

    .line 540
    invoke-interface {p0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->setParentId(J)V

    const/4 v1, 0x2

    .line 541
    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->setName(Ljava/lang/String;)V

    const/4 v1, 0x3

    .line 542
    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->setS3Path(Ljava/lang/String;)V

    const/4 v1, 0x4

    .line 543
    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->setType(Ljava/lang/String;)V

    const/4 v1, 0x5

    .line 544
    invoke-interface {p0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->setFileSetId(J)V

    const/4 v1, 0x6

    .line 545
    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->setMessageId(Ljava/lang/String;)V

    const/4 v1, 0x7

    .line 546
    invoke-interface {p0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->setScanType(I)V

    const/16 v1, 0x8

    .line 547
    invoke-interface {p0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result p0

    invoke-virtual {v0, p0}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->setFailState(I)V

    return-object v0
.end method

.method public static createImprovementLoader(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;)Landroidx/loader/content/CursorLoader;
    .locals 8

    .line 350
    new-instance v7, Landroidx/loader/content/CursorLoader;

    sget-object v2, Lcom/sonymobile/scan3d/storageservice/provider/Contract$ImprovementRecord;->CONTENT_URI:Landroid/net/Uri;

    sget-object v3, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->IMPROVEMENT_PROJECTION:[Ljava/lang/String;

    const/4 v6, 0x0

    move-object v0, v7

    move-object v1, p0

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v6}, Landroidx/loader/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    return-object v7
.end method

.method public static createImprovementRecords(Landroid/database/Cursor;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            ")",
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/provider/Improvement;",
            ">;"
        }
    .end annotation

    .line 250
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    if-eqz p0, :cond_1

    .line 252
    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 254
    :cond_0
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->createImprovement(Landroid/database/Cursor;)Lcom/sonymobile/scan3d/storageservice/provider/Improvement;

    move-result-object v1

    .line 255
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 256
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-nez v1, :cond_0

    :cond_1
    return-object v0
.end method

.method public static createMap(Landroid/content/ContentProviderClient;)Ljava/util/Map;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/ContentProviderClient;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 209
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 211
    sget-object v2, Lcom/sonymobile/scan3d/storageservice/provider/Contract$FileRecord;->CONTENT_URI:Landroid/net/Uri;

    sget-object v3, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->FILE_PROJECTION:[Ljava/lang/String;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v1, p0

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentProviderClient;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    if-eqz p0, :cond_3

    const/4 v1, 0x0

    .line 213
    :try_start_0
    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 215
    :cond_0
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->createFileSet(Landroid/database/Cursor;)Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v2

    .line 216
    invoke-interface {v2}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getIdentifier()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 217
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_0

    goto :goto_2

    :catchall_0
    move-exception v0

    goto :goto_0

    :catch_0
    move-exception v0

    move-object v1, v0

    .line 211
    :try_start_1
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    if-eqz p0, :cond_2

    if-eqz v1, :cond_1

    .line 220
    :try_start_2
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    :catch_1
    move-exception p0

    invoke-virtual {v1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_1

    :cond_1
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    :cond_2
    :goto_1
    throw v0

    :cond_3
    :goto_2
    if-eqz p0, :cond_4

    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    :cond_4
    return-object v0
.end method

.method private static createUpload(Landroid/database/Cursor;)Lcom/sonymobile/scan3d/storageservice/provider/Upload;
    .locals 3

    .line 523
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/provider/Upload;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/storageservice/provider/Upload;-><init>()V

    const/4 v1, 0x0

    .line 524
    invoke-interface {p0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/provider/Upload;->setId(J)V

    const/4 v1, 0x1

    .line 525
    invoke-interface {p0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/provider/Upload;->setState(I)V

    const/4 v1, 0x2

    .line 526
    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/sonymobile/scan3d/storageservice/provider/Upload;->setUid(Ljava/lang/String;)V

    return-object v0
.end method

.method public static getImprovement(Landroid/content/Context;Landroid/net/Uri;)Lcom/sonymobile/scan3d/storageservice/provider/Improvement;
    .locals 6

    .line 412
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v2, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->IMPROVEMENT_PROJECTION:[Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    const/4 p1, 0x0

    if-eqz p0, :cond_2

    .line 414
    :try_start_0
    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 415
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->createImprovement(Landroid/database/Cursor;)Lcom/sonymobile/scan3d/storageservice/provider/Improvement;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception v0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 412
    :try_start_1
    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    if-eqz p0, :cond_1

    if-eqz p1, :cond_0

    .line 417
    :try_start_2
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    :catch_1
    move-exception p0

    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_1

    :cond_0
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    :cond_1
    :goto_1
    throw v0

    :cond_2
    :goto_2
    if-eqz p0, :cond_3

    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    :cond_3
    return-object p1
.end method

.method public static getImprovement(Landroid/content/Context;Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/provider/Improvement;
    .locals 6

    const-string v3, "sqs_message_id=?"

    const/4 v0, 0x1

    .line 391
    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    aput-object p1, v4, v0

    .line 393
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/provider/Contract$ImprovementRecord;->CONTENT_URI:Landroid/net/Uri;

    sget-object v2, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->IMPROVEMENT_PROJECTION:[Ljava/lang/String;

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    const/4 p1, 0x0

    if-eqz p0, :cond_2

    .line 395
    :try_start_0
    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 396
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->createImprovement(Landroid/database/Cursor;)Lcom/sonymobile/scan3d/storageservice/provider/Improvement;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception v0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 393
    :try_start_1
    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    if-eqz p0, :cond_1

    if-eqz p1, :cond_0

    .line 398
    :try_start_2
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    :catch_1
    move-exception p0

    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_1

    :cond_0
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    :cond_1
    :goto_1
    throw v0

    :cond_2
    :goto_2
    if-eqz p0, :cond_3

    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    :cond_3
    return-object p1
.end method

.method public static getImprovements(Landroid/content/Context;)Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/sonymobile/scan3d/storageservice/provider/Improvement;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 454
    invoke-static {p0, v0, v0}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->getImprovements(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p0

    return-object p0
.end method

.method public static getImprovements(Landroid/content/Context;I)Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I)",
            "Ljava/util/ArrayList<",
            "Lcom/sonymobile/scan3d/storageservice/provider/Improvement;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x1

    .line 443
    new-array v0, v0, [Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "datetime(\'now\', \'-"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " day\')"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const-string p1, "created<=?"

    .line 444
    invoke-static {p0, p1, v0}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->getImprovements(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p0

    return-object p0
.end method

.method public static getImprovements(Landroid/content/Context;Landroid/net/Uri;)Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/net/Uri;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/sonymobile/scan3d/storageservice/provider/Improvement;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x1

    .line 430
    new-array v0, v0, [Ljava/lang/String;

    invoke-static {p1}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const-string p1, "parent_id=?"

    .line 431
    invoke-static {p0, p1, v0}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->getImprovements(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p0

    return-object p0
.end method

.method private static getImprovements(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/sonymobile/scan3d/storageservice/provider/Improvement;",
            ">;"
        }
    .end annotation

    .line 467
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 469
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Lcom/sonymobile/scan3d/storageservice/provider/Contract$ImprovementRecord;->CONTENT_URI:Landroid/net/Uri;

    sget-object v3, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->IMPROVEMENT_PROJECTION:[Ljava/lang/String;

    const/4 v6, 0x0

    move-object v4, p1

    move-object v5, p2

    .line 470
    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    if-eqz p0, :cond_3

    const/4 p1, 0x0

    .line 472
    :try_start_0
    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result p2

    if-eqz p2, :cond_3

    .line 474
    :cond_0
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->createImprovement(Landroid/database/Cursor;)Lcom/sonymobile/scan3d/storageservice/provider/Improvement;

    move-result-object p2

    .line 475
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 476
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result p2
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez p2, :cond_0

    goto :goto_2

    :catchall_0
    move-exception p2

    goto :goto_0

    :catch_0
    move-exception p1

    .line 469
    :try_start_1
    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    if-eqz p0, :cond_2

    if-eqz p1, :cond_1

    .line 478
    :try_start_2
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    :catch_1
    move-exception p0

    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_1

    :cond_1
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    :cond_2
    :goto_1
    throw p2

    :cond_3
    :goto_2
    if-eqz p0, :cond_4

    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    :cond_4
    return-object v0
.end method

.method public static getUpload(Landroid/content/Context;Landroid/net/Uri;Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;)Lcom/sonymobile/scan3d/storageservice/provider/Upload;
    .locals 8

    .line 363
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->name()Ljava/lang/String;

    move-result-object p2

    const/4 v0, 0x0

    if-eqz p1, :cond_3

    .line 367
    invoke-virtual {p1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p1

    const-string v1, "upload"

    .line 368
    invoke-virtual {p1, v1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 369
    invoke-virtual {p1, p2}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 371
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-virtual {p1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v3

    sget-object v4, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->UPLOAD_PROJECTION:[Ljava/lang/String;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    if-eqz p0, :cond_2

    .line 373
    :try_start_0
    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 374
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->createUpload(Landroid/database/Cursor;)Lcom/sonymobile/scan3d/storageservice/provider/Upload;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception p1

    goto :goto_0

    :catch_0
    move-exception p1

    move-object v0, p1

    .line 371
    :try_start_1
    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    if-eqz p0, :cond_1

    if-eqz v0, :cond_0

    .line 376
    :try_start_2
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    :catch_1
    move-exception p0

    invoke-virtual {v0, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_1

    :cond_0
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    :cond_1
    :goto_1
    throw p1

    :cond_2
    :goto_2
    if-eqz p0, :cond_3

    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    :cond_3
    return-object v0
.end method

.method private static readContent(Lcom/sonymobile/scan3d/storageservice/network/synchublib/SphinxContent;)Lcom/sonymobile/scan3d/storageservice/provider/FileSet;
    .locals 4

    .line 559
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;-><init>()V

    const/4 v1, 0x1

    .line 562
    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->setSyncState(I)V

    .line 563
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/SphinxContent;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->setName(Ljava/lang/String;)V

    .line 564
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/SphinxContent;->getContentId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->setIdentifier(Ljava/lang/String;)V

    .line 565
    new-instance v1, Ljava/util/Date;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/SphinxContent;->getCreationDate()J

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->setCreated(Ljava/util/Date;)V

    .line 566
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/SphinxContent;->getETag()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->setEtag(Ljava/lang/String;)V

    .line 567
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/SphinxContent;->getPolicy()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->setScanType(I)V

    .line 568
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/SphinxContent;->getShareHash()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->setShareHash(Ljava/lang/String;)V

    .line 569
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/SphinxContent;->isVisible()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->setVisible(Z)V

    .line 570
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/SphinxContent;->isDownloadable()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->setDownloadable(Z)V

    .line 571
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/SphinxContent;->isImprovement()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->setIsImprovement(Z)V

    .line 572
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/SphinxContent;->getSharedMeshes()I

    move-result p0

    invoke-virtual {v0, p0}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->setSharedMeshes(I)V

    return-object v0
.end method

.method public static readContentList(Ljava/util/List;)Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/network/synchublib/SphinxContent;",
            ">;)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/sonymobile/scan3d/storageservice/provider/ITransientFileSet;",
            ">;"
        }
    .end annotation

    .line 303
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    if-eqz p0, :cond_0

    .line 305
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sonymobile/scan3d/storageservice/network/synchublib/SphinxContent;

    .line 306
    invoke-static {v1}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->readContent(Lcom/sonymobile/scan3d/storageservice/network/synchublib/SphinxContent;)Lcom/sonymobile/scan3d/storageservice/provider/FileSet;

    move-result-object v1

    .line 307
    invoke-virtual {v1}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->getIdentifier()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    return-object v0
.end method
