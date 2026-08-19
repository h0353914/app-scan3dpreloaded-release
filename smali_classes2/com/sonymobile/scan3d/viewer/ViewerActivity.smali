.class public Lcom/sonymobile/scan3d/viewer/ViewerActivity;
.super Landroidx/fragment/app/FragmentActivity;
.source "ViewerActivity.java"

# interfaces
.implements Lcom/sonymobile/scan3d/viewer/fragments/ViewerActivityInterface;
.implements Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;


# static fields
.field private static final COMPARE_MODE:I = 0x9

.field private static final EXTRA_CREATION_TIME:Ljava/lang/String; = "com.sonymobile.scan3d.extra.CALL_TIME"

.field private static final EXTRA_ENV_ERROR:Ljava/lang/String; = "com.sonymobile.scan3d.extra.ENV_ERROR"

.field private static final EXTRA_IMPROVEMENT:Ljava/lang/String; = "com.sonymobile.scan3d.extra.IMPROVEMENT"

.field private static final EXTRA_LONG_SCAN:Ljava/lang/String; = "com.sonymobile.scan3d.extra.LONG_SCAN"

.field private static final EXTRA_MODELS_URI:Ljava/lang/String; = "extra_models_uri"

.field private static final EXTRA_SHORT_SCAN:Ljava/lang/String; = "com.sonymobile.scan3d.extra.SHORT_SCAN"

.field private static final EXTRA_TEXTURE_SIZE:Ljava/lang/String; = "com.sonymobile.scan3d.extra.TEXTURE_SIZE"

.field private static final EXTRA_TOO_LONG:Ljava/lang/String; = "com.sonymobile.scan3d.extra.TOO_lONG"

.field private static final EXTRA_VIEWER_MODE:Ljava/lang/String; = "com.sonymobile.scan3d.extra.VIEWER_MODE"

.field private static final FACE_BLEND_MODE:I = 0xb

.field private static final FACE_TUTORIAL_GOOD_JOB_MODE:I = 0x5

.field private static final FOOD_TUTORIAL_GOOD_JOB_MODE:I = 0x7

.field private static final HEAD_TUTORIAL_GOOD_JOB_MODE:I = 0x6

.field private static final KEEP_DISCARD_MODE:I = 0x2

.field private static final OPEN_NEXT_TUTORIAL:Ljava/lang/String; = "com.sonymobile.scan3d.extra.OPEN_NEXT_TUTORIAL"

.field private static final OPEN_WITH_MODE:I = 0x4

.field private static final RIGGING_MODE:I = 0xa

.field private static final SELFIE_TUTORIAL_GOOD_JOB_MODE:I = 0x8

.field private static final TAG:Ljava/lang/String; = "ViewerActivity"

.field private static final VIEWER_MODE:I = 0x1


# instance fields
.field private mOnBackPressListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/sonymobile/scan3d/OnBackPressListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 47
    invoke-direct {p0}, Landroidx/fragment/app/FragmentActivity;-><init>()V

    .line 124
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->mOnBackPressListeners:Ljava/util/ArrayList;

    return-void
.end method

.method public static getFaceBlendIntent(Landroid/content/Context;Ljava/util/ArrayList;)Landroid/content/Intent;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Landroid/net/Uri;",
            ">;)",
            "Landroid/content/Intent;"
        }
    .end annotation

    .line 337
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/sonymobile/scan3d/viewer/ViewerActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string p0, "extra_models_uri"

    .line 338
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putParcelableArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    const-string p0, "com.sonymobile.scan3d.extra.VIEWER_MODE"

    const/16 p1, 0xb

    .line 339
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const/high16 p0, 0x10000000

    .line 340
    invoke-virtual {v0, p0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    return-object v0
.end method

.method public static getGoodJobFaceScanViewIntent(Landroid/content/Context;Landroid/net/Uri;ZZ)Landroid/content/Intent;
    .locals 1

    const/4 v0, 0x5

    .line 287
    invoke-static {v0, p0, p1, p2, p3}, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->getGoodJobScanViewIntent(ILandroid/content/Context;Landroid/net/Uri;ZZ)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method public static getGoodJobFoodScanViewIntent(Landroid/content/Context;Landroid/net/Uri;Z)Landroid/content/Intent;
    .locals 2

    const/4 v0, 0x7

    const/4 v1, 0x0

    .line 313
    invoke-static {v0, p0, p1, p2, v1}, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->getGoodJobScanViewIntent(ILandroid/content/Context;Landroid/net/Uri;ZZ)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method public static getGoodJobHeadScanViewIntent(Landroid/content/Context;Landroid/net/Uri;ZZ)Landroid/content/Intent;
    .locals 1

    const/4 v0, 0x6

    .line 301
    invoke-static {v0, p0, p1, p2, p3}, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->getGoodJobScanViewIntent(ILandroid/content/Context;Landroid/net/Uri;ZZ)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method private static getGoodJobScanViewIntent(ILandroid/content/Context;Landroid/net/Uri;ZZ)Landroid/content/Intent;
    .locals 2

    .line 346
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/sonymobile/scan3d/viewer/ViewerActivity;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string p1, "com.sonymobile.scan3d.extra.VIEWER_MODE"

    .line 347
    invoke-virtual {v0, p1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p0, "com.sonymobile.scan3d.extra.TOO_lONG"

    .line 348
    invoke-virtual {v0, p0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p0, "com.sonymobile.scan3d.extra.OPEN_NEXT_TUTORIAL"

    .line 349
    invoke-virtual {v0, p0, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 350
    invoke-virtual {v0, p2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    return-object v0
.end method

.method public static getGoodJobSelfieScanViewIntent(Landroid/content/Context;Landroid/net/Uri;ZZ)Landroid/content/Intent;
    .locals 1

    const/16 v0, 0x8

    .line 326
    invoke-static {v0, p0, p1, p2, p3}, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->getGoodJobScanViewIntent(ILandroid/content/Context;Landroid/net/Uri;ZZ)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method public static getImprovementIntent(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/Improvement;)Landroid/content/Intent;
    .locals 2

    .line 255
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/sonymobile/scan3d/viewer/ViewerActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string p0, "com.sonymobile.scan3d.extra.VIEWER_MODE"

    const/16 v1, 0x9

    .line 256
    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 257
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->getFileSetUri()Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const-string p0, "com.sonymobile.scan3d.extra.IMPROVEMENT"

    .line 258
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const/high16 p0, 0x14000000

    .line 259
    invoke-virtual {v0, p0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    return-object v0
.end method

.method public static getRiggingModeIntent(Landroid/content/Context;Landroid/net/Uri;I)Landroid/content/Intent;
    .locals 2

    .line 237
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/sonymobile/scan3d/viewer/ViewerActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 238
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const-string p0, "com.sonymobile.scan3d.extra.VIEWER_MODE"

    const/16 p1, 0xa

    .line 239
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p0, "com.sonymobile.scan3d.extra.TEXTURE_SIZE"

    .line 240
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p0, "com.sonymobile.scan3d.extra.CALL_TIME"

    .line 241
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    invoke-virtual {v0, p0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    const/high16 p0, 0x10000000

    .line 242
    invoke-virtual {v0, p0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    const/high16 p0, 0x2000000

    .line 243
    invoke-virtual {v0, p0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    return-object v0
.end method

.method public static getViewerModeIntent(Landroid/content/Context;Landroid/net/Uri;)Landroid/content/Intent;
    .locals 3

    .line 221
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/sonymobile/scan3d/viewer/ViewerActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 222
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const-string p0, "com.sonymobile.scan3d.extra.VIEWER_MODE"

    const/4 p1, 0x1

    .line 223
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p0, "com.sonymobile.scan3d.extra.CALL_TIME"

    .line 224
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {v0, p0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    const/high16 p0, 0x10000000

    .line 225
    invoke-virtual {v0, p0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    return-object v0
.end method

.method private setupFragment(I)V
    .locals 5

    .line 355
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "com.sonymobile.scan3d.extra.TOO_lONG"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    .line 356
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v3, "com.sonymobile.scan3d.extra.OPEN_NEXT_TUTORIAL"

    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    .line 357
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const/4 v4, 0x1

    packed-switch p1, :pswitch_data_0

    .line 412
    :pswitch_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown mode "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_1
    const-string p1, "extra_models_uri"

    .line 406
    invoke-virtual {v3, p1}, Landroid/content/Intent;->getParcelableArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 408
    invoke-static {p1}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->newInstance(Ljava/util/ArrayList;)Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->showFragment(Landroidx/fragment/app/Fragment;)V

    goto/16 :goto_0

    .line 402
    :pswitch_2
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "com.sonymobile.scan3d.extra.TEXTURE_SIZE"

    invoke-virtual {p1, v0, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    .line 401
    invoke-static {v4, p1}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->newInstance(ZI)Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->showFragment(Landroidx/fragment/app/Fragment;)V

    .line 403
    sget-object p1, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->VIEWER_SCREEN:Lcom/sonymobile/scan3d/analytics/ScreenEvent;

    invoke-virtual {p1, p0}, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->send(Landroid/content/Context;)V

    goto/16 :goto_0

    :pswitch_3
    const-string p1, "com.sonymobile.scan3d.extra.IMPROVEMENT"

    .line 376
    invoke-virtual {v3, p1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;

    .line 377
    invoke-static {p1}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->newInstance(Lcom/sonymobile/scan3d/storageservice/provider/Improvement;)Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->showFragment(Landroidx/fragment/app/Fragment;)V

    .line 378
    sget-object p1, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->VIEWER_SCREEN:Lcom/sonymobile/scan3d/analytics/ScreenEvent;

    invoke-virtual {p1, p0}, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->send(Landroid/content/Context;)V

    goto :goto_0

    :pswitch_4
    const/4 p1, 0x3

    .line 396
    invoke-static {p1, v0, v1}, Lcom/sonymobile/scan3d/viewer/fragments/GoodJobFragment;->newInstance(IZZ)Landroidx/fragment/app/Fragment;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->showFragment(Landroidx/fragment/app/Fragment;)V

    .line 398
    sget-object p1, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->VIEWER_SCREEN:Lcom/sonymobile/scan3d/analytics/ScreenEvent;

    invoke-virtual {p1, p0}, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->send(Landroid/content/Context;)V

    goto :goto_0

    :pswitch_5
    const/4 p1, 0x2

    .line 391
    invoke-static {p1, v0, v1}, Lcom/sonymobile/scan3d/viewer/fragments/GoodJobFragment;->newInstance(IZZ)Landroidx/fragment/app/Fragment;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->showFragment(Landroidx/fragment/app/Fragment;)V

    .line 393
    sget-object p1, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->VIEWER_SCREEN:Lcom/sonymobile/scan3d/analytics/ScreenEvent;

    invoke-virtual {p1, p0}, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->send(Landroid/content/Context;)V

    goto :goto_0

    .line 386
    :pswitch_6
    invoke-static {v4, v0, v1}, Lcom/sonymobile/scan3d/viewer/fragments/GoodJobFragment;->newInstance(IZZ)Landroidx/fragment/app/Fragment;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->showFragment(Landroidx/fragment/app/Fragment;)V

    .line 388
    sget-object p1, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->VIEWER_SCREEN:Lcom/sonymobile/scan3d/analytics/ScreenEvent;

    invoke-virtual {p1, p0}, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->send(Landroid/content/Context;)V

    goto :goto_0

    .line 381
    :pswitch_7
    invoke-static {v2, v0, v1}, Lcom/sonymobile/scan3d/viewer/fragments/GoodJobFragment;->newInstance(IZZ)Landroidx/fragment/app/Fragment;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->showFragment(Landroidx/fragment/app/Fragment;)V

    .line 383
    sget-object p1, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->VIEWER_SCREEN:Lcom/sonymobile/scan3d/analytics/ScreenEvent;

    invoke-virtual {p1, p0}, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->send(Landroid/content/Context;)V

    goto :goto_0

    .line 372
    :pswitch_8
    invoke-static {}, Lcom/sonymobile/scan3d/viewer/fragments/OpenWithFragment;->newInstance()Landroidx/fragment/app/Fragment;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->showFragment(Landroidx/fragment/app/Fragment;)V

    .line 373
    sget-object p1, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->VIEWER_SCREEN:Lcom/sonymobile/scan3d/analytics/ScreenEvent;

    invoke-virtual {p1, p0}, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->send(Landroid/content/Context;)V

    goto :goto_0

    :pswitch_9
    const-string p1, "com.sonymobile.scan3d.extra.SHORT_SCAN"

    .line 364
    invoke-virtual {v3, p1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p1

    const-string v0, "com.sonymobile.scan3d.extra.LONG_SCAN"

    .line 365
    invoke-virtual {v3, v0, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    const-string v1, "com.sonymobile.scan3d.extra.ENV_ERROR"

    .line 367
    invoke-virtual {v3, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v1

    check-cast v1, Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;

    .line 368
    invoke-static {p1, v0, v1}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->newInstance(ZZLcom/sonymobile/scan3d/EnvironmentError$ErrorType;)Landroidx/fragment/app/Fragment;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->showFragment(Landroidx/fragment/app/Fragment;)V

    .line 369
    sget-object p1, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->VIEWER_SCREEN:Lcom/sonymobile/scan3d/analytics/ScreenEvent;

    invoke-virtual {p1, p0}, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->send(Landroid/content/Context;)V

    goto :goto_0

    .line 360
    :pswitch_a
    invoke-static {}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->newInstance()Landroidx/fragment/app/Fragment;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->showFragment(Landroidx/fragment/app/Fragment;)V

    .line 361
    sget-object p1, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->VIEWER_SCREEN:Lcom/sonymobile/scan3d/analytics/ScreenEvent;

    invoke-virtual {p1, p0}, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->send(Landroid/content/Context;)V

    :cond_0
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_a
        :pswitch_9
        :pswitch_0
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method private showFragment(Landroidx/fragment/app/Fragment;)V
    .locals 2

    .line 170
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    .line 171
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object v0

    const/16 v1, 0x1003

    .line 172
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentTransaction;->setTransition(I)Landroidx/fragment/app/FragmentTransaction;

    const v1, 0x7f0900dc

    .line 173
    invoke-virtual {v0, v1, p1}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 174
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentTransaction;->commit()I

    return-void
.end method

.method public static showInKeepDiscardMode(Landroid/content/Context;Landroid/net/Uri;ZZLcom/sonymobile/scan3d/EnvironmentError$ErrorType;I)V
    .locals 3

    .line 200
    sget-object v0, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "showInKeepDiscardMode(): uri="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 201
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/sonymobile/scan3d/viewer/ViewerActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 202
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const-string p1, "com.sonymobile.scan3d.extra.VIEWER_MODE"

    const/4 v1, 0x2

    .line 203
    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p1, "com.sonymobile.scan3d.extra.CALL_TIME"

    .line 204
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    const-string p1, "com.sonymobile.scan3d.extra.SHORT_SCAN"

    .line 205
    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p1, "com.sonymobile.scan3d.extra.LONG_SCAN"

    .line 206
    invoke-virtual {v0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p1, "com.sonymobile.scan3d.extra.ENV_ERROR"

    .line 207
    invoke-virtual {v0, p1, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    const-string p1, "policy_mode"

    .line 208
    invoke-virtual {v0, p1, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const/high16 p1, 0x10000000

    .line 209
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 210
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public static showInOpenWithMode(Landroid/content/Context;Landroid/net/Uri;)V
    .locals 2

    .line 270
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/sonymobile/scan3d/viewer/ViewerActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 271
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const-string p1, "com.sonymobile.scan3d.extra.VIEWER_MODE"

    const/4 v1, 0x4

    .line 272
    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const/high16 p1, 0x10000000

    .line 273
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 274
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method


# virtual methods
.method public doClick(Landroid/view/View;)V
    .locals 2

    .line 138
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->mOnBackPressListeners:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v0, 0x0

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sonymobile/scan3d/OnBackPressListener;

    .line 139
    invoke-interface {v1}, Lcom/sonymobile/scan3d/OnBackPressListener;->onBackPressed()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    .line 143
    :cond_1
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->mOnBackPressListeners:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_2

    if-nez v0, :cond_3

    .line 144
    :cond_2
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onBackPressed()V

    :cond_3
    return-void
.end method

.method public finishWithResult(Landroid/net/Uri;I)V
    .locals 1

    .line 429
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 430
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const/4 p1, 0x1

    .line 431
    invoke-virtual {v0, p1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const-string p1, "com.sonymobile.scan3d.intent.extra.SCAN_TYPE"

    .line 432
    invoke-static {p2}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->scanTypeToString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/4 p1, -0x1

    .line 433
    invoke-virtual {p0, p1, v0}, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->setResult(ILandroid/content/Intent;)V

    .line 434
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->finish()V

    return-void
.end method

.method public onBackPressed()V
    .locals 1

    const/4 v0, 0x0

    .line 129
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->onClick(Landroid/view/View;)V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 150
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    const v0, 0x7f0c0026

    .line 151
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->setContentView(I)V

    if-nez p1, :cond_1

    .line 157
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "com.sonymobile.scan3d.extra.VIEWER_MODE"

    const/4 v1, -0x1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    const/16 v0, 0xa

    if-ne p1, v0, :cond_0

    .line 161
    invoke-static {p0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getInstance(Landroidx/fragment/app/FragmentActivity;)Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    .line 163
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "com.sonymobile.scan3d.extra.VIEWER_MODE"

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->setupFragment(I)V

    .line 166
    :cond_1
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;->init(Landroid/content/Context;)V

    return-void
.end method

.method public pickRiggedFileFailed(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V
    .locals 1

    .line 417
    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    const/4 v0, 0x0

    .line 418
    invoke-virtual {p0, v0, p1}, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->setResult(ILandroid/content/Intent;)V

    .line 419
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->finish()V

    return-void
.end method

.method public registerOnBackPressListener(Lcom/sonymobile/scan3d/OnBackPressListener;)V
    .locals 2

    .line 179
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->mOnBackPressListeners:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    return-void
.end method

.method public unregisterOnBackPressListener(Lcom/sonymobile/scan3d/OnBackPressListener;)V
    .locals 1

    .line 184
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->mOnBackPressListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    return-void
.end method
