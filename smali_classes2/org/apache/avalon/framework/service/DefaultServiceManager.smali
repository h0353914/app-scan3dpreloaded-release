.class public Lorg/apache/avalon/framework/service/DefaultServiceManager;
.super Ljava/lang/Object;
.source "DefaultServiceManager.java"

# interfaces
.implements Lorg/apache/avalon/framework/service/ServiceManager;


# instance fields
.field private final m_objects:Ljava/util/HashMap;

.field private final m_parent:Lorg/apache/avalon/framework/service/ServiceManager;

.field private m_readOnly:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 37
    invoke-direct {p0, v0}, Lorg/apache/avalon/framework/service/DefaultServiceManager;-><init>(Lorg/apache/avalon/framework/service/ServiceManager;)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/avalon/framework/service/ServiceManager;)V
    .locals 1

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/avalon/framework/service/DefaultServiceManager;->m_objects:Ljava/util/HashMap;

    .line 47
    iput-object p1, p0, Lorg/apache/avalon/framework/service/DefaultServiceManager;->m_parent:Lorg/apache/avalon/framework/service/ServiceManager;

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

    .line 170
    iget-boolean v0, p0, Lorg/apache/avalon/framework/service/DefaultServiceManager;->m_readOnly:Z

    if-nez v0, :cond_0

    return-void

    .line 172
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "ServiceManager is read only and can not be modified"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected final getObjectMap()Ljava/util/Map;
    .locals 1

    .line 149
    iget-object v0, p0, Lorg/apache/avalon/framework/service/DefaultServiceManager;->m_objects:Ljava/util/HashMap;

    return-object v0
.end method

.method protected final getParent()Lorg/apache/avalon/framework/service/ServiceManager;
    .locals 1

    .line 139
    iget-object v0, p0, Lorg/apache/avalon/framework/service/DefaultServiceManager;->m_parent:Lorg/apache/avalon/framework/service/ServiceManager;

    return-object v0
.end method

.method public hasService(Ljava/lang/String;)Z
    .locals 0

    .line 88
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/apache/avalon/framework/service/DefaultServiceManager;->lookup(Ljava/lang/String;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p1, 0x1

    goto :goto_0

    :catch_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public lookup(Ljava/lang/String;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/avalon/framework/service/ServiceException;
        }
    .end annotation

    .line 60
    iget-object v0, p0, Lorg/apache/avalon/framework/service/DefaultServiceManager;->m_objects:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    .line 66
    :cond_0
    iget-object v0, p0, Lorg/apache/avalon/framework/service/DefaultServiceManager;->m_parent:Lorg/apache/avalon/framework/service/ServiceManager;

    if-eqz v0, :cond_1

    .line 68
    invoke-interface {v0, p1}, Lorg/apache/avalon/framework/service/ServiceManager;->lookup(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 72
    :cond_1
    new-instance v0, Lorg/apache/avalon/framework/service/ServiceException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Unable to provide implementation for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, p1, v1, v2}, Lorg/apache/avalon/framework/service/ServiceException;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method public makeReadOnly()V
    .locals 1

    const/4 v0, 0x1

    .line 158
    iput-boolean v0, p0, Lorg/apache/avalon/framework/service/DefaultServiceManager;->m_readOnly:Z

    return-void
.end method

.method public put(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    .line 106
    invoke-virtual {p0}, Lorg/apache/avalon/framework/service/DefaultServiceManager;->checkWriteable()V

    .line 107
    iget-object v0, p0, Lorg/apache/avalon/framework/service/DefaultServiceManager;->m_objects:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public release(Ljava/lang/Object;)V
    .locals 0

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 118
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 119
    iget-object v1, p0, Lorg/apache/avalon/framework/service/DefaultServiceManager;->m_objects:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const-string v2, "Services:"

    .line 120
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 122
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 129
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const-string v2, "["

    .line 124
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 125
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    const-string v2, "]"

    .line 126
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0
.end method
