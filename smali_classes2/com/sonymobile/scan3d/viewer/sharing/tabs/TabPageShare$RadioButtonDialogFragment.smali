.class public Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$RadioButtonDialogFragment;
.super Landroidx/fragment/app/DialogFragment;
.source "TabPageShare.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RadioButtonDialogFragment"
.end annotation


# static fields
.field private static final ARG_SHAREABLE:Ljava/lang/String; = "shareable"


# instance fields
.field mIsTessellated:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1180
    invoke-direct {p0}, Landroidx/fragment/app/DialogFragment;-><init>()V

    const/4 v0, 0x0

    .line 1184
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$RadioButtonDialogFragment;->mIsTessellated:Z

    return-void
.end method

.method public static synthetic lambda$onCreateDialog$0(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$RadioButtonDialogFragment;Landroid/widget/RadioButton;Landroid/widget/RadioButton;Landroid/view/View;)V
    .locals 0

    const/4 p3, 0x1

    .line 1210
    invoke-virtual {p1, p3}, Landroid/widget/RadioButton;->setChecked(Z)V

    const/4 p1, 0x0

    .line 1211
    invoke-virtual {p2, p1}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 1212
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$RadioButtonDialogFragment;->mIsTessellated:Z

    return-void
.end method

.method public static synthetic lambda$onCreateDialog$1(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$RadioButtonDialogFragment;Landroid/widget/RadioButton;Landroid/widget/RadioButton;Landroid/view/View;)V
    .locals 0

    const/4 p3, 0x0

    .line 1217
    invoke-virtual {p1, p3}, Landroid/widget/RadioButton;->setChecked(Z)V

    const/4 p1, 0x1

    .line 1218
    invoke-virtual {p2, p1}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 1219
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$RadioButtonDialogFragment;->mIsTessellated:Z

    return-void
.end method

.method public static synthetic lambda$onCreateDialog$2(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$RadioButtonDialogFragment;Landroid/content/DialogInterface;I)V
    .locals 1

    .line 1223
    new-instance p1, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$RadioButtonDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p2

    const-string v0, "shareable"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;-><init>(Landroid/os/Bundle;)V

    .line 1224
    iget-boolean p2, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$RadioButtonDialogFragment;->mIsTessellated:Z

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setTessellated(Z)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    .line 1225
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$RadioButtonDialogFragment;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->share(Landroid/content/Context;)V

    .line 1226
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$RadioButtonDialogFragment;->dismiss()V

    return-void
.end method

.method public static newInstance(Lcom/sonymobile/scan3d/viewer/sharing/Shareable;)Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$RadioButtonDialogFragment;
    .locals 2

    .line 1187
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "shareable"

    .line 1188
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->toBundle()Landroid/os/Bundle;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 1189
    new-instance p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$RadioButtonDialogFragment;

    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$RadioButtonDialogFragment;-><init>()V

    .line 1190
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$RadioButtonDialogFragment;->setArguments(Landroid/os/Bundle;)V

    return-object p0
.end method


# virtual methods
.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 6
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InflateParams"
        }
    .end annotation

    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1198
    new-instance p1, Landroidx/appcompat/app/AlertDialog$Builder;

    new-instance v0, Landroidx/appcompat/view/ContextThemeWrapper;

    .line 1199
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$RadioButtonDialogFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    const v2, 0x7f110132

    invoke-direct {v0, v1, v2}, Landroidx/appcompat/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    invoke-direct {p1, v0}, Landroidx/appcompat/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1200
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$RadioButtonDialogFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    const/4 v1, 0x0

    const v2, 0x7f0c0027

    .line 1201
    invoke-virtual {v0, v2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    const v2, 0x7f100044

    .line 1203
    invoke-virtual {p1, v2}, Landroidx/appcompat/app/AlertDialog$Builder;->setTitle(I)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 1204
    invoke-virtual {p1, v0}, Landroidx/appcompat/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroidx/appcompat/app/AlertDialog$Builder;

    const v2, 0x7f090133

    .line 1206
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/RadioButton;

    const v3, 0x7f09004b

    .line 1207
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/RadioButton;

    const v4, 0x7f090132

    .line 1208
    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .line 1209
    new-instance v5, Lcom/sonymobile/scan3d/viewer/sharing/tabs/-$$Lambda$TabPageShare$RadioButtonDialogFragment$EkFfKdJShDD8aWQpkuPA77tiMw4;

    invoke-direct {v5, p0, v2, v3}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/-$$Lambda$TabPageShare$RadioButtonDialogFragment$EkFfKdJShDD8aWQpkuPA77tiMw4;-><init>(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$RadioButtonDialogFragment;Landroid/widget/RadioButton;Landroid/widget/RadioButton;)V

    invoke-virtual {v4, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v4, 0x7f09004c

    .line 1215
    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 1216
    new-instance v4, Lcom/sonymobile/scan3d/viewer/sharing/tabs/-$$Lambda$TabPageShare$RadioButtonDialogFragment$uIhv_Y7s-dyQeXp001laYQlBtnM;

    invoke-direct {v4, p0, v2, v3}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/-$$Lambda$TabPageShare$RadioButtonDialogFragment$uIhv_Y7s-dyQeXp001laYQlBtnM;-><init>(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$RadioButtonDialogFragment;Landroid/widget/RadioButton;Landroid/widget/RadioButton;)V

    invoke-virtual {v0, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const/high16 v0, 0x1040000

    .line 1221
    invoke-virtual {p1, v0, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/sonymobile/scan3d/viewer/sharing/tabs/-$$Lambda$TabPageShare$RadioButtonDialogFragment$100RLlGCcX45dAHfGMPL8CFae-E;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/-$$Lambda$TabPageShare$RadioButtonDialogFragment$100RLlGCcX45dAHfGMPL8CFae-E;-><init>(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$RadioButtonDialogFragment;)V

    const v2, 0x7f100040

    .line 1222
    invoke-virtual {v0, v2, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 1228
    invoke-virtual {p1}, Landroidx/appcompat/app/AlertDialog$Builder;->create()Landroidx/appcompat/app/AlertDialog;

    move-result-object p1

    return-object p1
.end method
