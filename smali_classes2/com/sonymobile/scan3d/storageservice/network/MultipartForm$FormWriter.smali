.class abstract Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$FormWriter;
.super Ljava/lang/Object;
.source "MultipartForm.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/network/MultipartForm;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "FormWriter"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method abstract onWrite(Landroid/content/Context;Ljava/io/DataOutputStream;Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;JJ)J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method abstract size(Landroid/content/Context;)J
.end method
