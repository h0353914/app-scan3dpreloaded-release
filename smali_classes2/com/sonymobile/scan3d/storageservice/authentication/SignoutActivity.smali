.class public Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity;
.super Lcom/sonymobile/scan3d/storageservice/authentication/AuthActivity;
.source "SignoutActivity.java"

# interfaces
.implements Lcom/google/android/gms/tasks/OnCompleteListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity$SignoutTask;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/sonymobile/scan3d/storageservice/authentication/AuthActivity;",
        "Lcom/google/android/gms/tasks/OnCompleteListener<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# static fields
.field private static final SELECTION:Ljava/lang/String; = "sync_state=? OR sync_state=? OR sync_state=? OR sync_state=? OR sync_state=? OR sync_state=?"

.field private static final SELECTION_ARGS:[Ljava/lang/String;

.field private static final TAG:Ljava/lang/String; = "com.sonymobile.scan3d.storageservice.authentication.SignoutActivity"


# instance fields
.field private mSignoutTask:Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity$SignoutTask;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    const/4 v0, 0x6

    .line 61
    new-array v1, v0, [Ljava/lang/String;

    const/4 v2, 0x7

    .line 62
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    .line 63
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x1

    aput-object v0, v1, v2

    const/4 v0, 0x4

    .line 64
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x2

    aput-object v3, v1, v4

    const/4 v3, 0x3

    .line 65
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v1, v3

    .line 66
    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v0

    .line 67
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x5

    aput-object v0, v1, v2

    sput-object v1, Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity;->SELECTION_ARGS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x1

    .line 139
    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/storageservice/authentication/AuthActivity;-><init>(Z)V

    return-void
.end method

.method static synthetic access$000()[Ljava/lang/String;
    .locals 1

    .line 40
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity;->SELECTION_ARGS:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity;Z)V
    .locals 0

    .line 40
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity;->finish(Z)V

    return-void
.end method

.method private finish(Z)V
    .locals 3

    if-eqz p1, :cond_0

    .line 187
    sget-object v0, Lcom/sonymobile/scan3d/analytics/HitEvent;->USER_SIGNED_OUT:Lcom/sonymobile/scan3d/analytics/HitEvent;

    const-wide/16 v1, 0x1

    invoke-virtual {v0, p0, v1, v2}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;J)V

    :cond_0
    const v0, 0x7f100328

    const/4 v1, 0x0

    .line 189
    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    const/4 v0, 0x0

    .line 190
    invoke-virtual {p0, p1, v0}, Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity;->onResultReceived(ZLandroid/os/Bundle;)V

    return-void
.end method

.method private signOut()V
    .locals 1

    .line 197
    invoke-static {}, Landroid/app/ActivityManager;->isUserAMonkey()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 199
    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity;->finish(Z)V

    return-void

    .line 203
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity;->getGoogleSignInClient()Lcom/google/android/gms/auth/api/signin/GoogleSignInClient;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/auth/api/signin/GoogleSignInClient;->signOut()Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    .line 204
    invoke-virtual {v0, p0}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method


# virtual methods
.method public bridge synthetic onBackPressed()V
    .locals 0

    .line 40
    invoke-super {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/AuthActivity;->onBackPressed()V

    return-void
.end method

.method public onComplete(Lcom/google/android/gms/tasks/Task;)V
    .locals 1
    .param p1    # Lcom/google/android/gms/tasks/Task;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 174
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity;->TAG:Ljava/lang/String;

    const-string v0, "Sign out of google completed."

    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 175
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/content/Jobs;->cancelAllJobs(Landroid/content/Context;)V

    .line 176
    new-instance p1, Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity$SignoutTask;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity$SignoutTask;-><init>(Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity;Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity$1;)V

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity;->mSignoutTask:Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity$SignoutTask;

    .line 177
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity;->mSignoutTask:Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity$SignoutTask;

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Void;

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity$SignoutTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 144
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/AuthActivity;->onCreate(Landroid/os/Bundle;)V

    if-nez p1, :cond_0

    .line 147
    sget-object p1, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->AUTH_SCREEN:Lcom/sonymobile/scan3d/analytics/ScreenEvent;

    invoke-virtual {p1, p0}, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->send(Landroid/content/Context;)V

    :cond_0
    return-void
.end method

.method protected onPause()V
    .locals 2

    .line 164
    invoke-super {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/AuthActivity;->onPause()V

    .line 166
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity;->mSignoutTask:Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity$SignoutTask;

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    .line 167
    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity$SignoutTask;->cancel(Z)Z

    const/4 v0, 0x0

    .line 168
    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity;->mSignoutTask:Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity$SignoutTask;

    :cond_0
    return-void
.end method

.method protected onResume()V
    .locals 1

    .line 153
    invoke-super {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/AuthActivity;->onResume()V

    .line 155
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity;->isSignedin()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 156
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity;->signOut()V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 158
    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity;->finish(Z)V

    :goto_0
    return-void
.end method
