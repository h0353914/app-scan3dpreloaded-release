.class public final enum Lcom/sonymobile/scan3d/utils/PrintSize;
.super Ljava/lang/Enum;
.source "PrintSize.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/utils/PrintSize;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/utils/PrintSize;

.field public static final enum ALT_LARGE:Lcom/sonymobile/scan3d/utils/PrintSize;

.field public static final enum LARGE:Lcom/sonymobile/scan3d/utils/PrintSize;

.field public static final enum MEDIUM:Lcom/sonymobile/scan3d/utils/PrintSize;

.field public static final enum SMALL:Lcom/sonymobile/scan3d/utils/PrintSize;

.field public static final enum X_LARGE:Lcom/sonymobile/scan3d/utils/PrintSize;

.field public static final enum X_SMALL:Lcom/sonymobile/scan3d/utils/PrintSize;


# instance fields
.field private final mSize:F

.field private final mText:I


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 14
    new-instance v0, Lcom/sonymobile/scan3d/utils/PrintSize;

    const-string v1, "X_SMALL"

    const/4 v2, 0x0

    const/high16 v3, 0x42200000    # 40.0f

    const v4, 0x7f10021c

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/sonymobile/scan3d/utils/PrintSize;-><init>(Ljava/lang/String;IFI)V

    sput-object v0, Lcom/sonymobile/scan3d/utils/PrintSize;->X_SMALL:Lcom/sonymobile/scan3d/utils/PrintSize;

    .line 15
    new-instance v0, Lcom/sonymobile/scan3d/utils/PrintSize;

    const-string v1, "SMALL"

    const/4 v3, 0x1

    const/high16 v4, 0x42480000    # 50.0f

    const v5, 0x7f10021a

    invoke-direct {v0, v1, v3, v4, v5}, Lcom/sonymobile/scan3d/utils/PrintSize;-><init>(Ljava/lang/String;IFI)V

    sput-object v0, Lcom/sonymobile/scan3d/utils/PrintSize;->SMALL:Lcom/sonymobile/scan3d/utils/PrintSize;

    .line 16
    new-instance v0, Lcom/sonymobile/scan3d/utils/PrintSize;

    const-string v1, "MEDIUM"

    const/4 v4, 0x2

    const/high16 v5, 0x428c0000    # 70.0f

    const v6, 0x7f100219

    invoke-direct {v0, v1, v4, v5, v6}, Lcom/sonymobile/scan3d/utils/PrintSize;-><init>(Ljava/lang/String;IFI)V

    sput-object v0, Lcom/sonymobile/scan3d/utils/PrintSize;->MEDIUM:Lcom/sonymobile/scan3d/utils/PrintSize;

    .line 17
    new-instance v0, Lcom/sonymobile/scan3d/utils/PrintSize;

    const-string v1, "LARGE"

    const/4 v5, 0x3

    const/high16 v6, 0x42c80000    # 100.0f

    const v7, 0x7f100217

    invoke-direct {v0, v1, v5, v6, v7}, Lcom/sonymobile/scan3d/utils/PrintSize;-><init>(Ljava/lang/String;IFI)V

    sput-object v0, Lcom/sonymobile/scan3d/utils/PrintSize;->LARGE:Lcom/sonymobile/scan3d/utils/PrintSize;

    .line 18
    new-instance v0, Lcom/sonymobile/scan3d/utils/PrintSize;

    const-string v1, "X_LARGE"

    const/4 v6, 0x4

    const/high16 v7, 0x43160000    # 150.0f

    const v8, 0x7f100211

    invoke-direct {v0, v1, v6, v7, v8}, Lcom/sonymobile/scan3d/utils/PrintSize;-><init>(Ljava/lang/String;IFI)V

    sput-object v0, Lcom/sonymobile/scan3d/utils/PrintSize;->X_LARGE:Lcom/sonymobile/scan3d/utils/PrintSize;

    .line 19
    new-instance v0, Lcom/sonymobile/scan3d/utils/PrintSize;

    const-string v1, "ALT_LARGE"

    const/4 v7, 0x5

    const/high16 v8, 0x42b40000    # 90.0f

    const v9, 0x7f100218

    invoke-direct {v0, v1, v7, v8, v9}, Lcom/sonymobile/scan3d/utils/PrintSize;-><init>(Ljava/lang/String;IFI)V

    sput-object v0, Lcom/sonymobile/scan3d/utils/PrintSize;->ALT_LARGE:Lcom/sonymobile/scan3d/utils/PrintSize;

    const/4 v0, 0x6

    .line 12
    new-array v0, v0, [Lcom/sonymobile/scan3d/utils/PrintSize;

    sget-object v1, Lcom/sonymobile/scan3d/utils/PrintSize;->X_SMALL:Lcom/sonymobile/scan3d/utils/PrintSize;

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/utils/PrintSize;->SMALL:Lcom/sonymobile/scan3d/utils/PrintSize;

    aput-object v1, v0, v3

    sget-object v1, Lcom/sonymobile/scan3d/utils/PrintSize;->MEDIUM:Lcom/sonymobile/scan3d/utils/PrintSize;

    aput-object v1, v0, v4

    sget-object v1, Lcom/sonymobile/scan3d/utils/PrintSize;->LARGE:Lcom/sonymobile/scan3d/utils/PrintSize;

    aput-object v1, v0, v5

    sget-object v1, Lcom/sonymobile/scan3d/utils/PrintSize;->X_LARGE:Lcom/sonymobile/scan3d/utils/PrintSize;

    aput-object v1, v0, v6

    sget-object v1, Lcom/sonymobile/scan3d/utils/PrintSize;->ALT_LARGE:Lcom/sonymobile/scan3d/utils/PrintSize;

    aput-object v1, v0, v7

    sput-object v0, Lcom/sonymobile/scan3d/utils/PrintSize;->$VALUES:[Lcom/sonymobile/scan3d/utils/PrintSize;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IFI)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(FI)V"
        }
    .end annotation

    .line 37
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 38
    iput p3, p0, Lcom/sonymobile/scan3d/utils/PrintSize;->mSize:F

    .line 39
    iput p4, p0, Lcom/sonymobile/scan3d/utils/PrintSize;->mText:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/utils/PrintSize;
    .locals 1

    .line 12
    const-class v0, Lcom/sonymobile/scan3d/utils/PrintSize;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/utils/PrintSize;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/utils/PrintSize;
    .locals 1

    .line 12
    sget-object v0, Lcom/sonymobile/scan3d/utils/PrintSize;->$VALUES:[Lcom/sonymobile/scan3d/utils/PrintSize;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/utils/PrintSize;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/utils/PrintSize;

    return-object v0
.end method


# virtual methods
.method public getSize()F
    .locals 1

    .line 57
    iget v0, p0, Lcom/sonymobile/scan3d/utils/PrintSize;->mSize:F

    return v0
.end method

.method public getText()I
    .locals 1

    .line 48
    iget v0, p0, Lcom/sonymobile/scan3d/utils/PrintSize;->mText:I

    return v0
.end method
