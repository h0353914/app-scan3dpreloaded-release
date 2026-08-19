.class public Lcom/sonymobile/scan3d/utils/UserInputReducer;
.super Ljava/lang/Object;
.source "UserInputReducer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;
    }
.end annotation


# static fields
.field private static final INPUT_DELAY:I = 0xc8

.field private static final sEnableInput:Ljava/lang/Runnable;

.field private static sEnabled:Z = true


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 73
    sget-object v0, Lcom/sonymobile/scan3d/utils/-$$Lambda$UserInputReducer$rP6IXqkAU64drKqnR3_qscHEUcE;->INSTANCE:Lcom/sonymobile/scan3d/utils/-$$Lambda$UserInputReducer$rP6IXqkAU64drKqnR3_qscHEUcE;

    sput-object v0, Lcom/sonymobile/scan3d/utils/UserInputReducer;->sEnableInput:Ljava/lang/Runnable;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Z
    .locals 1

    .line 15
    sget-boolean v0, Lcom/sonymobile/scan3d/utils/UserInputReducer;->sEnabled:Z

    return v0
.end method

.method static synthetic access$002(Z)Z
    .locals 0

    .line 15
    sput-boolean p0, Lcom/sonymobile/scan3d/utils/UserInputReducer;->sEnabled:Z

    return p0
.end method

.method static synthetic access$100()Ljava/lang/Runnable;
    .locals 1

    .line 15
    sget-object v0, Lcom/sonymobile/scan3d/utils/UserInputReducer;->sEnableInput:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic lambda$static$0()V
    .locals 1

    const/4 v0, 0x1

    .line 73
    sput-boolean v0, Lcom/sonymobile/scan3d/utils/UserInputReducer;->sEnabled:Z

    return-void
.end method
