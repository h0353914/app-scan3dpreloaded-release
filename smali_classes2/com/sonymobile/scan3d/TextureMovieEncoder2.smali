.class public Lcom/sonymobile/scan3d/TextureMovieEncoder2;
.super Ljava/lang/Object;
.source "TextureMovieEncoder2.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderHandler;,
        Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderListener;
    }
.end annotation


# static fields
.field private static final MSG_FRAME_AVAILABLE:I = 0x2

.field private static final MSG_STOP_RECORDING:I = 0x1

.field private static final TAG:Ljava/lang/String; = "com.sonymobile.scan3d.TextureMovieEncoder2"

.field private static final VERBOSE:Z = false


# instance fields
.field private mEncoderListener:Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderListener;

.field private volatile mHandler:Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderHandler;

.field private mReady:Z

.field private final mReadyFence:Ljava/lang/Object;

.field private mRunning:Z

.field private mVideoRecorder:Lcom/sonymobile/scan3d/recording/VideoRecorder;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/sonymobile/scan3d/recording/VideoRecorder;Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderListener;)V
    .locals 1

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/TextureMovieEncoder2;->mReadyFence:Ljava/lang/Object;

    .line 87
    iput-object p1, p0, Lcom/sonymobile/scan3d/TextureMovieEncoder2;->mVideoRecorder:Lcom/sonymobile/scan3d/recording/VideoRecorder;

    .line 88
    iput-object p2, p0, Lcom/sonymobile/scan3d/TextureMovieEncoder2;->mEncoderListener:Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderListener;

    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .line 51
    sget-object v0, Lcom/sonymobile/scan3d/TextureMovieEncoder2;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/sonymobile/scan3d/TextureMovieEncoder2;)V
    .locals 0

    .line 51
    invoke-direct {p0}, Lcom/sonymobile/scan3d/TextureMovieEncoder2;->handleStopRecording()V

    return-void
.end method

.method static synthetic access$200(Lcom/sonymobile/scan3d/TextureMovieEncoder2;)V
    .locals 0

    .line 51
    invoke-direct {p0}, Lcom/sonymobile/scan3d/TextureMovieEncoder2;->handleFrameAvailable()V

    return-void
.end method

.method private handleFrameAvailable()V
    .locals 2

    .line 219
    iget-object v0, p0, Lcom/sonymobile/scan3d/TextureMovieEncoder2;->mVideoRecorder:Lcom/sonymobile/scan3d/recording/VideoRecorder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/recording/VideoRecorder;->onFrameAvailable(Z)V

    return-void
.end method

.method private handleStopRecording()V
    .locals 2

    .line 226
    sget-object v0, Lcom/sonymobile/scan3d/TextureMovieEncoder2;->TAG:Ljava/lang/String;

    const-string v1, "handleStopRecording"

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 227
    iget-object v0, p0, Lcom/sonymobile/scan3d/TextureMovieEncoder2;->mVideoRecorder:Lcom/sonymobile/scan3d/recording/VideoRecorder;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/recording/VideoRecorder;->onFrameAvailable(Z)V

    .line 228
    iget-object v0, p0, Lcom/sonymobile/scan3d/TextureMovieEncoder2;->mVideoRecorder:Lcom/sonymobile/scan3d/recording/VideoRecorder;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/recording/VideoRecorder;->release()V

    return-void
.end method


# virtual methods
.method public frameAvailableSoon()V
    .locals 3

    .line 141
    iget-object v0, p0, Lcom/sonymobile/scan3d/TextureMovieEncoder2;->mReadyFence:Ljava/lang/Object;

    monitor-enter v0

    .line 142
    :try_start_0
    iget-boolean v1, p0, Lcom/sonymobile/scan3d/TextureMovieEncoder2;->mReady:Z

    if-nez v1, :cond_0

    .line 143
    monitor-exit v0

    return-void

    .line 145
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 147
    iget-object v0, p0, Lcom/sonymobile/scan3d/TextureMovieEncoder2;->mHandler:Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderHandler;

    iget-object v1, p0, Lcom/sonymobile/scan3d/TextureMovieEncoder2;->mHandler:Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderHandler;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderHandler;->sendMessage(Landroid/os/Message;)Z

    return-void

    :catchall_0
    move-exception v1

    .line 145
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public isRecording()Z
    .locals 2

    .line 129
    iget-object v0, p0, Lcom/sonymobile/scan3d/TextureMovieEncoder2;->mReadyFence:Ljava/lang/Object;

    monitor-enter v0

    .line 130
    :try_start_0
    iget-boolean v1, p0, Lcom/sonymobile/scan3d/TextureMovieEncoder2;->mRunning:Z

    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    .line 131
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public run()V
    .locals 3

    .line 158
    invoke-static {}, Landroid/os/Looper;->prepare()V

    .line 159
    iget-object v0, p0, Lcom/sonymobile/scan3d/TextureMovieEncoder2;->mReadyFence:Ljava/lang/Object;

    monitor-enter v0

    .line 160
    :try_start_0
    new-instance v1, Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderHandler;

    iget-object v2, p0, Lcom/sonymobile/scan3d/TextureMovieEncoder2;->mEncoderListener:Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderListener;

    invoke-direct {v1, p0, v2}, Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderHandler;-><init>(Lcom/sonymobile/scan3d/TextureMovieEncoder2;Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderListener;)V

    iput-object v1, p0, Lcom/sonymobile/scan3d/TextureMovieEncoder2;->mHandler:Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderHandler;

    const/4 v1, 0x1

    .line 161
    iput-boolean v1, p0, Lcom/sonymobile/scan3d/TextureMovieEncoder2;->mReady:Z

    .line 162
    iget-object v1, p0, Lcom/sonymobile/scan3d/TextureMovieEncoder2;->mReadyFence:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notify()V

    .line 163
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 164
    invoke-static {}, Landroid/os/Looper;->loop()V

    .line 166
    iget-object v1, p0, Lcom/sonymobile/scan3d/TextureMovieEncoder2;->mReadyFence:Ljava/lang/Object;

    monitor-enter v1

    const/4 v0, 0x0

    .line 167
    :try_start_1
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/TextureMovieEncoder2;->mReady:Z

    .line 168
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/TextureMovieEncoder2;->mRunning:Z

    const/4 v0, 0x0

    .line 169
    iput-object v0, p0, Lcom/sonymobile/scan3d/TextureMovieEncoder2;->mHandler:Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderHandler;

    .line 170
    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_1
    move-exception v1

    .line 163
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v1
.end method

.method public startEncoder()V
    .locals 3

    .line 95
    iget-object v0, p0, Lcom/sonymobile/scan3d/TextureMovieEncoder2;->mReadyFence:Ljava/lang/Object;

    monitor-enter v0

    .line 96
    :try_start_0
    iget-boolean v1, p0, Lcom/sonymobile/scan3d/TextureMovieEncoder2;->mRunning:Z

    if-eqz v1, :cond_0

    .line 97
    monitor-exit v0

    return-void

    :cond_0
    const/4 v1, 0x1

    .line 99
    iput-boolean v1, p0, Lcom/sonymobile/scan3d/TextureMovieEncoder2;->mRunning:Z

    .line 100
    new-instance v1, Ljava/lang/Thread;

    const-string v2, "TextureMovieEncoder"

    invoke-direct {v1, p0, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 101
    :catch_0
    :goto_0
    iget-boolean v1, p0, Lcom/sonymobile/scan3d/TextureMovieEncoder2;->mReady:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_1

    .line 103
    :try_start_1
    iget-object v1, p0, Lcom/sonymobile/scan3d/TextureMovieEncoder2;->mReadyFence:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 108
    :cond_1
    :try_start_2
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method public stopRecording()V
    .locals 3

    .line 120
    iget-object v0, p0, Lcom/sonymobile/scan3d/TextureMovieEncoder2;->mHandler:Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderHandler;

    iget-object v1, p0, Lcom/sonymobile/scan3d/TextureMovieEncoder2;->mHandler:Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderHandler;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderHandler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method
