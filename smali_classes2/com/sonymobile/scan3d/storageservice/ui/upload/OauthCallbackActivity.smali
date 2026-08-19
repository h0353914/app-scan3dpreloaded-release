.class public Lcom/sonymobile/scan3d/storageservice/ui/upload/OauthCallbackActivity;
.super Landroid/app/Activity;
.source "OauthCallbackActivity.java"


# static fields
.field private static final CUSTOM_TAB_PACKAGE_NAME:Ljava/lang/String; = "com.android.chrome"

.field public static final EXTRA_URL:Ljava/lang/String; = "url"


# instance fields
.field private mBound:Z

.field private mCustomTabsServiceConnection:Landroidx/browser/customtabs/CustomTabsServiceConnection;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method static synthetic access$002(Lcom/sonymobile/scan3d/storageservice/ui/upload/OauthCallbackActivity;Z)Z
    .locals 0

    .line 17
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/OauthCallbackActivity;->mBound:Z

    return p1
.end method


# virtual methods
.method protected onDestroy()V
    .locals 1

    .line 63
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/OauthCallbackActivity;->mBound:Z

    if-eqz v0, :cond_0

    .line 64
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/OauthCallbackActivity;->mCustomTabsServiceConnection:Landroidx/browser/customtabs/CustomTabsServiceConnection;

    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/OauthCallbackActivity;->unbindService(Landroid/content/ServiceConnection;)V

    const/4 v0, 0x0

    .line 65
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/OauthCallbackActivity;->mBound:Z

    .line 67
    :cond_0
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    return-void
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 1

    .line 72
    invoke-super {p0, p1}, Landroid/app/Activity;->onNewIntent(Landroid/content/Intent;)V

    const/4 v0, -0x1

    .line 73
    invoke-virtual {p0, v0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/OauthCallbackActivity;->setResult(ILandroid/content/Intent;)V

    .line 74
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/OauthCallbackActivity;->finish()V

    return-void
.end method

.method protected onResume()V
    .locals 2

    .line 29
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 31
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/OauthCallbackActivity;->mCustomTabsServiceConnection:Landroidx/browser/customtabs/CustomTabsServiceConnection;

    if-nez v0, :cond_0

    .line 32
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/OauthCallbackActivity$1;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/OauthCallbackActivity$1;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/upload/OauthCallbackActivity;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/OauthCallbackActivity;->mCustomTabsServiceConnection:Landroidx/browser/customtabs/CustomTabsServiceConnection;

    const-string v0, "com.android.chrome"

    .line 52
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/OauthCallbackActivity;->mCustomTabsServiceConnection:Landroidx/browser/customtabs/CustomTabsServiceConnection;

    invoke-static {p0, v0, v1}, Landroidx/browser/customtabs/CustomTabsClient;->bindCustomTabsService(Landroid/content/Context;Ljava/lang/String;Landroidx/browser/customtabs/CustomTabsServiceConnection;)Z

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 56
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/OauthCallbackActivity;->setResult(I)V

    .line 57
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/OauthCallbackActivity;->finish()V

    :goto_0
    return-void
.end method
