.class public Lcom/sonymobile/scan3d/viewer/TipDialog;
.super Landroidx/fragment/app/DialogFragment;
.source "TipDialog.java"

# interfaces
.implements Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/viewer/TipDialog$ITipDialogListener;
    }
.end annotation


# static fields
.field private static final ARG_SHOW_TITLE:Ljava/lang/String; = "show_title"

.field private static final ARG_TIP:Ljava/lang/String; = "tip"

.field private static final ARG_TIP_CATEGORY:Ljava/lang/String; = "tip_category"


# instance fields
.field private mCheckBox:Landroid/widget/CheckBox;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 35
    invoke-direct {p0}, Landroidx/fragment/app/DialogFragment;-><init>()V

    return-void
.end method

.method private excludeTipIfNeeded()V
    .locals 5

    .line 184
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/TipDialog;->mCheckBox:Landroid/widget/CheckBox;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 185
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/TipDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "tip"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;

    if-eqz v0, :cond_0

    const v1, 0x7f1001cf

    .line 187
    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/viewer/TipDialog;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 189
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/TipDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 192
    new-instance v3, Ljava/util/HashSet;

    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    invoke-interface {v2, v1, v4}, Landroid/content/SharedPreferences;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 196
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/TipDialog;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->getShortDescription()I

    move-result v0

    invoke-virtual {v4, v0}, Landroid/content/res/Resources;->getResourceEntryName(I)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v3, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 197
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_0
    return-void
.end method

.method private getListener()Lcom/sonymobile/scan3d/viewer/TipDialog$ITipDialogListener;
    .locals 2

    .line 117
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/TipDialog;->getTargetFragment()Landroidx/fragment/app/Fragment;

    move-result-object v0

    .line 118
    instance-of v1, v0, Lcom/sonymobile/scan3d/viewer/TipDialog$ITipDialogListener;

    if-eqz v1, :cond_0

    .line 119
    check-cast v0, Lcom/sonymobile/scan3d/viewer/TipDialog$ITipDialogListener;

    return-object v0

    .line 121
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Target fragment should be set and implement ITipDialogListener"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static newInstance(Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;Z)Lcom/sonymobile/scan3d/viewer/TipDialog;
    .locals 2

    .line 85
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "tip_category"

    .line 86
    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string p0, "tip"

    .line 87
    invoke-virtual {v0, p0, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string p0, "show_title"

    .line 88
    invoke-virtual {v0, p0, p2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 90
    new-instance p0, Lcom/sonymobile/scan3d/viewer/TipDialog;

    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/TipDialog;-><init>()V

    .line 91
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/TipDialog;->setArguments(Landroid/os/Bundle;)V

    return-object p0
.end method


# virtual methods
.method public doClick(Landroid/view/View;)V
    .locals 3

    .line 97
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/TipDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "tip_category"

    .line 98
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;

    const-string v2, "tip"

    .line 99
    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;

    .line 100
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 102
    :pswitch_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/TipDialog;->getListener()Lcom/sonymobile/scan3d/viewer/TipDialog$ITipDialogListener;

    move-result-object p1

    invoke-interface {p1, v1, v0}, Lcom/sonymobile/scan3d/viewer/TipDialog$ITipDialogListener;->onTipPositive(Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;)V

    .line 103
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/TipDialog;->excludeTipIfNeeded()V

    .line 104
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/TipDialog;->dismiss()V

    goto :goto_0

    .line 107
    :pswitch_1
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/TipDialog;->getListener()Lcom/sonymobile/scan3d/viewer/TipDialog$ITipDialogListener;

    move-result-object p1

    invoke-interface {p1}, Lcom/sonymobile/scan3d/viewer/TipDialog$ITipDialogListener;->onTipNegative()V

    .line 108
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/TipDialog;->excludeTipIfNeeded()V

    .line 109
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/TipDialog;->dismiss()V

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x7f0901e9
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 0

    .line 139
    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onCancel(Landroid/content/DialogInterface;)V

    .line 140
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/TipDialog;->getListener()Lcom/sonymobile/scan3d/viewer/TipDialog$ITipDialogListener;

    move-result-object p1

    invoke-interface {p1}, Lcom/sonymobile/scan3d/viewer/TipDialog$ITipDialogListener;->onTipNegative()V

    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 2

    .line 131
    new-instance p1, Landroid/app/Dialog;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/TipDialog;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    const v1, 0x7f1101e4

    invoke-direct {p1, v0, v1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 132
    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x50

    invoke-virtual {v0, v1}, Landroid/view/Window;->setGravity(I)V

    return-object p1
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 5
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 147
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/TipDialog;->getArguments()Landroid/os/Bundle;

    move-result-object p3

    const-string v0, "tip"

    .line 148
    invoke-virtual {p3, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;

    const/4 v1, 0x0

    const v2, 0x7f0c0070

    .line 150
    invoke-virtual {p1, v2, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f0901ec

    .line 151
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    const v2, 0x7f0901eb

    .line 153
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/CheckBox;

    iput-object v2, p0, Lcom/sonymobile/scan3d/viewer/TipDialog;->mCheckBox:Landroid/widget/CheckBox;

    .line 154
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->isExcludeable()Z

    move-result v2

    if-nez v2, :cond_0

    .line 155
    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/TipDialog;->mCheckBox:Landroid/widget/CheckBox;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/widget/CheckBox;->setVisibility(I)V

    :cond_0
    const v2, 0x7f0901ea

    .line 158
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    .line 159
    invoke-virtual {v2, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v3, 0x7f0901e9

    .line 160
    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    .line 161
    invoke-virtual {v3, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 164
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->getShortDescription()I

    move-result v4

    invoke-virtual {p2, v4}, Landroid/widget/TextView;->setText(I)V

    .line 165
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->getPositiveButton()I

    move-result p2

    invoke-virtual {v2, p2}, Landroid/widget/Button;->setText(I)V

    .line 167
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->getTitle()I

    move-result p2

    if-eqz p2, :cond_1

    const-string p2, "show_title"

    invoke-virtual {p3, p2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_1

    const p2, 0x7f0901ee

    .line 168
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    .line 169
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->getTitle()I

    move-result p3

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(I)V

    .line 170
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 174
    :cond_1
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->getPositiveAction()I

    move-result p2

    if-lez p2, :cond_2

    const p2, 0x7f1002db

    .line 175
    invoke-virtual {v3, p2}, Landroid/widget/Button;->setText(I)V

    :cond_2
    return-object p1
.end method
