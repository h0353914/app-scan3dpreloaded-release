.class public interface abstract Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;
.super Ljava/lang/Object;
.source "IRestExecutor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor$IRestExecutorListener;,
        Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor$IRestExecutorProgressListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Output:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract execute()Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TOutput;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sonymobile/scan3d/storageservice/network/NetworkException;
        }
    .end annotation
.end method

.method public abstract execute(Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor$IRestExecutorProgressListener;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor$IRestExecutorProgressListener<",
            "TOutput;>;)TOutput;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sonymobile/scan3d/storageservice/network/NetworkException;
        }
    .end annotation
.end method

.method public abstract executeAsync(Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor$IRestExecutorListener;)Lcom/sonymobile/scan3d/storageservice/Cancellable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor$IRestExecutorListener<",
            "TOutput;>;)",
            "Lcom/sonymobile/scan3d/storageservice/Cancellable;"
        }
    .end annotation
.end method

.method public abstract getResponse()Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;
.end method
