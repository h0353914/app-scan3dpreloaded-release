.class public interface abstract Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;
.super Ljava/lang/Object;
.source "UserInputReducer.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/utils/UserInputReducer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "InputReducer"
.end annotation


# virtual methods
.method public abstract doClick(Landroid/view/View;)V
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 39
    invoke-static {}, Lcom/sonymobile/scan3d/utils/UserInputReducer;->access$000()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 41
    invoke-static {v0}, Lcom/sonymobile/scan3d/utils/UserInputReducer;->access$002(Z)Z

    .line 44
    invoke-interface {p0, p1}, Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;->doClick(Landroid/view/View;)V

    .line 47
    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    .line 48
    invoke-static {}, Lcom/sonymobile/scan3d/utils/UserInputReducer;->access$100()Ljava/lang/Runnable;

    move-result-object v0

    const-wide/16 v1, 0xc8

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_0
    return-void
.end method
