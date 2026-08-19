.class public Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;
.super Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;
.source "ShareAsVideoFragment.java"

# interfaces
.implements Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderListener;
.implements Landroid/os/Handler$Callback;


# static fields
.field private static final CAMERA_NAME:Ljava/lang/String; = "video_share"

.field private static final FRAME_PERIOD_NS:J = 0x1fca055L

.field private static final KEY_IS_PROP:Ljava/lang/String; = "is_prop"

.field private static final KEY_SHAREABLE:Ljava/lang/String; = "extra_shareable"


# instance fields
.field private mBackgroundTaskState:Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;

.field private mCameraIndex:I

.field private mHandler:Landroid/os/Handler;

.field private mProgress:Landroid/widget/ProgressBar;

.field private mPropLoaded:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 35
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;-><init>()V

    .line 42
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0, p0}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mHandler:Landroid/os/Handler;

    const/4 v0, -0x1

    .line 68
    iput v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mCameraIndex:I

    const/4 v0, 0x0

    .line 73
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mPropLoaded:Z

    .line 78
    sget-object v0, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;->IDLE:Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mBackgroundTaskState:Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;

    return-void
.end method

.method static synthetic access$000(Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;)Landroid/os/Handler;
    .locals 0

    .line 35
    iget-object p0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mHandler:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$100(Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;)I
    .locals 0

    .line 35
    iget p0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mCameraIndex:I

    return p0
.end method

.method static synthetic access$200(Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;)Landroid/widget/ProgressBar;
    .locals 0

    .line 35
    iget-object p0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mProgress:Landroid/widget/ProgressBar;

    return-object p0
.end method

.method public static synthetic lambda$2XAmD5xUacoZvEyyZznt2uV20W0(Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->onCameraAnimationLoaded()V

    return-void
.end method

.method public static synthetic lambda$loadCameraAnimation$2(Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;)V
    .locals 4

    const-string v0, "res:data/cam_animation.glb"

    .line 197
    iget v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mCameraIndex:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    if-eqz v1, :cond_0

    .line 198
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->getPassword(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v0, v2, v3}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->loadContent(Ljava/lang/String;Ljava/lang/String;Z)I

    move-result v0

    iput v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mCameraIndex:I

    .line 200
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ShareAsVideoFragment$2XAmD5xUacoZvEyyZznt2uV20W0;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ShareAsVideoFragment$2XAmD5xUacoZvEyyZznt2uV20W0;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method public static synthetic lambda$loadProp$1(Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;Ljava/lang/String;)V
    .locals 2

    .line 185
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    if-eqz v0, :cond_0

    .line 186
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->getPassword(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 187
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v1, p1, v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->load(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mPropLoaded:Z

    :cond_0
    return-void
.end method

.method public static synthetic lambda$onCameraAnimationLoaded$3(Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;)V
    .locals 4

    .line 208
    iget v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mCameraIndex:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    return-void

    .line 211
    :cond_0
    sget-object v0, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;->RUNNING:Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mBackgroundTaskState:Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;

    .line 212
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "sharevideo_temp.mp4"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 213
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    const-wide/32 v2, -0x1fca055

    invoke-virtual {v1, v0, p0, v2, v3}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->startEncoder(Ljava/io/File;Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderListener;J)V

    .line 214
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    iget v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mCameraIndex:I

    const-string v2, "video_share"

    invoke-virtual {v0, v1, v2}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->setCamera(ILjava/lang/String;)Z

    .line 215
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->setPostProcShading(Z)V

    .line 216
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    iget v2, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mCameraIndex:I

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->startAnimationNoWarmup(II)Z

    .line 217
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->requestRender()V

    .line 218
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    iget v2, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mCameraIndex:I

    invoke-virtual {v0, v2, v3}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->getAnimationDuration(II)F

    move-result v0

    .line 219
    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mProgress:Landroid/widget/ProgressBar;

    const/high16 v3, 0x447a0000    # 1000.0f

    mul-float/2addr v0, v3

    float-to-int v0, v0

    invoke-virtual {v2, v0}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 221
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    new-instance v2, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment$1;

    invoke-direct {v2, p0}, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment$1;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;)V

    invoke-virtual {v0, v2, v1}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->setAnimationListener(Lcom/sonymobile/scan3d/viewer/SphanGLTextureView$AnimationListener;Z)V

    return-void
.end method

.method public static synthetic lambda$onViewCreated$0(Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;)V
    .locals 3

    .line 93
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    if-eqz v0, :cond_1

    .line 94
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v1, "is_prop"

    .line 95
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 96
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->setBackground(I)V

    .line 97
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0, v1, v1}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->setMeshVisible(IZ)Z

    .line 98
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    const/4 v2, 0x1

    invoke-virtual {v0, v2, v1}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->setMeshVisible(IZ)Z

    goto :goto_0

    .line 101
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->showStaticMesh()V

    :cond_1
    :goto_0
    return-void
.end method

.method public static synthetic lambda$resetSphanRenderer$4(Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;)V
    .locals 3

    .line 286
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    if-eqz v0, :cond_1

    .line 287
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->setPostProcShading(Z)V

    .line 288
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->resetCamera()V

    .line 289
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->resetView()V

    .line 290
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    iget v2, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mCameraIndex:I

    invoke-virtual {v0, v2}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->unload(I)Z

    .line 291
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mPropLoaded:Z

    const/4 v2, -0x1

    if-eqz v0, :cond_0

    .line 292
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0, v2}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->unload(I)Z

    .line 293
    iput-boolean v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mPropLoaded:Z

    .line 295
    :cond_0
    iput v2, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mCameraIndex:I

    .line 296
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->removeAnimationListener()V

    :cond_1
    return-void
.end method

.method private loadCameraAnimation()V
    .locals 2

    .line 194
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    new-instance v1, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ShareAsVideoFragment$Gx-UVLZppe0ZrQgRbs8MS7vruF8;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ShareAsVideoFragment$Gx-UVLZppe0ZrQgRbs8MS7vruF8;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;)V

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->queueEvent(Ljava/lang/Runnable;)V

    return-void
.end method

.method private loadProp(Ljava/lang/String;)V
    .locals 2

    .line 183
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mPropLoaded:Z

    if-nez v0, :cond_0

    .line 184
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    new-instance v1, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ShareAsVideoFragment$JOOlNnySeOcNvxNe5Oh7127y0D0;

    invoke-direct {v1, p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ShareAsVideoFragment$JOOlNnySeOcNvxNe5Oh7127y0D0;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->queueEvent(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public static newInstance(Lcom/sonymobile/scan3d/viewer/sharing/Shareable;)Landroidx/fragment/app/Fragment;
    .locals 4

    .line 81
    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;-><init>()V

    .line 82
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "extra_shareable"

    .line 83
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->toBundle()Landroid/os/Bundle;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    const-string v2, "is_prop"

    .line 84
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->getShareType()Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    move-result-object p0

    sget-object v3, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->PROPS:Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    if-ne p0, v3, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    invoke-virtual {v1, v2, p0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 85
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    return-object v0
.end method

.method private onCameraAnimationLoaded()V
    .locals 2

    .line 206
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    new-instance v1, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ShareAsVideoFragment$ZRTgNbtp7fstl7wEWBNFJ-nN9LM;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ShareAsVideoFragment$ZRTgNbtp7fstl7wEWBNFJ-nN9LM;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;)V

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->queueEvent(Ljava/lang/Runnable;)V

    return-void
.end method

.method private resetSphanRenderer()V
    .locals 2

    .line 285
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    new-instance v1, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ShareAsVideoFragment$9E-dHVA4b_QnMO0q0JUusItqHqU;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ShareAsVideoFragment$9E-dHVA4b_QnMO0q0JUusItqHqU;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;)V

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->queueEvent(Ljava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public getContentLayout()I
    .locals 1

    const v0, 0x7f0c00af

    return v0
.end method

.method public getTextureViewId()I
    .locals 1

    const v0, 0x7f0900e1

    return v0
.end method

.method public handleMessage(Landroid/os/Message;)Z
    .locals 3

    .line 259
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_0

    return v1

    .line 270
    :pswitch_0
    sget-object p1, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;->FINISHED:Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mBackgroundTaskState:Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;

    .line 271
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f100121

    invoke-static {p1, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p1

    .line 272
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 273
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-static {p1, v1}, Lcom/sonymobile/scan3d/utils/SystemUtils;->setCurrentOrientation(Landroid/app/Activity;Z)V

    return v2

    .line 261
    :pswitch_1
    sget-object v0, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;->FINISHED:Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mBackgroundTaskState:Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;

    .line 262
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Landroid/content/Intent;

    .line 263
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->startActivity(Landroid/content/Intent;)V

    .line 265
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p1

    const-class v0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;

    .line 266
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 265
    invoke-virtual {p1, v0, v2}, Landroidx/fragment/app/FragmentManager;->popBackStackImmediate(Ljava/lang/String;I)Z

    .line 267
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-static {p1, v1}, Lcom/sonymobile/scan3d/utils/SystemUtils;->setCurrentOrientation(Landroid/app/Activity;Z)V

    return v2

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onBackPressed()Z
    .locals 2

    .line 119
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->popBackStack()V

    .line 120
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mProgress:Landroid/widget/ProgressBar;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    if-eqz v0, :cond_0

    .line 121
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mProgress:Landroid/widget/ProgressBar;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 122
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->resetSphanRenderer()V

    .line 123
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->stopEncoder()V

    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public onDetach()V
    .locals 2

    .line 139
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->onDetach()V

    .line 140
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    if-eqz v0, :cond_0

    .line 141
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->resetSphanRenderer()V

    .line 143
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/utils/SystemUtils;->setCurrentOrientation(Landroid/app/Activity;Z)V

    return-void
.end method

.method public onEncoderFinished()V
    .locals 3

    .line 251
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 252
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mHandler:Landroid/os/Handler;

    const-string v2, "sharevideo_temp.mp4"

    invoke-static {v0, v1, v2}, Lcom/sonymobile/scan3d/utils/SharingUtil;->saveVideo(Landroid/content/Context;Landroid/os/Handler;Ljava/lang/String;)V

    .line 253
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->resetSphanRenderer()V

    :cond_0
    return-void
.end method

.method public onMeshesLoadedIntoSphan(ZZ)V
    .locals 1

    .line 174
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    if-eqz p1, :cond_0

    const-string p2, "is_prop"

    .line 175
    invoke-virtual {p1, p2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 176
    new-instance p2, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    const-string v0, "extra_shareable"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;-><init>(Landroid/os/Bundle;)V

    .line 177
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->getUrl()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->loadProp(Ljava/lang/String;)V

    .line 179
    :cond_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->loadCameraAnimation()V

    return-void
.end method

.method public onPause()V
    .locals 2

    .line 130
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->onPause()V

    .line 132
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    return-void
.end method

.method public onStart(Lcom/sonymobile/scan3d/SimpleLifecycle$SimpleLifecycleOwner;)V
    .locals 1

    .line 148
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->setBackground(I)V

    .line 149
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->setPlainShading(Z)V

    return-void
.end method

.method public onStop(Lcom/sonymobile/scan3d/SimpleLifecycle$SimpleLifecycleOwner;)V
    .locals 2

    .line 155
    iget p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mCameraIndex:I

    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    .line 156
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    iget v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mCameraIndex:I

    invoke-virtual {p1, v1}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->unload(I)Z

    .line 158
    :cond_0
    iget-boolean p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mPropLoaded:Z

    if-eqz p1, :cond_1

    .line 159
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->unload(I)Z

    .line 161
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    const/4 v0, 0x1

    invoke-virtual {p1, v0, v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->setMeshVisible(IZ)Z

    move-result p1

    if-nez p1, :cond_1

    .line 162
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    const/4 v1, 0x0

    invoke-virtual {p1, v1, v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->setMeshVisible(IZ)Z

    :cond_1
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 91
    invoke-super {p0, p1, p2}, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 92
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ShareAsVideoFragment$VXuDOc0k0zEUsrdkxvaPGLcAhUg;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ShareAsVideoFragment$VXuDOc0k0zEUsrdkxvaPGLcAhUg;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;)V

    invoke-virtual {p2, v0}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->queueEvent(Ljava/lang/Runnable;)V

    const p2, 0x7f0901f8

    .line 106
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    const/16 v0, 0x8

    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    const p2, 0x7f09019e

    .line 107
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ProgressBar;

    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mProgress:Landroid/widget/ProgressBar;

    .line 108
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->mProgress:Landroid/widget/ProgressBar;

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Landroid/widget/ProgressBar;->setProgress(I)V

    const p2, 0x7f09019f

    .line 110
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    const p2, 0x7f100350

    .line 111
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 112
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 114
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    const/4 p2, 0x1

    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/utils/SystemUtils;->setCurrentOrientation(Landroid/app/Activity;Z)V

    return-void
.end method
