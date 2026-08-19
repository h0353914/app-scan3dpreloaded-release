.class public Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment;
.super Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/TipFragment;
.source "SequenceTipFragment.java"

# interfaces
.implements Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity$PageListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment$ClipSequencePlayersController;
    }
.end annotation


# static fields
.field protected static final KEY_TIP_INDEX:Ljava/lang/String; = "tip_index"

.field protected static final KEY_TIP_SIZE:Ljava/lang/String; = "size"

.field protected static final KEY_TUTORIAL_PASSED:Ljava/lang/String; = "tutorial_passed"

.field private static final TAG:Ljava/lang/String; = "com.sonymobile.scan3d.storageservice.ui.gallery.wizard.item.SequenceTipFragment"


# instance fields
.field private mController:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment$ClipSequencePlayersController;

.field private mOwner:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/VideoTipFragmentOwner;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 32
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/TipFragment;-><init>()V

    .line 54
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment$ClipSequencePlayersController;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment$ClipSequencePlayersController;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment$1;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment;->mController:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment$ClipSequencePlayersController;

    return-void
.end method

.method static synthetic access$100()Ljava/lang/String;
    .locals 1

    .line 32
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method private isLastPage()Z
    .locals 5

    .line 159
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Configuration;->getLayoutDirection()I

    move-result v0

    .line 160
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "tip_index"

    const/4 v3, 0x0

    .line 162
    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v2

    const-string v4, "size"

    .line 163
    invoke-virtual {v1, v4, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    const/4 v4, 0x1

    if-ne v0, v4, :cond_0

    if-nez v2, :cond_1

    goto :goto_0

    :cond_0
    sub-int/2addr v1, v4

    if-ne v2, v1, :cond_1

    :goto_0
    move v3, v4

    :cond_1
    return v3
.end method

.method private isSingleTip()Z
    .locals 3

    .line 173
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "size"

    const/4 v2, 0x0

    .line 174
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    return v1
.end method

.method public static newInstance(Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;ZIILcom/android/vending/expansion/zipfile/ZipResourceFile;)Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment;
    .locals 3

    .line 68
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment;-><init>()V

    .line 69
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "tip"

    .line 70
    invoke-virtual {v1, v2, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string p0, "tutorial_passed"

    .line 71
    invoke-virtual {v1, p0, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string p0, "tip_index"

    .line 72
    invoke-virtual {v1, p0, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p0, "size"

    .line 73
    invoke-virtual {v1, p0, p3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 74
    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment;->setArguments(Landroid/os/Bundle;)V

    .line 75
    iput-object p4, v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment;->mZipResourceFile:Lcom/android/vending/expansion/zipfile/ZipResourceFile;

    return-object v0
.end method


# virtual methods
.method public onAttach(Landroid/content/Context;)V
    .locals 1

    .line 81
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/TipFragment;->onAttach(Landroid/content/Context;)V

    .line 82
    instance-of v0, p1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/VideoTipFragmentOwner;

    if-eqz v0, :cond_0

    .line 85
    check-cast p1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/VideoTipFragmentOwner;

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment;->mOwner:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/VideoTipFragmentOwner;

    return-void

    .line 83
    :cond_0
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "Activity must implement VideoTipFragmentOwner"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const p3, 0x7f0c005c

    const/4 v0, 0x0

    .line 127
    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onDestroyView()V
    .locals 1

    .line 149
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment;->mController:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment$ClipSequencePlayersController;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment$ClipSequencePlayersController;->release()V

    .line 150
    invoke-super {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/TipFragment;->onDestroyView()V

    return-void
.end method

.method public onPageSelected(Z)V
    .locals 1

    .line 132
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment;->mController:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment$ClipSequencePlayersController;

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment$ClipSequencePlayersController;->setPageSelected(Z)V

    return-void
.end method

.method public onPause()V
    .locals 2

    .line 143
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment;->mController:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment$ClipSequencePlayersController;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment$ClipSequencePlayersController;->setResumed(Z)V

    .line 144
    invoke-super {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/TipFragment;->onPause()V

    return-void
.end method

.method public onResume()V
    .locals 2

    .line 137
    invoke-super {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/TipFragment;->onResume()V

    .line 138
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment;->mController:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment$ClipSequencePlayersController;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment$ClipSequencePlayersController;->setResumed(Z)V

    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;)V
    .locals 8

    .line 90
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p2

    .line 95
    invoke-virtual {p3}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->hasTextRepresentations()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const v0, 0x7f0900fb

    .line 97
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    :cond_0
    const v0, 0x7f090070

    .line 100
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :goto_0
    const v0, 0x7f090080

    .line 103
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 104
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment;->isLastPage()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 105
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    const-string v0, "tutorial_passed"

    .line 107
    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_1

    .line 112
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment;->isSingleTip()Z

    move-result p2

    if-nez p2, :cond_1

    const p2, 0x7f0900a4

    .line 113
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    const v0, 0x7f100246

    .line 114
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(I)V

    .line 119
    :cond_1
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment;->mController:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment$ClipSequencePlayersController;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    const p2, 0x7f0901e7

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    move-object v4, p2

    check-cast v4, Landroid/view/TextureView;

    const p2, 0x7f090071

    .line 120
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    move-object v5, p1

    check-cast v5, Landroid/view/ViewGroup;

    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment;->mOwner:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/VideoTipFragmentOwner;

    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/VideoTipFragmentOwner;->getVideoExecutor()Ljava/util/concurrent/Executor;

    move-result-object v6

    iget-object v7, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment;->mZipResourceFile:Lcom/android/vending/expansion/zipfile/ZipResourceFile;

    move-object v3, p3

    .line 119
    invoke-virtual/range {v1 .. v7}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment$ClipSequencePlayersController;->init(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;Landroid/view/TextureView;Landroid/view/ViewGroup;Ljava/util/concurrent/Executor;Lcom/android/vending/expansion/zipfile/ZipResourceFile;)V

    return-void
.end method
