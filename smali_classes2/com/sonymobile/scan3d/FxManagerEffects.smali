.class public final enum Lcom/sonymobile/scan3d/FxManagerEffects;
.super Ljava/lang/Enum;
.source "FxManagerEffects.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/FxManagerEffects;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/FxManagerEffects;

.field public static final enum EFFECT_180_CROP_AND_SMOOTH:Lcom/sonymobile/scan3d/FxManagerEffects;

.field public static final enum EFFECT_ADJUST:Lcom/sonymobile/scan3d/FxManagerEffects;

.field public static final enum EFFECT_COUNT:Lcom/sonymobile/scan3d/FxManagerEffects;

.field public static final enum EFFECT_CUT:Lcom/sonymobile/scan3d/FxManagerEffects;

.field public static final enum EFFECT_SCALE:Lcom/sonymobile/scan3d/FxManagerEffects;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 10
    new-instance v0, Lcom/sonymobile/scan3d/FxManagerEffects;

    const-string v1, "EFFECT_ADJUST"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/sonymobile/scan3d/FxManagerEffects;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/FxManagerEffects;->EFFECT_ADJUST:Lcom/sonymobile/scan3d/FxManagerEffects;

    .line 11
    new-instance v0, Lcom/sonymobile/scan3d/FxManagerEffects;

    const-string v1, "EFFECT_CUT"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/sonymobile/scan3d/FxManagerEffects;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/FxManagerEffects;->EFFECT_CUT:Lcom/sonymobile/scan3d/FxManagerEffects;

    .line 12
    new-instance v0, Lcom/sonymobile/scan3d/FxManagerEffects;

    const-string v1, "EFFECT_SCALE"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/sonymobile/scan3d/FxManagerEffects;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/FxManagerEffects;->EFFECT_SCALE:Lcom/sonymobile/scan3d/FxManagerEffects;

    .line 13
    new-instance v0, Lcom/sonymobile/scan3d/FxManagerEffects;

    const-string v1, "EFFECT_180_CROP_AND_SMOOTH"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lcom/sonymobile/scan3d/FxManagerEffects;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/FxManagerEffects;->EFFECT_180_CROP_AND_SMOOTH:Lcom/sonymobile/scan3d/FxManagerEffects;

    .line 14
    new-instance v0, Lcom/sonymobile/scan3d/FxManagerEffects;

    const-string v1, "EFFECT_COUNT"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v6}, Lcom/sonymobile/scan3d/FxManagerEffects;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/FxManagerEffects;->EFFECT_COUNT:Lcom/sonymobile/scan3d/FxManagerEffects;

    const/4 v0, 0x5

    .line 9
    new-array v0, v0, [Lcom/sonymobile/scan3d/FxManagerEffects;

    sget-object v1, Lcom/sonymobile/scan3d/FxManagerEffects;->EFFECT_ADJUST:Lcom/sonymobile/scan3d/FxManagerEffects;

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/FxManagerEffects;->EFFECT_CUT:Lcom/sonymobile/scan3d/FxManagerEffects;

    aput-object v1, v0, v3

    sget-object v1, Lcom/sonymobile/scan3d/FxManagerEffects;->EFFECT_SCALE:Lcom/sonymobile/scan3d/FxManagerEffects;

    aput-object v1, v0, v4

    sget-object v1, Lcom/sonymobile/scan3d/FxManagerEffects;->EFFECT_180_CROP_AND_SMOOTH:Lcom/sonymobile/scan3d/FxManagerEffects;

    aput-object v1, v0, v5

    sget-object v1, Lcom/sonymobile/scan3d/FxManagerEffects;->EFFECT_COUNT:Lcom/sonymobile/scan3d/FxManagerEffects;

    aput-object v1, v0, v6

    sput-object v0, Lcom/sonymobile/scan3d/FxManagerEffects;->$VALUES:[Lcom/sonymobile/scan3d/FxManagerEffects;

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

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/FxManagerEffects;
    .locals 1

    .line 9
    const-class v0, Lcom/sonymobile/scan3d/FxManagerEffects;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/FxManagerEffects;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/FxManagerEffects;
    .locals 1

    .line 9
    sget-object v0, Lcom/sonymobile/scan3d/FxManagerEffects;->$VALUES:[Lcom/sonymobile/scan3d/FxManagerEffects;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/FxManagerEffects;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/FxManagerEffects;

    return-object v0
.end method
