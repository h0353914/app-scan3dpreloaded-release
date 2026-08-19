.class public final enum Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;
.super Ljava/lang/Enum;
.source "PrintPreparationResult.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

.field public static final enum FAIL_EMPTY_MODEL:Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

.field public static final enum FAIL_GEOMETRY:Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

.field public static final enum FAIL_NO_CONTACT:Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

.field public static final enum FAIL_SHELL_CALC:Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

.field public static final enum FAIL_TEXT:Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

.field public static final enum FAIL_UNKNOWN:Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

.field public static final enum SUCCESS:Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;


# instance fields
.field private final mValue:Ljava/lang/Integer;


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 12
    new-instance v0, Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    const-string v1, "SUCCESS"

    const v2, 0x7f10022c

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v0, v1, v3, v2}, Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;-><init>(Ljava/lang/String;ILjava/lang/Integer;)V

    sput-object v0, Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;->SUCCESS:Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    .line 13
    new-instance v0, Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    const-string v1, "FAIL_EMPTY_MODEL"

    const v2, 0x7f100229

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v4, 0x1

    invoke-direct {v0, v1, v4, v2}, Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;-><init>(Ljava/lang/String;ILjava/lang/Integer;)V

    sput-object v0, Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;->FAIL_EMPTY_MODEL:Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    .line 14
    new-instance v0, Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    const-string v1, "FAIL_NO_CONTACT"

    const v2, 0x7f100228

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v5, 0x2

    invoke-direct {v0, v1, v5, v2}, Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;-><init>(Ljava/lang/String;ILjava/lang/Integer;)V

    sput-object v0, Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;->FAIL_NO_CONTACT:Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    .line 15
    new-instance v0, Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    const-string v1, "FAIL_SHELL_CALC"

    const v2, 0x7f10022b

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v6, 0x3

    invoke-direct {v0, v1, v6, v2}, Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;-><init>(Ljava/lang/String;ILjava/lang/Integer;)V

    sput-object v0, Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;->FAIL_SHELL_CALC:Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    .line 16
    new-instance v0, Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    const-string v1, "FAIL_TEXT"

    const v2, 0x7f10022d

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v7, 0x4

    invoke-direct {v0, v1, v7, v2}, Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;-><init>(Ljava/lang/String;ILjava/lang/Integer;)V

    sput-object v0, Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;->FAIL_TEXT:Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    .line 17
    new-instance v0, Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    const-string v1, "FAIL_GEOMETRY"

    const v2, 0x7f10022a

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v8, 0x5

    invoke-direct {v0, v1, v8, v2}, Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;-><init>(Ljava/lang/String;ILjava/lang/Integer;)V

    sput-object v0, Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;->FAIL_GEOMETRY:Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    .line 18
    new-instance v0, Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    const-string v1, "FAIL_UNKNOWN"

    const v2, 0x7f10022e

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v9, 0x6

    invoke-direct {v0, v1, v9, v2}, Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;-><init>(Ljava/lang/String;ILjava/lang/Integer;)V

    sput-object v0, Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;->FAIL_UNKNOWN:Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    const/4 v0, 0x7

    .line 11
    new-array v0, v0, [Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    sget-object v1, Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;->SUCCESS:Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    aput-object v1, v0, v3

    sget-object v1, Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;->FAIL_EMPTY_MODEL:Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    aput-object v1, v0, v4

    sget-object v1, Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;->FAIL_NO_CONTACT:Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    aput-object v1, v0, v5

    sget-object v1, Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;->FAIL_SHELL_CALC:Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    aput-object v1, v0, v6

    sget-object v1, Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;->FAIL_TEXT:Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    aput-object v1, v0, v7

    sget-object v1, Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;->FAIL_GEOMETRY:Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    aput-object v1, v0, v8

    sget-object v1, Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;->FAIL_UNKNOWN:Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    aput-object v1, v0, v9

    sput-object v0, Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;->$VALUES:[Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/Integer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Integer;",
            ")V"
        }
    .end annotation

    .line 22
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 23
    iput-object p3, p0, Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;->mValue:Ljava/lang/Integer;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;
    .locals 1

    .line 11
    const-class v0, Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;
    .locals 1

    .line 11
    sget-object v0, Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;->$VALUES:[Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    return-object v0
.end method


# virtual methods
.method public getString(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    .line 28
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;->mValue:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
