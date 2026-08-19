.class public Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;
.super Landroidx/fragment/app/FragmentActivity;
.source "GalleryActivity.java"

# interfaces
.implements Lcom/sonymobile/scan3d/storageservice/ui/IScanListener;
.implements Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment$OnYesNoListener;
.implements Landroid/os/Handler$Callback;
.implements Lcom/google/android/vending/expansion/downloader/IDownloaderClient;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity$PickType;
    }
.end annotation


# static fields
.field private static final ANIMATE_MODEL_DIALOG_ID:I = 0xa

.field private static final BACKUP_SYNC_FRAGMENT:I = 0x1

.field public static final EXTRA_STARTING_FRAGMENT:Ljava/lang/String; = "com.sonymobile.scan3d.extra.STARTING_FRAGMENT"

.field public static final EXTRA_WHATS_NEW_FACE_BLEND:Ljava/lang/String; = "extra_whats_new_face_blend_flow"

.field private static final EXTRA_WHATS_NEW_FACE_BLEND_SELECT_ANOTHER_MODEL:Ljava/lang/String; = "extra_second_model"

.field public static final EXTRA_WHATS_NEW_FLOW_TYPE:Ljava/lang/String; = "extra_whats_new_flow_flow"

.field private static final GALLERY_FRAGMENT:I = 0x0

.field private static final PERMISSION_REQUEST_CODE_FACE_MIMIC:I = 0x3e8

.field public static final PICK_INTENT_EXTRA_INTERNAL:Ljava/lang/String; = "pick_internal"


# instance fields
.field private mAddIdleListener:Ljava/lang/Runnable;

.field private mFileset:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

.field private mHandler:Landroid/os/Handler;

.field private mIsPicker:Z

.field private mMarshalledDownloader:Lcom/google/android/vending/expansion/downloader/IStub;

.field private mMonitor:Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;

.field private mPickType:Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity$PickType;

.field private mProgressDialog:Lcom/sonymobile/scan3d/widgets/SphinxProgressDialog;

.field private mScanClicked:Z

.field private mScanTypesToDisplay:[I

.field private mTextureSize:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 69
    invoke-direct {p0}, Landroidx/fragment/app/FragmentActivity;-><init>()V

    .line 172
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity$PickType;->OBJ_ONLY:Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity$PickType;

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mPickType:Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity$PickType;

    return-void
.end method

.method private finishWithResult(Landroid/net/Uri;I)V
    .locals 1

    .line 606
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 607
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const/4 p1, 0x1

    .line 608
    invoke-virtual {v0, p1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const-string p1, "com.sonymobile.scan3d.intent.extra.SCAN_TYPE"

    .line 609
    invoke-static {p2}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->scanTypeToString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/4 p1, -0x1

    .line 610
    invoke-virtual {p0, p1, v0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->setResult(ILandroid/content/Intent;)V

    .line 611
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->finish()V

    return-void
.end method

.method public static getBackupSyncIntent(Landroid/content/Context;)Landroid/content/Intent;
    .locals 2

    .line 358
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 p0, 0x14000000

    .line 359
    invoke-virtual {v0, p0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    const-string p0, "com.sonymobile.scan3d.extra.STARTING_FRAGMENT"

    const/4 v1, 0x1

    .line 360
    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    return-object v0
.end method

.method private getStartFaceMimicEntryPointIntent()Landroid/content/Intent;
    .locals 3

    .line 667
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "started_from_entry_point"

    const/4 v2, 0x1

    .line 668
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 669
    sget-object v1, Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;->MANGA:Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;

    invoke-static {v1}, Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider;->getModelUri(Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    return-object v0
.end method

.method public static synthetic lambda$addIdleListener$0(Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;ILcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$OnIdleListener;I)V
    .locals 1

    .line 336
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mMonitor:Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;

    invoke-virtual {v0, p1, p2, p3}, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;->addIdleListener(ILcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$OnIdleListener;I)V

    return-void
.end method

.method private setupFragment(IZ)V
    .locals 3

    packed-switch p1, :pswitch_data_0

    .line 549
    new-instance p2, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unknown mode "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 546
    :pswitch_0
    new-instance p1, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;

    invoke-direct {p1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;-><init>()V

    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->showFragment(Landroidx/fragment/app/Fragment;Z)V

    goto :goto_0

    .line 534
    :pswitch_1
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "com.sonymobile.scan3d.intent.extra.EXCLUDE_URIS"

    .line 535
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getParcelableArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    const-string v1, "com.sonymobile.scan3d.intent.extra.EXPLANATORY_TEXT"

    .line 537
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "com.sonymobile.scan3d.intent.extra.SCAN_TYPE"

    .line 538
    invoke-virtual {p1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 540
    invoke-static {p1}, Lcom/sonymobile/scan3d/sharing/SharingManager;->parseType(Ljava/lang/String;)[I

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mScanTypesToDisplay:[I

    .line 543
    :cond_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mScanTypesToDisplay:[I

    invoke-static {p1, v0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->newInstance([ILjava/util/ArrayList;Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;

    move-result-object p1

    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->showFragment(Landroidx/fragment/app/Fragment;Z)V

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private showAnimationDialog(Ljava/lang/String;)V
    .locals 7

    .line 560
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 561
    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/16 v0, 0xa

    const v1, 0x7f100047

    const v2, 0x7f100046

    const v4, 0x7f1000ba

    const v5, 0x7f1000b9

    const/4 v6, 0x0

    .line 563
    invoke-static/range {v0 .. v6}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->newInstance(IIILjava/util/ArrayList;IILandroid/os/Parcelable;)Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;

    move-result-object p1

    .line 567
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method private showFragment(Landroidx/fragment/app/Fragment;Z)V
    .locals 3

    .line 577
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    .line 578
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object v0

    const/high16 v1, 0x10b0000

    const v2, 0x10b0001

    .line 579
    invoke-virtual {v0, v1, v2}, Landroidx/fragment/app/FragmentTransaction;->setCustomAnimations(II)Landroidx/fragment/app/FragmentTransaction;

    .line 580
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const v2, 0x7f090096

    invoke-virtual {v0, v2, p1, v1}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/FragmentTransaction;

    if-eqz p2, :cond_0

    const/4 p1, 0x0

    .line 582
    invoke-virtual {v0, p1}, Landroidx/fragment/app/FragmentTransaction;->addToBackStack(Ljava/lang/String;)Landroidx/fragment/app/FragmentTransaction;

    .line 584
    :cond_0
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentTransaction;->commit()I

    return-void
.end method

.method private showProgressDialog(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 593
    new-instance v0, Lcom/sonymobile/scan3d/widgets/SphinxProgressDialog;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lcom/sonymobile/scan3d/widgets/SphinxProgressDialog;-><init>(Landroid/content/Context;IZ)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mProgressDialog:Lcom/sonymobile/scan3d/widgets/SphinxProgressDialog;

    .line 594
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mProgressDialog:Lcom/sonymobile/scan3d/widgets/SphinxProgressDialog;

    invoke-virtual {p1, v1}, Lcom/sonymobile/scan3d/widgets/SphinxProgressDialog;->setCancelable(Z)V

    .line 595
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mProgressDialog:Lcom/sonymobile/scan3d/widgets/SphinxProgressDialog;

    invoke-virtual {p1, v1}, Lcom/sonymobile/scan3d/widgets/SphinxProgressDialog;->setCanceledOnTouchOutside(Z)V

    .line 596
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mProgressDialog:Lcom/sonymobile/scan3d/widgets/SphinxProgressDialog;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/widgets/SphinxProgressDialog;->show()V

    return-void
.end method

.method private startFaceBlendIntent(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V
    .locals 4

    .line 649
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "com.sonymobile.scan3d.intent.extra.EXCLUDE_URIS"

    .line 650
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 652
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x1

    if-lt v2, v3, :cond_0

    .line 653
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/Uri;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 655
    :goto_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 656
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 657
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getUri()Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 658
    iput-boolean v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mScanClicked:Z

    .line 659
    invoke-static {p0, v2}, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->getFaceBlendIntent(Landroid/content/Context;Ljava/util/ArrayList;)Landroid/content/Intent;

    move-result-object p1

    .line 660
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method private startGallery(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 680
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 681
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getUri()Landroid/net/Uri;

    move-result-object p1

    .line 682
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 683
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string p1, "com.sonymobile.scan3d.intent.extra.EXCLUDE_URIS"

    .line 684
    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->putParcelableArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    const-string p1, "extra_whats_new_flow_flow"

    .line 685
    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "com.sonymobile.scan3d.intent.extra.EXPLANATORY_TEXT"

    .line 686
    invoke-virtual {v0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 687
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method private startPromotionModeIfNeeded(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)Z
    .locals 6

    .line 620
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "extra_whats_new_flow_flow"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 622
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    return v2

    :cond_0
    const/4 v1, -0x1

    .line 625
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v3

    const v4, -0x673f9493

    const/4 v5, 0x1

    if-eq v3, v4, :cond_2

    const v4, -0xe9302a0

    if-eq v3, v4, :cond_1

    goto :goto_0

    :cond_1
    const-string v3, "extra_whats_new_face_blend_flow"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    move v1, v2

    goto :goto_0

    :cond_2
    const-string v3, "extra_second_model"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    move v1, v5

    :cond_3
    :goto_0
    packed-switch v1, :pswitch_data_0

    move v5, v2

    goto :goto_1

    .line 635
    :pswitch_0
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->startFaceBlendIntent(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V

    goto :goto_1

    :pswitch_1
    const-string v0, "extra_second_model"

    .line 629
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f100107

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 628
    invoke-direct {p0, p1, v0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->startGallery(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Ljava/lang/String;Ljava/lang/String;)V

    :goto_1
    return v5

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public addIdleListener(ILcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$OnIdleListener;I)V
    .locals 1

    .line 335
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mMarshalledDownloader:Lcom/google/android/vending/expansion/downloader/IStub;

    if-eqz v0, :cond_0

    .line 336
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/activity/-$$Lambda$GalleryActivity$dMgU-L2PaZoWkYVEGkwyJojHVqw;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/sonymobile/scan3d/storageservice/ui/activity/-$$Lambda$GalleryActivity$dMgU-L2PaZoWkYVEGkwyJojHVqw;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;ILcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$OnIdleListener;I)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mAddIdleListener:Ljava/lang/Runnable;

    goto :goto_0

    .line 338
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mMonitor:Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;

    invoke-virtual {v0, p1, p2, p3}, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;->addIdleListener(ILcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$OnIdleListener;I)V

    :goto_0
    return-void
.end method

.method public handleMessage(Landroid/os/Message;)Z
    .locals 1

    .line 462
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mProgressDialog:Lcom/sonymobile/scan3d/widgets/SphinxProgressDialog;

    if-eqz v0, :cond_0

    .line 463
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/widgets/SphinxProgressDialog;->dismiss()V

    .line 465
    :cond_0
    iget v0, p1, Landroid/os/Message;->what:I

    if-eqz v0, :cond_1

    const/4 p1, 0x0

    .line 471
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->setResult(I)V

    .line 472
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->finish()V

    goto :goto_0

    .line 467
    :cond_1
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/net/Uri;

    iget p1, p1, Landroid/os/Message;->arg1:I

    invoke-direct {p0, v0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->finishWithResult(Landroid/net/Uri;I)V

    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method public onBackPressed()V
    .locals 3

    .line 301
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    const v1, 0x7f090096

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->findFragmentById(I)Landroidx/fragment/app/Fragment;

    move-result-object v0

    .line 303
    instance-of v0, v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;

    if-eqz v0, :cond_1

    .line 304
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_1

    const-string v1, "extra_whats_new_flow_flow"

    .line 306
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "extra_second_model"

    .line 307
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "extra_whats_new_flow_flow"

    const-string v2, "extra_whats_new_face_blend_flow"

    .line 309
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_0

    :cond_0
    const-string v1, "extra_whats_new_flow_flow"

    const-string v2, ""

    .line 313
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, ""

    .line 314
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 318
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->popBackStackImmediate()Z

    move-result v0

    if-nez v0, :cond_2

    .line 319
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onBackPressed()V

    :cond_2
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 7

    .line 176
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 178
    invoke-static {p0}, Lcom/sonymobile/scan3d/Scan3DApp;->isPartOfBetaProgram(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 179
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->finish()V

    return-void

    :cond_0
    const v0, 0x7f0c0023

    .line 183
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->setContentView(I)V

    .line 184
    invoke-static {p0}, Lcom/sonymobile/scan3d/PreferenceUtils;->updatePreferences(Landroid/content/Context;)V

    .line 185
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const v1, 0x7f0901f8

    .line 188
    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Toolbar;

    const-string v2, "android.intent.action.PICK"

    .line 189
    invoke-virtual {v0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_4

    .line 190
    iput-boolean v3, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mIsPicker:Z

    if-eqz v1, :cond_1

    .line 191
    invoke-virtual {v1}, Landroid/widget/Toolbar;->getMenu()Landroid/view/Menu;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {v1}, Landroid/widget/Toolbar;->getMenu()Landroid/view/Menu;

    move-result-object v2

    invoke-interface {v2}, Landroid/view/Menu;->clear()V

    :cond_1
    const-string v2, "com.sonymobile.scan3d.intent.extra.SCAN_TYPE"

    .line 193
    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v5, "com.sonymobile.scan3d.intent.extra.MIME_TYPES"

    .line 194
    invoke-virtual {v0, v5}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    if-eqz v2, :cond_2

    .line 196
    invoke-static {v2}, Lcom/sonymobile/scan3d/sharing/SharingManager;->parseType(Ljava/lang/String;)[I

    move-result-object v2

    iput-object v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mScanTypesToDisplay:[I

    :cond_2
    if-eqz v5, :cond_4

    .line 198
    array-length v2, v5

    if-lez v2, :cond_4

    .line 199
    aget-object v2, v5, v4

    const-string v6, "model/gltf-binary"

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 200
    array-length v2, v5

    if-le v2, v3, :cond_3

    aget-object v2, v5, v3

    const-string v5, "application/zip"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 201
    sget-object v2, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity$PickType;->GLTF_WITH_FALLBACK:Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity$PickType;

    iput-object v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mPickType:Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity$PickType;

    goto :goto_0

    .line 203
    :cond_3
    sget-object v2, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity$PickType;->GLTF_ONLY:Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity$PickType;

    iput-object v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mPickType:Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity$PickType;

    .line 209
    :cond_4
    :goto_0
    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mScanTypesToDisplay:[I

    if-eqz v2, :cond_5

    array-length v2, v2

    if-nez v2, :cond_6

    .line 210
    :cond_5
    new-array v2, v3, [I

    iput-object v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mScanTypesToDisplay:[I

    .line 211
    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mScanTypesToDisplay:[I

    const v3, 0x7fffffff

    aput v3, v2, v4

    .line 213
    :cond_6
    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->setActionBar(Landroid/widget/Toolbar;)V

    if-nez p1, :cond_7

    .line 216
    sget-object p1, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->GALLERY_SCREEN:Lcom/sonymobile/scan3d/analytics/ScreenEvent;

    invoke-virtual {p1, p0}, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->send(Landroid/content/Context;)V

    const-string p1, "com.sonymobile.scan3d.extra.STARTING_FRAGMENT"

    .line 218
    invoke-virtual {v0, p1, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    invoke-direct {p0, p1, v4}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->setupFragment(IZ)V

    .line 221
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/provider/FileTasks;->checkIntegrity(Landroid/content/Context;)V

    .line 222
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/provider/FileTasks;->checkEncryption(Landroid/content/Context;)V

    .line 225
    :cond_7
    new-instance p1, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;

    invoke-direct {p1}, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mMonitor:Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;

    .line 226
    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1, p0}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mHandler:Landroid/os/Handler;

    .line 230
    invoke-static {}, Lcom/sonymobile/scan3d/ZipResourceManager;->expansionLoaded()Z

    move-result p1

    if-nez p1, :cond_8

    .line 231
    new-instance p1, Landroid/content/Intent;

    const-class v0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;

    invoke-direct {p1, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v0, 0x14000000

    .line 232
    invoke-virtual {p1, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    const/high16 v0, 0x8000000

    .line 233
    invoke-static {p0, v4, p1, v0}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p1

    .line 237
    :try_start_0
    const-class v0, Lcom/sonymobile/scan3d/expansionfile/RemoteDownloadService;

    invoke-static {p0, p1, v0}, Lcom/google/android/vending/expansion/downloader/DownloaderClientMarshaller;->startDownloadServiceIfRequired(Landroid/content/Context;Landroid/app/PendingIntent;Ljava/lang/Class;)I

    move-result p1

    if-eqz p1, :cond_8

    const p1, 0x7f10036e

    .line 240
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->showProgressDialog(I)V

    .line 241
    const-class p1, Lcom/sonymobile/scan3d/expansionfile/RemoteDownloadService;

    invoke-static {p0, p1}, Lcom/google/android/vending/expansion/downloader/DownloaderClientMarshaller;->CreateStub(Lcom/google/android/vending/expansion/downloader/IDownloaderClient;Ljava/lang/Class;)Lcom/google/android/vending/expansion/downloader/IStub;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mMarshalledDownloader:Lcom/google/android/vending/expansion/downloader/IStub;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    .line 245
    invoke-virtual {p1}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    :cond_8
    :goto_1
    return-void
.end method

.method public onDownloadProgress(Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;)V
    .locals 0

    return-void
.end method

.method public onDownloadStateChanged(I)V
    .locals 1

    const/4 v0, 0x5

    if-ne p1, v0, :cond_0

    .line 509
    invoke-static {p0}, Lcom/sonymobile/scan3d/ZipResourceManager;->reload(Landroid/content/Context;)V

    .line 510
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mProgressDialog:Lcom/sonymobile/scan3d/widgets/SphinxProgressDialog;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/widgets/SphinxProgressDialog;->dismiss()V

    .line 511
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mAddIdleListener:Ljava/lang/Runnable;

    if-eqz p1, :cond_0

    .line 512
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    const/4 p1, 0x0

    .line 513
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mAddIdleListener:Ljava/lang/Runnable;

    :cond_0
    return-void
.end method

.method public onFaceMimicPromotionClicked()V
    .locals 4

    .line 429
    sget-object v0, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->CAMERA:Lcom/sonymobile/scan3d/PermissionUtil$Permissions;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->getPermissions()[Ljava/lang/String;

    move-result-object v0

    .line 430
    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/PermissionUtil;->hasPermissions(Landroid/content/Context;[Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 431
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    const-class v2, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;

    .line 432
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    .line 431
    invoke-virtual {v1, v2}, Landroidx/fragment/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v1

    .line 433
    instance-of v2, v1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;

    if-eqz v2, :cond_1

    .line 434
    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/PermissionUtil;->getMissingPermissions(Landroid/content/Context;[Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 436
    check-cast v1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;

    const v2, 0x7f10011d

    const/16 v3, 0x3e8

    invoke-virtual {v1, v0, v2, v3}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->showPermissionRequest([Ljava/lang/String;II)V

    goto :goto_0

    .line 441
    :cond_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->getStartFaceMimicEntryPointIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->startActivity(Landroid/content/Intent;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public onNegativeAnswer(ILandroid/os/Parcelable;)V
    .locals 0

    const p1, 0x7f10024a

    .line 492
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->showProgressDialog(I)V

    .line 493
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mHandler:Landroid/os/Handler;

    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mFileset:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    invoke-interface {p2}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getUri()Landroid/net/Uri;

    move-result-object p2

    invoke-static {p0, p1, p2}, Lcom/sonymobile/scan3d/utils/SharingUtil;->shareStaticFile(Landroid/content/Context;Landroid/os/Handler;Landroid/net/Uri;)V

    return-void
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 2

    .line 252
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onNewIntent(Landroid/content/Intent;)V

    .line 253
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    const-class v1, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;

    .line 254
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    .line 253
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 256
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->isVisible()Z

    move-result v0

    if-nez v0, :cond_1

    .line 257
    :cond_0
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->setIntent(Landroid/content/Intent;)V

    const-string v0, "com.sonymobile.scan3d.extra.STARTING_FRAGMENT"

    const/4 v1, 0x0

    .line 258
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->setupFragment(IZ)V

    :cond_1
    return-void
.end method

.method protected onPause()V
    .locals 1

    .line 265
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onPause()V

    .line 266
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mMonitor:Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;->onPause()V

    return-void
.end method

.method public onPositiveAnswer(ILandroid/os/Parcelable;)V
    .locals 0

    .line 484
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mFileset:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    .line 485
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getUri()Landroid/net/Uri;

    move-result-object p1

    iget p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mTextureSize:I

    .line 484
    invoke-static {p0, p1, p2}, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->getRiggingModeIntent(Landroid/content/Context;Landroid/net/Uri;I)Landroid/content/Intent;

    move-result-object p1

    .line 486
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->startActivity(Landroid/content/Intent;)V

    .line 487
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->finish()V

    return-void
.end method

.method protected onResume()V
    .locals 1

    .line 271
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onResume()V

    const/4 v0, 0x0

    .line 272
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mScanClicked:Z

    .line 273
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mMonitor:Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;->onResume()V

    return-void
.end method

.method public onScanClicked(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V
    .locals 4

    .line 370
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mScanClicked:Z

    if-eqz v0, :cond_0

    return-void

    .line 374
    :cond_0
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->startPromotionModeIfNeeded(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 377
    iput-boolean v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mScanClicked:Z

    return-void

    :cond_1
    const/4 v0, 0x1

    .line 381
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mScanClicked:Z

    .line 382
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mIsPicker:Z

    if-eqz v0, :cond_8

    .line 384
    :try_start_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 385
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->getCallingActivity()Landroid/content/ComponentName;

    move-result-object v2

    if-eqz v2, :cond_3

    const/16 v3, 0x80

    .line 387
    invoke-virtual {v0, v2, v3}, Landroid/content/pm/PackageManager;->getActivityInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;

    move-result-object v2

    .line 389
    iget-object v3, v2, Landroid/content/pm/ActivityInfo;->metaData:Landroid/os/Bundle;

    if-eqz v3, :cond_2

    .line 390
    iget-object v2, v2, Landroid/content/pm/ActivityInfo;->metaData:Landroid/os/Bundle;

    const-string v3, "com.sonymobile.scan3d.meta.reduced_texture"

    invoke-virtual {v2, v3, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v2

    iput v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mTextureSize:I

    goto :goto_0

    .line 392
    :cond_2
    iput v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mTextureSize:I

    .line 395
    :cond_3
    :goto_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v3, "pick_internal"

    invoke-virtual {v2, v3, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v2

    .line 396
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mFileset:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    if-eqz v2, :cond_4

    .line 398
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mFileset:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getUri()Landroid/net/Uri;

    move-result-object p1

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mFileset:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getScanType()I

    move-result v0

    invoke-direct {p0, p1, v0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->finishWithResult(Landroid/net/Uri;I)V

    goto/16 :goto_2

    .line 399
    :cond_4
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mPickType:Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity$PickType;

    sget-object v2, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity$PickType;->OBJ_ONLY:Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity$PickType;

    const v3, 0x7f10024a

    if-eq p1, v2, :cond_7

    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mFileset:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->isRiggable()Z

    move-result p1

    if-nez p1, :cond_5

    goto :goto_1

    .line 404
    :cond_5
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mFileset:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getRiggedFileUrl()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_6

    .line 405
    invoke-direct {p0, v3}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->showProgressDialog(I)V

    .line 406
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mHandler:Landroid/os/Handler;

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mFileset:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getUri()Landroid/net/Uri;

    move-result-object v0

    iget v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mTextureSize:I

    invoke-static {p0, p1, v0, v1}, Lcom/sonymobile/scan3d/utils/SharingUtil;->shareRiggedFile(Landroid/content/Context;Landroid/os/Handler;Landroid/net/Uri;I)V

    goto :goto_2

    .line 409
    :cond_6
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->getCallingPackage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p1

    .line 410
    iget-object p1, p1, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    invoke-virtual {v0, p1}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    move-result-object p1

    .line 411
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    .line 412
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->showAnimationDialog(Ljava/lang/String;)V

    .line 413
    iput-boolean v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mScanClicked:Z

    goto :goto_2

    .line 400
    :cond_7
    :goto_1
    invoke-direct {p0, v3}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->showProgressDialog(I)V

    .line 401
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mHandler:Landroid/os/Handler;

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mFileset:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getUri()Landroid/net/Uri;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lcom/sonymobile/scan3d/utils/SharingUtil;->shareStaticFile(Landroid/content/Context;Landroid/os/Handler;Landroid/net/Uri;)V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception p1

    .line 417
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->getLocalClassName()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to get package info: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 418
    invoke-virtual {p1}, Landroid/content/pm/PackageManager$NameNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 417
    invoke-static {v0, p1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 421
    :cond_8
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getUri()Landroid/net/Uri;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->getViewerModeIntent(Landroid/content/Context;Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object p1

    .line 422
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->startActivity(Landroid/content/Intent;)V

    :goto_2
    return-void
.end method

.method public onServiceConnected(Landroid/os/Messenger;)V
    .locals 1

    .line 502
    invoke-static {p1}, Lcom/google/android/vending/expansion/downloader/DownloaderServiceMarshaller;->CreateProxy(Landroid/os/Messenger;)Lcom/google/android/vending/expansion/downloader/IDownloaderService;

    move-result-object p1

    .line 503
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mMarshalledDownloader:Lcom/google/android/vending/expansion/downloader/IStub;

    invoke-interface {v0}, Lcom/google/android/vending/expansion/downloader/IStub;->getMessenger()Landroid/os/Messenger;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/google/android/vending/expansion/downloader/IDownloaderService;->onClientUpdated(Landroid/os/Messenger;)V

    return-void
.end method

.method protected onStart()V
    .locals 1

    .line 278
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mMarshalledDownloader:Lcom/google/android/vending/expansion/downloader/IStub;

    if-eqz v0, :cond_0

    .line 279
    invoke-interface {v0, p0}, Lcom/google/android/vending/expansion/downloader/IStub;->connect(Landroid/content/Context;)V

    .line 281
    :cond_0
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onStart()V

    return-void
.end method

.method protected onStop()V
    .locals 1

    .line 286
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mMarshalledDownloader:Lcom/google/android/vending/expansion/downloader/IStub;

    if-eqz v0, :cond_0

    .line 287
    invoke-interface {v0, p0}, Lcom/google/android/vending/expansion/downloader/IStub;->disconnect(Landroid/content/Context;)V

    .line 289
    :cond_0
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onStop()V

    return-void
.end method

.method public onUserInteraction()V
    .locals 1

    .line 294
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onUserInteraction()V

    .line 295
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mMonitor:Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;->onUserInteraction()V

    return-void
.end method

.method public permissionRequestAccepted(I)V
    .locals 1

    const/16 v0, 0x3e8

    if-ne p1, v0, :cond_0

    .line 452
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->getStartFaceMimicEntryPointIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->startActivity(Landroid/content/Intent;)V

    :cond_0
    return-void
.end method

.method public removeIdleListener(I)V
    .locals 1

    .line 348
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->mMonitor:Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor;->removeIdleListener(I)V

    return-void
.end method
