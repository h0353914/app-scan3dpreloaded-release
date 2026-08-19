.class public final enum Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;
.super Ljava/lang/Enum;
.source "Tip.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Priority"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;

.field public static final enum LONG_SCAN:Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;

.field public static final enum RESTORE:Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;

.field public static final enum SHORT_SCAN:Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;


# instance fields
.field private final mPositiveAction:I

.field private final mPositiveButton:I

.field private final mShortDescription:I


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .line 36
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;

    const-string v1, "LONG_SCAN"

    const v2, 0x104000a

    const/4 v3, 0x0

    const v4, 0x7f1002fa

    invoke-direct {v0, v1, v3, v4, v2}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;->LONG_SCAN:Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;

    .line 41
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;

    const-string v1, "SHORT_SCAN"

    const/4 v4, 0x1

    const v5, 0x7f1002fb

    invoke-direct {v0, v1, v4, v5, v2}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;->SHORT_SCAN:Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;

    .line 46
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;

    const-string v7, "RESTORE"

    const/4 v8, 0x2

    const v9, 0x7f1002f6

    const v10, 0x7f1002f5

    const v11, 0x7f1002d9

    move-object v6, v0

    invoke-direct/range {v6 .. v11}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;-><init>(Ljava/lang/String;IIII)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;->RESTORE:Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;

    const/4 v0, 0x3

    .line 31
    new-array v0, v0, [Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;->LONG_SCAN:Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;

    aput-object v1, v0, v3

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;->SHORT_SCAN:Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;

    aput-object v1, v0, v4

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;->RESTORE:Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;->$VALUES:[Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;III)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)V"
        }
    .end annotation

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    .line 72
    invoke-direct/range {v0 .. v5}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;-><init>(Ljava/lang/String;IIII)V

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IIII)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(III)V"
        }
    .end annotation

    .line 82
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 83
    iput p3, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;->mShortDescription:I

    .line 84
    iput p4, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;->mPositiveButton:I

    .line 85
    iput p5, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;->mPositiveAction:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;
    .locals 1

    .line 31
    const-class v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;
    .locals 1

    .line 31
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;->$VALUES:[Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;

    return-object v0
.end method


# virtual methods
.method public getAsTip()Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;
    .locals 1

    .line 121
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->access$000(Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;)Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;

    move-result-object v0

    return-object v0
.end method

.method public getPositiveAction()I
    .locals 1

    .line 112
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;->mPositiveAction:I

    return v0
.end method

.method public getPositiveButton()I
    .locals 1

    .line 103
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;->mPositiveButton:I

    return v0
.end method

.method public getShortDescription()I
    .locals 1

    .line 94
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;->mShortDescription:I

    return v0
.end method
