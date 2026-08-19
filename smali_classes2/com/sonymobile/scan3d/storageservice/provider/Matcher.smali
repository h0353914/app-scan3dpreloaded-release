.class public Lcom/sonymobile/scan3d/storageservice/provider/Matcher;
.super Landroid/content/UriMatcher;
.source "Matcher.java"


# static fields
.field public static final FILE_RECORDS:I = 0x1

.field public static final FILE_RECORD_ID:I = 0x0

.field public static final IMPROVEMENT_RECORDS:I = 0x8

.field public static final IMPROVEMENT_RECORD_ID:I = 0x7

.field public static final UPLOAD_FILE_RECORDS:I = 0x5

.field public static final UPLOAD_FILE_RECORD_ID:I = 0x4

.field public static final UPLOAD_FILE_RECORD_PROVIDER_ID:I = 0x6

.field public static final UPLOAD_RECORDS:I = 0x3

.field public static final UPLOAD_RECORD_ID:I = 0x2


# direct methods
.method public constructor <init>()V
    .locals 3

    const/4 v0, -0x1

    .line 68
    invoke-direct {p0, v0}, Landroid/content/UriMatcher;-><init>(I)V

    const-string v0, "com.sonymobile.scan3d.storageprovider"

    const-string v1, "model/file/#"

    const/4 v2, 0x0

    .line 69
    invoke-virtual {p0, v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/provider/Matcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    const-string v0, "com.sonymobile.scan3d.storageprovider"

    const-string v1, "model/file"

    const/4 v2, 0x1

    .line 70
    invoke-virtual {p0, v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/provider/Matcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    const-string v0, "com.sonymobile.scan3d.storageprovider"

    const-string v1, "upload/#"

    const/4 v2, 0x2

    .line 71
    invoke-virtual {p0, v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/provider/Matcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    const-string v0, "com.sonymobile.scan3d.storageprovider"

    const-string v1, "upload"

    const/4 v2, 0x3

    .line 72
    invoke-virtual {p0, v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/provider/Matcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    const-string v0, "com.sonymobile.scan3d.storageprovider"

    const-string v1, "model/file/#/upload/#"

    const/4 v2, 0x4

    .line 73
    invoke-virtual {p0, v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/provider/Matcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    const-string v0, "com.sonymobile.scan3d.storageprovider"

    const-string v1, "model/file/#/upload"

    const/4 v2, 0x5

    .line 74
    invoke-virtual {p0, v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/provider/Matcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    const-string v0, "com.sonymobile.scan3d.storageprovider"

    const-string v1, "model/file/#/upload/*"

    const/4 v2, 0x6

    .line 75
    invoke-virtual {p0, v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/provider/Matcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    const-string v0, "com.sonymobile.scan3d.storageprovider"

    const-string v1, "improvement/#"

    const/4 v2, 0x7

    .line 77
    invoke-virtual {p0, v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/provider/Matcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    const-string v0, "com.sonymobile.scan3d.storageprovider"

    const-string v1, "improvement"

    const/16 v2, 0x8

    .line 78
    invoke-virtual {p0, v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/provider/Matcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method
