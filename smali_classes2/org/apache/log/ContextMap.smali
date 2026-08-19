.class public final Lorg/apache/log/ContextMap;
.super Ljava/lang/Object;
.source "ContextMap.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final c_context:Ljava/lang/ThreadLocal;


# instance fields
.field private m_map:Ljava/util/Hashtable;

.field private final m_parent:Lorg/apache/log/ContextMap;

.field private transient m_readOnly:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 36
    new-instance v0, Ljava/lang/InheritableThreadLocal;

    invoke-direct {v0}, Ljava/lang/InheritableThreadLocal;-><init>()V

    sput-object v0, Lorg/apache/log/ContextMap;->c_context:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 98
    invoke-direct {p0, v0}, Lorg/apache/log/ContextMap;-><init>(Lorg/apache/log/ContextMap;)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/log/ContextMap;)V
    .locals 1

    .line 107
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/log/ContextMap;->m_map:Ljava/util/Hashtable;

    .line 108
    iput-object p1, p0, Lorg/apache/log/ContextMap;->m_parent:Lorg/apache/log/ContextMap;

    return-void
.end method

.method public static final bind(Lorg/apache/log/ContextMap;)V
    .locals 1

    .line 90
    sget-object v0, Lorg/apache/log/ContextMap;->c_context:Ljava/lang/ThreadLocal;

    invoke-virtual {v0, p0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    return-void
.end method

.method private checkReadable()V
    .locals 2

    .line 235
    invoke-virtual {p0}, Lorg/apache/log/ContextMap;->isReadOnly()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 237
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "ContextMap is read only and can not be modified"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static final getCurrentContext()Lorg/apache/log/ContextMap;
    .locals 1

    const/4 v0, 0x1

    .line 56
    invoke-static {v0}, Lorg/apache/log/ContextMap;->getCurrentContext(Z)Lorg/apache/log/ContextMap;

    move-result-object v0

    return-object v0
.end method

.method public static final getCurrentContext(Z)Lorg/apache/log/ContextMap;
    .locals 1

    .line 71
    sget-object v0, Lorg/apache/log/ContextMap;->c_context:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/log/ContextMap;

    if-nez v0, :cond_0

    if-eqz p0, :cond_0

    .line 75
    new-instance v0, Lorg/apache/log/ContextMap;

    invoke-direct {v0}, Lorg/apache/log/ContextMap;-><init>()V

    .line 76
    sget-object p0, Lorg/apache/log/ContextMap;->c_context:Ljava/lang/ThreadLocal;

    invoke-virtual {p0, v0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    :cond_0
    return-object v0
.end method

.method private readResolve()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/ObjectStreamException;
        }
    .end annotation

    .line 226
    invoke-virtual {p0}, Lorg/apache/log/ContextMap;->makeReadOnly()V

    return-object p0
.end method


# virtual methods
.method public clear()V
    .locals 1

    .line 137
    invoke-direct {p0}, Lorg/apache/log/ContextMap;->checkReadable()V

    .line 139
    iget-object v0, p0, Lorg/apache/log/ContextMap;->m_map:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->clear()V

    return-void
.end method

.method public get(Ljava/lang/String;)Ljava/lang/Object;
    .locals 2

    .line 165
    iget-object v0, p0, Lorg/apache/log/ContextMap;->m_map:Ljava/util/Hashtable;

    invoke-virtual {v0, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    .line 167
    iget-object v1, p0, Lorg/apache/log/ContextMap;->m_parent:Lorg/apache/log/ContextMap;

    if-eqz v1, :cond_0

    .line 169
    invoke-virtual {v1, p1}, Lorg/apache/log/ContextMap;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    :cond_0
    return-object v0
.end method

.method public get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 151
    invoke-virtual {p0, p1}, Lorg/apache/log/ContextMap;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_0

    return-object p1

    :cond_0
    return-object p2
.end method

.method public getSize()I
    .locals 1

    .line 214
    iget-object v0, p0, Lorg/apache/log/ContextMap;->m_map:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->size()I

    move-result v0

    return v0
.end method

.method public isReadOnly()Z
    .locals 1

    .line 128
    iget-boolean v0, p0, Lorg/apache/log/ContextMap;->m_readOnly:Z

    return v0
.end method

.method public makeReadOnly()V
    .locals 1

    const/4 v0, 0x1

    .line 118
    iput-boolean v0, p0, Lorg/apache/log/ContextMap;->m_readOnly:Z

    return-void
.end method

.method public set(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    .line 183
    invoke-direct {p0}, Lorg/apache/log/ContextMap;->checkReadable()V

    if-nez p2, :cond_0

    .line 187
    iget-object p2, p0, Lorg/apache/log/ContextMap;->m_map:Ljava/util/Hashtable;

    invoke-virtual {p2, p1}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 191
    :cond_0
    iget-object v0, p0, Lorg/apache/log/ContextMap;->m_map:Ljava/util/Hashtable;

    invoke-virtual {v0, p1, p2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_0
    return-void
.end method
