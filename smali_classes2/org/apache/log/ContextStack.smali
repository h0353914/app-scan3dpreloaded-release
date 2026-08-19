.class public Lorg/apache/log/ContextStack;
.super Ljava/lang/Object;
.source "ContextStack.java"


# static fields
.field private static final c_context:Ljava/lang/ThreadLocal;


# instance fields
.field private m_stack:Ljava/util/Stack;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 27
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Lorg/apache/log/ContextStack;->c_context:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lorg/apache/log/ContextStack;->m_stack:Ljava/util/Stack;

    return-void
.end method

.method private fix(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    const/16 v0, 0x2e

    const/16 v1, 0x5f

    .line 180
    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public static final getCurrentContext()Lorg/apache/log/ContextStack;
    .locals 1

    const/4 v0, 0x1

    .line 42
    invoke-static {v0}, Lorg/apache/log/ContextStack;->getCurrentContext(Z)Lorg/apache/log/ContextStack;

    move-result-object v0

    return-object v0
.end method

.method static final getCurrentContext(Z)Lorg/apache/log/ContextStack;
    .locals 1

    .line 57
    sget-object v0, Lorg/apache/log/ContextStack;->c_context:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/log/ContextStack;

    if-nez v0, :cond_0

    if-eqz p0, :cond_0

    .line 61
    new-instance v0, Lorg/apache/log/ContextStack;

    invoke-direct {v0}, Lorg/apache/log/ContextStack;-><init>()V

    .line 62
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Lorg/apache/log/ContextStack;->push(Ljava/lang/Object;)V

    .line 63
    sget-object p0, Lorg/apache/log/ContextStack;->c_context:Ljava/lang/ThreadLocal;

    invoke-virtual {p0, v0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    :cond_0
    return-object v0
.end method


# virtual methods
.method public clear()V
    .locals 2

    .line 75
    iget-object v0, p0, Lorg/apache/log/ContextStack;->m_stack:Ljava/util/Stack;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/Stack;->setSize(I)V

    return-void
.end method

.method public get(I)Ljava/lang/Object;
    .locals 1

    .line 86
    iget-object v0, p0, Lorg/apache/log/ContextStack;->m_stack:Ljava/util/Stack;

    invoke-virtual {v0, p1}, Ljava/util/Stack;->elementAt(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getSize()I
    .locals 1

    .line 132
    iget-object v0, p0, Lorg/apache/log/ContextStack;->m_stack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->size()I

    move-result v0

    return v0
.end method

.method public pop()Ljava/lang/Object;
    .locals 1

    .line 96
    iget-object v0, p0, Lorg/apache/log/ContextStack;->m_stack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public push(Ljava/lang/Object;)V
    .locals 1

    .line 106
    iget-object v0, p0, Lorg/apache/log/ContextStack;->m_stack:Ljava/util/Stack;

    invoke-virtual {v0, p1}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public set(Lorg/apache/log/ContextStack;)V
    .locals 4

    .line 116
    invoke-virtual {p0}, Lorg/apache/log/ContextStack;->clear()V

    .line 117
    iget-object v0, p1, Lorg/apache/log/ContextStack;->m_stack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-lt v1, v0, :cond_0

    return-void

    .line 121
    :cond_0
    iget-object v2, p0, Lorg/apache/log/ContextStack;->m_stack:Ljava/util/Stack;

    iget-object v3, p1, Lorg/apache/log/ContextStack;->m_stack:Ljava/util/Stack;

    invoke-virtual {v3, v1}, Ljava/util/Stack;->elementAt(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 143
    invoke-virtual {p0}, Lorg/apache/log/ContextStack;->getSize()I

    move-result v0

    invoke-virtual {p0, v0}, Lorg/apache/log/ContextStack;->toString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString(I)Ljava/lang/String;
    .locals 3

    .line 156
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 158
    invoke-virtual {p0}, Lorg/apache/log/ContextStack;->getSize()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    sub-int p1, v1, p1

    add-int/lit8 p1, p1, 0x1

    const/4 v2, 0x0

    .line 159
    invoke-static {p1, v2}, Ljava/lang/Math;->max(II)I

    move-result p1

    :goto_0
    if-lt p1, v1, :cond_0

    .line 167
    invoke-virtual {p0, v1}, Lorg/apache/log/ContextStack;->get(I)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/apache/log/ContextStack;->fix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 169
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 163
    :cond_0
    invoke-virtual {p0, p1}, Lorg/apache/log/ContextStack;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lorg/apache/log/ContextStack;->fix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const/16 v2, 0x2e

    .line 164
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    add-int/lit8 p1, p1, 0x1

    goto :goto_0
.end method
