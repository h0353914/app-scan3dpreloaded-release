.class public interface abstract Lcom/sonymobile/scan3d/storageservice/ui/upload/IStatusListener;
.super Ljava/lang/Object;
.source "IStatusListener.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract onCancel(I)V
.end method

.method public abstract onDismiss(I)V
.end method

.method public abstract onFailure(II)V
.end method

.method public abstract onSuccess(ILjava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)V"
        }
    .end annotation
.end method
