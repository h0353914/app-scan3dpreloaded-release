.class public final synthetic Lcom/sonymobile/scan3d/sfmc/-$$Lambda$jk0qiEwRNqJQx6NXvC6R7CBs7Cc;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$MimickingEngineFactory;


# static fields
.field public static final synthetic INSTANCE:Lcom/sonymobile/scan3d/sfmc/-$$Lambda$jk0qiEwRNqJQx6NXvC6R7CBs7Cc;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$jk0qiEwRNqJQx6NXvC6R7CBs7Cc;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$jk0qiEwRNqJQx6NXvC6R7CBs7Cc;-><init>()V

    sput-object v0, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$jk0qiEwRNqJQx6NXvC6R7CBs7Cc;->INSTANCE:Lcom/sonymobile/scan3d/sfmc/-$$Lambda$jk0qiEwRNqJQx6NXvC6R7CBs7Cc;

    return-void
.end method

.method private synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final newMimickingEngine()Lcom/sonymobile/scan3d/sfmc/MimickingEngine;
    .locals 1

    new-instance v0, Lcom/sonymobile/scan3d/sfmc/Sfmc;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/sfmc/Sfmc;-><init>()V

    check-cast v0, Lcom/sonymobile/scan3d/sfmc/MimickingEngine;

    return-object v0
.end method
