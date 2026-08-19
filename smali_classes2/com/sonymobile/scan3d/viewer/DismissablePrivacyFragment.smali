.class public abstract Lcom/sonymobile/scan3d/viewer/DismissablePrivacyFragment;
.super Landroidx/fragment/app/DialogFragment;
.source "DismissablePrivacyFragment.java"


# static fields
.field public static final ARG_CHECKBOX_KEY:Ljava/lang/String; = "checkbox_pref"

.field public static final ARG_SHAREABLE:Ljava/lang/String; = "shareable"


# instance fields
.field private mCheckBox:Landroid/widget/CheckBox;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Landroidx/fragment/app/DialogFragment;-><init>()V

    return-void
.end method

.method public static synthetic lambda$onCreateDialog$0(Lcom/sonymobile/scan3d/viewer/DismissablePrivacyFragment;Landroid/content/DialogInterface;I)V
    .locals 1

    .line 49
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/DismissablePrivacyFragment;->mCheckBox:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 50
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/DismissablePrivacyFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    .line 51
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/DismissablePrivacyFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p2

    const-string v0, "checkbox_pref"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    const/4 v0, 0x1

    invoke-interface {p1, p2, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 53
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/DismissablePrivacyFragment;->onPositiveAnswer()V

    .line 54
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/DismissablePrivacyFragment;->dismiss()V

    return-void
.end method


# virtual methods
.method protected abstract getDescription()Ljava/lang/String;
.end method

.method protected abstract getTitle()Ljava/lang/String;
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InflateParams"
        }
    .end annotation

    .line 37
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/DismissablePrivacyFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const/4 v0, 0x0

    const v1, 0x7f0c00ae

    const/4 v2, 0x0

    .line 38
    invoke-virtual {p1, v1, v0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const v1, 0x7f09008e

    .line 39
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/CheckBox;

    iput-object v1, p0, Lcom/sonymobile/scan3d/viewer/DismissablePrivacyFragment;->mCheckBox:Landroid/widget/CheckBox;

    const v1, 0x7f0900b1

    .line 40
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 41
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/DismissablePrivacyFragment;->getDescription()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/DismissablePrivacyFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    const v2, 0x7f110132

    .line 43
    invoke-virtual {v1, v2}, Landroid/app/Activity;->setTheme(I)V

    .line 45
    new-instance v2, Landroidx/appcompat/app/AlertDialog$Builder;

    invoke-direct {v2, v1}, Landroidx/appcompat/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 46
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/DismissablePrivacyFragment;->getTitle()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 47
    invoke-virtual {v2, p1}, Landroidx/appcompat/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 48
    new-instance p1, Lcom/sonymobile/scan3d/viewer/-$$Lambda$DismissablePrivacyFragment$Kmf7V1OwUVf4QZBmxWTxfkhyy6o;

    invoke-direct {p1, p0}, Lcom/sonymobile/scan3d/viewer/-$$Lambda$DismissablePrivacyFragment$Kmf7V1OwUVf4QZBmxWTxfkhyy6o;-><init>(Lcom/sonymobile/scan3d/viewer/DismissablePrivacyFragment;)V

    const v1, 0x104000a

    invoke-virtual {v2, v1, p1}, Landroidx/appcompat/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    const/high16 p1, 0x1040000

    .line 56
    invoke-virtual {v2, p1, v0}, Landroidx/appcompat/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 58
    invoke-virtual {v2}, Landroidx/appcompat/app/AlertDialog$Builder;->create()Landroidx/appcompat/app/AlertDialog;

    move-result-object p1

    return-object p1
.end method

.method protected abstract onPositiveAnswer()V
.end method
