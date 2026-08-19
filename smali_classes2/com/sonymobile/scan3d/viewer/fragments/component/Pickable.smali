.class public Lcom/sonymobile/scan3d/viewer/fragments/component/Pickable;
.super Ljava/lang/Object;
.source "Pickable.java"


# instance fields
.field private final mDescriptionResourceId:I
    .annotation build Landroidx/annotation/StringRes;
    .end annotation
.end field

.field private final mIdentifier:Ljava/lang/Object;

.field private final mImageResourceId:I
    .annotation build Landroidx/annotation/DrawableRes;
    .end annotation
.end field

.field private final mNameResourceId:I
    .annotation build Landroidx/annotation/StringRes;
    .end annotation
.end field

.field private mWhichPicker:I


# direct methods
.method public constructor <init>(Ljava/lang/Object;II)V
    .locals 1
    .param p2    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param
    .param p3    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 70
    invoke-direct {p0, p1, p2, v0, p3}, Lcom/sonymobile/scan3d/viewer/fragments/component/Pickable;-><init>(Ljava/lang/Object;III)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;III)V
    .locals 0
    .param p2    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param
    .param p3    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param
    .param p4    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/Pickable;->mIdentifier:Ljava/lang/Object;

    .line 57
    iput p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/Pickable;->mImageResourceId:I

    .line 58
    iput p4, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/Pickable;->mDescriptionResourceId:I

    .line 59
    iput p3, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/Pickable;->mNameResourceId:I

    return-void
.end method


# virtual methods
.method public getDescriptionResourceId()I
    .locals 1
    .annotation build Landroidx/annotation/StringRes;
    .end annotation

    .line 110
    iget v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/Pickable;->mDescriptionResourceId:I

    return v0
.end method

.method public getIdentifier()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()TT;"
        }
    .end annotation

    .line 90
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/Pickable;->mIdentifier:Ljava/lang/Object;

    return-object v0
.end method

.method public getImageResource()I
    .locals 1
    .annotation build Landroidx/annotation/DrawableRes;
    .end annotation

    .line 100
    iget v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/Pickable;->mImageResourceId:I

    return v0
.end method

.method public getName()I
    .locals 1
    .annotation build Landroidx/annotation/StringRes;
    .end annotation

    .line 80
    iget v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/Pickable;->mNameResourceId:I

    return v0
.end method

.method public getWhichPicker()I
    .locals 1

    .line 119
    iget v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/Pickable;->mWhichPicker:I

    return v0
.end method

.method hasName()Z
    .locals 1

    .line 137
    iget v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/Pickable;->mNameResourceId:I

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method setWhichPicker(I)V
    .locals 0

    .line 128
    iput p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/Pickable;->mWhichPicker:I

    return-void
.end method
