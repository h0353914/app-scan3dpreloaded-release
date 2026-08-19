.class public interface abstract Lorg/apache/avalon/framework/component/ComponentManager;
.super Ljava/lang/Object;
.source "ComponentManager.java"


# virtual methods
.method public abstract hasComponent(Ljava/lang/String;)Z
.end method

.method public abstract lookup(Ljava/lang/String;)Lorg/apache/avalon/framework/component/Component;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/avalon/framework/component/ComponentException;
        }
    .end annotation
.end method

.method public abstract release(Lorg/apache/avalon/framework/component/Component;)V
.end method
