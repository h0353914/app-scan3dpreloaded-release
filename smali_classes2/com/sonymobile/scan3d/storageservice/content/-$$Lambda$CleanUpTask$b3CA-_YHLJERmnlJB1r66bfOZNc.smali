.class public final synthetic Lcom/sonymobile/scan3d/storageservice/content/-$$Lambda$CleanUpTask$b3CA-_YHLJERmnlJB1r66bfOZNc;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/util/Comparator;


# static fields
.field public static final synthetic INSTANCE:Lcom/sonymobile/scan3d/storageservice/content/-$$Lambda$CleanUpTask$b3CA-_YHLJERmnlJB1r66bfOZNc;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/sonymobile/scan3d/storageservice/content/-$$Lambda$CleanUpTask$b3CA-_YHLJERmnlJB1r66bfOZNc;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/storageservice/content/-$$Lambda$CleanUpTask$b3CA-_YHLJERmnlJB1r66bfOZNc;-><init>()V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/content/-$$Lambda$CleanUpTask$b3CA-_YHLJERmnlJB1r66bfOZNc;->INSTANCE:Lcom/sonymobile/scan3d/storageservice/content/-$$Lambda$CleanUpTask$b3CA-_YHLJERmnlJB1r66bfOZNc;

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

    check-cast p1, Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask$Candidate;

    check-cast p2, Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask$Candidate;

    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask;->lambda$doWork$0(Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask$Candidate;Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask$Candidate;)I

    move-result p1

    return p1
.end method
