.class Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$ErrorAdapter;
.super Landroidx/fragment/app/FragmentStatePagerAdapter;
.source "EnvironmentErrorsDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/EnvironmentErrorsDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ErrorAdapter"
.end annotation


# instance fields
.field private mCallback:Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$ErrorDialogCallback;

.field mErrors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/EnvironmentError;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroidx/fragment/app/FragmentManager;Ljava/util/List;Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$ErrorDialogCallback;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/fragment/app/FragmentManager;",
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/EnvironmentError;",
            ">;",
            "Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$ErrorDialogCallback;",
            ")V"
        }
    .end annotation

    const/4 v0, 0x1

    .line 132
    invoke-direct {p0, p1, v0}, Landroidx/fragment/app/FragmentStatePagerAdapter;-><init>(Landroidx/fragment/app/FragmentManager;I)V

    .line 133
    iput-object p3, p0, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$ErrorAdapter;->mCallback:Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$ErrorDialogCallback;

    .line 134
    iput-object p2, p0, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$ErrorAdapter;->mErrors:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .line 184
    iget-object v0, p0, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$ErrorAdapter;->mErrors:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Landroidx/fragment/app/Fragment;
    .locals 4
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 141
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 142
    iget-object v1, p0, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$ErrorAdapter;->mErrors:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/sonymobile/scan3d/EnvironmentError;

    .line 143
    iget-object v1, p0, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$ErrorAdapter;->mCallback:Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$ErrorDialogCallback;

    const/4 v2, 0x1

    invoke-interface {v1, p1, v2}, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$ErrorDialogCallback;->onErrorShown(Lcom/sonymobile/scan3d/EnvironmentError;Z)V

    .line 144
    sget-object v1, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$1;->$SwitchMap$com$sonymobile$scan3d$EnvironmentError$ErrorType:[I

    iget-object v2, p1, Lcom/sonymobile/scan3d/EnvironmentError;->type:Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;

    invoke-virtual {v2}, Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 178
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Unknown type"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 171
    :pswitch_0
    new-instance v1, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$BadLoopClosureFragment;

    invoke-direct {v1}, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$BadLoopClosureFragment;-><init>()V

    const-string v2, "text"

    const v3, 0x7f100375

    .line 172
    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v2, "origin_img"

    .line 173
    iget-object v3, p1, Lcom/sonymobile/scan3d/EnvironmentError;->primaryImage:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string v2, "best_img"

    .line 174
    iget-object p1, p1, Lcom/sonymobile/scan3d/EnvironmentError;->secondaryImage:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 175
    invoke-virtual {v1, v0}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    return-object v1

    .line 165
    :pswitch_1
    new-instance v1, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$BadTextureFragment;

    invoke-direct {v1}, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$BadTextureFragment;-><init>()V

    const-string v2, "image"

    .line 166
    iget-object p1, p1, Lcom/sonymobile/scan3d/EnvironmentError;->primaryImage:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string p1, "text"

    const v2, 0x7f100376

    .line 167
    invoke-virtual {v0, p1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 168
    invoke-virtual {v1, v0}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    return-object v1

    .line 158
    :pswitch_2
    new-instance v1, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$UnevenLightFragment;

    invoke-direct {v1}, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$UnevenLightFragment;-><init>()V

    const-string v2, "light_image"

    .line 159
    iget-object v3, p1, Lcom/sonymobile/scan3d/EnvironmentError;->primaryImage:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string v2, "dark_image"

    .line 160
    iget-object p1, p1, Lcom/sonymobile/scan3d/EnvironmentError;->secondaryImage:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string p1, "text"

    const v2, 0x7f100378

    .line 161
    invoke-virtual {v0, p1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 162
    invoke-virtual {v1, v0}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    return-object v1

    .line 152
    :pswitch_3
    new-instance v1, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$BadLightFragment;

    invoke-direct {v1}, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$BadLightFragment;-><init>()V

    const-string v2, "image"

    .line 153
    iget-object p1, p1, Lcom/sonymobile/scan3d/EnvironmentError;->primaryImage:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string p1, "text"

    const v2, 0x7f100377

    .line 154
    invoke-virtual {v0, p1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 155
    invoke-virtual {v1, v0}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    return-object v1

    .line 146
    :pswitch_4
    new-instance v1, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$BadLightFragment;

    invoke-direct {v1}, Lcom/sonymobile/scan3d/EnvironmentErrorsDialog$BadLightFragment;-><init>()V

    const-string v2, "image"

    .line 147
    iget-object p1, p1, Lcom/sonymobile/scan3d/EnvironmentError;->primaryImage:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string p1, "text"

    const v2, 0x7f100374

    .line 148
    invoke-virtual {v0, p1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 149
    invoke-virtual {v1, v0}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    return-object v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
