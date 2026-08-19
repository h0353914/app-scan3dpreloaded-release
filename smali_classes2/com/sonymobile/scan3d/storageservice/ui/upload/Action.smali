.class public final enum Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;
.super Ljava/lang/Enum;
.source "Action.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

.field public static final enum NONE:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

.field public static final enum PRINT:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

.field public static final enum PRINT_CUSTOM:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

.field public static final enum SHARE:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

.field public static final enum UNSHARE:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

.field public static final enum VIEW:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;


# instance fields
.field private final mIntentAction:Ljava/lang/String;

.field private final mNameResource:I
    .annotation build Landroidx/annotation/StringRes;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 23
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    const-string v1, "NONE"

    const-string v2, ""

    const/4 v3, 0x0

    invoke-direct {v0, v1, v3, v2, v3}, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->NONE:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    .line 28
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    const-string v1, "SHARE"

    const-string v2, "com.sonymobile.scan3d.action.SHARE"

    const/4 v4, 0x1

    const v5, 0x7f100338

    invoke-direct {v0, v1, v4, v2, v5}, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->SHARE:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    .line 33
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    const-string v1, "UNSHARE"

    const-string v2, "com.sonymobile.scan3d.action.UNSHARE"

    const/4 v5, 0x2

    const v6, 0x7f100368

    invoke-direct {v0, v1, v5, v2, v6}, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->UNSHARE:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    .line 38
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    const-string v1, "VIEW"

    const-string v2, "com.sonymobile.scan3d.action.VIEW"

    const/4 v6, 0x3

    const v7, 0x7f100339

    invoke-direct {v0, v1, v6, v2, v7}, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->VIEW:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    .line 43
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    const-string v1, "PRINT"

    const-string v2, "com.sonymobile.scan3d.action.PRINT"

    const v7, 0x7f100337

    const/4 v8, 0x4

    invoke-direct {v0, v1, v8, v2, v7}, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->PRINT:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    .line 48
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    const-string v1, "PRINT_CUSTOM"

    const-string v2, "com.sonymobile.scan3d.action.PRINT_CUSTOM"

    const/4 v9, 0x5

    invoke-direct {v0, v1, v9, v2, v7}, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->PRINT_CUSTOM:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    const/4 v0, 0x6

    .line 18
    new-array v0, v0, [Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->NONE:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    aput-object v1, v0, v3

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->SHARE:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    aput-object v1, v0, v4

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->UNSHARE:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    aput-object v1, v0, v5

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->VIEW:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    aput-object v1, v0, v6

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->PRINT:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    aput-object v1, v0, v8

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->PRINT_CUSTOM:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    aput-object v1, v0, v9

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->$VALUES:[Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;I)V
    .locals 0
    .param p2    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I)V"
        }
    .end annotation

    .line 67
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 68
    iput-object p3, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->mIntentAction:Ljava/lang/String;

    .line 69
    iput p4, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->mNameResource:I

    return-void
.end method

.method static getAction(Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;
    .locals 5

    .line 98
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->values()[Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 99
    iget-object v4, v3, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->mIntentAction:Ljava/lang/String;

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 103
    :cond_1
    sget-object p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->NONE:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;
    .locals 1

    .line 18
    const-class v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;
    .locals 1

    .line 18
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->$VALUES:[Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    return-object v0
.end method


# virtual methods
.method getIntentAction()Ljava/lang/String;
    .locals 1

    .line 78
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->mIntentAction:Ljava/lang/String;

    return-object v0
.end method

.method getName(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    .line 88
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->mNameResource:I

    if-eqz v0, :cond_0

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method
