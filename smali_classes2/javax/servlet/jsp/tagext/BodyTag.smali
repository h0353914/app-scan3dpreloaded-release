.class public interface abstract Ljavax/servlet/jsp/tagext/BodyTag;
.super Ljava/lang/Object;
.source "BodyTag.java"

# interfaces
.implements Ljavax/servlet/jsp/tagext/IterationTag;


# static fields
.field public static final EVAL_BODY_BUFFERED:I = 0x2

.field public static final EVAL_BODY_TAG:I = 0x2


# virtual methods
.method public abstract doInitBody()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/jsp/JspException;
        }
    .end annotation
.end method

.method public abstract setBodyContent(Ljavax/servlet/jsp/tagext/BodyContent;)V
.end method
