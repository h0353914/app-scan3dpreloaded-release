.class public final enum Lcom/sonymobile/scan3d/analytics/SignInEvent;
.super Ljava/lang/Enum;
.source "SignInEvent.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/analytics/SignInEvent;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/analytics/SignInEvent;

.field public static final enum GOOGLE_PLAY_SERVICE_AVAILABILITY:Lcom/sonymobile/scan3d/analytics/SignInEvent;

.field public static final enum HANDLE_GOOGLE_SIGNIN_RESULT_LISTENER_ON_FAILURE:Lcom/sonymobile/scan3d/analytics/SignInEvent;

.field public static final enum HANDLE_GOOGLE_SIGNIN_RESULT_LISTENER_ON_SUCCESS:Lcom/sonymobile/scan3d/analytics/SignInEvent;

.field public static final enum HANDLE_SIGNIN:Lcom/sonymobile/scan3d/analytics/SignInEvent;

.field public static final enum HANDLE_SIGNIN_FAILURE:Lcom/sonymobile/scan3d/analytics/SignInEvent;

.field public static final enum KEY_CHECK_EXECUTION:Lcom/sonymobile/scan3d/analytics/SignInEvent;

.field public static final enum SIGNIN_ACTIVITY_ACCOUNT:Lcom/sonymobile/scan3d/analytics/SignInEvent;

.field public static final enum STARTING_SIGNIN:Lcom/sonymobile/scan3d/analytics/SignInEvent;

.field public static final enum SYNC_HUB_EXECUTION:Lcom/sonymobile/scan3d/analytics/SignInEvent;

.field private static sSignInSessionId:I


# instance fields
.field private final mActionName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .line 19
    new-instance v0, Lcom/sonymobile/scan3d/analytics/SignInEvent;

    const-string v1, "STARTING_SIGNIN"

    const-string v2, "GoogleSignInStarted"

    const/4 v3, 0x0

    invoke-direct {v0, v1, v3, v2}, Lcom/sonymobile/scan3d/analytics/SignInEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/SignInEvent;->STARTING_SIGNIN:Lcom/sonymobile/scan3d/analytics/SignInEvent;

    .line 24
    new-instance v0, Lcom/sonymobile/scan3d/analytics/SignInEvent;

    const-string v1, "GOOGLE_PLAY_SERVICE_AVAILABILITY"

    const-string v2, "GooglePlayServiceAvailability"

    const/4 v4, 0x1

    invoke-direct {v0, v1, v4, v2}, Lcom/sonymobile/scan3d/analytics/SignInEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/SignInEvent;->GOOGLE_PLAY_SERVICE_AVAILABILITY:Lcom/sonymobile/scan3d/analytics/SignInEvent;

    .line 29
    new-instance v0, Lcom/sonymobile/scan3d/analytics/SignInEvent;

    const-string v1, "SIGNIN_ACTIVITY_ACCOUNT"

    const-string v2, "SignInActivityAccount"

    const/4 v5, 0x2

    invoke-direct {v0, v1, v5, v2}, Lcom/sonymobile/scan3d/analytics/SignInEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/SignInEvent;->SIGNIN_ACTIVITY_ACCOUNT:Lcom/sonymobile/scan3d/analytics/SignInEvent;

    .line 35
    new-instance v0, Lcom/sonymobile/scan3d/analytics/SignInEvent;

    const-string v1, "HANDLE_GOOGLE_SIGNIN_RESULT_LISTENER_ON_SUCCESS"

    const-string v2, "HandleGoogleSignInResultListenerOnSuccess"

    const/4 v6, 0x3

    invoke-direct {v0, v1, v6, v2}, Lcom/sonymobile/scan3d/analytics/SignInEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/SignInEvent;->HANDLE_GOOGLE_SIGNIN_RESULT_LISTENER_ON_SUCCESS:Lcom/sonymobile/scan3d/analytics/SignInEvent;

    .line 41
    new-instance v0, Lcom/sonymobile/scan3d/analytics/SignInEvent;

    const-string v1, "HANDLE_GOOGLE_SIGNIN_RESULT_LISTENER_ON_FAILURE"

    const-string v2, "HandleGoogleSignInResultListenerOnFailure"

    const/4 v7, 0x4

    invoke-direct {v0, v1, v7, v2}, Lcom/sonymobile/scan3d/analytics/SignInEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/SignInEvent;->HANDLE_GOOGLE_SIGNIN_RESULT_LISTENER_ON_FAILURE:Lcom/sonymobile/scan3d/analytics/SignInEvent;

    .line 46
    new-instance v0, Lcom/sonymobile/scan3d/analytics/SignInEvent;

    const-string v1, "HANDLE_SIGNIN"

    const-string v2, "HandleSignIn"

    const/4 v8, 0x5

    invoke-direct {v0, v1, v8, v2}, Lcom/sonymobile/scan3d/analytics/SignInEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/SignInEvent;->HANDLE_SIGNIN:Lcom/sonymobile/scan3d/analytics/SignInEvent;

    .line 51
    new-instance v0, Lcom/sonymobile/scan3d/analytics/SignInEvent;

    const-string v1, "HANDLE_SIGNIN_FAILURE"

    const-string v2, "HandleSignInFailure"

    const/4 v9, 0x6

    invoke-direct {v0, v1, v9, v2}, Lcom/sonymobile/scan3d/analytics/SignInEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/SignInEvent;->HANDLE_SIGNIN_FAILURE:Lcom/sonymobile/scan3d/analytics/SignInEvent;

    .line 57
    new-instance v0, Lcom/sonymobile/scan3d/analytics/SignInEvent;

    const-string v1, "KEY_CHECK_EXECUTION"

    const-string v2, "KeyCheckExecution"

    const/4 v10, 0x7

    invoke-direct {v0, v1, v10, v2}, Lcom/sonymobile/scan3d/analytics/SignInEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/SignInEvent;->KEY_CHECK_EXECUTION:Lcom/sonymobile/scan3d/analytics/SignInEvent;

    .line 63
    new-instance v0, Lcom/sonymobile/scan3d/analytics/SignInEvent;

    const-string v1, "SYNC_HUB_EXECUTION"

    const-string v2, "SyncHubApiExecution"

    const/16 v11, 0x8

    invoke-direct {v0, v1, v11, v2}, Lcom/sonymobile/scan3d/analytics/SignInEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/SignInEvent;->SYNC_HUB_EXECUTION:Lcom/sonymobile/scan3d/analytics/SignInEvent;

    const/16 v0, 0x9

    .line 15
    new-array v0, v0, [Lcom/sonymobile/scan3d/analytics/SignInEvent;

    sget-object v1, Lcom/sonymobile/scan3d/analytics/SignInEvent;->STARTING_SIGNIN:Lcom/sonymobile/scan3d/analytics/SignInEvent;

    aput-object v1, v0, v3

    sget-object v1, Lcom/sonymobile/scan3d/analytics/SignInEvent;->GOOGLE_PLAY_SERVICE_AVAILABILITY:Lcom/sonymobile/scan3d/analytics/SignInEvent;

    aput-object v1, v0, v4

    sget-object v1, Lcom/sonymobile/scan3d/analytics/SignInEvent;->SIGNIN_ACTIVITY_ACCOUNT:Lcom/sonymobile/scan3d/analytics/SignInEvent;

    aput-object v1, v0, v5

    sget-object v1, Lcom/sonymobile/scan3d/analytics/SignInEvent;->HANDLE_GOOGLE_SIGNIN_RESULT_LISTENER_ON_SUCCESS:Lcom/sonymobile/scan3d/analytics/SignInEvent;

    aput-object v1, v0, v6

    sget-object v1, Lcom/sonymobile/scan3d/analytics/SignInEvent;->HANDLE_GOOGLE_SIGNIN_RESULT_LISTENER_ON_FAILURE:Lcom/sonymobile/scan3d/analytics/SignInEvent;

    aput-object v1, v0, v7

    sget-object v1, Lcom/sonymobile/scan3d/analytics/SignInEvent;->HANDLE_SIGNIN:Lcom/sonymobile/scan3d/analytics/SignInEvent;

    aput-object v1, v0, v8

    sget-object v1, Lcom/sonymobile/scan3d/analytics/SignInEvent;->HANDLE_SIGNIN_FAILURE:Lcom/sonymobile/scan3d/analytics/SignInEvent;

    aput-object v1, v0, v9

    sget-object v1, Lcom/sonymobile/scan3d/analytics/SignInEvent;->KEY_CHECK_EXECUTION:Lcom/sonymobile/scan3d/analytics/SignInEvent;

    aput-object v1, v0, v10

    sget-object v1, Lcom/sonymobile/scan3d/analytics/SignInEvent;->SYNC_HUB_EXECUTION:Lcom/sonymobile/scan3d/analytics/SignInEvent;

    aput-object v1, v0, v11

    sput-object v0, Lcom/sonymobile/scan3d/analytics/SignInEvent;->$VALUES:[Lcom/sonymobile/scan3d/analytics/SignInEvent;

    .line 83
    sput v3, Lcom/sonymobile/scan3d/analytics/SignInEvent;->sSignInSessionId:I

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 95
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 96
    iput-object p3, p0, Lcom/sonymobile/scan3d/analytics/SignInEvent;->mActionName:Ljava/lang/String;

    return-void
.end method

.method private static setSessionId(I)V
    .locals 0

    .line 100
    sput p0, Lcom/sonymobile/scan3d/analytics/SignInEvent;->sSignInSessionId:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/analytics/SignInEvent;
    .locals 1

    .line 15
    const-class v0, Lcom/sonymobile/scan3d/analytics/SignInEvent;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/analytics/SignInEvent;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/analytics/SignInEvent;
    .locals 1

    .line 15
    sget-object v0, Lcom/sonymobile/scan3d/analytics/SignInEvent;->$VALUES:[Lcom/sonymobile/scan3d/analytics/SignInEvent;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/analytics/SignInEvent;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/analytics/SignInEvent;

    return-object v0
.end method


# virtual methods
.method public send(Landroid/content/Context;)V
    .locals 2

    const-string v0, "GoogleSignInStarted"

    .line 109
    iget-object v1, p0, Lcom/sonymobile/scan3d/analytics/SignInEvent;->mActionName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 110
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->generateSignInSessionID(Landroid/content/Context;)I

    move-result v0

    invoke-static {v0}, Lcom/sonymobile/scan3d/analytics/SignInEvent;->setSessionId(I)V

    .line 113
    :cond_0
    invoke-static {p1}, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->getInstance(Landroid/content/Context;)Lcom/sonymobile/scan3d/analytics/SBDPUtil;

    move-result-object p1

    iget-object v0, p0, Lcom/sonymobile/scan3d/analytics/SignInEvent;->mActionName:Ljava/lang/String;

    sget v1, Lcom/sonymobile/scan3d/analytics/SignInEvent;->sSignInSessionId:I

    invoke-virtual {p1, v0, v1}, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->pushSignInEvent(Ljava/lang/String;I)V

    return-void
.end method

.method public send(Landroid/content/Context;I)V
    .locals 1

    const/4 v0, 0x0

    .line 123
    invoke-virtual {p0, p1, p2, v0}, Lcom/sonymobile/scan3d/analytics/SignInEvent;->send(Landroid/content/Context;ILjava/lang/String;)V

    return-void
.end method

.method public send(Landroid/content/Context;ILjava/lang/String;)V
    .locals 2
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const-string v0, "GoogleSignInStarted"

    .line 134
    iget-object v1, p0, Lcom/sonymobile/scan3d/analytics/SignInEvent;->mActionName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 135
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->generateSignInSessionID(Landroid/content/Context;)I

    move-result v0

    invoke-static {v0}, Lcom/sonymobile/scan3d/analytics/SignInEvent;->setSessionId(I)V

    .line 138
    :cond_0
    invoke-static {p1}, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->getInstance(Landroid/content/Context;)Lcom/sonymobile/scan3d/analytics/SBDPUtil;

    move-result-object p1

    iget-object v0, p0, Lcom/sonymobile/scan3d/analytics/SignInEvent;->mActionName:Ljava/lang/String;

    sget v1, Lcom/sonymobile/scan3d/analytics/SignInEvent;->sSignInSessionId:I

    invoke-virtual {p1, v0, v1, p2, p3}, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->pushSignInEvent(Ljava/lang/String;IILjava/lang/String;)V

    return-void
.end method
