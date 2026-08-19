.class abstract Lcom/sonymobile/scan3d/storageservice/network/HttpConstants;
.super Ljava/lang/Object;
.source "HttpConstants.java"


# static fields
.field public static final ACCEPT:Ljava/lang/String; = "Accept"

.field public static final AUTHORIZATION_HEADER:Ljava/lang/String; = "Authorization"

.field public static final BEARER:Ljava/lang/String; = "Bearer "

.field public static final CACHE_CONTROL_HEADER:Ljava/lang/String; = "Cache-Control"

.field public static final COMMA:Ljava/lang/String; = ","

.field public static final CONTENT_ENCODING_HEADER:Ljava/lang/String; = "Content-Encoding"

.field public static final CONTENT_LENGTH:Ljava/lang/String; = "Content-Length"

.field public static final CONTENT_TYPE_HEADER:Ljava/lang/String; = "Content-Type"

.field public static final ENCODING_GZIP:Ljava/lang/String; = "gzip"

.field public static final NO_CACHE:Ljava/lang/String; = "no-cache"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getMultipartContentType(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 69
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "multipart/form-data; boundary="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
