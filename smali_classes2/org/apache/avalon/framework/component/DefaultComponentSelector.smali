.class public Lorg/apache/avalon/framework/component/DefaultComponentSelector;
.super Ljava/lang/Object;
.source "DefaultComponentSelector.java"

# interfaces
.implements Lorg/apache/avalon/framework/component/ComponentSelector;


# instance fields
.field private final m_components:Ljava/util/HashMap;

.field private m_readOnly:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/avalon/framework/component/DefaultComponentSelector;->m_components:Ljava/util/HashMap;

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

    .line 119
    iget-boolean v0, p0, Lorg/apache/avalon/framework/component/DefaultComponentSelector;->m_readOnly:Z

    if-nez v0, :cond_0

    return-void

    .line 121
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "ComponentSelector is read only and can not be modified"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected final getComponentMap()Ljava/util/Map;
    .locals 1

    .line 100
    iget-object v0, p0, Lorg/apache/avalon/framework/component/DefaultComponentSelector;->m_components:Ljava/util/HashMap;

    return-object v0
.end method

.method public hasComponent(Ljava/lang/Object;)Z
    .locals 0

    .line 60
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/apache/avalon/framework/component/DefaultComponentSelector;->select(Ljava/lang/Object;)Lorg/apache/avalon/framework/component/Component;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/apache/avalon/framework/component/DefaultComponentSelector;->release(Lorg/apache/avalon/framework/component/Component;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p1, 0x1

    goto :goto_0

    :catch_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public makeReadOnly()V
    .locals 1

    const/4 v0, 0x1

    .line 108
    iput-boolean v0, p0, Lorg/apache/avalon/framework/component/DefaultComponentSelector;->m_readOnly:Z

    return-void
.end method

.method public put(Ljava/lang/Object;Lorg/apache/avalon/framework/component/Component;)V
    .locals 1

    .line 89
    invoke-virtual {p0}, Lorg/apache/avalon/framework/component/DefaultComponentSelector;->checkWriteable()V

    .line 90
    iget-object v0, p0, Lorg/apache/avalon/framework/component/DefaultComponentSelector;->m_components:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public release(Lorg/apache/avalon/framework/component/Component;)V
    .locals 0

    return-void
.end method

.method public select(Ljava/lang/Object;)Lorg/apache/avalon/framework/component/Component;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/avalon/framework/component/ComponentException;
        }
    .end annotation

    .line 37
    iget-object v0, p0, Lorg/apache/avalon/framework/component/DefaultComponentSelector;->m_components:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/avalon/framework/component/Component;

    if-eqz v0, :cond_0

    return-object v0

    .line 45
    :cond_0
    new-instance v0, Lorg/apache/avalon/framework/component/ComponentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "Unable to provide implementation."

    invoke-direct {v0, p1, v1}, Lorg/apache/avalon/framework/component/ComponentException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0
.end method
