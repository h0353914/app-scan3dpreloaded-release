.class abstract Lcom/sonymobile/scan3d/storageservice/authentication/AuthActivity;
.super Landroid/app/Activity;
.source "AuthActivity.java"


# instance fields
.field private mClient:Lcom/google/android/gms/auth/api/signin/GoogleSignInClient;

.field private final mGoogleClientRequired:Z


# direct methods
.method public constructor <init>(Z)V
    .locals 0

    .line 45
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 46
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/storageservice/authentication/AuthActivity;->mGoogleClientRequired:Z

    return-void
.end method

.method public static isSignedin(Landroid/content/Context;)Z
    .locals 4

    .line 102
    invoke-static {p0}, Lcom/google/android/gms/auth/api/signin/GoogleSignIn;->getLastSignedInAccount(Landroid/content/Context;)Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;

    move-result-object p0

    .line 103
    new-instance v0, Lcom/google/android/gms/common/api/Scope;

    const-string v1, "https://www.googleapis.com/auth/drive.appdata"

    invoke-direct {v0, v1}, Lcom/google/android/gms/common/api/Scope;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz p0, :cond_0

    .line 104
    new-array v3, v1, [Lcom/google/android/gms/common/api/Scope;

    aput-object v0, v3, v2

    invoke-static {p0, v3}, Lcom/google/android/gms/auth/api/signin/GoogleSignIn;->hasPermissions(Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;[Lcom/google/android/gms/common/api/Scope;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    return v1
.end method


# virtual methods
.method protected getGoogleSignInClient()Lcom/google/android/gms/auth/api/signin/GoogleSignInClient;
    .locals 2

    .line 128
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/AuthActivity;->mGoogleClientRequired:Z

    if-eqz v0, :cond_0

    .line 129
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/AuthActivity;->mClient:Lcom/google/android/gms/auth/api/signin/GoogleSignInClient;

    return-object v0

    .line 131
    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "The activity is not configured to create a client."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected isSignedin()Z
    .locals 1

    .line 92
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/AuthActivity;->isSignedin(Landroid/content/Context;)Z

    move-result v0

    return v0
.end method

.method public onBackPressed()V
    .locals 1

    const/4 v0, 0x0

    .line 82
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/authentication/AuthActivity;->setResult(I)V

    .line 83
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/AuthActivity;->finish()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    .line 51
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 54
    invoke-static {p0}, Lcom/sonymobile/scan3d/Scan3DApp;->isPartOfBetaProgram(Landroid/content/Context;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 55
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/AuthActivity;->finish()V

    return-void

    .line 59
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/AuthActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    const/16 v0, 0x700

    invoke-virtual {p1, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 63
    iget-boolean p1, p0, Lcom/sonymobile/scan3d/storageservice/authentication/AuthActivity;->mGoogleClientRequired:Z

    if-eqz p1, :cond_1

    .line 64
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/Config;->getSynchubServerClientId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    .line 65
    new-instance v0, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$Builder;

    invoke-direct {v0}, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$Builder;-><init>()V

    new-instance v1, Lcom/google/android/gms/common/api/Scope;

    const-string v2, "https://www.googleapis.com/auth/drive.appdata"

    invoke-direct {v1, v2}, Lcom/google/android/gms/common/api/Scope;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x0

    new-array v2, v2, [Lcom/google/android/gms/common/api/Scope;

    .line 66
    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$Builder;->requestScopes(Lcom/google/android/gms/common/api/Scope;[Lcom/google/android/gms/common/api/Scope;)Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$Builder;

    move-result-object v0

    const/4 v1, 0x1

    .line 67
    invoke-virtual {v0, p1, v1}, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$Builder;->requestServerAuthCode(Ljava/lang/String;Z)Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$Builder;

    move-result-object p1

    .line 68
    invoke-virtual {p1}, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$Builder;->requestEmail()Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$Builder;

    move-result-object p1

    .line 69
    invoke-virtual {p1}, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$Builder;->requestId()Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$Builder;

    move-result-object p1

    .line 70
    invoke-virtual {p1}, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$Builder;->requestProfile()Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$Builder;

    move-result-object p1

    .line 71
    invoke-virtual {p1}, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$Builder;->build()Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;

    move-result-object p1

    .line 73
    invoke-static {p0, p1}, Lcom/google/android/gms/auth/api/signin/GoogleSignIn;->getClient(Landroid/app/Activity;Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;)Lcom/google/android/gms/auth/api/signin/GoogleSignInClient;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/authentication/AuthActivity;->mClient:Lcom/google/android/gms/auth/api/signin/GoogleSignInClient;

    :cond_1
    return-void
.end method

.method protected final onResultReceived(ZLandroid/os/Bundle;)V
    .locals 1

    .line 113
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    if-eqz p2, :cond_0

    .line 115
    invoke-virtual {v0, p2}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    :cond_0
    if-eqz p1, :cond_1

    const/4 p1, -0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    .line 117
    :goto_0
    invoke-virtual {p0, p1, v0}, Lcom/sonymobile/scan3d/storageservice/authentication/AuthActivity;->setResult(ILandroid/content/Intent;)V

    .line 118
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/AuthActivity;->finish()V

    return-void
.end method
