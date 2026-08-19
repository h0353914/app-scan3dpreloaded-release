.class public Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity;
.super Landroidx/fragment/app/FragmentActivity;
.source "FirstTimeActivity.java"

# interfaces
.implements Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/VideoTipFragmentOwner;
.implements Lcom/sonymobile/scan3d/ZipResourceManager$ZipResourceFileListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity$TipAdapter;,
        Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity$PageListener;
    }
.end annotation


# static fields
.field public static final EXTRA_CATEGORY:Ljava/lang/String; = "com.sonymobile.scan3d.extras.TIP_CATEGORY"

.field public static final EXTRA_HAS_RUN:Ljava/lang/String; = "com.sonymobile.scan3d.extras.HAS_RUN"


# instance fields
.field private mCategory:Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;

.field private final mExecutor:Ljava/util/concurrent/Executor;

.field private mPager:Landroidx/viewpager/widget/ViewPager;

.field private mRTLDirection:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 37
    invoke-direct {p0}, Landroidx/fragment/app/FragmentActivity;-><init>()V

    .line 62
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity;->mExecutor:Ljava/util/concurrent/Executor;

    return-void
.end method

.method private setUIFlags()V
    .locals 2

    .line 176
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x1706

    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    return-void
.end method


# virtual methods
.method public getVideoExecutor()Ljava/util/concurrent/Executor;
    .locals 1

    .line 249
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity;->mExecutor:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method public onBackPressed()V
    .locals 1

    const/4 v0, 0x0

    .line 224
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity;->setResult(I)V

    .line 225
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity;->finish()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 187
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    const v0, 0x7f0c005d

    .line 188
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity;->setContentView(I)V

    .line 190
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    .line 191
    invoke-virtual {v0}, Landroid/content/res/Configuration;->getLayoutDirection()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    iput-boolean v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity;->mRTLDirection:Z

    .line 194
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity;->setUIFlags()V

    .line 196
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "com.sonymobile.scan3d.extras.TIP_CATEGORY"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;

    if-eqz v0, :cond_1

    .line 199
    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity;->mCategory:Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;

    .line 202
    :cond_1
    invoke-static {}, Lcom/sonymobile/scan3d/ZipResourceManager;->getInstance()Lcom/sonymobile/scan3d/ZipResourceManager;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/sonymobile/scan3d/ZipResourceManager;->addZipResourceFileListener(Lcom/sonymobile/scan3d/ZipResourceManager$ZipResourceFileListener;)V

    if-nez p1, :cond_2

    if-eqz v0, :cond_2

    .line 205
    sget-object p1, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->SCREEN_EVENT_FROM_REFERENS_ID:Lcom/sonymobile/scan3d/analytics/ScreenEvent;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->getScreenEvent()I

    move-result v0

    invoke-virtual {p1, p0, v0}, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->send(Landroid/content/Context;I)V

    :cond_2
    return-void
.end method

.method protected onResume()V
    .locals 0

    .line 211
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onResume()V

    .line 213
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity;->setUIFlags()V

    return-void
.end method

.method public onStartTutorialScan(Landroid/view/View;)V
    .locals 0

    const/4 p1, -0x1

    .line 234
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity;->setResult(I)V

    .line 235
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity;->finish()V

    return-void
.end method

.method protected onStop()V
    .locals 1

    .line 218
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onStop()V

    .line 219
    invoke-static {}, Lcom/sonymobile/scan3d/ZipResourceManager;->getInstance()Lcom/sonymobile/scan3d/ZipResourceManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/sonymobile/scan3d/ZipResourceManager;->removeZipResourceFileListener(Lcom/sonymobile/scan3d/ZipResourceManager$ZipResourceFileListener;)V

    return-void
.end method

.method public onVideoFinished()V
    .locals 4

    .line 241
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity;->mRTLDirection:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    goto :goto_0

    :cond_0
    move v0, v1

    .line 244
    :goto_0
    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity;->mPager:Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {v2}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    move-result v3

    add-int/2addr v3, v0

    invoke-virtual {v2, v3, v1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(IZ)V

    return-void
.end method

.method public onZipResourceLoaded()V
    .locals 5

    .line 254
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity;->mCategory:Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;

    if-eqz v0, :cond_1

    .line 255
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "com.sonymobile.scan3d.extras.HAS_RUN"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    const v1, 0x7f09021b

    .line 256
    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroidx/viewpager/widget/ViewPager;

    iput-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity;->mPager:Landroidx/viewpager/widget/ViewPager;

    .line 257
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity;->mCategory:Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->getTips()Ljava/util/List;

    move-result-object v1

    .line 258
    invoke-static {}, Lcom/sonymobile/scan3d/ZipResourceManager;->getZipResourceFile()Lcom/android/vending/expansion/zipfile/ZipResourceFile;

    move-result-object v2

    .line 259
    new-instance v3, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity$TipAdapter;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v4

    invoke-direct {v3, v4, v1, v0, v2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity$TipAdapter;-><init>(Landroidx/fragment/app/FragmentManager;Ljava/util/List;ZLcom/android/vending/expansion/zipfile/ZipResourceFile;)V

    .line 260
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity;->mPager:Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {v0, v3}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Landroidx/viewpager/widget/PagerAdapter;)V

    .line 261
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity;->mRTLDirection:Z

    if-eqz v0, :cond_0

    .line 262
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity;->mPager:Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {v3}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity$TipAdapter;->getCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    :cond_0
    return-void

    .line 265
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "No tip category added."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
