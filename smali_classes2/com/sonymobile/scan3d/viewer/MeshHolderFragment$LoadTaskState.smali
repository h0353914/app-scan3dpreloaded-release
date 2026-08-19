.class public final enum Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;
.super Ljava/lang/Enum;
.source "MeshHolderFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "LoadTaskState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

.field public static final enum STATE_FAILED:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

.field public static final enum STATE_LOADED:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

.field public static final enum STATE_LOADING:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

.field public static final enum STATE_NOT_LOADED:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 102
    new-instance v0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    const-string v1, "STATE_NOT_LOADED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;->STATE_NOT_LOADED:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    .line 103
    new-instance v0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    const-string v1, "STATE_LOADED"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;->STATE_LOADED:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    .line 104
    new-instance v0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    const-string v1, "STATE_FAILED"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;->STATE_FAILED:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    .line 105
    new-instance v0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    const-string v1, "STATE_LOADING"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;->STATE_LOADING:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    const/4 v0, 0x4

    .line 101
    new-array v0, v0, [Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    sget-object v1, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;->STATE_NOT_LOADED:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;->STATE_LOADED:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    aput-object v1, v0, v3

    sget-object v1, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;->STATE_FAILED:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    aput-object v1, v0, v4

    sget-object v1, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;->STATE_LOADING:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    aput-object v1, v0, v5

    sput-object v0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;->$VALUES:[Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 101
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;
    .locals 1

    .line 101
    const-class v0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;
    .locals 1

    .line 101
    sget-object v0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;->$VALUES:[Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    return-object v0
.end method
