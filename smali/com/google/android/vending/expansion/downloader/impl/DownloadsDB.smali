.class public Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;
.super Ljava/lang/Object;
.source "DownloadsDB.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB$DownloadColumns;,
        Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB$MetadataColumns;,
        Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB$DownloadsContentDBHelper;
    }
.end annotation


# static fields
.field private static final CONTROL_IDX:I = 0x7

.field private static final CURRENTBYTES_IDX:I = 0x4

.field private static final DATABASE_NAME:Ljava/lang/String; = "DownloadsDB"

.field private static final DATABASE_VERSION:I = 0x7

.field private static final DC_PROJECTION:[Ljava/lang/String;

.field private static final ETAG_IDX:I = 0x2

.field private static final FILENAME_IDX:I = 0x0

.field private static final INDEX_IDX:I = 0xb

.field private static final LASTMOD_IDX:I = 0x5

.field public static final LOG_TAG:Ljava/lang/String; = "com.google.android.vending.expansion.downloader.impl.DownloadsDB"

.field private static final NUM_FAILED_IDX:I = 0x8

.field private static final REDIRECT_COUNT_IDX:I = 0xa

.field private static final RETRY_AFTER_IDX:I = 0x9

.field private static final STATUS_IDX:I = 0x6

.field private static final TOTALBYTES_IDX:I = 0x3

.field private static final URI_IDX:I = 0x1

.field private static mDownloadsDB:Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;


# instance fields
.field mFlags:I

.field mGetDownloadByIndex:Landroid/database/sqlite/SQLiteStatement;

.field final mHelper:Landroid/database/sqlite/SQLiteOpenHelper;

.field mMetadataRowID:J

.field mStatus:I

.field mUpdateCurrentBytes:Landroid/database/sqlite/SQLiteStatement;

.field mVersionCode:I


# direct methods
.method static constructor <clinit>()V
    .locals 12

    const-string v0, "FN"

    const-string v1, "URI"

    const-string v2, "ETAG"

    const-string v3, "TOTALBYTES"

    const-string v4, "CURRENTBYTES"

    const-string v5, "LASTMOD"

    const-string v6, "STATUS"

    const-string v7, "CONTROL"

    const-string v8, "FAILCOUNT"

    const-string v9, "RETRYAFTER"

    const-string v10, "REDIRECTCOUNT"

    const-string v11, "FILEIDX"

    .line 297
    filled-new-array/range {v0 .. v11}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->DC_PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, -0x1

    .line 37
    iput-wide v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mMetadataRowID:J

    const/4 v0, -0x1

    .line 38
    iput v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mVersionCode:I

    .line 39
    iput v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mStatus:I

    .line 70
    new-instance v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB$DownloadsContentDBHelper;

    invoke-direct {v0, p1}, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB$DownloadsContentDBHelper;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    .line 71
    iget-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteOpenHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p1

    const-string v0, "SELECT APKVERSION,_id,DOWNLOADSTATUS,DOWNLOADFLAGS FROM MetadataColumns LIMIT 1"

    const/4 v1, 0x0

    .line 74
    invoke-virtual {p1, v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 81
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 82
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mVersionCode:I

    const/4 v0, 0x1

    .line 83
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mMetadataRowID:J

    const/4 v0, 0x2

    .line 84
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mStatus:I

    const/4 v0, 0x3

    .line 85
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mFlags:I

    .line 86
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 88
    :cond_0
    sput-object p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mDownloadsDB:Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;

    return-void
.end method

.method public static declared-synchronized getDB(Landroid/content/Context;)Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;
    .locals 2

    const-class v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;

    monitor-enter v0

    .line 43
    :try_start_0
    sget-object v1, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mDownloadsDB:Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;

    if-nez v1, :cond_0

    .line 44
    new-instance v1, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;

    invoke-direct {v1, p0}, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;-><init>(Landroid/content/Context;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    .line 46
    :cond_0
    :try_start_1
    sget-object p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mDownloadsDB:Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private getDownloadByIndexStatement()Landroid/database/sqlite/SQLiteStatement;
    .locals 2

    .line 50
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mGetDownloadByIndex:Landroid/database/sqlite/SQLiteStatement;

    if-nez v0, :cond_0

    .line 51
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteOpenHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "SELECT _id FROM DownloadColumns WHERE FILEIDX = ?"

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mGetDownloadByIndex:Landroid/database/sqlite/SQLiteStatement;

    .line 56
    :cond_0
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mGetDownloadByIndex:Landroid/database/sqlite/SQLiteStatement;

    return-object v0
.end method

.method private getUpdateCurrentBytesStatement()Landroid/database/sqlite/SQLiteStatement;
    .locals 2

    .line 60
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mUpdateCurrentBytes:Landroid/database/sqlite/SQLiteStatement;

    if-nez v0, :cond_0

    .line 61
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteOpenHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "UPDATE DownloadColumns SET CURRENTBYTES = ? WHERE FILEIDX = ?"

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mUpdateCurrentBytes:Landroid/database/sqlite/SQLiteStatement;

    .line 66
    :cond_0
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mUpdateCurrentBytes:Landroid/database/sqlite/SQLiteStatement;

    return-object v0
.end method


# virtual methods
.method public close()V
    .locals 1

    .line 134
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteOpenHelper;->close()V

    return-void
.end method

.method protected getDownloadInfoByFileName(Ljava/lang/String;)Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;
    .locals 10

    .line 92
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteOpenHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const/4 v0, 0x0

    :try_start_0
    const-string v2, "DownloadColumns"

    .line 95
    sget-object v3, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->DC_PROJECTION:[Ljava/lang/String;

    const-string v4, "FN = ?"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v1 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz p1, :cond_1

    .line 100
    :try_start_1
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 101
    invoke-virtual {p0, p1}, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->getDownloadInfoFromCursor(Landroid/database/Cursor;)Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;

    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz p1, :cond_0

    .line 105
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    :cond_0
    return-object v0

    :catchall_0
    move-exception v0

    move-object v9, v0

    move-object v0, p1

    move-object p1, v9

    goto :goto_0

    :cond_1
    if-eqz p1, :cond_2

    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    :cond_2
    return-object v0

    :catchall_1
    move-exception p1

    :goto_0
    if-eqz v0, :cond_3

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 106
    :cond_3
    throw p1
.end method

.method public getDownloadInfoFromCursor(Landroid/database/Cursor;)Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;
    .locals 4

    .line 480
    new-instance v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;

    const/16 v1, 0xb

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    const/4 v2, 0x0

    .line 481
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v3

    .line 482
    invoke-virtual {v3}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 483
    invoke-virtual {p0, v0, p1}, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->setDownloadInfoFromCursor(Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;Landroid/database/Cursor;)V

    return-object v0
.end method

.method public getDownloads()[Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;
    .locals 10

    .line 488
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteOpenHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const/4 v0, 0x0

    :try_start_0
    const-string v2, "DownloadColumns"

    .line 491
    sget-object v3, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->DC_PROJECTION:[Ljava/lang/String;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v1 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v1, :cond_2

    .line 493
    :try_start_1
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 494
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v0

    new-array v0, v0, [Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;

    const/4 v2, 0x0

    .line 497
    :goto_0
    invoke-virtual {p0, v1}, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->getDownloadInfoFromCursor(Landroid/database/Cursor;)Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;

    move-result-object v3

    add-int/lit8 v4, v2, 0x1

    .line 498
    aput-object v3, v0, v2

    .line 499
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v2, :cond_1

    if-eqz v1, :cond_0

    .line 505
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_0
    return-object v0

    :cond_1
    move v2, v4

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_1

    :cond_2
    if-eqz v1, :cond_3

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_3
    return-object v0

    :catchall_1
    move-exception v1

    move-object v9, v1

    move-object v1, v0

    move-object v0, v9

    :goto_1
    if-eqz v1, :cond_4

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 507
    :cond_4
    throw v0
.end method

.method public getFlags()I
    .locals 1

    .line 383
    iget v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mFlags:I

    return v0
.end method

.method public getIDByIndex(I)J
    .locals 3

    .line 115
    invoke-direct {p0}, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->getDownloadByIndexStatement()Landroid/database/sqlite/SQLiteStatement;

    move-result-object v0

    .line 116
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->clearBindings()V

    int-to-long v1, p1

    const/4 p1, 0x1

    .line 117
    invoke-virtual {v0, p1, v1, v2}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 119
    :try_start_0
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->simpleQueryForLong()J

    move-result-wide v0
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteDoneException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    :catch_0
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public getIDForDownloadInfo(Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;)J
    .locals 2

    .line 111
    iget p1, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mIndex:I

    invoke-virtual {p0, p1}, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->getIDByIndex(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getLastCheckedVersionCode()I
    .locals 1

    .line 363
    iget v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mVersionCode:I

    return v0
.end method

.method public isDownloadRequired()Z
    .locals 4

    .line 367
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteOpenHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "SELECT Count(*) FROM DownloadColumns WHERE STATUS <> 0"

    const/4 v2, 0x0

    .line 368
    invoke-virtual {v0, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    const/4 v1, 0x1

    if-eqz v0, :cond_3

    .line 372
    :try_start_0
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_3

    const/4 v2, 0x0

    .line 373
    invoke-interface {v0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v3, :cond_0

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    if-eqz v0, :cond_1

    .line 377
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :cond_1
    return v1

    :catchall_0
    move-exception v1

    if-eqz v0, :cond_2

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 378
    :cond_2
    throw v1

    :cond_3
    if-eqz v0, :cond_4

    .line 377
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :cond_4
    return v1
.end method

.method public setDownloadInfoFromCursor(Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;Landroid/database/Cursor;)V
    .locals 2

    const/4 v0, 0x1

    .line 467
    invoke-interface {p2, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mUri:Ljava/lang/String;

    const/4 v0, 0x2

    .line 468
    invoke-interface {p2, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mETag:Ljava/lang/String;

    const/4 v0, 0x3

    .line 469
    invoke-interface {p2, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    iput-wide v0, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mTotalBytes:J

    const/4 v0, 0x4

    .line 470
    invoke-interface {p2, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    iput-wide v0, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mCurrentBytes:J

    const/4 v0, 0x5

    .line 471
    invoke-interface {p2, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    iput-wide v0, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mLastMod:J

    const/4 v0, 0x6

    .line 472
    invoke-interface {p2, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mStatus:I

    const/4 v0, 0x7

    .line 473
    invoke-interface {p2, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mControl:I

    const/16 v0, 0x8

    .line 474
    invoke-interface {p2, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mNumFailed:I

    const/16 v0, 0x9

    .line 475
    invoke-interface {p2, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mRetryAfter:I

    const/16 v0, 0xa

    .line 476
    invoke-interface {p2, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result p2

    iput p2, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mRedirectCount:I

    return-void
.end method

.method public updateDownload(Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;)Z
    .locals 4

    .line 327
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "FILEIDX"

    .line 328
    iget v2, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mIndex:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v1, "FN"

    .line 329
    iget-object v2, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mFileName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "URI"

    .line 330
    iget-object v2, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mUri:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "ETAG"

    .line 331
    iget-object v2, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mETag:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "TOTALBYTES"

    .line 332
    iget-wide v2, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mTotalBytes:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v1, "CURRENTBYTES"

    .line 333
    iget-wide v2, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mCurrentBytes:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v1, "LASTMOD"

    .line 334
    iget-wide v2, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mLastMod:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v1, "STATUS"

    .line 335
    iget v2, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mStatus:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v1, "CONTROL"

    .line 336
    iget v2, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mControl:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v1, "FAILCOUNT"

    .line 337
    iget v2, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mNumFailed:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v1, "RETRYAFTER"

    .line 338
    iget v2, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mRetryAfter:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v1, "REDIRECTCOUNT"

    .line 339
    iget v2, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mRedirectCount:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 340
    invoke-virtual {p0, p1, v0}, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->updateDownload(Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;Landroid/content/ContentValues;)Z

    move-result p1

    return p1
.end method

.method public updateDownload(Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;Landroid/content/ContentValues;)Z
    .locals 7

    const-wide/16 v0, -0x1

    if-nez p1, :cond_0

    move-wide v2, v0

    goto :goto_0

    .line 344
    :cond_0
    invoke-virtual {p0, p1}, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->getIDForDownloadInfo(Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;)J

    move-result-wide v2

    :goto_0
    const/4 p1, 0x0

    .line 346
    :try_start_0
    iget-object v4, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v4

    cmp-long v5, v2, v0

    const/4 v6, 0x1

    if-eqz v5, :cond_1

    const-string v0, "DownloadColumns"

    .line 348
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "DownloadColumns._id = "

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v4, v0, p2, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p2

    if-eq v6, p2, :cond_3

    return p1

    :cond_1
    const-string v2, "DownloadColumns"

    const-string v3, "URI"

    .line 353
    invoke-virtual {v4, v2, v3, p2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v2
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    cmp-long p2, v0, v2

    if-eqz p2, :cond_2

    move p1, v6

    :cond_2
    return p1

    :catch_0
    move-exception p2

    .line 357
    invoke-virtual {p2}, Landroid/database/sqlite/SQLiteException;->printStackTrace()V

    :cond_3
    return p1
.end method

.method public updateDownloadCurrentBytes(Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;)V
    .locals 4

    .line 126
    invoke-direct {p0}, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->getUpdateCurrentBytesStatement()Landroid/database/sqlite/SQLiteStatement;

    move-result-object v0

    .line 127
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->clearBindings()V

    .line 128
    iget-wide v1, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mCurrentBytes:J

    const/4 v3, 0x1

    invoke-virtual {v0, v3, v1, v2}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 129
    iget p1, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mIndex:I

    int-to-long v1, p1

    const/4 p1, 0x2

    invoke-virtual {v0, p1, v1, v2}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 130
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->execute()V

    return-void
.end method

.method public updateFlags(I)Z
    .locals 4

    .line 387
    iget v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mFlags:I

    const/4 v1, 0x1

    if-eq v0, p1, :cond_1

    .line 388
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v2, "DOWNLOADFLAGS"

    .line 389
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 390
    invoke-virtual {p0, v0}, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->updateMetadata(Landroid/content/ContentValues;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 391
    iput p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mFlags:I

    return v1

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    return v1
.end method

.method public updateFromDb(Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;)Z
    .locals 11

    .line 446
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteOpenHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const/4 v0, 0x0

    :try_start_0
    const-string v2, "DownloadColumns"

    .line 449
    sget-object v3, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->DC_PROJECTION:[Ljava/lang/String;

    const-string v4, "FN= ?"

    const/4 v9, 0x1

    new-array v5, v9, [Ljava/lang/String;

    iget-object v6, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mFileName:Ljava/lang/String;

    const/4 v10, 0x0

    aput-object v6, v5, v10

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v1 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 454
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 455
    invoke-virtual {p0, p1, v0}, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->setDownloadInfoFromCursor(Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;Landroid/database/Cursor;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    .line 461
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :cond_0
    return v9

    :cond_1
    if-eqz v0, :cond_2

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :cond_2
    return v10

    :catchall_0
    move-exception p1

    if-eqz v0, :cond_3

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 463
    :cond_3
    throw p1
.end method

.method public updateMetadata(II)Z
    .locals 3

    .line 433
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "APKVERSION"

    .line 434
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v1, "DOWNLOADSTATUS"

    .line 435
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 436
    invoke-virtual {p0, v0}, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->updateMetadata(Landroid/content/ContentValues;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 437
    iput p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mVersionCode:I

    .line 438
    iput p2, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mStatus:I

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public updateMetadata(Landroid/content/ContentValues;)Z
    .locals 6

    .line 417
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 418
    iget-wide v1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mMetadataRowID:J

    const-wide/16 v3, -0x1

    cmp-long v1, v3, v1

    const/4 v2, 0x0

    if-nez v1, :cond_1

    const-string v1, "MetadataColumns"

    const-string v5, "APKVERSION"

    .line 419
    invoke-virtual {v0, v1, v5, p1}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v0

    cmp-long p1, v3, v0

    if-nez p1, :cond_0

    return v2

    .line 423
    :cond_0
    iput-wide v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mMetadataRowID:J

    goto :goto_0

    :cond_1
    const-string v1, "MetadataColumns"

    .line 425
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "_id = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v4, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mMetadataRowID:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v0, v1, p1, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p1

    if-nez p1, :cond_2

    return v2

    :cond_2
    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method public updateStatus(I)Z
    .locals 4

    .line 402
    iget v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mStatus:I

    const/4 v1, 0x1

    if-eq v0, p1, :cond_1

    .line 403
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v2, "DOWNLOADSTATUS"

    .line 404
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 405
    invoke-virtual {p0, v0}, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->updateMetadata(Landroid/content/ContentValues;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 406
    iput p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mStatus:I

    return v1

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    return v1
.end method
