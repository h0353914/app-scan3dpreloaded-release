.class public interface abstract Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor$IRestExecutorProgressListener;
.super Ljava/lang/Object;
.source "IRestExecutor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "IRestExecutorProgressListener"
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
.method public abstract onExecutionProgress(Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;Lcom/sonymobile/scan3d/storageservice/network/TransferProgress;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor<",
            "TOutput;>;",
            "Lcom/sonymobile/scan3d/storageservice/network/TransferProgress;",
            ")V"
        }
    .end annotation
.end method
