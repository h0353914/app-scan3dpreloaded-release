.class Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment$1;
.super Ljava/lang/Object;
.source "YesNoQuestionFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;)V
    .locals 0

    .line 214
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment$1;->this$0:Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 222
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment$1;->this$0:Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;

    invoke-static {p1}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->access$000(Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;)Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment$OnYesNoListener;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 223
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment$1;->this$0:Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;

    invoke-static {p1}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->access$000(Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;)Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment$OnYesNoListener;

    move-result-object p1

    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment$1;->this$0:Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;

    invoke-static {p2}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->access$100(Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;)I

    move-result p2

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment$1;->this$0:Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;

    invoke-static {v0}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->access$200(Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;)Landroid/os/Parcelable;

    move-result-object v0

    invoke-interface {p1, p2, v0}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment$OnYesNoListener;->onPositiveAnswer(ILandroid/os/Parcelable;)V

    :cond_0
    return-void
.end method
