.class public final enum Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;
.super Ljava/lang/Enum;
.source "SharingConstants.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/sharing/SharingConstants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Category"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;

.field public static final enum GAMING:Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;

.field public static final enum MISC:Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;

.field public static final enum PRINT:Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;

.field public static final enum SHARE:Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;


# instance fields
.field public final name:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 104
    new-instance v0, Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;

    const-string v1, "PRINT"

    const-string v2, "print"

    const/4 v3, 0x0

    invoke-direct {v0, v1, v3, v2}, Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;->PRINT:Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;

    .line 109
    new-instance v0, Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;

    const-string v1, "SHARE"

    const-string v2, "share"

    const/4 v4, 0x1

    invoke-direct {v0, v1, v4, v2}, Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;->SHARE:Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;

    .line 114
    new-instance v0, Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;

    const-string v1, "GAMING"

    const-string v2, "gaming"

    const/4 v5, 0x2

    invoke-direct {v0, v1, v5, v2}, Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;->GAMING:Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;

    .line 120
    new-instance v0, Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;

    const-string v1, "MISC"

    const-string v2, "misc"

    const/4 v6, 0x3

    invoke-direct {v0, v1, v6, v2}, Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;->MISC:Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;

    const/4 v0, 0x4

    .line 100
    new-array v0, v0, [Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;

    sget-object v1, Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;->PRINT:Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;

    aput-object v1, v0, v3

    sget-object v1, Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;->SHARE:Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;

    aput-object v1, v0, v4

    sget-object v1, Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;->GAMING:Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;

    aput-object v1, v0, v5

    sget-object v1, Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;->MISC:Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;

    aput-object v1, v0, v6

    sput-object v0, Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;->$VALUES:[Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 124
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 125
    iput-object p3, p0, Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;->name:Ljava/lang/String;

    return-void
.end method

.method public static parse(Ljava/lang/String;)Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;
    .locals 5

    .line 129
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    .line 130
    invoke-static {}, Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;->values()[Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 131
    iget-object v4, v3, Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;->name:Ljava/lang/String;

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;
    .locals 1

    .line 100
    const-class v0, Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;
    .locals 1

    .line 100
    sget-object v0, Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;->$VALUES:[Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;

    return-object v0
.end method
