.class public final enum Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;
.super Ljava/lang/Enum;
.source "ExpansionProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Model"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;

.field public static final enum MANGA:Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;

.field public static final enum MONSTER:Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;


# instance fields
.field private mExpressionFilename:Ljava/lang/String;

.field private mModelFilename:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 26
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;

    const-string v1, "MANGA"

    const-string v2, "manga_model.glb"

    const-string v3, "manga_expr.lua"

    const/4 v4, 0x0

    invoke-direct {v0, v1, v4, v2, v3}, Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;->MANGA:Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;

    .line 31
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;

    const-string v1, "MONSTER"

    const-string v2, "monster_model.glb"

    const-string v3, "monster_expr.lua"

    const/4 v5, 0x1

    invoke-direct {v0, v1, v5, v2, v3}, Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;->MONSTER:Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;

    const/4 v0, 0x2

    .line 21
    new-array v0, v0, [Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;->MANGA:Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;

    aput-object v1, v0, v4

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;->MONSTER:Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;

    aput-object v1, v0, v5

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;->$VALUES:[Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 48
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 49
    iput-object p3, p0, Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;->mModelFilename:Ljava/lang/String;

    .line 50
    iput-object p4, p0, Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;->mExpressionFilename:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;)Ljava/lang/String;
    .locals 0

    .line 21
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;->getModelFileName()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;)Ljava/lang/String;
    .locals 0

    .line 21
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;->getExpressionFilename()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private getExpressionFilename()Ljava/lang/String;
    .locals 1

    .line 68
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;->mExpressionFilename:Ljava/lang/String;

    return-object v0
.end method

.method private getModelFileName()Ljava/lang/String;
    .locals 1

    .line 59
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;->mModelFilename:Ljava/lang/String;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;
    .locals 1

    .line 21
    const-class v0, Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;
    .locals 1

    .line 21
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;->$VALUES:[Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;

    return-object v0
.end method
