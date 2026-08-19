.class public interface abstract Ljavax/servlet/jsp/tagext/Tag;
.super Ljava/lang/Object;
.source "Tag.java"


# static fields
.field public static final EVAL_BODY_INCLUDE:I = 0x1

.field public static final EVAL_PAGE:I = 0x6

.field public static final SKIP_BODY:I = 0x0

.field public static final SKIP_PAGE:I = 0x5


# virtual methods
.method public abstract doEndTag()I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/jsp/JspException;
        }
    .end annotation
.end method

.method public abstract doStartTag()I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/jsp/JspException;
        }
    .end annotation
.end method

.method public abstract getParent()Ljavax/servlet/jsp/tagext/Tag;
.end method

.method public abstract release()V
.end method

.method public abstract setPageContext(Ljavax/servlet/jsp/PageContext;)V
.end method

.method public abstract setParent(Ljavax/servlet/jsp/tagext/Tag;)V
.end method
