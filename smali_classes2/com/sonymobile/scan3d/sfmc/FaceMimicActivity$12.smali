.class Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$12;
.super Landroid/util/SparseIntArray;
.source "FaceMimicActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->onStart()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)V
    .locals 3

    .line 1614
    iput-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$12;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    invoke-direct {p0}, Landroid/util/SparseIntArray;-><init>()V

    .line 1615
    iget-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$12;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    invoke-static {p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->access$1900(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)Landroid/media/SoundPool;

    move-result-object p1

    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$12;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    const v1, 0x7f0f0018

    const/4 v2, 0x1

    invoke-virtual {p1, v0, v1, v2}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    move-result p1

    invoke-virtual {p0, v1, p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$12;->put(II)V

    .line 1616
    iget-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$12;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    invoke-static {p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->access$1900(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)Landroid/media/SoundPool;

    move-result-object p1

    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$12;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    const v1, 0x7f0f001a

    invoke-virtual {p1, v0, v1, v2}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    move-result p1

    invoke-virtual {p0, v1, p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$12;->put(II)V

    .line 1617
    iget-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$12;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    invoke-static {p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->access$1900(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)Landroid/media/SoundPool;

    move-result-object p1

    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$12;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    const v1, 0x7f0f001b

    invoke-virtual {p1, v0, v1, v2}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    move-result p1

    invoke-virtual {p0, v1, p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$12;->put(II)V

    return-void
.end method
