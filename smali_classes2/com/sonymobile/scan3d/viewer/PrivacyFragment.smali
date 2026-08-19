.class public abstract Lcom/sonymobile/scan3d/viewer/PrivacyFragment;
.super Landroidx/fragment/app/DialogFragment;
.source "PrivacyFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Landroidx/fragment/app/DialogFragment;-><init>()V

    return-void
.end method

.method private getTitle()Ljava/lang/String;
    .locals 4

    .line 89
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/PrivacyFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    .line 90
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/PrivacyFragment;->getApplicationName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const v2, 0x7f1000a1

    .line 89
    invoke-virtual {v0, v2, v1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static synthetic lambda$onCreateDialog$0(Lcom/sonymobile/scan3d/viewer/PrivacyFragment;Landroid/net/Uri;Landroid/view/View;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 50
    new-instance p2, Landroid/content/Intent;

    const-string v0, "android.intent.action.VIEW"

    invoke-direct {p2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 51
    invoke-virtual {p2, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 52
    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/viewer/PrivacyFragment;->startActivity(Landroid/content/Intent;)V

    :cond_0
    return-void
.end method

.method public static synthetic lambda$onCreateDialog$1(Lcom/sonymobile/scan3d/viewer/PrivacyFragment;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 64
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/PrivacyFragment;->onPositiveAnswer()V

    .line 65
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/PrivacyFragment;->dismiss()V

    return-void
.end method

.method public static synthetic lambda$onCreateDialog$2(Lcom/sonymobile/scan3d/viewer/PrivacyFragment;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 68
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/PrivacyFragment;->onNegativeAnswer()V

    .line 69
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/PrivacyFragment;->dismiss()V

    return-void
.end method


# virtual methods
.method protected abstract getApplicationName()Ljava/lang/String;
.end method

.method protected abstract getPrivacyLink()Ljava/lang/String;
.end method

.method protected getPrivacyTextId()I
    .locals 1
    .annotation build Landroidx/annotation/StringRes;
    .end annotation

    const v0, 0x7f1000a2

    return v0
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 8
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InflateParams"
        }
    .end annotation

    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 35
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/PrivacyFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const/4 v0, 0x0

    const/4 v1, 0x0

    const v2, 0x7f0c0051

    invoke-virtual {p1, v2, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const v2, 0x7f090124

    .line 37
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 38
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/PrivacyFragment;->getPrivacyLink()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 39
    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    :cond_0
    const/4 v3, 0x2

    .line 40
    new-array v3, v3, [Ljava/lang/Object;

    .line 41
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/PrivacyFragment;->getApplicationName()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v1

    if-eqz v0, :cond_1

    const-string v4, "linkText1"

    goto :goto_0

    :cond_1
    const-string v4, ""

    :goto_0
    const/4 v5, 0x1

    aput-object v4, v3, v5

    .line 44
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/PrivacyFragment;->getContext()Landroid/content/Context;

    move-result-object v4

    .line 45
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/PrivacyFragment;->getPrivacyTextId()I

    move-result v6

    new-array v5, v5, [Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;

    new-instance v7, Lcom/sonymobile/scan3d/viewer/-$$Lambda$PrivacyFragment$w7rFquN2Q5DufYkOOi1GFeD36o0;

    invoke-direct {v7, p0, v0}, Lcom/sonymobile/scan3d/viewer/-$$Lambda$PrivacyFragment$w7rFquN2Q5DufYkOOi1GFeD36o0;-><init>(Lcom/sonymobile/scan3d/viewer/PrivacyFragment;Landroid/net/Uri;)V

    aput-object v7, v5, v1

    .line 44
    invoke-static {v4, v6, v3, v5}, Lcom/sonymobile/scan3d/utils/LinkUtil;->createClickableLink(Landroid/content/Context;I[Ljava/lang/Object;[Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;)Landroid/text/SpannableStringBuilder;

    move-result-object v0

    .line 55
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 56
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 57
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/PrivacyFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    const v1, 0x7f110132

    .line 58
    invoke-virtual {v0, v1}, Landroid/app/Activity;->setTheme(I)V

    .line 60
    new-instance v1, Landroidx/appcompat/app/AlertDialog$Builder;

    invoke-direct {v1, v0}, Landroidx/appcompat/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 61
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/PrivacyFragment;->getTitle()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroidx/appcompat/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 62
    invoke-virtual {v1, p1}, Landroidx/appcompat/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroidx/appcompat/app/AlertDialog$Builder;

    const p1, 0x104000a

    .line 63
    new-instance v0, Lcom/sonymobile/scan3d/viewer/-$$Lambda$PrivacyFragment$T40_mQqPC-lp0FRW54mI4vu30NQ;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/viewer/-$$Lambda$PrivacyFragment$T40_mQqPC-lp0FRW54mI4vu30NQ;-><init>(Lcom/sonymobile/scan3d/viewer/PrivacyFragment;)V

    invoke-virtual {v1, p1, v0}, Landroidx/appcompat/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    const/high16 p1, 0x1040000

    .line 67
    new-instance v0, Lcom/sonymobile/scan3d/viewer/-$$Lambda$PrivacyFragment$LZnoVILySVKGfhK0xoNHCDTOO6E;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/viewer/-$$Lambda$PrivacyFragment$LZnoVILySVKGfhK0xoNHCDTOO6E;-><init>(Lcom/sonymobile/scan3d/viewer/PrivacyFragment;)V

    invoke-virtual {v1, p1, v0}, Landroidx/appcompat/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 72
    invoke-virtual {v1}, Landroidx/appcompat/app/AlertDialog$Builder;->create()Landroidx/appcompat/app/AlertDialog;

    move-result-object p1

    return-object p1
.end method

.method protected onNegativeAnswer()V
    .locals 0

    return-void
.end method

.method protected abstract onPositiveAnswer()V
.end method
