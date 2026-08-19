.class public Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity;
.super Landroidx/fragment/app/FragmentActivity;
.source "OnBoardingActivity.java"

# interfaces
.implements Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/OnCloseListener;
.implements Lcom/sonymobile/scan3d/storageservice/ui/upload/IStatusListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoardingAdapter;,
        Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;
    }
.end annotation


# static fields
.field private static final DATA_DIALOG_ID:I = 0x3e8


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Landroidx/fragment/app/FragmentActivity;-><init>()V

    return-void
.end method

.method private close()V
    .locals 2

    const-string v0, "android.intent.action.MAIN"

    .line 211
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 212
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const v1, 0x10008000

    .line 213
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 214
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity;->startActivity(Landroid/content/Intent;)V

    .line 216
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity;->finish()V

    const/4 v0, 0x0

    const v1, 0x10a0001

    .line 217
    invoke-virtual {p0, v0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity;->overridePendingTransition(II)V

    return-void
.end method


# virtual methods
.method public onCancel(I)V
    .locals 1

    const/16 v0, 0x3e8

    if-ne p1, v0, :cond_0

    .line 245
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity;->finish()V

    :cond_0
    return-void
.end method

.method public onClose()V
    .locals 3

    .line 197
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 198
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const v1, 0x7f1001ed

    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 200
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity;->close()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4

    .line 151
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 154
    invoke-static {p0}, Lcom/sonymobile/scan3d/Scan3DApp;->isPartOfBetaProgram(Landroid/content/Context;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 155
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity;->finish()V

    return-void

    .line 159
    :cond_0
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    const v0, 0x7f1001ed

    .line 161
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    .line 163
    invoke-static {p0}, Lcom/sonymobile/scan3d/utils/SystemUtils;->showCtaNotification(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/16 p1, 0x3e8

    .line 164
    invoke-static {p1}, Lcom/sonymobile/scan3d/viewer/fragments/DataPermissionFragment;->newInstance(I)Lcom/sonymobile/scan3d/viewer/fragments/DataPermissionFragment;

    move-result-object p1

    .line 165
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    const-class v2, Lcom/sonymobile/scan3d/viewer/fragments/DataPermissionFragment;

    invoke-virtual {v2}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v0, v2}, Lcom/sonymobile/scan3d/viewer/fragments/DataPermissionFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    move p1, v1

    :cond_1
    if-eqz p1, :cond_4

    const p1, 0x7f0c001e

    .line 170
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity;->setContentView(I)V

    .line 172
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    const/16 v0, 0x700

    .line 173
    invoke-virtual {p1, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    const p1, 0x7f09021b

    .line 177
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/viewpager/widget/ViewPager;

    .line 178
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Configuration;->getLayoutDirection()I

    move-result v0

    if-ne v0, v1, :cond_2

    move v0, v1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    .line 179
    :goto_0
    new-instance v2, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoardingAdapter;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoardingAdapter;-><init>(Landroidx/fragment/app/FragmentManager;Z)V

    invoke-virtual {p1, v2}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Landroidx/viewpager/widget/PagerAdapter;)V

    const v2, 0x7f0900f9

    .line 181
    invoke-virtual {p0, v2}, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/sonymobile/scan3d/storageservice/ui/component/OnBoardingIndicatorControl;

    .line 182
    invoke-virtual {v2, p0}, Lcom/sonymobile/scan3d/storageservice/ui/component/OnBoardingIndicatorControl;->setOnCloseListener(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/OnCloseListener;)V

    if-eqz v0, :cond_3

    .line 185
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Landroidx/viewpager/widget/PagerAdapter;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/viewpager/widget/PagerAdapter;->getCount()I

    move-result v0

    sub-int/2addr v0, v1

    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 188
    :cond_3
    sget-object p1, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->ONBOARDING:Lcom/sonymobile/scan3d/analytics/ScreenEvent;

    invoke-virtual {p1, p0}, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->send(Landroid/content/Context;)V

    goto :goto_1

    .line 190
    :cond_4
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity;->close()V

    :goto_1
    return-void
.end method

.method public onDismiss(I)V
    .locals 1

    const/16 v0, 0x3e8

    if-ne p1, v0, :cond_0

    .line 238
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity;->finish()V

    :cond_0
    return-void
.end method

.method public onFailure(II)V
    .locals 0

    const/16 p2, 0x3e8

    if-ne p1, p2, :cond_0

    .line 231
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity;->finish()V

    :cond_0
    return-void
.end method

.method public onSuccess(ILjava/lang/Object;)V
    .locals 1

    const/16 p2, 0x3e8

    if-ne p1, p2, :cond_0

    .line 223
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    .line 224
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const p2, 0x7f1001ec

    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity;->getString(I)Ljava/lang/String;

    move-result-object p2

    const/4 v0, 0x0

    invoke-interface {p1, p2, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_0
    return-void
.end method
