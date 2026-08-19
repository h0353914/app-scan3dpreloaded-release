.class public Lcom/sonymobile/scan3d/viewer/fragments/ScanAddedFragment;
.super Landroidx/fragment/app/DialogFragment;
.source "ScanAddedFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# static fields
.field private static final KEY_ARG_PARENT_NAME:Ljava/lang/String; = "parent_name"

.field private static final KEY_ARG_URI:Ljava/lang/String; = "uri"


# instance fields
.field private mNameText:Landroid/widget/EditText;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 90
    invoke-direct {p0}, Landroidx/fragment/app/DialogFragment;-><init>()V

    const/4 v0, 0x0

    .line 91
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/ScanAddedFragment;->setCancelable(Z)V

    return-void
.end method

.method private getName()Ljava/lang/String;
    .locals 2

    .line 164
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ScanAddedFragment;->mNameText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 165
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    const v0, 0x7f100128

    .line 166
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/ScanAddedFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public static newInstance(Landroid/net/Uri;Landroidx/fragment/app/Fragment;)Lcom/sonymobile/scan3d/viewer/fragments/ScanAddedFragment;
    .locals 1

    const/4 v0, 0x0

    .line 61
    invoke-static {p0, p1, v0}, Lcom/sonymobile/scan3d/viewer/fragments/ScanAddedFragment;->newInstance(Landroid/net/Uri;Landroidx/fragment/app/Fragment;Ljava/lang/String;)Lcom/sonymobile/scan3d/viewer/fragments/ScanAddedFragment;

    move-result-object p0

    return-object p0
.end method

.method public static newInstance(Landroid/net/Uri;Landroidx/fragment/app/Fragment;Ljava/lang/String;)Lcom/sonymobile/scan3d/viewer/fragments/ScanAddedFragment;
    .locals 2

    .line 73
    instance-of v0, p1, Lcom/sonymobile/scan3d/viewer/OnNameChangedListener;

    if-eqz v0, :cond_0

    .line 77
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "uri"

    .line 78
    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string p0, "parent_name"

    .line 79
    invoke-virtual {v0, p0, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    new-instance p0, Lcom/sonymobile/scan3d/viewer/fragments/ScanAddedFragment;

    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ScanAddedFragment;-><init>()V

    .line 82
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/ScanAddedFragment;->setArguments(Landroid/os/Bundle;)V

    const/4 p2, 0x0

    .line 83
    invoke-virtual {p0, p1, p2}, Lcom/sonymobile/scan3d/viewer/fragments/ScanAddedFragment;->setTargetFragment(Landroidx/fragment/app/Fragment;I)V

    return-object p0

    .line 74
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "target fragment must implement onNameChangedListener"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4

    const/4 p1, -0x1

    if-eq p2, p1, :cond_0

    goto :goto_0

    .line 141
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ScanAddedFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    .line 142
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ScanAddedFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p2

    const-string v0, "uri"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p2

    check-cast p2, Landroid/net/Uri;

    .line 143
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ScanAddedFragment;->getName()Ljava/lang/String;

    move-result-object v0

    .line 146
    new-instance v1, Landroid/content/ContentValues;

    const/4 v2, 0x2

    invoke-direct {v1, v2}, Landroid/content/ContentValues;-><init>(I)V

    const-string v2, "sync_state"

    const/4 v3, 0x0

    .line 147
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v2, "name"

    .line 148
    invoke-virtual {v1, v2, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v2, 0x1

    .line 149
    invoke-static {p1, p2, v1, v2}, Lcom/sonymobile/scan3d/storageservice/provider/FileTasks;->update(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ContentValues;Z)V

    .line 151
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ScanAddedFragment;->getTargetFragment()Landroidx/fragment/app/Fragment;

    move-result-object p1

    check-cast p1, Lcom/sonymobile/scan3d/viewer/OnNameChangedListener;

    invoke-interface {p1, v0}, Lcom/sonymobile/scan3d/viewer/OnNameChangedListener;->onNameChanged(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 9
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InflateParams"
        }
    .end annotation

    .line 97
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ScanAddedFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    const v0, 0x7f110133

    .line 98
    invoke-virtual {p1, v0}, Landroid/app/Activity;->setTheme(I)V

    .line 100
    invoke-virtual {p1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0c005b

    const/4 v2, 0x0

    .line 101
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f09012d

    .line 102
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    iput-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ScanAddedFragment;->mNameText:Landroid/widget/EditText;

    .line 103
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ScanAddedFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "parent_name"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 104
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 106
    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/fragments/ScanAddedFragment;->mNameText:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getFilters()[Landroid/text/InputFilter;

    move-result-object v2

    array-length v3, v2

    const/4 v4, 0x0

    move v5, v4

    move v6, v5

    :goto_0
    if-ge v5, v3, :cond_1

    aget-object v7, v2, v5

    .line 107
    instance-of v8, v7, Landroid/text/InputFilter$LengthFilter;

    if-eqz v8, :cond_0

    .line 108
    check-cast v7, Landroid/text/InputFilter$LengthFilter;

    invoke-virtual {v7}, Landroid/text/InputFilter$LengthFilter;->getMax()I

    move-result v6

    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 112
    :cond_1
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-le v2, v6, :cond_2

    .line 113
    invoke-virtual {v1, v4, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 115
    :cond_2
    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/fragments/ScanAddedFragment;->mNameText:Landroid/widget/EditText;

    invoke-virtual {v2, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 116
    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/fragments/ScanAddedFragment;->mNameText:Landroid/widget/EditText;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {v2, v1}, Landroid/widget/EditText;->setSelection(I)V

    .line 119
    :cond_3
    new-instance v1, Landroidx/appcompat/app/AlertDialog$Builder;

    invoke-direct {v1, p1}, Landroidx/appcompat/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 120
    invoke-virtual {v1, v0}, Landroidx/appcompat/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object p1

    const v0, 0x104000a

    .line 121
    invoke-virtual {p1, v0, p0}, Landroidx/appcompat/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object p1

    const/high16 v0, 0x1040000

    .line 122
    invoke-virtual {p1, v0, p0}, Landroidx/appcompat/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object p1

    .line 124
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ScanAddedFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_4

    const v0, 0x7f1000d5

    .line 126
    invoke-virtual {p1, v0}, Landroidx/appcompat/app/AlertDialog$Builder;->setTitle(I)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 129
    :cond_4
    invoke-virtual {p1}, Landroidx/appcompat/app/AlertDialog$Builder;->create()Landroidx/appcompat/app/AlertDialog;

    move-result-object p1

    .line 132
    invoke-virtual {p1}, Landroidx/appcompat/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Landroid/view/Window;->setSoftInputMode(I)V

    return-object p1
.end method
