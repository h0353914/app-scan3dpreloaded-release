.class public Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;
.super Lcom/sonymobile/scan3d/storageservice/ui/upload/ListenableFragment;
.source "WebViewerAuthenticationFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment$GetAuthTask;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/sonymobile/scan3d/storageservice/ui/upload/ListenableFragment<",
        "Lcom/sonymobile/scan3d/storageservice/network/Credentials;",
        ">;"
    }
.end annotation


# static fields
.field private static final KEY_HAS_ERRORS:Ljava/lang/String; = "has_errors"

.field private static final KEY_IS_FINISHED:Ljava/lang/String; = "is_finished"

.field private static final KEY_TOKEN:Ljava/lang/String; = "token"

.field private static final LOG_TAG:Ljava/lang/String; = "com.sonymobile.scan3d.storageservice.ui.upload.webviewer.WebViewerAuthenticationFragment"

.field private static final REQUEST_CODE_SIGNIN:I = 0x3e8


# instance fields
.field private mCredentials:Lcom/sonymobile/scan3d/storageservice/network/Credentials;

.field private mHasErrors:Z

.field private mIsFinished:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 25
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ListenableFragment;-><init>()V

    const/4 v0, 0x0

    .line 55
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;->mIsFinished:Z

    return-void
.end method

.method static synthetic access$100(Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;Lcom/sonymobile/scan3d/storageservice/network/Credentials;)V
    .locals 0

    .line 25
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;->reportResult(Lcom/sonymobile/scan3d/storageservice/network/Credentials;)V

    return-void
.end method

.method public static newInstance(I)Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;
    .locals 2

    .line 74
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;->LOG_TAG:Ljava/lang/String;

    const-string v1, "newInstance(): begin"

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "id"

    .line 78
    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 80
    new-instance p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;

    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;-><init>()V

    .line 81
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;->setArguments(Landroid/os/Bundle;)V

    return-object p0
.end method

.method private reportResult(Lcom/sonymobile/scan3d/storageservice/network/Credentials;)V
    .locals 0

    .line 166
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;->mCredentials:Lcom/sonymobile/scan3d/storageservice/network/Credentials;

    .line 168
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;->isResumed()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 170
    iget-boolean p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;->mHasErrors:Z

    if-eqz p1, :cond_0

    const p1, 0x7f10033f

    .line 171
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;->onFailure(I)V

    goto :goto_0

    .line 172
    :cond_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;->mCredentials:Lcom/sonymobile/scan3d/storageservice/network/Credentials;

    if-eqz p1, :cond_1

    .line 174
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;->onSuccess(Ljava/lang/Object;)V

    goto :goto_0

    .line 177
    :cond_1
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;->onCancel()V

    goto :goto_0

    :cond_2
    const/4 p1, 0x1

    .line 180
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;->mIsFinished:Z

    :goto_0
    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1

    .line 88
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ListenableFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 90
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;->mCredentials:Lcom/sonymobile/scan3d/storageservice/network/Credentials;

    if-nez p1, :cond_0

    .line 91
    new-instance p1, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment$GetAuthTask;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment$GetAuthTask;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment$1;)V

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Void;

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment$GetAuthTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0

    .line 93
    :cond_0
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;->reportResult(Lcom/sonymobile/scan3d/storageservice/network/Credentials;)V

    :goto_0
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 2

    .line 107
    invoke-super {p0, p1, p2, p3}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ListenableFragment;->onActivityResult(IILandroid/content/Intent;)V

    const/4 v0, 0x0

    const/16 v1, 0x3e8

    if-ne p1, v1, :cond_2

    const/4 p1, -0x1

    if-eq p2, p1, :cond_0

    goto :goto_0

    :cond_0
    if-eqz p3, :cond_1

    const-string p1, "AUTH_TOKEN"

    .line 113
    invoke-virtual {p3, p1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 115
    new-instance p2, Lcom/sonymobile/scan3d/storageservice/network/Credentials;

    invoke-direct {p2, p1}, Lcom/sonymobile/scan3d/storageservice/network/Credentials;-><init>(Ljava/lang/String;)V

    move-object v0, p2

    goto :goto_0

    :cond_1
    const/4 p1, 0x1

    .line 119
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;->mHasErrors:Z

    .line 128
    :cond_2
    :goto_0
    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;->reportResult(Lcom/sonymobile/scan3d/storageservice/network/Credentials;)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 133
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ListenableFragment;->onCreate(Landroid/os/Bundle;)V

    if-eqz p1, :cond_0

    const-string v0, "is_finished"

    .line 136
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;->mIsFinished:Z

    const-string v0, "has_errors"

    .line 137
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;->mHasErrors:Z

    const-string v0, "token"

    .line 138
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Lcom/sonymobile/scan3d/storageservice/network/Credentials;

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;->mCredentials:Lcom/sonymobile/scan3d/storageservice/network/Credentials;

    :cond_0
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0c00c6

    const/4 v0, 0x0

    .line 102
    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onResume()V
    .locals 1

    .line 144
    invoke-super {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ListenableFragment;->onResume()V

    .line 145
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;->mIsFinished:Z

    if-eqz v0, :cond_0

    .line 147
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;->mCredentials:Lcom/sonymobile/scan3d/storageservice/network/Credentials;

    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;->reportResult(Lcom/sonymobile/scan3d/storageservice/network/Credentials;)V

    :cond_0
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    .line 153
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ListenableFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    const-string v0, "is_finished"

    .line 154
    iget-boolean v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;->mIsFinished:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v0, "has_errors"

    .line 155
    iget-boolean v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;->mHasErrors:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v0, "token"

    .line 156
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;->mCredentials:Lcom/sonymobile/scan3d/storageservice/network/Credentials;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    return-void
.end method
