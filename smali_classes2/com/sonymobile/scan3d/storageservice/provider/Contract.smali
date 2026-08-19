.class public final Lcom/sonymobile/scan3d/storageservice/provider/Contract;
.super Ljava/lang/Object;
.source "Contract.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/storageservice/provider/Contract$ImprovementRecord;,
        Lcom/sonymobile/scan3d/storageservice/provider/Contract$UploadRecord;,
        Lcom/sonymobile/scan3d/storageservice/provider/Contract$FileRecord;
    }
.end annotation


# static fields
.field public static final AUTHORITY:Ljava/lang/String; = "com.sonymobile.scan3d.storageprovider"

.field public static final BASE_URI:Landroid/net/Uri;

.field public static final INVALID_DATABASE_ID:J = -0x1L


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 32
    new-instance v0, Landroid/net/Uri$Builder;

    invoke-direct {v0}, Landroid/net/Uri$Builder;-><init>()V

    const-string v1, "content"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "com.sonymobile.scan3d.storageprovider"

    .line 33
    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/provider/Contract;->BASE_URI:Landroid/net/Uri;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
