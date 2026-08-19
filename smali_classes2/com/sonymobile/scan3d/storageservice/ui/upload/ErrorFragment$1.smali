.class Lcom/sonymobile/scan3d/storageservice/ui/upload/ErrorFragment$1;
.super Ljava/lang/Object;
.source "ErrorFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonymobile/scan3d/storageservice/ui/upload/ErrorFragment;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/storageservice/ui/upload/ErrorFragment;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/storageservice/ui/upload/ErrorFragment;)V
    .locals 0

    .line 52
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ErrorFragment$1;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/upload/ErrorFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 59
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ErrorFragment$1;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/upload/ErrorFragment;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ErrorFragment;->onCancel()V

    return-void
.end method
