.class public final enum Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;
.super Ljava/lang/Enum;
.source "SignInEvent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/analytics/SignInEvent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "KeyCheckExecutionType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;

.field public static final enum DRIVE_KEY_DOES_NOT_EXIST_AFTER_UPLOAD:Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;

.field public static final enum DRIVE_KEY_EXISTS:Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;

.field public static final enum DRIVE_KEY_EXIST_AFTER_UPLOAD:Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;

.field public static final enum HAS_METADATA:Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;

.field public static final enum HAS_NO_METADATA:Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;

.field public static final enum TRY_START_UPLOAD:Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;

.field public static final enum UPLOAD_FAILED:Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;

.field public static final enum UPLOAD_SUCCEEDED:Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 70
    new-instance v0, Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;

    const-string v1, "DRIVE_KEY_EXISTS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;->DRIVE_KEY_EXISTS:Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;

    .line 71
    new-instance v0, Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;

    const-string v1, "TRY_START_UPLOAD"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;->TRY_START_UPLOAD:Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;

    .line 72
    new-instance v0, Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;

    const-string v1, "HAS_METADATA"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;->HAS_METADATA:Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;

    .line 73
    new-instance v0, Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;

    const-string v1, "HAS_NO_METADATA"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;->HAS_NO_METADATA:Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;

    .line 74
    new-instance v0, Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;

    const-string v1, "DRIVE_KEY_EXIST_AFTER_UPLOAD"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v6}, Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;->DRIVE_KEY_EXIST_AFTER_UPLOAD:Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;

    .line 75
    new-instance v0, Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;

    const-string v1, "DRIVE_KEY_DOES_NOT_EXIST_AFTER_UPLOAD"

    const/4 v7, 0x5

    invoke-direct {v0, v1, v7}, Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;->DRIVE_KEY_DOES_NOT_EXIST_AFTER_UPLOAD:Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;

    .line 76
    new-instance v0, Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;

    const-string v1, "UPLOAD_FAILED"

    const/4 v8, 0x6

    invoke-direct {v0, v1, v8}, Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;->UPLOAD_FAILED:Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;

    .line 77
    new-instance v0, Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;

    const-string v1, "UPLOAD_SUCCEEDED"

    const/4 v9, 0x7

    invoke-direct {v0, v1, v9}, Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;->UPLOAD_SUCCEEDED:Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;

    const/16 v0, 0x8

    .line 69
    new-array v0, v0, [Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;

    sget-object v1, Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;->DRIVE_KEY_EXISTS:Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;->TRY_START_UPLOAD:Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;->HAS_METADATA:Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;->HAS_NO_METADATA:Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;->DRIVE_KEY_EXIST_AFTER_UPLOAD:Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;

    aput-object v1, v0, v6

    sget-object v1, Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;->DRIVE_KEY_DOES_NOT_EXIST_AFTER_UPLOAD:Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;

    aput-object v1, v0, v7

    sget-object v1, Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;->UPLOAD_FAILED:Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;

    aput-object v1, v0, v8

    sget-object v1, Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;->UPLOAD_SUCCEEDED:Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;

    aput-object v1, v0, v9

    sput-object v0, Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;->$VALUES:[Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 69
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;
    .locals 1

    .line 69
    const-class v0, Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;
    .locals 1

    .line 69
    sget-object v0, Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;->$VALUES:[Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;

    return-object v0
.end method
