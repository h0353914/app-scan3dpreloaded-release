.class public final Lorg/apache/log4j/spi/RootLogger;
.super Lorg/apache/log4j/Logger;
.source "RootLogger.java"


# direct methods
.method public constructor <init>(Lorg/apache/log4j/Level;)V
    .locals 1

    const-string v0, "root"

    .line 43
    invoke-direct {p0, v0}, Lorg/apache/log4j/Logger;-><init>(Ljava/lang/String;)V

    .line 44
    invoke-virtual {p0, p1}, Lorg/apache/log4j/spi/RootLogger;->setLevel(Lorg/apache/log4j/Level;)V

    return-void
.end method


# virtual methods
.method public final getChainedLevel()Lorg/apache/log4j/Level;
    .locals 1

    .line 52
    iget-object v0, p0, Lorg/apache/log4j/Category;->level:Lorg/apache/log4j/Level;

    return-object v0
.end method

.method public final setLevel(Lorg/apache/log4j/Level;)V
    .locals 1

    if-nez p1, :cond_0

    const-string p1, "You have tried to set a null level to root."

    .line 63
    new-instance v0, Ljava/lang/Throwable;

    invoke-direct {v0}, Ljava/lang/Throwable;-><init>()V

    .line 62
    invoke-static {p1, v0}, Lorg/apache/log4j/helpers/LogLog;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 65
    :cond_0
    iput-object p1, p0, Lorg/apache/log4j/Category;->level:Lorg/apache/log4j/Level;

    :goto_0
    return-void
.end method
