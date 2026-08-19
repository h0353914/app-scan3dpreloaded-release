.class public final enum Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;
.super Ljava/lang/Enum;
.source "EnvironmentError.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/EnvironmentError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ErrorType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;

.field public static final enum TYPE_BAD_LOOP_CLOSURE:Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;

.field public static final enum TYPE_LOW_TEXTURE_AREA:Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;

.field public static final enum TYPE_TOO_BRIGHT:Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;

.field public static final enum TYPE_TOO_DARK:Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;

.field public static final enum TYPE_UNEVEN_LIGHT:Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 11
    new-instance v0, Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;

    const-string v1, "TYPE_TOO_DARK"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;->TYPE_TOO_DARK:Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;

    .line 12
    new-instance v0, Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;

    const-string v1, "TYPE_TOO_BRIGHT"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;->TYPE_TOO_BRIGHT:Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;

    .line 13
    new-instance v0, Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;

    const-string v1, "TYPE_UNEVEN_LIGHT"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;->TYPE_UNEVEN_LIGHT:Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;

    .line 14
    new-instance v0, Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;

    const-string v1, "TYPE_LOW_TEXTURE_AREA"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;->TYPE_LOW_TEXTURE_AREA:Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;

    .line 15
    new-instance v0, Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;

    const-string v1, "TYPE_BAD_LOOP_CLOSURE"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v6}, Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;->TYPE_BAD_LOOP_CLOSURE:Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;

    const/4 v0, 0x5

    .line 10
    new-array v0, v0, [Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;

    sget-object v1, Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;->TYPE_TOO_DARK:Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;->TYPE_TOO_BRIGHT:Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;->TYPE_UNEVEN_LIGHT:Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;->TYPE_LOW_TEXTURE_AREA:Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;->TYPE_BAD_LOOP_CLOSURE:Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;

    aput-object v1, v0, v6

    sput-object v0, Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;->$VALUES:[Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 10
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;
    .locals 1

    .line 10
    const-class v0, Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;
    .locals 1

    .line 10
    sget-object v0, Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;->$VALUES:[Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;

    return-object v0
.end method
