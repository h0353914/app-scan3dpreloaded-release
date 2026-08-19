.class public abstract Ljavax/servlet/jsp/PageContext;
.super Ljava/lang/Object;
.source "PageContext.java"


# static fields
.field public static final APPLICATION:Ljava/lang/String; = "javax.servlet.jsp.jspApplication"

.field public static final APPLICATION_SCOPE:I = 0x4

.field public static final CONFIG:Ljava/lang/String; = "javax.servlet.jsp.jspConfig"

.field public static final EXCEPTION:Ljava/lang/String; = "javax.servlet.jsp.jspException"

.field public static final OUT:Ljava/lang/String; = "javax.servlet.jsp.jspOut"

.field public static final PAGE:Ljava/lang/String; = "javax.servlet.jsp.jspPage"

.field public static final PAGECONTEXT:Ljava/lang/String; = "javax.servlet.jsp.jspPageContext"

.field public static final PAGE_SCOPE:I = 0x1

.field public static final REQUEST:Ljava/lang/String; = "javax.servlet.jsp.jspRequest"

.field public static final REQUEST_SCOPE:I = 0x2

.field public static final RESPONSE:Ljava/lang/String; = "javax.servlet.jsp.jspResponse"

.field public static final SESSION:Ljava/lang/String; = "javax.servlet.jsp.jspSession"

.field public static final SESSION_SCOPE:I = 0x3


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 140
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract findAttribute(Ljava/lang/String;)Ljava/lang/Object;
.end method

.method public abstract forward(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getAttribute(Ljava/lang/String;)Ljava/lang/Object;
.end method

.method public abstract getAttribute(Ljava/lang/String;I)Ljava/lang/Object;
.end method

.method public abstract getAttributeNamesInScope(I)Ljava/util/Enumeration;
.end method

.method public abstract getAttributesScope(Ljava/lang/String;)I
.end method

.method public abstract getException()Ljava/lang/Exception;
.end method

.method public abstract getOut()Ljavax/servlet/jsp/JspWriter;
.end method

.method public abstract getPage()Ljava/lang/Object;
.end method

.method public abstract getRequest()Ljavax/servlet/ServletRequest;
.end method

.method public abstract getResponse()Ljavax/servlet/ServletResponse;
.end method

.method public abstract getServletConfig()Ljavax/servlet/ServletConfig;
.end method

.method public abstract getServletContext()Ljavax/servlet/ServletContext;
.end method

.method public abstract getSession()Ljavax/servlet/http/HttpSession;
.end method

.method public abstract handlePageException(Ljava/lang/Exception;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract handlePageException(Ljava/lang/Throwable;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract include(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract initialize(Ljavax/servlet/Servlet;Ljavax/servlet/ServletRequest;Ljavax/servlet/ServletResponse;Ljava/lang/String;ZIZ)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/IllegalStateException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation
.end method

.method public popBody()Ljavax/servlet/jsp/JspWriter;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public pushBody()Ljavax/servlet/jsp/tagext/BodyContent;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public abstract release()V
.end method

.method public abstract removeAttribute(Ljava/lang/String;)V
.end method

.method public abstract removeAttribute(Ljava/lang/String;I)V
.end method

.method public abstract setAttribute(Ljava/lang/String;Ljava/lang/Object;)V
.end method

.method public abstract setAttribute(Ljava/lang/String;Ljava/lang/Object;I)V
.end method
