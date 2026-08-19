.class public final Lcom/sonymobile/scan3d/storageservice/provider/Contract$UploadRecord;
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
    name = "UploadRecord"
.end annotation


# static fields
.field public static final COLUMN_PARENT_ID:Ljava/lang/String; = "parent_id"

.field public static final COLUMN_PROVIDER:Ljava/lang/String; = "provider"

.field public static final COLUMN_STATE:Ljava/lang/String; = "state"

.field public static final COLUMN_UID:Ljava/lang/String; = "uid"

.field public static final CONTENT_URI:Landroid/net/Uri;

.field public static final DIR:Ljava/lang/String; = "upload"

.field public static final MIME_DIR:Ljava/lang/String; = "vnd.android.cursor.dir/scan_upload"

.field public static final MIME_ITEM:Ljava/lang/String; = "vnd.android.cursor.item/scan_upload"

.field public static final STATE_FAILED:I = 0x3

.field public static final STATE_NOT_STARTED:I = -0x1

.field public static final STATE_PENDING:I = 0x0

.field public static final STATE_RUNNING:I = 0x1

.field public static final STATE_SUCCESS:I = 0x2

.field public static final TABLE_NAME:Ljava/lang/String; = "upload"


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 295
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/provider/Contract;->BASE_URI:Landroid/net/Uri;

    const-string v1, "upload"

    invoke-static {v0, v1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/provider/Contract$UploadRecord;->CONTENT_URI:Landroid/net/Uri;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 280
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
