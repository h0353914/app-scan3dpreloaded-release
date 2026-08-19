.class public Lcom/sonymobile/scan3d/storageservice/network/model/S3UploadData;
.super Ljava/lang/Object;
.source "S3UploadData.java"


# instance fields
.field private mEntity:Lorg/apache/http/HttpEntity;

.field private mFile:Ljava/io/File;

.field private mIsEncrypted:Z

.field private mShareHash:Ljava/lang/String;

.field private mUrl:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lorg/apache/http/HttpEntity;Ljava/io/File;ZLjava/lang/String;)V
    .locals 0

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/network/model/S3UploadData;->mUrl:Ljava/lang/String;

    .line 54
    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/network/model/S3UploadData;->mEntity:Lorg/apache/http/HttpEntity;

    .line 55
    iput-object p3, p0, Lcom/sonymobile/scan3d/storageservice/network/model/S3UploadData;->mFile:Ljava/io/File;

    .line 56
    iput-boolean p4, p0, Lcom/sonymobile/scan3d/storageservice/network/model/S3UploadData;->mIsEncrypted:Z

    .line 57
    iput-object p5, p0, Lcom/sonymobile/scan3d/storageservice/network/model/S3UploadData;->mShareHash:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getBody()Lorg/apache/http/HttpEntity;
    .locals 1

    .line 84
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/model/S3UploadData;->mEntity:Lorg/apache/http/HttpEntity;

    return-object v0
.end method

.method public getFile()Ljava/io/File;
    .locals 1

    .line 75
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/model/S3UploadData;->mFile:Ljava/io/File;

    return-object v0
.end method

.method public getShareHash()Ljava/lang/String;
    .locals 1

    .line 102
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/model/S3UploadData;->mShareHash:Ljava/lang/String;

    return-object v0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 1

    .line 93
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/model/S3UploadData;->mUrl:Ljava/lang/String;

    return-object v0
.end method

.method public isEncrypted()Z
    .locals 1

    .line 66
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/network/model/S3UploadData;->mIsEncrypted:Z

    return v0
.end method
