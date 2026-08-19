.class public Lorg/apache/avalon/framework/component/DefaultComponentManager;
.super Ljava/lang/Object;
.source "DefaultComponentManager.java"

# interfaces
.implements Lorg/apache/avalon/framework/component/ComponentManager;


# instance fields
.field private final m_components:Ljava/util/HashMap;

.field private final m_parent:Lorg/apache/avalon/framework/component/ComponentManager;

.field private m_readOnly:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 37
    invoke-direct {p0, v0}, Lorg/apache/avalon/framework/component/DefaultComponentManager;-><init>(Lorg/apache/avalon/framework/component/ComponentManager;)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/avalon/framework/component/ComponentManager;)V
    .locals 1

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/avalon/framework/component/DefaultComponentManager;->m_components:Ljava/util/HashMap;

    .line 47
    iput-object p1, p0, Lorg/apache/avalon/framework/component/DefaultComponentManager;->m_parent:Lorg/apache/avalon/framework/component/ComponentManager;

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

    .line 180
    iget-boolean v0, p0, Lorg/apache/avalon/framework/component/DefaultComponentManager;->m_readOnly:Z

    if-nez v0, :cond_0

    return-void

    .line 182
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "ComponentManager is read only and can not be modified"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected final getComponentMap()Ljava/util/Map;
    .locals 1

    .line 161
    iget-object v0, p0, Lorg/apache/avalon/framework/component/DefaultComponentManager;->m_components:Ljava/util/HashMap;

    return-object v0
.end method

.method protected final getParent()Lorg/apache/avalon/framework/component/ComponentManager;
    .locals 1

    .line 151
    iget-object v0, p0, Lorg/apache/avalon/framework/component/DefaultComponentManager;->m_parent:Lorg/apache/avalon/framework/component/ComponentManager;

    return-object v0
.end method

.method public hasComponent(Ljava/lang/String;)Z
    .locals 0

    .line 89
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/apache/avalon/framework/component/DefaultComponentManager;->lookup(Ljava/lang/String;)Lorg/apache/avalon/framework/component/Component;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/apache/avalon/framework/component/DefaultComponentManager;->release(Lorg/apache/avalon/framework/component/Component;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p1, 0x1

    goto :goto_0

    :catch_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public lookup(Ljava/lang/String;)Lorg/apache/avalon/framework/component/Component;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/avalon/framework/component/ComponentException;
        }
    .end annotation

    .line 60
    iget-object v0, p0, Lorg/apache/avalon/framework/component/DefaultComponentManager;->m_components:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/avalon/framework/component/Component;

    if-eqz v0, :cond_0

    return-object v0

    .line 66
    :cond_0
    iget-object v0, p0, Lorg/apache/avalon/framework/component/DefaultComponentManager;->m_parent:Lorg/apache/avalon/framework/component/ComponentManager;

    if-eqz v0, :cond_1

    .line 68
    invoke-interface {v0, p1}, Lorg/apache/avalon/framework/component/ComponentManager;->lookup(Ljava/lang/String;)Lorg/apache/avalon/framework/component/Component;

    move-result-object p1

    return-object p1

    .line 72
    :cond_1
    new-instance v0, Lorg/apache/avalon/framework/component/ComponentException;

    const-string v1, "Unable to provide implementation."

    invoke-direct {v0, p1, v1}, Lorg/apache/avalon/framework/component/ComponentException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0
.end method

.method public makeReadOnly()V
    .locals 1

    const/4 v0, 0x1

    .line 169
    iput-boolean v0, p0, Lorg/apache/avalon/framework/component/DefaultComponentManager;->m_readOnly:Z

    return-void
.end method

.method public put(Ljava/lang/String;Lorg/apache/avalon/framework/component/Component;)V
    .locals 1

    .line 108
    invoke-virtual {p0}, Lorg/apache/avalon/framework/component/DefaultComponentManager;->checkWriteable()V

    .line 109
    iget-object v0, p0, Lorg/apache/avalon/framework/component/DefaultComponentManager;->m_components:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public release(Lorg/apache/avalon/framework/component/Component;)V
    .locals 0

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 130
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 131
    iget-object v1, p0, Lorg/apache/avalon/framework/component/DefaultComponentManager;->m_components:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const-string v2, "Components:"

    .line 132
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 134
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 141
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const-string v2, "["

    .line 136
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 137
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    const-string v2, "]"

    .line 138
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0
.end method
