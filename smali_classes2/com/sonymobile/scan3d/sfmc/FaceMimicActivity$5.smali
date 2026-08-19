.class Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$5;
.super Ljava/lang/Object;
.source "FaceMimicActivity.java"

# interfaces
.implements Lcom/sonymobile/scan3d/CameraImageProvider$OnCameraStatusListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->openCamera()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)V
    .locals 0

    .line 1026
    iput-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$5;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClose(Lcom/sonymobile/scan3d/CameraImageProvider;)V
    .locals 1
    .annotation build Lcom/sonymobile/scan3d/sfmc/GlThread;
    .end annotation

    .line 1036
    iget-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$5;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    invoke-static {p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->access$400(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)Lcom/sonymobile/scan3d/sfmc/MimickingEngine;

    move-result-object p1

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lcom/sonymobile/scan3d/sfmc/MimickingEngine;->setImageProvider(Lcom/sonymobile/scan3d/CameraImageProvider;)V

    return-void
.end method

.method public onOpen(Lcom/sonymobile/scan3d/CameraImageProvider;)V
    .locals 1
    .annotation build Lcom/sonymobile/scan3d/sfmc/GlThread;
    .end annotation

    .line 1030
    iget-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$5;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    invoke-static {p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->access$400(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)Lcom/sonymobile/scan3d/sfmc/MimickingEngine;

    move-result-object p1

    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$5;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    invoke-static {v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->access$300(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)Lcom/sonymobile/scan3d/CameraImageProvider;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/sonymobile/scan3d/sfmc/MimickingEngine;->setImageProvider(Lcom/sonymobile/scan3d/CameraImageProvider;)V

    return-void
.end method
