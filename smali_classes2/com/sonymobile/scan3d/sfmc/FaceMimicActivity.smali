.class public Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;
.super Landroidx/fragment/app/FragmentActivity;
.source "FaceMimicActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$SaveVideoTask;,
        Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$SavePictureTask;,
        Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$PictureSaver;,
        Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$VideoRecorder;,
        Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$SoundPlayer;,
        Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$ContentOpener;,
        Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$MimickingEngineFactory;,
        Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$CameraImageProviderFactory;,
        Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;
    }
.end annotation


# static fields
.field private static final ALBUM_VIEW:Ljava/lang/String; = "com.sonymobile.album.action.VIEW"

.field static final DEFAULT_CAMERA_IMAGE_PROVIDER_FACTORY:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$CameraImageProviderFactory;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field static final DEFAULT_CONTENT_OPENER:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$ContentOpener;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field static final DEFAULT_MIMICKING_ENGINE_FACTORY:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$MimickingEngineFactory;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field static final DEFAULT_PICTURE_SAVER:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$PictureSaver;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field static final DEFAULT_SOUND_PLAYER:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$SoundPlayer;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field static final DEFAULT_VIDEO_RECORDER:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$VideoRecorder;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field private static final EXTENSION_JPEG:Ljava/lang/String; = "jpg"

.field private static final EXTENSION_MP4:Ljava/lang/String; = "mp4"

.field private static final FILE_DATE_FORMAT:Ljava/time/format/DateTimeFormatter;

.field private static final FILE_NAME:Ljava/lang/String; = "3DCreator_FaceMimic_%s.%s"

.field private static final FIRST_TIME_INFO_TEXT_TIMEOUT:I = 0x2710

.field private static final MIME_TYPE_JPEG:Ljava/lang/String; = "image/jpeg"

.field private static final MIME_TYPE_MP4:Ljava/lang/String; = "video/mp4"

.field private static final REQUEST_CODE_MODEL_PICKING:I = 0x1

.field public static final STARTED_FROM_ENTRY_POINT:Ljava/lang/String; = "started_from_entry_point"

.field private static final STATE_STRINGS:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final TAG:Ljava/lang/String; = "com.sonymobile.scan3d.sfmc.FaceMimicActivity"

.field private static final TEMP_VIDEO_FILE_NAME:Ljava/lang/String; = "face_mimic_temp.mp4"

.field private static sCameraProviderFactory:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$CameraImageProviderFactory;

.field private static sContentOpener:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$ContentOpener;

.field private static sEngineFactory:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$MimickingEngineFactory;

.field private static sPictureSaver:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$PictureSaver;

.field private static sSoundPlayer:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$SoundPlayer;

.field private static sVideoRecorder:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$VideoRecorder;


# instance fields
.field private mAfterRender:Ljava/lang/Runnable;
    .annotation build Lcom/sonymobile/scan3d/sfmc/GlThread;
    .end annotation
.end field

.field private mCurrentModel:Landroid/net/Uri;

.field private mCustomModel:Landroid/net/Uri;

.field private mEngine:Lcom/sonymobile/scan3d/sfmc/MimickingEngine;

.field private mFirstTimeInfoTimer:Landroid/os/CountDownTimer;

.field private mHasSurface:Z
    .annotation build Lcom/sonymobile/scan3d/sfmc/GlThread;
    .end annotation
.end field

.field private mImageProvider:Lcom/sonymobile/scan3d/CameraImageProvider;
    .annotation build Lcom/sonymobile/scan3d/sfmc/GlThread;
    .end annotation
.end field

.field private mInstruction:Ljava/lang/Integer;

.field private mLastPicture:Landroid/net/Uri;

.field private mLastVideo:Landroid/net/Uri;

.field private mMainHandler:Landroid/os/Handler;

.field private mParentView:Landroid/view/View;

.field private mPermissionsContainer:Landroid/view/View;

.field private mPermissionsHandler:Landroid/os/Handler;

.field private mPrevSelection:I

.field private mRecTimer:Ljava/lang/Runnable;

.field private mRecordingStartSoundDuration:I

.field private mSoundPool:Landroid/media/SoundPool;

.field private mSounds:Landroid/util/SparseIntArray;

.field private mState:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

.field private mSurfaceView:Lcom/sonymobile/scan3d/NativeGLTextureView;

.field private mThis:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-string v0, "yyyyMMdd_HHmmss_SSS"

    .line 172
    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 173
    invoke-static {v0, v1}, Ljava/time/format/DateTimeFormatter;->ofPattern(Ljava/lang/String;Ljava/util/Locale;)Ljava/time/format/DateTimeFormatter;

    move-result-object v0

    sput-object v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->FILE_DATE_FORMAT:Ljava/time/format/DateTimeFormatter;

    .line 178
    new-instance v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$1;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$1;-><init>()V

    sput-object v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->STATE_STRINGS:Ljava/util/HashMap;

    .line 413
    sget-object v0, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$jk0qiEwRNqJQx6NXvC6R7CBs7Cc;->INSTANCE:Lcom/sonymobile/scan3d/sfmc/-$$Lambda$jk0qiEwRNqJQx6NXvC6R7CBs7Cc;

    sput-object v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->DEFAULT_MIMICKING_ENGINE_FACTORY:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$MimickingEngineFactory;

    .line 416
    sget-object v0, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$MJEjS6VrKD37He0tSWEpUxkt-S0;->INSTANCE:Lcom/sonymobile/scan3d/sfmc/-$$Lambda$MJEjS6VrKD37He0tSWEpUxkt-S0;

    sput-object v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->DEFAULT_CAMERA_IMAGE_PROVIDER_FACTORY:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$CameraImageProviderFactory;

    .line 419
    sget-object v0, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$u7t5hV059Lw6ghXzdEuOar7-7qM;->INSTANCE:Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$u7t5hV059Lw6ghXzdEuOar7-7qM;

    sput-object v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->DEFAULT_CONTENT_OPENER:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$ContentOpener;

    .line 428
    sget-object v0, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$fCRvNd8H9gvXc_vg4qW8MJhT5Sg;->INSTANCE:Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$fCRvNd8H9gvXc_vg4qW8MJhT5Sg;

    sput-object v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->DEFAULT_SOUND_PLAYER:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$SoundPlayer;

    .line 435
    sget-object v0, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$8jFjPFEtaJmDXht_Jo2YmRFslAc;->INSTANCE:Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$8jFjPFEtaJmDXht_Jo2YmRFslAc;

    sput-object v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->DEFAULT_PICTURE_SAVER:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$PictureSaver;

    .line 441
    new-instance v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$2;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$2;-><init>()V

    sput-object v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->DEFAULT_VIDEO_RECORDER:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$VideoRecorder;

    .line 457
    sget-object v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->DEFAULT_MIMICKING_ENGINE_FACTORY:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$MimickingEngineFactory;

    sput-object v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->sEngineFactory:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$MimickingEngineFactory;

    .line 459
    sget-object v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->DEFAULT_CAMERA_IMAGE_PROVIDER_FACTORY:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$CameraImageProviderFactory;

    sput-object v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->sCameraProviderFactory:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$CameraImageProviderFactory;

    .line 461
    sget-object v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->DEFAULT_CONTENT_OPENER:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$ContentOpener;

    sput-object v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->sContentOpener:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$ContentOpener;

    .line 463
    sget-object v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->DEFAULT_SOUND_PLAYER:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$SoundPlayer;

    sput-object v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->sSoundPlayer:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$SoundPlayer;

    .line 465
    sget-object v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->DEFAULT_VIDEO_RECORDER:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$VideoRecorder;

    sput-object v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->sVideoRecorder:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$VideoRecorder;

    .line 467
    sget-object v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->DEFAULT_PICTURE_SAVER:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$PictureSaver;

    sput-object v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->sPictureSaver:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$PictureSaver;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 117
    invoke-direct {p0}, Landroidx/fragment/app/FragmentActivity;-><init>()V

    .line 220
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mMainHandler:Landroid/os/Handler;

    .line 225
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mPermissionsHandler:Landroid/os/Handler;

    const/4 v0, -0x1

    .line 246
    iput v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mPrevSelection:I

    .line 268
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0, p0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mThis:Ljava/util/concurrent/atomic/AtomicReference;

    return-void
.end method

.method static synthetic access$000(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)Ljava/util/concurrent/atomic/AtomicReference;
    .locals 0

    .line 117
    iget-object p0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mThis:Ljava/util/concurrent/atomic/AtomicReference;

    return-object p0
.end method

.method static synthetic access$100(Landroid/graphics/Bitmap;Ljava/io/File;)Z
    .locals 0

    .line 117
    invoke-static {p0, p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->storeBitmap(Landroid/graphics/Bitmap;Ljava/io/File;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$1000(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;I)Landroid/net/Uri;
    .locals 0

    .line 117
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->getResourceUri(I)Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1100(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)Landroid/view/View;
    .locals 0

    .line 117
    iget-object p0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mParentView:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$1200(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)Landroid/net/Uri;
    .locals 0

    .line 117
    iget-object p0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mCustomModel:Landroid/net/Uri;

    return-object p0
.end method

.method static synthetic access$1300(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Landroid/net/Uri;Landroid/net/Uri;Ljava/util/function/Consumer;)V
    .locals 0

    .line 117
    invoke-direct {p0, p1, p2, p3}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->loadModel(Landroid/net/Uri;Landroid/net/Uri;Ljava/util/function/Consumer;)V

    return-void
.end method

.method static synthetic access$1400(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)V
    .locals 0

    .line 117
    invoke-direct {p0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->updateFirstTimeInstructionVisibility()V

    return-void
.end method

.method static synthetic access$1502(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 0

    .line 117
    iput-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mInstruction:Ljava/lang/Integer;

    return-object p1
.end method

.method static synthetic access$1600()Ljava/util/HashMap;
    .locals 1

    .line 117
    sget-object v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->STATE_STRINGS:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$1700(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;
    .locals 0

    .line 117
    iget-object p0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mState:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    return-object p0
.end method

.method static synthetic access$1800(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;)V
    .locals 0

    .line 117
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->updateInstruction(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;)V

    return-void
.end method

.method static synthetic access$1900(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)Landroid/media/SoundPool;
    .locals 0

    .line 117
    iget-object p0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mSoundPool:Landroid/media/SoundPool;

    return-object p0
.end method

.method static synthetic access$200(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)Landroid/os/Handler;
    .locals 0

    .line 117
    iget-object p0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mMainHandler:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$300(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)Lcom/sonymobile/scan3d/CameraImageProvider;
    .locals 0

    .line 117
    iget-object p0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mImageProvider:Lcom/sonymobile/scan3d/CameraImageProvider;

    return-object p0
.end method

.method static synthetic access$400(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)Lcom/sonymobile/scan3d/sfmc/MimickingEngine;
    .locals 0

    .line 117
    iget-object p0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mEngine:Lcom/sonymobile/scan3d/sfmc/MimickingEngine;

    return-object p0
.end method

.method static synthetic access$502(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Z)Z
    .locals 0

    .line 117
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mHasSurface:Z

    return p1
.end method

.method static synthetic access$600(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)V
    .locals 0

    .line 117
    invoke-direct {p0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->openCamera()V

    return-void
.end method

.method static synthetic access$700(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)V
    .locals 0

    .line 117
    invoke-direct {p0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->closeCamera()V

    return-void
.end method

.method static synthetic access$800(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)Ljava/lang/Runnable;
    .locals 0

    .line 117
    iget-object p0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mAfterRender:Ljava/lang/Runnable;

    return-object p0
.end method

.method static synthetic access$802(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Ljava/lang/Runnable;)Ljava/lang/Runnable;
    .locals 0

    .line 117
    iput-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mAfterRender:Ljava/lang/Runnable;

    return-object p1
.end method

.method static synthetic access$900(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;)V
    .locals 0

    .line 117
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->setState(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;)V

    return-void
.end method

.method private addDevOptions()V
    .locals 2

    const v0, 0x7f090205

    .line 1484
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    const v1, 0x7f0c0059

    invoke-static {p0, v1, v0}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    const v0, 0x7f0900ac

    .line 1487
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/SeekBar;

    new-instance v1, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$7;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$7;-><init>(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)V

    .line 1488
    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    const v0, 0x7f090221

    .line 1505
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/SeekBar;

    new-instance v1, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$8;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$8;-><init>(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)V

    .line 1506
    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    const v0, 0x7f090154

    .line 1522
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/SeekBar;

    new-instance v1, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$9;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$9;-><init>(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)V

    .line 1523
    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    const v0, 0x7f09003f

    .line 1542
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/SeekBar;

    new-instance v1, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$10;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$10;-><init>(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)V

    .line 1543
    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    const v0, 0x7f090224

    .line 1562
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Switch;

    new-instance v1, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$C8I7hCi5xBxWcsFvaaRzpPTawCw;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$C8I7hCi5xBxWcsFvaaRzpPTawCw;-><init>(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    const v0, 0x7f090213

    .line 1565
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Switch;

    new-instance v1, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$-sOsdYyJzcPvqJNajGf86KX1oU4;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$-sOsdYyJzcPvqJNajGf86KX1oU4;-><init>(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    const v0, 0x7f0900aa

    .line 1570
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    .line 1571
    new-instance v1, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$11;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$11;-><init>(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 1584
    new-instance v1, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$mHPSaLC6hBZ3Z73aVN0PEmFirnE;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$mHPSaLC6hBZ3Z73aVN0PEmFirnE;-><init>(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnScrollChangedListener(Landroid/view/ViewTreeObserver$OnScrollChangedListener;)V

    const v0, 0x7f0900ec

    .line 1594
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$rz9zGwyAnttu7GVdoVSXMT3eEkU;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$rz9zGwyAnttu7GVdoVSXMT3eEkU;-><init>(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f090183

    .line 1598
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$k-aSnbZQUj5c7mmshZOzzbH5bgQ;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$k-aSnbZQUj5c7mmshZOzzbH5bgQ;-><init>(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f0900ab

    .line 1603
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    sget-object v1, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$mbXZNK8qRpHbqEdaTlBxf5ZJZhk;->INSTANCE:Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$mbXZNK8qRpHbqEdaTlBxf5ZJZhk;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    return-void
.end method

.method private checkButton(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/IdRes;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    const v0, 0x7f090129

    .line 754
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioGroup;

    .line 755
    invoke-virtual {v0}, Landroid/widget/RadioGroup;->clearCheck()V

    .line 756
    invoke-virtual {v0, p1}, Landroid/widget/RadioGroup;->check(I)V

    return-void
.end method

.method private closeCamera()V
    .locals 1
    .annotation build Lcom/sonymobile/scan3d/sfmc/GlThread;
    .end annotation

    .line 1048
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mImageProvider:Lcom/sonymobile/scan3d/CameraImageProvider;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/CameraImageProvider;->isStreaming()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1049
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mImageProvider:Lcom/sonymobile/scan3d/CameraImageProvider;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/CameraImageProvider;->closeCamera()V

    const/4 v0, 0x0

    .line 1050
    iput-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mImageProvider:Lcom/sonymobile/scan3d/CameraImageProvider;

    :cond_0
    return-void
.end method

.method private contentExists(Landroid/net/Uri;)Z
    .locals 8
    .param p1    # Landroid/net/Uri;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1780
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "android.permission.READ_EXTERNAL_STORAGE"

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/PermissionUtil;->hasPermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    .line 1781
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v3, p1

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    const/4 v0, 0x0

    if-eqz p1, :cond_2

    .line 1782
    :try_start_0
    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-lez v0, :cond_2

    const/4 v0, 0x1

    move v1, v0

    goto :goto_2

    :catchall_0
    move-exception v1

    goto :goto_0

    :catch_0
    move-exception v0

    .line 1781
    :try_start_1
    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    if-eqz p1, :cond_1

    if-eqz v0, :cond_0

    .line 1783
    :try_start_2
    invoke-interface {p1}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    :catch_1
    move-exception p1

    invoke-virtual {v0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_1

    :cond_0
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    :cond_1
    :goto_1
    throw v1

    :cond_2
    :goto_2
    if-eqz p1, :cond_3

    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    :cond_3
    return v1
.end method

.method private static createDateStampedFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
    .locals 5
    .annotation build Landroidx/annotation/AnyThread;
    .end annotation

    .line 666
    new-instance v0, Ljava/io/File;

    invoke-static {p0}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object p0

    const-string v1, "3DCreator_FaceMimic_%s.%s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    .line 667
    invoke-static {}, Ljava/time/LocalDateTime;->now()Ljava/time/LocalDateTime;

    move-result-object v3

    sget-object v4, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->FILE_DATE_FORMAT:Ljava/time/format/DateTimeFormatter;

    invoke-virtual {v3, v4}, Ljava/time/LocalDateTime;->format(Ljava/time/format/DateTimeFormatter;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const/4 v3, 0x1

    aput-object p1, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method private deniedOnlyOptionalPermissions(Ljava/util/List;[Ljava/lang/String;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;[",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .line 1877
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1878
    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method private getAlbumViewIntent(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2
    .annotation build Landroidx/annotation/AnyThread;
    .end annotation

    .line 680
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.sonymobile.album.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "android.intent.category.DEFAULT"

    .line 681
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 682
    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 683
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p2

    const/4 v1, 0x0

    .line 684
    invoke-virtual {p2, v0, v1}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object p2

    .line 685
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_0

    new-instance v0, Landroid/content/Intent;

    const-string p2, "android.intent.action.VIEW"

    invoke-direct {v0, p2, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    :cond_0
    return-object v0
.end method

.method private getDisplayRefreshNsec(Landroid/app/Activity;)J
    .locals 4
    .annotation build Landroidx/annotation/AnyThread;
    .end annotation

    const-string v0, "window"

    .line 946
    invoke-virtual {p1, v0}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/WindowManager;

    .line 947
    invoke-interface {p1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object p1

    .line 948
    invoke-virtual {p1}, Landroid/view/Display;->getRefreshRate()F

    move-result p1

    float-to-double v0, p1

    const-wide v2, 0x41cdcd6500000000L    # 1.0E9

    div-double/2addr v2, v0

    invoke-static {v2, v3}, Ljava/lang/Math;->round(D)J

    move-result-wide v0

    return-wide v0
.end method

.method private getResourceUri(I)Landroid/net/Uri;
    .locals 2
    .annotation build Landroidx/annotation/AnyThread;
    .end annotation

    .line 959
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "android.resource://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    return-object p1
.end method

.method private hasShownAudioPermissionsRequest()Z
    .locals 3

    .line 1834
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const v1, 0x7f1001b3

    .line 1835
    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    .line 1834
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method private hide(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/IdRes;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 706
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 v0, 0x4

    .line 707
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    return-void
.end method

.method private hideTimer()V
    .locals 2
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 741
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mRecTimer:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mMainHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_0
    const/4 v0, 0x0

    .line 742
    iput-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mRecTimer:Ljava/lang/Runnable;

    const v0, 0x7f090167

    .line 743
    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->hide(I)V

    return-void
.end method

.method private isAudioPreferred()Z
    .locals 3

    .line 1853
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const v1, 0x7f1001bf

    .line 1854
    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    .line 1853
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static synthetic lambda$addDevOptions$12(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Landroid/widget/CompoundButton;Z)V
    .locals 1

    .line 1563
    iget-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mEngine:Lcom/sonymobile/scan3d/sfmc/MimickingEngine;

    const-string v0, "/filters/viewing_angle_compensation"

    if-eqz p2, :cond_0

    const/high16 p2, 0x3f800000    # 1.0f

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    .line 1564
    :goto_0
    invoke-interface {p1, v0, p2}, Lcom/sonymobile/scan3d/sfmc/MimickingEngine;->setProperty(Ljava/lang/String;F)V

    return-void
.end method

.method public static synthetic lambda$addDevOptions$13(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Landroid/widget/CompoundButton;Z)V
    .locals 1

    .line 1566
    iget-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mEngine:Lcom/sonymobile/scan3d/sfmc/MimickingEngine;

    const-string v0, "/effects/user_gazing_"

    if-eqz p2, :cond_0

    const/high16 p2, 0x3f800000    # 1.0f

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    invoke-interface {p1, v0, p2}, Lcom/sonymobile/scan3d/sfmc/MimickingEngine;->setProperty(Ljava/lang/String;F)V

    return-void
.end method

.method public static synthetic lambda$addDevOptions$14(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)V
    .locals 4

    const v0, 0x7f0900ec

    .line 1585
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 1586
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v1

    mul-int/lit8 v1, v1, 0x2

    const v2, 0x7f0900aa

    .line 1588
    invoke-virtual {p0, v2}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getScrollY()I

    move-result v2

    sub-int v2, v1, v2

    const/4 v3, 0x0

    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    int-to-float v2, v2

    int-to-float v1, v1

    div-float/2addr v2, v1

    .line 1589
    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    const/4 v1, 0x0

    cmpl-float v1, v2, v1

    if-nez v1, :cond_0

    const/4 v3, 0x4

    .line 1590
    :cond_0
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public static synthetic lambda$addDevOptions$15(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Landroid/view/View;)V
    .locals 2

    const p1, 0x7f0900aa

    .line 1595
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ScrollView;

    .line 1596
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p1

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Landroid/widget/ScrollView;->smoothScrollTo(II)V

    return-void
.end method

.method public static synthetic lambda$addDevOptions$16(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Landroid/view/View;)V
    .locals 1

    const p1, 0x7f0900aa

    .line 1599
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ScrollView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, v0}, Landroid/widget/ScrollView;->smoothScrollTo(II)V

    return-void
.end method

.method static synthetic lambda$addDevOptions$17(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public static synthetic lambda$loadModel$5(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Landroid/net/Uri;Landroid/net/Uri;Ljava/util/function/Consumer;)V
    .locals 5

    .line 920
    :try_start_0
    sget-object v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->sContentOpener:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$ContentOpener;

    invoke-interface {v0, p0, p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$ContentOpener;->openInputStream(Landroid/content/Context;Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_4

    const/4 v0, 0x0

    .line 921
    :try_start_1
    sget-object v1, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->sContentOpener:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$ContentOpener;

    invoke-interface {v1, p0, p2}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$ContentOpener;->openInputStream(Landroid/content/Context;Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object p2
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    if-eqz p1, :cond_2

    if-eqz p2, :cond_2

    .line 925
    :try_start_2
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/network/StreamUtils;->toByteArray(Ljava/io/InputStream;)[B

    move-result-object v1

    .line 926
    invoke-static {p2}, Lcom/sonymobile/scan3d/storageservice/network/StreamUtils;->toByteArray(Ljava/io/InputStream;)[B

    move-result-object v2

    .line 927
    iget-object v3, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mEngine:Lcom/sonymobile/scan3d/sfmc/MimickingEngine;

    invoke-interface {v3, v1, v2}, Lcom/sonymobile/scan3d/sfmc/MimickingEngine;->loadTarget([B[B)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 928
    new-instance v1, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$IirfjCKVHQHlXi6_POh9q4Vx3Cc;

    invoke-direct {v1, p3}, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$IirfjCKVHQHlXi6_POh9q4Vx3Cc;-><init>(Ljava/util/function/Consumer;)V

    iput-object v1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mAfterRender:Ljava/lang/Runnable;
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz p2, :cond_0

    .line 932
    :try_start_3
    invoke-virtual {p2}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    :cond_0
    if-eqz p1, :cond_7

    :try_start_4
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_4

    goto :goto_4

    .line 930
    :cond_1
    :try_start_5
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Failed to load model"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 923
    :cond_2
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Could not open input stream"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :catchall_0
    move-exception v1

    move-object v2, v0

    goto :goto_0

    :catch_0
    move-exception v1

    .line 920
    :try_start_6
    throw v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    :catchall_1
    move-exception v2

    move-object v4, v2

    move-object v2, v1

    move-object v1, v4

    :goto_0
    if-eqz p2, :cond_4

    if-eqz v2, :cond_3

    .line 932
    :try_start_7
    invoke-virtual {p2}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    goto :goto_1

    :catch_1
    move-exception p2

    :try_start_8
    invoke-virtual {v2, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_1

    :cond_3
    invoke-virtual {p2}, Ljava/io/InputStream;->close()V

    :cond_4
    :goto_1
    throw v1
    :try_end_8
    .catch Ljava/lang/Throwable; {:try_start_8 .. :try_end_8} :catch_2
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    :catchall_2
    move-exception p2

    goto :goto_2

    :catch_2
    move-exception p2

    move-object v0, p2

    .line 920
    :try_start_9
    throw v0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    :goto_2
    if-eqz p1, :cond_6

    if-eqz v0, :cond_5

    .line 932
    :try_start_a
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_a
    .catch Ljava/lang/Throwable; {:try_start_a .. :try_end_a} :catch_3
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_4

    goto :goto_3

    :catch_3
    move-exception p1

    :try_start_b
    invoke-virtual {v0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_3

    :cond_5
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    :cond_6
    :goto_3
    throw p2
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_4

    .line 933
    :catch_4
    new-instance p1, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$mlI_x3ytrqYje6DkHusDwGF7frU;

    invoke-direct {p1, p3}, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$mlI_x3ytrqYje6DkHusDwGF7frU;-><init>(Ljava/util/function/Consumer;)V

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_7
    :goto_4
    return-void
.end method

.method public static synthetic lambda$null$10(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Landroid/util/Pair;ILjava/lang/Boolean;)V
    .locals 1

    .line 1432
    sget-object v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;->IDLE:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->setState(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;)V

    .line 1433
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p3

    const/4 v0, 0x0

    if-eqz p3, :cond_1

    .line 1434
    iget-object p1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast p1, Landroid/net/Uri;

    iput-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mCurrentModel:Landroid/net/Uri;

    .line 1435
    iput p2, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mPrevSelection:I

    const p1, 0x7f090211

    if-eq p2, p1, :cond_0

    .line 1442
    iget-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mParentView:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 1438
    :cond_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mParentView:Landroid/view/View;

    const p3, 0x106000b

    invoke-virtual {p0, p3}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->getColor(I)I

    move-result p3

    invoke-virtual {p1, p3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 1446
    :goto_0
    invoke-direct {p0, p2}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->setupToolbar(I)V

    goto :goto_1

    .line 1448
    :cond_1
    iput-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mCurrentModel:Landroid/net/Uri;

    .line 1452
    iget p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mPrevSelection:I

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->checkButton(I)V

    :goto_1
    return-void
.end method

.method static synthetic lambda$null$3(Ljava/util/function/Consumer;)V
    .locals 1

    const/4 v0, 0x1

    .line 928
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$null$4(Ljava/util/function/Consumer;)V
    .locals 1

    const/4 v0, 0x0

    .line 933
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$null$8(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Landroid/net/Uri;)V
    .locals 2

    .line 1179
    sget-object v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->sSoundPlayer:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$SoundPlayer;

    const v1, 0x7f0f001b

    invoke-interface {v0, p0, v1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$SoundPlayer;->play(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;I)V

    .line 1182
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->setLastVideo(Landroid/net/Uri;)V

    .line 1183
    sget-object p1, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;->IDLE:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->setState(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;)V

    return-void
.end method

.method public static synthetic lambda$onActivityResult$21(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Landroid/net/Uri;Ljava/lang/Boolean;)V
    .locals 1

    .line 1755
    sget-object v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;->IDLE:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->setState(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;)V

    .line 1756
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_0

    .line 1757
    iput-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mCustomModel:Landroid/net/Uri;

    .line 1758
    iput-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mCurrentModel:Landroid/net/Uri;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 1760
    iput-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mCurrentModel:Landroid/net/Uri;

    .line 1762
    :goto_0
    iget p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mPrevSelection:I

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->checkButton(I)V

    return-void
.end method

.method public static synthetic lambda$onCreate$11(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Landroid/widget/RadioGroup;I)V
    .locals 3

    .line 1403
    iget-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mState:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    sget-object v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;->IDLE:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    if-eq p1, v0, :cond_0

    return-void

    :cond_0
    const/4 p1, -0x1

    if-eq p2, p1, :cond_4

    if-nez p2, :cond_1

    goto :goto_1

    :cond_1
    packed-switch p2, :pswitch_data_0

    const/4 p1, 0x0

    goto :goto_0

    .line 1417
    :pswitch_0
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;->MONSTER:Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;

    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider;->getModelUri(Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;)Landroid/net/Uri;

    move-result-object p1

    sget-object v0, Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;->MONSTER:Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;

    .line 1418
    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider;->getExpressionUri(Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;)Landroid/net/Uri;

    move-result-object v0

    .line 1417
    invoke-static {p1, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object p1

    goto :goto_0

    .line 1413
    :pswitch_1
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;->MANGA:Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;

    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider;->getModelUri(Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;)Landroid/net/Uri;

    move-result-object p1

    sget-object v0, Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;->MANGA:Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;

    .line 1414
    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider;->getExpressionUri(Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;)Landroid/net/Uri;

    move-result-object v0

    .line 1413
    invoke-static {p1, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object p1

    :goto_0
    if-eqz p1, :cond_2

    .line 1425
    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioButton;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setChecked(Z)V

    :cond_2
    if-eqz p1, :cond_3

    .line 1429
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Landroid/net/Uri;

    iget-object v1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mCurrentModel:Landroid/net/Uri;

    invoke-virtual {v0, v1}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 1430
    sget-object v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;->LOADING_MODEL:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->setState(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;)V

    .line 1431
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Landroid/net/Uri;

    iget-object v1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v1, Landroid/net/Uri;

    new-instance v2, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$DlF6hza-4cEEzkPpH-VK3pLMoFY;

    invoke-direct {v2, p0, p1, p2}, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$DlF6hza-4cEEzkPpH-VK3pLMoFY;-><init>(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Landroid/util/Pair;I)V

    invoke-direct {p0, v0, v1, v2}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->loadModel(Landroid/net/Uri;Landroid/net/Uri;Ljava/util/function/Consumer;)V

    :cond_3
    return-void

    :cond_4
    :goto_1
    return-void

    :pswitch_data_0
    .packed-switch 0x7f090211
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static synthetic lambda$onDestroy$20(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)V
    .locals 1

    .line 1683
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mHasSurface:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mEngine:Lcom/sonymobile/scan3d/sfmc/MimickingEngine;

    invoke-interface {v0}, Lcom/sonymobile/scan3d/sfmc/MimickingEngine;->release()V

    :cond_0
    return-void
.end method

.method public static synthetic lambda$onPause$19(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)V
    .locals 0

    .line 1657
    invoke-direct {p0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->closeCamera()V

    return-void
.end method

.method public static synthetic lambda$onResume$18(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)V
    .locals 0

    .line 1632
    invoke-direct {p0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->openCamera()V

    return-void
.end method

.method public static synthetic lambda$setupToolbar$23(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Landroid/view/View;)V
    .locals 0

    .line 1894
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->finish()V

    return-void
.end method

.method public static synthetic lambda$setupViewPermissionsButton$22(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;[Ljava/lang/String;ILandroid/view/View;)V
    .locals 1

    .line 1818
    iget-object p3, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mPermissionsContainer:Landroid/view/View;

    const/4 v0, 0x4

    invoke-virtual {p3, v0}, Landroid/view/View;->setVisibility(I)V

    .line 1819
    invoke-static {p0, p1}, Lcom/sonymobile/scan3d/PermissionUtil;->shouldShowRequestPermissionRationale(Landroid/app/Activity;[Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_0

    .line 1820
    invoke-virtual {p0, p1, p2}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->requestPermissions([Ljava/lang/String;I)V

    goto :goto_0

    .line 1822
    :cond_0
    invoke-static {p0}, Lcom/sonymobile/scan3d/PermissionUtil;->startAppSettings(Landroid/content/Context;)V

    :goto_0
    return-void
.end method

.method public static synthetic lambda$startRecording$9(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)V
    .locals 14

    .line 1170
    sget-object v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;->RECORDING:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->setState(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;)V

    const v0, 0x7f0901d8

    .line 1173
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    .line 1174
    new-instance v4, Ljava/io/File;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->getFilesDir()Ljava/io/File;

    move-result-object v0

    const-string v1, "face_mimic_temp.mp4"

    invoke-direct {v4, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1175
    sget-object v0, Landroid/os/Environment;->DIRECTORY_MOVIES:Ljava/lang/String;

    const-string v1, "mp4"

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->createDateStampedFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v5

    const v0, 0x7f0900f8

    .line 1176
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v13

    .line 1177
    sget-object v1, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->sVideoRecorder:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$VideoRecorder;

    iget-object v3, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mSurfaceView:Lcom/sonymobile/scan3d/NativeGLTextureView;

    sget-object v6, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$YUSu_AGGaWrry0MpifHQLHEwi0s;->INSTANCE:Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$YUSu_AGGaWrry0MpifHQLHEwi0s;

    .line 1184
    invoke-direct {p0, p0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->getDisplayRefreshNsec(Landroid/app/Activity;)J

    move-result-wide v7

    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mSurfaceView:Lcom/sonymobile/scan3d/NativeGLTextureView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/NativeGLTextureView;->getWidth()I

    move-result v11

    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mSurfaceView:Lcom/sonymobile/scan3d/NativeGLTextureView;

    .line 1185
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/NativeGLTextureView;->getHeight()I

    move-result v12

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v2, p0

    .line 1177
    invoke-interface/range {v1 .. v13}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$VideoRecorder;->start(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Lcom/sonymobile/scan3d/NativeGLTextureView;Ljava/io/File;Ljava/io/File;Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$VideoRecorder$RecordingListener;JIIIIZ)V

    return-void
.end method

.method static synthetic lambda$static$0(Landroid/content/Context;Landroid/net/Uri;)Ljava/io/InputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 420
    invoke-static {}, Lcom/sonymobile/scan3d/ZipResourceManager;->usingOBB()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 421
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object p0

    return-object p0

    .line 423
    :cond_0
    invoke-static {}, Lcom/sonymobile/scan3d/ZipResourceManager;->getZipResourceFile()Lcom/android/vending/expansion/zipfile/ZipResourceFile;

    move-result-object p0

    invoke-virtual {p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/android/vending/expansion/zipfile/ZipResourceFile;->getInputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$static$1(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;I)V
    .locals 7

    .line 429
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mSoundPool:Landroid/media/SoundPool;

    if-eqz v0, :cond_0

    .line 430
    iget-object p0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mSounds:Landroid/util/SparseIntArray;

    invoke-virtual {p0, p1}, Landroid/util/SparseIntArray;->get(I)I

    move-result v1

    const/high16 v2, 0x3f800000    # 1.0f

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-virtual/range {v0 .. v6}, Landroid/media/SoundPool;->play(IFFIIF)I

    :cond_0
    return-void
.end method

.method static synthetic lambda$static$2(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Landroid/graphics/Bitmap;Ljava/io/File;Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$PictureSaver$SaveListener;)V
    .locals 1

    .line 437
    new-instance v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$SavePictureTask;

    iget-object p0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mThis:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$SavePictureTask;-><init>(Ljava/util/concurrent/atomic/AtomicReference;Landroid/graphics/Bitmap;Ljava/io/File;Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$PictureSaver$SaveListener;)V

    const/4 p0, 0x0

    new-array p0, p0, [Ljava/lang/Void;

    invoke-virtual {v0, p0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$SavePictureTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static synthetic lambda$takePicture$6(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)V
    .locals 1

    const v0, 0x7f0900d6

    .line 1079
    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->hide(I)V

    return-void
.end method

.method static synthetic lambda$takePicture$7(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Landroid/net/Uri;)V
    .locals 0

    .line 1092
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->setLastPicture(Landroid/net/Uri;)V

    .line 1093
    sget-object p1, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;->IDLE:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->setState(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;)V

    return-void
.end method

.method private loadModel(Landroid/net/Uri;Landroid/net/Uri;Ljava/util/function/Consumer;)V
    .locals 1
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Landroid/net/Uri;",
            "Ljava/util/function/Consumer<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 919
    new-instance v0, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$D-sOARkLhSlhtNNZTQb2bEw3QQM;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$D-sOARkLhSlhtNNZTQb2bEw3QQM;-><init>(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Landroid/net/Uri;Landroid/net/Uri;Ljava/util/function/Consumer;)V

    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->runOnGlThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method private openCamera()V
    .locals 4
    .annotation build Lcom/sonymobile/scan3d/sfmc/GlThread;
    .end annotation

    .line 1024
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mImageProvider:Lcom/sonymobile/scan3d/CameraImageProvider;

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mHasSurface:Z

    if-eqz v0, :cond_0

    .line 1025
    sget-object v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->sCameraProviderFactory:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$CameraImageProviderFactory;

    new-instance v1, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$5;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$5;-><init>(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)V

    sget-object v2, Lcom/sonymobile/scan3d/SphinxFocusType;->kFocusAuto:Lcom/sonymobile/scan3d/SphinxFocusType;

    const/4 v3, 0x1

    .line 1026
    invoke-interface {v0, p0, v1, v2, v3}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$CameraImageProviderFactory;->newCameraImageProvider(Landroid/content/Context;Lcom/sonymobile/scan3d/CameraImageProvider$OnCameraStatusListener;Lcom/sonymobile/scan3d/SphinxFocusType;Z)Lcom/sonymobile/scan3d/CameraImageProvider;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mImageProvider:Lcom/sonymobile/scan3d/CameraImageProvider;

    .line 1039
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mImageProvider:Lcom/sonymobile/scan3d/CameraImageProvider;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/CameraImageProvider;->openCamera()V

    :cond_0
    return-void
.end method

.method private requestMissingPermissions(Lcom/sonymobile/scan3d/PermissionUtil$Permissions;I)Z
    .locals 3
    .param p2    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 1799
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->getPermissions()[Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/PermissionUtil;->getMissingPermissions(Landroid/content/Context;[Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 1800
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->getPermissions()[Ljava/lang/String;

    move-result-object v1

    .line 1801
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->getRequestCode()I

    move-result v2

    .line 1800
    invoke-direct {p0, p2, v1, v2}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->setupViewPermissionsButton(I[Ljava/lang/String;I)V

    .line 1802
    array-length p2, v0

    if-lez p2, :cond_0

    const/4 p2, 0x1

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    if-eqz p2, :cond_1

    .line 1804
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->getRequestCode()I

    move-result p1

    invoke-virtual {p0, v0, p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->requestPermissions([Ljava/lang/String;I)V

    :cond_1
    return p2
.end method

.method private runOnGlThread(Ljava/lang/Runnable;)V
    .locals 1
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 904
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mSurfaceView:Lcom/sonymobile/scan3d/NativeGLTextureView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/NativeGLTextureView;->getGLThread()Lcom/sonymobile/scan3d/GLThread;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/GLThread;->queueEvent(Ljava/lang/Runnable;)V

    return-void
.end method

.method private setAudioPermissionsRequestShown()V
    .locals 3

    .line 1843
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const v1, 0x7f1001b3

    .line 1844
    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method private setAudioPreferred(Z)V
    .locals 2

    .line 1863
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const v1, 0x7f1001bf

    .line 1864
    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method static setCameraImageProviderFactory(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$CameraImageProviderFactory;)V
    .locals 0
    .param p0    # Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$CameraImageProviderFactory;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 478
    sput-object p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->sCameraProviderFactory:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$CameraImageProviderFactory;

    return-void
.end method

.method static setContentOpener(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$ContentOpener;)V
    .locals 0
    .param p0    # Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$ContentOpener;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 484
    sput-object p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->sContentOpener:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$ContentOpener;

    return-void
.end method

.method private setLastPicture(Landroid/net/Uri;)V
    .locals 0
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 882
    iput-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mLastPicture:Landroid/net/Uri;

    const/4 p1, 0x0

    .line 883
    iput-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mLastVideo:Landroid/net/Uri;

    return-void
.end method

.method private setLastVideo(Landroid/net/Uri;)V
    .locals 1
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    const/4 v0, 0x0

    .line 893
    iput-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mLastPicture:Landroid/net/Uri;

    .line 894
    iput-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mLastVideo:Landroid/net/Uri;

    return-void
.end method

.method static setMimickingEngineFactory(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$MimickingEngineFactory;)V
    .locals 0
    .param p0    # Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$MimickingEngineFactory;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 472
    sput-object p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->sEngineFactory:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$MimickingEngineFactory;

    return-void
.end method

.method static setPictureSaver(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$PictureSaver;)V
    .locals 0
    .param p0    # Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$PictureSaver;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 502
    sput-object p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->sPictureSaver:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$PictureSaver;

    return-void
.end method

.method static setSoundPlayer(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$SoundPlayer;)V
    .locals 0
    .param p0    # Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$SoundPlayer;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 490
    sput-object p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->sSoundPlayer:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$SoundPlayer;

    return-void
.end method

.method private setState(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;)V
    .locals 13
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 768
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->updateInstruction(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;)V

    .line 770
    sget-object v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$13;->$SwitchMap$com$sonymobile$scan3d$sfmc$FaceMimicActivity$UiState:[I

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const v1, 0x7f0901c7

    const v2, 0x7f09017c

    const v3, 0x7f090128

    const v4, 0x7f090212

    const v5, 0x7f090197

    const v6, 0x7f090211

    const v7, 0x7f0900f8

    const v8, 0x7f0901d8

    const v9, 0x7f0901c1

    const v10, 0x7f0900aa

    const v11, 0x7f090217

    const v12, 0x7f090152

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_1

    .line 849
    :pswitch_0
    invoke-direct {p0, v10}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->hide(I)V

    .line 852
    invoke-direct {p0, v3}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->show(I)V

    .line 853
    invoke-direct {p0, v2}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->show(I)V

    .line 856
    invoke-direct {p0, v6}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->hide(I)V

    .line 857
    invoke-direct {p0, v5}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->hide(I)V

    .line 858
    invoke-direct {p0, v4}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->hide(I)V

    .line 861
    invoke-direct {p0, v9}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->hide(I)V

    .line 862
    invoke-direct {p0, v8}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->hide(I)V

    .line 863
    invoke-direct {p0, v7}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->hide(I)V

    .line 866
    invoke-direct {p0, v12}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->hide(I)V

    .line 867
    invoke-direct {p0, v11}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->hide(I)V

    goto/16 :goto_1

    .line 845
    :pswitch_1
    invoke-direct {p0, v12}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->hide(I)V

    .line 846
    invoke-direct {p0, v11}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->hide(I)V

    goto/16 :goto_1

    .line 819
    :pswitch_2
    invoke-direct {p0, v10}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->hide(I)V

    .line 822
    invoke-direct {p0, v1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->show(I)V

    .line 823
    invoke-direct {p0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->showTimer()V

    .line 826
    invoke-direct {p0, v3}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->hide(I)V

    .line 827
    invoke-direct {p0, v2}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->hide(I)V

    .line 830
    invoke-direct {p0, v9}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->hide(I)V

    .line 831
    invoke-direct {p0, v8}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->hide(I)V

    .line 832
    invoke-direct {p0, v7}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->hide(I)V

    .line 835
    invoke-direct {p0, v6}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->hide(I)V

    .line 836
    invoke-direct {p0, v5}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->hide(I)V

    .line 837
    invoke-direct {p0, v4}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->hide(I)V

    .line 840
    invoke-direct {p0, v12}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->hide(I)V

    .line 841
    invoke-direct {p0, v11}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->hide(I)V

    goto :goto_1

    .line 801
    :pswitch_3
    invoke-direct {p0, v10}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->hide(I)V

    .line 804
    invoke-direct {p0, v6}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->hide(I)V

    .line 805
    invoke-direct {p0, v5}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->hide(I)V

    .line 806
    invoke-direct {p0, v4}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->hide(I)V

    .line 809
    invoke-direct {p0, v9}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->hide(I)V

    .line 810
    invoke-direct {p0, v8}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->hide(I)V

    .line 811
    invoke-direct {p0, v7}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->hide(I)V

    .line 814
    invoke-direct {p0, v12}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->hide(I)V

    .line 815
    invoke-direct {p0, v11}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->hide(I)V

    goto :goto_1

    .line 772
    :pswitch_4
    invoke-direct {p0, v10}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->show(I)V

    .line 775
    invoke-direct {p0, v1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->hide(I)V

    .line 776
    invoke-direct {p0, v3}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->hide(I)V

    .line 777
    invoke-direct {p0, v2}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->hide(I)V

    .line 778
    invoke-direct {p0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->hideTimer()V

    .line 781
    invoke-direct {p0, v9}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->show(I)V

    .line 782
    invoke-direct {p0, v8}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->show(I)V

    .line 783
    invoke-direct {p0, v7}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->show(I)V

    .line 784
    invoke-direct {p0, v6}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->show(I)V

    .line 785
    invoke-direct {p0, v5}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->hide(I)V

    .line 786
    invoke-direct {p0, v4}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->show(I)V

    .line 789
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mLastPicture:Landroid/net/Uri;

    if-eqz v0, :cond_0

    .line 790
    invoke-direct {p0, v12}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->show(I)V

    goto :goto_0

    .line 792
    :cond_0
    invoke-direct {p0, v12}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->hide(I)V

    .line 794
    :goto_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mLastVideo:Landroid/net/Uri;

    if-eqz v0, :cond_1

    .line 795
    invoke-direct {p0, v11}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->show(I)V

    goto :goto_1

    .line 797
    :cond_1
    invoke-direct {p0, v11}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->hide(I)V

    .line 872
    :goto_1
    iput-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mState:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method static setVideoRecorder(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$VideoRecorder;)V
    .locals 0
    .param p0    # Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$VideoRecorder;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 496
    sput-object p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->sVideoRecorder:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$VideoRecorder;

    return-void
.end method

.method private setupToolbar(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/IdRes;
        .end annotation
    .end param

    const v0, 0x7f0901f8

    .line 1891
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Toolbar;

    const v1, 0x7f100300

    .line 1892
    invoke-virtual {v0, v1}, Landroid/widget/Toolbar;->setTitle(I)V

    const v1, 0x7f10002a

    .line 1893
    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Toolbar;->setNavigationContentDescription(Ljava/lang/CharSequence;)V

    .line 1894
    new-instance v1, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$RM-N3x6RY7pS6BvoXfdU9wkWa2E;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$RM-N3x6RY7pS6BvoXfdU9wkWa2E;-><init>(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Toolbar;->setNavigationOnClickListener(Landroid/view/View$OnClickListener;)V

    const v1, 0x7f090211

    if-eq p1, v1, :cond_0

    const p1, 0x106000b

    .line 1903
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->getColor(I)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/widget/Toolbar;->setTitleTextColor(I)V

    const p1, 0x7f0800cb

    .line 1904
    invoke-virtual {v0, p1}, Landroid/widget/Toolbar;->setNavigationIcon(I)V

    .line 1905
    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/RadioButton;

    const/4 v0, 0x0

    .line 1906
    invoke-virtual {p1, v0}, Landroid/widget/RadioButton;->setChecked(Z)V

    goto :goto_0

    :cond_0
    const p1, 0x106000c

    .line 1898
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->getColor(I)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/widget/Toolbar;->setTitleTextColor(I)V

    const p1, 0x7f0800cc

    .line 1899
    invoke-virtual {v0, p1}, Landroid/widget/Toolbar;->setNavigationIcon(I)V

    :goto_0
    return-void
.end method

.method private setupViewPermissionsButton(I[Ljava/lang/String;I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 1814
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mPermissionsContainer:Landroid/view/View;

    const v1, 0x7f09014e

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 1815
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 1816
    iget-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mPermissionsContainer:Landroid/view/View;

    const v0, 0x7f09014b

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    .line 1817
    new-instance v0, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$4eERpYlbTuCPHQNyQg-onbLa_No;

    invoke-direct {v0, p0, p2, p3}, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$4eERpYlbTuCPHQNyQg-onbLa_No;-><init>(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;[Ljava/lang/String;I)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private show(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/IdRes;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 695
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    .line 696
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    return-void
.end method

.method private showTimer()V
    .locals 1
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 715
    new-instance v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$3;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$3;-><init>(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mRecTimer:Ljava/lang/Runnable;

    .line 732
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mRecTimer:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    const v0, 0x7f090167

    .line 733
    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->show(I)V

    return-void
.end method

.method private static storeBitmap(Landroid/graphics/Bitmap;Ljava/io/File;)Z
    .locals 3
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 648
    :try_start_0
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    const/4 p1, 0x0

    .line 649
    :try_start_1
    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v2, 0x4b

    invoke-virtual {p0, v1, v2, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 650
    :try_start_2
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    const/4 p0, 0x1

    return p0

    :catchall_0
    move-exception p0

    goto :goto_0

    :catch_0
    move-exception p0

    move-object p1, p0

    .line 648
    :try_start_3
    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :goto_0
    if-eqz p1, :cond_0

    .line 650
    :try_start_4
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_1

    :catch_1
    move-exception v0

    :try_start_5
    invoke-virtual {p1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_1

    :cond_0
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    :goto_1
    throw p0
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    :catch_2
    move-exception p0

    .line 651
    sget-object p1, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->TAG:Ljava/lang/String;

    const-string v0, "Failed to store bitmap"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 p0, 0x0

    return p0
.end method

.method private updateFirstTimeInstructionVisibility()V
    .locals 8

    .line 997
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 996
    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v7

    const v0, 0x7f100207

    .line 998
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v7, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mState:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    sget-object v2, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;->LOADING_MODEL:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    if-eq v0, v2, :cond_0

    const v0, 0x7f0900cf

    .line 1000
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 1001
    new-instance v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$4;

    const-wide/16 v3, 0x2710

    const-wide/16 v5, 0x2710

    move-object v1, v0

    move-object v2, p0

    invoke-direct/range {v1 .. v7}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$4;-><init>(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;JJLandroid/content/SharedPreferences;)V

    .line 1015
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$4;->start()Landroid/os/CountDownTimer;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mFirstTimeInfoTimer:Landroid/os/CountDownTimer;

    :cond_0
    return-void
.end method

.method private updateInstruction(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;)V
    .locals 3
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 970
    sget-object v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;->LOADING_MODEL:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    const v1, 0x7f0900fe

    const v2, 0x7f0900d9

    if-eq p1, v0, :cond_1

    iget-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mInstruction:Ljava/lang/Integer;

    if-nez p1, :cond_0

    goto :goto_0

    .line 976
    :cond_0
    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mInstruction:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 977
    invoke-direct {p0, v2}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->show(I)V

    .line 978
    invoke-direct {p0, v1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->show(I)V

    .line 981
    invoke-virtual {p0, v2}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .line 982
    invoke-static {}, Landroid/animation/ValueAnimator;->areAnimatorsEnabled()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Landroid/view/View;->getAnimation()Landroid/view/animation/Animation;

    move-result-object v0

    if-nez v0, :cond_2

    const v0, 0x7f010018

    .line 984
    invoke-static {p0, v0}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 983
    invoke-virtual {p1, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_1

    .line 971
    :cond_1
    :goto_0
    invoke-direct {p0, v2}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->hide(I)V

    .line 972
    invoke-direct {p0, v1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->hide(I)V

    .line 973
    invoke-virtual {p0, v2}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->clearAnimation()V

    :cond_2
    :goto_1
    return-void
.end method


# virtual methods
.method getGlThread()Lcom/sonymobile/scan3d/GLThread;
    .locals 1
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 508
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mSurfaceView:Lcom/sonymobile/scan3d/NativeGLTextureView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/NativeGLTextureView;->getGLThread()Lcom/sonymobile/scan3d/GLThread;

    move-result-object v0

    return-object v0
.end method

.method getUiState()Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;
    .locals 1
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 514
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mState:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    return-object v0
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 0
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    const/4 p2, 0x1

    if-eq p1, p2, :cond_0

    goto :goto_0

    .line 1749
    :cond_0
    sget-object p1, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;->IDLE:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->setState(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;)V

    if-eqz p3, :cond_1

    .line 1751
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 1753
    sget-object p2, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;->LOADING_MODEL:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    invoke-direct {p0, p2}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->setState(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;)V

    const p2, 0x7f0f0015

    .line 1754
    invoke-direct {p0, p2}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->getResourceUri(I)Landroid/net/Uri;

    move-result-object p2

    new-instance p3, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$-MuSRuNdyRY7CNK1BAr9AL7ZVWM;

    invoke-direct {p3, p0, p1}, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$-MuSRuNdyRY7CNK1BAr9AL7ZVWM;-><init>(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Landroid/net/Uri;)V

    invoke-direct {p0, p1, p2, p3}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->loadModel(Landroid/net/Uri;Landroid/net/Uri;Ljava/util/function/Consumer;)V

    :cond_1
    :goto_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1253
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 1256
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_5

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    if-nez v0, :cond_0

    goto/16 :goto_2

    :cond_0
    if-nez p1, :cond_1

    .line 1265
    :try_start_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    if-eqz p1, :cond_1

    const-string v0, "com.sonymobile.scan3d.extra.EXTRA_MESSENGER"

    .line 1267
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/Messenger;

    if-eqz p1, :cond_1

    .line 1269
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    const/4 v1, 0x2

    .line 1270
    iput v1, v0, Landroid/os/Message;->what:I

    .line 1271
    invoke-virtual {p1, v0}, Landroid/os/Messenger;->send(Landroid/os/Message;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1275
    :catch_0
    sget-object p1, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->TAG:Ljava/lang/String;

    const-string v0, "Failed to notify activity started on messenger."

    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1280
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mCustomModel:Landroid/net/Uri;

    .line 1283
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/16 v0, 0x80

    invoke-virtual {p1, v0}, Landroid/view/Window;->addFlags(I)V

    .line 1286
    sget-object p1, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->sEngineFactory:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$MimickingEngineFactory;

    invoke-interface {p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$MimickingEngineFactory;->newMimickingEngine()Lcom/sonymobile/scan3d/sfmc/MimickingEngine;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mEngine:Lcom/sonymobile/scan3d/sfmc/MimickingEngine;

    const p1, 0x7f0c001d

    .line 1289
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->setContentView(I)V

    const p1, 0x7f090096

    .line 1291
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mParentView:Landroid/view/View;

    .line 1293
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "started_from_entry_point"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p1

    const/4 v0, 0x4

    const v2, 0x7f090129

    if-nez p1, :cond_2

    .line 1296
    invoke-virtual {p0, v2}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/RadioGroup;

    .line 1297
    invoke-virtual {v3, v0}, Landroid/widget/RadioGroup;->setVisibility(I)V

    :cond_2
    if-eqz p1, :cond_3

    const v3, 0x7f090211

    goto :goto_1

    :cond_3
    const/4 v3, -0x1

    .line 1299
    :goto_1
    iput v3, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mPrevSelection:I

    .line 1302
    iget v3, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mPrevSelection:I

    invoke-direct {p0, v3}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->setupToolbar(I)V

    const v3, 0x7f09014c

    .line 1305
    invoke-virtual {p0, v3}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mPermissionsContainer:Landroid/view/View;

    const v3, 0x7f090127

    .line 1310
    invoke-virtual {p0, v3}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/sonymobile/scan3d/NativeGLTextureView;

    iput-object v3, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mSurfaceView:Lcom/sonymobile/scan3d/NativeGLTextureView;

    .line 1311
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    .line 1312
    iget v3, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    mul-int/lit8 v3, v3, 0x5

    div-int/2addr v3, v0

    .line 1313
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mSurfaceView:Lcom/sonymobile/scan3d/NativeGLTextureView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/NativeGLTextureView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 1314
    iput v3, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 1315
    iput v3, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 1316
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mSurfaceView:Lcom/sonymobile/scan3d/NativeGLTextureView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/NativeGLTextureView;->requestLayout()V

    .line 1318
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mSurfaceView:Lcom/sonymobile/scan3d/NativeGLTextureView;

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/NativeGLTextureView;->setOpaque(Z)V

    .line 1320
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mSurfaceView:Lcom/sonymobile/scan3d/NativeGLTextureView;

    new-instance v3, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$6;

    invoke-direct {v3, p0, p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$6;-><init>(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Z)V

    const/4 p1, 0x0

    invoke-virtual {v0, v3, p1}, Lcom/sonymobile/scan3d/NativeGLTextureView;->setRenderer(Lcom/sonymobile/scan3d/GLThread$Renderer;Ljava/lang/Runnable;)V

    .line 1402
    invoke-virtual {p0, v2}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/RadioGroup;

    new-instance v0, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$apB0fFHESZlW9UIStYK4MiwPzn0;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$apB0fFHESZlW9UIStYK4MiwPzn0;-><init>(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/RadioGroup;->setOnCheckedChangeListener(Landroid/widget/RadioGroup$OnCheckedChangeListener;)V

    const-string p1, "scan3d"

    const-string v0, "labs"

    .line 1459
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 1460
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    const v0, 0x7f1001cb

    .line 1461
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 1462
    invoke-direct {p0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->addDevOptions()V

    .line 1466
    :cond_4
    new-instance p1, Landroid/media/MediaMetadataRetriever;

    invoke-direct {p1}, Landroid/media/MediaMetadataRetriever;-><init>()V

    const v0, 0x7f0f001a

    .line 1467
    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->getResourceUri(I)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p1, p0, v0}, Landroid/media/MediaMetadataRetriever;->setDataSource(Landroid/content/Context;Landroid/net/Uri;)V

    const/16 v0, 0x9

    .line 1469
    invoke-virtual {p1, v0}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    move-result-object v0

    .line 1470
    invoke-virtual {p1}, Landroid/media/MediaMetadataRetriever;->release()V

    .line 1471
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mRecordingStartSoundDuration:I

    .line 1474
    sget-object p1, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;->LOADING_MODEL:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->setState(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;)V

    return-void

    .line 1257
    :cond_5
    :goto_2
    sget-object p1, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->TAG:Ljava/lang/String;

    const-string v0, "URI missing from intent"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1258
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->finish()V

    return-void
.end method

.method protected onDestroy()V
    .locals 2
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1681
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mSurfaceView:Lcom/sonymobile/scan3d/NativeGLTextureView;

    if-eqz v0, :cond_0

    .line 1682
    new-instance v0, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$n6tK8PgFbZ7_jG6pl8BqDXZXyn0;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$n6tK8PgFbZ7_jG6pl8BqDXZXyn0;-><init>(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)V

    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->runOnGlThread(Ljava/lang/Runnable;)V

    .line 1686
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mThis:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 1687
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onDestroy()V

    return-void
.end method

.method protected onPause()V
    .locals 2
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    const/4 v0, 0x0

    .line 1650
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->stopRecording(Landroid/view/View;)V

    const v1, 0x7f0900f8

    .line 1653
    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/CheckBox;

    invoke-virtual {v1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v1

    invoke-direct {p0, v1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->setAudioPreferred(Z)V

    .line 1656
    iget-object v1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mSurfaceView:Lcom/sonymobile/scan3d/NativeGLTextureView;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/NativeGLTextureView;->onPause()V

    .line 1657
    new-instance v1, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$khm4lpg5DO9oLkLa3npxmatqWw8;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$khm4lpg5DO9oLkLa3npxmatqWw8;-><init>(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)V

    invoke-direct {p0, v1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->runOnGlThread(Ljava/lang/Runnable;)V

    .line 1660
    iget-object v1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mFirstTimeInfoTimer:Landroid/os/CountDownTimer;

    if-eqz v1, :cond_0

    .line 1661
    invoke-virtual {v1}, Landroid/os/CountDownTimer;->cancel()V

    .line 1662
    iput-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mFirstTimeInfoTimer:Landroid/os/CountDownTimer;

    .line 1664
    :cond_0
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onPause()V

    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 7
    .param p2    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # [I
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1696
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    move v2, v1

    move v3, v2

    .line 1698
    :goto_0
    array-length v4, p2

    const/4 v5, 0x1

    if-ge v2, v4, :cond_2

    .line 1699
    aget v4, p3, v2

    if-eqz v4, :cond_0

    .line 1701
    aget-object p2, p2, v2

    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 1703
    :cond_0
    aget-object v4, p2, v2

    const-string v6, "android.permission.RECORD_AUDIO"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    move v3, v5

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    move v1, v5

    .line 1707
    :goto_1
    iget-object p2, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mPermissionsHandler:Landroid/os/Handler;

    const/4 p3, 0x0

    invoke-virtual {p2, p3}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 1709
    sget-object p2, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->AUDIO:Lcom/sonymobile/scan3d/PermissionUtil$Permissions;

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->getRequestCode()I

    move-result p2

    const p3, 0x7f0900f8

    if-ne p1, p2, :cond_4

    if-eqz v1, :cond_3

    .line 1712
    iget-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mPermissionsHandler:Landroid/os/Handler;

    iget-object p2, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mPermissionsContainer:Landroid/view/View;

    invoke-static {p2}, Lcom/sonymobile/scan3d/PermissionUtil;->removePermissionsContainer(Landroid/view/View;)Ljava/lang/Runnable;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_2

    .line 1715
    :cond_3
    iget-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mPermissionsHandler:Landroid/os/Handler;

    iget-object p2, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mPermissionsContainer:Landroid/view/View;

    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/PermissionUtil;->showPermissionsSnackbar(Landroid/os/Handler;Landroid/view/View;)V

    .line 1717
    :goto_2
    invoke-virtual {p0, p3}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/CheckBox;

    invoke-virtual {p1, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    goto :goto_4

    .line 1718
    :cond_4
    sget-object p2, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->VIDEO_RECORDING:Lcom/sonymobile/scan3d/PermissionUtil$Permissions;

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->getRequestCode()I

    move-result p2

    if-ne p1, p2, :cond_7

    if-nez v1, :cond_6

    .line 1721
    sget-object p1, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->VIDEO_RECORDING:Lcom/sonymobile/scan3d/PermissionUtil$Permissions;

    .line 1722
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->getOptionalPermissions()[Ljava/lang/String;

    move-result-object p1

    .line 1721
    invoke-direct {p0, v0, p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->deniedOnlyOptionalPermissions(Ljava/util/List;[Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_3

    .line 1730
    :cond_5
    iget-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mPermissionsHandler:Landroid/os/Handler;

    iget-object p2, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mPermissionsContainer:Landroid/view/View;

    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/PermissionUtil;->showPermissionsSnackbar(Landroid/os/Handler;Landroid/view/View;)V

    goto :goto_4

    .line 1723
    :cond_6
    :goto_3
    iget-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mPermissionsHandler:Landroid/os/Handler;

    iget-object p2, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mPermissionsContainer:Landroid/view/View;

    invoke-static {p2}, Lcom/sonymobile/scan3d/PermissionUtil;->removePermissionsContainer(Landroid/view/View;)Ljava/lang/Runnable;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    if-eqz v3, :cond_9

    .line 1726
    invoke-virtual {p0, p3}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/CheckBox;

    invoke-virtual {p1, v5}, Landroid/widget/CheckBox;->setChecked(Z)V

    goto :goto_4

    .line 1732
    :cond_7
    sget-object p2, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->STORAGE:Lcom/sonymobile/scan3d/PermissionUtil$Permissions;

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->getRequestCode()I

    move-result p2

    if-ne p1, p2, :cond_9

    if-eqz v1, :cond_8

    .line 1736
    iget-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mPermissionsHandler:Landroid/os/Handler;

    iget-object p2, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mPermissionsContainer:Landroid/view/View;

    invoke-static {p2}, Lcom/sonymobile/scan3d/PermissionUtil;->removePermissionsContainer(Landroid/view/View;)Ljava/lang/Runnable;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_4

    .line 1739
    :cond_8
    iget-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mPermissionsHandler:Landroid/os/Handler;

    iget-object p2, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mPermissionsContainer:Landroid/view/View;

    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/PermissionUtil;->showPermissionsSnackbar(Landroid/os/Handler;Landroid/view/View;)V

    :cond_9
    :goto_4
    return-void
.end method

.method protected onResume()V
    .locals 2
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1625
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onResume()V

    const v0, 0x7f0900f8

    .line 1627
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    invoke-direct {p0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->isAudioPreferred()Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object v1, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->AUDIO:Lcom/sonymobile/scan3d/PermissionUtil$Permissions;

    .line 1629
    invoke-virtual {v1}, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->getPermissions()[Ljava/lang/String;

    move-result-object v1

    .line 1628
    invoke-static {p0, v1}, Lcom/sonymobile/scan3d/PermissionUtil;->hasPermissions(Landroid/content/Context;[Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 1627
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 1630
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mSurfaceView:Lcom/sonymobile/scan3d/NativeGLTextureView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/NativeGLTextureView;->onResume()V

    .line 1631
    invoke-direct {p0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->updateFirstTimeInstructionVisibility()V

    .line 1632
    new-instance v0, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$ZfYGgc8TT2u00QJ0Hc_zY2Ejc2Q;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$ZfYGgc8TT2u00QJ0Hc_zY2Ejc2Q;-><init>(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)V

    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->runOnGlThread(Ljava/lang/Runnable;)V

    .line 1634
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mLastVideo:Landroid/net/Uri;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->contentExists(Landroid/net/Uri;)Z

    move-result v0

    if-nez v0, :cond_1

    const v0, 0x7f090217

    .line 1635
    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->hide(I)V

    .line 1636
    iput-object v1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mLastVideo:Landroid/net/Uri;

    .line 1639
    :cond_1
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mLastPicture:Landroid/net/Uri;

    if-eqz v0, :cond_2

    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->contentExists(Landroid/net/Uri;)Z

    move-result v0

    if-nez v0, :cond_2

    const v0, 0x7f090152

    .line 1640
    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->hide(I)V

    .line 1641
    iput-object v1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mLastPicture:Landroid/net/Uri;

    :cond_2
    return-void
.end method

.method protected onStart()V
    .locals 3
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1611
    new-instance v0, Landroid/media/SoundPool$Builder;

    invoke-direct {v0}, Landroid/media/SoundPool$Builder;-><init>()V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/media/SoundPool$Builder;->setMaxStreams(I)Landroid/media/SoundPool$Builder;

    move-result-object v0

    new-instance v2, Landroid/media/AudioAttributes$Builder;

    invoke-direct {v2}, Landroid/media/AudioAttributes$Builder;-><init>()V

    .line 1612
    invoke-virtual {v2, v1}, Landroid/media/AudioAttributes$Builder;->setLegacyStreamType(I)Landroid/media/AudioAttributes$Builder;

    move-result-object v1

    .line 1613
    invoke-virtual {v1}, Landroid/media/AudioAttributes$Builder;->build()Landroid/media/AudioAttributes;

    move-result-object v1

    .line 1611
    invoke-virtual {v0, v1}, Landroid/media/SoundPool$Builder;->setAudioAttributes(Landroid/media/AudioAttributes;)Landroid/media/SoundPool$Builder;

    move-result-object v0

    .line 1613
    invoke-virtual {v0}, Landroid/media/SoundPool$Builder;->build()Landroid/media/SoundPool;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mSoundPool:Landroid/media/SoundPool;

    .line 1614
    new-instance v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$12;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$12;-><init>(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mSounds:Landroid/util/SparseIntArray;

    .line 1619
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onStart()V

    return-void
.end method

.method protected onStop()V
    .locals 1
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1670
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mSoundPool:Landroid/media/SoundPool;

    invoke-virtual {v0}, Landroid/media/SoundPool;->release()V

    const/4 v0, 0x0

    .line 1671
    iput-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mSoundPool:Landroid/media/SoundPool;

    .line 1672
    iput-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mSounds:Landroid/util/SparseIntArray;

    .line 1673
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onStop()V

    return-void
.end method

.method public openPicture(Landroid/view/View;)V
    .locals 1
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1106
    iget-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mState:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    sget-object v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;->IDLE:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    if-eq p1, v0, :cond_0

    return-void

    .line 1109
    :cond_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mLastPicture:Landroid/net/Uri;

    if-eqz p1, :cond_1

    const-string v0, "image/jpeg"

    .line 1110
    invoke-direct {p0, p1, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->getAlbumViewIntent(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->startActivity(Landroid/content/Intent;)V

    :cond_1
    return-void
.end method

.method public openVideo(Landroid/view/View;)V
    .locals 1
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1216
    iget-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mState:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    sget-object v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;->IDLE:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    if-eq p1, v0, :cond_0

    return-void

    .line 1219
    :cond_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mLastVideo:Landroid/net/Uri;

    if-eqz p1, :cond_1

    const-string v0, "video/mp4"

    invoke-direct {p0, p1, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->getAlbumViewIntent(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->startActivity(Landroid/content/Intent;)V

    :cond_1
    return-void
.end method

.method public selectOther(Landroid/view/View;)V
    .locals 2
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1231
    iget-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mState:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    sget-object v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;->IDLE:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    if-eq p1, v0, :cond_0

    return-void

    .line 1233
    :cond_0
    new-instance p1, Landroid/content/Intent;

    const-string v0, "android.intent.action.PICK"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1234
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, "application/vnd.sony.scan3d"

    .line 1235
    invoke-virtual {p1, v0}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, "com.sonymobile.scan3d.intent.extra.SCAN_TYPE"

    const-string v1, "face,head"

    .line 1236
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, "com.sonymobile.scan3d.intent.extra.MIME_TYPES"

    const-string v1, "model/gltf-binary"

    .line 1237
    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, "com.sonymobile.scan3d.intent.extra.EXPLANATORY_TEXT"

    const v1, 0x7f10010a

    .line 1240
    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 1239
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/4 v0, 0x1

    .line 1241
    invoke-virtual {p0, p1, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 1243
    sget-object p1, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;->PICKING_MODEL:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->setState(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;)V

    return-void
.end method

.method public startRecording(Landroid/view/View;)V
    .locals 3
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1146
    iget-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mState:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    sget-object v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;->IDLE:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    if-eq p1, v0, :cond_0

    return-void

    .line 1149
    :cond_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->hasShownAudioPermissionsRequest()Z

    move-result p1

    const v0, 0x7f1002a8

    if-nez p1, :cond_1

    sget-object p1, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->VIDEO_RECORDING:Lcom/sonymobile/scan3d/PermissionUtil$Permissions;

    .line 1150
    invoke-direct {p0, p1, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->requestMissingPermissions(Lcom/sonymobile/scan3d/PermissionUtil$Permissions;I)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 1152
    invoke-direct {p0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->setAudioPermissionsRequestShown()V

    return-void

    .line 1156
    :cond_1
    sget-object p1, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->STORAGE:Lcom/sonymobile/scan3d/PermissionUtil$Permissions;

    invoke-direct {p0, p1, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->requestMissingPermissions(Lcom/sonymobile/scan3d/PermissionUtil$Permissions;I)Z

    move-result p1

    if-eqz p1, :cond_2

    return-void

    .line 1162
    :cond_2
    sget-object p1, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;->PREPARING_TO_RECORD:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->setState(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;)V

    .line 1165
    sget-object p1, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->sSoundPlayer:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$SoundPlayer;

    const v0, 0x7f0f001a

    invoke-interface {p1, p0, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$SoundPlayer;->play(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;I)V

    .line 1169
    iget-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mMainHandler:Landroid/os/Handler;

    new-instance v0, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$dULAFH31exsggG-MCkNHOVhSehk;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$dULAFH31exsggG-MCkNHOVhSehk;-><init>(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)V

    iget v1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mRecordingStartSoundDuration:I

    add-int/lit8 v1, v1, 0x14

    int-to-long v1, v1

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public stopRecording(Landroid/view/View;)V
    .locals 1
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1198
    iget-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mState:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    sget-object v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;->RECORDING:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    if-eq p1, v0, :cond_0

    return-void

    :cond_0
    const p1, 0x7f090217

    .line 1201
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mSurfaceView:Lcom/sonymobile/scan3d/NativeGLTextureView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/NativeGLTextureView;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 1204
    sget-object p1, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->sVideoRecorder:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$VideoRecorder;

    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mSurfaceView:Lcom/sonymobile/scan3d/NativeGLTextureView;

    invoke-interface {p1, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$VideoRecorder;->stop(Lcom/sonymobile/scan3d/NativeGLTextureView;)V

    return-void
.end method

.method public takePicture(Landroid/view/View;)V
    .locals 3
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1067
    iget-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mState:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    sget-object v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;->IDLE:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    if-eq p1, v0, :cond_0

    return-void

    .line 1070
    :cond_0
    sget-object p1, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->STORAGE:Lcom/sonymobile/scan3d/PermissionUtil$Permissions;

    const v0, 0x7f1002a8

    invoke-direct {p0, p1, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->requestMissingPermissions(Lcom/sonymobile/scan3d/PermissionUtil$Permissions;I)Z

    move-result p1

    if-eqz p1, :cond_1

    return-void

    .line 1075
    :cond_1
    sget-object p1, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;->TAKING_PICTURE:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->setState(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;)V

    const p1, 0x7f0900d6

    .line 1078
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->show(I)V

    .line 1079
    iget-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mMainHandler:Landroid/os/Handler;

    new-instance v0, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$DgGPv_U7ZP_xEAgv6LScvbVD34k;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$DgGPv_U7ZP_xEAgv6LScvbVD34k;-><init>(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)V

    const-wide/16 v1, 0x64

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1082
    sget-object p1, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->sSoundPlayer:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$SoundPlayer;

    const v0, 0x7f0f0018

    invoke-interface {p1, p0, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$SoundPlayer;->play(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;I)V

    .line 1085
    iget-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->mSurfaceView:Lcom/sonymobile/scan3d/NativeGLTextureView;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/NativeGLTextureView;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object p1

    const v0, 0x7f090152

    .line 1086
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 1089
    sget-object v0, Landroid/os/Environment;->DIRECTORY_PICTURES:Ljava/lang/String;

    const-string v1, "jpg"

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->createDateStampedFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 1090
    sget-object v1, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->sPictureSaver:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$PictureSaver;

    sget-object v2, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$A-0R8cd2IBsJXNfI2tcLeB9UN1U;->INSTANCE:Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$A-0R8cd2IBsJXNfI2tcLeB9UN1U;

    invoke-interface {v1, p0, p1, v0, v2}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$PictureSaver;->save(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Landroid/graphics/Bitmap;Ljava/io/File;Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$PictureSaver$SaveListener;)V

    return-void
.end method

.method public toggleAudio(Landroid/view/View;)V
    .locals 3
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1122
    check-cast p1, Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 1123
    sget-object p1, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->AUDIO:Lcom/sonymobile/scan3d/PermissionUtil$Permissions;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->getPermissions()[Ljava/lang/String;

    move-result-object p1

    .line 1124
    sget-object v0, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->AUDIO:Lcom/sonymobile/scan3d/PermissionUtil$Permissions;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->getRequestCode()I

    move-result v0

    .line 1126
    invoke-static {p0, p1}, Lcom/sonymobile/scan3d/PermissionUtil;->getMissingPermissions(Landroid/content/Context;[Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 1127
    array-length v2, v1

    if-lez v2, :cond_0

    const v2, 0x7f10005e

    .line 1128
    invoke-direct {p0, v2, p1, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->setupViewPermissionsButton(I[Ljava/lang/String;I)V

    .line 1130
    invoke-virtual {p0, v1, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->requestPermissions([Ljava/lang/String;I)V

    .line 1131
    invoke-direct {p0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->setAudioPermissionsRequestShown()V

    :cond_0
    return-void
.end method
