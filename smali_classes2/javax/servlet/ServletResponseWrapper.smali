.class public Ljavax/servlet/ServletResponseWrapper;
.super Ljava/lang/Object;
.source "ServletResponseWrapper.java"

# interfaces
.implements Ljavax/servlet/ServletResponse;


# instance fields
.field private response:Ljavax/servlet/ServletResponse;


# direct methods
.method public constructor <init>(Ljavax/servlet/ServletResponse;)V
    .locals 1

    .line 92
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    .line 96
    iput-object p1, p0, Ljavax/servlet/ServletResponseWrapper;->response:Ljavax/servlet/ServletResponse;

    return-void

    .line 94
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Response cannot be null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public flushBuffer()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 189
    iget-object v0, p0, Ljavax/servlet/ServletResponseWrapper;->response:Ljavax/servlet/ServletResponse;

    invoke-interface {v0}, Ljavax/servlet/ServletResponse;->flushBuffer()V

    return-void
.end method

.method public getBufferSize()I
    .locals 1

    .line 180
    iget-object v0, p0, Ljavax/servlet/ServletResponseWrapper;->response:Ljavax/servlet/ServletResponse;

    invoke-interface {v0}, Ljavax/servlet/ServletResponse;->getBufferSize()I

    move-result v0

    return v0
.end method

.method public getCharacterEncoding()Ljava/lang/String;
    .locals 1

    .line 127
    iget-object v0, p0, Ljavax/servlet/ServletResponseWrapper;->response:Ljavax/servlet/ServletResponse;

    invoke-interface {v0}, Ljavax/servlet/ServletResponse;->getCharacterEncoding()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLocale()Ljava/util/Locale;
    .locals 1

    .line 232
    iget-object v0, p0, Ljavax/servlet/ServletResponseWrapper;->response:Ljavax/servlet/ServletResponse;

    invoke-interface {v0}, Ljavax/servlet/ServletResponse;->getLocale()Ljava/util/Locale;

    move-result-object v0

    return-object v0
.end method

.method public getOutputStream()Ljavax/servlet/ServletOutputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 136
    iget-object v0, p0, Ljavax/servlet/ServletResponseWrapper;->response:Ljavax/servlet/ServletResponse;

    invoke-interface {v0}, Ljavax/servlet/ServletResponse;->getOutputStream()Ljavax/servlet/ServletOutputStream;

    move-result-object v0

    return-object v0
.end method

.method public getResponse()Ljavax/servlet/ServletResponse;
    .locals 1

    .line 104
    iget-object v0, p0, Ljavax/servlet/ServletResponseWrapper;->response:Ljavax/servlet/ServletResponse;

    return-object v0
.end method

.method public getWriter()Ljava/io/PrintWriter;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 146
    iget-object v0, p0, Ljavax/servlet/ServletResponseWrapper;->response:Ljavax/servlet/ServletResponse;

    invoke-interface {v0}, Ljavax/servlet/ServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v0

    return-object v0
.end method

.method public isCommitted()Z
    .locals 1

    .line 197
    iget-object v0, p0, Ljavax/servlet/ServletResponseWrapper;->response:Ljavax/servlet/ServletResponse;

    invoke-interface {v0}, Ljavax/servlet/ServletResponse;->isCommitted()Z

    move-result v0

    return v0
.end method

.method public reset()V
    .locals 1

    .line 206
    iget-object v0, p0, Ljavax/servlet/ServletResponseWrapper;->response:Ljavax/servlet/ServletResponse;

    invoke-interface {v0}, Ljavax/servlet/ServletResponse;->reset()V

    return-void
.end method

.method public resetBuffer()V
    .locals 1

    .line 215
    iget-object v0, p0, Ljavax/servlet/ServletResponseWrapper;->response:Ljavax/servlet/ServletResponse;

    invoke-interface {v0}, Ljavax/servlet/ServletResponse;->resetBuffer()V

    return-void
.end method

.method public setBufferSize(I)V
    .locals 1

    .line 172
    iget-object v0, p0, Ljavax/servlet/ServletResponseWrapper;->response:Ljavax/servlet/ServletResponse;

    invoke-interface {v0, p1}, Ljavax/servlet/ServletResponse;->setBufferSize(I)V

    return-void
.end method

.method public setContentLength(I)V
    .locals 1

    .line 155
    iget-object v0, p0, Ljavax/servlet/ServletResponseWrapper;->response:Ljavax/servlet/ServletResponse;

    invoke-interface {v0, p1}, Ljavax/servlet/ServletResponse;->setContentLength(I)V

    return-void
.end method

.method public setContentType(Ljava/lang/String;)V
    .locals 1

    .line 164
    iget-object v0, p0, Ljavax/servlet/ServletResponseWrapper;->response:Ljavax/servlet/ServletResponse;

    invoke-interface {v0, p1}, Ljavax/servlet/ServletResponse;->setContentType(Ljava/lang/String;)V

    return-void
.end method

.method public setLocale(Ljava/util/Locale;)V
    .locals 1

    .line 224
    iget-object v0, p0, Ljavax/servlet/ServletResponseWrapper;->response:Ljavax/servlet/ServletResponse;

    invoke-interface {v0, p1}, Ljavax/servlet/ServletResponse;->setLocale(Ljava/util/Locale;)V

    return-void
.end method

.method public setResponse(Ljavax/servlet/ServletResponse;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 117
    iput-object p1, p0, Ljavax/servlet/ServletResponseWrapper;->response:Ljavax/servlet/ServletResponse;

    return-void

    .line 115
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Response cannot be null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
