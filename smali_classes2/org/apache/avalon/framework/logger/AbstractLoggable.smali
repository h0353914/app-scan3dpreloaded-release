.class public abstract Lorg/apache/avalon/framework/logger/AbstractLoggable;
.super Ljava/lang/Object;
.source "AbstractLoggable.java"

# interfaces
.implements Lorg/apache/avalon/framework/logger/Loggable;


# instance fields
.field private m_logger:Lorg/apache/log/Logger;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method protected final getLogger()Lorg/apache/log/Logger;
    .locals 1

    .line 45
    iget-object v0, p0, Lorg/apache/avalon/framework/logger/AbstractLoggable;->m_logger:Lorg/apache/log/Logger;

    return-object v0
.end method

.method public setLogger(Lorg/apache/log/Logger;)V
    .locals 0

    .line 29
    iput-object p1, p0, Lorg/apache/avalon/framework/logger/AbstractLoggable;->m_logger:Lorg/apache/log/Logger;

    return-void
.end method

.method protected setupLogger(Ljava/lang/Object;)V
    .locals 1

    const/4 v0, 0x0

    .line 55
    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lorg/apache/avalon/framework/logger/AbstractLoggable;->setupLogger(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method protected setupLogger(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 1

    .line 67
    iget-object v0, p0, Lorg/apache/avalon/framework/logger/AbstractLoggable;->m_logger:Lorg/apache/log/Logger;

    if-eqz p2, :cond_0

    .line 71
    invoke-virtual {v0, p2}, Lorg/apache/log/Logger;->getChildLogger(Ljava/lang/String;)Lorg/apache/log/Logger;

    move-result-object v0

    .line 74
    :cond_0
    invoke-virtual {p0, p1, v0}, Lorg/apache/avalon/framework/logger/AbstractLoggable;->setupLogger(Ljava/lang/Object;Lorg/apache/log/Logger;)V

    return-void
.end method

.method protected setupLogger(Ljava/lang/Object;Lorg/apache/log/Logger;)V
    .locals 1

    .line 85
    instance-of v0, p1, Lorg/apache/avalon/framework/logger/Loggable;

    if-eqz v0, :cond_0

    .line 87
    check-cast p1, Lorg/apache/avalon/framework/logger/Loggable;

    invoke-interface {p1, p2}, Lorg/apache/avalon/framework/logger/Loggable;->setLogger(Lorg/apache/log/Logger;)V

    :cond_0
    return-void
.end method
