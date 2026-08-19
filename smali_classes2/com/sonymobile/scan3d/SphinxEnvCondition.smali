.class public final enum Lcom/sonymobile/scan3d/SphinxEnvCondition;
.super Ljava/lang/Enum;
.source "SphinxEnvCondition.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/SphinxEnvCondition;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/SphinxEnvCondition;

.field public static final enum kEnvCondBattery:Lcom/sonymobile/scan3d/SphinxEnvCondition;

.field public static final enum kEnvCondCount:Lcom/sonymobile/scan3d/SphinxEnvCondition;

.field public static final enum kEnvCondExposureTime:Lcom/sonymobile/scan3d/SphinxEnvCondition;

.field public static final enum kEnvCondFocusDistance:Lcom/sonymobile/scan3d/SphinxEnvCondition;

.field public static final enum kEnvCondFreeStorageMB:Lcom/sonymobile/scan3d/SphinxEnvCondition;

.field public static final enum kEnvCondIso:Lcom/sonymobile/scan3d/SphinxEnvCondition;

.field public static final enum kEnvCondLight:Lcom/sonymobile/scan3d/SphinxEnvCondition;

.field public static final enum kEnvCondMaxLight:Lcom/sonymobile/scan3d/SphinxEnvCondition;

.field public static final enum kEnvCondMinLight:Lcom/sonymobile/scan3d/SphinxEnvCondition;

.field public static final enum kEnvCondTOFDistance:Lcom/sonymobile/scan3d/SphinxEnvCondition;

.field public static final enum kEnvCondTemp:Lcom/sonymobile/scan3d/SphinxEnvCondition;


# direct methods
.method static constructor <clinit>()V
    .locals 13

    .line 10
    new-instance v0, Lcom/sonymobile/scan3d/SphinxEnvCondition;

    const-string v1, "kEnvCondTemp"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/sonymobile/scan3d/SphinxEnvCondition;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/SphinxEnvCondition;->kEnvCondTemp:Lcom/sonymobile/scan3d/SphinxEnvCondition;

    .line 11
    new-instance v0, Lcom/sonymobile/scan3d/SphinxEnvCondition;

    const-string v1, "kEnvCondLight"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/sonymobile/scan3d/SphinxEnvCondition;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/SphinxEnvCondition;->kEnvCondLight:Lcom/sonymobile/scan3d/SphinxEnvCondition;

    .line 12
    new-instance v0, Lcom/sonymobile/scan3d/SphinxEnvCondition;

    const-string v1, "kEnvCondMinLight"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/sonymobile/scan3d/SphinxEnvCondition;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/SphinxEnvCondition;->kEnvCondMinLight:Lcom/sonymobile/scan3d/SphinxEnvCondition;

    .line 13
    new-instance v0, Lcom/sonymobile/scan3d/SphinxEnvCondition;

    const-string v1, "kEnvCondMaxLight"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lcom/sonymobile/scan3d/SphinxEnvCondition;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/SphinxEnvCondition;->kEnvCondMaxLight:Lcom/sonymobile/scan3d/SphinxEnvCondition;

    .line 14
    new-instance v0, Lcom/sonymobile/scan3d/SphinxEnvCondition;

    const-string v1, "kEnvCondIso"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v6}, Lcom/sonymobile/scan3d/SphinxEnvCondition;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/SphinxEnvCondition;->kEnvCondIso:Lcom/sonymobile/scan3d/SphinxEnvCondition;

    .line 15
    new-instance v0, Lcom/sonymobile/scan3d/SphinxEnvCondition;

    const-string v1, "kEnvCondExposureTime"

    const/4 v7, 0x5

    invoke-direct {v0, v1, v7}, Lcom/sonymobile/scan3d/SphinxEnvCondition;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/SphinxEnvCondition;->kEnvCondExposureTime:Lcom/sonymobile/scan3d/SphinxEnvCondition;

    .line 16
    new-instance v0, Lcom/sonymobile/scan3d/SphinxEnvCondition;

    const-string v1, "kEnvCondBattery"

    const/4 v8, 0x6

    invoke-direct {v0, v1, v8}, Lcom/sonymobile/scan3d/SphinxEnvCondition;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/SphinxEnvCondition;->kEnvCondBattery:Lcom/sonymobile/scan3d/SphinxEnvCondition;

    .line 17
    new-instance v0, Lcom/sonymobile/scan3d/SphinxEnvCondition;

    const-string v1, "kEnvCondFreeStorageMB"

    const/4 v9, 0x7

    invoke-direct {v0, v1, v9}, Lcom/sonymobile/scan3d/SphinxEnvCondition;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/SphinxEnvCondition;->kEnvCondFreeStorageMB:Lcom/sonymobile/scan3d/SphinxEnvCondition;

    .line 18
    new-instance v0, Lcom/sonymobile/scan3d/SphinxEnvCondition;

    const-string v1, "kEnvCondTOFDistance"

    const/16 v10, 0x8

    invoke-direct {v0, v1, v10}, Lcom/sonymobile/scan3d/SphinxEnvCondition;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/SphinxEnvCondition;->kEnvCondTOFDistance:Lcom/sonymobile/scan3d/SphinxEnvCondition;

    .line 19
    new-instance v0, Lcom/sonymobile/scan3d/SphinxEnvCondition;

    const-string v1, "kEnvCondFocusDistance"

    const/16 v11, 0x9

    invoke-direct {v0, v1, v11}, Lcom/sonymobile/scan3d/SphinxEnvCondition;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/SphinxEnvCondition;->kEnvCondFocusDistance:Lcom/sonymobile/scan3d/SphinxEnvCondition;

    .line 20
    new-instance v0, Lcom/sonymobile/scan3d/SphinxEnvCondition;

    const-string v1, "kEnvCondCount"

    const/16 v12, 0xa

    invoke-direct {v0, v1, v12}, Lcom/sonymobile/scan3d/SphinxEnvCondition;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/SphinxEnvCondition;->kEnvCondCount:Lcom/sonymobile/scan3d/SphinxEnvCondition;

    const/16 v0, 0xb

    .line 9
    new-array v0, v0, [Lcom/sonymobile/scan3d/SphinxEnvCondition;

    sget-object v1, Lcom/sonymobile/scan3d/SphinxEnvCondition;->kEnvCondTemp:Lcom/sonymobile/scan3d/SphinxEnvCondition;

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/SphinxEnvCondition;->kEnvCondLight:Lcom/sonymobile/scan3d/SphinxEnvCondition;

    aput-object v1, v0, v3

    sget-object v1, Lcom/sonymobile/scan3d/SphinxEnvCondition;->kEnvCondMinLight:Lcom/sonymobile/scan3d/SphinxEnvCondition;

    aput-object v1, v0, v4

    sget-object v1, Lcom/sonymobile/scan3d/SphinxEnvCondition;->kEnvCondMaxLight:Lcom/sonymobile/scan3d/SphinxEnvCondition;

    aput-object v1, v0, v5

    sget-object v1, Lcom/sonymobile/scan3d/SphinxEnvCondition;->kEnvCondIso:Lcom/sonymobile/scan3d/SphinxEnvCondition;

    aput-object v1, v0, v6

    sget-object v1, Lcom/sonymobile/scan3d/SphinxEnvCondition;->kEnvCondExposureTime:Lcom/sonymobile/scan3d/SphinxEnvCondition;

    aput-object v1, v0, v7

    sget-object v1, Lcom/sonymobile/scan3d/SphinxEnvCondition;->kEnvCondBattery:Lcom/sonymobile/scan3d/SphinxEnvCondition;

    aput-object v1, v0, v8

    sget-object v1, Lcom/sonymobile/scan3d/SphinxEnvCondition;->kEnvCondFreeStorageMB:Lcom/sonymobile/scan3d/SphinxEnvCondition;

    aput-object v1, v0, v9

    sget-object v1, Lcom/sonymobile/scan3d/SphinxEnvCondition;->kEnvCondTOFDistance:Lcom/sonymobile/scan3d/SphinxEnvCondition;

    aput-object v1, v0, v10

    sget-object v1, Lcom/sonymobile/scan3d/SphinxEnvCondition;->kEnvCondFocusDistance:Lcom/sonymobile/scan3d/SphinxEnvCondition;

    aput-object v1, v0, v11

    sget-object v1, Lcom/sonymobile/scan3d/SphinxEnvCondition;->kEnvCondCount:Lcom/sonymobile/scan3d/SphinxEnvCondition;

    aput-object v1, v0, v12

    sput-object v0, Lcom/sonymobile/scan3d/SphinxEnvCondition;->$VALUES:[Lcom/sonymobile/scan3d/SphinxEnvCondition;

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

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/SphinxEnvCondition;
    .locals 1

    .line 9
    const-class v0, Lcom/sonymobile/scan3d/SphinxEnvCondition;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/SphinxEnvCondition;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/SphinxEnvCondition;
    .locals 1

    .line 9
    sget-object v0, Lcom/sonymobile/scan3d/SphinxEnvCondition;->$VALUES:[Lcom/sonymobile/scan3d/SphinxEnvCondition;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/SphinxEnvCondition;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/SphinxEnvCondition;

    return-object v0
.end method
