.class Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ShareAsVideoPlugin;
.super Lcom/sonymobile/scan3d/sharing/LocalPlugin;
.source "TabPageShare.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ShareAsVideoPlugin"
.end annotation


# static fields
.field private static final SHARE_AS_VIDEO_NAME:Ljava/lang/String; = "ShareAsVideo"


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;)V
    .locals 3

    .line 1300
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ShareAsVideoPlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    .line 1301
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string v0, "ShareAsVideo"

    const v1, 0x7f080148

    const v2, 0x7f100277

    invoke-direct {p0, p1, v1, v2, v0}, Lcom/sonymobile/scan3d/sharing/LocalPlugin;-><init>(Landroid/content/Context;IILjava/lang/String;)V

    return-void
.end method


# virtual methods
.method public getBackgroundColor()I
    .locals 1

    const v0, 0x7f0600b7

    return v0
.end method

.method public getTextColor(Landroid/content/Context;)I
    .locals 1

    const v0, 0x7f0600b7

    .line 1328
    invoke-virtual {p1, v0}, Landroid/content/Context;->getColor(I)I

    move-result p1

    return p1
.end method

.method public isEnabled(Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;Landroid/content/Context;I)Z
    .locals 0

    .line 1332
    sget-object p2, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->DEFAULT:Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    if-eq p1, p2, :cond_0

    sget-object p2, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->PROPS:Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    if-ne p1, p2, :cond_1

    :cond_0
    const/16 p1, 0x100

    if-eq p3, p1, :cond_2

    const/16 p1, 0x101

    if-ne p3, p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method public shareMesh(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V
    .locals 3

    .line 1307
    sget-object p1, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->STORAGE:Lcom/sonymobile/scan3d/PermissionUtil$Permissions;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->getPermissions()[Ljava/lang/String;

    move-result-object p1

    .line 1308
    sget-object p2, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->STORAGE:Lcom/sonymobile/scan3d/PermissionUtil$Permissions;

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->getRequestCode()I

    move-result p2

    .line 1309
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ShareAsVideoPlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/sonymobile/scan3d/PermissionUtil;->getMissingPermissions(Landroid/content/Context;[Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 1311
    array-length v1, v0

    if-lez v1, :cond_0

    .line 1312
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ShareAsVideoPlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    const v2, 0x7f1002a8

    invoke-virtual {v1, v2, p1, p2}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->setupPermissionsButton(I[Ljava/lang/String;I)V

    .line 1314
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ShareAsVideoPlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    const-string v1, "ShareAsVideo"

    invoke-static {p1, v1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->access$202(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;Ljava/lang/String;)Ljava/lang/String;

    .line 1315
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ShareAsVideoPlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    invoke-virtual {p1, v0, p2}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->requestPermissions([Ljava/lang/String;I)V

    goto :goto_0

    .line 1317
    :cond_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ShareAsVideoPlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    invoke-static {p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->access$300(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;)V

    :goto_0
    return-void
.end method
