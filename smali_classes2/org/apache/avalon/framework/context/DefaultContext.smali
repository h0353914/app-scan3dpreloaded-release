.class public Lorg/apache/avalon/framework/context/DefaultContext;
.super Ljava/lang/Object;
.source "DefaultContext.java"

# interfaces
.implements Lorg/apache/avalon/framework/context/Context;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/avalon/framework/context/DefaultContext$Hidden;
    }
.end annotation


# static fields
.field private static final m_hiddenMarker:Lorg/apache/avalon/framework/context/DefaultContext$Hidden;


# instance fields
.field private final m_contextData:Ljava/util/Map;

.field private final m_parent:Lorg/apache/avalon/framework/context/Context;

.field private m_readOnly:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 31
    new-instance v0, Lorg/apache/avalon/framework/context/DefaultContext$Hidden;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/apache/avalon/framework/context/DefaultContext$Hidden;-><init>(Lorg/apache/avalon/framework/context/DefaultContext$1;)V

    sput-object v0, Lorg/apache/avalon/framework/context/DefaultContext;->m_hiddenMarker:Lorg/apache/avalon/framework/context/DefaultContext$Hidden;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 75
    check-cast v0, Lorg/apache/avalon/framework/context/Context;

    invoke-direct {p0, v0}, Lorg/apache/avalon/framework/context/DefaultContext;-><init>(Lorg/apache/avalon/framework/context/Context;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/Map;)V
    .locals 1

    const/4 v0, 0x0

    .line 56
    invoke-direct {p0, p1, v0}, Lorg/apache/avalon/framework/context/DefaultContext;-><init>(Ljava/util/Map;Lorg/apache/avalon/framework/context/Context;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/Map;Lorg/apache/avalon/framework/context/Context;)V
    .locals 0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-object p2, p0, Lorg/apache/avalon/framework/context/DefaultContext;->m_parent:Lorg/apache/avalon/framework/context/Context;

    .line 46
    iput-object p1, p0, Lorg/apache/avalon/framework/context/DefaultContext;->m_contextData:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>(Lorg/apache/avalon/framework/context/Context;)V
    .locals 1

    .line 66
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    invoke-direct {p0, v0, p1}, Lorg/apache/avalon/framework/context/DefaultContext;-><init>(Ljava/util/Map;Lorg/apache/avalon/framework/context/Context;)V

    return-void
.end method


# virtual methods
.method protected final checkWriteable()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 191
    iget-boolean v0, p0, Lorg/apache/avalon/framework/context/DefaultContext;->m_readOnly:Z

    if-nez v0, :cond_0

    return-void

    .line 193
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Context is read only and can not be modified"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/avalon/framework/context/ContextException;
        }
    .end annotation

    .line 88
    iget-object v0, p0, Lorg/apache/avalon/framework/context/DefaultContext;->m_contextData:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 92
    instance-of v1, v0, Lorg/apache/avalon/framework/context/DefaultContext$Hidden;

    if-nez v1, :cond_1

    .line 98
    instance-of p1, v0, Lorg/apache/avalon/framework/context/Resolvable;

    if-eqz p1, :cond_0

    .line 100
    check-cast v0, Lorg/apache/avalon/framework/context/Resolvable;

    invoke-interface {v0, p0}, Lorg/apache/avalon/framework/context/Resolvable;->resolve(Lorg/apache/avalon/framework/context/Context;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    :cond_0
    return-object v0

    .line 95
    :cond_1
    new-instance v0, Lorg/apache/avalon/framework/context/ContextException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Unable to locate "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lorg/apache/avalon/framework/context/ContextException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 107
    :cond_2
    iget-object v0, p0, Lorg/apache/avalon/framework/context/DefaultContext;->m_parent:Lorg/apache/avalon/framework/context/Context;

    if-eqz v0, :cond_3

    .line 113
    invoke-interface {v0, p1}, Lorg/apache/avalon/framework/context/Context;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 110
    :cond_3
    new-instance v0, Lorg/apache/avalon/framework/context/ContextException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Unable to resolve context key: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lorg/apache/avalon/framework/context/ContextException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected final getContextData()Ljava/util/Map;
    .locals 1

    .line 160
    iget-object v0, p0, Lorg/apache/avalon/framework/context/DefaultContext;->m_contextData:Ljava/util/Map;

    return-object v0
.end method

.method protected final getParent()Lorg/apache/avalon/framework/context/Context;
    .locals 1

    .line 170
    iget-object v0, p0, Lorg/apache/avalon/framework/context/DefaultContext;->m_parent:Lorg/apache/avalon/framework/context/Context;

    return-object v0
.end method

.method public hide(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 149
    invoke-virtual {p0}, Lorg/apache/avalon/framework/context/DefaultContext;->checkWriteable()V

    .line 150
    iget-object v0, p0, Lorg/apache/avalon/framework/context/DefaultContext;->m_contextData:Ljava/util/Map;

    sget-object v1, Lorg/apache/avalon/framework/context/DefaultContext;->m_hiddenMarker:Lorg/apache/avalon/framework/context/DefaultContext$Hidden;

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public makeReadOnly()V
    .locals 1

    const/4 v0, 0x1

    .line 180
    iput-boolean v0, p0, Lorg/apache/avalon/framework/context/DefaultContext;->m_readOnly:Z

    return-void
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 126
    invoke-virtual {p0}, Lorg/apache/avalon/framework/context/DefaultContext;->checkWriteable()V

    if-nez p2, :cond_0

    .line 129
    iget-object p2, p0, Lorg/apache/avalon/framework/context/DefaultContext;->m_contextData:Ljava/util/Map;

    invoke-interface {p2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 133
    :cond_0
    iget-object v0, p0, Lorg/apache/avalon/framework/context/DefaultContext;->m_contextData:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_0
    return-void
.end method
