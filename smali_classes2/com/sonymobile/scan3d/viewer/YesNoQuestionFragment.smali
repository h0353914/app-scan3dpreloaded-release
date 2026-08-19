.class public Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;
.super Landroidx/fragment/app/DialogFragment;
.source "YesNoQuestionFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment$OnYesNoListener;
    }
.end annotation


# static fields
.field private static final ARG_COOKIE:Ljava/lang/String; = "cookie"

.field private static final ARG_NEGATIVE_BUTTON:Ljava/lang/String; = "negative_button"

.field private static final ARG_POSITIVE_BUTTON:Ljava/lang/String; = "positive_button"

.field private static final ARG_QUESTION:Ljava/lang/String; = "question"

.field private static final ARG_QUESTION_ID:Ljava/lang/String; = "id"

.field private static final ARG_QUESTION_PARAMS:Ljava/lang/String; = "question_params"

.field private static final ARG_TITLE:Ljava/lang/String; = "title"

.field private static final NO_TITLE:I


# instance fields
.field private mListener:Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment$OnYesNoListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Landroidx/fragment/app/DialogFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;)Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment$OnYesNoListener;
    .locals 0

    .line 28
    iget-object p0, p0, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->mListener:Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment$OnYesNoListener;

    return-object p0
.end method

.method static synthetic access$100(Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;)I
    .locals 0

    .line 28
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->getQuestionId()I

    move-result p0

    return p0
.end method

.method static synthetic access$200(Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;)Landroid/os/Parcelable;
    .locals 0

    .line 28
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->getCookie()Landroid/os/Parcelable;

    move-result-object p0

    return-object p0
.end method

.method private getCookie()Landroid/os/Parcelable;
    .locals 2

    .line 311
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "cookie"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    return-object v0
.end method

.method private getNegativeTextResource()I
    .locals 1

    const-string v0, "negative_button"

    .line 297
    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->getResourceArgument(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method private getPositiveTextResource()I
    .locals 1

    const-string v0, "positive_button"

    .line 288
    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->getResourceArgument(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method private getQuestionId()I
    .locals 2

    .line 254
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "id"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method private getQuestionResource()Ljava/lang/String;
    .locals 5

    .line 263
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "question_params"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_2

    const-string v1, "question"

    .line 266
    invoke-direct {p0, v1}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->getResourceArgument(Ljava/lang/String;)I

    move-result v1

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    aput-object v4, v2, v3

    .line 267
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x1

    if-le v3, v4, :cond_0

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    goto :goto_0

    :cond_0
    const-string v3, ""

    :goto_0
    aput-object v3, v2, v4

    .line 268
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x2

    if-le v3, v4, :cond_1

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    goto :goto_1

    :cond_1
    const-string v0, ""

    :goto_1
    aput-object v0, v2, v4

    .line 266
    invoke-virtual {p0, v1, v2}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    :cond_2
    const-string v0, "question"

    .line 269
    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->getResourceArgument(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_2
    return-object v0
.end method

.method private getResourceArgument(Ljava/lang/String;)I
    .locals 1

    .line 307
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method private getTitleResource()I
    .locals 1

    const-string v0, "title"

    .line 279
    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->getResourceArgument(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static newInstance(III)Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param
    .param p2    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 154
    invoke-static {p0, v0, p1, p2, v1}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->newInstance(IIIILandroid/os/Parcelable;)Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;

    move-result-object p0

    return-object p0
.end method

.method public static newInstance(IIIIILandroid/os/Parcelable;)Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;
    .locals 7
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param
    .param p2    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param
    .param p3    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param
    .param p4    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    const/4 v3, 0x0

    move v0, p0

    move v1, p1

    move v2, p2

    move v4, p3

    move v5, p4

    move-object v6, p5

    .line 120
    invoke-static/range {v0 .. v6}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->newInstance(IIILjava/util/ArrayList;IILandroid/os/Parcelable;)Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;

    move-result-object p0

    return-object p0
.end method

.method public static newInstance(IIIILandroid/os/Parcelable;)Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;
    .locals 6
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param
    .param p2    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param
    .param p3    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    const/high16 v4, 0x1040000

    move v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move-object v5, p4

    .line 139
    invoke-static/range {v0 .. v5}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->newInstance(IIIIILandroid/os/Parcelable;)Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;

    move-result-object p0

    return-object p0
.end method

.method public static newInstance(IIILjava/util/ArrayList;IILandroid/os/Parcelable;)Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param
    .param p2    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param
    .param p4    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param
    .param p5    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(III",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;II",
            "Landroid/os/Parcelable;",
            ")",
            "Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;"
        }
    .end annotation

    .line 89
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "id"

    .line 90
    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p0, "title"

    .line 91
    invoke-virtual {v0, p0, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p0, "question"

    .line 92
    invoke-virtual {v0, p0, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p0, "question_params"

    .line 93
    invoke-virtual {v0, p0, p3}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    const-string p0, "positive_button"

    .line 94
    invoke-virtual {v0, p0, p4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p0, "negative_button"

    .line 95
    invoke-virtual {v0, p0, p5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p0, "cookie"

    .line 96
    invoke-virtual {v0, p0, p6}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 98
    new-instance p0, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;

    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;-><init>()V

    .line 99
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->setArguments(Landroid/os/Bundle;)V

    return-object p0
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 2

    .line 189
    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 191
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    .line 193
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->getTargetFragment()Landroidx/fragment/app/Fragment;

    move-result-object v0

    .line 194
    instance-of v1, v0, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment$OnYesNoListener;

    if-eqz v1, :cond_0

    .line 195
    check-cast v0, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment$OnYesNoListener;

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->mListener:Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment$OnYesNoListener;

    goto :goto_0

    .line 196
    :cond_0
    instance-of v0, p1, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment$OnYesNoListener;

    if-eqz v0, :cond_1

    .line 197
    check-cast p1, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment$OnYesNoListener;

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->mListener:Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment$OnYesNoListener;

    :cond_1
    :goto_0
    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 207
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    const v0, 0x7f110133

    .line 208
    invoke-virtual {p1, v0}, Landroid/app/Activity;->setTheme(I)V

    .line 210
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->getTitleResource()I

    move-result v0

    .line 211
    new-instance v1, Landroidx/appcompat/app/AlertDialog$Builder;

    invoke-direct {v1, p1}, Landroidx/appcompat/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    if-eqz v0, :cond_0

    .line 212
    invoke-virtual {v1, v0}, Landroidx/appcompat/app/AlertDialog$Builder;->setTitle(I)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 213
    :cond_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->getQuestionResource()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroidx/appcompat/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 214
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->getPositiveTextResource()I

    move-result p1

    new-instance v0, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment$1;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment$1;-><init>(Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;)V

    invoke-virtual {v1, p1, v0}, Landroidx/appcompat/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 227
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->getNegativeTextResource()I

    move-result p1

    new-instance v0, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment$2;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment$2;-><init>(Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;)V

    invoke-virtual {v1, p1, v0}, Landroidx/appcompat/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 239
    invoke-virtual {v1}, Landroidx/appcompat/app/AlertDialog$Builder;->show()Landroidx/appcompat/app/AlertDialog;

    move-result-object p1

    return-object p1
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 1

    const/4 v0, 0x0

    .line 248
    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->mListener:Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment$OnYesNoListener;

    .line 250
    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onDismiss(Landroid/content/DialogInterface;)V

    return-void
.end method
