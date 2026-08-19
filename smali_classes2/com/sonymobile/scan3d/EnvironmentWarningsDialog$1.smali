.class Lcom/sonymobile/scan3d/EnvironmentWarningsDialog$1;
.super Lcom/sonymobile/scan3d/WindowCallbackProxy;
.source "EnvironmentWarningsDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonymobile/scan3d/EnvironmentWarningsDialog;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/EnvironmentWarningsDialog;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/EnvironmentWarningsDialog;Landroid/view/Window$Callback;)V
    .locals 0

    .line 53
    iput-object p1, p0, Lcom/sonymobile/scan3d/EnvironmentWarningsDialog$1;->this$0:Lcom/sonymobile/scan3d/EnvironmentWarningsDialog;

    invoke-direct {p0, p2}, Lcom/sonymobile/scan3d/WindowCallbackProxy;-><init>(Landroid/view/Window$Callback;)V

    return-void
.end method


# virtual methods
.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 2

    .line 57
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    const/16 v1, 0x50

    if-ne v0, v1, :cond_1

    .line 58
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result p1

    if-nez p1, :cond_0

    .line 59
    iget-object p1, p0, Lcom/sonymobile/scan3d/EnvironmentWarningsDialog$1;->this$0:Lcom/sonymobile/scan3d/EnvironmentWarningsDialog;

    invoke-static {p1}, Lcom/sonymobile/scan3d/EnvironmentWarningsDialog;->access$000(Lcom/sonymobile/scan3d/EnvironmentWarningsDialog;)Lcom/sonymobile/scan3d/EnvironmentWarningsDialog$OnEnvironmentWarnings;

    move-result-object p1

    invoke-interface {p1}, Lcom/sonymobile/scan3d/EnvironmentWarningsDialog$OnEnvironmentWarnings;->onIgnoreWarnings()V

    .line 60
    iget-object p1, p0, Lcom/sonymobile/scan3d/EnvironmentWarningsDialog$1;->this$0:Lcom/sonymobile/scan3d/EnvironmentWarningsDialog;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/EnvironmentWarningsDialog;->dismiss()V

    :cond_0
    const/4 p1, 0x1

    return p1

    .line 64
    :cond_1
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/WindowCallbackProxy;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method
