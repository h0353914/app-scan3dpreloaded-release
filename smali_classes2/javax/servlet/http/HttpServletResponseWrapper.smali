.class public Ljavax/servlet/http/HttpServletResponseWrapper;
.super Ljavax/servlet/ServletResponseWrapper;
.source "HttpServletResponseWrapper.java"

# interfaces
.implements Ljavax/servlet/http/HttpServletResponse;


# direct methods
.method public constructor <init>(Ljavax/servlet/http/HttpServletResponse;)V
    .locals 0

    .line 90
    invoke-direct {p0, p1}, Ljavax/servlet/ServletResponseWrapper;-><init>(Ljavax/servlet/ServletResponse;)V

    return-void
.end method

.method private _getHttpServletResponse()Ljavax/servlet/http/HttpServletResponse;
    .locals 1

    .line 94
    invoke-super {p0}, Ljavax/servlet/ServletResponseWrapper;->getResponse()Ljavax/servlet/ServletResponse;

    move-result-object v0

    check-cast v0, Ljavax/servlet/http/HttpServletResponse;

    return-object v0
.end method


# virtual methods
.method public addCookie(Ljavax/servlet/http/Cookie;)V
    .locals 1

    .line 102
    invoke-direct {p0}, Ljavax/servlet/http/HttpServletResponseWrapper;->_getHttpServletResponse()Ljavax/servlet/http/HttpServletResponse;

    move-result-object v0

    invoke-interface {v0, p1}, Ljavax/servlet/http/HttpServletResponse;->addCookie(Ljavax/servlet/http/Cookie;)V

    return-void
.end method

.method public addDateHeader(Ljava/lang/String;J)V
    .locals 1

    .line 186
    invoke-direct {p0}, Ljavax/servlet/http/HttpServletResponseWrapper;->_getHttpServletResponse()Ljavax/servlet/http/HttpServletResponse;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3}, Ljavax/servlet/http/HttpServletResponse;->addDateHeader(Ljava/lang/String;J)V

    return-void
.end method

.method public addHeader(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 202
    invoke-direct {p0}, Ljavax/servlet/http/HttpServletResponseWrapper;->_getHttpServletResponse()Ljavax/servlet/http/HttpServletResponse;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Ljavax/servlet/http/HttpServletResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public addIntHeader(Ljava/lang/String;I)V
    .locals 1

    .line 218
    invoke-direct {p0}, Ljavax/servlet/http/HttpServletResponseWrapper;->_getHttpServletResponse()Ljavax/servlet/http/HttpServletResponse;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Ljavax/servlet/http/HttpServletResponse;->addIntHeader(Ljava/lang/String;I)V

    return-void
.end method

.method public containsHeader(Ljava/lang/String;)Z
    .locals 1

    .line 112
    invoke-direct {p0}, Ljavax/servlet/http/HttpServletResponseWrapper;->_getHttpServletResponse()Ljavax/servlet/http/HttpServletResponse;

    move-result-object v0

    invoke-interface {v0, p1}, Ljavax/servlet/http/HttpServletResponse;->containsHeader(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public encodeRedirectURL(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 128
    invoke-direct {p0}, Ljavax/servlet/http/HttpServletResponseWrapper;->_getHttpServletResponse()Ljavax/servlet/http/HttpServletResponse;

    move-result-object v0

    invoke-interface {v0, p1}, Ljavax/servlet/http/HttpServletResponse;->encodeRedirectURL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public encodeRedirectUrl(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 144
    invoke-direct {p0}, Ljavax/servlet/http/HttpServletResponseWrapper;->_getHttpServletResponse()Ljavax/servlet/http/HttpServletResponse;

    move-result-object v0

    invoke-interface {v0, p1}, Ljavax/servlet/http/HttpServletResponse;->encodeRedirectUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public encodeURL(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 120
    invoke-direct {p0}, Ljavax/servlet/http/HttpServletResponseWrapper;->_getHttpServletResponse()Ljavax/servlet/http/HttpServletResponse;

    move-result-object v0

    invoke-interface {v0, p1}, Ljavax/servlet/http/HttpServletResponse;->encodeURL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public encodeUrl(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 136
    invoke-direct {p0}, Ljavax/servlet/http/HttpServletResponseWrapper;->_getHttpServletResponse()Ljavax/servlet/http/HttpServletResponse;

    move-result-object v0

    invoke-interface {v0, p1}, Ljavax/servlet/http/HttpServletResponse;->encodeUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public sendError(I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 162
    invoke-direct {p0}, Ljavax/servlet/http/HttpServletResponseWrapper;->_getHttpServletResponse()Ljavax/servlet/http/HttpServletResponse;

    move-result-object v0

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

    .line 152
    invoke-direct {p0}, Ljavax/servlet/http/HttpServletResponseWrapper;->_getHttpServletResponse()Ljavax/servlet/http/HttpServletResponse;

    move-result-object v0

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

    .line 170
    invoke-direct {p0}, Ljavax/servlet/http/HttpServletResponseWrapper;->_getHttpServletResponse()Ljavax/servlet/http/HttpServletResponse;

    move-result-object v0

    invoke-interface {v0, p1}, Ljavax/servlet/http/HttpServletResponse;->sendRedirect(Ljava/lang/String;)V

    return-void
.end method

.method public setDateHeader(Ljava/lang/String;J)V
    .locals 1

    .line 178
    invoke-direct {p0}, Ljavax/servlet/http/HttpServletResponseWrapper;->_getHttpServletResponse()Ljavax/servlet/http/HttpServletResponse;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3}, Ljavax/servlet/http/HttpServletResponse;->setDateHeader(Ljava/lang/String;J)V

    return-void
.end method

.method public setHeader(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 194
    invoke-direct {p0}, Ljavax/servlet/http/HttpServletResponseWrapper;->_getHttpServletResponse()Ljavax/servlet/http/HttpServletResponse;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Ljavax/servlet/http/HttpServletResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setIntHeader(Ljava/lang/String;I)V
    .locals 1

    .line 210
    invoke-direct {p0}, Ljavax/servlet/http/HttpServletResponseWrapper;->_getHttpServletResponse()Ljavax/servlet/http/HttpServletResponse;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Ljavax/servlet/http/HttpServletResponse;->setIntHeader(Ljava/lang/String;I)V

    return-void
.end method

.method public setStatus(I)V
    .locals 1

    .line 228
    invoke-direct {p0}, Ljavax/servlet/http/HttpServletResponseWrapper;->_getHttpServletResponse()Ljavax/servlet/http/HttpServletResponse;

    move-result-object v0

    invoke-interface {v0, p1}, Ljavax/servlet/http/HttpServletResponse;->setStatus(I)V

    return-void
.end method

.method public setStatus(ILjava/lang/String;)V
    .locals 1

    .line 236
    invoke-direct {p0}, Ljavax/servlet/http/HttpServletResponseWrapper;->_getHttpServletResponse()Ljavax/servlet/http/HttpServletResponse;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Ljavax/servlet/http/HttpServletResponse;->setStatus(ILjava/lang/String;)V

    return-void
.end method
