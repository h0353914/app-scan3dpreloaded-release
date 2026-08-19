.class public final Lcom/sonymobile/scan3d/storageservice/ui/tips/TipParser$TipPair;
.super Ljava/lang/Object;
.source "TipParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/ui/tips/TipParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "TipPair"
.end annotation


# instance fields
.field private final mCategory:Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;

.field private final mTip:Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;)V
    .locals 0

    .line 102
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 103
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipParser$TipPair;->mCategory:Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;

    .line 104
    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipParser$TipPair;->mTip:Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;

    return-void
.end method


# virtual methods
.method public getCategory()Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;
    .locals 1

    .line 113
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipParser$TipPair;->mCategory:Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;

    return-object v0
.end method

.method public getTip()Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;
    .locals 1

    .line 122
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipParser$TipPair;->mTip:Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;

    return-object v0
.end method
