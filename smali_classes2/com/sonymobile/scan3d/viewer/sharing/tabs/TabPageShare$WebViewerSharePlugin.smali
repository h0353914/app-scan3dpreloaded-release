.class Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$WebViewerSharePlugin;
.super Lcom/sonymobile/scan3d/sharing/LocalPlugin;
.source "TabPageShare.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "WebViewerSharePlugin"
.end annotation


# static fields
.field private static final KEY_DONT_SHOW_AGAIN:Ljava/lang/String; = "WebViewerSharePlugin_dontShowAgain"

.field private static final WEBVIEWER_NAME:Ljava/lang/String; = "WebViewer"


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;)V
    .locals 3

    .line 933
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$WebViewerSharePlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    .line 934
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string v0, "WebViewer"

    const v1, 0x7f08014f

    const v2, 0x7f100279

    invoke-direct {p0, p1, v1, v2, v0}, Lcom/sonymobile/scan3d/sharing/LocalPlugin;-><init>(Landroid/content/Context;IILjava/lang/String;)V

    return-void
.end method


# virtual methods
.method public getBackgroundColor()I
    .locals 2

    .line 970
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$WebViewerSharePlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0600be

    invoke-virtual {v0, v1}, Landroid/content/Context;->getColor(I)I

    move-result v0

    return v0
.end method

.method public isEnabled(Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;Landroid/content/Context;I)Z
    .locals 0

    .line 975
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->WEBVIEWER:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->isEnabled(Landroid/content/Context;)Z

    move-result p1

    return p1
.end method

.method public shareMesh(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V
    .locals 3

    .line 939
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    const-string v0, "WebViewerSharePlugin_dontShowAgain"

    const/4 v1, 0x0

    .line 940
    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    .line 941
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$WebViewerSharePlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    invoke-static {v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->access$100(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    move-result-object v0

    .line 943
    sget-object v2, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->WEBVIEWER:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    invoke-virtual {v0, v2}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setRecipient(Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    if-eqz p1, :cond_1

    .line 945
    sget-object p1, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$1;->$SwitchMap$com$sonymobile$scan3d$viewer$sharing$Shareable$Type:[I

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->getShareType()Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    move-result-object v2

    invoke-virtual {v2}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->ordinal()I

    move-result v2

    aget p1, p1, v2

    packed-switch p1, :pswitch_data_0

    .line 952
    invoke-interface {p2}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->isRigged()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 954
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$WebViewerSharePlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->newInstance(Lcom/sonymobile/scan3d/viewer/sharing/Shareable;Z)Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->showFragment(Landroidx/fragment/app/Fragment;)V

    goto :goto_0

    .line 948
    :pswitch_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$WebViewerSharePlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->share(Landroid/content/Context;)V

    goto :goto_0

    .line 957
    :cond_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$WebViewerSharePlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->share(Landroid/content/Context;)V

    goto :goto_0

    :cond_1
    const-string p1, "WebViewerSharePlugin_dontShowAgain"

    .line 962
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$WebViewerSharePlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    .line 963
    invoke-static {p1, v0, p2}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$WebViewerPrivacyDialog;->newInstance(Ljava/lang/String;Lcom/sonymobile/scan3d/viewer/sharing/Shareable;Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;)Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$WebViewerPrivacyDialog;

    move-result-object p1

    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$WebViewerSharePlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    .line 964
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p2

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$WebViewerPrivacyDialog;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
