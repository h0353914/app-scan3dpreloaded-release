.class Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderHandler;
.super Landroid/os/Handler;
.source "TextureMovieEncoder2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/TextureMovieEncoder2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "EncoderHandler"
.end annotation


# instance fields
.field private mEncoderListener:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderListener;",
            ">;"
        }
    .end annotation
.end field

.field private mWeakEncoder:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/sonymobile/scan3d/TextureMovieEncoder2;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/sonymobile/scan3d/TextureMovieEncoder2;Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderListener;)V
    .locals 1

    .line 180
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 181
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderHandler;->mWeakEncoder:Ljava/lang/ref/WeakReference;

    .line 182
    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderHandler;->mEncoderListener:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method static synthetic lambda$handleMessage$0(Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderListener;)V
    .locals 0

    .line 202
    invoke-interface {p0}, Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderListener;->onEncoderFinished()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3

    .line 187
    iget v0, p1, Landroid/os/Message;->what:I

    .line 188
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 190
    iget-object p1, p0, Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderHandler;->mWeakEncoder:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/sonymobile/scan3d/TextureMovieEncoder2;

    if-nez p1, :cond_0

    .line 192
    invoke-static {}, Lcom/sonymobile/scan3d/TextureMovieEncoder2;->access$000()Ljava/lang/String;

    move-result-object p1

    const-string v0, "EncoderHandler.handleMessage: encoder is null"

    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/logging/DebugLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    packed-switch v0, :pswitch_data_0

    .line 209
    new-instance p1, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unhandled msg what="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 206
    :pswitch_0
    invoke-static {p1}, Lcom/sonymobile/scan3d/TextureMovieEncoder2;->access$200(Lcom/sonymobile/scan3d/TextureMovieEncoder2;)V

    goto :goto_0

    .line 198
    :pswitch_1
    invoke-static {p1}, Lcom/sonymobile/scan3d/TextureMovieEncoder2;->access$100(Lcom/sonymobile/scan3d/TextureMovieEncoder2;)V

    .line 199
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Looper;->quit()V

    .line 200
    iget-object p1, p0, Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderHandler;->mEncoderListener:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderListener;

    if-eqz p1, :cond_1

    .line 202
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcom/sonymobile/scan3d/-$$Lambda$TextureMovieEncoder2$EncoderHandler$RDJwIYsWRbQM3uylw_A1uwczrjE;

    invoke-direct {v1, p1}, Lcom/sonymobile/scan3d/-$$Lambda$TextureMovieEncoder2$EncoderHandler$RDJwIYsWRbQM3uylw_A1uwczrjE;-><init>(Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderListener;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_1
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
