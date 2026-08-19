.class public interface abstract Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor$IRestExecutorListener;
.super Ljava/lang/Object;
.source "IRestExecutor.java"

# interfaces
.implements Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor$IRestExecutorProgressListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "IRestExecutorListener"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Output:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor$IRestExecutorProgressListener<",
        "TOutput;>;"
    }
.end annotation


# virtual methods
.method public abstract onExecutionCancelled(Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor<",
            "TOutput;>;)V"
        }
    .end annotation
.end method

.method public abstract onExecutionDone(Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor<",
            "TOutput;>;TOutput;)V"
        }
    .end annotation
.end method

.method public abstract onPreExecution(Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor<",
            "TOutput;>;)V"
        }
    .end annotation
.end method
