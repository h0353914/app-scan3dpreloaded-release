.class public Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;
.super Lcom/sonymobile/scan3d/storageservice/authentication/AuthActivity;
.source "PrivacyActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity$PersonalDataAdapter;
    }
.end annotation


# static fields
.field public static final EXTRA_PRIVACY:Ljava/lang/String; = "com.sonymobile.scan3d.extras.PRIVACY"

.field public static final EXTRA_VIEW:Ljava/lang/String; = "com.sonymobile.scan3d.extras.VIEW_PRIVACY"


# instance fields
.field private mDescription:Landroid/widget/TextView;

.field private mDisclaimer:Landroid/widget/TextView;

.field private mTitle:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 66
    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/storageservice/authentication/AuthActivity;-><init>(Z)V

    return-void
.end method

.method public constructor <init>(Z)V
    .locals 0

    .line 75
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/AuthActivity;-><init>(Z)V

    return-void
.end method

.method private createClickableText(Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;)Landroid/text/SpannableStringBuilder;
    .locals 6

    .line 181
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity$PersonalDataAdapter;

    invoke-direct {v0, p0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity$PersonalDataAdapter;-><init>(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;)V

    .line 183
    new-instance v1, Lcom/sonymobile/scan3d/storageservice/authentication/-$$Lambda$PrivacyActivity$Zfvq9dKg6l5L-eqautrmvd7quSc;

    invoke-direct {v1, p0, v0}, Lcom/sonymobile/scan3d/storageservice/authentication/-$$Lambda$PrivacyActivity$Zfvq9dKg6l5L-eqautrmvd7quSc;-><init>(Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;Landroid/widget/ListAdapter;)V

    .line 191
    invoke-static {}, Lcom/sonymobile/scan3d/utils/LinkUtil;->isUSVariant()Z

    move-result v0

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x2

    if-eqz v0, :cond_0

    .line 193
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->getDisclaimer()I

    move-result p1

    const/4 v5, 0x3

    new-array v5, v5, [Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;

    aput-object v1, v5, v3

    new-instance v1, Lcom/sonymobile/scan3d/storageservice/authentication/-$$Lambda$PrivacyActivity$n72hSIX47_3YtBkSH2giaebYdEs;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/storageservice/authentication/-$$Lambda$PrivacyActivity$n72hSIX47_3YtBkSH2giaebYdEs;-><init>(Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;)V

    aput-object v1, v5, v2

    new-instance v1, Lcom/sonymobile/scan3d/storageservice/authentication/-$$Lambda$PrivacyActivity$mBL_HBy5dfOv0j1rZVEuifNOPnQ;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/storageservice/authentication/-$$Lambda$PrivacyActivity$mBL_HBy5dfOv0j1rZVEuifNOPnQ;-><init>(Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;)V

    aput-object v1, v5, v4

    invoke-static {v0, p1, v5}, Lcom/sonymobile/scan3d/utils/LinkUtil;->createClickableLink(Landroid/content/Context;I[Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;)Landroid/text/SpannableStringBuilder;

    move-result-object p1

    goto :goto_0

    .line 203
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->getDisclaimer()I

    move-result p1

    new-array v4, v4, [Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;

    aput-object v1, v4, v3

    new-instance v1, Lcom/sonymobile/scan3d/storageservice/authentication/-$$Lambda$PrivacyActivity$uuEX-bcKAm55xyuqUFWt4OSr2vA;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/storageservice/authentication/-$$Lambda$PrivacyActivity$uuEX-bcKAm55xyuqUFWt4OSr2vA;-><init>(Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;)V

    aput-object v1, v4, v2

    invoke-static {v0, p1, v4}, Lcom/sonymobile/scan3d/utils/LinkUtil;->createClickableLink(Landroid/content/Context;I[Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;)Landroid/text/SpannableStringBuilder;

    move-result-object p1

    :goto_0
    return-object p1
.end method

.method public static synthetic lambda$createClickableText$3(Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;Landroid/widget/ListAdapter;Landroid/view/View;)V
    .locals 1

    .line 185
    new-instance p2, Landroid/app/AlertDialog$Builder;

    invoke-direct {p2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v0, 0x7f1001ab

    .line 186
    invoke-virtual {p2, v0}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    const/4 v0, 0x0

    invoke-virtual {p2, p1, v0}, Landroid/app/AlertDialog$Builder;->setAdapter(Landroid/widget/ListAdapter;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    sget-object p2, Lcom/sonymobile/scan3d/storageservice/authentication/-$$Lambda$PrivacyActivity$HqhWYcY4fCzW3Ak_mPYNFGuK10Y;->INSTANCE:Lcom/sonymobile/scan3d/storageservice/authentication/-$$Lambda$PrivacyActivity$HqhWYcY4fCzW3Ak_mPYNFGuK10Y;

    const v0, 0x104000a

    .line 187
    invoke-virtual {p1, v0, p2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    .line 188
    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    .line 189
    invoke-virtual {p1}, Landroid/app/AlertDialog;->show()V

    return-void
.end method

.method public static synthetic lambda$createClickableText$4(Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;Landroid/view/View;)V
    .locals 0

    const p1, 0x7f10034c

    .line 196
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;->launchUrl(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic lambda$createClickableText$5(Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;Landroid/view/View;)V
    .locals 0

    const p1, 0x7f10034a

    .line 199
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;->launchUrl(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic lambda$createClickableText$6(Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;Landroid/view/View;)V
    .locals 0

    const p1, 0x7f100028

    .line 206
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;->launchUrl(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$null$2(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 187
    invoke-interface {p0}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method

.method public static synthetic lambda$onCreate$0(Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;Landroid/view/View;)V
    .locals 1

    const/4 p1, 0x1

    const/4 v0, 0x0

    .line 128
    invoke-virtual {p0, p1, v0}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;->onResultReceived(ZLandroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic lambda$onCreate$1(Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;Landroid/view/View;)V
    .locals 1

    const/4 p1, 0x0

    const/4 v0, 0x0

    .line 136
    invoke-virtual {p0, p1, v0}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;->onResultReceived(ZLandroid/os/Bundle;)V

    return-void
.end method

.method private launchUrl(Ljava/lang/String;)V
    .locals 2

    .line 218
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 219
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 220
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method private setupPrivacyStatement(Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;)V
    .locals 2

    .line 168
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;->mTitle:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->getTitle()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 169
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;->mDescription:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->getDescription()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 170
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;->createClickableText(Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;)Landroid/text/SpannableStringBuilder;

    move-result-object p1

    .line 171
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;->mDisclaimer:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 172
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;->mDisclaimer:Landroid/widget/TextView;

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    return-void
.end method


# virtual methods
.method public getLayoutResource()I
    .locals 1

    const v0, 0x7f0c00a5

    return v0
.end method

.method public bridge synthetic onBackPressed()V
    .locals 0

    .line 35
    invoke-super {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/AuthActivity;->onBackPressed()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 113
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/AuthActivity;->onCreate(Landroid/os/Bundle;)V

    .line 114
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;->getLayoutResource()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;->setContentView(I)V

    .line 116
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "com.sonymobile.scan3d.extras.VIEW_PRIVACY"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p1

    const v0, 0x7f0901f3

    .line 118
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;->mTitle:Landroid/widget/TextView;

    const v0, 0x7f0900a4

    .line 119
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;->mDescription:Landroid/widget/TextView;

    const v0, 0x7f0900b6

    .line 120
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;->mDisclaimer:Landroid/widget/TextView;

    const v0, 0x7f09007e

    .line 122
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    if-eqz v0, :cond_1

    if-eqz p1, :cond_0

    const v1, 0x104000a

    .line 125
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(I)V

    .line 128
    :cond_0
    new-instance v1, Lcom/sonymobile/scan3d/storageservice/authentication/-$$Lambda$PrivacyActivity$mKfPXS6kFnn6uAkJyejUk1IpsXw;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/storageservice/authentication/-$$Lambda$PrivacyActivity$mKfPXS6kFnn6uAkJyejUk1IpsXw;-><init>(Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_1
    const v0, 0x7f090076

    .line 130
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    if-eqz v0, :cond_3

    if-eqz p1, :cond_2

    const/16 p1, 0x8

    .line 134
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_0

    .line 136
    :cond_2
    new-instance p1, Lcom/sonymobile/scan3d/storageservice/authentication/-$$Lambda$PrivacyActivity$eSgQbKOjxqVUbP-DLds-XHmI0aA;

    invoke-direct {p1, p0}, Lcom/sonymobile/scan3d/storageservice/authentication/-$$Lambda$PrivacyActivity$eSgQbKOjxqVUbP-DLds-XHmI0aA;-><init>(Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 140
    :cond_3
    :goto_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "com.sonymobile.scan3d.extras.PRIVACY"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;

    if-nez p1, :cond_4

    .line 143
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicies;->getSigninPrivacy()Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;

    move-result-object p1

    .line 145
    :cond_4
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;->setupPrivacyStatement(Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;)V

    return-void
.end method
