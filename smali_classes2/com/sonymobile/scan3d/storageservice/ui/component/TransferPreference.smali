.class public Lcom/sonymobile/scan3d/storageservice/ui/component/TransferPreference;
.super Landroidx/preference/Preference;
.source "TransferPreference.java"


# instance fields
.field private mIndicator:Lcom/sonymobile/scan3d/storageservice/ui/component/UploadIndicator;

.field private mIsTransferring:Z

.field private mRotation:F

.field private mShowTransferIcon:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 48
    invoke-direct {p0, p1, p2}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const p1, 0x7f0c00c2

    .line 49
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/component/TransferPreference;->setWidgetLayoutResource(I)V

    const/4 p1, 0x0

    .line 50
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/component/TransferPreference;->setSelectable(Z)V

    return-void
.end method


# virtual methods
.method protected notifyChanged()V
    .locals 2

    .line 55
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/TransferPreference;->mIndicator:Lcom/sonymobile/scan3d/storageservice/ui/component/UploadIndicator;

    if-eqz v0, :cond_1

    .line 56
    iget-boolean v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/TransferPreference;->mShowTransferIcon:Z

    if-eqz v1, :cond_0

    .line 57
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/component/UploadIndicator;->getRotation()F

    move-result v0

    iput v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/TransferPreference;->mRotation:F

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 59
    iput v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/TransferPreference;->mRotation:F

    .line 62
    :goto_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/TransferPreference;->mIndicator:Lcom/sonymobile/scan3d/storageservice/ui/component/UploadIndicator;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/component/UploadIndicator;->cancelAnimation()V

    .line 64
    :cond_1
    invoke-super {p0}, Landroidx/preference/Preference;->notifyChanged()V

    return-void
.end method

.method public onBindViewHolder(Landroidx/preference/PreferenceViewHolder;)V
    .locals 3

    .line 95
    invoke-super {p0, p1}, Landroidx/preference/Preference;->onBindViewHolder(Landroidx/preference/PreferenceViewHolder;)V

    const v0, 0x7f0900f9

    .line 96
    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/sonymobile/scan3d/storageservice/ui/component/UploadIndicator;

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/TransferPreference;->mIndicator:Lcom/sonymobile/scan3d/storageservice/ui/component/UploadIndicator;

    .line 97
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/TransferPreference;->mIndicator:Lcom/sonymobile/scan3d/storageservice/ui/component/UploadIndicator;

    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/TransferPreference;->mShowTransferIcon:Z

    iget-boolean v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/TransferPreference;->mIsTransferring:Z

    iget v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/TransferPreference;->mRotation:F

    invoke-virtual {p1, v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/ui/component/UploadIndicator;->setRefreshing(ZZF)V

    return-void
.end method

.method public setTransferStatus(ZII)V
    .locals 6

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eq p3, p2, :cond_0

    move v2, v0

    goto :goto_0

    :cond_0
    move v2, v1

    :goto_0
    if-eqz v2, :cond_1

    .line 78
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/component/TransferPreference;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0800d4

    .line 79
    invoke-virtual {p0, v4}, Lcom/sonymobile/scan3d/storageservice/ui/component/TransferPreference;->setIcon(I)V

    const v4, 0x7f100074

    const/4 v5, 0x2

    .line 80
    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    aput-object p2, v5, v1

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    aput-object p2, v5, v0

    invoke-virtual {v3, v4, v5}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/storageservice/ui/component/TransferPreference;->setTitle(Ljava/lang/CharSequence;)V

    goto :goto_1

    :cond_1
    const p2, 0x7f0800d3

    .line 82
    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/storageservice/ui/component/TransferPreference;->setIcon(I)V

    const p2, 0x7f10006f

    .line 83
    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/storageservice/ui/component/TransferPreference;->setTitle(I)V

    .line 86
    :goto_1
    iget-boolean p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/TransferPreference;->mIsTransferring:Z

    if-ne p1, p2, :cond_2

    iget-boolean p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/TransferPreference;->mShowTransferIcon:Z

    if-eq v2, p2, :cond_3

    .line 87
    :cond_2
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/TransferPreference;->mIsTransferring:Z

    .line 88
    iput-boolean v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/TransferPreference;->mShowTransferIcon:Z

    .line 89
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/component/TransferPreference;->notifyChanged()V

    :cond_3
    return-void
.end method
