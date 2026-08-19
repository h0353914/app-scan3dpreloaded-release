.class public final enum Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;
.super Ljava/lang/Enum;
.source "Shareable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/sharing/Shareable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

.field public static final enum ANIMATION:Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

.field public static final enum DEFAULT:Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

.field public static final enum PROPS:Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;


# instance fields
.field private final mCloudContentType:I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 85
    new-instance v0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    const-string v1, "DEFAULT"

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->DEFAULT:Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    .line 90
    new-instance v0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    const-string v1, "ANIMATION"

    const/4 v4, 0x4

    invoke-direct {v0, v1, v3, v4}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->ANIMATION:Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    .line 95
    new-instance v0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    const-string v1, "PROPS"

    const/4 v4, 0x2

    const/4 v5, 0x5

    invoke-direct {v0, v1, v4, v5}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->PROPS:Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    const/4 v0, 0x3

    .line 80
    new-array v0, v0, [Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    sget-object v1, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->DEFAULT:Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->ANIMATION:Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    aput-object v1, v0, v3

    sget-object v1, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->PROPS:Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    aput-object v1, v0, v4

    sput-object v0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->$VALUES:[Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 107
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 108
    iput p3, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->mCloudContentType:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;
    .locals 1

    .line 80
    const-class v0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;
    .locals 1

    .line 80
    sget-object v0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->$VALUES:[Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    return-object v0
.end method


# virtual methods
.method public getCloudContentType()I
    .locals 1

    .line 117
    iget v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->mCloudContentType:I

    return v0
.end method
