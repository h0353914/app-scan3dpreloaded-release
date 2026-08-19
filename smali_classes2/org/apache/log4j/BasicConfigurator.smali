.class public Lorg/apache/log4j/BasicConfigurator;
.super Ljava/lang/Object;
.source "BasicConfigurator.java"


# direct methods
.method protected constructor <init>()V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static configure()V
    .locals 4

    .line 45
    invoke-static {}, Lorg/apache/log4j/Logger;->getRootLogger()Lorg/apache/log4j/Logger;

    move-result-object v0

    .line 46
    new-instance v1, Lorg/apache/log4j/ConsoleAppender;

    .line 47
    new-instance v2, Lorg/apache/log4j/PatternLayout;

    const-string v3, "%r [%t] %p %c %x - %m%n"

    invoke-direct {v2, v3}, Lorg/apache/log4j/PatternLayout;-><init>(Ljava/lang/String;)V

    .line 46
    invoke-direct {v1, v2}, Lorg/apache/log4j/ConsoleAppender;-><init>(Lorg/apache/log4j/Layout;)V

    invoke-virtual {v0, v1}, Lorg/apache/log4j/Category;->addAppender(Lorg/apache/log4j/Appender;)V

    return-void
.end method

.method public static configure(Lorg/apache/log4j/Appender;)V
    .locals 1

    .line 57
    invoke-static {}, Lorg/apache/log4j/Logger;->getRootLogger()Lorg/apache/log4j/Logger;

    move-result-object v0

    .line 58
    invoke-virtual {v0, p0}, Lorg/apache/log4j/Category;->addAppender(Lorg/apache/log4j/Appender;)V

    return-void
.end method

.method public static resetConfiguration()V
    .locals 0

    .line 70
    invoke-static {}, Lorg/apache/log4j/LogManager;->resetConfiguration()V

    return-void
.end method
