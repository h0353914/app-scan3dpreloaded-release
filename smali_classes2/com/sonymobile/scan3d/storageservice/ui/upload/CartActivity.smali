.class public Lcom/sonymobile/scan3d/storageservice/ui/upload/CartActivity;
.super Landroid/app/Activity;
.source "CartActivity.java"


# static fields
.field static final EXTRA_PROVIDER:Ljava/lang/String; = "com.sonymobile.sphinx.EXTRA_PROVIDER"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 24
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 27
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/CartActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "com.sonymobile.sphinx.EXTRA_PROVIDER"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    move-result-object p1

    .line 28
    invoke-virtual {p1, p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->sendCartScreenEvent(Landroid/content/Context;)V

    .line 30
    new-instance p1, Landroidx/browser/customtabs/CustomTabsIntent$Builder;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Landroidx/browser/customtabs/CustomTabsIntent$Builder;-><init>(Landroidx/browser/customtabs/CustomTabsSession;)V

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->setShowTitle(Z)Landroidx/browser/customtabs/CustomTabsIntent$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->build()Landroidx/browser/customtabs/CustomTabsIntent;

    move-result-object p1

    .line 31
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/CartActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p1, p0, v0}, Landroidx/browser/customtabs/CustomTabsIntent;->launchUrl(Landroid/content/Context;Landroid/net/Uri;)V

    .line 32
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/CartActivity;->finish()V

    return-void
.end method
