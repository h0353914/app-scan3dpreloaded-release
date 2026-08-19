.class Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$4;
.super Landroid/os/CountDownTimer;
.source "FaceMimicActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->updateFirstTimeInstructionVisibility()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

.field final synthetic val$preferences:Landroid/content/SharedPreferences;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;JJLandroid/content/SharedPreferences;)V
    .locals 0

    .line 1002
    iput-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$4;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    iput-object p6, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$4;->val$preferences:Landroid/content/SharedPreferences;

    invoke-direct {p0, p2, p3, p4, p5}, Landroid/os/CountDownTimer;-><init>(JJ)V

    return-void
.end method


# virtual methods
.method public onFinish()V
    .locals 3

    .line 1011
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$4;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    const v1, 0x7f0900cf

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 1012
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$4;->val$preferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$4;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    const v2, 0x7f100207

    .line 1013
    invoke-virtual {v1, v2}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    .line 1012
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 1013
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public onTick(J)V
    .locals 0

    return-void
.end method
