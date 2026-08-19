.class Lcom/sonymobile/scan3d/sfmc/Sfmc;
.super Ljava/lang/Object;
.source "Sfmc.java"

# interfaces
.implements Lcom/sonymobile/scan3d/sfmc/MimickingEngine;


# static fields
.field private static final STATES:[Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;


# instance fields
.field private mNativeHandle:J

.field private mStateListener:Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 113
    invoke-static {}, Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;->values()[Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;

    move-result-object v0

    sput-object v0, Lcom/sonymobile/scan3d/sfmc/Sfmc;->STATES:[Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;

    return-void
.end method

.method public constructor <init>()V
    .locals 2
    .annotation build Landroidx/annotation/AnyThread;
    .end annotation

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    invoke-static {}, Lcom/sonymobile/scan3d/sfmc/Sfmc;->nativeConstructor()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/sonymobile/scan3d/sfmc/Sfmc;->mNativeHandle:J

    return-void
.end method

.method private checkHandle()V
    .locals 4

    .line 120
    iget-wide v0, p0, Lcom/sonymobile/scan3d/sfmc/Sfmc;->mNativeHandle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Not initialized / Already released!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static native nativeConstructor()J
.end method

.method private native nativeDestructor()V
.end method

.method private native nativeDone()V
.end method

.method private native nativeInit()V
.end method

.method private native nativeLoadTargetFromMemory([B[B)Z
.end method

.method private native nativeRender()V
.end method

.method private native nativeRunOneIteration()V
.end method

.method private native nativeSetDisplaySize(II)V
.end method

.method private native nativeSetImageProvider(J)V
.end method

.method private native nativeSetProperty(Ljava/lang/String;F)V
.end method

.method private nativeStateChangedCb(I)V
    .locals 2

    .line 125
    sget-object v0, Lcom/sonymobile/scan3d/sfmc/Sfmc;->STATES:[Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;

    array-length v1, v0

    if-ge p1, v1, :cond_0

    iget-object v1, p0, Lcom/sonymobile/scan3d/sfmc/Sfmc;->mStateListener:Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener;

    if-eqz v1, :cond_0

    .line 126
    aget-object p1, v0, p1

    invoke-interface {v1, p1}, Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener;->onStateChanged(Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public done()V
    .locals 0
    .annotation build Lcom/sonymobile/scan3d/sfmc/GlThread;
    .end annotation

    .line 87
    invoke-direct {p0}, Lcom/sonymobile/scan3d/sfmc/Sfmc;->checkHandle()V

    .line 88
    invoke-direct {p0}, Lcom/sonymobile/scan3d/sfmc/Sfmc;->nativeDone()V

    return-void
.end method

.method public init(Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener;)V
    .locals 0
    .annotation build Lcom/sonymobile/scan3d/sfmc/GlThread;
    .end annotation

    .line 55
    invoke-direct {p0}, Lcom/sonymobile/scan3d/sfmc/Sfmc;->checkHandle()V

    .line 56
    iput-object p1, p0, Lcom/sonymobile/scan3d/sfmc/Sfmc;->mStateListener:Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener;

    .line 57
    invoke-direct {p0}, Lcom/sonymobile/scan3d/sfmc/Sfmc;->nativeInit()V

    const/4 p1, 0x0

    .line 60
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/sfmc/Sfmc;->nativeStateChangedCb(I)V

    return-void
.end method

.method public loadTarget([B[B)Z
    .locals 0
    .annotation build Lcom/sonymobile/scan3d/sfmc/GlThread;
    .end annotation

    .line 48
    invoke-direct {p0}, Lcom/sonymobile/scan3d/sfmc/Sfmc;->checkHandle()V

    .line 49
    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/sfmc/Sfmc;->nativeLoadTargetFromMemory([B[B)Z

    move-result p1

    return p1
.end method

.method public release()V
    .locals 2
    .annotation build Landroidx/annotation/AnyThread;
    .end annotation

    .line 33
    invoke-direct {p0}, Lcom/sonymobile/scan3d/sfmc/Sfmc;->checkHandle()V

    .line 34
    invoke-direct {p0}, Lcom/sonymobile/scan3d/sfmc/Sfmc;->nativeDestructor()V

    const-wide/16 v0, 0x0

    .line 35
    iput-wide v0, p0, Lcom/sonymobile/scan3d/sfmc/Sfmc;->mNativeHandle:J

    return-void
.end method

.method public render()V
    .locals 0
    .annotation build Lcom/sonymobile/scan3d/sfmc/GlThread;
    .end annotation

    .line 73
    invoke-direct {p0}, Lcom/sonymobile/scan3d/sfmc/Sfmc;->checkHandle()V

    .line 74
    invoke-direct {p0}, Lcom/sonymobile/scan3d/sfmc/Sfmc;->nativeRender()V

    return-void
.end method

.method public runOneIteration()V
    .locals 0
    .annotation build Lcom/sonymobile/scan3d/sfmc/GlThread;
    .end annotation

    .line 80
    invoke-direct {p0}, Lcom/sonymobile/scan3d/sfmc/Sfmc;->checkHandle()V

    .line 81
    invoke-direct {p0}, Lcom/sonymobile/scan3d/sfmc/Sfmc;->nativeRunOneIteration()V

    return-void
.end method

.method public setDisplaySize(II)V
    .locals 0
    .annotation build Lcom/sonymobile/scan3d/sfmc/GlThread;
    .end annotation

    .line 66
    invoke-direct {p0}, Lcom/sonymobile/scan3d/sfmc/Sfmc;->checkHandle()V

    .line 67
    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/sfmc/Sfmc;->nativeSetDisplaySize(II)V

    return-void
.end method

.method public setImageProvider(Lcom/sonymobile/scan3d/CameraImageProvider;)V
    .locals 2
    .annotation build Lcom/sonymobile/scan3d/sfmc/GlThread;
    .end annotation

    .line 41
    invoke-direct {p0}, Lcom/sonymobile/scan3d/sfmc/Sfmc;->checkHandle()V

    if-nez p1, :cond_0

    const-wide/16 v0, 0x0

    goto :goto_0

    .line 42
    :cond_0
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/CameraImageProvider;->getNativeHandle()J

    move-result-wide v0

    :goto_0
    invoke-direct {p0, v0, v1}, Lcom/sonymobile/scan3d/sfmc/Sfmc;->nativeSetImageProvider(J)V

    return-void
.end method

.method public setProperty(Ljava/lang/String;F)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/AnyThread;
    .end annotation

    if-eqz p1, :cond_0

    .line 95
    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/sfmc/Sfmc;->nativeSetProperty(Ljava/lang/String;F)V

    return-void

    .line 94
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "key cannot be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
