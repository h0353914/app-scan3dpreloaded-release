.class public final enum Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;
.super Ljava/lang/Enum;
.source "SphinxCameraTemperatureState.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;

.field public static final enum kHot:Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;

.field public static final enum kNormal:Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;

.field public static final enum kWarm:Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 10
    new-instance v0, Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;

    const-string v1, "kNormal"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;->kNormal:Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;

    .line 11
    new-instance v0, Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;

    const-string v1, "kWarm"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;->kWarm:Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;

    .line 12
    new-instance v0, Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;

    const-string v1, "kHot"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;->kHot:Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;

    const/4 v0, 0x3

    .line 9
    new-array v0, v0, [Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;

    sget-object v1, Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;->kNormal:Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;->kWarm:Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;

    aput-object v1, v0, v3

    sget-object v1, Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;->kHot:Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;

    aput-object v1, v0, v4

    sput-object v0, Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;->$VALUES:[Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 9
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;
    .locals 1

    .line 9
    const-class v0, Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;
    .locals 1

    .line 9
    sget-object v0, Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;->$VALUES:[Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;

    return-object v0
.end method
