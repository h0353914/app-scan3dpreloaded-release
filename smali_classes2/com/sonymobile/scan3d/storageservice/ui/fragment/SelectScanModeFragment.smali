.class public Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment;
.super Landroidx/fragment/app/DialogFragment;
.source "SelectScanModeFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScalePageTransformer;,
        Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanModeItemFragment;,
        Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;,
        Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$IScanChoiceListener;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 37
    invoke-direct {p0}, Landroidx/fragment/app/DialogFragment;-><init>()V

    return-void
.end method

.method static synthetic access$100(Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment;I)I
    .locals 0

    .line 37
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment;->reverseIndexIfRtl(I)I

    move-result p0

    return p0
.end method

.method private getLastUsedScanMode()I
    .locals 3

    .line 297
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const v1, 0x7f1001d9

    .line 298
    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 300
    :try_start_0
    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;->valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;

    move-result-object v0

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;->ordinal()I

    move-result v0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    const/4 v0, 0x0

    return v0
.end method

.method public static synthetic lambda$onViewCreated$0(Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment;Landroid/view/View;)V
    .locals 0

    .line 270
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment;->dismiss()V

    return-void
.end method

.method public static newInstance(Landroidx/fragment/app/Fragment;)Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment;
    .locals 2

    .line 212
    instance-of v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$IScanChoiceListener;

    if-eqz v0, :cond_0

    .line 217
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment;-><init>()V

    const/4 v1, 0x0

    .line 218
    invoke-virtual {v0, p0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment;->setTargetFragment(Landroidx/fragment/app/Fragment;I)V

    return-object v0

    .line 213
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Target fragment must implement IScanChoiceListener"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private reverseIndexIfRtl(I)I
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/IntRange;
            from = 0x0L
        .end annotation
    .end param

    .line 289
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Configuration;->getLayoutDirection()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 290
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;->values()[Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;

    move-result-object v0

    array-length v0, v0

    sub-int/2addr v0, p1

    sub-int/2addr v0, v1

    return v0

    :cond_0
    return p1
.end method


# virtual methods
.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 2

    .line 228
    new-instance p1, Landroid/app/Dialog;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f110128

    invoke-direct {p1, v0, v1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    return-object p1
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const p3, 0x7f0c0052

    const/4 v0, 0x0

    .line 243
    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 1

    .line 233
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment;->getTargetFragment()Landroidx/fragment/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$IScanChoiceListener;

    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$IScanChoiceListener;->onSelectScanModeDialogDismissed()V

    .line 234
    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onDismiss(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 4

    .line 248
    invoke-super {p0, p1, p2}, Landroidx/fragment/app/DialogFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    const v0, 0x7f09021b

    .line 250
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/viewpager/widget/ViewPager;

    .line 251
    new-instance v1, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScalePageTransformer;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScalePageTransformer;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$1;)V

    const/4 v2, 0x1

    invoke-virtual {v0, v2, v1}, Landroidx/viewpager/widget/ViewPager;->setPageTransformer(ZLandroidx/viewpager/widget/ViewPager$PageTransformer;)V

    const/4 v1, 0x2

    .line 252
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setOffscreenPageLimit(I)V

    .line 253
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setOverScrollMode(I)V

    .line 254
    new-instance v1, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$1;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v3

    invoke-direct {v1, p0, v3, v2}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$1;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment;Landroidx/fragment/app/FragmentManager;I)V

    .line 266
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Landroidx/viewpager/widget/PagerAdapter;)V

    .line 268
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment;->getLastUsedScanMode()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment;->reverseIndexIfRtl(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    const v0, 0x7f09019a

    .line 269
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .line 270
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/-$$Lambda$SelectScanModeFragment$rPcFdMjcwZS2hytgN_Q2V1sywgY;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/-$$Lambda$SelectScanModeFragment$rPcFdMjcwZS2hytgN_Q2V1sywgY;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    if-nez p2, :cond_0

    .line 274
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment;->getView()Landroid/view/View;

    move-result-object p2

    const v0, 0x7f09021c

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    const/4 v0, 0x0

    .line 275
    invoke-virtual {p2, v0}, Landroid/view/View;->setAlpha(F)V

    .line 276
    invoke-virtual {p2}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p2

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p2, v0}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p2

    new-instance v0, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v0}, Landroid/view/animation/LinearInterpolator;-><init>()V

    invoke-virtual {p2, v0}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object p2

    invoke-virtual {p2}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 277
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const/high16 p2, 0x43b40000    # 360.0f

    invoke-virtual {p1, p2}, Landroid/view/ViewPropertyAnimator;->rotationBy(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const-wide/16 v0, 0x3e8

    invoke-virtual {p1, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    new-instance p2, Landroid/view/animation/OvershootInterpolator;

    invoke-direct {p2}, Landroid/view/animation/OvershootInterpolator;-><init>()V

    .line 278
    invoke-virtual {p1, p2}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    :cond_0
    return-void
.end method
