.class public interface abstract Lorg/apache/avalon/framework/component/ComponentSelector;
.super Ljava/lang/Object;
.source "ComponentSelector.java"

# interfaces
.implements Lorg/apache/avalon/framework/component/Component;


# virtual methods
.method public abstract hasComponent(Ljava/lang/Object;)Z
.end method

.method public abstract release(Lorg/apache/avalon/framework/component/Component;)V
.end method

.method public abstract select(Ljava/lang/Object;)Lorg/apache/avalon/framework/component/Component;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/avalon/framework/component/ComponentException;
        }
    .end annotation
.end method
