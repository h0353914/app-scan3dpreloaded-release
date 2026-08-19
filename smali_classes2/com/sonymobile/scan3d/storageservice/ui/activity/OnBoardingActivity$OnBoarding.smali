.class public final enum Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;
.super Ljava/lang/Enum;
.source "OnBoardingActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "OnBoarding"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;

.field public static final enum CREATE:Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;

.field public static final enum SHARE:Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;


# instance fields
.field final mDescription:I

.field final mImage:I

.field final mTitle:I


# direct methods
.method static constructor <clinit>()V
    .locals 13

    .line 45
    new-instance v6, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;

    const-string v1, "CREATE"

    const/4 v2, 0x0

    const v3, 0x7f080113

    const v4, 0x7f100194

    const v5, 0x7f100193

    move-object v0, v6

    invoke-direct/range {v0 .. v5}, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;-><init>(Ljava/lang/String;IIII)V

    sput-object v6, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;->CREATE:Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;

    .line 51
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;

    const-string v8, "SHARE"

    const/4 v9, 0x1

    const v10, 0x7f080116

    const v11, 0x7f100196

    const v12, 0x7f100195

    move-object v7, v0

    invoke-direct/range {v7 .. v12}, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;-><init>(Ljava/lang/String;IIII)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;->SHARE:Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;

    const/4 v0, 0x2

    .line 40
    new-array v0, v0, [Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;->CREATE:Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;->SHARE:Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;->$VALUES:[Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IIII)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(III)V"
        }
    .end annotation

    .line 76
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 77
    iput p3, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;->mImage:I

    .line 78
    iput p4, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;->mTitle:I

    .line 79
    iput p5, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;->mDescription:I

    return-void
.end method

.method static getItem(I)Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;
    .locals 1

    .line 116
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;->values()[Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;

    move-result-object v0

    aget-object p0, v0, p0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;
    .locals 1

    .line 40
    const-class v0, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;
    .locals 1

    .line 40
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;->$VALUES:[Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;

    return-object v0
.end method


# virtual methods
.method public getDescription()I
    .locals 1

    .line 106
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;->mDescription:I

    return v0
.end method

.method public getImage()I
    .locals 1

    .line 88
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;->mImage:I

    return v0
.end method

.method public getTitle()I
    .locals 1

    .line 97
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;->mTitle:I

    return v0
.end method
