.class public Lcom/sonymobile/scan3d/storageservice/ui/upload/CallbackAuthenticationFragment;
.super Lcom/sonymobile/scan3d/storageservice/ui/upload/ListenableFragment;
.source "CallbackAuthenticationFragment.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/sonymobile/scan3d/storageservice/ui/upload/ListenableFragment<",
        "Lcom/sonymobile/scan3d/storageservice/network/Credentials;",
        ">;"
    }
.end annotation


# static fields
.field protected static final KEY_AUTH_URL:Ljava/lang/String; = "auth_url"

.field private static final LOG_TAG:Ljava/lang/String; = "com.sonymobile.scan3d.storageservice.ui.upload.CallbackAuthenticationFragment"

.field private static final OAUTH_ACCESS_TOKEN_QUERY_KEY:Ljava/lang/String; = "access_token"

.field private static final UTF8_CHARSET:Ljava/lang/String; = "UTF-8"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ListenableFragment;-><init>()V

    return-void
.end method

.method private getCredentials(Landroid/net/Uri;)Lcom/sonymobile/scan3d/storageservice/network/Credentials;
    .locals 1

    .line 125
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/CallbackAuthenticationFragment;->getQueryParams(Landroid/net/Uri;)Ljava/util/Map;

    move-result-object p1

    const-string v0, "access_token"

    .line 126
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_0

    .line 130
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/network/Credentials;

    invoke-direct {v0, p1}, Lcom/sonymobile/scan3d/storageservice/network/Credentials;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method private getQueryParams(Landroid/net/Uri;)Ljava/util/Map;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 143
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 145
    :try_start_0
    invoke-virtual {p1}, Landroid/net/Uri;->getFragment()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_0

    const-string v1, "&"

    .line 147
    invoke-virtual {p1, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    .line 148
    array-length v1, p1

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_0

    aget-object v4, p1, v3

    const-string v5, "="

    .line 149
    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    .line 150
    invoke-virtual {v4, v2, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    const-string v7, "UTF-8"

    invoke-static {v6, v7}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    add-int/lit8 v5, v5, 0x1

    .line 151
    invoke-virtual {v4, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    const-string v5, "UTF-8"

    invoke-static {v4, v5}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 150
    invoke-interface {v0, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :catch_0
    move-exception p1

    .line 155
    sget-object v1, Lcom/sonymobile/scan3d/storageservice/ui/upload/CallbackAuthenticationFragment;->LOG_TAG:Ljava/lang/String;

    const-string v2, "getQueryParams() : could not get query parameters."

    invoke-static {v1, v2, p1}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-object v0
.end method

.method public static newInstance(Ljava/lang/String;I)Lcom/sonymobile/scan3d/storageservice/ui/upload/CallbackAuthenticationFragment;
    .locals 2

    .line 53
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "auth_url"

    .line 54
    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "id"

    .line 55
    invoke-virtual {v0, p0, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 57
    new-instance p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/CallbackAuthenticationFragment;

    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/CallbackAuthenticationFragment;-><init>()V

    .line 58
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/CallbackAuthenticationFragment;->setArguments(Landroid/os/Bundle;)V

    return-object p0
.end method


# virtual methods
.method protected final loadUrl(Ljava/lang/String;)V
    .locals 3

    if-eqz p1, :cond_0

    .line 86
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/CallbackAuthenticationFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/sonymobile/scan3d/storageservice/ui/upload/OauthCallbackActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "url"

    .line 87
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/16 p1, 0xa

    .line 88
    invoke-virtual {p0, v0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/CallbackAuthenticationFragment;->startActivityForResult(Landroid/content/Intent;I)V

    return-void

    .line 90
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Invalid url."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1

    .line 64
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ListenableFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 66
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/CallbackAuthenticationFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "auth_url"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/CallbackAuthenticationFragment;->loadUrl(Ljava/lang/String;)V

    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 0

    .line 96
    invoke-super {p0, p1, p2, p3}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ListenableFragment;->onActivityResult(IILandroid/content/Intent;)V

    packed-switch p2, :pswitch_data_0

    goto :goto_0

    .line 111
    :pswitch_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/CallbackAuthenticationFragment;->onCancel()V

    goto :goto_0

    :pswitch_1
    if-eqz p3, :cond_1

    .line 99
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 100
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/CallbackAuthenticationFragment;->getCredentials(Landroid/net/Uri;)Lcom/sonymobile/scan3d/storageservice/network/Credentials;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 102
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/CallbackAuthenticationFragment;->onSuccess(Ljava/lang/Object;)V

    goto :goto_0

    .line 104
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/CallbackAuthenticationFragment;->onCancel()V

    goto :goto_0

    .line 107
    :cond_1
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/CallbackAuthenticationFragment;->onCancel()V

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onBackPressed()Z
    .locals 1

    .line 77
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/CallbackAuthenticationFragment;->onDismiss()V

    const/4 v0, 0x1

    return v0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0c0060

    const/4 v0, 0x0

    .line 72
    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method
