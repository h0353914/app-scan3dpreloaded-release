.class public final Lorg/apache/log/LogKit;
.super Ljava/lang/Object;
.source "LogKit.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getCurrentContext()Lorg/apache/log/ContextStack;
    .locals 1

    .line 30
    invoke-static {}, Lorg/apache/log/ContextStack;->getCurrentContext()Lorg/apache/log/ContextStack;

    move-result-object v0

    return-object v0
.end method

.method public static getLoggerFor(Ljava/lang/String;)Lorg/apache/log/Logger;
    .locals 1

    .line 42
    invoke-static {}, Lorg/apache/log/Hierarchy;->getDefaultHierarchy()Lorg/apache/log/Hierarchy;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/apache/log/Hierarchy;->getLoggerFor(Ljava/lang/String;)Lorg/apache/log/Logger;

    move-result-object p0

    return-object p0
.end method

.method public static getPriorityForName(Ljava/lang/String;)Lorg/apache/log/Priority;
    .locals 0

    .line 54
    invoke-static {p0}, Lorg/apache/log/Priority;->getPriorityForName(Ljava/lang/String;)Lorg/apache/log/Priority;

    move-result-object p0

    return-object p0
.end method

.method public static log(Ljava/lang/String;)V
    .locals 1

    .line 74
    invoke-static {}, Lorg/apache/log/Hierarchy;->getDefaultHierarchy()Lorg/apache/log/Hierarchy;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/apache/log/Hierarchy;->log(Ljava/lang/String;)V

    return-void
.end method

.method public static log(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    .line 64
    invoke-static {}, Lorg/apache/log/Hierarchy;->getDefaultHierarchy()Lorg/apache/log/Hierarchy;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lorg/apache/log/Hierarchy;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static setDefaultLogTarget(Lorg/apache/log/LogTarget;)V
    .locals 1

    .line 84
    invoke-static {}, Lorg/apache/log/Hierarchy;->getDefaultHierarchy()Lorg/apache/log/Hierarchy;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/apache/log/Hierarchy;->setDefaultLogTarget(Lorg/apache/log/LogTarget;)V

    return-void
.end method
