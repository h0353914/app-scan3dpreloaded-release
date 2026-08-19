.class public final Lcom/sonymobile/scan3d/storageservice/provider/Contract$ImprovementRecord;
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
    name = "ImprovementRecord"
.end annotation


# static fields
.field public static final COLUMN_CREATED:Ljava/lang/String; = "created"

.field public static final COLUMN_FAIL_STATE:Ljava/lang/String; = "fail_state"

.field public static final COLUMN_FILE_SET_ID:Ljava/lang/String; = "file_set_id"

.field public static final COLUMN_IMPROVEMENT_TYPE:Ljava/lang/String; = "improvement_type"

.field public static final COLUMN_NAME:Ljava/lang/String; = "name"

.field public static final COLUMN_PARENT_ID:Ljava/lang/String; = "parent_id"

.field public static final COLUMN_S3_KEY:Ljava/lang/String; = "s3_key"

.field public static final COLUMN_SCAN_TYPE:Ljava/lang/String; = "scan_type"

.field public static final COLUMN_SQS_MESSAGE_ID:Ljava/lang/String; = "sqs_message_id"

.field public static final CONTENT_URI:Landroid/net/Uri;

.field public static final DIR:Ljava/lang/String; = "improvement"

.field public static final GENERAL_FAILURE:I = 0x1

.field public static final MIME_DIR:Ljava/lang/String; = "vnd.android.cursor.dir/scan_improvement"

.field public static final MIME_ITEM:Ljava/lang/String; = "vnd.android.cursor.item/scan_improvement"

.field public static final NO_FAILURE:I = -0x1

.field public static final PERMANENT_FAILURE:I = 0x2

.field public static final TABLE_NAME:Ljava/lang/String; = "improvement"


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 377
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/provider/Contract;->BASE_URI:Landroid/net/Uri;

    const-string v1, "improvement"

    invoke-static {v0, v1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/provider/Contract$ImprovementRecord;->CONTENT_URI:Landroid/net/Uri;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 362
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
