.class Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity$PersonalDataAdapter;
.super Landroid/widget/ArrayAdapter;
.source "PrivacyActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PersonalDataAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter<",
        "Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy$PersonalData;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;)V
    .locals 1

    .line 90
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->getPersonalData()Ljava/util/List;

    move-result-object p2

    const v0, 0x7f0c003c

    invoke-direct {p0, p1, v0, p2}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    return-void
.end method


# virtual methods
.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2
    .param p2    # Landroid/view/View;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    if-nez p2, :cond_0

    .line 97
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity$PersonalDataAdapter;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v0, 0x7f0c003c

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    :cond_0
    const p3, 0x7f0900f3

    .line 101
    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/widget/ImageView;

    const v0, 0x7f090204

    .line 102
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const/4 v1, 0x0

    .line 103
    invoke-virtual {p2, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 104
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity$PersonalDataAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy$PersonalData;

    .line 105
    iget v1, p1, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy$PersonalData;->icon:I

    invoke-virtual {p3, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 106
    iget p1, p1, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy$PersonalData;->text:I

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    return-object p2
.end method
