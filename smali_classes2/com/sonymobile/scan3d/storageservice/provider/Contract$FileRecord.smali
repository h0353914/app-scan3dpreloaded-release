.class public final Lcom/sonymobile/scan3d/storageservice/provider/Contract$FileRecord;
.super Ljava/lang/Object;
.source "Contract.java"

# interfaces
.implements Landroid/provider/BaseColumns;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/provider/Contract;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "FileRecord"
.end annotation


# static fields
.field public static final COLUMN_CREATED:Ljava/lang/String; = "created"

.field public static final COLUMN_DOWNLOADABLE:Ljava/lang/String; = "downloadable"

.field public static final COLUMN_ETAG:Ljava/lang/String; = "eTag"

.field public static final COLUMN_IDENTIFIER:Ljava/lang/String; = "identifier"

.field public static final COLUMN_IMPROVEMENT:Ljava/lang/String; = "is_improvement"

.field public static final COLUMN_IS_RIGGABLE:Ljava/lang/String; = "riggable"

.field public static final COLUMN_LOG_TRANSFER_ID:Ljava/lang/String; = "log_transfer_id"

.field public static final COLUMN_LOG_URL:Ljava/lang/String; = "log_url"

.field public static final COLUMN_NAME:Ljava/lang/String; = "name"

.field public static final COLUMN_PROP_MESH_URL:Ljava/lang/String; = "prop_mesh_url"

.field public static final COLUMN_RIGGED_PREVIEW_URL:Ljava/lang/String; = "rigged_preview_url"

.field public static final COLUMN_RIGGED_SCAN_URL:Ljava/lang/String; = "rigged_scan_url"

.field public static final COLUMN_SCAN_TYPE:Ljava/lang/String; = "scan_type"

.field public static final COLUMN_SHARED_MESHES:Ljava/lang/String; = "shared_meshes"

.field public static final COLUMN_SHARE_HASH:Ljava/lang/String; = "share_hash"

.field public static final COLUMN_SYNC_STATE:Ljava/lang/String; = "sync_state"

.field public static final COLUMN_THUMBNAIL_URL:Ljava/lang/String; = "thumb_url"

.field public static final COLUMN_TRANSFER_FLAGS:Ljava/lang/String; = "transfer_flags"

.field public static final COLUMN_URL:Ljava/lang/String; = "url"

.field public static final COLUMN_VISIBLE:Ljava/lang/String; = "visible"

.field public static final CONTENT_URI:Landroid/net/Uri;

.field public static final DELETED_FILE:I = 0x7

.field public static final DIR:Ljava/lang/String; = "model/file"

.field public static final DOWNLOADING_FILE:I = 0x4

.field public static final EXAMPLE_SCAN:I = 0x8

.field public static final FLAG_LOG_UPLOADED:I = 0x8

.field public static final FLAG_METADATA_UPLOADED:I = 0x20

.field public static final FLAG_PREVIEW_DOWNLOADED:I = 0x2

.field public static final FLAG_PREVIEW_UPLOADED:I = 0x10

.field public static final FLAG_SCAN_DOWNLOADED:I = 0x1

.field public static final FLAG_SCAN_UPLOADED:I = 0x4

.field public static final LOCAL_FILE:I = 0x0

.field public static final METADATA_CHANGED:I = 0x6

.field public static final MIME_DIR:Ljava/lang/String; = "vnd.android.cursor.dir/file"

.field public static final MIME_ITEM:Ljava/lang/String; = "vnd.android.cursor.item/file"

.field public static final NEW_IMPROVEMENT:I = 0xa

.field public static final NEW_SCAN:I = 0x9

.field public static final SERVER_FILE:I = 0x1

.field public static final SYNCED_FILE:I = 0x2

.field public static final TABLE_NAME:Ljava/lang/String; = "file"

.field public static final UPLOADING_FILE:I = 0x3


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 63
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/provider/Contract;->BASE_URI:Landroid/net/Uri;

    const-string v1, "model/file"

    invoke-static {v0, v1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/provider/Contract$FileRecord;->CONTENT_URI:Landroid/net/Uri;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
