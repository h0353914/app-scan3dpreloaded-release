.class final enum Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType$2;
.super Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;
.source "SortType.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4008
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .locals 1

    const/4 v0, 0x0

    .line 31
    invoke-direct {p0, p1, p2, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;-><init>(Ljava/lang/String;ILcom/sonymobile/scan3d/storageservice/ui/gallery/SortType$1;)V

    return-void
.end method


# virtual methods
.method public getLabelId()I
    .locals 1

    const v0, 0x7f10016c

    return v0
.end method

.method public getSqlExpression()Ljava/lang/String;
    .locals 1

    const-string v0, "name COLLATE NOCASE ASC, created DESC"

    return-object v0
.end method
