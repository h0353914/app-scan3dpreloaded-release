.class public final enum Lcom/sonymobile/scan3d/SphinxState;
.super Ljava/lang/Enum;
.source "SphinxState.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/SphinxState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/SphinxState;

.field public static final enum kStateBreakEstablish:Lcom/sonymobile/scan3d/SphinxState;

.field public static final enum kStateDestroyed:Lcom/sonymobile/scan3d/SphinxState;

.field public static final enum kStateDone:Lcom/sonymobile/scan3d/SphinxState;

.field public static final enum kStateEstablishScale:Lcom/sonymobile/scan3d/SphinxState;

.field public static final enum kStateEstablishScaleDone:Lcom/sonymobile/scan3d/SphinxState;

.field public static final enum kStateEstablishScaleLostTrack:Lcom/sonymobile/scan3d/SphinxState;

.field public static final enum kStateInitTrack:Lcom/sonymobile/scan3d/SphinxState;

.field public static final enum kStateSaving:Lcom/sonymobile/scan3d/SphinxState;

.field public static final enum kStateSculpting:Lcom/sonymobile/scan3d/SphinxState;

.field public static final enum kStateSculptingLostTrack:Lcom/sonymobile/scan3d/SphinxState;

.field public static final enum kStateSprayPainting:Lcom/sonymobile/scan3d/SphinxState;

.field public static final enum kStateStopping:Lcom/sonymobile/scan3d/SphinxState;

.field public static final enum kStateUninitialized:Lcom/sonymobile/scan3d/SphinxState;


# direct methods
.method static constructor <clinit>()V
    .locals 15

    .line 10
    new-instance v0, Lcom/sonymobile/scan3d/SphinxState;

    const-string v1, "kStateUninitialized"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/sonymobile/scan3d/SphinxState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/SphinxState;->kStateUninitialized:Lcom/sonymobile/scan3d/SphinxState;

    .line 11
    new-instance v0, Lcom/sonymobile/scan3d/SphinxState;

    const-string v1, "kStateInitTrack"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/sonymobile/scan3d/SphinxState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/SphinxState;->kStateInitTrack:Lcom/sonymobile/scan3d/SphinxState;

    .line 12
    new-instance v0, Lcom/sonymobile/scan3d/SphinxState;

    const-string v1, "kStateEstablishScale"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/sonymobile/scan3d/SphinxState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/SphinxState;->kStateEstablishScale:Lcom/sonymobile/scan3d/SphinxState;

    .line 13
    new-instance v0, Lcom/sonymobile/scan3d/SphinxState;

    const-string v1, "kStateEstablishScaleLostTrack"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lcom/sonymobile/scan3d/SphinxState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/SphinxState;->kStateEstablishScaleLostTrack:Lcom/sonymobile/scan3d/SphinxState;

    .line 14
    new-instance v0, Lcom/sonymobile/scan3d/SphinxState;

    const-string v1, "kStateEstablishScaleDone"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v6}, Lcom/sonymobile/scan3d/SphinxState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/SphinxState;->kStateEstablishScaleDone:Lcom/sonymobile/scan3d/SphinxState;

    .line 15
    new-instance v0, Lcom/sonymobile/scan3d/SphinxState;

    const-string v1, "kStateSculpting"

    const/4 v7, 0x5

    invoke-direct {v0, v1, v7}, Lcom/sonymobile/scan3d/SphinxState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/SphinxState;->kStateSculpting:Lcom/sonymobile/scan3d/SphinxState;

    .line 16
    new-instance v0, Lcom/sonymobile/scan3d/SphinxState;

    const-string v1, "kStateSculptingLostTrack"

    const/4 v8, 0x6

    invoke-direct {v0, v1, v8}, Lcom/sonymobile/scan3d/SphinxState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/SphinxState;->kStateSculptingLostTrack:Lcom/sonymobile/scan3d/SphinxState;

    .line 17
    new-instance v0, Lcom/sonymobile/scan3d/SphinxState;

    const-string v1, "kStateStopping"

    const/4 v9, 0x7

    invoke-direct {v0, v1, v9}, Lcom/sonymobile/scan3d/SphinxState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/SphinxState;->kStateStopping:Lcom/sonymobile/scan3d/SphinxState;

    .line 18
    new-instance v0, Lcom/sonymobile/scan3d/SphinxState;

    const-string v1, "kStateSprayPainting"

    const/16 v10, 0x8

    invoke-direct {v0, v1, v10}, Lcom/sonymobile/scan3d/SphinxState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/SphinxState;->kStateSprayPainting:Lcom/sonymobile/scan3d/SphinxState;

    .line 19
    new-instance v0, Lcom/sonymobile/scan3d/SphinxState;

    const-string v1, "kStateSaving"

    const/16 v11, 0x9

    invoke-direct {v0, v1, v11}, Lcom/sonymobile/scan3d/SphinxState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/SphinxState;->kStateSaving:Lcom/sonymobile/scan3d/SphinxState;

    .line 20
    new-instance v0, Lcom/sonymobile/scan3d/SphinxState;

    const-string v1, "kStateDone"

    const/16 v12, 0xa

    invoke-direct {v0, v1, v12}, Lcom/sonymobile/scan3d/SphinxState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/SphinxState;->kStateDone:Lcom/sonymobile/scan3d/SphinxState;

    .line 21
    new-instance v0, Lcom/sonymobile/scan3d/SphinxState;

    const-string v1, "kStateDestroyed"

    const/16 v13, 0xb

    invoke-direct {v0, v1, v13}, Lcom/sonymobile/scan3d/SphinxState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/SphinxState;->kStateDestroyed:Lcom/sonymobile/scan3d/SphinxState;

    .line 22
    new-instance v0, Lcom/sonymobile/scan3d/SphinxState;

    const-string v1, "kStateBreakEstablish"

    const/16 v14, 0xc

    invoke-direct {v0, v1, v14}, Lcom/sonymobile/scan3d/SphinxState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/SphinxState;->kStateBreakEstablish:Lcom/sonymobile/scan3d/SphinxState;

    const/16 v0, 0xd

    .line 9
    new-array v0, v0, [Lcom/sonymobile/scan3d/SphinxState;

    sget-object v1, Lcom/sonymobile/scan3d/SphinxState;->kStateUninitialized:Lcom/sonymobile/scan3d/SphinxState;

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/SphinxState;->kStateInitTrack:Lcom/sonymobile/scan3d/SphinxState;

    aput-object v1, v0, v3

    sget-object v1, Lcom/sonymobile/scan3d/SphinxState;->kStateEstablishScale:Lcom/sonymobile/scan3d/SphinxState;

    aput-object v1, v0, v4

    sget-object v1, Lcom/sonymobile/scan3d/SphinxState;->kStateEstablishScaleLostTrack:Lcom/sonymobile/scan3d/SphinxState;

    aput-object v1, v0, v5

    sget-object v1, Lcom/sonymobile/scan3d/SphinxState;->kStateEstablishScaleDone:Lcom/sonymobile/scan3d/SphinxState;

    aput-object v1, v0, v6

    sget-object v1, Lcom/sonymobile/scan3d/SphinxState;->kStateSculpting:Lcom/sonymobile/scan3d/SphinxState;

    aput-object v1, v0, v7

    sget-object v1, Lcom/sonymobile/scan3d/SphinxState;->kStateSculptingLostTrack:Lcom/sonymobile/scan3d/SphinxState;

    aput-object v1, v0, v8

    sget-object v1, Lcom/sonymobile/scan3d/SphinxState;->kStateStopping:Lcom/sonymobile/scan3d/SphinxState;

    aput-object v1, v0, v9

    sget-object v1, Lcom/sonymobile/scan3d/SphinxState;->kStateSprayPainting:Lcom/sonymobile/scan3d/SphinxState;

    aput-object v1, v0, v10

    sget-object v1, Lcom/sonymobile/scan3d/SphinxState;->kStateSaving:Lcom/sonymobile/scan3d/SphinxState;

    aput-object v1, v0, v11

    sget-object v1, Lcom/sonymobile/scan3d/SphinxState;->kStateDone:Lcom/sonymobile/scan3d/SphinxState;

    aput-object v1, v0, v12

    sget-object v1, Lcom/sonymobile/scan3d/SphinxState;->kStateDestroyed:Lcom/sonymobile/scan3d/SphinxState;

    aput-object v1, v0, v13

    sget-object v1, Lcom/sonymobile/scan3d/SphinxState;->kStateBreakEstablish:Lcom/sonymobile/scan3d/SphinxState;

    aput-object v1, v0, v14

    sput-object v0, Lcom/sonymobile/scan3d/SphinxState;->$VALUES:[Lcom/sonymobile/scan3d/SphinxState;

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

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/SphinxState;
    .locals 1

    .line 9
    const-class v0, Lcom/sonymobile/scan3d/SphinxState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/SphinxState;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/SphinxState;
    .locals 1

    .line 9
    sget-object v0, Lcom/sonymobile/scan3d/SphinxState;->$VALUES:[Lcom/sonymobile/scan3d/SphinxState;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/SphinxState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/SphinxState;

    return-object v0
.end method
