.class Lcom/sonymobile/scan3d/storageservice/ui/upload/InfoFragment$1;
.super Ljava/lang/Object;
.source "InfoFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonymobile/scan3d/storageservice/ui/upload/InfoFragment;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/storageservice/ui/upload/InfoFragment;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/storageservice/ui/upload/InfoFragment;)V
    .locals 0

    .line 107
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/InfoFragment$1;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/upload/InfoFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 114
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/InfoFragment$1;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/upload/InfoFragment;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/InfoFragment;->onSuccess(Ljava/lang/Object;)V

    return-void
.end method
