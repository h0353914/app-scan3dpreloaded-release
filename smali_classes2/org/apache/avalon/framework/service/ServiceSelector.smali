.class public interface abstract Lorg/apache/avalon/framework/service/ServiceSelector;
.super Ljava/lang/Object;
.source "ServiceSelector.java"


# virtual methods
.method public abstract isSelectable(Ljava/lang/Object;)Z
.end method

.method public abstract release(Ljava/lang/Object;)V
.end method

.method public abstract select(Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/avalon/framework/service/ServiceException;
        }
    .end annotation
.end method
