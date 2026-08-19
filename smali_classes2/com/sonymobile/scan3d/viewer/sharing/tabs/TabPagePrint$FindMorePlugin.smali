.class Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint$FindMorePlugin;
.super Lcom/sonymobile/scan3d/sharing/LocalPlugin;
.source "TabPagePrint.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FindMorePlugin"
.end annotation


# static fields
.field private static final FIND_MORE_NAME:Ljava/lang/String; = "FindMoreApps"


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint;)V
    .locals 3

    .line 118
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint$FindMorePlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint;

    .line 119
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string v0, "FindMoreApps"

    const v1, 0x7f08011f

    const v2, 0x7f10012a

    invoke-direct {p0, p1, v1, v2, v0}, Lcom/sonymobile/scan3d/sharing/LocalPlugin;-><init>(Landroid/content/Context;IILjava/lang/String;)V

    return-void
.end method


# virtual methods
.method public getBackgroundColor()I
    .locals 2

    .line 133
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint$FindMorePlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0600b9

    invoke-virtual {v0, v1}, Landroid/content/Context;->getColor(I)I

    move-result v0

    return v0
.end method

.method public isEnabled(Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;Landroid/content/Context;I)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method

.method public shareMesh(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V
    .locals 2

    .line 124
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

    .line 126
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint$FindMorePlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint;

    invoke-virtual {p2, p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint;->startGooglePlay(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 127
    sget-object p1, Lcom/sonymobile/scan3d/analytics/HitEvent;->FIND_MORE_PRINTING:Lcom/sonymobile/scan3d/analytics/HitEvent;

    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint$FindMorePlugin;->mContext:Landroid/content/Context;

    const-wide/16 v0, 0x1

    invoke-virtual {p1, p2, v0, v1}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;J)V

    :cond_0
    return-void
.end method
