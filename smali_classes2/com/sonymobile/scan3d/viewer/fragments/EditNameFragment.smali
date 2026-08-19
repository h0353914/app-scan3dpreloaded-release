.class public Lcom/sonymobile/scan3d/viewer/fragments/EditNameFragment;
.super Landroidx/fragment/app/DialogFragment;
.source "EditNameFragment.java"

# interfaces
.implements Landroid/text/TextWatcher;


# static fields
.field private static final ARG_MAX_LENGTH:Ljava/lang/String; = "maxlen"

.field private static final ARG_TEXT:Ljava/lang/String; = "text"

.field private static final ARG_TITLE:Ljava/lang/String; = "title"

.field private static final EMPTY_STRING:Ljava/lang/String; = ""


# instance fields
.field private mCurrentText:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Landroidx/fragment/app/DialogFragment;-><init>()V

    return-void
.end method

.method private getListener()Lcom/sonymobile/scan3d/viewer/OnNameChangedListener;
    .locals 1

    .line 160
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/EditNameFragment;->getTargetFragment()Landroidx/fragment/app/Fragment;

    move-result-object v0

    if-nez v0, :cond_0

    .line 161
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/EditNameFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/viewer/OnNameChangedListener;

    return-object v0

    .line 163
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/EditNameFragment;->getTargetFragment()Landroidx/fragment/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/viewer/OnNameChangedListener;

    return-object v0
.end method

.method public static synthetic lambda$onCreateDialog$0(Lcom/sonymobile/scan3d/viewer/fragments/EditNameFragment;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 112
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/EditNameFragment;->getListener()Lcom/sonymobile/scan3d/viewer/OnNameChangedListener;

    move-result-object p1

    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/EditNameFragment;->mCurrentText:Ljava/lang/String;

    invoke-interface {p1, p2}, Lcom/sonymobile/scan3d/viewer/OnNameChangedListener;->onNameChanged(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic lambda$onCreateDialog$1(Lcom/sonymobile/scan3d/viewer/fragments/EditNameFragment;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 4

    .line 126
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_4

    .line 128
    check-cast p1, Landroid/widget/EditText;

    .line 130
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/EditNameFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Configuration;->getLayoutDirection()I

    move-result v0

    if-ne v0, v2, :cond_1

    .line 132
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p2

    invoke-virtual {p1}, Landroid/widget/EditText;->getCompoundPaddingEnd()I

    move-result v0

    int-to-float v0, v0

    cmpg-float p2, p2, v0

    if-gez p2, :cond_0

    goto :goto_0

    :cond_0
    move v2, v1

    goto :goto_0

    .line 134
    :cond_1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p2

    invoke-virtual {p1}, Landroid/widget/EditText;->getWidth()I

    move-result v0

    .line 135
    invoke-virtual {p1}, Landroid/widget/EditText;->getCompoundPaddingEnd()I

    move-result v3

    sub-int/2addr v0, v3

    int-to-float v0, v0

    cmpl-float p2, p2, v0

    if-lez p2, :cond_2

    goto :goto_0

    :cond_2
    move v2, v1

    :goto_0
    if-eqz v2, :cond_3

    const-string p2, ""

    .line 139
    invoke-virtual {p1, p2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    :cond_3
    return v1

    :cond_4
    return v1
.end method

.method public static newInstance(Ljava/lang/String;IILandroidx/fragment/app/Fragment;)Lcom/sonymobile/scan3d/viewer/fragments/EditNameFragment;
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    if-eqz p3, :cond_1

    .line 69
    instance-of v0, p3, Lcom/sonymobile/scan3d/viewer/OnNameChangedListener;

    if-eqz v0, :cond_0

    goto :goto_0

    .line 70
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Target fragment must implement onNameChangedListener"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 73
    :cond_1
    :goto_0
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "text"

    .line 74
    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "title"

    .line 75
    invoke-virtual {v0, p0, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    if-lez p2, :cond_2

    const-string p0, "maxlen"

    .line 77
    invoke-virtual {v0, p0, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 80
    :cond_2
    new-instance p0, Lcom/sonymobile/scan3d/viewer/fragments/EditNameFragment;

    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/EditNameFragment;-><init>()V

    .line 81
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/EditNameFragment;->setArguments(Landroid/os/Bundle;)V

    if-eqz p3, :cond_3

    const/4 p1, 0x0

    .line 82
    invoke-virtual {p0, p3, p1}, Lcom/sonymobile/scan3d/viewer/fragments/EditNameFragment;->setTargetFragment(Landroidx/fragment/app/Fragment;I)V

    :cond_3
    return-object p0
.end method

.method public static newInstance(Ljava/lang/String;ILandroidx/fragment/app/Fragment;)Lcom/sonymobile/scan3d/viewer/fragments/EditNameFragment;
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 87
    invoke-static {p0, p1, v0, p2}, Lcom/sonymobile/scan3d/viewer/fragments/EditNameFragment;->newInstance(Ljava/lang/String;IILandroidx/fragment/app/Fragment;)Lcom/sonymobile/scan3d/viewer/fragments/EditNameFragment;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final afterTextChanged(Landroid/text/Editable;)V
    .locals 0

    .line 188
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/EditNameFragment;->mCurrentText:Ljava/lang/String;

    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1

    .line 92
    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 93
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/EditNameFragment;->getTargetFragment()Landroidx/fragment/app/Fragment;

    move-result-object p1

    if-nez p1, :cond_1

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/EditNameFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    instance-of p1, p1, Lcom/sonymobile/scan3d/viewer/OnNameChangedListener;

    if-eqz p1, :cond_0

    goto :goto_0

    .line 94
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Neither activity nor target fragment are implementing onNameChangedListener"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    :goto_0
    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 6
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 105
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/EditNameFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    const v0, 0x7f110133

    .line 106
    invoke-virtual {p1, v0}, Landroid/app/Activity;->setTheme(I)V

    .line 108
    new-instance v0, Landroidx/appcompat/app/AlertDialog$Builder;

    invoke-direct {v0, p1}, Landroidx/appcompat/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 109
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/EditNameFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v1, "title"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p1

    invoke-virtual {v0, p1}, Landroidx/appcompat/app/AlertDialog$Builder;->setTitle(I)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object p1

    const v0, 0x7f0c0053

    .line 110
    invoke-virtual {p1, v0}, Landroidx/appcompat/app/AlertDialog$Builder;->setView(I)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$EditNameFragment$DMJuLUfoEqKFYcYMQxZPP_FmDv8;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$EditNameFragment$DMJuLUfoEqKFYcYMQxZPP_FmDv8;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/EditNameFragment;)V

    const v1, 0x104000a

    .line 111
    invoke-virtual {p1, v1, v0}, Landroidx/appcompat/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object p1

    const/high16 v0, 0x1040000

    const/4 v1, 0x0

    .line 113
    invoke-virtual {p1, v0, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/appcompat/app/AlertDialog$Builder;->show()Landroidx/appcompat/app/AlertDialog;

    move-result-object p1

    .line 115
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/EditNameFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "text"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 116
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/EditNameFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "maxlen"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    const v2, 0x7f0900b9

    .line 117
    invoke-virtual {p1, v2}, Landroidx/appcompat/app/AlertDialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    if-lez v1, :cond_0

    .line 119
    invoke-virtual {v0, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    const/4 v4, 0x1

    .line 120
    new-array v4, v4, [Landroid/text/InputFilter;

    new-instance v5, Landroid/text/InputFilter$LengthFilter;

    invoke-direct {v5, v1}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    aput-object v5, v4, v3

    invoke-virtual {v2, v4}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    .line 122
    :cond_0
    invoke-virtual {v2, p0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 123
    invoke-virtual {v2, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 124
    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->length()I

    move-result v0

    invoke-virtual {v2, v0}, Landroid/widget/EditText;->setSelection(I)V

    .line 125
    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$EditNameFragment$Z8R0bkpl3lPQRhQBgOLEv6OeH4s;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$EditNameFragment$Z8R0bkpl3lPQRhQBgOLEv6OeH4s;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/EditNameFragment;)V

    invoke-virtual {v2, v0}, Landroid/widget/EditText;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 147
    invoke-virtual {p1}, Landroidx/appcompat/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_1

    const/4 v1, 0x5

    .line 149
    invoke-virtual {v0, v1}, Landroid/view/Window;->setSoftInputMode(I)V

    :cond_1
    return-object p1
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method
