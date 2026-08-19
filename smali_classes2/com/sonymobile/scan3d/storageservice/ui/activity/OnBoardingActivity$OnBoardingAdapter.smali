.class Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoardingAdapter;
.super Landroidx/fragment/app/FragmentStatePagerAdapter;
.source "OnBoardingActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "OnBoardingAdapter"
.end annotation


# instance fields
.field private mRTLDirection:Z


# direct methods
.method constructor <init>(Landroidx/fragment/app/FragmentManager;Z)V
    .locals 1

    const/4 v0, 0x1

    .line 133
    invoke-direct {p0, p1, v0}, Landroidx/fragment/app/FragmentStatePagerAdapter;-><init>(Landroidx/fragment/app/FragmentManager;I)V

    .line 134
    iput-boolean p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoardingAdapter;->mRTLDirection:Z

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .line 145
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;->values()[Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;

    move-result-object v0

    array-length v0, v0

    return v0
.end method

.method public getItem(I)Landroidx/fragment/app/Fragment;
    .locals 1

    .line 139
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoardingAdapter;->mRTLDirection:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoardingAdapter;->getCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    sub-int p1, v0, p1

    .line 140
    :cond_0
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;->getItem(I)Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;

    move-result-object p1

    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/OnBoardingItemFragment;->newInstance(Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;)Lcom/sonymobile/scan3d/storageservice/ui/fragment/OnBoardingItemFragment;

    move-result-object p1

    return-object p1
.end method
