.class public Lcom/sonymobile/scan3d/BreakScanningDialog;
.super Landroidx/fragment/app/DialogFragment;
.source "BreakScanningDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/BreakScanningDialog$OnBadStartListener;
    }
.end annotation


# static fields
.field private static final ARG_BUTTON_ID:Ljava/lang/String; = "button_id"

.field private static final ARG_MESSAGE_ID:Ljava/lang/String; = "message_id"

.field private static final NO_TITLE:I


# instance fields
.field private mListener:Lcom/sonymobile/scan3d/BreakScanningDialog$OnBadStartListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Landroidx/fragment/app/DialogFragment;-><init>()V

    return-void
.end method

.method private getButtonId()I
    .locals 1

    const-string v0, "button_id"

    .line 170
    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/BreakScanningDialog;->getResourceArgument(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method private getResourceArgument(Ljava/lang/String;)I
    .locals 1

    .line 180
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/BreakScanningDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public static synthetic lambda$onCreateDialog$0(Lcom/sonymobile/scan3d/BreakScanningDialog;Landroid/content/DialogInterface;)V
    .locals 1

    .line 106
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/BreakScanningDialog;->getDialog()Landroid/app/Dialog;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    .line 107
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/BreakScanningDialog;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getSystemUiVisibility()I

    move-result v0

    .line 106
    invoke-virtual {p1, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 108
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/BreakScanningDialog;->getDialog()Landroid/app/Dialog;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/Window;->clearFlags(I)V

    return-void
.end method

.method public static newInstance(II)Lcom/sonymobile/scan3d/BreakScanningDialog;
    .locals 2

    .line 61
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "message_id"

    .line 62
    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p0, "button_id"

    .line 63
    invoke-virtual {v0, p0, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 65
    new-instance p0, Lcom/sonymobile/scan3d/BreakScanningDialog;

    invoke-direct {p0}, Lcom/sonymobile/scan3d/BreakScanningDialog;-><init>()V

    .line 66
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/BreakScanningDialog;->setArguments(Landroid/os/Bundle;)V

    return-object p0
.end method


# virtual methods
.method getMessage()I
    .locals 1

    const-string v0, "message_id"

    .line 131
    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/BreakScanningDialog;->getResourceArgument(Ljava/lang/String;)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    const v0, 0x7f1000b8

    return v0

    :pswitch_0
    const v0, 0x7f1000b2

    return v0

    :pswitch_1
    const v0, 0x7f1000b0

    return v0

    :pswitch_2
    const v0, 0x7f1000b4

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method getTitle()I
    .locals 1

    const-string v0, "message_id"

    .line 151
    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/BreakScanningDialog;->getResourceArgument(Ljava/lang/String;)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    const/4 v0, 0x0

    return v0

    :pswitch_0
    const v0, 0x7f1000b3

    return v0

    :pswitch_1
    const v0, 0x7f1000b1

    return v0

    :pswitch_2
    const v0, 0x7f1000b5

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1

    .line 72
    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 73
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/BreakScanningDialog;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    .line 74
    instance-of v0, p1, Lcom/sonymobile/scan3d/BreakScanningDialog$OnBadStartListener;

    if-eqz v0, :cond_0

    .line 75
    check-cast p1, Lcom/sonymobile/scan3d/BreakScanningDialog$OnBadStartListener;

    iput-object p1, p0, Lcom/sonymobile/scan3d/BreakScanningDialog;->mListener:Lcom/sonymobile/scan3d/BreakScanningDialog$OnBadStartListener;

    :cond_0
    return-void
.end method

.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 116
    iget-object p1, p0, Lcom/sonymobile/scan3d/BreakScanningDialog;->mListener:Lcom/sonymobile/scan3d/BreakScanningDialog$OnBadStartListener;

    if-eqz p1, :cond_1

    const/4 p1, 0x4

    .line 117
    invoke-direct {p0}, Lcom/sonymobile/scan3d/BreakScanningDialog;->getButtonId()I

    move-result p2

    if-ne p1, p2, :cond_0

    .line 118
    iget-object p1, p0, Lcom/sonymobile/scan3d/BreakScanningDialog;->mListener:Lcom/sonymobile/scan3d/BreakScanningDialog$OnBadStartListener;

    invoke-interface {p1}, Lcom/sonymobile/scan3d/BreakScanningDialog$OnBadStartListener;->onCancelScanClicked()V

    .line 120
    :cond_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/BreakScanningDialog;->mListener:Lcom/sonymobile/scan3d/BreakScanningDialog$OnBadStartListener;

    const/4 p2, 0x1

    invoke-interface {p1, p2}, Lcom/sonymobile/scan3d/BreakScanningDialog$OnBadStartListener;->onRestartScanClicked(Z)V

    .line 122
    :cond_1
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/BreakScanningDialog;->dismiss()V

    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 2

    .line 81
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/BreakScanningDialog;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    const v0, 0x7f110133

    .line 82
    invoke-virtual {p1, v0}, Landroid/app/Activity;->setTheme(I)V

    .line 83
    new-instance v0, Landroidx/appcompat/app/AlertDialog$Builder;

    invoke-direct {v0, p1}, Landroidx/appcompat/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 84
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/BreakScanningDialog;->getMessage()I

    move-result p1

    invoke-virtual {v0, p1}, Landroidx/appcompat/app/AlertDialog$Builder;->setMessage(I)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 85
    invoke-direct {p0}, Lcom/sonymobile/scan3d/BreakScanningDialog;->getButtonId()I

    move-result p1

    const/4 v1, 0x4

    if-ne v1, p1, :cond_0

    const p1, 0x7f1000b6

    .line 86
    invoke-virtual {v0, p1, p0}, Landroidx/appcompat/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    goto :goto_0

    :cond_0
    const p1, 0x7f1000b7

    .line 88
    invoke-virtual {v0, p1, p0}, Landroidx/appcompat/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 90
    :goto_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/BreakScanningDialog;->getTitle()I

    move-result p1

    if-eqz p1, :cond_1

    .line 92
    invoke-virtual {v0, p1}, Landroidx/appcompat/app/AlertDialog$Builder;->setTitle(I)Landroidx/appcompat/app/AlertDialog$Builder;

    :cond_1
    const/4 p1, 0x0

    .line 94
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/BreakScanningDialog;->setCancelable(Z)V

    .line 96
    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog$Builder;->create()Landroidx/appcompat/app/AlertDialog;

    move-result-object v0

    .line 97
    invoke-virtual {v0, p1}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 104
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/16 v1, 0x8

    invoke-virtual {p1, v1}, Landroid/view/Window;->addFlags(I)V

    .line 105
    new-instance p1, Lcom/sonymobile/scan3d/-$$Lambda$BreakScanningDialog$jqbrfBpdN_qAcJtXR1niradM39Q;

    invoke-direct {p1, p0}, Lcom/sonymobile/scan3d/-$$Lambda$BreakScanningDialog$jqbrfBpdN_qAcJtXR1niradM39Q;-><init>(Lcom/sonymobile/scan3d/BreakScanningDialog;)V

    invoke-virtual {v0, p1}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    return-object v0
.end method
