.class Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FindMorePlugin;
.super Lcom/sonymobile/scan3d/sharing/LocalPlugin;
.source "TabPageShare.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FindMorePlugin"
.end annotation


# static fields
.field private static final FIND_MORE_NAME:Ljava/lang/String; = "FindMoreApps"


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;)V
    .locals 3

    .line 1377
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FindMorePlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    .line 1378
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string v0, "FindMoreApps"

    const v1, 0x7f08014b

    const v2, 0x7f10012a

    invoke-direct {p0, p1, v1, v2, v0}, Lcom/sonymobile/scan3d/sharing/LocalPlugin;-><init>(Landroid/content/Context;IILjava/lang/String;)V

    return-void
.end method


# virtual methods
.method public getBackgroundColor()I
    .locals 2

    .line 1392
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FindMorePlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0600b9

    invoke-virtual {v0, v1}, Landroid/content/Context;->getColor(I)I

    move-result v0

    return v0
.end method

.method public isEnabled(Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;Landroid/content/Context;I)Z
    .locals 0

    .line 1397
    sget-object p2, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->PROPS:Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    if-eq p1, p2, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public shareMesh(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V
    .locals 2

    .line 1383
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "\""

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const v0, 0x7f100176

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\""

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1385
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FindMorePlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    invoke-virtual {p2, p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->startGooglePlay(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 1386
    sget-object p1, Lcom/sonymobile/scan3d/analytics/HitEvent;->FIND_MORE_SHARE:Lcom/sonymobile/scan3d/analytics/HitEvent;

    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FindMorePlugin;->mContext:Landroid/content/Context;

    const-wide/16 v0, 0x1

    invoke-virtual {p1, p2, v0, v1}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;J)V

    :cond_0
    return-void
.end method
