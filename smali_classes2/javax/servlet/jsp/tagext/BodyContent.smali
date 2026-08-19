.class public abstract Ljavax/servlet/jsp/tagext/BodyContent;
.super Ljavax/servlet/jsp/JspWriter;
.source "BodyContent.java"


# instance fields
.field private enclosingWriter:Ljavax/servlet/jsp/JspWriter;


# direct methods
.method protected constructor <init>(Ljavax/servlet/jsp/JspWriter;)V
    .locals 2

    const/4 v0, -0x2

    const/4 v1, 0x0

    .line 102
    invoke-direct {p0, v0, v1}, Ljavax/servlet/jsp/JspWriter;-><init>(IZ)V

    .line 103
    iput-object p1, p0, Ljavax/servlet/jsp/tagext/BodyContent;->enclosingWriter:Ljavax/servlet/jsp/JspWriter;

    return-void
.end method


# virtual methods
.method public clearBody()V
    .locals 2

    .line 124
    :try_start_0
    invoke-virtual {p0}, Ljavax/servlet/jsp/JspWriter;->clear()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    .line 127
    :catch_0
    new-instance v0, Ljava/lang/Error;

    const-string v1, "internal error!;"

    invoke-direct {v0, v1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public flush()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 115
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Illegal to flush within a custom tag"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getEnclosingWriter()Ljavax/servlet/jsp/JspWriter;
    .locals 1

    .line 165
    iget-object v0, p0, Ljavax/servlet/jsp/tagext/BodyContent;->enclosingWriter:Ljavax/servlet/jsp/JspWriter;

    return-object v0
.end method

.method public abstract getReader()Ljava/io/Reader;
.end method

.method public abstract getString()Ljava/lang/String;
.end method

.method public abstract writeOut(Ljava/io/Writer;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
