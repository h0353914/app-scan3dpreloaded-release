.class public Lcom/sonymobile/scan3d/storageservice/ui/upload/ListenableDialogFragment;
.super Landroidx/fragment/app/DialogFragment;
.source "ListenableDialogFragment.java"

# interfaces
.implements Lcom/sonymobile/scan3d/OnBackPressListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Landroidx/fragment/app/DialogFragment;",
        "Lcom/sonymobile/scan3d/OnBackPressListener;"
    }
.end annotation


# static fields
.field public static final KEY_ID:Ljava/lang/String; = "id"


# instance fields
.field private mId:I

.field private mListener:Lcom/sonymobile/scan3d/storageservice/ui/upload/IStatusListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/sonymobile/scan3d/storageservice/ui/upload/IStatusListener<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Landroidx/fragment/app/DialogFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1

    .line 38
    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 41
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ListenableDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "id"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ListenableDialogFragment;->mId:I

    return-void
.end method

.method public onAttach(Landroid/content/Context;)V
    .locals 2

    .line 46
    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onAttach(Landroid/content/Context;)V

    .line 48
    :try_start_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ListenableDialogFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    check-cast p1, Lcom/sonymobile/scan3d/storageservice/ui/upload/IStatusListener;

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ListenableDialogFragment;->mListener:Lcom/sonymobile/scan3d/storageservice/ui/upload/IStatusListener;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    .line 50
    :catch_0
    new-instance p1, Ljava/lang/ClassCastException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ListenableDialogFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " must implement IStatusListener"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/ClassCastException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public onBackPressed()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public onCancel()V
    .locals 2

    .line 94
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ListenableDialogFragment;->mListener:Lcom/sonymobile/scan3d/storageservice/ui/upload/IStatusListener;

    iget v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ListenableDialogFragment;->mId:I

    invoke-interface {v0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/IStatusListener;->onCancel(I)V

    return-void
.end method

.method public onDismiss()V
    .locals 2

    .line 87
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ListenableDialogFragment;->mListener:Lcom/sonymobile/scan3d/storageservice/ui/upload/IStatusListener;

    iget v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ListenableDialogFragment;->mId:I

    invoke-interface {v0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/IStatusListener;->onDismiss(I)V

    return-void
.end method

.method public onFailure(I)V
    .locals 2

    .line 80
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ListenableDialogFragment;->mListener:Lcom/sonymobile/scan3d/storageservice/ui/upload/IStatusListener;

    iget v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ListenableDialogFragment;->mId:I

    invoke-interface {v0, v1, p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/IStatusListener;->onFailure(II)V

    return-void
.end method

.method public onSuccess(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 70
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ListenableDialogFragment;->mListener:Lcom/sonymobile/scan3d/storageservice/ui/upload/IStatusListener;

    iget v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ListenableDialogFragment;->mId:I

    invoke-interface {v0, v1, p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/IStatusListener;->onSuccess(ILjava/lang/Object;)V

    return-void
.end method
