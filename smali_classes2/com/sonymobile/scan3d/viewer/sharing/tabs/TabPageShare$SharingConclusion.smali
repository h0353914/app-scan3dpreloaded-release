.class public final enum Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;
.super Ljava/lang/Enum;
.source "TabPageShare.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "SharingConclusion"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

.field public static final enum ANIMATE_WITHOUT_ASKING:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

.field public static final enum ASK_TO_ANIMATE:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

.field public static final enum SEND_GLTF:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

.field public static final enum SEND_OBJ_ZIP:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

.field public static final enum UNSUPPORTED_ERROR:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 425
    new-instance v0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

    const-string v1, "SEND_OBJ_ZIP"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;->SEND_OBJ_ZIP:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

    .line 430
    new-instance v0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

    const-string v1, "SEND_GLTF"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;->SEND_GLTF:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

    .line 435
    new-instance v0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

    const-string v1, "ASK_TO_ANIMATE"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;->ASK_TO_ANIMATE:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

    .line 440
    new-instance v0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

    const-string v1, "ANIMATE_WITHOUT_ASKING"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;->ANIMATE_WITHOUT_ASKING:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

    .line 447
    new-instance v0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

    const-string v1, "UNSUPPORTED_ERROR"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v6}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;->UNSUPPORTED_ERROR:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

    const/4 v0, 0x5

    .line 421
    new-array v0, v0, [Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

    sget-object v1, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;->SEND_OBJ_ZIP:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;->SEND_GLTF:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

    aput-object v1, v0, v3

    sget-object v1, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;->ASK_TO_ANIMATE:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

    aput-object v1, v0, v4

    sget-object v1, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;->ANIMATE_WITHOUT_ASKING:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

    aput-object v1, v0, v5

    sget-object v1, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;->UNSUPPORTED_ERROR:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

    aput-object v1, v0, v6

    sput-object v0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;->$VALUES:[Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 421
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;
    .locals 1

    .line 421
    const-class v0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;
    .locals 1

    .line 421
    sget-object v0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;->$VALUES:[Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

    return-object v0
.end method
