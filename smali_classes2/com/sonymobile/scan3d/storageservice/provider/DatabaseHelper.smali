.class Lcom/sonymobile/scan3d/storageservice/provider/DatabaseHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "DatabaseHelper.java"


# static fields
.field private static final CREATE_FILE_TABLE:Ljava/lang/String; = "CREATE TABLE IF NOT EXISTS file (_id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR, created DATETIME DEFAULT CURRENT_TIMESTAMP, thumb_url VARCHAR, url VARCHAR, sync_state INTEGER,log_url VARCHAR, scan_type INTEGER DEFAULT -1, identifier VARCHAR, transfer_flags INTEGER DEFAULT 0, eTag VARCHAR, downloadable BOOLEAN DEFAULT 0, log_transfer_id INTEGER DEFAULT -1, visible BOOLEAN DEFAULT 0, share_hash VARCHAR, is_improvement BOOLEAN DEFAULT 0, rigged_scan_url VARCHAR DEFAULT NULL,riggable BOOLEAN DEFAULT 1, rigged_preview_url VARCHAR DEFAULT NULL, prop_mesh_url VARCHAR DEFAULT NULL, shared_meshes INTEGER DEFAULT 0, UNIQUE (identifier) ON CONFLICT IGNORE)"

.field private static final CREATE_IMPROVEMENT_TABLE:Ljava/lang/String; = "CREATE TABLE IF NOT EXISTS improvement (_id INTEGER PRIMARY KEY AUTOINCREMENT, s3_key VARCHAR, parent_id INTEGER DEFAULT -1, fail_state INTEGER DEFAULT -1, name VARCHAR, sqs_message_id VARCHAR, improvement_type VARCHAR, created DATETIME DEFAULT CURRENT_TIMESTAMP, scan_type INTEGER DEFAULT 0, file_set_id INTEGER DEFAULT -1, UNIQUE (parent_id, improvement_type) ON CONFLICT IGNORE)"

.field private static final CREATE_UPLOAD_TABLE:Ljava/lang/String; = "CREATE TABLE IF NOT EXISTS upload (_id INTEGER PRIMARY KEY AUTOINCREMENT, provider VARCHAR, uid VARCHAR, state INTEGER, parent_id INTEGER REFERENCES file (_id) ON DELETE CASCADE, UNIQUE (parent_id, provider) ON CONFLICT IGNORE)"

.field private static final DATABASE_NAME:Ljava/lang/String; = "contentstorage.db"

.field static final DATABASE_VERSION:I = 0x11

.field private static final TAG:Ljava/lang/String; = "com.sonymobile.scan3d.storageservice.provider.DatabaseHelper"


# instance fields
.field private mContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method constructor <init>(Landroid/content/Context;)V
    .locals 1

    const-string v0, "contentstorage.db"

    .line 113
    invoke-direct {p0, p1, v0}, Lcom/sonymobile/scan3d/storageservice/provider/DatabaseHelper;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    const/4 v0, 0x0

    const/16 v1, 0x11

    .line 124
    invoke-direct {p0, p1, p2, v0, v1}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 125
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/provider/DatabaseHelper;->mContext:Landroid/content/Context;

    return-void
.end method

.method private upgradeTo8(Landroid/database/sqlite/SQLiteDatabase;)Z
    .locals 8

    const/4 v0, 0x0

    .line 441
    :try_start_0
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    const-string v1, "ALTER TABLE file ADD COLUMN scan_type INTEGER DEFAULT -1"

    .line 442
    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 445
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 446
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/16 v3, 0x100

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v2, 0xa

    .line 447
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v2, 0x1

    .line 449
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/16 v4, 0x101

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v1, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v3, 0xb

    .line 450
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v3, 0x3

    .line 452
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/16 v4, 0x200

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v3, 0x2

    .line 455
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v3, -0x1

    .line 456
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 458
    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 459
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 460
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 461
    new-instance v5, Landroid/content/ContentValues;

    invoke-direct {v5, v2}, Landroid/content/ContentValues;-><init>(I)V

    const-string v6, "scan_type"

    .line 462
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v5, v6, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v3, "file"

    .line 463
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "policy_mode="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v6, 0x0

    invoke-virtual {p1, v3, v5, v4, v6}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_0

    .line 466
    :cond_0
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 471
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    return v2

    :catchall_0
    move-exception v0

    goto :goto_1

    :catch_0
    move-exception v1

    .line 468
    :try_start_1
    sget-object v2, Lcom/sonymobile/scan3d/storageservice/provider/DatabaseHelper;->TAG:Ljava/lang/String;

    const-string v3, "Failed to upgrade database."

    invoke-static {v2, v3, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 471
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    return v0

    :goto_1
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 472
    throw v0
.end method


# virtual methods
.method public onConfigure(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1

    .line 137
    invoke-super {p0, p1}, Landroid/database/sqlite/SQLiteOpenHelper;->onConfigure(Landroid/database/sqlite/SQLiteDatabase;)V

    const/4 v0, 0x1

    .line 138
    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->setForeignKeyConstraintsEnabled(Z)V

    return-void
.end method

.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1

    const-string v0, "CREATE TABLE IF NOT EXISTS file (_id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR, created DATETIME DEFAULT CURRENT_TIMESTAMP, thumb_url VARCHAR, url VARCHAR, sync_state INTEGER,log_url VARCHAR, scan_type INTEGER DEFAULT -1, identifier VARCHAR, transfer_flags INTEGER DEFAULT 0, eTag VARCHAR, downloadable BOOLEAN DEFAULT 0, log_transfer_id INTEGER DEFAULT -1, visible BOOLEAN DEFAULT 0, share_hash VARCHAR, is_improvement BOOLEAN DEFAULT 0, rigged_scan_url VARCHAR DEFAULT NULL,riggable BOOLEAN DEFAULT 1, rigged_preview_url VARCHAR DEFAULT NULL, prop_mesh_url VARCHAR DEFAULT NULL, shared_meshes INTEGER DEFAULT 0, UNIQUE (identifier) ON CONFLICT IGNORE)"

    .line 130
    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE TABLE IF NOT EXISTS upload (_id INTEGER PRIMARY KEY AUTOINCREMENT, provider VARCHAR, uid VARCHAR, state INTEGER, parent_id INTEGER REFERENCES file (_id) ON DELETE CASCADE, UNIQUE (parent_id, provider) ON CONFLICT IGNORE)"

    .line 131
    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE TABLE IF NOT EXISTS improvement (_id INTEGER PRIMARY KEY AUTOINCREMENT, s3_key VARCHAR, parent_id INTEGER DEFAULT -1, fail_state INTEGER DEFAULT -1, name VARCHAR, sqs_message_id VARCHAR, improvement_type VARCHAR, created DATETIME DEFAULT CURRENT_TIMESTAMP, scan_type INTEGER DEFAULT 0, file_set_id INTEGER DEFAULT -1, UNIQUE (parent_id, improvement_type) ON CONFLICT IGNORE)"

    .line 132
    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    return-void
.end method

.method public onDowngrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 3

    .line 478
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/provider/DatabaseHelper;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onDownGrade(): from "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, " to "

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "DROP TABLE IF EXISTS file"

    .line 479
    invoke-virtual {p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p2, "DROP TABLE IF EXISTS upload"

    .line 480
    invoke-virtual {p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p2, "DROP TABLE IF EXISTS improvement"

    .line 481
    invoke-virtual {p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 482
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/provider/DatabaseHelper;->onCreate(Landroid/database/sqlite/SQLiteDatabase;)V

    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 11

    .line 143
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/provider/DatabaseHelper;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onUpgrade(): from "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {v0, p3}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p3, 0x1

    if-ne p2, p3, :cond_0

    .line 147
    :try_start_0
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    const-string v0, "ALTER TABLE file ADD COLUMN log_url VARCHAR"

    .line 148
    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "ALTER TABLE file ADD COLUMN transfer_flags INTEGER DEFAULT 0"

    .line 150
    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    add-int/lit8 p2, p2, 0x1

    .line 153
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p2

    goto :goto_1

    :catch_0
    move-exception v0

    .line 155
    :try_start_1
    sget-object v1, Lcom/sonymobile/scan3d/storageservice/provider/DatabaseHelper;->TAG:Ljava/lang/String;

    const-string v2, "Failed to upgrade database."

    invoke-static {v1, v2, v0}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 157
    :goto_0
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_2

    :goto_1
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 158
    throw p2

    :cond_0
    :goto_2
    const/4 v0, 0x2

    if-ne p2, v0, :cond_1

    .line 163
    :try_start_2
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    const-string v1, "ALTER TABLE file ADD COLUMN sketchfab_uid VARCHAR"

    .line 164
    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    add-int/lit8 p2, p2, 0x1

    .line 167
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 171
    :goto_3
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_5

    :catchall_1
    move-exception p2

    goto :goto_4

    :catch_1
    move-exception v1

    .line 169
    :try_start_3
    sget-object v2, Lcom/sonymobile/scan3d/storageservice/provider/DatabaseHelper;->TAG:Ljava/lang/String;

    const-string v3, "Failed to upgrade database."

    invoke-static {v2, v3, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_3

    .line 171
    :goto_4
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 172
    throw p2

    :cond_1
    :goto_5
    const/4 v1, 0x3

    if-ne p2, v1, :cond_2

    add-int/lit8 p2, p2, 0x1

    :cond_2
    const/4 v1, 0x4

    if-ne p2, v1, :cond_3

    .line 182
    :try_start_4
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    const-string v1, "ALTER TABLE file ADD COLUMN sculpteo_uid VARCHAR"

    .line 183
    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v1, "ALTER TABLE file ADD COLUMN print_file_url VARCHAR"

    .line 185
    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    add-int/lit8 p2, p2, 0x1

    .line 188
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    goto :goto_6

    :catchall_2
    move-exception p2

    goto :goto_7

    :catch_2
    move-exception v1

    .line 190
    :try_start_5
    sget-object v2, Lcom/sonymobile/scan3d/storageservice/provider/DatabaseHelper;->TAG:Ljava/lang/String;

    const-string v3, "Failed to upgrade database."

    invoke-static {v2, v3, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 192
    :goto_6
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_8

    :goto_7
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 193
    throw p2

    :cond_3
    :goto_8
    const/4 v1, 0x5

    if-ne p2, v1, :cond_4

    .line 198
    :try_start_6
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    const-string v1, "CREATE TABLE IF NOT EXISTS upload (_id INTEGER PRIMARY KEY AUTOINCREMENT, provider VARCHAR, uid VARCHAR, state INTEGER, parent_id INTEGER REFERENCES file (_id) ON DELETE CASCADE, UNIQUE (parent_id, provider) ON CONFLICT IGNORE)"

    .line 199
    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    add-int/lit8 p2, p2, 0x1

    .line 201
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 205
    :goto_9
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_b

    :catchall_3
    move-exception p2

    goto :goto_a

    :catch_3
    move-exception v1

    .line 203
    :try_start_7
    sget-object v2, Lcom/sonymobile/scan3d/storageservice/provider/DatabaseHelper;->TAG:Ljava/lang/String;

    const-string v3, "Failed to upgrade database."

    invoke-static {v2, v3, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    goto :goto_9

    .line 205
    :goto_a
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 206
    throw p2

    :cond_4
    :goto_b
    const/4 v1, 0x6

    if-ne p2, v1, :cond_5

    .line 211
    :try_start_8
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    const-string v1, "ALTER TABLE file ADD COLUMN policy_mode INTEGER DEFAULT -1"

    .line 212
    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    add-int/lit8 p2, p2, 0x1

    .line 215
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_4
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    .line 219
    :goto_c
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_e

    :catchall_4
    move-exception p2

    goto :goto_d

    :catch_4
    move-exception v1

    .line 217
    :try_start_9
    sget-object v2, Lcom/sonymobile/scan3d/storageservice/provider/DatabaseHelper;->TAG:Ljava/lang/String;

    const-string v3, "Failed to upgrade database."

    invoke-static {v2, v3, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_4

    goto :goto_c

    .line 219
    :goto_d
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 220
    throw p2

    :cond_5
    :goto_e
    const/4 v1, 0x7

    if-ne p2, v1, :cond_6

    .line 224
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/provider/DatabaseHelper;->upgradeTo8(Landroid/database/sqlite/SQLiteDatabase;)Z

    move-result v2

    if-eqz v2, :cond_6

    add-int/lit8 p2, p2, 0x1

    :cond_6
    const/16 v2, 0x8

    const/4 v3, 0x0

    if-ne p2, v2, :cond_b

    .line 229
    :try_start_a
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    const-string v4, "ALTER TABLE file ADD COLUMN share_hash VARCHAR DEFAULT NULL"

    .line 230
    invoke-virtual {p1, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v4, "ALTER TABLE file ADD COLUMN visible BOOLEAN DEFAULT 0"

    .line 232
    invoke-virtual {p1, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v4, "ALTER TABLE file ADD COLUMN downloadable BOOLEAN DEFAULT 0"

    .line 234
    invoke-virtual {p1, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 238
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->create(Landroid/database/sqlite/SQLiteDatabase;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_7
    :goto_f
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_a

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    .line 239
    invoke-interface {v5}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getId()J

    move-result-wide v6

    .line 240
    invoke-interface {v5}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getSyncState()I

    move-result v8

    .line 243
    invoke-interface {v5}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->isRemote()Z

    move-result v9

    if-nez v9, :cond_9

    .line 244
    invoke-interface {v5}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->isValid()Z

    move-result v9

    if-eqz v9, :cond_9

    if-ne v8, v1, :cond_8

    goto :goto_10

    .line 248
    :cond_8
    invoke-interface {v5}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getSyncState()I

    move-result v5

    if-eq v5, v2, :cond_7

    .line 254
    new-instance v5, Landroid/content/ContentValues;

    invoke-direct {v5, v0}, Landroid/content/ContentValues;-><init>(I)V

    const-string v8, "transfer_flags"

    .line 256
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v5, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v8, "sync_state"

    .line 258
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v5, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v8, "file"

    const-string v9, "_id=?"

    .line 259
    new-array v10, p3, [Ljava/lang/String;

    .line 260
    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v10, v3

    .line 259
    invoke-virtual {p1, v8, v5, v9, v10}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_f

    .line 245
    :cond_9
    :goto_10
    iget-object v8, p0, Lcom/sonymobile/scan3d/storageservice/provider/DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-interface {v5, v8}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->deleteAllFiles(Landroid/content/Context;)Z

    const-string v5, "file"

    const-string v8, "_id=?"

    .line 246
    new-array v9, p3, [Ljava/lang/String;

    .line 247
    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v9, v3

    .line 246
    invoke-virtual {p1, v5, v8, v9}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_f

    :cond_a
    const-string v0, "DROP TABLE IF EXISTS upload"

    .line 264
    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE TABLE IF NOT EXISTS upload (_id INTEGER PRIMARY KEY AUTOINCREMENT, provider VARCHAR, uid VARCHAR, state INTEGER, parent_id INTEGER REFERENCES file (_id) ON DELETE CASCADE, UNIQUE (parent_id, provider) ON CONFLICT IGNORE)"

    .line 265
    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    add-int/lit8 p2, p2, 0x1

    .line 267
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_5
    .catchall {:try_start_a .. :try_end_a} :catchall_5

    goto :goto_11

    :catchall_5
    move-exception p2

    goto :goto_12

    :catch_5
    move-exception v0

    .line 269
    :try_start_b
    sget-object v1, Lcom/sonymobile/scan3d/storageservice/provider/DatabaseHelper;->TAG:Ljava/lang/String;

    const-string v2, "Failed to upgrade database."

    invoke-static {v1, v2, v0}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_5

    .line 271
    :goto_11
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_13

    :goto_12
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 272
    throw p2

    :cond_b
    :goto_13
    const/16 v0, 0x9

    if-ne p2, v0, :cond_c

    .line 277
    :try_start_c
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    const-string v0, "ALTER TABLE file ADD COLUMN log_transfer_id INTEGER DEFAULT -1"

    .line 278
    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE TABLE IF NOT EXISTS improvement (_id INTEGER PRIMARY KEY AUTOINCREMENT, s3_key VARCHAR, parent_id INTEGER DEFAULT -1, name VARCHAR, sqs_message_id VARCHAR, improvement_type VARCHAR, scan_type INTEGER DEFAULT 0, file_set_id INTEGER DEFAULT -1, UNIQUE (parent_id, improvement_type) ON CONFLICT IGNORE)"

    .line 294
    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    add-int/lit8 p2, p2, 0x1

    .line 296
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_6
    .catchall {:try_start_c .. :try_end_c} :catchall_6

    goto :goto_14

    :catchall_6
    move-exception p2

    goto :goto_15

    :catch_6
    move-exception v0

    .line 298
    :try_start_d
    sget-object v1, Lcom/sonymobile/scan3d/storageservice/provider/DatabaseHelper;->TAG:Ljava/lang/String;

    const-string v2, "Failed to upgrade database."

    invoke-static {v1, v2, v0}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_6

    .line 300
    :goto_14
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_16

    :goto_15
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 301
    throw p2

    :cond_c
    :goto_16
    const/16 v0, 0xa

    if-ne p2, v0, :cond_d

    .line 306
    :try_start_e
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    const-string v0, "ALTER TABLE improvement ADD COLUMN fail_state INTEGER DEFAULT -1"

    .line 307
    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    add-int/lit8 p2, p2, 0x1

    .line 311
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_7
    .catchall {:try_start_e .. :try_end_e} :catchall_7

    .line 315
    :goto_17
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_19

    :catchall_7
    move-exception p2

    goto :goto_18

    :catch_7
    move-exception v0

    .line 313
    :try_start_f
    sget-object v1, Lcom/sonymobile/scan3d/storageservice/provider/DatabaseHelper;->TAG:Ljava/lang/String;

    const-string v2, "Failed to upgrade database."

    invoke-static {v1, v2, v0}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_7

    goto :goto_17

    .line 315
    :goto_18
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 316
    throw p2

    :cond_d
    :goto_19
    const/16 v0, 0xb

    if-ne p2, v0, :cond_e

    .line 321
    :try_start_10
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    const-string v0, "CREATE TABLE IF NOT EXISTS improvement (_id INTEGER PRIMARY KEY AUTOINCREMENT, s3_key VARCHAR, parent_id INTEGER DEFAULT -1, name VARCHAR, sqs_message_id VARCHAR, improvement_type VARCHAR, fail_state INTEGER DEFAULT -1, scan_type INTEGER DEFAULT 0, created DATETIME DEFAULT CURRENT_TIMESTAMP, file_set_id INTEGER DEFAULT -1, UNIQUE (parent_id, improvement_type) ON CONFLICT IGNORE)"

    const-string v1, "DROP TABLE IF EXISTS improvement"

    .line 342
    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 343
    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    add-int/lit8 p2, p2, 0x1

    .line 345
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_8
    .catchall {:try_start_10 .. :try_end_10} :catchall_8

    goto :goto_1a

    :catchall_8
    move-exception p2

    goto :goto_1b

    :catch_8
    move-exception v0

    .line 347
    :try_start_11
    sget-object v1, Lcom/sonymobile/scan3d/storageservice/provider/DatabaseHelper;->TAG:Ljava/lang/String;

    const-string v2, "Failed to upgrade database."

    invoke-static {v1, v2, v0}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_8

    .line 349
    :goto_1a
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_1c

    :goto_1b
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 350
    throw p2

    :cond_e
    :goto_1c
    const/16 v0, 0xc

    if-ne p2, v0, :cond_f

    .line 356
    :try_start_12
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    const-string v0, "ALTER TABLE file ADD COLUMN is_improvement BOOLEAN DEFAULT 0"

    .line 357
    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    add-int/lit8 p2, p2, 0x1

    .line 360
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_12} :catch_9
    .catchall {:try_start_12 .. :try_end_12} :catchall_9

    .line 364
    :goto_1d
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_1f

    :catchall_9
    move-exception p2

    goto :goto_1e

    :catch_9
    move-exception v0

    .line 362
    :try_start_13
    sget-object v1, Lcom/sonymobile/scan3d/storageservice/provider/DatabaseHelper;->TAG:Ljava/lang/String;

    const-string v2, "Failed to upgrade database."

    invoke-static {v1, v2, v0}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_9

    goto :goto_1d

    .line 364
    :goto_1e
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 365
    throw p2

    :cond_f
    :goto_1f
    const/16 v0, 0xd

    if-ne p2, v0, :cond_10

    .line 371
    :try_start_14
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    const-string v0, "ALTER TABLE file ADD COLUMN rigged_scan_url VARCHAR DEFAULT NULL"

    .line 372
    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "ALTER TABLE file ADD COLUMN riggable BOOLEAN DEFAULT 1"

    .line 374
    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    add-int/lit8 p2, p2, 0x1

    .line 378
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_14} :catch_a
    .catchall {:try_start_14 .. :try_end_14} :catchall_a

    goto :goto_20

    :catchall_a
    move-exception p2

    goto :goto_21

    :catch_a
    move-exception v0

    .line 380
    :try_start_15
    sget-object v1, Lcom/sonymobile/scan3d/storageservice/provider/DatabaseHelper;->TAG:Ljava/lang/String;

    const-string v2, "Failed to upgrade database."

    invoke-static {v1, v2, v0}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_a

    .line 382
    :goto_20
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_22

    :goto_21
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 383
    throw p2

    :cond_10
    :goto_22
    const/16 v0, 0xe

    if-ne p2, v0, :cond_11

    .line 389
    :try_start_16
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    const-string v0, "ALTER TABLE file ADD COLUMN rigged_preview_url VARCHAR DEFAULT NULL"

    .line 390
    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    add-int/lit8 p2, p2, 0x1

    .line 394
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_16} :catch_b
    .catchall {:try_start_16 .. :try_end_16} :catchall_b

    .line 398
    :goto_23
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_25

    :catchall_b
    move-exception p2

    goto :goto_24

    :catch_b
    move-exception v0

    .line 396
    :try_start_17
    sget-object v1, Lcom/sonymobile/scan3d/storageservice/provider/DatabaseHelper;->TAG:Ljava/lang/String;

    const-string v2, "Failed to upgrade database."

    invoke-static {v1, v2, v0}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_b

    goto :goto_23

    .line 398
    :goto_24
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 399
    throw p2

    :cond_11
    :goto_25
    const/16 v0, 0xf

    if-ne p2, v0, :cond_12

    .line 405
    :try_start_18
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    const-string v0, "ALTER TABLE file ADD COLUMN prop_mesh_url VARCHAR DEFAULT NULL"

    .line 406
    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "ALTER TABLE file ADD COLUMN shared_meshes INTEGER DEFAULT 0"

    .line 408
    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    add-int/lit8 p2, p2, 0x1

    .line 411
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_18} :catch_c
    .catchall {:try_start_18 .. :try_end_18} :catchall_c

    goto :goto_26

    :catchall_c
    move-exception p2

    goto :goto_27

    :catch_c
    move-exception v0

    .line 413
    :try_start_19
    sget-object v1, Lcom/sonymobile/scan3d/storageservice/provider/DatabaseHelper;->TAG:Ljava/lang/String;

    const-string v2, "Failed to upgrade database."

    invoke-static {v1, v2, v0}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_c

    .line 415
    :goto_26
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_28

    :goto_27
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 416
    throw p2

    :cond_12
    :goto_28
    const/16 v0, 0x10

    if-ne p2, v0, :cond_13

    .line 423
    :try_start_1a
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    const-string p2, "upload"

    const-string v0, "provider!=?"

    .line 424
    new-array p3, p3, [Ljava/lang/String;

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->WEBVIEWER:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->name()Ljava/lang/String;

    move-result-object v1

    aput-object v1, p3, v3

    invoke-virtual {p1, p2, v0, p3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 426
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_1a} :catch_d
    .catchall {:try_start_1a .. :try_end_1a} :catchall_d

    goto :goto_29

    :catchall_d
    move-exception p2

    goto :goto_2a

    :catch_d
    move-exception p2

    .line 428
    :try_start_1b
    sget-object p3, Lcom/sonymobile/scan3d/storageservice/provider/DatabaseHelper;->TAG:Ljava/lang/String;

    const-string v0, "Failed to upgrade database."

    invoke-static {p3, v0, p2}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1b
    .catchall {:try_start_1b .. :try_end_1b} :catchall_d

    .line 430
    :goto_29
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_2b

    :goto_2a
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 431
    throw p2

    :cond_13
    :goto_2b
    return-void
.end method
