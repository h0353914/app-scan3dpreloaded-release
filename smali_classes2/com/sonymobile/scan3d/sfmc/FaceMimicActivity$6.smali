.class Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$6;
.super Ljava/lang/Object;
.source "FaceMimicActivity.java"

# interfaces
.implements Lcom/sonymobile/scan3d/GLThread$Renderer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

.field final synthetic val$isStartedFromEntryPoint:Z


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Z)V
    .locals 0

    .line 1320
    iput-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$6;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    iput-boolean p2, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$6;->val$isStartedFromEntryPoint:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic lambda$null$0(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$6;Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;)V
    .locals 2

    .line 1332
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$6;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    invoke-static {}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->access$1600()Ljava/util/HashMap;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-static {v0, p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->access$1502(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Ljava/lang/Integer;)Ljava/lang/Integer;

    .line 1333
    iget-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$6;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    invoke-static {p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->access$1700(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->access$1800(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;)V

    return-void
.end method

.method public static synthetic lambda$null$2(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$6;Ljava/lang/Boolean;)V
    .locals 1

    .line 1349
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 1350
    iget-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$6;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    sget-object v0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;->IDLE:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->access$900(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;)V

    .line 1351
    iget-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$6;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    invoke-static {p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->access$1400(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)V

    goto :goto_0

    .line 1354
    :cond_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$6;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->finish()V

    :goto_0
    return-void
.end method

.method public static synthetic lambda$onSurfaceCreated$1(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$6;Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;)V
    .locals 2

    .line 1331
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$6;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    new-instance v1, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$6$qCPD6OC2pEPPmZOmpvoeBvyh4ks;

    invoke-direct {v1, p0, p1}, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$6$qCPD6OC2pEPPmZOmpvoeBvyh4ks;-><init>(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$6;Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;)V

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static synthetic lambda$onSurfaceCreated$3(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$6;Z)V
    .locals 3

    .line 1339
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$6;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    sget-object v1, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;->LOADING_MODEL:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->access$900(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$UiState;)V

    if-eqz p1, :cond_0

    .line 1342
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;->MANGA:Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;

    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider;->getExpressionUri(Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;)Landroid/net/Uri;

    move-result-object p1

    goto :goto_0

    .line 1344
    :cond_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$6;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    const v0, 0x7f0f0015

    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->access$1000(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;I)Landroid/net/Uri;

    move-result-object p1

    .line 1345
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$6;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    invoke-static {v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->access$1100(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 1348
    :goto_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$6;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    invoke-static {v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->access$1200(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)Landroid/net/Uri;

    move-result-object v1

    new-instance v2, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$6$qQeJqa4kj1OoOJa485ubWyeZ84A;

    invoke-direct {v2, p0}, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$6$qQeJqa4kj1OoOJa485ubWyeZ84A;-><init>(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$6;)V

    invoke-static {v0, v1, p1, v2}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->access$1300(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Landroid/net/Uri;Landroid/net/Uri;Ljava/util/function/Consumer;)V

    return-void
.end method


# virtual methods
.method public onDrawFrame(F)Z
    .locals 1
    .annotation build Lcom/sonymobile/scan3d/sfmc/GlThread;
    .end annotation

    .line 1388
    iget-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$6;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    invoke-static {p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->access$400(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)Lcom/sonymobile/scan3d/sfmc/MimickingEngine;

    move-result-object p1

    invoke-interface {p1}, Lcom/sonymobile/scan3d/sfmc/MimickingEngine;->render()V

    .line 1389
    iget-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$6;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    invoke-static {p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->access$400(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)Lcom/sonymobile/scan3d/sfmc/MimickingEngine;

    move-result-object p1

    invoke-interface {p1}, Lcom/sonymobile/scan3d/sfmc/MimickingEngine;->runOneIteration()V

    .line 1392
    iget-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$6;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    invoke-static {p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->access$800(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)Ljava/lang/Runnable;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 1393
    iget-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$6;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    invoke-static {p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->access$800(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)Ljava/lang/Runnable;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1394
    iget-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$6;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->access$802(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Ljava/lang/Runnable;)Ljava/lang/Runnable;

    :cond_0
    const/4 p1, 0x1

    return p1
.end method

.method public onSurfaceChanged(II)V
    .locals 1
    .annotation build Lcom/sonymobile/scan3d/sfmc/GlThread;
    .end annotation

    .line 1366
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$6;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    invoke-static {v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->access$400(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)Lcom/sonymobile/scan3d/sfmc/MimickingEngine;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lcom/sonymobile/scan3d/sfmc/MimickingEngine;->setDisplaySize(II)V

    return-void
.end method

.method public onSurfaceCreated()V
    .locals 3
    .annotation build Lcom/sonymobile/scan3d/sfmc/GlThread;
    .end annotation

    .line 1325
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$6;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->access$502(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Z)Z

    .line 1328
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$6;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    invoke-static {v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->access$400(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)Lcom/sonymobile/scan3d/sfmc/MimickingEngine;

    move-result-object v0

    new-instance v1, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$6$UzoC_G_gnqKuXsxgrei1NNUxWjA;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$6$UzoC_G_gnqKuXsxgrei1NNUxWjA;-><init>(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$6;)V

    invoke-interface {v0, v1}, Lcom/sonymobile/scan3d/sfmc/MimickingEngine;->init(Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener;)V

    .line 1338
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$6;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    iget-boolean v1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$6;->val$isStartedFromEntryPoint:Z

    new-instance v2, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$6$50ub8Q1_Fi9Ahrkxks7REu9gucQ;

    invoke-direct {v2, p0, v1}, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$6$50ub8Q1_Fi9Ahrkxks7REu9gucQ;-><init>(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$6;Z)V

    invoke-virtual {v0, v2}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1360
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$6;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    invoke-static {v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->access$600(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)V

    return-void
.end method

.method public onSurfaceDestroyed()V
    .locals 2
    .annotation build Lcom/sonymobile/scan3d/sfmc/GlThread;
    .end annotation

    .line 1373
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$6;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    invoke-static {v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->access$700(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)V

    .line 1374
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$6;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    invoke-static {v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->access$400(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)Lcom/sonymobile/scan3d/sfmc/MimickingEngine;

    move-result-object v0

    invoke-interface {v0}, Lcom/sonymobile/scan3d/sfmc/MimickingEngine;->done()V

    .line 1375
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$6;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->access$502(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Z)Z

    .line 1380
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$6;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    invoke-static {v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->access$000(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)Ljava/util/concurrent/atomic/AtomicReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    .line 1381
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$6;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    invoke-static {v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->access$400(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)Lcom/sonymobile/scan3d/sfmc/MimickingEngine;

    move-result-object v0

    invoke-interface {v0}, Lcom/sonymobile/scan3d/sfmc/MimickingEngine;->release()V

    :cond_0
    return-void
.end method
