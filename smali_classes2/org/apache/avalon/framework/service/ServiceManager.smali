.class public interface abstract Lorg/apache/avalon/framework/service/ServiceManager;
.super Ljava/lang/Object;
.source "ServiceManager.java"


# virtual methods
.method public abstract hasService(Ljava/lang/String;)Z
.end method

.method public abstract lookup(Ljava/lang/String;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/avalon/framework/service/ServiceException;
        }
    .end annotation
.end method

.method public abstract release(Ljava/lang/Object;)V
.end method
