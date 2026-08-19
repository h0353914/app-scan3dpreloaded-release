.class public Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/TipFragment;
.super Landroidx/fragment/app/Fragment;
.source "TipFragment.java"


# static fields
.field static final KEY_TIP:Ljava/lang/String; = "tip"

.field private static final TAG:Ljava/lang/String; = "com.sonymobile.scan3d.storageservice.ui.gallery.wizard.item.TipFragment"


# instance fields
.field protected mZipResourceFile:Lcom/android/vending/expansion/zipfile/ZipResourceFile;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    return-void
.end method

.method public static synthetic lambda$onViewCreated$0(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/TipFragment;Lcom/sonymobile/scan3d/storageservice/ui/tips/Video;Landroid/view/View;)V
    .locals 2

    .line 101
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Video;->getUriResourceId()I

    move-result p2

    if-eqz p2, :cond_0

    .line 102
    new-instance p2, Landroid/content/Intent;

    const-string v0, "android.intent.action.VIEW"

    invoke-direct {p2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 103
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Video;->getUriResourceId()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/TipFragment;->getString(I)Ljava/lang/String;

    move-result-object p1

    .line 104
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    goto :goto_0

    .line 106
    :cond_0
    new-instance p2, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/TipFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const-class v1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;

    invoke-direct {p2, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v0, "extra_video"

    .line 107
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Video;->getVideoResourceId()I

    move-result p1

    invoke-virtual {p2, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 110
    :goto_0
    :try_start_0
    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/TipFragment;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 112
    :catch_0
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/TipFragment;->TAG:Ljava/lang/String;

    const-string p2, "Couldn\'t find Youtube app or Browser."

    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    :goto_1
    return-void
.end method

.method public static newInstance(Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;)Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/TipFragment;
    .locals 1

    const/4 v0, 0x0

    .line 65
    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/TipFragment;->newInstance(Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;Lcom/android/vending/expansion/zipfile/ZipResourceFile;)Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/TipFragment;

    move-result-object p0

    return-object p0
.end method

.method public static newInstance(Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;Lcom/android/vending/expansion/zipfile/ZipResourceFile;)Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/TipFragment;
    .locals 3

    .line 56
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/TipFragment;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/TipFragment;-><init>()V

    .line 57
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "tip"

    .line 58
    invoke-virtual {v1, v2, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 59
    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/TipFragment;->setArguments(Landroid/os/Bundle;)V

    .line 60
    iput-object p1, v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/TipFragment;->mZipResourceFile:Lcom/android/vending/expansion/zipfile/ZipResourceFile;

    return-object v0
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1
    .param p1    # Landroid/view/LayoutInflater;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const p3, 0x7f0c00be

    const/4 v0, 0x0

    .line 72
    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 4
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 77
    invoke-super {p0, p1, p2}, Landroidx/fragment/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 78
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/TipFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "tip"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;

    if-eqz v0, :cond_3

    .line 81
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->getTitle()I

    move-result v1

    const/4 v2, 0x0

    if-lez v1, :cond_0

    const v3, 0x7f0901f3

    .line 83
    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 84
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 85
    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(I)V

    .line 88
    :cond_0
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->getDescription()I

    move-result v1

    if-lez v1, :cond_1

    const v3, 0x7f0900a4

    .line 90
    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 91
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 92
    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(I)V

    .line 94
    :cond_1
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->getAdditionalVideo()Lcom/sonymobile/scan3d/storageservice/ui/tips/Video;

    move-result-object v1

    if-eqz v1, :cond_2

    const v3, 0x7f090048

    .line 96
    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 97
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 98
    invoke-virtual {v1}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Video;->getText()I

    move-result v2

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(I)V

    .line 99
    new-instance v2, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/-$$Lambda$TipFragment$pIWV1ECzkz7PziZCyIoSO0qqRek;

    invoke-direct {v2, p0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/-$$Lambda$TipFragment$pIWV1ECzkz7PziZCyIoSO0qqRek;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/TipFragment;Lcom/sonymobile/scan3d/storageservice/ui/tips/Video;)V

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 116
    :cond_2
    invoke-virtual {p0, p1, p2, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/TipFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;)V

    :cond_3
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;)V
    .locals 0

    return-void
.end method
