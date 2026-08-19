.class public Lcom/sonymobile/scan3d/storageservice/ui/fragment/OnBoardingItemFragment;
.super Landroidx/fragment/app/Fragment;
.source "OnBoardingItemFragment.java"


# static fields
.field private static final KEY_CONTENT:Ljava/lang/String; = "content"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    return-void
.end method

.method public static newInstance(Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;)Lcom/sonymobile/scan3d/storageservice/ui/fragment/OnBoardingItemFragment;
    .locals 2

    .line 40
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "content"

    .line 41
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;->name()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    new-instance p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/OnBoardingItemFragment;

    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/OnBoardingItemFragment;-><init>()V

    .line 44
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/OnBoardingItemFragment;->setArguments(Landroid/os/Bundle;)V

    return-object p0
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

    const p3, 0x7f0c003b

    const/4 v0, 0x0

    .line 54
    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 56
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/OnBoardingItemFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p2

    const-string p3, "content"

    invoke-virtual {p2, p3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;->valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;

    move-result-object p2

    const p3, 0x7f0900f1

    .line 58
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/widget/ImageView;

    .line 59
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;->getImage()I

    move-result v0

    invoke-virtual {p3, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    const p3, 0x7f0901f0

    .line 61
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/widget/TextView;

    .line 62
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;->getTitle()I

    move-result v0

    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(I)V

    const p3, 0x7f0900a3

    .line 64
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/widget/TextView;

    .line 65
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity$OnBoarding;->getDescription()I

    move-result p2

    invoke-virtual {p3, p2}, Landroid/widget/TextView;->setText(I)V

    return-object p1
.end method
