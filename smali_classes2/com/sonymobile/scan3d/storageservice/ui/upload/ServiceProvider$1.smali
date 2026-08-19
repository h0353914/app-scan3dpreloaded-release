.class final enum Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider$1;
.super Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;
.source "ServiceProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4008
    name = null
.end annotation


# direct methods
.method varargs constructor <init>(Ljava/lang/String;IIIII[Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;)V
    .locals 9

    const/4 v8, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    move-object/from16 v7, p7

    .line 52
    invoke-direct/range {v0 .. v8}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;-><init>(Ljava/lang/String;IIIII[Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider$1;)V

    return-void
.end method


# virtual methods
.method create(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/network/Credentials;Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;Landroid/net/Uri;Landroid/os/Bundle;)Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;
    .locals 8

    .line 58
    new-instance v7, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerActionTask;

    move-object v0, v7

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerActionTask;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/network/Credentials;Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;Landroid/net/Uri;Landroid/os/Bundle;)V

    return-object v7
.end method

.method getAuthenticationFragment(Landroid/content/Context;I)Lcom/sonymobile/scan3d/storageservice/ui/upload/ListenableFragment;
    .locals 0

    .line 89
    invoke-static {p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;->newInstance(I)Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerAuthenticationFragment;

    move-result-object p1

    return-object p1
.end method

.method getIntent(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;Ljava/lang/String;Lcom/sonymobile/scan3d/storageservice/network/Credentials;Landroid/os/Bundle;)Landroid/content/Intent;
    .locals 2

    .line 65
    new-instance p4, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    const-string v0, "com.sonymobile.scan3d.extra.SHAREABLE"

    invoke-virtual {p5, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p5

    invoke-direct {p4, p5}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;-><init>(Landroid/os/Bundle;)V

    .line 66
    sget-object p5, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider$2;->$SwitchMap$com$sonymobile$scan3d$storageservice$ui$upload$Action:[I

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->ordinal()I

    move-result p2

    aget p2, p5, p2

    const-wide/16 v0, 0x1

    packed-switch p2, :pswitch_data_0

    goto :goto_0

    .line 76
    :pswitch_0
    new-instance p2, Landroid/content/Intent;

    const-string p5, "android.intent.action.VIEW"

    invoke-direct {p2, p5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 77
    invoke-static {p1, p3, p4}, Lcom/sonymobile/scan3d/storageservice/Config;->getWebViewerShareUrl(Landroid/content/Context;Ljava/lang/String;Lcom/sonymobile/scan3d/viewer/sharing/Shareable;)Ljava/lang/String;

    move-result-object p3

    invoke-static {p3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const/high16 p3, 0x10000000

    .line 78
    invoke-virtual {p2, p3}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 79
    sget-object p3, Lcom/sonymobile/scan3d/analytics/HitEvent;->VIEW_VIA_WEBVIEWER:Lcom/sonymobile/scan3d/analytics/HitEvent;

    invoke-virtual {p3, p1, v0, v1}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;J)V

    goto :goto_1

    .line 73
    :pswitch_1
    sget-object p2, Lcom/sonymobile/scan3d/analytics/HitEvent;->UNSHARE_VIA_WEBVIEWER:Lcom/sonymobile/scan3d/analytics/HitEvent;

    invoke-virtual {p2, p1, v0, v1}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;J)V

    goto :goto_0

    .line 68
    :pswitch_2
    invoke-static {p1, p3, p4}, Lcom/sonymobile/scan3d/storageservice/Config;->getWebViewerShareUrl(Landroid/content/Context;Ljava/lang/String;Lcom/sonymobile/scan3d/viewer/sharing/Shareable;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->access$100(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p2

    .line 70
    sget-object p3, Lcom/sonymobile/scan3d/analytics/HitEvent;->SHARE_VIA_WEBVIEWER:Lcom/sonymobile/scan3d/analytics/HitEvent;

    invoke-virtual {p3, p1, v0, v1}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;J)V

    goto :goto_1

    :goto_0
    const/4 p2, 0x0

    :goto_1
    return-object p2

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method isValid(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/Upload;Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;)Z
    .locals 2

    .line 95
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider$2;->$SwitchMap$com$sonymobile$scan3d$storageservice$ui$upload$Action:[I

    invoke-virtual {p3}, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->ordinal()I

    move-result p3

    aget p1, p1, p3

    const/4 p3, 0x1

    const/4 v0, 0x0

    const/4 v1, 0x2

    if-eq p1, v1, :cond_1

    .line 100
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/provider/Upload;->getUid()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    move p3, v0

    goto :goto_0

    .line 97
    :cond_1
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/provider/Upload;->getUid()Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_2

    goto :goto_0

    :cond_2
    move p3, v0

    :goto_0
    return p3
.end method

.method sendActionScreenEvent(Landroid/content/Context;)V
    .locals 1

    .line 108
    sget-object v0, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->WEBVIEWER_SCREEN:Lcom/sonymobile/scan3d/analytics/ScreenEvent;

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->send(Landroid/content/Context;)V

    return-void
.end method

.method sendCartScreenEvent(Landroid/content/Context;)V
    .locals 0

    return-void
.end method
