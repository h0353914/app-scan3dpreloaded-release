.class public Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask$ActionResult;
.super Ljava/lang/Object;
.source "ActionTask.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ActionResult"
.end annotation


# instance fields
.field private mResult:Z

.field private mUid:Ljava/lang/String;


# direct methods
.method public constructor <init>(ZLjava/lang/String;)V
    .locals 0

    .line 105
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 106
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask$ActionResult;->mResult:Z

    .line 107
    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask$ActionResult;->mUid:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getUid()Ljava/lang/String;
    .locals 1

    .line 125
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask$ActionResult;->mUid:Ljava/lang/String;

    return-object v0
.end method

.method public success()Z
    .locals 1

    .line 116
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask$ActionResult;->mResult:Z

    return v0
.end method
