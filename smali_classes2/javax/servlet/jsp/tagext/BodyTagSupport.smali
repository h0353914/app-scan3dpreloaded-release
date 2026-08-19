.class public Ljavax/servlet/jsp/tagext/BodyTagSupport;
.super Ljavax/servlet/jsp/tagext/TagSupport;
.source "BodyTagSupport.java"

# interfaces
.implements Ljavax/servlet/jsp/tagext/BodyTag;


# instance fields
.field protected bodyContent:Ljavax/servlet/jsp/tagext/BodyContent;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 91
    invoke-direct {p0}, Ljavax/servlet/jsp/tagext/TagSupport;-><init>()V

    return-void
.end method


# virtual methods
.method public doAfterBody()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/jsp/JspException;
        }
    .end annotation

    const/4 v0, 0x0

    return v0
.end method

.method public doEndTag()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/jsp/JspException;
        }
    .end annotation

    .line 114
    invoke-super {p0}, Ljavax/servlet/jsp/tagext/TagSupport;->doEndTag()I

    move-result v0

    return v0
.end method

.method public doInitBody()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/jsp/JspException;
        }
    .end annotation

    return-void
.end method

.method public doStartTag()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/jsp/JspException;
        }
    .end annotation

    const/4 v0, 0x2

    return v0
.end method

.method public getBodyContent()Ljavax/servlet/jsp/tagext/BodyContent;
    .locals 1

    .line 180
    iget-object v0, p0, Ljavax/servlet/jsp/tagext/BodyTagSupport;->bodyContent:Ljavax/servlet/jsp/tagext/BodyContent;

    return-object v0
.end method

.method public getPreviousOut()Ljavax/servlet/jsp/JspWriter;
    .locals 1

    .line 191
    iget-object v0, p0, Ljavax/servlet/jsp/tagext/BodyTagSupport;->bodyContent:Ljavax/servlet/jsp/tagext/BodyContent;

    invoke-virtual {v0}, Ljavax/servlet/jsp/tagext/BodyContent;->getEnclosingWriter()Ljavax/servlet/jsp/JspWriter;

    move-result-object v0

    return-object v0
.end method

.method public release()V
    .locals 1

    const/4 v0, 0x0

    .line 168
    iput-object v0, p0, Ljavax/servlet/jsp/tagext/BodyTagSupport;->bodyContent:Ljavax/servlet/jsp/tagext/BodyContent;

    .line 170
    invoke-super {p0}, Ljavax/servlet/jsp/tagext/TagSupport;->release()V

    return-void
.end method

.method public setBodyContent(Ljavax/servlet/jsp/tagext/BodyContent;)V
    .locals 0

    .line 130
    iput-object p1, p0, Ljavax/servlet/jsp/tagext/BodyTagSupport;->bodyContent:Ljavax/servlet/jsp/tagext/BodyContent;

    return-void
.end method
