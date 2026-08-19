.class public Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/YoutubeTipFragment;
.super Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/TipFragment;
.source "YoutubeTipFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/YoutubeTipFragment$AsyncImageSetter;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "com.sonymobile.scan3d.storageservice.ui.gallery.wizard.item.YoutubeTipFragment"

.field private static final YOUTUBE_IMAGE:Ljava/lang/String; = "hqdefault.jpg"

.field private static final YOUTUBE_IMAGE_URL:Ljava/lang/String; = "https://img.youtube.com/vi"

.field private static final YOUTUBE_VIDEO_PARAM:Ljava/lang/String; = "v"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/TipFragment;-><init>()V

    return-void
.end method

.method private static getYoutubeImagePreview(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 132
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    const-string v0, "v"

    .line 133
    invoke-virtual {p0, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "https://img.youtube.com/vi"

    .line 135
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    .line 136
    invoke-virtual {v0, p0}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    const-string p0, "hqdefault.jpg"

    .line 137
    invoke-virtual {v0, p0}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 138
    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic lambda$onViewCreated$0(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/YoutubeTipFragment;Landroid/net/Uri;Landroid/view/View;)V
    .locals 1

    .line 111
    new-instance p2, Landroid/content/Intent;

    const-string v0, "android.intent.action.VIEW"

    invoke-direct {p2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 112
    invoke-virtual {p2, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 114
    :try_start_0
    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/YoutubeTipFragment;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 116
    :catch_0
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/YoutubeTipFragment;->TAG:Ljava/lang/String;

    const-string p2, "Couldn\'t find Youtube app or Browser."

    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public static newInstance(Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;)Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/YoutubeTipFragment;
    .locals 3

    .line 92
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/YoutubeTipFragment;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/YoutubeTipFragment;-><init>()V

    .line 93
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "tip"

    .line 94
    invoke-virtual {v1, v2, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 95
    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/YoutubeTipFragment;->setArguments(Landroid/os/Bundle;)V

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

    const p3, 0x7f0c00c0

    const/4 v0, 0x0

    .line 102
    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;)V
    .locals 2

    .line 107
    invoke-virtual {p3}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->getYoutubeUrl()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    const v0, 0x7f09022c

    .line 108
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    const v1, 0x7f09022b

    .line 109
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .line 110
    new-instance v1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/-$$Lambda$YoutubeTipFragment$DGPIgdluAx4p37eTDUeh5SP0G4o;

    invoke-direct {v1, p0, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/-$$Lambda$YoutubeTipFragment$DGPIgdluAx4p37eTDUeh5SP0G4o;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/YoutubeTipFragment;Landroid/net/Uri;)V

    invoke-virtual {p1, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 120
    new-instance p2, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/YoutubeTipFragment$AsyncImageSetter;

    invoke-direct {p2, v0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/YoutubeTipFragment$AsyncImageSetter;-><init>(Landroid/widget/ImageView;Landroid/view/View;)V

    .line 121
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/YoutubeTipFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p3}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->getYoutubeUrl()Ljava/lang/String;

    move-result-object p3

    invoke-static {p3}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/YoutubeTipFragment;->getYoutubeImagePreview(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    const/4 v0, 0x0

    invoke-static {p1, p3, v0, p2}, Lcom/sonymobile/scan3d/storageservice/network/RestApi;->getBitmapAsync(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/sonymobile/scan3d/storageservice/network/AsyncViewSetter;)V

    return-void
.end method
