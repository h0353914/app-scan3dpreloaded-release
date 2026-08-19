.class Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$PropsPlugin;
.super Lcom/sonymobile/scan3d/sharing/LocalPlugin;
.source "TabPageShare.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PropsPlugin"
.end annotation


# static fields
.field private static final SHARE_PROPS:Ljava/lang/String; = "Props"


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;)V
    .locals 3

    .line 1276
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$PropsPlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    .line 1277
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string v0, "Props"

    const v1, 0x7f08014d

    const v2, 0x7f10027a

    invoke-direct {p0, p1, v1, v2, v0}, Lcom/sonymobile/scan3d/sharing/LocalPlugin;-><init>(Landroid/content/Context;IILjava/lang/String;)V

    return-void
.end method


# virtual methods
.method public getBackgroundColor()I
    .locals 2

    .line 1287
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$PropsPlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0600bb

    invoke-virtual {v0, v1}, Landroid/content/Context;->getColor(I)I

    move-result v0

    return v0
.end method

.method public isEnabled(Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;Landroid/content/Context;I)Z
    .locals 0

    .line 1292
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
    .locals 0

    .line 1282
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$PropsPlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    invoke-static {}, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->newInstance()Landroidx/fragment/app/Fragment;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->showFragment(Landroidx/fragment/app/Fragment;)V

    return-void
.end method
