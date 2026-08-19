.class public final enum Lcom/sonymobile/scan3d/utils/PrintMaterial;
.super Ljava/lang/Enum;
.source "PrintMaterial.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/utils/PrintMaterial;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/utils/PrintMaterial;

.field public static final enum POLYJET_PLASTICS:Lcom/sonymobile/scan3d/utils/PrintMaterial;

.field public static final enum PORCELAIN_WHITE:Lcom/sonymobile/scan3d/utils/PrintMaterial;

.field public static final enum SANDSTONE_COLOUR:Lcom/sonymobile/scan3d/utils/PrintMaterial;


# instance fields
.field private final mImage:I

.field private final mText:I

.field private mType:Lcom/sonymobile/scan3d/PrintMaterialType;


# direct methods
.method static constructor <clinit>()V
    .locals 17

    .line 14
    new-instance v8, Lcom/sonymobile/scan3d/utils/PrintMaterial;

    const-string v1, "POLYJET_PLASTICS"

    sget-object v7, Lcom/sonymobile/scan3d/PrintMaterialType;->POLYJET_PLASTICS:Lcom/sonymobile/scan3d/PrintMaterialType;

    const/4 v2, 0x0

    const v3, 0x7f08011a

    const v4, 0x7f10021d

    const/high16 v5, 0x40400000    # 3.0f

    const/4 v6, 0x1

    move-object v0, v8

    invoke-direct/range {v0 .. v7}, Lcom/sonymobile/scan3d/utils/PrintMaterial;-><init>(Ljava/lang/String;IIIFZLcom/sonymobile/scan3d/PrintMaterialType;)V

    sput-object v8, Lcom/sonymobile/scan3d/utils/PrintMaterial;->POLYJET_PLASTICS:Lcom/sonymobile/scan3d/utils/PrintMaterial;

    .line 18
    new-instance v0, Lcom/sonymobile/scan3d/utils/PrintMaterial;

    const-string v10, "SANDSTONE_COLOUR"

    sget-object v16, Lcom/sonymobile/scan3d/PrintMaterialType;->SANDSTONE_COLOUR:Lcom/sonymobile/scan3d/PrintMaterialType;

    const/4 v11, 0x1

    const v12, 0x7f08011e

    const v13, 0x7f10021f

    const/high16 v14, 0x40000000    # 2.0f

    const/4 v15, 0x1

    move-object v9, v0

    invoke-direct/range {v9 .. v16}, Lcom/sonymobile/scan3d/utils/PrintMaterial;-><init>(Ljava/lang/String;IIIFZLcom/sonymobile/scan3d/PrintMaterialType;)V

    sput-object v0, Lcom/sonymobile/scan3d/utils/PrintMaterial;->SANDSTONE_COLOUR:Lcom/sonymobile/scan3d/utils/PrintMaterial;

    .line 20
    new-instance v0, Lcom/sonymobile/scan3d/utils/PrintMaterial;

    const-string v2, "PORCELAIN_WHITE"

    sget-object v8, Lcom/sonymobile/scan3d/PrintMaterialType;->PORCELAIN_WHITE:Lcom/sonymobile/scan3d/PrintMaterialType;

    const/4 v3, 0x2

    const v4, 0x7f08011c

    const v5, 0x7f10021e

    const/high16 v6, 0x40400000    # 3.0f

    const/4 v7, 0x0

    move-object v1, v0

    invoke-direct/range {v1 .. v8}, Lcom/sonymobile/scan3d/utils/PrintMaterial;-><init>(Ljava/lang/String;IIIFZLcom/sonymobile/scan3d/PrintMaterialType;)V

    sput-object v0, Lcom/sonymobile/scan3d/utils/PrintMaterial;->PORCELAIN_WHITE:Lcom/sonymobile/scan3d/utils/PrintMaterial;

    const/4 v0, 0x3

    .line 13
    new-array v0, v0, [Lcom/sonymobile/scan3d/utils/PrintMaterial;

    sget-object v1, Lcom/sonymobile/scan3d/utils/PrintMaterial;->POLYJET_PLASTICS:Lcom/sonymobile/scan3d/utils/PrintMaterial;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/utils/PrintMaterial;->SANDSTONE_COLOUR:Lcom/sonymobile/scan3d/utils/PrintMaterial;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/utils/PrintMaterial;->PORCELAIN_WHITE:Lcom/sonymobile/scan3d/utils/PrintMaterial;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sput-object v0, Lcom/sonymobile/scan3d/utils/PrintMaterial;->$VALUES:[Lcom/sonymobile/scan3d/utils/PrintMaterial;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IIIFZLcom/sonymobile/scan3d/PrintMaterialType;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IIFZ",
            "Lcom/sonymobile/scan3d/PrintMaterialType;",
            ")V"
        }
    .end annotation

    .line 35
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 36
    iput p3, p0, Lcom/sonymobile/scan3d/utils/PrintMaterial;->mImage:I

    .line 37
    iput p4, p0, Lcom/sonymobile/scan3d/utils/PrintMaterial;->mText:I

    .line 38
    iput-object p7, p0, Lcom/sonymobile/scan3d/utils/PrintMaterial;->mType:Lcom/sonymobile/scan3d/PrintMaterialType;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/utils/PrintMaterial;
    .locals 1

    .line 13
    const-class v0, Lcom/sonymobile/scan3d/utils/PrintMaterial;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/utils/PrintMaterial;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/utils/PrintMaterial;
    .locals 1

    .line 13
    sget-object v0, Lcom/sonymobile/scan3d/utils/PrintMaterial;->$VALUES:[Lcom/sonymobile/scan3d/utils/PrintMaterial;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/utils/PrintMaterial;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/utils/PrintMaterial;

    return-object v0
.end method


# virtual methods
.method public getImage()I
    .locals 1

    .line 42
    iget v0, p0, Lcom/sonymobile/scan3d/utils/PrintMaterial;->mImage:I

    return v0
.end method

.method public getText()I
    .locals 1

    .line 46
    iget v0, p0, Lcom/sonymobile/scan3d/utils/PrintMaterial;->mText:I

    return v0
.end method

.method public getType()Lcom/sonymobile/scan3d/PrintMaterialType;
    .locals 1

    .line 50
    iget-object v0, p0, Lcom/sonymobile/scan3d/utils/PrintMaterial;->mType:Lcom/sonymobile/scan3d/PrintMaterialType;

    return-object v0
.end method
