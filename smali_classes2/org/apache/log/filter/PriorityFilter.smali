.class public Lorg/apache/log/filter/PriorityFilter;
.super Lorg/apache/log/filter/AbstractFilterTarget;
.source "PriorityFilter.java"


# instance fields
.field private m_priority:Lorg/apache/log/Priority;


# direct methods
.method public constructor <init>(Lorg/apache/log/Priority;)V
    .locals 0

    .line 30
    invoke-direct {p0}, Lorg/apache/log/filter/AbstractFilterTarget;-><init>()V

    .line 31
    iput-object p1, p0, Lorg/apache/log/filter/PriorityFilter;->m_priority:Lorg/apache/log/Priority;

    return-void
.end method


# virtual methods
.method protected filter(Lorg/apache/log/LogEvent;)Z
    .locals 1

    .line 54
    iget-object v0, p0, Lorg/apache/log/filter/PriorityFilter;->m_priority:Lorg/apache/log/Priority;

    invoke-virtual {p1}, Lorg/apache/log/LogEvent;->getPriority()Lorg/apache/log/Priority;

    move-result-object p1

    invoke-virtual {v0, p1}, Lorg/apache/log/Priority;->isGreater(Lorg/apache/log/Priority;)Z

    move-result p1

    return p1
.end method

.method public setPriority(Lorg/apache/log/Priority;)V
    .locals 0

    .line 41
    iput-object p1, p0, Lorg/apache/log/filter/PriorityFilter;->m_priority:Lorg/apache/log/Priority;

    return-void
.end method
