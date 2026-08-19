.class public Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;
.super Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;
.source "SigninActivity.java"

# interfaces
.implements Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;
.implements Lcom/google/android/gms/tasks/OnSuccessListener;
.implements Lcom/google/android/gms/tasks/OnFailureListener;
.implements Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor$IRestExecutorListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;",
        "Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;",
        "Lcom/google/android/gms/tasks/OnSuccessListener<",
        "Ljava/lang/Boolean;",
        ">;",
        "Lcom/google/android/gms/tasks/OnFailureListener;",
        "Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor$IRestExecutorListener<",
        "Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/AccessToken;",
        ">;"
    }
.end annotation


# static fields
.field private static final REQUEST_CODE_SIGN_IN:I = 0x2328

.field private static final TAG:Ljava/lang/String; = "com.sonymobile.scan3d.storageservice.authentication.SigninActivity"


# instance fields
.field private mAuthCode:Ljava/lang/String;

.field private mDisplayName:Ljava/lang/String;

.field private mEmail:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x1

    .line 77
    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;-><init>(Z)V

    return-void
.end method

.method private disableButton()V
    .locals 2

    const v0, 0x7f0901a6

    .line 285
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    const v0, 0x7f0901a7

    .line 286
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method private enableButton()V
    .locals 2

    const v0, 0x7f0901a7

    .line 293
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x7f0901a6

    .line 294
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    return-void
.end method

.method public static getLaunchIntent(Landroid/content/Context;)Landroid/content/Intent;
    .locals 2

    .line 335
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    return-object v0
.end method

.method private handleGoogleSignInResult(Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;)V
    .locals 3

    .line 263
    invoke-virtual {p1}, Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;->getServerAuthCode()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->mAuthCode:Ljava/lang/String;

    .line 265
    invoke-virtual {p1}, Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;->getEmail()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->mEmail:Ljava/lang/String;

    .line 266
    invoke-virtual {p1}, Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;->getDisplayName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->mDisplayName:Ljava/lang/String;

    .line 267
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "handleGoogleSignInResult code="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->mAuthCode:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", email="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 268
    invoke-virtual {p1}, Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;->getEmail()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 267
    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 275
    invoke-static {p0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/DriveActionsUtil;->getGoogleDrive(Landroid/content/Context;Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;)Lcom/google/api/services/drive/Drive;

    move-result-object p1

    .line 274
    invoke-static {p0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions;->handleDriveKey(Landroid/content/Context;Lcom/google/api/services/drive/Drive;)Lcom/sonymobile/scan3d/storageservice/authentication/DriveAction;

    move-result-object p1

    .line 276
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/authentication/DriveAction;->execute()Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    .line 277
    invoke-virtual {p1, p0, p0}, Lcom/google/android/gms/tasks/Task;->addOnSuccessListener(Landroid/app/Activity;Lcom/google/android/gms/tasks/OnSuccessListener;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    .line 278
    invoke-virtual {p1, p0, p0}, Lcom/google/android/gms/tasks/Task;->addOnFailureListener(Landroid/app/Activity;Lcom/google/android/gms/tasks/OnFailureListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method private handleSignIn(Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/AccessToken;)V
    .locals 5

    const/4 v0, 0x1

    if-eqz p1, :cond_0

    move v1, v0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 213
    :goto_0
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 215
    sget-object v3, Lcom/sonymobile/scan3d/analytics/SignInEvent;->HANDLE_SIGNIN:Lcom/sonymobile/scan3d/analytics/SignInEvent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v3, v4, v1}, Lcom/sonymobile/scan3d/analytics/SignInEvent;->send(Landroid/content/Context;I)V

    if-eqz v1, :cond_1

    .line 218
    sget-object v1, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->TAG:Ljava/lang/String;

    const-string v3, "onExecutionDone(): Got payload"

    invoke-static {v1, v3}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 220
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/AccessToken;->getTokenData()Ljava/lang/String;

    move-result-object v1

    const-string v3, "AUTH_TOKEN"

    .line 221
    invoke-virtual {v2, v3, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 223
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->mEmail:Ljava/lang/String;

    iget-object v3, p0, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->mDisplayName:Ljava/lang/String;

    invoke-static {p0, v1, p1, v3}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->addAccount(Landroid/content/Context;Ljava/lang/String;Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/AccessToken;Ljava/lang/String;)V

    .line 225
    invoke-virtual {p0, v0, v2}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->onResultReceived(ZLandroid/os/Bundle;)V

    goto :goto_1

    .line 227
    :cond_1
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->TAG:Ljava/lang/String;

    const-string v0, "onExecutionDone(): failure to get payload"

    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 228
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;->SIGNIN_TOKEN_FAILED:Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->handleSignInFailure(Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;Ljava/lang/Exception;)V

    :goto_1
    return-void
.end method

.method private handleSignInFailure(Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;Ljava/lang/Exception;)V
    .locals 4
    .param p2    # Ljava/lang/Exception;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 316
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->enableButton()V

    .line 319
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;

    new-instance v2, Lcom/sonymobile/scan3d/storageservice/authentication/-$$Lambda$SigninActivity$XXNbmdYh1aWWDUN78E-FHE9FjtA;

    invoke-direct {v2, p0}, Lcom/sonymobile/scan3d/storageservice/authentication/-$$Lambda$SigninActivity$XXNbmdYh1aWWDUN78E-FHE9FjtA;-><init>(Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;)V

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const v2, 0x7f1002b2

    invoke-static {v0, v2, v1}, Lcom/sonymobile/scan3d/utils/LinkUtil;->createClickableLink(Landroid/content/Context;I[Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;)Landroid/text/SpannableStringBuilder;

    move-result-object v0

    const v1, 0x7f0901c3

    .line 324
    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 325
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 326
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 327
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 328
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->getGoogleSignInClient()Lcom/google/android/gms/auth/api/signin/GoogleSignInClient;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/auth/api/signin/GoogleSignInClient;->signOut()Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/authentication/-$$Lambda$SigninActivity$iFGwbnWeLqJKJn81YnJfXMODj14;->INSTANCE:Lcom/sonymobile/scan3d/storageservice/authentication/-$$Lambda$SigninActivity$iFGwbnWeLqJKJn81YnJfXMODj14;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    .line 331
    sget-object v0, Lcom/sonymobile/scan3d/analytics/SignInEvent;->HANDLE_SIGNIN_FAILURE:Lcom/sonymobile/scan3d/analytics/SignInEvent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;->ordinal()I

    move-result p1

    if-nez p2, :cond_0

    const/4 p2, 0x0

    goto :goto_0

    :cond_0
    invoke-static {p2}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p2

    :goto_0
    invoke-virtual {v0, v1, p1, p2}, Lcom/sonymobile/scan3d/analytics/SignInEvent;->send(Landroid/content/Context;ILjava/lang/String;)V

    return-void
.end method

.method public static synthetic lambda$handleSignInFailure$0(Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;Landroid/view/View;)V
    .locals 0

    .line 322
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninLearnMoreActivity;->getLaunchIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method static synthetic lambda$handleSignInFailure$1(Lcom/google/android/gms/tasks/Task;)V
    .locals 1

    .line 329
    sget-object p0, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->TAG:Ljava/lang/String;

    const-string v0, "Successfully signed out."

    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private signIn()V
    .locals 4

    .line 236
    sget-object v0, Lcom/sonymobile/scan3d/analytics/SignInEvent;->STARTING_SIGNIN:Lcom/sonymobile/scan3d/analytics/SignInEvent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/analytics/SignInEvent;->send(Landroid/content/Context;)V

    .line 238
    invoke-static {}, Lcom/google/android/gms/common/GoogleApiAvailability;->getInstance()Lcom/google/android/gms/common/GoogleApiAvailability;

    move-result-object v0

    .line 240
    invoke-virtual {v0, p0}, Lcom/google/android/gms/common/GoogleApiAvailability;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v1

    .line 242
    sget-object v2, Lcom/sonymobile/scan3d/analytics/SignInEvent;->GOOGLE_PLAY_SERVICE_AVAILABILITY:Lcom/sonymobile/scan3d/analytics/SignInEvent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Lcom/sonymobile/scan3d/analytics/SignInEvent;->send(Landroid/content/Context;I)V

    if-nez v1, :cond_0

    .line 246
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->disableButton()V

    .line 248
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->getGoogleSignInClient()Lcom/google/android/gms/auth/api/signin/GoogleSignInClient;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/auth/api/signin/GoogleSignInClient;->getSignInIntent()Landroid/content/Intent;

    move-result-object v0

    const/16 v1, 0x2328

    .line 249
    invoke-virtual {p0, v0, v1}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    .line 253
    invoke-virtual {v0, p0, v1, v2}, Lcom/google/android/gms/common/GoogleApiAvailability;->showErrorDialogFragment(Landroid/app/Activity;II)Z

    :goto_0
    return-void
.end method


# virtual methods
.method public doClick(Landroid/view/View;)V
    .locals 1

    .line 154
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v0, 0x7f090076

    if-eq p1, v0, :cond_1

    const v0, 0x7f0901a6

    if-eq p1, v0, :cond_0

    goto :goto_0

    .line 156
    :cond_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->signIn()V

    goto :goto_0

    .line 159
    :cond_1
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->finish()V

    :goto_0
    return-void
.end method

.method public getLayoutResource()I
    .locals 1

    const v0, 0x7f0c00b4

    return v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 115
    invoke-super {p0, p1, p2, p3}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;->onActivityResult(IILandroid/content/Intent;)V

    const/16 v0, 0x2328

    if-ne p1, v0, :cond_1

    .line 117
    sget-object p1, Lcom/sonymobile/scan3d/analytics/SignInEvent;->SIGNIN_ACTIVITY_ACCOUNT:Lcom/sonymobile/scan3d/analytics/SignInEvent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1, v0, p2}, Lcom/sonymobile/scan3d/analytics/SignInEvent;->send(Landroid/content/Context;I)V

    packed-switch p2, :pswitch_data_0

    goto :goto_0

    .line 131
    :pswitch_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->enableButton()V

    .line 132
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;->isInternetConnectionAvailable(Landroid/content/Context;)Z

    move-result p1

    if-nez p1, :cond_0

    const p1, 0x7f0901c3

    .line 133
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    const p2, 0x7f100182

    .line 134
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    const/4 p2, 0x0

    .line 135
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    .line 137
    :cond_0
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;->SIGNIN_CANCELLED:Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;

    const/4 p2, 0x0

    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->handleSignInFailure(Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;Ljava/lang/Exception;)V

    goto :goto_0

    .line 121
    :pswitch_1
    invoke-static {p3}, Lcom/google/android/gms/auth/api/signin/GoogleSignIn;->getSignedInAccountFromIntent(Landroid/content/Intent;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    .line 124
    :try_start_0
    const-class p2, Lcom/google/android/gms/common/api/ApiException;

    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/Task;->getResult(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;

    .line 125
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->handleGoogleSignInResult(Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;)V
    :try_end_0
    .catch Lcom/google/android/gms/common/api/ApiException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 127
    sget-object p2, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;->API_EXCEPTION:Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;

    invoke-direct {p0, p2, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->handleSignInFailure(Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;Ljava/lang/Exception;)V

    :cond_1
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 82
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;->onCreate(Landroid/os/Bundle;)V

    const/16 v0, 0xe

    .line 83
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->setRequestedOrientation(I)V

    .line 85
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->isSignedIn(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_1

    const v0, 0x7f090076

    .line 86
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 87
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/Config;->isSigninMandatory(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/16 v1, 0x8

    .line 89
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_0

    .line 91
    :cond_0
    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :goto_0
    const v0, 0x7f0901a6

    .line 95
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    if-nez p1, :cond_2

    .line 99
    sget-object p1, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->AUTH_SCREEN:Lcom/sonymobile/scan3d/analytics/ScreenEvent;

    invoke-virtual {p1, p0}, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->send(Landroid/content/Context;)V

    goto :goto_1

    .line 103
    :cond_1
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->finish()V

    :cond_2
    :goto_1
    return-void
.end method

.method public onExecutionCancelled(Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor<",
            "Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/AccessToken;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 178
    invoke-virtual {p0, p1, v0}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->onExecutionDone(Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/AccessToken;)V

    return-void
.end method

.method public onExecutionDone(Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/AccessToken;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor<",
            "Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/AccessToken;",
            ">;",
            "Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/AccessToken;",
            ")V"
        }
    .end annotation

    .line 173
    invoke-direct {p0, p2}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->handleSignIn(Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/AccessToken;)V

    return-void
.end method

.method public bridge synthetic onExecutionDone(Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;Ljava/lang/Object;)V
    .locals 0

    .line 45
    check-cast p2, Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/AccessToken;

    invoke-virtual {p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->onExecutionDone(Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/AccessToken;)V

    return-void
.end method

.method public onExecutionProgress(Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;Lcom/sonymobile/scan3d/storageservice/network/TransferProgress;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor<",
            "Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/AccessToken;",
            ">;",
            "Lcom/sonymobile/scan3d/storageservice/network/TransferProgress;",
            ")V"
        }
    .end annotation

    return-void
.end method

.method public onFailure(Ljava/lang/Exception;)V
    .locals 2
    .param p1    # Ljava/lang/Exception;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 189
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->TAG:Ljava/lang/String;

    const-string v1, "onFailure(): "

    invoke-static {v0, v1, p1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 190
    sget-object v0, Lcom/sonymobile/scan3d/analytics/SignInEvent;->HANDLE_GOOGLE_SIGNIN_RESULT_LISTENER_ON_FAILURE:Lcom/sonymobile/scan3d/analytics/SignInEvent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/analytics/SignInEvent;->send(Landroid/content/Context;)V

    .line 191
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;->ACTIVITY_ON_FAILURE:Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;

    invoke-direct {p0, v0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->handleSignInFailure(Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;Ljava/lang/Exception;)V

    return-void
.end method

.method public onPreExecution(Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor<",
            "Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/AccessToken;",
            ">;)V"
        }
    .end annotation

    return-void
.end method

.method protected onStop()V
    .locals 0

    .line 109
    invoke-super {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;->onStop()V

    .line 110
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->enableButton()V

    return-void
.end method

.method public onSuccess(Ljava/lang/Boolean;)V
    .locals 3

    .line 196
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onSuccess(): result "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 197
    sget-object v0, Lcom/sonymobile/scan3d/analytics/SignInEvent;->HANDLE_GOOGLE_SIGNIN_RESULT_LISTENER_ON_SUCCESS:Lcom/sonymobile/scan3d/analytics/SignInEvent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/sonymobile/scan3d/analytics/SignInEvent;->send(Landroid/content/Context;I)V

    .line 199
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 200
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->mAuthCode:Ljava/lang/String;

    invoke-static {p0, p1}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi;->getAuthToken(Landroid/content/Context;Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;

    move-result-object p1

    invoke-interface {p1, p0}, Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;->executeAsync(Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor$IRestExecutorListener;)Lcom/sonymobile/scan3d/storageservice/Cancellable;

    goto :goto_0

    .line 202
    :cond_0
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;->ACTIVITY_ON_SUCCESS_BAD_RESULT:Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->handleSignInFailure(Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method public bridge synthetic onSuccess(Ljava/lang/Object;)V
    .locals 0

    .line 45
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;->onSuccess(Ljava/lang/Boolean;)V

    return-void
.end method
