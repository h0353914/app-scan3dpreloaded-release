.class public final enum Lcom/sonymobile/scan3d/MeshType;
.super Ljava/lang/Enum;
.source "MeshType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/MeshType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/MeshType;

.field public static final enum NUM_MESH_TYPE:Lcom/sonymobile/scan3d/MeshType;

.field public static final enum TYPE_CYLINDER:Lcom/sonymobile/scan3d/MeshType;

.field public static final enum TYPE_ORIGINAL:Lcom/sonymobile/scan3d/MeshType;

.field public static final enum TYPE_PRINT_CUT:Lcom/sonymobile/scan3d/MeshType;

.field public static final enum TYPE_PRINT_PREVIEW:Lcom/sonymobile/scan3d/MeshType;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 14
    new-instance v0, Lcom/sonymobile/scan3d/MeshType;

    const-string v1, "TYPE_ORIGINAL"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/sonymobile/scan3d/MeshType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/MeshType;->TYPE_ORIGINAL:Lcom/sonymobile/scan3d/MeshType;

    .line 19
    new-instance v0, Lcom/sonymobile/scan3d/MeshType;

    const-string v1, "TYPE_PRINT_PREVIEW"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/sonymobile/scan3d/MeshType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/MeshType;->TYPE_PRINT_PREVIEW:Lcom/sonymobile/scan3d/MeshType;

    .line 25
    new-instance v0, Lcom/sonymobile/scan3d/MeshType;

    const-string v1, "TYPE_PRINT_CUT"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/sonymobile/scan3d/MeshType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/MeshType;->TYPE_PRINT_CUT:Lcom/sonymobile/scan3d/MeshType;

    .line 30
    new-instance v0, Lcom/sonymobile/scan3d/MeshType;

    const-string v1, "TYPE_CYLINDER"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lcom/sonymobile/scan3d/MeshType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/MeshType;->TYPE_CYLINDER:Lcom/sonymobile/scan3d/MeshType;

    .line 32
    new-instance v0, Lcom/sonymobile/scan3d/MeshType;

    const-string v1, "NUM_MESH_TYPE"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v6}, Lcom/sonymobile/scan3d/MeshType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/MeshType;->NUM_MESH_TYPE:Lcom/sonymobile/scan3d/MeshType;

    const/4 v0, 0x5

    .line 9
    new-array v0, v0, [Lcom/sonymobile/scan3d/MeshType;

    sget-object v1, Lcom/sonymobile/scan3d/MeshType;->TYPE_ORIGINAL:Lcom/sonymobile/scan3d/MeshType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/MeshType;->TYPE_PRINT_PREVIEW:Lcom/sonymobile/scan3d/MeshType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/sonymobile/scan3d/MeshType;->TYPE_PRINT_CUT:Lcom/sonymobile/scan3d/MeshType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/sonymobile/scan3d/MeshType;->TYPE_CYLINDER:Lcom/sonymobile/scan3d/MeshType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/sonymobile/scan3d/MeshType;->NUM_MESH_TYPE:Lcom/sonymobile/scan3d/MeshType;

    aput-object v1, v0, v6

    sput-object v0, Lcom/sonymobile/scan3d/MeshType;->$VALUES:[Lcom/sonymobile/scan3d/MeshType;

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

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/MeshType;
    .locals 1

    .line 9
    const-class v0, Lcom/sonymobile/scan3d/MeshType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/MeshType;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/MeshType;
    .locals 1

    .line 9
    sget-object v0, Lcom/sonymobile/scan3d/MeshType;->$VALUES:[Lcom/sonymobile/scan3d/MeshType;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/MeshType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/MeshType;

    return-object v0
.end method
