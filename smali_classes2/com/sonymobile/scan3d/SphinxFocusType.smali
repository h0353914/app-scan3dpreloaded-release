.class public final enum Lcom/sonymobile/scan3d/SphinxFocusType;
.super Ljava/lang/Enum;
.source "SphinxFocusType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/SphinxFocusType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/SphinxFocusType;

.field public static final enum kFocusAuto:Lcom/sonymobile/scan3d/SphinxFocusType;

.field public static final enum kFocusFixed:Lcom/sonymobile/scan3d/SphinxFocusType;

.field public static final enum kFocusManual:Lcom/sonymobile/scan3d/SphinxFocusType;

.field public static final enum kFocusTof:Lcom/sonymobile/scan3d/SphinxFocusType;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 10
    new-instance v0, Lcom/sonymobile/scan3d/SphinxFocusType;

    const-string v1, "kFocusFixed"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/sonymobile/scan3d/SphinxFocusType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/SphinxFocusType;->kFocusFixed:Lcom/sonymobile/scan3d/SphinxFocusType;

    .line 11
    new-instance v0, Lcom/sonymobile/scan3d/SphinxFocusType;

    const-string v1, "kFocusAuto"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/sonymobile/scan3d/SphinxFocusType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/SphinxFocusType;->kFocusAuto:Lcom/sonymobile/scan3d/SphinxFocusType;

    .line 12
    new-instance v0, Lcom/sonymobile/scan3d/SphinxFocusType;

    const-string v1, "kFocusManual"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/sonymobile/scan3d/SphinxFocusType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/SphinxFocusType;->kFocusManual:Lcom/sonymobile/scan3d/SphinxFocusType;

    .line 13
    new-instance v0, Lcom/sonymobile/scan3d/SphinxFocusType;

    const-string v1, "kFocusTof"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lcom/sonymobile/scan3d/SphinxFocusType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/SphinxFocusType;->kFocusTof:Lcom/sonymobile/scan3d/SphinxFocusType;

    const/4 v0, 0x4

    .line 9
    new-array v0, v0, [Lcom/sonymobile/scan3d/SphinxFocusType;

    sget-object v1, Lcom/sonymobile/scan3d/SphinxFocusType;->kFocusFixed:Lcom/sonymobile/scan3d/SphinxFocusType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/SphinxFocusType;->kFocusAuto:Lcom/sonymobile/scan3d/SphinxFocusType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/sonymobile/scan3d/SphinxFocusType;->kFocusManual:Lcom/sonymobile/scan3d/SphinxFocusType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/sonymobile/scan3d/SphinxFocusType;->kFocusTof:Lcom/sonymobile/scan3d/SphinxFocusType;

    aput-object v1, v0, v5

    sput-object v0, Lcom/sonymobile/scan3d/SphinxFocusType;->$VALUES:[Lcom/sonymobile/scan3d/SphinxFocusType;

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

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/SphinxFocusType;
    .locals 1

    .line 9
    const-class v0, Lcom/sonymobile/scan3d/SphinxFocusType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/SphinxFocusType;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/SphinxFocusType;
    .locals 1

    .line 9
    sget-object v0, Lcom/sonymobile/scan3d/SphinxFocusType;->$VALUES:[Lcom/sonymobile/scan3d/SphinxFocusType;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/SphinxFocusType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/SphinxFocusType;

    return-object v0
.end method
