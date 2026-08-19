.class Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileSharePlugin;
.super Lcom/sonymobile/scan3d/sharing/LocalPlugin;
.source "TabPageShare.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FileSharePlugin"
.end annotation


# static fields
.field private static final ADV_FILE_SHARE_NAME:Ljava/lang/String; = "AdvFileSharing"

.field private static final KEY_DONT_SHOW_AGAIN:Ljava/lang/String; = "FileSharePlugin_dontShowAgain"


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;)V
    .locals 3

    .line 1066
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileSharePlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    .line 1067
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string v0, "AdvFileSharing"

    const v1, 0x7f080147

    const v2, 0x7f100275

    invoke-direct {p0, p1, v1, v2, v0}, Lcom/sonymobile/scan3d/sharing/LocalPlugin;-><init>(Landroid/content/Context;IILjava/lang/String;)V

    return-void
.end method


# virtual methods
.method public getBackgroundColor()I
    .locals 2

    .line 1118
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileSharePlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0600b5

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

    .line 1123
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const-string v1, "application/vnd.sony.scan3d"

    .line 1124
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const-string v1, "model/gltf-binary"

    .line 1125
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method public isEnabled(Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;Landroid/content/Context;I)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method

.method public shareMesh(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V
    .locals 5

    .line 1072
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileSharePlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    invoke-static {v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->access$100(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    move-result-object v0

    .line 1073
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "FileSharePlugin_dontShowAgain"

    const/4 v3, 0x0

    .line 1074
    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 1076
    sget-object v2, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$1;->$SwitchMap$com$sonymobile$scan3d$viewer$sharing$Shareable$Type:[I

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->getShareType()Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    move-result-object v4

    invoke-virtual {v4}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->ordinal()I

    move-result v4

    aget v2, v2, v4

    const/4 v4, 0x0

    packed-switch v2, :pswitch_data_0

    .line 1093
    invoke-virtual {v0, v3}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setRecipientRequired(Z)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    .line 1094
    invoke-interface {p2}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->isRigged()Z

    move-result p2

    if-eqz p2, :cond_1

    .line 1096
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileSharePlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    invoke-static {v0, v3}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->newInstance(Lcom/sonymobile/scan3d/viewer/sharing/Shareable;Z)Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->showFragment(Landroidx/fragment/app/Fragment;)V

    goto :goto_0

    :pswitch_0
    if-nez v1, :cond_0

    const-string p2, "FileSharePlugin_dontShowAgain"

    .line 1080
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileSharePlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    .line 1081
    invoke-static {p2, v0, v1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileSharePrivacyDialog;->newInstance(Ljava/lang/String;Lcom/sonymobile/scan3d/viewer/sharing/Shareable;Landroidx/fragment/app/Fragment;)Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileSharePrivacyDialog;

    move-result-object p2

    .line 1082
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileSharePlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-virtual {p2, v0, v4}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileSharePrivacyDialog;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    goto :goto_0

    .line 1084
    :cond_0
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileSharePlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {v0, p2}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->share(Landroid/content/Context;)V

    .line 1086
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileSharePlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p2

    invoke-virtual {p2}, Landroidx/fragment/app/FragmentManager;->popBackStack()V

    goto :goto_0

    :cond_1
    if-eqz v1, :cond_2

    .line 1100
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileSharePlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {v0, p2}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->share(Landroid/content/Context;)V

    goto :goto_0

    :cond_2
    const-string p2, "FileSharePlugin_dontShowAgain"

    .line 1103
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileSharePlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    .line 1104
    invoke-static {p2, v0, v1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileSharePrivacyDialog;->newInstance(Ljava/lang/String;Lcom/sonymobile/scan3d/viewer/sharing/Shareable;Landroidx/fragment/app/Fragment;)Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileSharePrivacyDialog;

    move-result-object p2

    .line 1106
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileSharePlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-virtual {p2, v0, v4}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileSharePrivacyDialog;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    .line 1111
    :goto_0
    sget-object p2, Lcom/sonymobile/scan3d/analytics/HitEvent;->SHARE_AS_FILE:Lcom/sonymobile/scan3d/analytics/HitEvent;

    const-wide/16 v0, 0x1

    invoke-virtual {p2, p1, v0, v1}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;J)V

    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
