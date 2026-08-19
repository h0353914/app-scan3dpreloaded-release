.class Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment$GetAuthTask;
.super Landroid/os/AsyncTask;
.source "WebViewerAuthenticationFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GetAuthTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;


# direct methods
.method private constructor <init>(Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;)V
    .locals 0

    .line 184
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment$GetAuthTask;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment$1;)V
    .locals 0

    .line 184
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment$GetAuthTask;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 184
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment$GetAuthTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/String;
    .locals 1

    .line 187
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment$GetAuthTask;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->getAuthenticationToken(Landroid/content/Context;Z)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 184
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment$GetAuthTask;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .locals 2

    if-nez p1, :cond_0

    .line 192
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment$GetAuthTask;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->getLaunchIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    const/16 v1, 0x3e8

    invoke-virtual {p1, v0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0

    .line 194
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment$GetAuthTask;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;

    new-instance v1, Lcom/sonymobile/scan3d/storageservice/network/Credentials;

    invoke-direct {v1, p1}, Lcom/sonymobile/scan3d/storageservice/network/Credentials;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;->access$100(Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;Lcom/sonymobile/scan3d/storageservice/network/Credentials;)V

    :goto_0
    return-void
.end method
