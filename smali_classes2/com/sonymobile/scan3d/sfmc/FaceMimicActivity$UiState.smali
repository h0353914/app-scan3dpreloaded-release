.class final enum Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;
.super Ljava/lang/Enum;
.source "FaceMimicActivity.java"


# annotations
.annotation build Landroidx/annotation/VisibleForTesting;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "UiState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

.field public static final enum IDLE:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

.field public static final enum LOADING_MODEL:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

.field public static final enum PICKING_MODEL:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

.field public static final enum PREPARING_TO_RECORD:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

.field public static final enum RECORDING:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

.field public static final enum TAKING_PICTURE:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 313
    new-instance v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    const-string v1, "IDLE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;->IDLE:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    .line 318
    new-instance v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    const-string v1, "PREPARING_TO_RECORD"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;->PREPARING_TO_RECORD:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    .line 323
    new-instance v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    const-string v1, "RECORDING"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;->RECORDING:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    .line 328
    new-instance v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    const-string v1, "TAKING_PICTURE"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;->TAKING_PICTURE:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    .line 333
    new-instance v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    const-string v1, "PICKING_MODEL"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v6}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;->PICKING_MODEL:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    .line 338
    new-instance v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    const-string v1, "LOADING_MODEL"

    const/4 v7, 0x5

    invoke-direct {v0, v1, v7}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;->LOADING_MODEL:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    const/4 v0, 0x6

    .line 307
    new-array v0, v0, [Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    sget-object v1, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;->IDLE:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;->PREPARING_TO_RECORD:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    aput-object v1, v0, v3

    sget-object v1, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;->RECORDING:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    aput-object v1, v0, v4

    sget-object v1, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;->TAKING_PICTURE:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    aput-object v1, v0, v5

    sget-object v1, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;->PICKING_MODEL:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    aput-object v1, v0, v6

    sget-object v1, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;->LOADING_MODEL:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    aput-object v1, v0, v7

    sput-object v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;->$VALUES:[Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 308
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;
    .locals 1

    .line 307
    const-class v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;
    .locals 1

    .line 307
    sget-object v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;->$VALUES:[Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    return-object v0
.end method
