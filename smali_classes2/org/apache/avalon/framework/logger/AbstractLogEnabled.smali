.class public abstract Lorg/apache/avalon/framework/logger/AbstractLogEnabled;
.super Ljava/lang/Object;
.source "AbstractLogEnabled.java"

# interfaces
.implements Lorg/apache/avalon/framework/logger/LogEnabled;


# instance fields
.field private m_logger:Lorg/apache/avalon/framework/logger/Logger;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public enableLogging(Lorg/apache/avalon/framework/logger/Logger;)V
    .locals 0

    .line 28
    iput-object p1, p0, Lorg/apache/avalon/framework/logger/AbstractLogEnabled;->m_logger:Lorg/apache/avalon/framework/logger/Logger;

    return-void
.end method

.method protected final getLogger()Lorg/apache/avalon/framework/logger/Logger;
    .locals 1

    .line 44
    iget-object v0, p0, Lorg/apache/avalon/framework/logger/AbstractLogEnabled;->m_logger:Lorg/apache/avalon/framework/logger/Logger;

    return-object v0
.end method

.method protected setupLogger(Ljava/lang/Object;)V
    .locals 1

    const/4 v0, 0x0

    .line 54
    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lorg/apache/avalon/framework/logger/AbstractLogEnabled;->setupLogger(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method protected setupLogger(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 1

    .line 66
    iget-object v0, p0, Lorg/apache/avalon/framework/logger/AbstractLogEnabled;->m_logger:Lorg/apache/avalon/framework/logger/Logger;

    if-eqz p2, :cond_0

    .line 70
    invoke-interface {v0, p2}, Lorg/apache/avalon/framework/logger/Logger;->getChildLogger(Ljava/lang/String;)Lorg/apache/avalon/framework/logger/Logger;

    move-result-object v0

    .line 73
    :cond_0
    invoke-virtual {p0, p1, v0}, Lorg/apache/avalon/framework/logger/AbstractLogEnabled;->setupLogger(Ljava/lang/Object;Lorg/apache/avalon/framework/logger/Logger;)V

    return-void
.end method

.method protected setupLogger(Ljava/lang/Object;Lorg/apache/avalon/framework/logger/Logger;)V
    .locals 1

    .line 84
    instance-of v0, p1, Lorg/apache/avalon/framework/logger/LogEnabled;

    if-eqz v0, :cond_0

    .line 86
    check-cast p1, Lorg/apache/avalon/framework/logger/LogEnabled;

    invoke-interface {p1, p2}, Lorg/apache/avalon/framework/logger/LogEnabled;->enableLogging(Lorg/apache/avalon/framework/logger/Logger;)V

    :cond_0
    return-void
.end method
