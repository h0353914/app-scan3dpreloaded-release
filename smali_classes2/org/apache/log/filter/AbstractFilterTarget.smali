.class public abstract Lorg/apache/log/filter/AbstractFilterTarget;
.super Ljava/lang/Object;
.source "AbstractFilterTarget.java"

# interfaces
.implements Lorg/apache/log/FilterTarget;
.implements Lorg/apache/log/LogTarget;


# instance fields
.field private m_targets:[Lorg/apache/log/LogTarget;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public addTarget(Lorg/apache/log/LogTarget;)V
    .locals 5

    .line 33
    iget-object v0, p0, Lorg/apache/log/filter/AbstractFilterTarget;->m_targets:[Lorg/apache/log/LogTarget;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_0

    .line 35
    new-array v0, v2, [Lorg/apache/log/LogTarget;

    aput-object p1, v0, v1

    iput-object v0, p0, Lorg/apache/log/filter/AbstractFilterTarget;->m_targets:[Lorg/apache/log/LogTarget;

    goto :goto_0

    .line 40
    :cond_0
    array-length v3, v0

    add-int/2addr v3, v2

    new-array v3, v3, [Lorg/apache/log/LogTarget;

    iput-object v3, p0, Lorg/apache/log/filter/AbstractFilterTarget;->m_targets:[Lorg/apache/log/LogTarget;

    .line 41
    iget-object v3, p0, Lorg/apache/log/filter/AbstractFilterTarget;->m_targets:[Lorg/apache/log/LogTarget;

    array-length v4, v0

    invoke-static {v0, v1, v3, v1, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 42
    iget-object v0, p0, Lorg/apache/log/filter/AbstractFilterTarget;->m_targets:[Lorg/apache/log/LogTarget;

    array-length v1, v0

    sub-int/2addr v1, v2

    aput-object p1, v0, v1

    :goto_0
    return-void
.end method

.method protected abstract filter(Lorg/apache/log/LogEvent;)Z
.end method

.method public processEvent(Lorg/apache/log/LogEvent;)V
    .locals 3

    .line 61
    iget-object v0, p0, Lorg/apache/log/filter/AbstractFilterTarget;->m_targets:[Lorg/apache/log/LogTarget;

    if-eqz v0, :cond_2

    invoke-virtual {p0, p1}, Lorg/apache/log/filter/AbstractFilterTarget;->filter(Lorg/apache/log/LogEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    const/4 v0, 0x0

    .line 64
    :goto_0
    iget-object v1, p0, Lorg/apache/log/filter/AbstractFilterTarget;->m_targets:[Lorg/apache/log/LogTarget;

    array-length v2, v1

    if-lt v0, v2, :cond_1

    return-void

    .line 66
    :cond_1
    aget-object v1, v1, v0

    invoke-interface {v1, p1}, Lorg/apache/log/LogTarget;->processEvent(Lorg/apache/log/LogEvent;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    :goto_1
    return-void
.end method
