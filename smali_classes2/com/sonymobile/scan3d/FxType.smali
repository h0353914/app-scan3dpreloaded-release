.class public final enum Lcom/sonymobile/scan3d/FxType;
.super Ljava/lang/Enum;
.source "FxType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/FxType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/FxType;

.field public static final enum ACTION:Lcom/sonymobile/scan3d/FxType;

.field public static final enum MULTI:Lcom/sonymobile/scan3d/FxType;

.field public static final enum RADIO:Lcom/sonymobile/scan3d/FxType;

.field public static final enum SLIDER:Lcom/sonymobile/scan3d/FxType;

.field public static final enum UNDEFINED:Lcom/sonymobile/scan3d/FxType;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 10
    new-instance v0, Lcom/sonymobile/scan3d/FxType;

    const-string v1, "ACTION"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/sonymobile/scan3d/FxType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/FxType;->ACTION:Lcom/sonymobile/scan3d/FxType;

    .line 11
    new-instance v0, Lcom/sonymobile/scan3d/FxType;

    const-string v1, "SLIDER"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/sonymobile/scan3d/FxType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/FxType;->SLIDER:Lcom/sonymobile/scan3d/FxType;

    .line 12
    new-instance v0, Lcom/sonymobile/scan3d/FxType;

    const-string v1, "MULTI"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/sonymobile/scan3d/FxType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/FxType;->MULTI:Lcom/sonymobile/scan3d/FxType;

    .line 13
    new-instance v0, Lcom/sonymobile/scan3d/FxType;

    const-string v1, "RADIO"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lcom/sonymobile/scan3d/FxType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/FxType;->RADIO:Lcom/sonymobile/scan3d/FxType;

    .line 14
    new-instance v0, Lcom/sonymobile/scan3d/FxType;

    const-string v1, "UNDEFINED"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v6}, Lcom/sonymobile/scan3d/FxType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/FxType;->UNDEFINED:Lcom/sonymobile/scan3d/FxType;

    const/4 v0, 0x5

    .line 9
    new-array v0, v0, [Lcom/sonymobile/scan3d/FxType;

    sget-object v1, Lcom/sonymobile/scan3d/FxType;->ACTION:Lcom/sonymobile/scan3d/FxType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/FxType;->SLIDER:Lcom/sonymobile/scan3d/FxType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/sonymobile/scan3d/FxType;->MULTI:Lcom/sonymobile/scan3d/FxType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/sonymobile/scan3d/FxType;->RADIO:Lcom/sonymobile/scan3d/FxType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/sonymobile/scan3d/FxType;->UNDEFINED:Lcom/sonymobile/scan3d/FxType;

    aput-object v1, v0, v6

    sput-object v0, Lcom/sonymobile/scan3d/FxType;->$VALUES:[Lcom/sonymobile/scan3d/FxType;

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

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/FxType;
    .locals 1

    .line 9
    const-class v0, Lcom/sonymobile/scan3d/FxType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/FxType;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/FxType;
    .locals 1

    .line 9
    sget-object v0, Lcom/sonymobile/scan3d/FxType;->$VALUES:[Lcom/sonymobile/scan3d/FxType;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/FxType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/FxType;

    return-object v0
.end method
