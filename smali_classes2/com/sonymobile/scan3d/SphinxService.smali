.class public Lcom/sonymobile/scan3d/SphinxService;
.super Landroid/app/Service;
.source "SphinxService.java"

# interfaces
.implements Lcom/sonymobile/scan3d/ISphinxManager;
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/SphinxService$LocalBinder;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "com.sonymobile.scan3d.SphinxService"


# instance fields
.field private mBinder:Landroid/os/Binder;

.field private mEngine:Lcom/sonymobile/scan3d/SphinxEngine;

.field private mExecutorService:Ljava/util/concurrent/ExecutorService;

.field private mHandler:Landroid/os/Handler;

.field private mListener:Lcom/sonymobile/scan3d/ISphinxManager$ISphinxListener;

.field private mSubmitCount:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 35
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 45
    new-instance v0, Lcom/sonymobile/scan3d/SphinxService$LocalBinder;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/SphinxService$LocalBinder;-><init>(Lcom/sonymobile/scan3d/SphinxService;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/SphinxService;->mBinder:Landroid/os/Binder;

    return-void
.end method

.method private keepAlive()V
    .locals 2

    .line 304
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/sonymobile/scan3d/SphinxService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/SphinxService;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method

.method private sendEvent(I)V
    .locals 1

    const/4 v0, 0x0

    .line 297
    invoke-direct {p0, p1, v0, v0}, Lcom/sonymobile/scan3d/SphinxService;->sendEvent(ILjava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method private sendEvent(ILjava/lang/Object;)V
    .locals 1

    const/4 v0, 0x0

    .line 288
    invoke-direct {p0, p1, p2, v0}, Lcom/sonymobile/scan3d/SphinxService;->sendEvent(ILjava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method private sendEvent(ILjava/lang/Object;Ljava/lang/Object;)V
    .locals 1

    .line 269
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxService;->mEngine:Lcom/sonymobile/scan3d/SphinxEngine;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/SphinxEngine;->isStopped()Z

    move-result v0

    if-nez v0, :cond_2

    .line 270
    new-instance v0, Lcom/sonymobile/scan3d/Event;

    invoke-direct {v0, p1}, Lcom/sonymobile/scan3d/Event;-><init>(I)V

    if-eqz p2, :cond_0

    .line 272
    invoke-virtual {v0, p2}, Lcom/sonymobile/scan3d/Event;->setArg1(Ljava/lang/Object;)V

    :cond_0
    if-eqz p3, :cond_1

    .line 275
    invoke-virtual {v0, p3}, Lcom/sonymobile/scan3d/Event;->setArg2(Ljava/lang/Object;)V

    .line 277
    :cond_1
    iget-object p1, p0, Lcom/sonymobile/scan3d/SphinxService;->mEngine:Lcom/sonymobile/scan3d/SphinxEngine;

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/SphinxEngine;->postEvent(Lcom/sonymobile/scan3d/Event;)Z

    :cond_2
    return-void
.end method


# virtual methods
.method public clearEnvironmentErrors()V
    .locals 1

    const/16 v0, 0xc

    .line 191
    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/SphinxService;->sendEvent(I)V

    return-void
.end method

.method public final handleMessage(Landroid/os/Message;)Z
    .locals 3

    .line 209
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x1

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_1

    .line 247
    :pswitch_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxService;->mListener:Lcom/sonymobile/scan3d/ISphinxManager$ISphinxListener;

    if-eqz v0, :cond_1

    .line 248
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-interface {v0, p1}, Lcom/sonymobile/scan3d/ISphinxManager$ISphinxListener;->onCameraTemperatureShutdown(Z)V

    goto :goto_1

    .line 242
    :pswitch_1
    iget-object p1, p0, Lcom/sonymobile/scan3d/SphinxService;->mListener:Lcom/sonymobile/scan3d/ISphinxManager$ISphinxListener;

    if-eqz p1, :cond_1

    .line 243
    invoke-interface {p1}, Lcom/sonymobile/scan3d/ISphinxManager$ISphinxListener;->onRestarting()V

    goto :goto_1

    .line 236
    :pswitch_2
    iget p1, p0, Lcom/sonymobile/scan3d/SphinxService;->mSubmitCount:I

    sub-int/2addr p1, v1

    iput p1, p0, Lcom/sonymobile/scan3d/SphinxService;->mSubmitCount:I

    if-gtz p1, :cond_1

    .line 238
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/SphinxService;->stopSelf()V

    goto :goto_1

    .line 226
    :pswitch_3
    iget-object p1, p0, Lcom/sonymobile/scan3d/SphinxService;->mListener:Lcom/sonymobile/scan3d/ISphinxManager$ISphinxListener;

    if-eqz p1, :cond_1

    .line 227
    invoke-interface {p1}, Lcom/sonymobile/scan3d/ISphinxManager$ISphinxListener;->onStarted()V

    goto :goto_1

    .line 216
    :pswitch_4
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxService;->mListener:Lcom/sonymobile/scan3d/ISphinxManager$ISphinxListener;

    if-eqz v0, :cond_1

    .line 217
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    sget-object v2, Lcom/sonymobile/scan3d/SphinxFocusType;->kFocusManual:Lcom/sonymobile/scan3d/SphinxFocusType;

    invoke-virtual {v2}, Lcom/sonymobile/scan3d/SphinxFocusType;->ordinal()I

    move-result v2

    if-ne p1, v2, :cond_0

    move p1, v1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    invoke-interface {v0, p1}, Lcom/sonymobile/scan3d/ISphinxManager$ISphinxListener;->onCameraOpened(Z)V

    goto :goto_1

    .line 211
    :pswitch_5
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxService;->mListener:Lcom/sonymobile/scan3d/ISphinxManager$ISphinxListener;

    if-eqz v0, :cond_1

    .line 212
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/sonymobile/scan3d/SphinxHint;

    invoke-interface {v0, p1}, Lcom/sonymobile/scan3d/ISphinxManager$ISphinxListener;->onHintReceived(Lcom/sonymobile/scan3d/SphinxHint;)V

    goto :goto_1

    .line 231
    :pswitch_6
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxService;->mListener:Lcom/sonymobile/scan3d/ISphinxManager$ISphinxListener;

    if-eqz v0, :cond_1

    .line 232
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, [Lcom/sonymobile/scan3d/EnvironmentError;

    invoke-interface {v0, p1}, Lcom/sonymobile/scan3d/ISphinxManager$ISphinxListener;->onErrorsReceived([Lcom/sonymobile/scan3d/EnvironmentError;)V

    goto :goto_1

    .line 221
    :pswitch_7
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxService;->mListener:Lcom/sonymobile/scan3d/ISphinxManager$ISphinxListener;

    if-eqz v0, :cond_1

    .line 222
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Landroid/net/Uri;

    invoke-interface {v0, p1}, Lcom/sonymobile/scan3d/ISphinxManager$ISphinxListener;->onFinished(Landroid/net/Uri;)V

    :cond_1
    :goto_1
    return v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 114
    invoke-direct {p0}, Lcom/sonymobile/scan3d/SphinxService;->keepAlive()V

    .line 115
    iget-object p1, p0, Lcom/sonymobile/scan3d/SphinxService;->mBinder:Landroid/os/Binder;

    return-object p1
.end method

.method public onCreate()V
    .locals 2

    .line 89
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 90
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/SphinxService;->mExecutorService:Ljava/util/concurrent/ExecutorService;

    .line 91
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0, p0}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/SphinxService;->mHandler:Landroid/os/Handler;

    .line 92
    sget-object v0, Lcom/sonymobile/scan3d/SphinxService;->TAG:Ljava/lang/String;

    const-string v1, "onCreate(): "

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/NativeLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onDestroy()V
    .locals 2

    .line 98
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 99
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxService;->mEngine:Lcom/sonymobile/scan3d/SphinxEngine;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 100
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/SphinxEngine;->stop()V

    .line 101
    iput-object v1, p0, Lcom/sonymobile/scan3d/SphinxService;->mEngine:Lcom/sonymobile/scan3d/SphinxEngine;

    .line 104
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxService;->mExecutorService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 106
    iput-object v1, p0, Lcom/sonymobile/scan3d/SphinxService;->mListener:Lcom/sonymobile/scan3d/ISphinxManager$ISphinxListener;

    .line 107
    sget-object v0, Lcom/sonymobile/scan3d/SphinxService;->TAG:Ljava/lang/String;

    const-string v1, "onDestroy(): "

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/NativeLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onSurfaceUpdate(ZLandroid/view/Surface;Landroid/util/Size;)V
    .locals 0

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    .line 163
    invoke-direct {p0, p1, p2, p3}, Lcom/sonymobile/scan3d/SphinxService;->sendEvent(ILjava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    const/4 p1, 0x7

    .line 165
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/SphinxService;->sendEvent(I)V

    :goto_0
    return-void
.end method

.method public onUnbind(Landroid/content/Intent;)Z
    .locals 0

    .line 121
    iget-object p1, p0, Lcom/sonymobile/scan3d/SphinxService;->mEngine:Lcom/sonymobile/scan3d/SphinxEngine;

    if-eqz p1, :cond_0

    .line 122
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/SphinxEngine;->stop()V

    goto :goto_0

    .line 125
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/SphinxService;->stopSelf()V

    :goto_0
    const/4 p1, 0x0

    .line 128
    iput-object p1, p0, Lcom/sonymobile/scan3d/SphinxService;->mListener:Lcom/sonymobile/scan3d/ISphinxManager$ISphinxListener;

    const/4 p1, 0x1

    return p1
.end method

.method public registerListener(Lcom/sonymobile/scan3d/ISphinxManager$ISphinxListener;)V
    .locals 0

    .line 171
    iput-object p1, p0, Lcom/sonymobile/scan3d/SphinxService;->mListener:Lcom/sonymobile/scan3d/ISphinxManager$ISphinxListener;

    return-void
.end method

.method public restart()V
    .locals 1

    const/16 v0, 0x9

    .line 157
    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/SphinxService;->sendEvent(I)V

    return-void
.end method

.method public setBlobScale(F)V
    .locals 1

    .line 195
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    const/4 v0, 0x4

    invoke-direct {p0, v0, p1}, Lcom/sonymobile/scan3d/SphinxService;->sendEvent(ILjava/lang/Object;)V

    return-void
.end method

.method public setCameraTemperature(Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;)V
    .locals 1

    .line 138
    sget-object v0, Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;->kWarm:Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;

    if-ne p1, v0, :cond_0

    const/16 v0, 0xa

    .line 139
    invoke-direct {p0, v0, p1}, Lcom/sonymobile/scan3d/SphinxService;->sendEvent(ILjava/lang/Object;)V

    goto :goto_0

    .line 140
    :cond_0
    sget-object v0, Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;->kHot:Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;

    if-ne p1, v0, :cond_1

    const/16 v0, 0xb

    .line 141
    invoke-direct {p0, v0, p1}, Lcom/sonymobile/scan3d/SphinxService;->sendEvent(ILjava/lang/Object;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public setLocaleIsRTL(Z)V
    .locals 1

    .line 181
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    const/16 v0, 0xd

    invoke-direct {p0, v0, p1}, Lcom/sonymobile/scan3d/SphinxService;->sendEvent(ILjava/lang/Object;)V

    return-void
.end method

.method public setManualFocusPosition(I)V
    .locals 1

    .line 176
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lcom/sonymobile/scan3d/SphinxService;->sendEvent(ILjava/lang/Object;)V

    return-void
.end method

.method public setNextDebugMode()V
    .locals 1

    const/4 v0, 0x6

    .line 200
    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/SphinxService;->sendEvent(I)V

    return-void
.end method

.method public setNextState(Z)V
    .locals 1

    .line 186
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    const/4 v0, 0x3

    invoke-direct {p0, v0, p1}, Lcom/sonymobile/scan3d/SphinxService;->sendEvent(ILjava/lang/Object;)V

    return-void
.end method

.method public start(I)V
    .locals 2

    .line 147
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxService;->mEngine:Lcom/sonymobile/scan3d/SphinxEngine;

    if-eqz v0, :cond_0

    .line 148
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/SphinxEngine;->stop()V

    .line 150
    :cond_0
    new-instance v0, Lcom/sonymobile/scan3d/SphinxEngine;

    iget-object v1, p0, Lcom/sonymobile/scan3d/SphinxService;->mHandler:Landroid/os/Handler;

    invoke-direct {v0, p0, p1, v1}, Lcom/sonymobile/scan3d/SphinxEngine;-><init>(Landroid/content/Context;ILandroid/os/Handler;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/SphinxService;->mEngine:Lcom/sonymobile/scan3d/SphinxEngine;

    .line 151
    iget-object p1, p0, Lcom/sonymobile/scan3d/SphinxService;->mExecutorService:Ljava/util/concurrent/ExecutorService;

    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxService;->mEngine:Lcom/sonymobile/scan3d/SphinxEngine;

    invoke-interface {p1, v0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 152
    iget p1, p0, Lcom/sonymobile/scan3d/SphinxService;->mSubmitCount:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/sonymobile/scan3d/SphinxService;->mSubmitCount:I

    return-void
.end method
