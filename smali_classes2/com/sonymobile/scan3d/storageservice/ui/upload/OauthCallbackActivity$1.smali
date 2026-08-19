.class Lcom/sonymobile/scan3d/storageservice/ui/upload/OauthCallbackActivity$1;
.super Landroidx/browser/customtabs/CustomTabsServiceConnection;
.source "OauthCallbackActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonymobile/scan3d/storageservice/ui/upload/OauthCallbackActivity;->onResume()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/storageservice/ui/upload/OauthCallbackActivity;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/storageservice/ui/upload/OauthCallbackActivity;)V
    .locals 0

    .line 32
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/OauthCallbackActivity$1;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/upload/OauthCallbackActivity;

    invoke-direct {p0}, Landroidx/browser/customtabs/CustomTabsServiceConnection;-><init>()V

    return-void
.end method


# virtual methods
.method public onCustomTabsServiceConnected(Landroid/content/ComponentName;Landroidx/browser/customtabs/CustomTabsClient;)V
    .locals 3

    .line 36
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/OauthCallbackActivity$1;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/upload/OauthCallbackActivity;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/OauthCallbackActivity;->access$002(Lcom/sonymobile/scan3d/storageservice/ui/upload/OauthCallbackActivity;Z)Z

    const-wide/16 v1, 0x0

    .line 37
    invoke-virtual {p2, v1, v2}, Landroidx/browser/customtabs/CustomTabsClient;->warmup(J)Z

    const/4 p1, 0x0

    .line 38
    invoke-virtual {p2, p1}, Landroidx/browser/customtabs/CustomTabsClient;->newSession(Landroidx/browser/customtabs/CustomTabsCallback;)Landroidx/browser/customtabs/CustomTabsSession;

    move-result-object p1

    .line 39
    new-instance p2, Landroidx/browser/customtabs/CustomTabsIntent$Builder;

    invoke-direct {p2, p1}, Landroidx/browser/customtabs/CustomTabsIntent$Builder;-><init>(Landroidx/browser/customtabs/CustomTabsSession;)V

    .line 40
    invoke-virtual {p2, v0}, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->setShowTitle(Z)Landroidx/browser/customtabs/CustomTabsIntent$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->build()Landroidx/browser/customtabs/CustomTabsIntent;

    move-result-object p1

    .line 42
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/OauthCallbackActivity$1;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/upload/OauthCallbackActivity;

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/OauthCallbackActivity;->getIntent()Landroid/content/Intent;

    move-result-object p2

    const-string v0, "url"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    .line 43
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/OauthCallbackActivity$1;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/upload/OauthCallbackActivity;

    invoke-virtual {p1, v0, p2}, Landroidx/browser/customtabs/CustomTabsIntent;->launchUrl(Landroid/content/Context;Landroid/net/Uri;)V

    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 1

    .line 48
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/OauthCallbackActivity$1;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/upload/OauthCallbackActivity;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/OauthCallbackActivity;->access$002(Lcom/sonymobile/scan3d/storageservice/ui/upload/OauthCallbackActivity;Z)Z

    return-void
.end method
