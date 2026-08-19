.class public Lcom/sonymobile/scan3d/viewer/fragments/NoLocalPrintersFragment;
.super Landroidx/fragment/app/Fragment;
.source "NoLocalPrintersFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    return-void
.end method

.method public static synthetic lambda$onCreateView$0(Lcom/sonymobile/scan3d/viewer/fragments/NoLocalPrintersFragment;Landroid/view/View;)V
    .locals 1

    .line 46
    new-instance p1, Landroid/content/Intent;

    const-string v0, "android.intent.action.VIEW"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const v0, 0x7f100129

    .line 47
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/NoLocalPrintersFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 48
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/NoLocalPrintersFragment;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public static synthetic lambda$onCreateView$1(Lcom/sonymobile/scan3d/viewer/fragments/NoLocalPrintersFragment;Landroid/view/View;)V
    .locals 1

    .line 54
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/NoLocalPrintersFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p1

    .line 55
    invoke-static {}, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->newInstance()Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;

    move-result-object v0

    .line 54
    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint;->showFragment(Landroidx/fragment/app/FragmentManager;Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;)V

    return-void
.end method

.method static synthetic lambda$onCreateView$2(Landroid/widget/ScrollView;)V
    .locals 1

    const/16 v0, 0x82

    .line 59
    invoke-virtual {p0, v0}, Landroid/widget/ScrollView;->fullScroll(I)Z

    return-void
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 4
    .param p1    # Landroid/view/LayoutInflater;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const/4 p3, 0x0

    const v0, 0x7f0c006c

    .line 36
    invoke-virtual {p1, v0, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 38
    sget-object p2, Ljava/util/Locale;->JAPANESE:Ljava/util/Locale;

    invoke-virtual {p2}, Ljava/util/Locale;->getISO3Language()Ljava/lang/String;

    move-result-object p2

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getISO3Language()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    const v0, 0x7f0900a4

    if-eqz p2, :cond_0

    .line 39
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    const/4 v1, 0x4

    invoke-virtual {p2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 41
    :cond_0
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    .line 43
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/NoLocalPrintersFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f100214

    const/4 v2, 0x1

    new-array v2, v2, [Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;

    new-instance v3, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$NoLocalPrintersFragment$nvX8EoZgP40e2FCUGNt8HJcXO_s;

    invoke-direct {v3, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$NoLocalPrintersFragment$nvX8EoZgP40e2FCUGNt8HJcXO_s;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/NoLocalPrintersFragment;)V

    aput-object v3, v2, p3

    invoke-static {v0, v1, v2}, Lcom/sonymobile/scan3d/utils/LinkUtil;->createClickableLink(Landroid/content/Context;I[Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;)Landroid/text/SpannableStringBuilder;

    move-result-object p3

    .line 50
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    const p2, 0x7f09006d

    .line 53
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    new-instance p3, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$NoLocalPrintersFragment$e_MTCshYu5f5q2qS6PUcKgTt2hU;

    invoke-direct {p3, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$NoLocalPrintersFragment$e_MTCshYu5f5q2qS6PUcKgTt2hU;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/NoLocalPrintersFragment;)V

    invoke-virtual {p2, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p2, 0x7f090184

    .line 58
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ScrollView;

    .line 59
    new-instance p3, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$NoLocalPrintersFragment$NB4p4TKnISt5MJCsLvjZCTYHV4I;

    invoke-direct {p3, p2}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$NoLocalPrintersFragment$NB4p4TKnISt5MJCsLvjZCTYHV4I;-><init>(Landroid/widget/ScrollView;)V

    invoke-virtual {p2, p3}, Landroid/widget/ScrollView;->post(Ljava/lang/Runnable;)Z

    return-object p1
.end method
