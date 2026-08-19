.class public final enum Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;
.super Ljava/lang/Enum;
.source "MimickingEngine.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "State"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;

.field public static final enum IDLE:Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;

.field public static final enum LOST:Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;

.field public static final enum SEARCHING:Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;

.field public static final enum TRACKING:Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 33
    new-instance v0, Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;

    const-string v1, "IDLE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;->IDLE:Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;

    .line 38
    new-instance v0, Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;

    const-string v1, "TRACKING"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;->TRACKING:Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;

    .line 43
    new-instance v0, Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;

    const-string v1, "LOST"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;->LOST:Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;

    .line 49
    new-instance v0, Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;

    const-string v1, "SEARCHING"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;->SEARCHING:Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;

    const/4 v0, 0x4

    .line 27
    new-array v0, v0, [Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;

    sget-object v1, Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;->IDLE:Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;->TRACKING:Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;

    aput-object v1, v0, v3

    sget-object v1, Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;->LOST:Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;

    aput-object v1, v0, v4

    sget-object v1, Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;->SEARCHING:Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;

    aput-object v1, v0, v5

    sput-object v0, Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;->$VALUES:[Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 27
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;
    .locals 1

    .line 27
    const-class v0, Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;
    .locals 1

    .line 27
    sget-object v0, Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;->$VALUES:[Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;

    return-object v0
.end method
