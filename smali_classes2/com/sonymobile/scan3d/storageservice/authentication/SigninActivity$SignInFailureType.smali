.class final enum Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;
.super Ljava/lang/Enum;
.source "SigninActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "SignInFailureType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;

.field public static final enum ACTIVITY_ON_FAILURE:Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;

.field public static final enum ACTIVITY_ON_SUCCESS_BAD_RESULT:Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;

.field public static final enum API_EXCEPTION:Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;

.field public static final enum SIGNIN_CANCELLED:Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;

.field public static final enum SIGNIN_TOKEN_FAILED:Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 299
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;

    const-string v1, "API_EXCEPTION"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;->API_EXCEPTION:Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;

    .line 300
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;

    const-string v1, "ACTIVITY_ON_FAILURE"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;->ACTIVITY_ON_FAILURE:Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;

    .line 301
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;

    const-string v1, "ACTIVITY_ON_SUCCESS_BAD_RESULT"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;->ACTIVITY_ON_SUCCESS_BAD_RESULT:Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;

    .line 302
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;

    const-string v1, "SIGNIN_TOKEN_FAILED"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;->SIGNIN_TOKEN_FAILED:Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;

    .line 303
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;

    const-string v1, "SIGNIN_CANCELLED"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v6}, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;->SIGNIN_CANCELLED:Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;

    const/4 v0, 0x5

    .line 298
    new-array v0, v0, [Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;->API_EXCEPTION:Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;->ACTIVITY_ON_FAILURE:Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;->ACTIVITY_ON_SUCCESS_BAD_RESULT:Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;->SIGNIN_TOKEN_FAILED:Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;->SIGNIN_CANCELLED:Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;

    aput-object v1, v0, v6

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;->$VALUES:[Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 298
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;
    .locals 1

    .line 298
    const-class v0, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;
    .locals 1

    .line 298
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;->$VALUES:[Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity$SignInFailureType;

    return-object v0
.end method
