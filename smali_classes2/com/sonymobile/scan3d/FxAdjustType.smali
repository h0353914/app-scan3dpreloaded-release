.class public final enum Lcom/sonymobile/scan3d/FxAdjustType;
.super Ljava/lang/Enum;
.source "FxAdjustType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/FxAdjustType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/FxAdjustType;

.field public static final enum ADJUST_BRIGHTNESS:Lcom/sonymobile/scan3d/FxAdjustType;

.field public static final enum ADJUST_CONTRAST:Lcom/sonymobile/scan3d/FxAdjustType;

.field public static final enum ADJUST_COUNT:Lcom/sonymobile/scan3d/FxAdjustType;

.field public static final enum ADJUST_EYES:Lcom/sonymobile/scan3d/FxAdjustType;

.field public static final enum ADJUST_SHADOWS:Lcom/sonymobile/scan3d/FxAdjustType;

.field public static final enum ADJUST_SMOOTH:Lcom/sonymobile/scan3d/FxAdjustType;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 10
    new-instance v0, Lcom/sonymobile/scan3d/FxAdjustType;

    const-string v1, "ADJUST_BRIGHTNESS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/sonymobile/scan3d/FxAdjustType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/FxAdjustType;->ADJUST_BRIGHTNESS:Lcom/sonymobile/scan3d/FxAdjustType;

    .line 11
    new-instance v0, Lcom/sonymobile/scan3d/FxAdjustType;

    const-string v1, "ADJUST_CONTRAST"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/sonymobile/scan3d/FxAdjustType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/FxAdjustType;->ADJUST_CONTRAST:Lcom/sonymobile/scan3d/FxAdjustType;

    .line 12
    new-instance v0, Lcom/sonymobile/scan3d/FxAdjustType;

    const-string v1, "ADJUST_SHADOWS"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/sonymobile/scan3d/FxAdjustType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/FxAdjustType;->ADJUST_SHADOWS:Lcom/sonymobile/scan3d/FxAdjustType;

    .line 13
    new-instance v0, Lcom/sonymobile/scan3d/FxAdjustType;

    const-string v1, "ADJUST_SMOOTH"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lcom/sonymobile/scan3d/FxAdjustType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/FxAdjustType;->ADJUST_SMOOTH:Lcom/sonymobile/scan3d/FxAdjustType;

    .line 14
    new-instance v0, Lcom/sonymobile/scan3d/FxAdjustType;

    const-string v1, "ADJUST_EYES"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v6}, Lcom/sonymobile/scan3d/FxAdjustType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/FxAdjustType;->ADJUST_EYES:Lcom/sonymobile/scan3d/FxAdjustType;

    .line 15
    new-instance v0, Lcom/sonymobile/scan3d/FxAdjustType;

    const-string v1, "ADJUST_COUNT"

    const/4 v7, 0x5

    invoke-direct {v0, v1, v7}, Lcom/sonymobile/scan3d/FxAdjustType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/FxAdjustType;->ADJUST_COUNT:Lcom/sonymobile/scan3d/FxAdjustType;

    const/4 v0, 0x6

    .line 9
    new-array v0, v0, [Lcom/sonymobile/scan3d/FxAdjustType;

    sget-object v1, Lcom/sonymobile/scan3d/FxAdjustType;->ADJUST_BRIGHTNESS:Lcom/sonymobile/scan3d/FxAdjustType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/FxAdjustType;->ADJUST_CONTRAST:Lcom/sonymobile/scan3d/FxAdjustType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/sonymobile/scan3d/FxAdjustType;->ADJUST_SHADOWS:Lcom/sonymobile/scan3d/FxAdjustType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/sonymobile/scan3d/FxAdjustType;->ADJUST_SMOOTH:Lcom/sonymobile/scan3d/FxAdjustType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/sonymobile/scan3d/FxAdjustType;->ADJUST_EYES:Lcom/sonymobile/scan3d/FxAdjustType;

    aput-object v1, v0, v6

    sget-object v1, Lcom/sonymobile/scan3d/FxAdjustType;->ADJUST_COUNT:Lcom/sonymobile/scan3d/FxAdjustType;

    aput-object v1, v0, v7

    sput-object v0, Lcom/sonymobile/scan3d/FxAdjustType;->$VALUES:[Lcom/sonymobile/scan3d/FxAdjustType;

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

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/FxAdjustType;
    .locals 1

    .line 9
    const-class v0, Lcom/sonymobile/scan3d/FxAdjustType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/FxAdjustType;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/FxAdjustType;
    .locals 1

    .line 9
    sget-object v0, Lcom/sonymobile/scan3d/FxAdjustType;->$VALUES:[Lcom/sonymobile/scan3d/FxAdjustType;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/FxAdjustType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/FxAdjustType;

    return-object v0
.end method
