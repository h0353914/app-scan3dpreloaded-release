.class public Lcom/sonymobile/scan3d/Scan3dActivity;
.super Landroidx/fragment/app/FragmentActivity;
.source "Scan3dActivity.java"

# interfaces
.implements Landroid/view/ScaleGestureDetector$OnScaleGestureListener;
.implements Landroid/view/View$OnTouchListener;
.implements Lcom/sonymobile/scan3d/SphinxToastView$ISphinxToastListener;
.implements Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;
.implements Lcom/sonymobile/scan3d/EnvironmentWarningsDialog$OnEnvironmentWarnings;
.implements Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$ErrorDialogCallback;
.implements Landroid/content/ServiceConnection;
.implements Landroid/view/SurfaceHolder$Callback;
.implements Lcom/sonymobile/scan3d/ISphinxManager$ISphinxListener;
.implements Lcom/sonymobile/scan3d/ThermalAlertReceiver$ThermalAlertCallback;
.implements Lcom/sonymobile/scan3d/BreakScanningDialog$OnBadStartListener;


# static fields
.field private static final BLOB_INITIAL_SCALE_FACTOR:F = 1.0f

.field private static final BLOB_SCALE_FACTOR_MAX:F = 1.5f

.field private static final BLOB_SCALE_FACTOR_MIN:F = 0.5f

.field private static final DEBUG_LIFECYCLE:Z = false

.field private static final DIALOG_TAG:Ljava/lang/String; = "dialog"

.field public static final INTENT_EXTRA_ENV_ERROR:Ljava/lang/String; = "env_error"

.field public static final INTENT_EXTRA_LONG_SCAN:Ljava/lang/String; = "long_scan"

.field public static final INTENT_EXTRA_SHORT_SCAN:Ljava/lang/String; = "short_scan"

.field public static final INTENT_EXTRA_SPHINX_POLICY:Ljava/lang/String; = "policy"

.field private static final PERMISSIONS:[Ljava/lang/String;

.field public static final RESULT_CODE_COULD_NOT_SAVE:I = 0x3

.field public static final RESULT_CODE_NO_PERMISSON:I = 0x2

.field public static final RESULT_CODE_SUCCESS:I = 0x1

.field private static final SHORT_SCAN_THRESHOLD:J = 0x7d0L

.field private static final TAG:Ljava/lang/String; = "com.sonymobile.scan3d.Scan3dActivity"


# instance fields
.field private mActionButton:Landroid/widget/Button;

.field private mBound:Z

.field private mCloseButton:Landroid/view/View;

.field private mConfirmCancelDialog:Landroidx/appcompat/app/AlertDialog;

.field private mCurrentScale:F

.field private mDoneButtonTimestamp:J

.field private mDoneToastView:Lcom/sonymobile/scan3d/SphinxToastView;

.field private mEnvironmentErrors:[Lcom/sonymobile/scan3d/EnvironmentError;

.field private mGestureDetector:Landroid/view/ScaleGestureDetector;

.field private mHintQueue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Lcom/sonymobile/scan3d/SphinxHint;",
            ">;"
        }
    .end annotation
.end field

.field private mLongScan:Z

.field private mMainToastView:Lcom/sonymobile/scan3d/SphinxToastView;

.field private mManualFocusSeekBar:Landroid/widget/SeekBar;

.field private mPlayer:Lcom/sonymobile/scan3d/AudioPlayer;

.field protected mPolicy:I

.field private mProgressBar:Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;

.field private mResourceLookup:Lcom/sonymobile/scan3d/SphinxResourceLookup;

.field private mScanStarted:Z

.field private mShortScan:Z

.field private mSphinxManager:Lcom/sonymobile/scan3d/ISphinxManager;

.field private mStartingProgressView:Landroid/view/View;

.field private mStepIndicator:Lcom/sonymobile/scan3d/widgets/SphinxStepIndicator;

.field private mThermalAlertReceiver:Lcom/sonymobile/scan3d/ThermalAlertReceiver;

.field private mTooHotToStart:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "android.permission.CAMERA"

    .line 101
    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/sonymobile/scan3d/Scan3dActivity;->PERMISSIONS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 73
    invoke-direct {p0}, Landroidx/fragment/app/FragmentActivity;-><init>()V

    const/high16 v0, 0x3f800000    # 1.0f

    .line 222
    iput v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mCurrentScale:F

    .line 227
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mHintQueue:Ljava/util/Queue;

    .line 232
    new-instance v0, Lcom/sonymobile/scan3d/SphinxResourceLookup;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/SphinxResourceLookup;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mResourceLookup:Lcom/sonymobile/scan3d/SphinxResourceLookup;

    const/4 v0, 0x0

    .line 257
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mScanStarted:Z

    return-void
.end method

.method private confirmCancelScan(Landroid/content/Context;)V
    .locals 3

    .line 1116
    new-instance v0, Landroidx/appcompat/app/AlertDialog$Builder;

    new-instance v1, Landroidx/appcompat/view/ContextThemeWrapper;

    const v2, 0x7f110132

    invoke-direct {v1, p0, v2}, Landroidx/appcompat/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    invoke-direct {v0, v1}, Landroidx/appcompat/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f1000bc

    .line 1118
    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setMessage(I)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 1119
    new-instance v1, Lcom/sonymobile/scan3d/-$$Lambda$Scan3dActivity$njEtZQwUc5FXK-cagcXf9PG2K3s;

    invoke-direct {v1, p0, p1}, Lcom/sonymobile/scan3d/-$$Lambda$Scan3dActivity$njEtZQwUc5FXK-cagcXf9PG2K3s;-><init>(Lcom/sonymobile/scan3d/Scan3dActivity;Landroid/content/Context;)V

    const p1, 0x7f1000bb

    invoke-virtual {v0, p1, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    const p1, 0x7f1000c1

    const/4 v1, 0x0

    .line 1123
    invoke-virtual {v0, p1, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 1124
    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog$Builder;->create()Landroidx/appcompat/app/AlertDialog;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mConfirmCancelDialog:Landroidx/appcompat/app/AlertDialog;

    .line 1125
    iget-object p1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mConfirmCancelDialog:Landroidx/appcompat/app/AlertDialog;

    new-instance v0, Lcom/sonymobile/scan3d/-$$Lambda$Scan3dActivity$v5SMch64C3fnVL4uBY0Xd2WQVQE;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/-$$Lambda$Scan3dActivity$v5SMch64C3fnVL4uBY0Xd2WQVQE;-><init>(Lcom/sonymobile/scan3d/Scan3dActivity;)V

    invoke-virtual {p1, v0}, Landroidx/appcompat/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 1132
    iget-object p1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mConfirmCancelDialog:Landroidx/appcompat/app/AlertDialog;

    invoke-virtual {p1}, Landroidx/appcompat/app/AlertDialog;->show()V

    return-void
.end method

.method private disableBlobResizing()V
    .locals 2

    .line 712
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mGestureDetector:Landroid/view/ScaleGestureDetector;

    if-eqz v0, :cond_0

    const v0, 0x7f0900e0

    .line 713
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/Scan3dActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 714
    iput-object v1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mGestureDetector:Landroid/view/ScaleGestureDetector;

    :cond_0
    return-void
.end method

.method private enableBlobResizing()V
    .locals 1

    .line 702
    new-instance v0, Landroid/view/ScaleGestureDetector;

    invoke-direct {v0, p0, p0}, Landroid/view/ScaleGestureDetector;-><init>(Landroid/content/Context;Landroid/view/ScaleGestureDetector$OnScaleGestureListener;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mGestureDetector:Landroid/view/ScaleGestureDetector;

    const v0, 0x7f0900e0

    .line 705
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/Scan3dActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    return-void
.end method

.method private handleHint(Lcom/sonymobile/scan3d/SphinxHint;)Z
    .locals 6

    .line 568
    iget v0, p1, Lcom/sonymobile/scan3d/SphinxHint;->code:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_0

    .line 650
    :pswitch_0
    sget-object v0, Lcom/sonymobile/scan3d/Scan3dActivity;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cannot handle hint.code="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, p1, Lcom/sonymobile/scan3d/SphinxHint;->code:I

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_3

    .line 647
    :pswitch_1
    iget v0, p1, Lcom/sonymobile/scan3d/SphinxHint;->arg1:I

    iget p1, p1, Lcom/sonymobile/scan3d/SphinxHint;->arg2:I

    invoke-direct {p0, v0, p1}, Lcom/sonymobile/scan3d/Scan3dActivity;->showBreakScanningDialog(II)V

    goto/16 :goto_3

    .line 636
    :pswitch_2
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mProgressBar:Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;

    iget p1, p1, Lcom/sonymobile/scan3d/SphinxHint;->arg1:I

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;->setProgress(I)V

    goto/16 :goto_3

    .line 633
    :pswitch_3
    iget-object p1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mProgressBar:Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;->hide()V

    goto/16 :goto_3

    .line 630
    :pswitch_4
    iget-object p1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mProgressBar:Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;->show()V

    goto/16 :goto_3

    .line 639
    :pswitch_5
    iget p1, p1, Lcom/sonymobile/scan3d/SphinxHint;->arg1:I

    if-eqz p1, :cond_0

    move v1, v2

    :cond_0
    if-eqz v1, :cond_1

    .line 641
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Scan3dActivity;->enableBlobResizing()V

    goto/16 :goto_3

    .line 643
    :cond_1
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Scan3dActivity;->disableBlobResizing()V

    goto/16 :goto_3

    .line 613
    :pswitch_6
    iget-object p1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mStepIndicator:Lcom/sonymobile/scan3d/widgets/SphinxStepIndicator;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicator;->setVisibility(I)V

    goto/16 :goto_3

    .line 606
    :pswitch_7
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mResourceLookup:Lcom/sonymobile/scan3d/SphinxResourceLookup;

    iget v3, p1, Lcom/sonymobile/scan3d/SphinxHint;->arg1:I

    invoke-virtual {v0, v3}, Lcom/sonymobile/scan3d/SphinxResourceLookup;->getStageResource(I)I

    move-result v0

    .line 607
    iget-object v3, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mStepIndicator:Lcom/sonymobile/scan3d/widgets/SphinxStepIndicator;

    iget v4, p1, Lcom/sonymobile/scan3d/SphinxHint;->arg3:I

    invoke-virtual {v3, v4}, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicator;->setNbrOfSteps(I)V

    .line 608
    iget-object v3, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mStepIndicator:Lcom/sonymobile/scan3d/widgets/SphinxStepIndicator;

    iget p1, p1, Lcom/sonymobile/scan3d/SphinxHint;->arg2:I

    invoke-virtual {v3, p1, v0}, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicator;->selectStep(II)V

    .line 609
    iget-object p1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mStepIndicator:Lcom/sonymobile/scan3d/widgets/SphinxStepIndicator;

    invoke-virtual {p1, v1}, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicator;->setVisibility(I)V

    goto/16 :goto_3

    .line 627
    :pswitch_8
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Scan3dActivity;->hideActionButton()V

    goto/16 :goto_3

    .line 617
    :pswitch_9
    iget v0, p1, Lcom/sonymobile/scan3d/SphinxHint;->arg1:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_2

    .line 618
    iget-wide v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mDoneButtonTimestamp:J

    const-wide/16 v3, 0x0

    cmp-long v0, v0, v3

    if-nez v0, :cond_2

    .line 619
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mDoneButtonTimestamp:J

    .line 623
    :cond_2
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mResourceLookup:Lcom/sonymobile/scan3d/SphinxResourceLookup;

    iget p1, p1, Lcom/sonymobile/scan3d/SphinxHint;->arg1:I

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/SphinxResourceLookup;->getButtonResource(I)I

    move-result p1

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/Scan3dActivity;->showActionButton(I)V

    goto :goto_3

    .line 598
    :pswitch_a
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mPlayer:Lcom/sonymobile/scan3d/AudioPlayer;

    if-eqz v0, :cond_3

    .line 599
    iget p1, p1, Lcom/sonymobile/scan3d/SphinxHint;->arg1:I

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/AudioPlayer;->stop(I)V

    .line 601
    :cond_3
    iget-object p1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mDoneToastView:Lcom/sonymobile/scan3d/SphinxToastView;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/SphinxToastView;->hide()V

    .line 602
    iget-object p1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mMainToastView:Lcom/sonymobile/scan3d/SphinxToastView;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/SphinxToastView;->hide()V

    goto :goto_3

    .line 571
    :pswitch_b
    iget v0, p1, Lcom/sonymobile/scan3d/SphinxHint;->arg1:I

    const/16 v3, 0x18

    if-ne v0, v3, :cond_4

    .line 572
    iput-boolean v2, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mLongScan:Z

    .line 575
    :cond_4
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mResourceLookup:Lcom/sonymobile/scan3d/SphinxResourceLookup;

    iget v3, p1, Lcom/sonymobile/scan3d/SphinxHint;->arg1:I

    invoke-virtual {v0, v3}, Lcom/sonymobile/scan3d/SphinxResourceLookup;->getMsgResources(I)[I

    move-result-object v0

    .line 576
    iget v3, p1, Lcom/sonymobile/scan3d/SphinxHint;->arg3:I

    if-ltz v3, :cond_5

    move v3, v2

    goto :goto_0

    :cond_5
    move v3, v1

    :goto_0
    if-eqz v3, :cond_6

    .line 577
    iget-object v3, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mPlayer:Lcom/sonymobile/scan3d/AudioPlayer;

    if-eqz v3, :cond_6

    .line 578
    iget-object v3, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mResourceLookup:Lcom/sonymobile/scan3d/SphinxResourceLookup;

    iget v4, p1, Lcom/sonymobile/scan3d/SphinxHint;->arg3:I

    invoke-virtual {v3, v4}, Lcom/sonymobile/scan3d/SphinxResourceLookup;->getSoundResource(I)I

    move-result v3

    .line 579
    iget-object v4, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mPlayer:Lcom/sonymobile/scan3d/AudioPlayer;

    iget v5, p1, Lcom/sonymobile/scan3d/SphinxHint;->arg1:I

    invoke-virtual {v4, v5, v3}, Lcom/sonymobile/scan3d/AudioPlayer;->play(II)V

    .line 582
    :cond_6
    iget v3, p1, Lcom/sonymobile/scan3d/SphinxHint;->arg2:I

    if-eqz v3, :cond_7

    goto :goto_1

    :cond_7
    move v2, v1

    .line 585
    :goto_1
    iget p1, p1, Lcom/sonymobile/scan3d/SphinxHint;->arg1:I

    const/4 v3, 0x6

    if-ne p1, v3, :cond_8

    .line 586
    iget-object p1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mDoneToastView:Lcom/sonymobile/scan3d/SphinxToastView;

    .line 587
    iget-object v3, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mMainToastView:Lcom/sonymobile/scan3d/SphinxToastView;

    goto :goto_2

    .line 589
    :cond_8
    iget-object p1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mMainToastView:Lcom/sonymobile/scan3d/SphinxToastView;

    .line 590
    iget-object v3, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mDoneToastView:Lcom/sonymobile/scan3d/SphinxToastView;

    .line 592
    :goto_2
    invoke-virtual {v3}, Lcom/sonymobile/scan3d/SphinxToastView;->hide()V

    .line 593
    invoke-virtual {p1, v0, v2, p0}, Lcom/sonymobile/scan3d/SphinxToastView;->show([IZLcom/sonymobile/scan3d/SphinxToastView$ISphinxToastListener;)V

    goto :goto_4

    :goto_3
    move v1, v2

    :goto_4
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method private hideActionButton()V
    .locals 2

    .line 682
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mActionButton:Landroid/widget/Button;

    invoke-virtual {v0}, Landroid/widget/Button;->getVisibility()I

    move-result v0

    const/4 v1, 0x4

    if-eq v0, v1, :cond_0

    .line 683
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mActionButton:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 684
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mActionButton:Landroid/widget/Button;

    const v1, 0x7f010020

    invoke-static {p0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->startAnimation(Landroid/view/animation/Animation;)V

    :cond_0
    return-void
.end method

.method private hideSystemUi()V
    .locals 2

    .line 689
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/Scan3dActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x1706

    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    return-void
.end method

.method private isNewText(Landroid/widget/Button;I)Z
    .locals 0
    .param p2    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 726
    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/Scan3dActivity;->getText(I)Ljava/lang/CharSequence;

    move-result-object p2

    invoke-virtual {p1}, Landroid/widget/Button;->getText()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    return p1
.end method

.method public static synthetic lambda$confirmCancelScan$3(Lcom/sonymobile/scan3d/Scan3dActivity;Landroid/content/Context;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1120
    sget-object p2, Lcom/sonymobile/scan3d/analytics/ScanEvent;->SCAN_CANCELED_BY_USER:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    iget p3, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mPolicy:I

    invoke-virtual {p2, p1, p3}, Lcom/sonymobile/scan3d/analytics/ScanEvent;->send(Landroid/content/Context;I)V

    .line 1121
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/Scan3dActivity;->finish()V

    return-void
.end method

.method public static synthetic lambda$confirmCancelScan$4(Lcom/sonymobile/scan3d/Scan3dActivity;Landroid/content/DialogInterface;)V
    .locals 3

    .line 1126
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/Scan3dActivity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f07009f

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    .line 1127
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mConfirmCancelDialog:Landroidx/appcompat/app/AlertDialog;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    const/4 v1, 0x0

    .line 1128
    invoke-virtual {v0, v1, p1}, Landroid/widget/Button;->setTextSize(IF)V

    .line 1129
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mConfirmCancelDialog:Landroidx/appcompat/app/AlertDialog;

    const/4 v2, -0x2

    invoke-virtual {v0, v2}, Landroidx/appcompat/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    .line 1130
    invoke-virtual {v0, v1, p1}, Landroid/widget/Button;->setTextSize(IF)V

    return-void
.end method

.method public static synthetic lambda$onCreate$0(Lcom/sonymobile/scan3d/Scan3dActivity;I)V
    .locals 0

    .line 270
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Scan3dActivity;->hideSystemUi()V

    return-void
.end method

.method public static synthetic lambda$showActionButton$2(Lcom/sonymobile/scan3d/Scan3dActivity;I)V
    .locals 1

    .line 669
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mActionButton:Landroid/widget/Button;

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(I)V

    return-void
.end method

.method public static synthetic lambda$showCameraTooHotDialog$1(Lcom/sonymobile/scan3d/Scan3dActivity;ZLandroid/content/DialogInterface;I)V
    .locals 0

    if-eqz p1, :cond_0

    .line 537
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/Scan3dActivity;->finish()V

    :cond_0
    return-void
.end method

.method private resetActivity()V
    .locals 2

    .line 463
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mConfirmCancelDialog:Landroidx/appcompat/app/AlertDialog;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog;->dismiss()V

    .line 466
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/Scan3dActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    const-string v1, "dialog"

    .line 467
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 469
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentTransaction;->remove(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 473
    :cond_1
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mStartingProgressView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 476
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mPlayer:Lcom/sonymobile/scan3d/AudioPlayer;

    if-eqz v0, :cond_2

    .line 477
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/AudioPlayer;->stopAll()V

    .line 481
    :cond_2
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mStepIndicator:Lcom/sonymobile/scan3d/widgets/SphinxStepIndicator;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicator;->reset()V

    .line 482
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mProgressBar:Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;->hide()V

    .line 483
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mMainToastView:Lcom/sonymobile/scan3d/SphinxToastView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/SphinxToastView;->hide()V

    .line 484
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mDoneToastView:Lcom/sonymobile/scan3d/SphinxToastView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/SphinxToastView;->hide()V

    .line 485
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Scan3dActivity;->hideActionButton()V

    .line 488
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mHintQueue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->clear()V

    const/4 v0, 0x0

    .line 490
    iput-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mEnvironmentErrors:[Lcom/sonymobile/scan3d/EnvironmentError;

    return-void
.end method

.method private selectEnvironmentError()Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;
    .locals 6

    .line 1033
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mEnvironmentErrors:[Lcom/sonymobile/scan3d/EnvironmentError;

    if-eqz v0, :cond_1

    .line 1034
    array-length v1, v0

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_1

    aget-object v4, v0, v3

    .line 1035
    iget-boolean v5, v4, Lcom/sonymobile/scan3d/EnvironmentError;->critical:Z

    if-nez v5, :cond_0

    .line 1036
    invoke-virtual {p0, v4, v2}, Lcom/sonymobile/scan3d/Scan3dActivity;->onErrorShown(Lcom/sonymobile/scan3d/EnvironmentError;Z)V

    .line 1037
    iget-object v0, v4, Lcom/sonymobile/scan3d/EnvironmentError;->type:Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;

    return-object v0

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method private showActionButton(I)V
    .locals 5
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 663
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mActionButton:Landroid/widget/Button;

    invoke-virtual {v0}, Landroid/widget/Button;->getVisibility()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 665
    iget-object v2, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mActionButton:Landroid/widget/Button;

    invoke-direct {p0, v2, p1}, Lcom/sonymobile/scan3d/Scan3dActivity;->isNewText(Landroid/widget/Button;I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 667
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mActionButton:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    const v0, 0x7f010021

    .line 668
    invoke-static {p0, v0}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 669
    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    new-instance v2, Lcom/sonymobile/scan3d/-$$Lambda$Scan3dActivity$s8KB8Tkwh5ftctNBkRb6YWdBKig;

    invoke-direct {v2, p0, p1}, Lcom/sonymobile/scan3d/-$$Lambda$Scan3dActivity$s8KB8Tkwh5ftctNBkRb6YWdBKig;-><init>(Lcom/sonymobile/scan3d/Scan3dActivity;I)V

    invoke-virtual {v0}, Landroid/view/animation/Animation;->getDuration()J

    move-result-wide v3

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 670
    iget-object p1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mActionButton:Landroid/widget/Button;

    invoke-virtual {p1, v0}, Landroid/widget/Button;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_0

    :cond_0
    if-eqz v0, :cond_1

    .line 672
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mActionButton:Landroid/widget/Button;

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(I)V

    .line 673
    iget-object p1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mActionButton:Landroid/widget/Button;

    invoke-virtual {p1, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 674
    iget-object p1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mActionButton:Landroid/widget/Button;

    const v0, 0x7f01001f

    invoke-static {p0, v0}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/Button;->startAnimation(Landroid/view/animation/Animation;)V

    :cond_1
    :goto_0
    return-void
.end method

.method private showBreakScanningDialog(II)V
    .locals 0

    .line 521
    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/BreakScanningDialog;->newInstance(II)Lcom/sonymobile/scan3d/BreakScanningDialog;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/Scan3dActivity;->showDialog(Landroidx/fragment/app/DialogFragment;)V

    return-void
.end method

.method private showCameraTooHotDialog(IZ)V
    .locals 3
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 532
    new-instance v0, Landroidx/appcompat/app/AlertDialog$Builder;

    new-instance v1, Landroidx/appcompat/view/ContextThemeWrapper;

    const v2, 0x7f110132

    invoke-direct {v1, p0, v2}, Landroidx/appcompat/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    invoke-direct {v0, v1}, Landroidx/appcompat/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f1002cc

    .line 534
    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setTitle(I)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroidx/appcompat/app/AlertDialog$Builder;->setMessage(I)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v1, Lcom/sonymobile/scan3d/-$$Lambda$Scan3dActivity$o3pw3OHZS3kw-qMovhUopdzCc9I;

    invoke-direct {v1, p0, p2}, Lcom/sonymobile/scan3d/-$$Lambda$Scan3dActivity$o3pw3OHZS3kw-qMovhUopdzCc9I;-><init>(Lcom/sonymobile/scan3d/Scan3dActivity;Z)V

    const p2, 0x104000a

    .line 535
    invoke-virtual {p1, p2, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object p1

    const/4 p2, 0x0

    .line 539
    invoke-virtual {p1, p2}, Landroidx/appcompat/app/AlertDialog$Builder;->setCancelable(Z)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 541
    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog$Builder;->create()Landroidx/appcompat/app/AlertDialog;

    move-result-object p1

    .line 542
    invoke-virtual {p1, p2}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 543
    invoke-virtual {p1}, Landroid/app/Dialog;->show()V

    return-void
.end method

.method private showDialog(Landroidx/fragment/app/DialogFragment;)V
    .locals 2

    .line 552
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/Scan3dActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/Scan3dActivity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 553
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/Scan3dActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    const-string v1, "dialog"

    .line 554
    invoke-virtual {p1, v0, v1}, Landroidx/fragment/app/DialogFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method private showEnvironmentWarningDialog()V
    .locals 1

    .line 528
    new-instance v0, Lcom/sonymobile/scan3d/EnvironmentWarningsDialog;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/EnvironmentWarningsDialog;-><init>()V

    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/Scan3dActivity;->showDialog(Landroidx/fragment/app/DialogFragment;)V

    return-void
.end method

.method private showErrorsDialog()V
    .locals 1

    .line 512
    new-instance v0, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog;-><init>()V

    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/Scan3dActivity;->showDialog(Landroidx/fragment/app/DialogFragment;)V

    return-void
.end method

.method private startProcessingHints()V
    .locals 1

    .line 497
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mHintQueue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/SphinxHint;

    :goto_0
    if-eqz v0, :cond_0

    .line 499
    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/Scan3dActivity;->handleHint(Lcom/sonymobile/scan3d/SphinxHint;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 501
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mHintQueue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    .line 504
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mHintQueue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/SphinxHint;

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public cameraGettingHot()V
    .locals 2

    .line 1148
    sget-object v0, Lcom/sonymobile/scan3d/Scan3dActivity;->TAG:Ljava/lang/String;

    const-string v1, "Thermal: Camera getting hot"

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1149
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mSphinxManager:Lcom/sonymobile/scan3d/ISphinxManager;

    sget-object v1, Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;->kWarm:Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;

    invoke-interface {v0, v1}, Lcom/sonymobile/scan3d/ISphinxManager;->setCameraTemperature(Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;)V

    return-void
.end method

.method public cameraOverheated()V
    .locals 2

    .line 1154
    sget-object v0, Lcom/sonymobile/scan3d/Scan3dActivity;->TAG:Ljava/lang/String;

    const-string v1, "Thermal: Camera too hot to continue"

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1155
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mSphinxManager:Lcom/sonymobile/scan3d/ISphinxManager;

    sget-object v1, Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;->kHot:Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;

    invoke-interface {v0, v1}, Lcom/sonymobile/scan3d/ISphinxManager;->setCameraTemperature(Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;)V

    const/4 v0, 0x1

    .line 1156
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mTooHotToStart:Z

    return-void
.end method

.method public cameraTooHotToStart()V
    .locals 2

    .line 1137
    sget-object v0, Lcom/sonymobile/scan3d/Scan3dActivity;->TAG:Ljava/lang/String;

    const-string v1, "Thermal: Camera too hot to start"

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1138
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mBound:Z

    if-eqz v0, :cond_0

    .line 1139
    invoke-virtual {p0, p0}, Lcom/sonymobile/scan3d/Scan3dActivity;->unbindService(Landroid/content/ServiceConnection;)V

    const/4 v0, 0x0

    .line 1140
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mBound:Z

    :cond_0
    const v0, 0x7f1002ce

    const/4 v1, 0x1

    .line 1142
    invoke-direct {p0, v0, v1}, Lcom/sonymobile/scan3d/Scan3dActivity;->showCameraTooHotDialog(IZ)V

    .line 1143
    iput-boolean v1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mTooHotToStart:Z

    return-void
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "RestrictedApi"
        }
    .end annotation

    .line 415
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const v1, 0x7f1001c9

    .line 416
    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/Scan3dActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 419
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    const/16 v1, 0x18

    const/4 v2, 0x1

    if-ne v0, v1, :cond_0

    return v2

    .line 423
    :cond_0
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    const/16 v1, 0x19

    if-ne v0, v1, :cond_2

    .line 424
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result p1

    if-nez p1, :cond_1

    .line 425
    iget-object p1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mSphinxManager:Lcom/sonymobile/scan3d/ISphinxManager;

    if-eqz p1, :cond_1

    .line 426
    sget-object p1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->VOLUME_DOWN:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    iget v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mPolicy:I

    invoke-virtual {p1, p0, v0}, Lcom/sonymobile/scan3d/analytics/ScanEvent;->send(Landroid/content/Context;I)V

    .line 427
    iget-object p1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mSphinxManager:Lcom/sonymobile/scan3d/ISphinxManager;

    invoke-interface {p1}, Lcom/sonymobile/scan3d/ISphinxManager;->setNextDebugMode()V

    :cond_1
    return v2

    .line 432
    :cond_2
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    const/16 v1, 0x50

    if-ne v0, v1, :cond_4

    .line 433
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result p1

    if-nez p1, :cond_3

    .line 434
    sget-object p1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->CAMERA_BUTTON_PRESSED:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    iget v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mPolicy:I

    invoke-virtual {p1, p0, v0}, Lcom/sonymobile/scan3d/analytics/ScanEvent;->send(Landroid/content/Context;I)V

    .line 435
    iget-object p1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mSphinxManager:Lcom/sonymobile/scan3d/ISphinxManager;

    if-eqz p1, :cond_3

    .line 436
    invoke-interface {p1, v2}, Lcom/sonymobile/scan3d/ISphinxManager;->setNextState(Z)V

    :cond_3
    return v2

    .line 442
    :cond_4
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public doClick(Landroid/view/View;)V
    .locals 8

    .line 1088
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mActionButton:Landroid/widget/Button;

    if-ne p1, v0, :cond_3

    .line 1093
    iget-wide v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mDoneButtonTimestamp:J

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-lez p1, :cond_1

    const-wide/16 v2, 0x7d0

    .line 1094
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-wide v6, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mDoneButtonTimestamp:J

    sub-long/2addr v4, v6

    cmp-long p1, v2, v4

    if-lez p1, :cond_0

    move p1, v0

    goto :goto_0

    :cond_0
    move p1, v1

    :goto_0
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mShortScan:Z

    .line 1097
    :cond_1
    iget-boolean p1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mScanStarted:Z

    if-nez p1, :cond_2

    .line 1098
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mScanStarted:Z

    .line 1100
    :cond_2
    iget-object p1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mSphinxManager:Lcom/sonymobile/scan3d/ISphinxManager;

    invoke-interface {p1, v1}, Lcom/sonymobile/scan3d/ISphinxManager;->setNextState(Z)V

    goto :goto_1

    .line 1102
    :cond_3
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mCloseButton:Landroid/view/View;

    if-ne p1, v0, :cond_5

    .line 1103
    iget-boolean p1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mScanStarted:Z

    if-eqz p1, :cond_4

    .line 1104
    invoke-direct {p0, p0}, Lcom/sonymobile/scan3d/Scan3dActivity;->confirmCancelScan(Landroid/content/Context;)V

    goto :goto_1

    .line 1106
    :cond_4
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/Scan3dActivity;->finish()V

    :cond_5
    :goto_1
    return-void
.end method

.method public getErrors()[Lcom/sonymobile/scan3d/EnvironmentError;
    .locals 1

    .line 754
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mEnvironmentErrors:[Lcom/sonymobile/scan3d/EnvironmentError;

    return-object v0
.end method

.method public onBackPressed()V
    .locals 1

    .line 347
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mScanStarted:Z

    if-eqz v0, :cond_0

    .line 348
    invoke-direct {p0, p0}, Lcom/sonymobile/scan3d/Scan3dActivity;->confirmCancelScan(Landroid/content/Context;)V

    goto :goto_0

    .line 350
    :cond_0
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onBackPressed()V

    :goto_0
    return-void
.end method

.method public onCameraOpened(Z)V
    .locals 1

    if-eqz p1, :cond_0

    .line 999
    iget-object p1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mManualFocusSeekBar:Landroid/widget/SeekBar;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/SeekBar;->setVisibility(I)V

    goto :goto_0

    .line 1001
    :cond_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mManualFocusSeekBar:Landroid/widget/SeekBar;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/SeekBar;->setVisibility(I)V

    :goto_0
    return-void
.end method

.method public onCameraTemperatureShutdown(Z)V
    .locals 1

    if-eqz p1, :cond_0

    .line 1008
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mBound:Z

    if-eqz v0, :cond_0

    .line 1009
    invoke-virtual {p0, p0}, Lcom/sonymobile/scan3d/Scan3dActivity;->unbindService(Landroid/content/ServiceConnection;)V

    const/4 v0, 0x0

    .line 1010
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mBound:Z

    :cond_0
    const v0, 0x7f1002cd

    .line 1013
    invoke-direct {p0, v0, p1}, Lcom/sonymobile/scan3d/Scan3dActivity;->showCameraTooHotDialog(IZ)V

    return-void
.end method

.method public onCancelScanClicked()V
    .locals 2

    .line 836
    sget-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->SCAN_CANCELED_BY_USER:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    iget v1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mPolicy:I

    invoke-virtual {v0, p0, v1}, Lcom/sonymobile/scan3d/analytics/ScanEvent;->send(Landroid/content/Context;I)V

    .line 837
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/Scan3dActivity;->finish()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5

    .line 262
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 263
    sget-object v0, Lcom/sonymobile/scan3d/Scan3dActivity;->PERMISSIONS:[Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/PermissionUtil;->hasPermissions(Landroid/content/Context;[Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p1, 0x2

    .line 264
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/Scan3dActivity;->setResult(I)V

    .line 265
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/Scan3dActivity;->finish()V

    return-void

    .line 270
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/Scan3dActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/sonymobile/scan3d/-$$Lambda$Scan3dActivity$W3HZrr3JFxIJOxqvevkJHQ4Lcy4;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/-$$Lambda$Scan3dActivity$W3HZrr3JFxIJOxqvevkJHQ4Lcy4;-><init>(Lcom/sonymobile/scan3d/Scan3dActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnSystemUiVisibilityChangeListener(Landroid/view/View$OnSystemUiVisibilityChangeListener;)V

    .line 271
    new-instance v0, Lcom/sonymobile/scan3d/ThermalAlertReceiver;

    invoke-direct {v0, p0, p0}, Lcom/sonymobile/scan3d/ThermalAlertReceiver;-><init>(Landroid/content/Context;Lcom/sonymobile/scan3d/ThermalAlertReceiver$ThermalAlertCallback;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mThermalAlertReceiver:Lcom/sonymobile/scan3d/ThermalAlertReceiver;

    .line 272
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mThermalAlertReceiver:Lcom/sonymobile/scan3d/ThermalAlertReceiver;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/ThermalAlertReceiver;->bindThermalService()V

    .line 275
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/Scan3dActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "policy"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mPolicy:I

    .line 277
    iget v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mPolicy:I

    const/4 v1, 0x4

    const/4 v3, 0x0

    if-eq v0, v1, :cond_1

    const/16 v1, 0xe

    if-eq v0, v1, :cond_1

    move v2, v3

    goto :goto_0

    .line 281
    :cond_1
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/Scan3dActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    .line 282
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    .line 283
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/Scan3dActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 290
    :goto_0
    invoke-virtual {p0, v2}, Lcom/sonymobile/scan3d/Scan3dActivity;->setRequestedOrientation(I)V

    const v0, 0x7f0c0021

    .line 291
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/Scan3dActivity;->setContentView(I)V

    .line 293
    invoke-static {p0}, Lcom/sonymobile/scan3d/PreferenceUtils;->updatePreferences(Landroid/content/Context;)V

    const v0, 0x7f130002

    .line 294
    invoke-static {p0, v0, v3}, Landroid/preference/PreferenceManager;->setDefaultValues(Landroid/content/Context;IZ)V

    const v0, 0x7f0901c2

    .line 297
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/Scan3dActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mActionButton:Landroid/widget/Button;

    .line 298
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mActionButton:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f09015a

    .line 300
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/Scan3dActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;

    iput-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mProgressBar:Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;

    const v0, 0x7f090093

    .line 303
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/Scan3dActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mCloseButton:Landroid/view/View;

    .line 304
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mCloseButton:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f0901f4

    .line 306
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/Scan3dActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/SphinxToastView;

    iput-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mMainToastView:Lcom/sonymobile/scan3d/SphinxToastView;

    .line 307
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mMainToastView:Lcom/sonymobile/scan3d/SphinxToastView;

    const v1, 0x7f010022

    const v2, 0x7f010024

    const v4, 0x7f010026

    invoke-virtual {v0, v1, v2, v4}, Lcom/sonymobile/scan3d/SphinxToastView;->setAnimations(III)V

    const v0, 0x7f0901f6

    .line 310
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/Scan3dActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/SphinxToastView;

    iput-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mDoneToastView:Lcom/sonymobile/scan3d/SphinxToastView;

    .line 311
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mDoneToastView:Lcom/sonymobile/scan3d/SphinxToastView;

    const v1, 0x7f010023

    const v2, 0x7f010025

    const v4, 0x7f010027

    invoke-virtual {v0, v1, v2, v4}, Lcom/sonymobile/scan3d/SphinxToastView;->setAnimations(III)V

    const v0, 0x7f0900d7

    .line 314
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/Scan3dActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/SeekBar;

    iput-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mManualFocusSeekBar:Landroid/widget/SeekBar;

    const v0, 0x7f090072

    .line 315
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/Scan3dActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mStartingProgressView:Landroid/view/View;

    const v0, 0x7f0901c5

    .line 316
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/Scan3dActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicator;

    iput-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mStepIndicator:Lcom/sonymobile/scan3d/widgets/SphinxStepIndicator;

    .line 319
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mManualFocusSeekBar:Landroid/widget/SeekBar;

    invoke-virtual {v0, p0}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 321
    new-instance v0, Lcom/sonymobile/scan3d/SphinxSettings;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/SphinxSettings;-><init>(Landroid/content/Context;)V

    .line 322
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/SphinxSettings;->useSound()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 323
    new-instance v0, Lcom/sonymobile/scan3d/AudioPlayer;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/AudioPlayer;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mPlayer:Lcom/sonymobile/scan3d/AudioPlayer;

    :cond_2
    if-nez p1, :cond_3

    .line 328
    iget-object p1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mStartingProgressView:Landroid/view/View;

    invoke-virtual {p1, v3}, Landroid/view/View;->setVisibility(I)V

    :cond_3
    return-void
.end method

.method protected onDestroy()V
    .locals 2

    .line 334
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mManualFocusSeekBar:Landroid/widget/SeekBar;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 335
    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 337
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mThermalAlertReceiver:Lcom/sonymobile/scan3d/ThermalAlertReceiver;

    if-eqz v0, :cond_1

    .line 338
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/ThermalAlertReceiver;->unbindThermalService()V

    .line 339
    iput-object v1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mThermalAlertReceiver:Lcom/sonymobile/scan3d/ThermalAlertReceiver;

    .line 341
    :cond_1
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onDestroy()V

    return-void
.end method

.method public onDialogDisplayed()V
    .locals 2

    .line 746
    sget-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->CRITICAL_ERROR_DISPLAYED:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    iget v1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mPolicy:I

    invoke-virtual {v0, p0, v1}, Lcom/sonymobile/scan3d/analytics/ScanEvent;->send(Landroid/content/Context;I)V

    return-void
.end method

.method public onErrorShown(Lcom/sonymobile/scan3d/EnvironmentError;Z)V
    .locals 1

    if-eqz p1, :cond_6

    .line 769
    iget-object v0, p1, Lcom/sonymobile/scan3d/EnvironmentError;->type:Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;

    if-nez v0, :cond_0

    goto/16 :goto_1

    .line 772
    :cond_0
    sget-object v0, Lcom/sonymobile/scan3d/Scan3dActivity$1;->$SwitchMap$com$sonymobile$scan3d$EnvironmentError$ErrorType:[I

    iget-object p1, p1, Lcom/sonymobile/scan3d/EnvironmentError;->type:Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;->ordinal()I

    move-result p1

    aget p1, v0, p1

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    if-eqz p2, :cond_1

    .line 803
    sget-object p1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->CRITICAL_BAD_LOOP_CLOSURE:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    iget p2, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mPolicy:I

    invoke-virtual {p1, p0, p2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;->send(Landroid/content/Context;I)V

    goto :goto_0

    .line 805
    :cond_1
    sget-object p1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->WARNING_BAD_LOOP_CLOSURE:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    iget p2, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mPolicy:I

    invoke-virtual {p1, p0, p2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;->send(Landroid/content/Context;I)V

    goto :goto_0

    :pswitch_1
    if-eqz p2, :cond_2

    .line 796
    sget-object p1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->CRITICAL_LOW_TEXTURE_AREA:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    iget p2, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mPolicy:I

    invoke-virtual {p1, p0, p2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;->send(Landroid/content/Context;I)V

    goto :goto_0

    .line 798
    :cond_2
    sget-object p1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->WARNING_LOW_TEXTURE_AREA:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    iget p2, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mPolicy:I

    invoke-virtual {p1, p0, p2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;->send(Landroid/content/Context;I)V

    goto :goto_0

    :pswitch_2
    if-eqz p2, :cond_3

    .line 789
    sget-object p1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->CRITICAL_UNEVEN_LIGHT:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    iget p2, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mPolicy:I

    invoke-virtual {p1, p0, p2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;->send(Landroid/content/Context;I)V

    goto :goto_0

    .line 791
    :cond_3
    sget-object p1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->WARNING_UNEVEN_LIGHT:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    iget p2, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mPolicy:I

    invoke-virtual {p1, p0, p2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;->send(Landroid/content/Context;I)V

    goto :goto_0

    :pswitch_3
    if-eqz p2, :cond_4

    .line 782
    sget-object p1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->CRITICAL_TOO_BRIGHT:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    iget p2, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mPolicy:I

    invoke-virtual {p1, p0, p2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;->send(Landroid/content/Context;I)V

    goto :goto_0

    .line 784
    :cond_4
    sget-object p1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->WARNING_TOO_BRIGHT:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    iget p2, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mPolicy:I

    invoke-virtual {p1, p0, p2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;->send(Landroid/content/Context;I)V

    goto :goto_0

    :pswitch_4
    if-eqz p2, :cond_5

    .line 775
    sget-object p1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->CRITICAL_TOO_DARK:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    iget p2, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mPolicy:I

    invoke-virtual {p1, p0, p2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;->send(Landroid/content/Context;I)V

    goto :goto_0

    .line 777
    :cond_5
    sget-object p1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->WARNING_TOO_DARK:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    iget p2, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mPolicy:I

    invoke-virtual {p1, p0, p2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;->send(Landroid/content/Context;I)V

    :goto_0
    return-void

    :cond_6
    :goto_1
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

.method public onErrorsReceived([Lcom/sonymobile/scan3d/EnvironmentError;)V
    .locals 3

    .line 1018
    iput-object p1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mEnvironmentErrors:[Lcom/sonymobile/scan3d/EnvironmentError;

    .line 1019
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    aget-object v2, p1, v1

    .line 1020
    iget-boolean v2, v2, Lcom/sonymobile/scan3d/EnvironmentError;->critical:Z

    if-eqz v2, :cond_0

    .line 1021
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Scan3dActivity;->showEnvironmentWarningDialog()V

    goto :goto_1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    return-void
.end method

.method public onFinished(Landroid/net/Uri;)V
    .locals 2

    .line 1046
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    if-eqz p1, :cond_0

    .line 1049
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const-string p1, "short_scan"

    .line 1050
    iget-boolean v1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mShortScan:Z

    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p1, "long_scan"

    .line 1051
    iget-boolean v1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mLongScan:Z

    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p1, "env_error"

    .line 1052
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Scan3dActivity;->selectEnvironmentError()Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    const-string p1, "policy"

    .line 1053
    iget v1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mPolicy:I

    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const/4 p1, 0x1

    .line 1054
    invoke-virtual {p0, p1, v0}, Lcom/sonymobile/scan3d/Scan3dActivity;->setResult(ILandroid/content/Intent;)V

    .line 1055
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/Scan3dActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iget v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mPolicy:I

    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/AppShortcutsManager;->updateShortcut(Landroid/content/Context;I)V

    goto :goto_0

    :cond_0
    const/4 p1, 0x3

    .line 1057
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/Scan3dActivity;->setResult(I)V

    .line 1059
    :goto_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/Scan3dActivity;->finish()V

    return-void
.end method

.method public onHintReceived(Lcom/sonymobile/scan3d/SphinxHint;)V
    .locals 4

    .line 952
    sget-object v0, Lcom/sonymobile/scan3d/Scan3dActivity;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onHintReceived() : received hint with code="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/sonymobile/scan3d/SphinxHint;->code:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " and arg=["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/sonymobile/scan3d/SphinxHint;->arg1:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/sonymobile/scan3d/SphinxHint;->arg2:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/sonymobile/scan3d/SphinxHint;->arg3:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 955
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mHintQueue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->isEmpty()Z

    move-result v0

    .line 957
    iget v1, p1, Lcom/sonymobile/scan3d/SphinxHint;->code:I

    const/16 v2, 0x8

    if-ne v1, v2, :cond_1

    .line 959
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mPlayer:Lcom/sonymobile/scan3d/AudioPlayer;

    if-eqz v0, :cond_0

    .line 960
    iget v1, p1, Lcom/sonymobile/scan3d/SphinxHint;->arg1:I

    iget-object v2, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mResourceLookup:Lcom/sonymobile/scan3d/SphinxResourceLookup;

    iget v3, p1, Lcom/sonymobile/scan3d/SphinxHint;->arg1:I

    invoke-virtual {v2, v3}, Lcom/sonymobile/scan3d/SphinxResourceLookup;->getSoundResource(I)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/sonymobile/scan3d/AudioPlayer;->play(II)V

    .line 962
    :cond_0
    iget p1, p1, Lcom/sonymobile/scan3d/SphinxHint;->arg2:I

    const/4 v0, 0x1

    if-ne p1, v0, :cond_2

    const-string p1, "vibrator"

    .line 963
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/Scan3dActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/Vibrator;

    const-wide/16 v0, 0x96

    const/4 v2, -0x1

    .line 964
    invoke-static {v0, v1, v2}, Landroid/os/VibrationEffect;->createOneShot(JI)Landroid/os/VibrationEffect;

    move-result-object v0

    .line 966
    invoke-virtual {p1, v0}, Landroid/os/Vibrator;->vibrate(Landroid/os/VibrationEffect;)V

    goto :goto_0

    .line 970
    :cond_1
    iget-object v1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mHintQueue:Ljava/util/Queue;

    invoke-interface {v1, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    if-eqz v0, :cond_2

    .line 974
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Scan3dActivity;->startProcessingHints()V

    :cond_2
    :goto_0
    return-void
.end method

.method public onIgnoreErrors()V
    .locals 1

    .line 759
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mSphinxManager:Lcom/sonymobile/scan3d/ISphinxManager;

    invoke-interface {v0}, Lcom/sonymobile/scan3d/ISphinxManager;->clearEnvironmentErrors()V

    return-void
.end method

.method public onIgnoreWarnings()V
    .locals 1

    .line 740
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mSphinxManager:Lcom/sonymobile/scan3d/ISphinxManager;

    invoke-interface {v0}, Lcom/sonymobile/scan3d/ISphinxManager;->clearEnvironmentErrors()V

    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1

    const/16 v0, 0x1b

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    return p1

    .line 450
    :cond_0
    invoke-super {p0, p1, p2}, Landroidx/fragment/app/FragmentActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method protected onPause()V
    .locals 0

    .line 368
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onPause()V

    return-void
.end method

.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 0

    .line 1069
    iget-object p1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mSphinxManager:Lcom/sonymobile/scan3d/ISphinxManager;

    invoke-interface {p1, p2}, Lcom/sonymobile/scan3d/ISphinxManager;->setManualFocusPosition(I)V

    return-void
.end method

.method public onRestartScanClicked(Z)V
    .locals 1

    if-eqz p1, :cond_0

    .line 821
    sget-object p1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->RESTART_CLICKED:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    iget v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mPolicy:I

    invoke-virtual {p1, p0, v0}, Lcom/sonymobile/scan3d/analytics/ScanEvent;->send(Landroid/content/Context;I)V

    goto :goto_0

    .line 823
    :cond_0
    sget-object p1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->SCAN_RESTARTED_AFTER_WARNING:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    iget v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mPolicy:I

    invoke-virtual {p1, p0, v0}, Lcom/sonymobile/scan3d/analytics/ScanEvent;->send(Landroid/content/Context;I)V

    .line 825
    :goto_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mSphinxManager:Lcom/sonymobile/scan3d/ISphinxManager;

    invoke-interface {p1}, Lcom/sonymobile/scan3d/ISphinxManager;->restart()V

    const/4 p1, 0x0

    .line 826
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mScanStarted:Z

    return-void
.end method

.method public onRestarting()V
    .locals 0

    .line 993
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Scan3dActivity;->resetActivity()V

    return-void
.end method

.method public onResume()V
    .locals 0

    .line 359
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onResume()V

    .line 360
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Scan3dActivity;->hideSystemUi()V

    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    .line 401
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mScanStarted:Z

    if-eqz v0, :cond_0

    .line 405
    sget-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->RESTART:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    iget v1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mPolicy:I

    invoke-virtual {v0, p0, v1}, Lcom/sonymobile/scan3d/analytics/ScanEvent;->send(Landroid/content/Context;I)V

    .line 407
    :cond_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Scan3dActivity;->resetActivity()V

    .line 408
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    return-void
.end method

.method public onScale(Landroid/view/ScaleGestureDetector;)Z
    .locals 1

    .line 914
    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getScaleFactor()F

    move-result p1

    const/high16 v0, 0x3f800000    # 1.0f

    sub-float/2addr p1, v0

    .line 915
    iget v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mCurrentScale:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mCurrentScale:F

    .line 916
    iget v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mCurrentScale:F

    add-float/2addr v0, p1

    const/high16 p1, 0x3fc00000    # 1.5f

    .line 917
    invoke-static {v0, p1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    const/high16 v0, 0x3f000000    # 0.5f

    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    iput p1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mCurrentScale:F

    .line 918
    iget-object p1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mSphinxManager:Lcom/sonymobile/scan3d/ISphinxManager;

    iget v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mCurrentScale:F

    invoke-interface {p1, v0}, Lcom/sonymobile/scan3d/ISphinxManager;->setBlobScale(F)V

    const/4 p1, 0x1

    return p1
.end method

.method public onScaleBegin(Landroid/view/ScaleGestureDetector;)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method

.method public onScaleEnd(Landroid/view/ScaleGestureDetector;)V
    .locals 0

    return-void
.end method

.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 8

    .line 846
    check-cast p2, Lcom/sonymobile/scan3d/SphinxService$LocalBinder;

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/SphinxService$LocalBinder;->getSphinxManager()Lcom/sonymobile/scan3d/ISphinxManager;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mSphinxManager:Lcom/sonymobile/scan3d/ISphinxManager;

    .line 847
    iget-object p1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mSphinxManager:Lcom/sonymobile/scan3d/ISphinxManager;

    invoke-interface {p1, p0}, Lcom/sonymobile/scan3d/ISphinxManager;->registerListener(Lcom/sonymobile/scan3d/ISphinxManager$ISphinxListener;)V

    .line 849
    iget-object p1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mSphinxManager:Lcom/sonymobile/scan3d/ISphinxManager;

    iget p2, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mPolicy:I

    invoke-interface {p1, p2}, Lcom/sonymobile/scan3d/ISphinxManager;->start(I)V

    .line 851
    new-instance p1, Landroid/view/SurfaceView;

    invoke-direct {p1, p0}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    .line 852
    invoke-virtual {p1}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object p2

    invoke-interface {p2, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    const p2, 0x7f0900e0

    .line 853
    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/Scan3dActivity;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/FrameLayout;

    .line 855
    invoke-virtual {p2}, Landroid/widget/FrameLayout;->removeAllViews()V

    .line 856
    invoke-virtual {p2, p1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 857
    invoke-virtual {p2}, Landroid/widget/FrameLayout;->getHeight()I

    move-result p1

    int-to-double v0, p1

    .line 858
    invoke-virtual {p2}, Landroid/widget/FrameLayout;->getWidth()I

    move-result p1

    int-to-double v2, p1

    div-double v4, v0, v2

    const-wide/high16 v6, 0x4000000000000000L    # 2.0

    cmpl-double p1, v4, v6

    if-gtz p1, :cond_0

    div-double/2addr v2, v0

    cmpl-double p1, v2, v6

    if-lez p1, :cond_1

    .line 860
    :cond_0
    invoke-static {p2}, Lcom/sonymobile/scan3d/storageservice/utils/ScreenUtil;->setAspectRatio(Landroid/view/View;)V

    :cond_1
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 0

    const/4 p1, 0x0

    .line 865
    iput-object p1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mSphinxManager:Lcom/sonymobile/scan3d/ISphinxManager;

    return-void
.end method

.method public onShowErrors()V
    .locals 0

    .line 735
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Scan3dActivity;->showErrorsDialog()V

    return-void
.end method

.method protected onStart()V
    .locals 2

    .line 376
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onStart()V

    .line 377
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mTooHotToStart:Z

    if-nez v0, :cond_0

    .line 378
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/sonymobile/scan3d/SphinxService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/4 v1, 0x1

    invoke-virtual {p0, v0, p0, v1}, Lcom/sonymobile/scan3d/Scan3dActivity;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v0

    iput-boolean v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mBound:Z

    :cond_0
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method

.method public onStarted()V
    .locals 2

    .line 981
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mStartingProgressView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 984
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mStartingProgressView:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 988
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/Scan3dActivity;->reportFullyDrawn()V

    return-void
.end method

.method protected onStop()V
    .locals 2

    .line 389
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mBound:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 390
    invoke-virtual {p0, p0}, Lcom/sonymobile/scan3d/Scan3dActivity;->unbindService(Landroid/content/ServiceConnection;)V

    .line 391
    iput-boolean v1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mBound:Z

    .line 393
    :cond_0
    iput-boolean v1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mScanStarted:Z

    .line 395
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onStop()V

    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method

.method public onToastShown()V
    .locals 1

    .line 940
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mHintQueue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    .line 943
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Scan3dActivity;->startProcessingHints()V

    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1

    .line 901
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result p1

    const/4 v0, 0x2

    if-ne p1, v0, :cond_0

    .line 902
    iget-object p1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mGestureDetector:Landroid/view/ScaleGestureDetector;

    invoke-virtual {p1, p2}, Landroid/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    :cond_0
    const/4 p1, 0x1

    return p1
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 3

    .line 879
    iget-object p2, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mSphinxManager:Lcom/sonymobile/scan3d/ISphinxManager;

    if-eqz p2, :cond_1

    .line 880
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/Scan3dActivity;->isFinishing()Z

    move-result v0

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object p1

    new-instance v2, Landroid/util/Size;

    invoke-direct {v2, p3, p4}, Landroid/util/Size;-><init>(II)V

    invoke-interface {p2, v0, p1, v2}, Lcom/sonymobile/scan3d/ISphinxManager;->onSurfaceUpdate(ZLandroid/view/Surface;Landroid/util/Size;)V

    const p1, 0x1020002

    .line 882
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/Scan3dActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-static {p1}, Landroidx/core/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result p1

    if-ne p1, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 884
    :goto_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mSphinxManager:Lcom/sonymobile/scan3d/ISphinxManager;

    invoke-interface {p1, v1}, Lcom/sonymobile/scan3d/ISphinxManager;->setLocaleIsRTL(Z)V

    :cond_1
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 0

    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 2

    .line 890
    iget-object p1, p0, Lcom/sonymobile/scan3d/Scan3dActivity;->mSphinxManager:Lcom/sonymobile/scan3d/ISphinxManager;

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 891
    invoke-interface {p1, v0, v1, v1}, Lcom/sonymobile/scan3d/ISphinxManager;->onSurfaceUpdate(ZLandroid/view/Surface;Landroid/util/Size;)V

    :cond_0
    return-void
.end method
