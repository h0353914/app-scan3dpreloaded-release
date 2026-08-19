.class public final enum Lcom/sonymobile/scan3d/PrintType;
.super Ljava/lang/Enum;
.source "PrintType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/PrintType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/PrintType;

.field public static final enum TYPE_NONE:Lcom/sonymobile/scan3d/PrintType;

.field public static final enum TYPE_TABLE_STAND:Lcom/sonymobile/scan3d/PrintType;

.field public static final enum TYPE_WALL_MOUNT:Lcom/sonymobile/scan3d/PrintType;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 10
    new-instance v0, Lcom/sonymobile/scan3d/PrintType;

    const-string v1, "TYPE_NONE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/sonymobile/scan3d/PrintType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/PrintType;->TYPE_NONE:Lcom/sonymobile/scan3d/PrintType;

    .line 14
    new-instance v0, Lcom/sonymobile/scan3d/PrintType;

    const-string v1, "TYPE_TABLE_STAND"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/sonymobile/scan3d/PrintType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/PrintType;->TYPE_TABLE_STAND:Lcom/sonymobile/scan3d/PrintType;

    .line 19
    new-instance v0, Lcom/sonymobile/scan3d/PrintType;

    const-string v1, "TYPE_WALL_MOUNT"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/sonymobile/scan3d/PrintType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/PrintType;->TYPE_WALL_MOUNT:Lcom/sonymobile/scan3d/PrintType;

    const/4 v0, 0x3

    .line 9
    new-array v0, v0, [Lcom/sonymobile/scan3d/PrintType;

    sget-object v1, Lcom/sonymobile/scan3d/PrintType;->TYPE_NONE:Lcom/sonymobile/scan3d/PrintType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/PrintType;->TYPE_TABLE_STAND:Lcom/sonymobile/scan3d/PrintType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/sonymobile/scan3d/PrintType;->TYPE_WALL_MOUNT:Lcom/sonymobile/scan3d/PrintType;

    aput-object v1, v0, v4

    sput-object v0, Lcom/sonymobile/scan3d/PrintType;->$VALUES:[Lcom/sonymobile/scan3d/PrintType;

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

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/PrintType;
    .locals 1

    .line 9
    const-class v0, Lcom/sonymobile/scan3d/PrintType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/PrintType;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/PrintType;
    .locals 1

    .line 9
    sget-object v0, Lcom/sonymobile/scan3d/PrintType;->$VALUES:[Lcom/sonymobile/scan3d/PrintType;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/PrintType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/PrintType;

    return-object v0
.end method
