.class public final enum Lcom/sonymobile/scan3d/ViewerBackground;
.super Ljava/lang/Enum;
.source "ViewerBackground.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/ViewerBackground;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/ViewerBackground;

.field public static final enum BACKGROUND_DEFAULT:Lcom/sonymobile/scan3d/ViewerBackground;

.field public static final enum BACKGROUND_OUTDOORS:Lcom/sonymobile/scan3d/ViewerBackground;

.field public static final enum BACKGROUND_SIMPLE:Lcom/sonymobile/scan3d/ViewerBackground;

.field public static final enum BACKGROUND_STUDIO:Lcom/sonymobile/scan3d/ViewerBackground;

.field public static final enum NUM_BACKGROUND:Lcom/sonymobile/scan3d/ViewerBackground;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 10
    new-instance v0, Lcom/sonymobile/scan3d/ViewerBackground;

    const-string v1, "BACKGROUND_SIMPLE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/sonymobile/scan3d/ViewerBackground;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/ViewerBackground;->BACKGROUND_SIMPLE:Lcom/sonymobile/scan3d/ViewerBackground;

    .line 11
    new-instance v0, Lcom/sonymobile/scan3d/ViewerBackground;

    const-string v1, "BACKGROUND_DEFAULT"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/sonymobile/scan3d/ViewerBackground;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/ViewerBackground;->BACKGROUND_DEFAULT:Lcom/sonymobile/scan3d/ViewerBackground;

    .line 12
    new-instance v0, Lcom/sonymobile/scan3d/ViewerBackground;

    const-string v1, "BACKGROUND_OUTDOORS"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/sonymobile/scan3d/ViewerBackground;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/ViewerBackground;->BACKGROUND_OUTDOORS:Lcom/sonymobile/scan3d/ViewerBackground;

    .line 13
    new-instance v0, Lcom/sonymobile/scan3d/ViewerBackground;

    const-string v1, "BACKGROUND_STUDIO"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lcom/sonymobile/scan3d/ViewerBackground;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/ViewerBackground;->BACKGROUND_STUDIO:Lcom/sonymobile/scan3d/ViewerBackground;

    .line 14
    new-instance v0, Lcom/sonymobile/scan3d/ViewerBackground;

    const-string v1, "NUM_BACKGROUND"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v6}, Lcom/sonymobile/scan3d/ViewerBackground;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/ViewerBackground;->NUM_BACKGROUND:Lcom/sonymobile/scan3d/ViewerBackground;

    const/4 v0, 0x5

    .line 9
    new-array v0, v0, [Lcom/sonymobile/scan3d/ViewerBackground;

    sget-object v1, Lcom/sonymobile/scan3d/ViewerBackground;->BACKGROUND_SIMPLE:Lcom/sonymobile/scan3d/ViewerBackground;

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/ViewerBackground;->BACKGROUND_DEFAULT:Lcom/sonymobile/scan3d/ViewerBackground;

    aput-object v1, v0, v3

    sget-object v1, Lcom/sonymobile/scan3d/ViewerBackground;->BACKGROUND_OUTDOORS:Lcom/sonymobile/scan3d/ViewerBackground;

    aput-object v1, v0, v4

    sget-object v1, Lcom/sonymobile/scan3d/ViewerBackground;->BACKGROUND_STUDIO:Lcom/sonymobile/scan3d/ViewerBackground;

    aput-object v1, v0, v5

    sget-object v1, Lcom/sonymobile/scan3d/ViewerBackground;->NUM_BACKGROUND:Lcom/sonymobile/scan3d/ViewerBackground;

    aput-object v1, v0, v6

    sput-object v0, Lcom/sonymobile/scan3d/ViewerBackground;->$VALUES:[Lcom/sonymobile/scan3d/ViewerBackground;

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

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/ViewerBackground;
    .locals 1

    .line 9
    const-class v0, Lcom/sonymobile/scan3d/ViewerBackground;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/ViewerBackground;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/ViewerBackground;
    .locals 1

    .line 9
    sget-object v0, Lcom/sonymobile/scan3d/ViewerBackground;->$VALUES:[Lcom/sonymobile/scan3d/ViewerBackground;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/ViewerBackground;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/ViewerBackground;

    return-object v0
.end method
