.class public interface abstract Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;
.super Ljava/lang/Object;
.source "IHttpResponse.java"

# interfaces
.implements Ljava/io/Closeable;


# virtual methods
.method public abstract getContentType()Lcom/sonymobile/scan3d/storageservice/network/ContentType;
.end method

.method public abstract getHeaders()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end method

.method public abstract getInputStream()Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getStatusCode()I
.end method

.method public abstract isResponseReceived()Z
.end method
