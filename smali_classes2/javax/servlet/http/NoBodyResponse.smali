.class Ljavax/servlet/http/NoBodyResponse;
.super Ljava/lang/Object;
.source "HttpServlet.java"

# interfaces
.implements Ljavax/servlet/http/HttpServletResponse;


# instance fields
.field private didSetContentLength:Z

.field private noBody:Ljavax/servlet/http/NoBodyOutputStream;

.field private resp:Ljavax/servlet/http/HttpServletResponse;

.field private writer:Ljava/io/PrintWriter;


# direct methods
.method constructor <init>(Ljavax/servlet/http/HttpServletResponse;)V
    .locals 0

    .line 874
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 875
    iput-object p1, p0, Ljavax/servlet/http/NoBodyResponse;->resp:Ljavax/servlet/http/HttpServletResponse;

    .line 876
    new-instance p1, Ljavax/servlet/http/NoBodyOutputStream;

    invoke-direct {p1}, Ljavax/servlet/http/NoBodyOutputStream;-><init>()V

    iput-object p1, p0, Ljavax/servlet/http/NoBodyResponse;->noBody:Ljavax/servlet/http/NoBodyOutputStream;

    return-void
.end method


# virtual methods
.method public addCookie(Ljavax/servlet/http/Cookie;)V
    .locals 1

    .line 941
    iget-object v0, p0, Ljavax/servlet/http/NoBodyResponse;->resp:Ljavax/servlet/http/HttpServletResponse;

    invoke-interface {v0, p1}, Ljavax/servlet/http/HttpServletResponse;->addCookie(Ljavax/servlet/http/Cookie;)V

    return-void
.end method

.method public addDateHeader(Ljava/lang/String;J)V
    .locals 1

    .line 981
    iget-object v0, p0, Ljavax/servlet/http/NoBodyResponse;->resp:Ljavax/servlet/http/HttpServletResponse;

    invoke-interface {v0, p1, p2, p3}, Ljavax/servlet/http/HttpServletResponse;->addDateHeader(Ljava/lang/String;J)V

    return-void
.end method

.method public addHeader(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 978
    iget-object v0, p0, Ljavax/servlet/http/NoBodyResponse;->resp:Ljavax/servlet/http/HttpServletResponse;

    invoke-interface {v0, p1, p2}, Ljavax/servlet/http/HttpServletResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public addIntHeader(Ljava/lang/String;I)V
    .locals 1

    .line 984
    iget-object v0, p0, Ljavax/servlet/http/NoBodyResponse;->resp:Ljavax/servlet/http/HttpServletResponse;

    invoke-interface {v0, p1, p2}, Ljavax/servlet/http/HttpServletResponse;->addIntHeader(Ljava/lang/String;I)V

    return-void
.end method

.method public containsHeader(Ljava/lang/String;)Z
    .locals 1

    .line 944
    iget-object v0, p0, Ljavax/servlet/http/NoBodyResponse;->resp:Ljavax/servlet/http/HttpServletResponse;

    invoke-interface {v0, p1}, Ljavax/servlet/http/HttpServletResponse;->containsHeader(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public encodeRedirectURL(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 975
    iget-object v0, p0, Ljavax/servlet/http/NoBodyResponse;->resp:Ljavax/servlet/http/HttpServletResponse;

    invoke-interface {v0, p1}, Ljavax/servlet/http/HttpServletResponse;->encodeRedirectURL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public encodeRedirectUrl(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1014
    invoke-virtual {p0, p1}, Ljavax/servlet/http/NoBodyResponse;->encodeRedirectURL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public encodeURL(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 972
    iget-object v0, p0, Ljavax/servlet/http/NoBodyResponse;->resp:Ljavax/servlet/http/HttpServletResponse;

    invoke-interface {v0, p1}, Ljavax/servlet/http/HttpServletResponse;->encodeURL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public encodeUrl(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 997
    invoke-virtual {p0, p1}, Ljavax/servlet/http/NoBodyResponse;->encodeURL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public flushBuffer()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 929
    iget-object v0, p0, Ljavax/servlet/http/NoBodyResponse;->resp:Ljavax/servlet/http/HttpServletResponse;

    invoke-interface {v0}, Ljavax/servlet/ServletResponse;->flushBuffer()V

    return-void
.end method

.method public getBufferSize()I
    .locals 1

    .line 917
    iget-object v0, p0, Ljavax/servlet/http/NoBodyResponse;->resp:Ljavax/servlet/http/HttpServletResponse;

    invoke-interface {v0}, Ljavax/servlet/ServletResponse;->getBufferSize()I

    move-result v0

    return v0
.end method

.method public getCharacterEncoding()Ljava/lang/String;
    .locals 1

    .line 900
    iget-object v0, p0, Ljavax/servlet/http/NoBodyResponse;->resp:Ljavax/servlet/http/HttpServletResponse;

    invoke-interface {v0}, Ljavax/servlet/ServletResponse;->getCharacterEncoding()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLocale()Ljava/util/Locale;
    .locals 1

    .line 935
    iget-object v0, p0, Ljavax/servlet/http/NoBodyResponse;->resp:Ljavax/servlet/http/HttpServletResponse;

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

    .line 897
    iget-object v0, p0, Ljavax/servlet/http/NoBodyResponse;->noBody:Ljavax/servlet/http/NoBodyOutputStream;

    return-object v0
.end method

.method public getWriter()Ljava/io/PrintWriter;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .line 904
    iget-object v0, p0, Ljavax/servlet/http/NoBodyResponse;->writer:Ljava/io/PrintWriter;

    if-nez v0, :cond_0

    .line 907
    new-instance v0, Ljava/io/OutputStreamWriter;

    iget-object v1, p0, Ljavax/servlet/http/NoBodyResponse;->noBody:Ljavax/servlet/http/NoBodyOutputStream;

    invoke-virtual {p0}, Ljavax/servlet/http/NoBodyResponse;->getCharacterEncoding()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 908
    new-instance v1, Ljava/io/PrintWriter;

    invoke-direct {v1, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    iput-object v1, p0, Ljavax/servlet/http/NoBodyResponse;->writer:Ljava/io/PrintWriter;

    .line 910
    :cond_0
    iget-object v0, p0, Ljavax/servlet/http/NoBodyResponse;->writer:Ljava/io/PrintWriter;

    return-object v0
.end method

.method public isCommitted()Z
    .locals 1

    .line 926
    iget-object v0, p0, Ljavax/servlet/http/NoBodyResponse;->resp:Ljavax/servlet/http/HttpServletResponse;

    invoke-interface {v0}, Ljavax/servlet/ServletResponse;->isCommitted()Z

    move-result v0

    return v0
.end method

.method public reset()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 920
    iget-object v0, p0, Ljavax/servlet/http/NoBodyResponse;->resp:Ljavax/servlet/http/HttpServletResponse;

    invoke-interface {v0}, Ljavax/servlet/ServletResponse;->reset()V

    return-void
.end method

.method public resetBuffer()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 923
    iget-object v0, p0, Ljavax/servlet/http/NoBodyResponse;->resp:Ljavax/servlet/http/HttpServletResponse;

    invoke-interface {v0}, Ljavax/servlet/ServletResponse;->resetBuffer()V

    return-void
.end method

.method public sendError(I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 966
    iget-object v0, p0, Ljavax/servlet/http/NoBodyResponse;->resp:Ljavax/servlet/http/HttpServletResponse;

    invoke-interface {v0, p1}, Ljavax/servlet/http/HttpServletResponse;->sendError(I)V

    return-void
.end method

.method public sendError(ILjava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 963
    iget-object v0, p0, Ljavax/servlet/http/NoBodyResponse;->resp:Ljavax/servlet/http/HttpServletResponse;

    invoke-interface {v0, p1, p2}, Ljavax/servlet/http/HttpServletResponse;->sendError(ILjava/lang/String;)V

    return-void
.end method

.method public sendRedirect(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 969
    iget-object v0, p0, Ljavax/servlet/http/NoBodyResponse;->resp:Ljavax/servlet/http/HttpServletResponse;

    invoke-interface {v0, p1}, Ljavax/servlet/http/HttpServletResponse;->sendRedirect(Ljava/lang/String;)V

    return-void
.end method

.method public setBufferSize(I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 914
    iget-object v0, p0, Ljavax/servlet/http/NoBodyResponse;->resp:Ljavax/servlet/http/HttpServletResponse;

    invoke-interface {v0, p1}, Ljavax/servlet/ServletResponse;->setBufferSize(I)V

    return-void
.end method

.method setContentLength()V
    .locals 2

    .line 881
    iget-boolean v0, p0, Ljavax/servlet/http/NoBodyResponse;->didSetContentLength:Z

    if-nez v0, :cond_0

    .line 882
    iget-object v0, p0, Ljavax/servlet/http/NoBodyResponse;->resp:Ljavax/servlet/http/HttpServletResponse;

    iget-object v1, p0, Ljavax/servlet/http/NoBodyResponse;->noBody:Ljavax/servlet/http/NoBodyOutputStream;

    invoke-virtual {v1}, Ljavax/servlet/http/NoBodyOutputStream;->getContentLength()I

    move-result v1

    invoke-interface {v0, v1}, Ljavax/servlet/ServletResponse;->setContentLength(I)V

    :cond_0
    return-void
.end method

.method public setContentLength(I)V
    .locals 1

    .line 889
    iget-object v0, p0, Ljavax/servlet/http/NoBodyResponse;->resp:Ljavax/servlet/http/HttpServletResponse;

    invoke-interface {v0, p1}, Ljavax/servlet/ServletResponse;->setContentLength(I)V

    const/4 p1, 0x1

    .line 890
    iput-boolean p1, p0, Ljavax/servlet/http/NoBodyResponse;->didSetContentLength:Z

    return-void
.end method

.method public setContentType(Ljava/lang/String;)V
    .locals 1

    .line 894
    iget-object v0, p0, Ljavax/servlet/http/NoBodyResponse;->resp:Ljavax/servlet/http/HttpServletResponse;

    invoke-interface {v0, p1}, Ljavax/servlet/ServletResponse;->setContentType(Ljava/lang/String;)V

    return-void
.end method

.method public setDateHeader(Ljava/lang/String;J)V
    .locals 1

    .line 960
    iget-object v0, p0, Ljavax/servlet/http/NoBodyResponse;->resp:Ljavax/servlet/http/HttpServletResponse;

    invoke-interface {v0, p1, p2, p3}, Ljavax/servlet/http/HttpServletResponse;->setDateHeader(Ljava/lang/String;J)V

    return-void
.end method

.method public setHeader(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 954
    iget-object v0, p0, Ljavax/servlet/http/NoBodyResponse;->resp:Ljavax/servlet/http/HttpServletResponse;

    invoke-interface {v0, p1, p2}, Ljavax/servlet/http/HttpServletResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setIntHeader(Ljava/lang/String;I)V
    .locals 1

    .line 957
    iget-object v0, p0, Ljavax/servlet/http/NoBodyResponse;->resp:Ljavax/servlet/http/HttpServletResponse;

    invoke-interface {v0, p1, p2}, Ljavax/servlet/http/HttpServletResponse;->setIntHeader(Ljava/lang/String;I)V

    return-void
.end method

.method public setLocale(Ljava/util/Locale;)V
    .locals 1

    .line 932
    iget-object v0, p0, Ljavax/servlet/http/NoBodyResponse;->resp:Ljavax/servlet/http/HttpServletResponse;

    invoke-interface {v0, p1}, Ljavax/servlet/ServletResponse;->setLocale(Ljava/util/Locale;)V

    return-void
.end method

.method public setStatus(I)V
    .locals 1

    .line 951
    iget-object v0, p0, Ljavax/servlet/http/NoBodyResponse;->resp:Ljavax/servlet/http/HttpServletResponse;

    invoke-interface {v0, p1}, Ljavax/servlet/http/HttpServletResponse;->setStatus(I)V

    return-void
.end method

.method public setStatus(ILjava/lang/String;)V
    .locals 1

    .line 948
    iget-object v0, p0, Ljavax/servlet/http/NoBodyResponse;->resp:Ljavax/servlet/http/HttpServletResponse;

    invoke-interface {v0, p1, p2}, Ljavax/servlet/http/HttpServletResponse;->setStatus(ILjava/lang/String;)V

    return-void
.end method
