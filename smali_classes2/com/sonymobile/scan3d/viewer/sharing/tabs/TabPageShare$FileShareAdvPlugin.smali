.class Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileShareAdvPlugin;
.super Lcom/sonymobile/scan3d/sharing/LocalPlugin;
.source "TabPageShare.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FileShareAdvPlugin"
.end annotation


# static fields
.field private static final FILE_SHARE_NAME:Ljava/lang/String; = "ShareFile"

.field private static final KEY_DONT_SHOW_AGAIN:Ljava/lang/String; = "FileShareAdvPlugin_dontShowAgain"


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;)V
    .locals 3

    .line 1140
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileShareAdvPlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    .line 1141
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string v0, "ShareFile"

    const v1, 0x7f080145

    const v2, 0x7f100264

    invoke-direct {p0, p1, v1, v2, v0}, Lcom/sonymobile/scan3d/sharing/LocalPlugin;-><init>(Landroid/content/Context;IILjava/lang/String;)V

    return-void
.end method


# virtual methods
.method public getBackgroundColor()I
    .locals 2

    .line 1164
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileShareAdvPlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0600b6

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

    .line 1169
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const-string v1, "application/vnd.sony.scan3d"

    .line 1170
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method public isEnabled(Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;Landroid/content/Context;I)Z
    .locals 0

    .line 1176
    sget-object p2, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->DEFAULT:Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    if-ne p1, p2, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public shareMesh(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V
    .locals 3

    .line 1146
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileShareAdvPlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    invoke-static {p2}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->access$100(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    move-result-object p2

    .line 1147
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "FileShareAdvPlugin_dontShowAgain"

    const/4 v2, 0x0

    .line 1148
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 1151
    invoke-static {p2}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$RadioButtonDialogFragment;->newInstance(Lcom/sonymobile/scan3d/viewer/sharing/Shareable;)Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$RadioButtonDialogFragment;

    move-result-object p2

    .line 1152
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileShareAdvPlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-virtual {p2, v0, v1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$RadioButtonDialogFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const-string v0, "FileShareAdvPlugin_dontShowAgain"

    .line 1154
    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileShareAdvPlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    .line 1155
    invoke-static {v0, p2, v2}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileShareAdvPrivacyDialog;->newInstance(Ljava/lang/String;Lcom/sonymobile/scan3d/viewer/sharing/Shareable;Landroidx/fragment/app/Fragment;)Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileShareAdvPrivacyDialog;

    move-result-object p2

    .line 1156
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileShareAdvPlugin;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-virtual {p2, v0, v1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileShareAdvPrivacyDialog;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    .line 1158
    :goto_0
    sget-object p2, Lcom/sonymobile/scan3d/analytics/HitEvent;->ADV_SHARE_AS_FILE:Lcom/sonymobile/scan3d/analytics/HitEvent;

    const-wide/16 v0, 0x1

    invoke-virtual {p2, p1, v0, v1}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;J)V

    return-void
.end method
