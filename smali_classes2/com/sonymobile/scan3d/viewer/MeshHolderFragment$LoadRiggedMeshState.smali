.class public final enum Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;
.super Ljava/lang/Enum;
.source "MeshHolderFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "LoadRiggedMeshState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;

.field public static final enum FAILED:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;

.field public static final enum LOADED:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;

.field public static final enum NOT_LOADED:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 109
    new-instance v0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;

    const-string v1, "NOT_LOADED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;->NOT_LOADED:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;

    .line 110
    new-instance v0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;

    const-string v1, "LOADED"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;->LOADED:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;

    .line 111
    new-instance v0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;

    const-string v1, "FAILED"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;->FAILED:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;

    const/4 v0, 0x3

    .line 108
    new-array v0, v0, [Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;

    sget-object v1, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;->NOT_LOADED:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;->LOADED:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;

    aput-object v1, v0, v3

    sget-object v1, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;->FAILED:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;

    aput-object v1, v0, v4

    sput-object v0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;->$VALUES:[Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 108
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;
    .locals 1

    .line 108
    const-class v0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;
    .locals 1

    .line 108
    sget-object v0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;->$VALUES:[Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;

    return-object v0
.end method
