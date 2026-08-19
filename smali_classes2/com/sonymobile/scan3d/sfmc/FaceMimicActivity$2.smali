.class final Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$2;
.super Ljava/lang/Object;
.source "FaceMimicActivity.java"

# interfaces
.implements Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$VideoRecorder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 441
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic lambda$start$0(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Ljava/io/File;Ljava/io/File;Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$VideoRecorder$RecordingListener;)V
    .locals 1

    .line 447
    new-instance v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$SaveVideoTask;

    invoke-static {p0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->access$000(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)Ljava/util/concurrent/atomic/AtomicReference;

    move-result-object p0

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$SaveVideoTask;-><init>(Ljava/util/concurrent/atomic/AtomicReference;Ljava/io/File;Ljava/io/File;Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$VideoRecorder$RecordingListener;)V

    const/4 p0, 0x0

    new-array p0, p0, [Ljava/lang/Void;

    invoke-virtual {v0, p0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$SaveVideoTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method


# virtual methods
.method public start(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Lcom/sonymobile/scan3d/NativeGLTextureView;Ljava/io/File;Ljava/io/File;Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$VideoRecorder$RecordingListener;JIIIIZ)V
    .locals 10

    .line 445
    new-instance v2, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$2$L6aVZEvTD36-IYv4YfH1UFxXxy4;

    move-object v0, p1

    move-object v1, p3

    move-object v3, p4

    move-object v4, p5

    invoke-direct {v2, p1, p3, p4, p5}, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$2$L6aVZEvTD36-IYv4YfH1UFxXxy4;-><init>(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Ljava/io/File;Ljava/io/File;Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$VideoRecorder$RecordingListener;)V

    move-object v0, p2

    move-wide/from16 v3, p6

    move/from16 v5, p8

    move/from16 v6, p9

    move/from16 v7, p10

    move/from16 v8, p11

    move/from16 v9, p12

    invoke-virtual/range {v0 .. v9}, Lcom/sonymobile/scan3d/NativeGLTextureView;->startEncoder(Ljava/io/File;Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderListener;JIIIIZ)V

    return-void
.end method

.method public stop(Lcom/sonymobile/scan3d/NativeGLTextureView;)V
    .locals 0

    .line 453
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/NativeGLTextureView;->stopEncoder()V

    return-void
.end method
