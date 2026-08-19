.class public Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$BadTextureFragment;
.super Landroidx/fragment/app/Fragment;
.source "EnvironmentErrorsDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/EnvironmentErrorsDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BadTextureFragment"
.end annotation


# static fields
.field static final ARG_IMAGE:Ljava/lang/String; = "image"

.field static final ARG_TEXT:Ljava/lang/String; = "text"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 209
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1
    .param p1    # Landroid/view/LayoutInflater;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const p3, 0x7f0c0066

    const/4 v0, 0x0

    .line 218
    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f0900f1

    .line 220
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ImageView;

    .line 221
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$BadTextureFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p3

    const-string v0, "image"

    invoke-virtual {p3, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p3

    check-cast p3, Landroid/graphics/Bitmap;

    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    const p2, 0x7f090124

    .line 223
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    .line 224
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$BadTextureFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p3

    const-string v0, "text"

    invoke-virtual {p3, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p3

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(I)V

    return-object p1
.end method
