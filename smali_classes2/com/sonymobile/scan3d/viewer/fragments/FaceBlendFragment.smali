.class public Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;
.super Lcom/sonymobile/scan3d/viewer/fragments/BlendActionGLFragment;
.source "FaceBlendFragment.java"

# interfaces
.implements Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderListener;
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SeekBarTimer;,
        Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;
    }
.end annotation


# static fields
.field private static final ANIMATION_TIME:I = 0x190

.field private static final KEY_IS_SQUARE:Ljava/lang/String; = "view_is_square"

.field private static final KEY_SECONDARY_URI:Ljava/lang/String; = "secondary_uri"

.field private static final KEY_VIDEO_INTENT:Ljava/lang/String; = "video_intent"

.field private static final LENGTH_LONG:J = 0x1f40L

.field private static final SEEKBAR_MESH_ID:I = 0x2

.field private static final SEEKBAR_TEXTURE_ID:I = 0x1

.field private static final TAG:Ljava/lang/String; = "com.sonymobile.scan3d.viewer.fragments.FaceBlendFragment"


# instance fields
.field private mBottomBar:Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;

.field private mHandler:Landroid/os/Handler;

.field private mIsSquare:Z

.field private mMeshProgress:I

.field private mOblongButton:Landroid/widget/Button;

.field private mOpenAlbumIntent:Landroid/content/Intent;

.field private mPermissionsContainer:Landroid/view/View;

.field private mPermissionsHandler:Landroid/os/Handler;

.field private mSaveAsContainer:Landroid/view/View;

.field private mSaveState:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

.field private mSecondaryMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

.field private mSeekBarListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

.field private mSeekBarTimer:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SeekBarTimer;

.field private mShowRatioControls:Z

.field private mSquareButton:Landroid/widget/Button;

.field private mTextureProgress:I

.field private mViewResultContainer:Landroid/view/View;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 51
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BlendActionGLFragment;-><init>()V

    const/4 v0, 0x1

    .line 160
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mIsSquare:Z

    .line 192
    sget-object v0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;->IDLE:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mSaveState:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    .line 194
    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$1;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$1;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mSeekBarListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    return-void
.end method

.method static synthetic access$000(Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;)I
    .locals 0

    .line 51
    iget p0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mMeshProgress:I

    return p0
.end method

.method static synthetic access$100(Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;)I
    .locals 0

    .line 51
    iget p0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mTextureProgress:I

    return p0
.end method

.method static synthetic access$200(Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;)Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;
    .locals 0

    .line 51
    iget-object p0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mSaveState:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    return-object p0
.end method

.method private createRemovePermissionsContainerRunnable()Ljava/lang/Runnable;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 938
    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$FaceBlendFragment$Vb5PHD6sfdS0WyMTpzCTp1eWOck;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$FaceBlendFragment$Vb5PHD6sfdS0WyMTpzCTp1eWOck;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;)V

    return-object v0
.end method

.method private createRemoveViewResultContainerRunnable()Ljava/lang/Runnable;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 823
    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$FaceBlendFragment$mJcwXBvZQtwHr5q6IgOlrvrtFdI;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$FaceBlendFragment$mJcwXBvZQtwHr5q6IgOlrvrtFdI;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;)V

    return-object v0
.end method

.method private interruptOngoingSave()V
    .locals 3

    .line 800
    sget-object v0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;->IDLE:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mSaveState:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    .line 801
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mSeekBarTimer:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SeekBarTimer;

    if-eqz v0, :cond_0

    .line 802
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SeekBarTimer;->cancel()V

    :cond_0
    const/4 v0, 0x0

    .line 804
    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mOpenAlbumIntent:Landroid/content/Intent;

    .line 805
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 806
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getView()Landroid/view/View;

    move-result-object v0

    const v1, 0x7f090179

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 807
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getView()Landroid/view/View;

    move-result-object v0

    const v2, 0x7f09009c

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 809
    :cond_1
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mGLTextureView:Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;->stopEncoder()V

    const/4 v0, 0x1

    .line 810
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->setToolbarActionVisibility(Z)V

    .line 811
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mBottomBar:Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;

    iget-object v0, v0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;->textureContainer:Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;

    iget-object v0, v0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;->seekbar:Landroid/widget/SeekBar;

    iget v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mTextureProgress:I

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 812
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mBottomBar:Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;

    iget-object v0, v0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;->meshContainer:Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;

    iget-object v0, v0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;->seekbar:Landroid/widget/SeekBar;

    iget v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mMeshProgress:I

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 813
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/utils/SystemUtils;->setCurrentOrientation(Landroid/app/Activity;Z)V

    return-void
.end method

.method public static synthetic lambda$createRemovePermissionsContainerRunnable$8(Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;)V
    .locals 4

    .line 939
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 940
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getView()Landroid/view/View;

    move-result-object v0

    const v1, 0x7f09014c

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 941
    new-instance v1, Landroid/view/animation/TranslateAnimation;

    .line 942
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v2

    int-to-float v2, v2

    const/4 v3, 0x0

    invoke-direct {v1, v3, v3, v3, v2}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    const-wide/16 v2, 0x190

    .line 943
    invoke-virtual {v1, v2, v3}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    .line 944
    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    const/4 v1, 0x4

    .line 945
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    return-void
.end method

.method public static synthetic lambda$createRemoveViewResultContainerRunnable$7(Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;)V
    .locals 3

    const/4 v0, 0x0

    .line 827
    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mOpenAlbumIntent:Landroid/content/Intent;

    .line 828
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mViewResultContainer:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 829
    new-instance v0, Landroid/view/animation/TranslateAnimation;

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mViewResultContainer:Landroid/view/View;

    .line 830
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    int-to-float v1, v1

    const/4 v2, 0x0

    invoke-direct {v0, v2, v2, v2, v1}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    const-wide/16 v1, 0x190

    .line 831
    invoke-virtual {v0, v1, v2}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    .line 832
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mViewResultContainer:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 833
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mViewResultContainer:Landroid/view/View;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    return-void
.end method

.method public static synthetic lambda$onCreateView$0(Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;Landroid/view/View;)V
    .locals 0

    const/4 p1, 0x1

    .line 391
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->setViewRatio(Z)V

    return-void
.end method

.method public static synthetic lambda$onCreateView$1(Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;Landroid/view/View;)V
    .locals 0

    const/4 p1, 0x0

    .line 392
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->setViewRatio(Z)V

    return-void
.end method

.method public static synthetic lambda$onMeshLoaded$2(Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 560
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getFaceBlender()Lcom/sonymobile/scan3d/viewer/FaceBlender;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lcom/sonymobile/scan3d/viewer/FaceBlender;->load(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 562
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->dismissProgressDialog()V

    .line 564
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->requestRenderGLTextureView()V

    return-void
.end method

.method public static synthetic lambda$setupViewPermissionsButton$6(Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;Landroid/view/View;)V
    .locals 1

    .line 784
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mPermissionsContainer:Landroid/view/View;

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 785
    sget-object p1, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->STORAGE:Lcom/sonymobile/scan3d/PermissionUtil$Permissions;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->getPermissions()[Ljava/lang/String;

    move-result-object p1

    .line 786
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/sonymobile/scan3d/PermissionUtil;->shouldShowRequestPermissionRationale(Landroid/app/Activity;[Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 788
    sget-object v0, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->STORAGE:Lcom/sonymobile/scan3d/PermissionUtil$Permissions;

    .line 789
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->getRequestCode()I

    move-result v0

    .line 788
    invoke-virtual {p0, p1, v0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->requestPermissions([Ljava/lang/String;I)V

    goto :goto_0

    .line 791
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/sonymobile/scan3d/PermissionUtil;->startAppSettings(Landroid/content/Context;)V

    :goto_0
    return-void
.end method

.method public static synthetic lambda$setupViewResultButton$5(Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;Landroid/view/View;)V
    .locals 2

    .line 769
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mHandler:Landroid/os/Handler;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 770
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mViewResultContainer:Landroid/view/View;

    const/4 v1, 0x4

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 771
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mOpenAlbumIntent:Landroid/content/Intent;

    if-eqz p1, :cond_0

    .line 772
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->startActivity(Landroid/content/Intent;)V

    .line 774
    :cond_0
    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mOpenAlbumIntent:Landroid/content/Intent;

    return-void
.end method

.method public static synthetic lambda$showSaveAs$3(Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;Landroid/view/View;)V
    .locals 0

    const/4 p1, 0x0

    .line 677
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->setSaveAsContainerVisibility(Z)V

    .line 678
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->saveImage()V

    return-void
.end method

.method public static synthetic lambda$showSaveAs$4(Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;Landroid/view/View;Landroid/view/View;)V
    .locals 0

    const p2, 0x7f09009c

    .line 684
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    const p2, 0x7f100113

    .line 685
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    const/4 p1, 0x0

    .line 687
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->setSaveAsContainerVisibility(Z)V

    .line 688
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->saveVideo()V

    return-void
.end method

.method public static newInstance(Landroid/net/Uri;)Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;
    .locals 3

    .line 324
    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;-><init>()V

    .line 325
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "secondary_uri"

    .line 326
    invoke-virtual {v1, v2, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 327
    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->setArguments(Landroid/os/Bundle;)V

    return-object v0
.end method

.method public static newInstance(Ljava/util/ArrayList;)Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;
    .locals 4
    .param p0    # Ljava/util/ArrayList;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Landroidx/annotation/Size;
            value = 0x2L
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/net/Uri;",
            ">;)",
            "Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;"
        }
    .end annotation

    .line 339
    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;-><init>()V

    .line 340
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 341
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_0

    const-string v2, "first_uri"

    const/4 v3, 0x0

    .line 342
    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/Parcelable;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string v2, "secondary_uri"

    const/4 v3, 0x1

    .line 343
    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/os/Parcelable;

    invoke-virtual {v1, v2, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 345
    :cond_0
    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->setArguments(Landroid/os/Bundle;)V

    return-object v0
.end method

.method private saveImage()V
    .locals 3

    .line 697
    sget-object v0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "saveImage(): "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mSaveState:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 698
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mSaveState:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    sget-object v1, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;->WAITING:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    if-ne v0, v1, :cond_0

    .line 699
    sget-object v0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;->IMAGE:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mSaveState:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    .line 701
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/utils/SystemUtils;->setCurrentOrientation(Landroid/app/Activity;Z)V

    .line 704
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mViewResultContainer:Landroid/view/View;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 705
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 708
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mGLTextureView:Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 709
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mHandler:Landroid/os/Handler;

    invoke-static {v1, v2, v0}, Lcom/sonymobile/scan3d/utils/SharingUtil;->saveImage(Landroid/content/Context;Landroid/os/Handler;Landroid/graphics/Bitmap;)V

    const/4 v0, 0x0

    .line 710
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->setToolbarActionVisibility(Z)V

    :cond_0
    return-void
.end method

.method private saveVideo()V
    .locals 4

    .line 718
    sget-object v0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "saveVideo(): "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mSaveState:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 720
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mSaveState:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    sget-object v1, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;->WAITING:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    if-ne v0, v1, :cond_0

    .line 721
    sget-object v0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;->VIDEO:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mSaveState:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    .line 723
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/utils/SystemUtils;->setCurrentOrientation(Landroid/app/Activity;Z)V

    .line 726
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mViewResultContainer:Landroid/view/View;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 727
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 729
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "sharevideo_temp.mp4"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 730
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mGLTextureView:Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v2

    invoke-static {v2}, Lcom/sonymobile/scan3d/utils/SystemUtils;->getDisplayRefreshNsec(Landroid/app/Activity;)J

    move-result-wide v2

    invoke-virtual {v1, v0, p0, v2, v3}, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;->startEncoder(Ljava/io/File;Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderListener;J)V

    .line 733
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mBottomBar:Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;

    iget-object v0, v0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;->textureContainer:Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;

    iget-object v0, v0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;->seekbar:Landroid/widget/SeekBar;

    invoke-virtual {v0}, Landroid/widget/SeekBar;->getProgress()I

    move-result v0

    iput v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mTextureProgress:I

    .line 734
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mBottomBar:Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;

    iget-object v0, v0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;->meshContainer:Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;

    iget-object v0, v0, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;->seekbar:Landroid/widget/SeekBar;

    invoke-virtual {v0}, Landroid/widget/SeekBar;->getProgress()I

    move-result v0

    iput v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mMeshProgress:I

    .line 736
    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SeekBarTimer;

    iget v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mTextureProgress:I

    iget v2, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mMeshProgress:I

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-direct {v0, p0, v1}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SeekBarTimer;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;I)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mSeekBarTimer:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SeekBarTimer;

    .line 737
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mSeekBarTimer:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SeekBarTimer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SeekBarTimer;->start()Landroid/os/CountDownTimer;

    const/4 v0, 0x0

    .line 738
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->setToolbarActionVisibility(Z)V

    :cond_0
    return-void
.end method

.method private setSaveAsContainerVisibility(Z)V
    .locals 6

    .line 866
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getView()Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x4

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mSaveAsContainer:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-ne v0, v1, :cond_4

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mSaveAsContainer:Landroid/view/View;

    .line 867
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_4

    :goto_0
    const/4 v0, 0x0

    if-eqz p1, :cond_1

    .line 868
    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mSaveAsContainer:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v2

    goto :goto_1

    :cond_1
    move v2, v0

    :goto_1
    if-eqz p1, :cond_2

    move v3, v0

    goto :goto_2

    .line 869
    :cond_2
    iget-object v3, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mSaveAsContainer:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v3

    .line 870
    :goto_2
    new-instance v4, Landroid/view/animation/TranslateAnimation;

    int-to-float v2, v2

    int-to-float v3, v3

    const/4 v5, 0x0

    invoke-direct {v4, v5, v5, v2, v3}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    .line 871
    new-instance v2, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$2;

    invoke-direct {v2, p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$2;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;Z)V

    invoke-virtual {v4, v2}, Landroid/view/animation/TranslateAnimation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    const-wide/16 v2, 0x190

    .line 897
    invoke-virtual {v4, v2, v3}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    .line 898
    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mSaveAsContainer:Landroid/view/View;

    invoke-virtual {v2, v4}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 899
    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mSaveAsContainer:Landroid/view/View;

    if-eqz p1, :cond_3

    goto :goto_3

    :cond_3
    move v0, v1

    :goto_3
    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_4
    return-void
.end method

.method private setViewRatio(Z)V
    .locals 3

    .line 910
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mSaveState:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    sget-object v1, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;->IDLE:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    if-eq v0, v1, :cond_0

    return-void

    .line 914
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 915
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mGLTextureView:Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    .line 916
    iget v2, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v0, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-static {v2, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-eqz p1, :cond_1

    .line 917
    iget v0, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    goto :goto_0

    :cond_1
    iget v0, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    mul-int/lit8 v0, v0, 0x4

    div-int/lit8 v0, v0, 0x3

    :goto_0
    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 918
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mIsSquare:Z

    .line 919
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mShowRatioControls:Z

    if-eqz v0, :cond_3

    const v0, 0x7f0600cc

    const v1, 0x7f08007b

    if-eqz p1, :cond_2

    .line 921
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mSquareButton:Landroid/widget/Button;

    invoke-virtual {p1, v1}, Landroid/widget/Button;->setBackgroundResource(I)V

    .line 922
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mOblongButton:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->getColor(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setBackgroundColor(I)V

    goto :goto_1

    .line 924
    :cond_2
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mOblongButton:Landroid/widget/Button;

    invoke-virtual {p1, v1}, Landroid/widget/Button;->setBackgroundResource(I)V

    .line 925
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mSquareButton:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->getColor(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 928
    :cond_3
    :goto_1
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mGLTextureView:Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;->requestLayout()V

    return-void
.end method

.method private setupBottomBar(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .locals 4

    const/4 v0, 0x1

    .line 749
    invoke-static {p1, p2, v0}, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;->inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mBottomBar:Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;

    .line 750
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mBottomBar:Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;

    iget-object p1, p1, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;->textureContainer:Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;

    iget-object p1, p1, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;->seekbar:Landroid/widget/SeekBar;

    invoke-virtual {p1, v0}, Landroid/widget/SeekBar;->setId(I)V

    .line 751
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mBottomBar:Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;

    iget-object p1, p1, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;->meshContainer:Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;

    iget-object p1, p1, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;->seekbar:Landroid/widget/SeekBar;

    const/4 p2, 0x2

    invoke-virtual {p1, p2}, Landroid/widget/SeekBar;->setId(I)V

    .line 752
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mBottomBar:Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;

    iget-object p1, p1, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;->textureContainer:Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;

    iget-object p1, p1, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;->seekbar:Landroid/widget/SeekBar;

    const p2, 0x7f10003c

    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/SeekBar;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 753
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mBottomBar:Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;

    iget-object p1, p1, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;->meshContainer:Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;

    iget-object p1, p1, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;->seekbar:Landroid/widget/SeekBar;

    const p2, 0x7f100036

    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/SeekBar;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 754
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mBottomBar:Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;

    iget-object p1, p1, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;->textureContainer:Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;

    iget-object p1, p1, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;->seekbar:Landroid/widget/SeekBar;

    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mBottomBar:Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;

    iget-object p2, p2, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;->textureContainer:Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;

    iget-object p2, p2, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;->seekbar:Landroid/widget/SeekBar;

    .line 755
    invoke-virtual {p2}, Landroid/widget/SeekBar;->getMax()I

    move-result p2

    int-to-double v0, p2

    const-wide/high16 v2, 0x3fe0000000000000L    # 0.5

    mul-double/2addr v0, v2

    double-to-int p2, v0

    .line 754
    invoke-virtual {p1, p2}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 756
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mBottomBar:Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;

    iget-object p1, p1, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;->meshContainer:Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;

    iget-object p1, p1, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;->seekbar:Landroid/widget/SeekBar;

    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mBottomBar:Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;

    iget-object p2, p2, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;->meshContainer:Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;

    iget-object p2, p2, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;->seekbar:Landroid/widget/SeekBar;

    .line 757
    invoke-virtual {p2}, Landroid/widget/SeekBar;->getMax()I

    move-result p2

    int-to-double v0, p2

    mul-double/2addr v0, v2

    double-to-int p2, v0

    .line 756
    invoke-virtual {p1, p2}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 759
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mBottomBar:Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;

    iget-object p1, p1, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;->textureContainer:Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;

    iget-object p1, p1, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;->seekbar:Landroid/widget/SeekBar;

    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mSeekBarListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    invoke-virtual {p1, p2}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 760
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mBottomBar:Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;

    iget-object p1, p1, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendBottomBarBinding;->meshContainer:Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;

    iget-object p1, p1, Lcom/sonymobile/scan3d/databinding/ComponentFaceblendSeekbarBinding;->seekbar:Landroid/widget/SeekBar;

    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mSeekBarListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    invoke-virtual {p1, p2}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    return-void
.end method

.method private setupViewPermissionsButton()V
    .locals 2

    .line 782
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mPermissionsContainer:Landroid/view/View;

    const v1, 0x7f09014b

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 783
    new-instance v1, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$FaceBlendFragment$gBaD4whWHCGKvYguJWFc3NCrSXU;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$FaceBlendFragment$gBaD4whWHCGKvYguJWFc3NCrSXU;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private setupViewResultButton()V
    .locals 2

    .line 767
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mViewResultContainer:Landroid/view/View;

    const v1, 0x7f09021d

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 768
    new-instance v1, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$FaceBlendFragment$krdWQs4s5acEaUCrlpMRGAn6AQM;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$FaceBlendFragment$krdWQs4s5acEaUCrlpMRGAn6AQM;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private showSaveAs()V
    .locals 3

    .line 665
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 667
    sget-object v1, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;->WAITING:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    iput-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mSaveState:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    .line 670
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mHandler:Landroid/os/Handler;

    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->createRemoveViewResultContainerRunnable()Ljava/lang/Runnable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    const/4 v1, 0x1

    .line 673
    invoke-direct {p0, v1}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->setSaveAsContainerVisibility(Z)V

    const v1, 0x7f090175

    .line 676
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    new-instance v2, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$FaceBlendFragment$_ryLxvjFnOazBrj-N86AoFuujNk;

    invoke-direct {v2, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$FaceBlendFragment$_ryLxvjFnOazBrj-N86AoFuujNk;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v1, 0x7f090176

    .line 680
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    new-instance v2, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$FaceBlendFragment$5WnsixrpiYuf-vc2E6y7VKOelLs;

    invoke-direct {v2, p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$FaceBlendFragment$5WnsixrpiYuf-vc2E6y7VKOelLs;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;Landroid/view/View;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_0
    return-void
.end method

.method private showViewResultContainer()V
    .locals 3

    .line 842
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mViewResultContainer:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_2

    .line 844
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getView()Landroid/view/View;

    move-result-object v0

    const v1, 0x7f09021f

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 845
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mSaveState:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    sget-object v2, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;->VIDEO:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    if-ne v1, v2, :cond_0

    const v1, 0x7f10011b

    .line 846
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    .line 847
    :cond_0
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mSaveState:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    sget-object v2, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;->IMAGE:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    if-ne v1, v2, :cond_1

    const v1, 0x7f100115

    .line 848
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 851
    :cond_1
    :goto_0
    new-instance v0, Landroid/view/animation/TranslateAnimation;

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mViewResultContainer:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    int-to-float v1, v1

    const/4 v2, 0x0

    invoke-direct {v0, v2, v2, v1, v2}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    const-wide/16 v1, 0x190

    .line 852
    invoke-virtual {v0, v1, v2}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    .line 853
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mViewResultContainer:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 854
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mViewResultContainer:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_2
    return-void
.end method


# virtual methods
.method public allowMotion(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 654
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mSaveState:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    sget-object v0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;->IDLE:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public getContentLayout()I
    .locals 1

    const v0, 0x7f0c0068

    return v0
.end method

.method protected getTitleId()I
    .locals 1

    const v0, 0x7f10011a

    return v0
.end method

.method protected getToolBarActionText()I
    .locals 1

    const v0, 0x7f100249

    return v0
.end method

.method public handleMessage(Landroid/os/Message;)Z
    .locals 5

    .line 601
    sget-object v0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "handleMessage(): "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Landroid/os/Message;->what:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 604
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    const v1, 0x7f09009c

    .line 606
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const-string v1, ""

    .line 607
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v1, 0x4

    .line 608
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 611
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 613
    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/utils/SystemUtils;->setCurrentOrientation(Landroid/app/Activity;Z)V

    .line 616
    :cond_1
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    move v1, v2

    goto :goto_0

    .line 619
    :pswitch_1
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Landroid/content/Intent;

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mOpenAlbumIntent:Landroid/content/Intent;

    .line 620
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->setupViewResultButton()V

    .line 623
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->showViewResultContainer()V

    .line 624
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mHandler:Landroid/os/Handler;

    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->createRemoveViewResultContainerRunnable()Ljava/lang/Runnable;

    move-result-object v0

    const-wide/16 v3, 0x1f40

    invoke-virtual {p1, v0, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    move v1, v2

    .line 637
    :goto_0
    sget-object p1, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;->IDLE:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mSaveState:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    .line 638
    invoke-virtual {p0, v2}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->setToolbarActionVisibility(Z)V

    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected onActionClick()V
    .locals 2

    .line 498
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->STORAGE:Lcom/sonymobile/scan3d/PermissionUtil$Permissions;

    .line 499
    invoke-virtual {v1}, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->getPermissions()[Ljava/lang/String;

    move-result-object v1

    .line 498
    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/PermissionUtil;->getMissingPermissions(Landroid/content/Context;[Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 500
    array-length v1, v0

    if-lez v1, :cond_0

    .line 501
    sget-object v1, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->STORAGE:Lcom/sonymobile/scan3d/PermissionUtil$Permissions;

    .line 502
    invoke-virtual {v1}, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->getRequestCode()I

    move-result v1

    .line 501
    invoke-virtual {p0, v0, v1}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->requestPermissions([Ljava/lang/String;I)V

    goto :goto_0

    .line 504
    :cond_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->showSaveAs()V

    :goto_0
    return-void
.end method

.method public onBackPressed()Z
    .locals 3

    .line 510
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 512
    sget-object v0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$3;->$SwitchMap$com$sonymobile$scan3d$viewer$fragments$FaceBlendFragment$SaveState:[I

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mSaveState:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_0

    .line 526
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object v0

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mSecondaryMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentTransaction;->remove(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentTransaction;->commit()I

    .line 527
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0, v2}, Lcom/sonymobile/scan3d/utils/SystemUtils;->setCurrentOrientation(Landroid/app/Activity;Z)V

    .line 528
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BlendActionGLFragment;->onBackPressed()Z

    move-result v0

    return v0

    .line 520
    :pswitch_0
    sget-object v0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;->IDLE:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mSaveState:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    .line 521
    invoke-direct {p0, v2}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->setSaveAsContainerVisibility(Z)V

    return v1

    .line 516
    :pswitch_1
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->interruptOngoingSave()V

    return v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 351
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/BlendActionGLFragment;->onCreate(Landroid/os/Bundle;)V

    .line 352
    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1, p0}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mHandler:Landroid/os/Handler;

    .line 353
    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mPermissionsHandler:Landroid/os/Handler;

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 3

    .line 359
    invoke-super {p0, p1, p2, p3}, Lcom/sonymobile/scan3d/viewer/fragments/BlendActionGLFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object p2

    .line 360
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v0, p0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->setMeshLoadingListener(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$MeshLoadingListener;)V

    if-nez p3, :cond_0

    .line 364
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    if-eqz v0, :cond_0

    .line 365
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->resetFaceBlender()V

    :cond_0
    if-eqz p3, :cond_1

    const-string v0, "video_intent"

    .line 371
    invoke-virtual {p3, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/content/Intent;

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mOpenAlbumIntent:Landroid/content/Intent;

    const-string v0, "view_is_square"

    .line 372
    invoke-virtual {p3, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p3

    iput-boolean p3, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mIsSquare:Z

    :cond_1
    const p3, 0x7f09005f

    .line 375
    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_2

    .line 377
    invoke-direct {p0, p1, v0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->setupBottomBar(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V

    :cond_2
    const p1, 0x7f09021e

    .line 380
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mViewResultContainer:Landroid/view/View;

    const p1, 0x7f090174

    .line 381
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mSaveAsContainer:Landroid/view/View;

    const p1, 0x7f09014c

    .line 382
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mPermissionsContainer:Landroid/view/View;

    .line 384
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentActivity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    .line 385
    iget v0, p1, Landroid/util/DisplayMetrics;->heightPixels:I

    mul-int/lit8 v0, v0, 0x9

    iget p1, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    mul-int/lit8 p1, p1, 0x13

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-le v0, p1, :cond_3

    move p1, v1

    goto :goto_0

    :cond_3
    move p1, v2

    :goto_0
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mShowRatioControls:Z

    .line 386
    iget-boolean p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mShowRatioControls:Z

    if-eqz p1, :cond_4

    const p1, 0x7f090198

    .line 387
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 388
    invoke-virtual {p1, v2}, Landroidx/constraintlayout/widget/ConstraintLayout;->setVisibility(I)V

    const p1, 0x7f090074

    .line 389
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mSquareButton:Landroid/widget/Button;

    const p1, 0x7f090075

    .line 390
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mOblongButton:Landroid/widget/Button;

    .line 391
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mSquareButton:Landroid/widget/Button;

    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$FaceBlendFragment$_soEfam8BtVLiuJgECNZBOeau74;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$FaceBlendFragment$_soEfam8BtVLiuJgECNZBOeau74;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 392
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mOblongButton:Landroid/widget/Button;

    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$FaceBlendFragment$x225N6swrazyx2e41y8-rml3dAE;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$FaceBlendFragment$x225N6swrazyx2e41y8-rml3dAE;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 393
    iget-boolean p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mIsSquare:Z

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->setViewRatio(Z)V

    .line 397
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mSaveAsContainer:Landroid/view/View;

    .line 398
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v0, 0x6

    .line 399
    invoke-virtual {p1, v0, p3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 400
    iget-object p3, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mSaveAsContainer:Landroid/view/View;

    invoke-virtual {p3, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_1

    .line 402
    :cond_4
    invoke-direct {p0, v1}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->setViewRatio(Z)V

    .line 405
    :goto_1
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->setupViewPermissionsButton()V

    .line 407
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string p3, "secondary_uri"

    invoke-virtual {p1, p3}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/net/Uri;

    .line 408
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p3

    invoke-static {p3, p1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getInstance(Landroidx/fragment/app/FragmentActivity;Landroid/net/Uri;)Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mSecondaryMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    .line 409
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mSecondaryMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {p1, p0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->setMeshLoadingListener(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$MeshLoadingListener;)V

    return-object p2
.end method

.method public bridge synthetic onDestroy()V
    .locals 0

    .line 51
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BlendActionGLFragment;->onDestroy()V

    return-void
.end method

.method public onEncoderFinished()V
    .locals 3

    .line 586
    sget-object v0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->TAG:Ljava/lang/String;

    const-string v1, "onEncoderFinished()"

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 587
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mSaveState:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    sget-object v1, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;->VIDEO:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    if-ne v0, v1, :cond_0

    .line 590
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mHandler:Landroid/os/Handler;

    const-string v2, "sharevideo_temp.mp4"

    invoke-static {v0, v1, v2}, Lcom/sonymobile/scan3d/utils/SharingUtil;->saveVideo(Landroid/content/Context;Landroid/os/Handler;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public bridge synthetic onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 0

    .line 51
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/BlendActionGLFragment;->onMenuItemClick(Landroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method

.method public onMeshLoadFailed(Landroid/net/Uri;)V
    .locals 0

    return-void
.end method

.method public onMeshLoaded(Landroid/net/Uri;Lcom/sonymobile/scan3d/viewer/ModelContainer;)V
    .locals 3

    .line 552
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->isAdded()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 553
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getFileSet()Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mSecondaryMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getFileSet()Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 554
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getPath()Ljava/lang/String;

    move-result-object p1

    .line 555
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mSecondaryMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getPath()Ljava/lang/String;

    move-result-object p2

    .line 556
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->getPassword(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    const v1, 0x7f100116

    const/4 v2, 0x1

    .line 558
    invoke-virtual {p0, v1, v2}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->showProgressDialog(IZ)V

    .line 559
    new-instance v1, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$FaceBlendFragment$lSLJaSuOKKlsV3A2OckWRl4pwEA;

    invoke-direct {v1, p0, p1, p2, v0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$FaceBlendFragment$lSLJaSuOKKlsV3A2OckWRl4pwEA;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->queueGlEvent(Ljava/lang/Runnable;)V

    .line 566
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->requestRenderGLTextureView()V

    :cond_0
    return-void
.end method

.method public onMeshLoading(Landroid/net/Uri;)V
    .locals 1

    const p1, 0x7f100116

    const/4 v0, 0x1

    .line 573
    invoke-virtual {p0, p1, v0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->showProgressDialog(IZ)V

    return-void
.end method

.method protected onNavigationClick()V
    .locals 2

    .line 536
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object v0

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mSecondaryMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentTransaction;->remove(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentTransaction;->commit()I

    .line 537
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/utils/SystemUtils;->setCurrentOrientation(Landroid/app/Activity;Z)V

    .line 538
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BlendActionGLFragment;->onNavigationClick()V

    return-void
.end method

.method public onPause()V
    .locals 2

    .line 433
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BlendActionGLFragment;->onPause()V

    .line 435
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mSaveState:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    sget-object v1, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;->VIDEO:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mSaveState:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    sget-object v1, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;->IMAGE:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    if-ne v0, v1, :cond_1

    .line 436
    :cond_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->interruptOngoingSave()V

    .line 440
    :cond_1
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 2
    .param p2    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # [I
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 446
    sget-object v0, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->STORAGE:Lcom/sonymobile/scan3d/PermissionUtil$Permissions;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->getRequestCode()I

    move-result v0

    if-ne p1, v0, :cond_3

    const/4 p1, 0x0

    move v0, p1

    .line 448
    :goto_0
    array-length v1, p2

    if-ge v0, v1, :cond_1

    .line 449
    aget v1, p3, v0

    if-eqz v1, :cond_0

    move p2, p1

    goto :goto_1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 p2, 0x1

    .line 455
    :goto_1
    iget-object p3, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mPermissionsHandler:Landroid/os/Handler;

    const/4 v0, 0x0

    invoke-virtual {p3, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    if-eqz p2, :cond_2

    .line 457
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->showSaveAs()V

    .line 459
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mPermissionsContainer:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result p1

    if-nez p1, :cond_3

    .line 460
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mPermissionsHandler:Landroid/os/Handler;

    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->createRemovePermissionsContainerRunnable()Ljava/lang/Runnable;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_2

    .line 465
    :cond_2
    new-instance p2, Landroid/view/animation/TranslateAnimation;

    iget-object p3, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mPermissionsContainer:Landroid/view/View;

    .line 466
    invoke-virtual {p3}, Landroid/view/View;->getHeight()I

    move-result p3

    int-to-float p3, p3

    const/4 v0, 0x0

    invoke-direct {p2, v0, v0, p3, v0}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    const-wide/16 v0, 0x190

    .line 467
    invoke-virtual {p2, v0, v1}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    .line 468
    iget-object p3, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mPermissionsContainer:Landroid/view/View;

    invoke-virtual {p3, p2}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 469
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mPermissionsContainer:Landroid/view/View;

    invoke-virtual {p2, p1}, Landroid/view/View;->setVisibility(I)V

    .line 470
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mPermissionsHandler:Landroid/os/Handler;

    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->createRemovePermissionsContainerRunnable()Ljava/lang/Runnable;

    move-result-object p2

    const-wide/16 v0, 0x1f40

    invoke-virtual {p1, p2, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_3
    :goto_2
    return-void
.end method

.method public onResume()V
    .locals 4

    .line 415
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BlendActionGLFragment;->onResume()V

    .line 417
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mOpenAlbumIntent:Landroid/content/Intent;

    if-eqz v0, :cond_0

    .line 418
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mViewResultContainer:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 419
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->setupViewResultButton()V

    .line 420
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mHandler:Landroid/os/Handler;

    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->createRemoveViewResultContainerRunnable()Ljava/lang/Runnable;

    move-result-object v1

    const-wide/16 v2, 0x1f40

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_0
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    .line 426
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/BlendActionGLFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    const-string v0, "video_intent"

    .line 427
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mOpenAlbumIntent:Landroid/content/Intent;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string v0, "view_is_square"

    .line 428
    iget-boolean v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->mIsSquare:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method public onSingleTouch()V
    .locals 0

    return-void
.end method

.method public bridge synthetic queueGlEvent(Ljava/lang/Runnable;)V
    .locals 0

    .line 51
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/BlendActionGLFragment;->queueGlEvent(Ljava/lang/Runnable;)V

    return-void
.end method

.method protected showToolbar()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method
