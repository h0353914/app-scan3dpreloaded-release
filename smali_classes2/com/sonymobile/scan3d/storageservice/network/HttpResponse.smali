.class Lcom/sonymobile/scan3d/storageservice/network/HttpResponse;
.super Ljava/lang/Object;
.source "HttpResponse.java"

# interfaces
.implements Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;


# instance fields
.field private mConnection:Ljava/net/HttpURLConnection;

.field private final mContentType:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

.field private mHeaders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private final mStatus:I


# direct methods
.method public constructor <init>(Ljava/net/HttpURLConnection;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/network/HttpResponse;->mConnection:Ljava/net/HttpURLConnection;

    .line 46
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/network/HttpResponse;->mConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result p1

    iput p1, p0, Lcom/sonymobile/scan3d/storageservice/network/HttpResponse;->mStatus:I

    .line 47
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/network/HttpResponse;->mConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getContentType()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->getContentType(Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/network/HttpResponse;->mContentType:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    .line 48
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/network/HttpResponse;->mConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getHeaderFields()Ljava/util/Map;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/network/HttpResponse;->mHeaders:Ljava/util/Map;

    return-void
.end method

.method private getInputStreamResponse()Ljava/io/InputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 110
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/network/HttpResponse;->mStatus:I

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/network/HttpResponse;->isSuccessfulStatus(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 111
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/HttpResponse;->mConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    goto :goto_0

    .line 112
    :cond_0
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/network/HttpResponse;->mStatus:I

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/network/HttpResponse;->isFailedStatus(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 113
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/HttpResponse;->mConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method private static isFailedStatus(I)Z
    .locals 1

    const/16 v0, 0x190

    if-lt p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private static isSuccessfulStatus(I)Z
    .locals 1

    const/16 v0, 0xc8

    if-lt p0, v0, :cond_0

    const/16 v0, 0x12c

    if-ge p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method


# virtual methods
.method public close()V
    .locals 1

    .line 78
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/HttpResponse;->mConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    return-void
.end method

.method public getContentType()Lcom/sonymobile/scan3d/storageservice/network/ContentType;
    .locals 1

    .line 58
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/HttpResponse;->mContentType:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    return-object v0
.end method

.method public getHeaders()Ljava/util/Map;
    .locals 1
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

    .line 68
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/HttpResponse;->mHeaders:Ljava/util/Map;

    return-object v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 53
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/network/HttpResponse;->getInputStreamResponse()Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public getStatusCode()I
    .locals 1

    .line 63
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/network/HttpResponse;->mStatus:I

    return v0
.end method

.method public isResponseReceived()Z
    .locals 1

    .line 73
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/network/HttpResponse;->mStatus:I

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
