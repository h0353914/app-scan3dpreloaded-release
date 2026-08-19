.class interface abstract Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$VideoRecorder;
.super Ljava/lang/Object;
.source "FaceMimicActivity.java"


# annotations
.annotation build Landroidx/annotation/VisibleForTesting;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x608
    name = "VideoRecorder"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$VideoRecorder$RecordingListener;
    }
.end annotation


# virtual methods
.method public abstract start(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Lcom/sonymobile/scan3d/NativeGLTextureView;Ljava/io/File;Ljava/io/File;Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$VideoRecorder$RecordingListener;JIIIIZ)V
    .annotation build Landroidx/annotation/MainThread;
    .end annotation
.end method

.method public abstract stop(Lcom/sonymobile/scan3d/NativeGLTextureView;)V
    .annotation build Landroidx/annotation/MainThread;
    .end annotation
.end method
