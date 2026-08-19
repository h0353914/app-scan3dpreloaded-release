.class public final enum Lcom/sonymobile/scan3d/MeshVariant;
.super Ljava/lang/Enum;
.source "MeshVariant.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/MeshVariant;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/MeshVariant;

.field public static final enum MESH_VARIANT_ORIGINAL:Lcom/sonymobile/scan3d/MeshVariant;

.field public static final enum MESH_VARIANT_REDUCED:Lcom/sonymobile/scan3d/MeshVariant;

.field public static final enum NUM_MESH_VARIANT:Lcom/sonymobile/scan3d/MeshVariant;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 13
    new-instance v0, Lcom/sonymobile/scan3d/MeshVariant;

    const-string v1, "MESH_VARIANT_ORIGINAL"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/sonymobile/scan3d/MeshVariant;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/MeshVariant;->MESH_VARIANT_ORIGINAL:Lcom/sonymobile/scan3d/MeshVariant;

    .line 18
    new-instance v0, Lcom/sonymobile/scan3d/MeshVariant;

    const-string v1, "MESH_VARIANT_REDUCED"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/sonymobile/scan3d/MeshVariant;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/MeshVariant;->MESH_VARIANT_REDUCED:Lcom/sonymobile/scan3d/MeshVariant;

    .line 23
    new-instance v0, Lcom/sonymobile/scan3d/MeshVariant;

    const-string v1, "NUM_MESH_VARIANT"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/sonymobile/scan3d/MeshVariant;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/MeshVariant;->NUM_MESH_VARIANT:Lcom/sonymobile/scan3d/MeshVariant;

    const/4 v0, 0x3

    .line 9
    new-array v0, v0, [Lcom/sonymobile/scan3d/MeshVariant;

    sget-object v1, Lcom/sonymobile/scan3d/MeshVariant;->MESH_VARIANT_ORIGINAL:Lcom/sonymobile/scan3d/MeshVariant;

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/MeshVariant;->MESH_VARIANT_REDUCED:Lcom/sonymobile/scan3d/MeshVariant;

    aput-object v1, v0, v3

    sget-object v1, Lcom/sonymobile/scan3d/MeshVariant;->NUM_MESH_VARIANT:Lcom/sonymobile/scan3d/MeshVariant;

    aput-object v1, v0, v4

    sput-object v0, Lcom/sonymobile/scan3d/MeshVariant;->$VALUES:[Lcom/sonymobile/scan3d/MeshVariant;

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

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/MeshVariant;
    .locals 1

    .line 9
    const-class v0, Lcom/sonymobile/scan3d/MeshVariant;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/MeshVariant;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/MeshVariant;
    .locals 1

    .line 9
    sget-object v0, Lcom/sonymobile/scan3d/MeshVariant;->$VALUES:[Lcom/sonymobile/scan3d/MeshVariant;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/MeshVariant;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/MeshVariant;

    return-object v0
.end method
