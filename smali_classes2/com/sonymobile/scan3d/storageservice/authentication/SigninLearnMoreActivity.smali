.class public Lcom/sonymobile/scan3d/storageservice/authentication/SigninLearnMoreActivity;
.super Landroid/app/Activity;
.source "SigninLearnMoreActivity.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "SigninLearnMoreActivity"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 27
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method public static getLaunchIntent(Landroid/content/Context;)Landroid/content/Intent;
    .locals 2

    .line 59
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/sonymobile/scan3d/storageservice/authentication/SigninLearnMoreActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    return-object v0
.end method

.method public static synthetic lambda$onCreate$0(Lcom/sonymobile/scan3d/storageservice/authentication/SigninLearnMoreActivity;Landroid/view/View;)V
    .locals 0

    .line 38
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninLearnMoreActivity;->finishAfterTransition()V

    return-void
.end method

.method public static synthetic lambda$onCreate$1(Lcom/sonymobile/scan3d/storageservice/authentication/SigninLearnMoreActivity;Landroid/view/View;)V
    .locals 1

    .line 46
    new-instance p1, Landroid/content/Intent;

    const-string v0, "android.intent.action.VIEW"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const v0, 0x7f10028e

    .line 47
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninLearnMoreActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 49
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninLearnMoreActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 51
    :catch_0
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/authentication/SigninLearnMoreActivity;->TAG:Ljava/lang/String;

    const-string v0, "Couldn\'t find a browser."

    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4

    .line 33
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const/16 p1, 0xe

    .line 34
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninLearnMoreActivity;->setRequestedOrientation(I)V

    const p1, 0x7f0c00b5

    .line 35
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninLearnMoreActivity;->setContentView(I)V

    const p1, 0x7f0901f8

    .line 37
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninLearnMoreActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Toolbar;

    .line 38
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/authentication/-$$Lambda$SigninLearnMoreActivity$1fMdJwn7mg7jrOPP7nWV42UFUeI;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/storageservice/authentication/-$$Lambda$SigninLearnMoreActivity$1fMdJwn7mg7jrOPP7nWV42UFUeI;-><init>(Lcom/sonymobile/scan3d/storageservice/authentication/SigninLearnMoreActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/Toolbar;->setNavigationOnClickListener(Landroid/view/View$OnClickListener;)V

    const p1, 0x7f090108

    .line 40
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninLearnMoreActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    .line 42
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninLearnMoreActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;

    new-instance v2, Lcom/sonymobile/scan3d/storageservice/authentication/-$$Lambda$SigninLearnMoreActivity$Ne77jEyDtd8jmPByDRaVlWF_Ze4;

    invoke-direct {v2, p0}, Lcom/sonymobile/scan3d/storageservice/authentication/-$$Lambda$SigninLearnMoreActivity$Ne77jEyDtd8jmPByDRaVlWF_Ze4;-><init>(Lcom/sonymobile/scan3d/storageservice/authentication/SigninLearnMoreActivity;)V

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const v2, 0x7f1002b8

    invoke-static {v0, v2, v1}, Lcom/sonymobile/scan3d/utils/LinkUtil;->createClickableLink(Landroid/content/Context;I[Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;)Landroid/text/SpannableStringBuilder;

    move-result-object v0

    .line 54
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    return-void
.end method
