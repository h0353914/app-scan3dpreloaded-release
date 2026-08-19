.class Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FaceBlendPlugin;
.super Lcom/sonymobile/scan3d/sharing/LocalPlugin;
.source "TabPageShare.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FaceBlendPlugin"
.end annotation


# static fields
.field private static final SHARE_FACE_BLEND:Ljava/lang/String; = "Face blend"


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;)V
    .locals 3

    .line 1236
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FaceBlendPlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    .line 1237
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string v0, "Face blend"

    const v1, 0x7f080149

    const v2, 0x7f100272

    invoke-direct {p0, p1, v1, v2, v0}, Lcom/sonymobile/scan3d/sharing/LocalPlugin;-><init>(Landroid/content/Context;IILjava/lang/String;)V

    return-void
.end method


# virtual methods
.method public getBackgroundColor()I
    .locals 2

    .line 1250
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FaceBlendPlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0600b3

    invoke-virtual {v0, v1}, Landroid/content/Context;->getColor(I)I

    move-result v0

    return v0
.end method

.method public getSupportedMimeTypes()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1260
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const-string v1, "application/vnd.sony.scan3d"

    .line 1261
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method public getTextColor(Landroid/content/Context;)I
    .locals 1

    const v0, 0x7f0600b4

    .line 1255
    invoke-virtual {p1, v0}, Landroid/content/Context;->getColor(I)I

    move-result p1

    return p1
.end method

.method public isEnabled(Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;Landroid/content/Context;I)Z
    .locals 0

    .line 1267
    sget-object p2, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->DEFAULT:Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    if-ne p1, p2, :cond_1

    const/16 p1, 0x100

    if-eq p3, p1, :cond_0

    const/16 p1, 0x101

    if-ne p3, p1, :cond_1

    :cond_0
    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public shareMesh(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V
    .locals 2

    .line 1244
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FaceBlendPlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    iget-object v0, p2, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    invoke-static {v0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendIntroFragment;->newInstance(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendIntroFragment;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->showFragment(Landroidx/fragment/app/Fragment;)V

    .line 1245
    sget-object p2, Lcom/sonymobile/scan3d/analytics/HitEvent;->SHARE_AS_FILE:Lcom/sonymobile/scan3d/analytics/HitEvent;

    const-wide/16 v0, 0x1

    invoke-virtual {p2, p1, v0, v1}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;J)V

    return-void
.end method
