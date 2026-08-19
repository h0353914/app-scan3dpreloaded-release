.class final enum Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;
.super Ljava/lang/Enum;
.source "FaceBlendFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "SaveState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

.field public static final enum IDLE:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

.field public static final enum IMAGE:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

.field public static final enum VIDEO:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

.field public static final enum WAITING:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 64
    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    const-string v1, "IDLE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;->IDLE:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    .line 69
    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    const-string v1, "WAITING"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;->WAITING:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    .line 74
    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    const-string v1, "IMAGE"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;->IMAGE:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    .line 79
    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    const-string v1, "VIDEO"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;->VIDEO:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    const/4 v0, 0x4

    .line 59
    new-array v0, v0, [Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    sget-object v1, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;->IDLE:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;->WAITING:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    aput-object v1, v0, v3

    sget-object v1, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;->IMAGE:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    aput-object v1, v0, v4

    sget-object v1, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;->VIDEO:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    aput-object v1, v0, v5

    sput-object v0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;->$VALUES:[Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 59
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;
    .locals 1

    .line 59
    const-class v0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;
    .locals 1

    .line 59
    sget-object v0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;->$VALUES:[Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    return-object v0
.end method
