.class public abstract enum Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;
.super Ljava/lang/Enum;
.source "SortType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;

.field public static final enum DATE:Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;

.field public static final enum NAME:Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 17
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType$1;

    const-string v1, "DATE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType$1;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;->DATE:Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;

    .line 31
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType$2;

    const-string v1, "NAME"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType$2;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;->NAME:Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;

    const/4 v0, 0x2

    .line 13
    new-array v0, v0, [Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;->DATE:Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;->NAME:Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;

    aput-object v1, v0, v3

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;->$VALUES:[Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 13
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;ILcom/sonymobile/scan3d/storageservice/ui/gallery/SortType$1;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;
    .locals 1

    .line 13
    const-class v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;
    .locals 1

    .line 13
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;->$VALUES:[Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;

    return-object v0
.end method


# virtual methods
.method public abstract getLabelId()I
.end method

.method public abstract getSqlExpression()Ljava/lang/String;
.end method
