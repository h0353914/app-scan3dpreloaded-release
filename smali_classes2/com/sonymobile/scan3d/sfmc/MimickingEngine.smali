.class interface abstract Lcom/sonymobile/scan3d/sfmc/MimickingEngine;
.super Ljava/lang/Object;
.source "MimickingEngine.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener;
    }
.end annotation


# virtual methods
.method public abstract done()V
    .annotation build Lcom/sonymobile/scan3d/sfmc/GlThread;
    .end annotation
.end method

.method public abstract init(Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener;)V
    .annotation build Lcom/sonymobile/scan3d/sfmc/GlThread;
    .end annotation
.end method

.method public abstract loadTarget([B[B)Z
    .annotation build Lcom/sonymobile/scan3d/sfmc/GlThread;
    .end annotation
.end method

.method public abstract release()V
    .annotation build Landroidx/annotation/AnyThread;
    .end annotation
.end method

.method public abstract render()V
    .annotation build Lcom/sonymobile/scan3d/sfmc/GlThread;
    .end annotation
.end method

.method public abstract runOneIteration()V
    .annotation build Lcom/sonymobile/scan3d/sfmc/GlThread;
    .end annotation
.end method

.method public abstract setDisplaySize(II)V
    .annotation build Lcom/sonymobile/scan3d/sfmc/GlThread;
    .end annotation
.end method

.method public abstract setImageProvider(Lcom/sonymobile/scan3d/CameraImageProvider;)V
    .annotation build Lcom/sonymobile/scan3d/sfmc/GlThread;
    .end annotation
.end method

.method public abstract setProperty(Ljava/lang/String;F)V
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/AnyThread;
    .end annotation
.end method
