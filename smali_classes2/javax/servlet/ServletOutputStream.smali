.class public abstract Ljavax/servlet/ServletOutputStream;
.super Ljava/io/OutputStream;
.source "ServletOutputStream.java"


# static fields
.field private static final LSTRING_FILE:Ljava/lang/String; = "javax.servlet.LocalStrings"

.field private static lStrings:Ljava/util/ResourceBundle;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "javax.servlet.LocalStrings"

    .line 90
    invoke-static {v0}, Ljava/util/ResourceBundle;->getBundle(Ljava/lang/String;)Ljava/util/ResourceBundle;

    move-result-object v0

    sput-object v0, Ljavax/servlet/ServletOutputStream;->lStrings:Ljava/util/ResourceBundle;

    return-void
.end method

.method protected constructor <init>()V
    .locals 0

    .line 101
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    return-void
.end method


# virtual methods
.method public print(C)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 177
    invoke-static {p1}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljavax/servlet/ServletOutputStream;->print(Ljava/lang/String;)V

    return-void
.end method

.method public print(D)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 253
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljavax/servlet/ServletOutputStream;->print(Ljava/lang/String;)V

    return-void
.end method

.method public print(F)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 235
    invoke-static {p1}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljavax/servlet/ServletOutputStream;->print(Ljava/lang/String;)V

    return-void
.end method

.method public print(I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 196
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljavax/servlet/ServletOutputStream;->print(Ljava/lang/String;)V

    return-void
.end method

.method public print(J)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 216
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljavax/servlet/ServletOutputStream;->print(Ljava/lang/String;)V

    return-void
.end method

.method public print(Ljava/lang/String;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-nez p1, :cond_0

    const-string p1, "null"

    .line 118
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-lt v2, v0, :cond_1

    return-void

    .line 120
    :cond_1
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const v4, 0xff00

    and-int/2addr v4, v3

    if-nez v4, :cond_2

    .line 135
    invoke-virtual {p0, v3}, Ljava/io/OutputStream;->write(I)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 129
    :cond_2
    sget-object p1, Ljavax/servlet/ServletOutputStream;->lStrings:Ljava/util/ResourceBundle;

    const-string v0, "err.not_iso8859_1"

    invoke-virtual {p1, v0}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x1

    .line 130
    new-array v0, v0, [Ljava/lang/Object;

    .line 131
    new-instance v2, Ljava/lang/Character;

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    aput-object v2, v0, v1

    .line 132
    invoke-static {p1, v0}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 133
    new-instance v0, Ljava/io/CharConversionException;

    invoke-direct {v0, p1}, Ljava/io/CharConversionException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public print(Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-eqz p1, :cond_0

    .line 156
    sget-object p1, Ljavax/servlet/ServletOutputStream;->lStrings:Ljava/util/ResourceBundle;

    const-string v0, "value.true"

    invoke-virtual {p1, v0}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 158
    :cond_0
    sget-object p1, Ljavax/servlet/ServletOutputStream;->lStrings:Ljava/util/ResourceBundle;

    const-string v0, "value.false"

    invoke-virtual {p1, v0}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 160
    :goto_0
    invoke-virtual {p0, p1}, Ljavax/servlet/ServletOutputStream;->print(Ljava/lang/String;)V

    return-void
.end method

.method public println()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "\r\n"

    .line 269
    invoke-virtual {p0, v0}, Ljavax/servlet/ServletOutputStream;->print(Ljava/lang/String;)V

    return-void
.end method

.method public println(C)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 326
    invoke-virtual {p0, p1}, Ljavax/servlet/ServletOutputStream;->print(C)V

    .line 327
    invoke-virtual {p0}, Ljavax/servlet/ServletOutputStream;->println()V

    return-void
.end method

.method public println(D)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 405
    invoke-virtual {p0, p1, p2}, Ljavax/servlet/ServletOutputStream;->print(D)V

    .line 406
    invoke-virtual {p0}, Ljavax/servlet/ServletOutputStream;->println()V

    return-void
.end method

.method public println(F)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 385
    invoke-virtual {p0, p1}, Ljavax/servlet/ServletOutputStream;->print(F)V

    .line 386
    invoke-virtual {p0}, Ljavax/servlet/ServletOutputStream;->println()V

    return-void
.end method

.method public println(I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 345
    invoke-virtual {p0, p1}, Ljavax/servlet/ServletOutputStream;->print(I)V

    .line 346
    invoke-virtual {p0}, Ljavax/servlet/ServletOutputStream;->println()V

    return-void
.end method

.method public println(J)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 364
    invoke-virtual {p0, p1, p2}, Ljavax/servlet/ServletOutputStream;->print(J)V

    .line 365
    invoke-virtual {p0}, Ljavax/servlet/ServletOutputStream;->println()V

    return-void
.end method

.method public println(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 286
    invoke-virtual {p0, p1}, Ljavax/servlet/ServletOutputStream;->print(Ljava/lang/String;)V

    .line 287
    invoke-virtual {p0}, Ljavax/servlet/ServletOutputStream;->println()V

    return-void
.end method

.method public println(Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 308
    invoke-virtual {p0, p1}, Ljavax/servlet/ServletOutputStream;->print(Z)V

    .line 309
    invoke-virtual {p0}, Ljavax/servlet/ServletOutputStream;->println()V

    return-void
.end method
