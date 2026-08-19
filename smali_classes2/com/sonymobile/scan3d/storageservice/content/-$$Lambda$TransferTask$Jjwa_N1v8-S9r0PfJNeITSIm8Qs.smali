.class public final synthetic Lcom/sonymobile/scan3d/storageservice/content/-$$Lambda$TransferTask$Jjwa_N1v8-S9r0PfJNeITSIm8Qs;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/util/Comparator;


# static fields
.field public static final synthetic INSTANCE:Lcom/sonymobile/scan3d/storageservice/content/-$$Lambda$TransferTask$Jjwa_N1v8-S9r0PfJNeITSIm8Qs;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/sonymobile/scan3d/storageservice/content/-$$Lambda$TransferTask$Jjwa_N1v8-S9r0PfJNeITSIm8Qs;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/storageservice/content/-$$Lambda$TransferTask$Jjwa_N1v8-S9r0PfJNeITSIm8Qs;-><init>()V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/content/-$$Lambda$TransferTask$Jjwa_N1v8-S9r0PfJNeITSIm8Qs;->INSTANCE:Lcom/sonymobile/scan3d/storageservice/content/-$$Lambda$TransferTask$Jjwa_N1v8-S9r0PfJNeITSIm8Qs;

    return-void
.end method

.method private synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    check-cast p1, Landroid/app/job/JobWorkItem;

    check-cast p2, Landroid/app/job/JobWorkItem;

    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/storageservice/content/TransferTask;->lambda$transferAll$0(Landroid/app/job/JobWorkItem;Landroid/app/job/JobWorkItem;)I

    move-result p1

    return p1
.end method
