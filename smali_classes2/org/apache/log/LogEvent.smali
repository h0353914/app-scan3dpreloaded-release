.class public final Lorg/apache/log/LogEvent;
.super Ljava/lang/Object;
.source "LogEvent.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final START_TIME:J


# instance fields
.field private m_category:Ljava/lang/String;

.field private m_contextMap:Lorg/apache/log/ContextMap;

.field private transient m_contextStack:Lorg/apache/log/ContextStack;

.field private m_message:Ljava/lang/String;

.field private m_priority:Lorg/apache/log/Priority;

.field private m_throwable:Ljava/lang/Throwable;

.field private m_time:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 24
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sput-wide v0, Lorg/apache/log/LogEvent;->START_TIME:J

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private readResolve()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/ObjectStreamException;
        }
    .end annotation

    .line 214
    iget-object v0, p0, Lorg/apache/log/LogEvent;->m_category:Ljava/lang/String;

    if-nez v0, :cond_0

    const-string v0, ""

    iput-object v0, p0, Lorg/apache/log/LogEvent;->m_category:Ljava/lang/String;

    .line 215
    :cond_0
    iget-object v0, p0, Lorg/apache/log/LogEvent;->m_message:Ljava/lang/String;

    if-nez v0, :cond_1

    const-string v0, ""

    iput-object v0, p0, Lorg/apache/log/LogEvent;->m_message:Ljava/lang/String;

    :cond_1
    const-string v0, ""

    .line 218
    iget-object v1, p0, Lorg/apache/log/LogEvent;->m_priority:Lorg/apache/log/Priority;

    if-eqz v1, :cond_2

    .line 220
    invoke-virtual {v1}, Lorg/apache/log/Priority;->getName()Ljava/lang/String;

    move-result-object v0

    .line 223
    :cond_2
    invoke-static {v0}, Lorg/apache/log/Priority;->getPriorityForName(Ljava/lang/String;)Lorg/apache/log/Priority;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/log/LogEvent;->m_priority:Lorg/apache/log/Priority;

    return-object p0
.end method


# virtual methods
.method public final getCategory()Ljava/lang/String;
    .locals 1

    .line 121
    iget-object v0, p0, Lorg/apache/log/LogEvent;->m_category:Ljava/lang/String;

    return-object v0
.end method

.method public final getContextMap()Lorg/apache/log/ContextMap;
    .locals 1

    .line 77
    iget-object v0, p0, Lorg/apache/log/LogEvent;->m_contextMap:Lorg/apache/log/ContextMap;

    return-object v0
.end method

.method public final getContextStack()Lorg/apache/log/ContextStack;
    .locals 1

    .line 98
    iget-object v0, p0, Lorg/apache/log/LogEvent;->m_contextStack:Lorg/apache/log/ContextStack;

    return-object v0
.end method

.method public final getMessage()Ljava/lang/String;
    .locals 1

    .line 131
    iget-object v0, p0, Lorg/apache/log/LogEvent;->m_message:Ljava/lang/String;

    return-object v0
.end method

.method public final getPriority()Lorg/apache/log/Priority;
    .locals 1

    .line 57
    iget-object v0, p0, Lorg/apache/log/LogEvent;->m_priority:Lorg/apache/log/Priority;

    return-object v0
.end method

.method public final getRelativeTime()J
    .locals 4

    .line 161
    iget-wide v0, p0, Lorg/apache/log/LogEvent;->m_time:J

    sget-wide v2, Lorg/apache/log/LogEvent;->START_TIME:J

    sub-long/2addr v0, v2

    return-wide v0
.end method

.method public final getThrowable()Ljava/lang/Throwable;
    .locals 1

    .line 141
    iget-object v0, p0, Lorg/apache/log/LogEvent;->m_throwable:Ljava/lang/Throwable;

    return-object v0
.end method

.method public final getTime()J
    .locals 2

    .line 151
    iget-wide v0, p0, Lorg/apache/log/LogEvent;->m_time:J

    return-wide v0
.end method

.method public final setCategory(Ljava/lang/String;)V
    .locals 0

    .line 171
    iput-object p1, p0, Lorg/apache/log/LogEvent;->m_category:Ljava/lang/String;

    return-void
.end method

.method public final setContextMap(Lorg/apache/log/ContextMap;)V
    .locals 0

    .line 87
    iput-object p1, p0, Lorg/apache/log/LogEvent;->m_contextMap:Lorg/apache/log/ContextMap;

    return-void
.end method

.method public final setContextStack(Lorg/apache/log/ContextStack;)V
    .locals 0

    .line 111
    iput-object p1, p0, Lorg/apache/log/LogEvent;->m_contextStack:Lorg/apache/log/ContextStack;

    return-void
.end method

.method public final setMessage(Ljava/lang/String;)V
    .locals 0

    .line 181
    iput-object p1, p0, Lorg/apache/log/LogEvent;->m_message:Ljava/lang/String;

    return-void
.end method

.method public final setPriority(Lorg/apache/log/Priority;)V
    .locals 0

    .line 67
    iput-object p1, p0, Lorg/apache/log/LogEvent;->m_priority:Lorg/apache/log/Priority;

    return-void
.end method

.method public final setThrowable(Ljava/lang/Throwable;)V
    .locals 0

    .line 191
    iput-object p1, p0, Lorg/apache/log/LogEvent;->m_throwable:Ljava/lang/Throwable;

    return-void
.end method

.method public final setTime(J)V
    .locals 0

    .line 201
    iput-wide p1, p0, Lorg/apache/log/LogEvent;->m_time:J

    return-void
.end method
