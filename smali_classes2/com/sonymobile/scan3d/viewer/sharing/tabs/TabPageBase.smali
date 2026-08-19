.class public abstract Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;
.super Landroidx/fragment/app/Fragment;
.source "TabPageBase.java"

# interfaces
.implements Lcom/sonymobile/scan3d/sharing/OnPluginUpdateListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$PluginAdapter;,
        Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$InfoHolder;,
        Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$InfoCard;,
        Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$ViewHolder;
    }
.end annotation


# static fields
.field private static final ARG_FILESET:Ljava/lang/String; = "fileset"

.field private static final ARG_POLICY:Ljava/lang/String; = "policy"

.field protected static final DIALOG_TAG:Ljava/lang/String; = "dialog_tag"

.field private static final KEY_BUSY_PLUGIN:Ljava/lang/String; = "BUSY_PLUGIN"

.field protected static final NO_BUSY_PLUGINS:I = -0x1

.field private static final TAG:Ljava/lang/String; = "com.sonymobile.scan3d.viewer.sharing.tabs.TabPageBase"


# instance fields
.field private mAdapter:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$PluginAdapter;

.field private mBusyPlugin:I

.field protected mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

.field protected mPermissionsContainer:Landroid/view/View;

.field protected mPermissionsHandler:Landroid/os/Handler;

.field protected mPluginUpdateListener:Lcom/sonymobile/scan3d/sharing/OnPluginUpdateListener;

.field private mPolicy:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 48
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    const/4 v0, -0x1

    .line 89
    iput v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->mBusyPlugin:I

    return-void
.end method

.method static synthetic access$000(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;)I
    .locals 0

    .line 48
    iget p0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->mBusyPlugin:I

    return p0
.end method

.method static synthetic access$100(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;)I
    .locals 0

    .line 48
    iget p0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->mPolicy:I

    return p0
.end method

.method protected static getBaseArguments(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;I)Landroid/os/Bundle;
    .locals 2

    .line 150
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "fileset"

    .line 151
    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string p0, "policy"

    .line 152
    invoke-virtual {v0, p0, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    return-object v0
.end method

.method public static synthetic lambda$onCreateView$0(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;)V
    .locals 5

    .line 110
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->getPlugins()Ljava/util/List;

    move-result-object v0

    .line 111
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    const/4 v2, 0x0

    const/16 v3, 0x8

    const v4, 0x7f0900ba

    if-eqz v1, :cond_0

    .line 112
    invoke-virtual {p1, v3}, Landroidx/recyclerview/widget/RecyclerView;->setVisibility(I)V

    .line 113
    invoke-virtual {p2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    .line 115
    :cond_0
    new-instance v1, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$PluginAdapter;

    invoke-direct {v1, p0, v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$PluginAdapter;-><init>(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;Ljava/util/List;)V

    iput-object v1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->mAdapter:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$PluginAdapter;

    .line 116
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->mAdapter:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$PluginAdapter;

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 117
    invoke-virtual {p2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    invoke-virtual {p2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 118
    invoke-virtual {p1, v2}, Landroidx/recyclerview/widget/RecyclerView;->setVisibility(I)V

    .line 119
    iget p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->mBusyPlugin:I

    const/4 p2, -0x1

    if-le p1, p2, :cond_1

    .line 120
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->mAdapter:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$PluginAdapter;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$PluginAdapter;->notifyDataSetChanged()V

    :cond_1
    :goto_0
    return-void
.end method

.method public static synthetic lambda$setupPermissionsButton$1(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;[Ljava/lang/String;ILandroid/view/View;)V
    .locals 1

    .line 399
    iget-object p3, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->mPermissionsContainer:Landroid/view/View;

    const/4 v0, 0x4

    invoke-virtual {p3, v0}, Landroid/view/View;->setVisibility(I)V

    .line 400
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p3

    invoke-static {p3, p1}, Lcom/sonymobile/scan3d/PermissionUtil;->shouldShowRequestPermissionRationale(Landroid/app/Activity;[Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_0

    .line 402
    invoke-virtual {p0, p1, p2}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->requestPermissions([Ljava/lang/String;I)V

    goto :goto_0

    .line 404
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/sonymobile/scan3d/PermissionUtil;->startAppSettings(Landroid/content/Context;)V

    :goto_0
    return-void
.end method

.method protected static showFragment(Landroidx/fragment/app/FragmentManager;Landroidx/fragment/app/Fragment;)V
    .locals 1

    .line 379
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object p0

    const/16 v0, 0x1003

    .line 380
    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentTransaction;->setTransition(I)Landroidx/fragment/app/FragmentTransaction;

    const v0, 0x7f0900dc

    .line 381
    invoke-virtual {p0, v0, p1}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 382
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroidx/fragment/app/FragmentTransaction;->addToBackStack(Ljava/lang/String;)Landroidx/fragment/app/FragmentTransaction;

    .line 383
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentTransaction;->commit()I

    return-void
.end method


# virtual methods
.method protected abstract getPlugins()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/sharing/Plugin;",
            ">;"
        }
    .end annotation
.end method

.method protected abstract hasFacePlugins()Z
.end method

.method protected onClickPlugin(Lcom/sonymobile/scan3d/sharing/Plugin;I)V
    .locals 1

    .line 169
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->sendClickEvent(Lcom/sonymobile/scan3d/sharing/Plugin;)V

    .line 170
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->getContext()Landroid/content/Context;

    move-result-object p2

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    invoke-interface {p1, p2, v0}, Lcom/sonymobile/scan3d/sharing/Plugin;->shareMesh(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 93
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 94
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "fileset"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    .line 95
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "policy"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->mPolicy:I

    .line 96
    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->mPermissionsHandler:Landroid/os/Handler;

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2

    const v0, 0x7f0c0073

    const/4 v1, 0x0

    .line 102
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f090168

    .line 103
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroidx/recyclerview/widget/RecyclerView;

    .line 104
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {p2, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    const/4 v0, -0x1

    if-eqz p3, :cond_0

    const-string v1, "BUSY_PLUGIN"

    .line 106
    invoke-virtual {p3, v1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    :cond_0
    iput v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->mBusyPlugin:I

    .line 109
    new-instance p3, Lcom/sonymobile/scan3d/viewer/sharing/tabs/-$$Lambda$TabPageBase$sSvMp2ecyhSUKAM6o4i6NIP_J3Q;

    invoke-direct {p3, p0, p2, p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/-$$Lambda$TabPageBase$sSvMp2ecyhSUKAM6o4i6NIP_J3Q;-><init>(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;)V

    iput-object p3, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->mPluginUpdateListener:Lcom/sonymobile/scan3d/sharing/OnPluginUpdateListener;

    const p2, 0x7f09014c

    .line 125
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->mPermissionsContainer:Landroid/view/View;

    return-object p1
.end method

.method public onDestroyView()V
    .locals 1

    .line 145
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroyView()V

    .line 146
    invoke-static {}, Lcom/sonymobile/scan3d/sharing/SharingManager;->getInstance()Lcom/sonymobile/scan3d/sharing/SharingManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/sonymobile/scan3d/sharing/SharingManager;->unregisterPluginUpdateListener(Lcom/sonymobile/scan3d/sharing/OnPluginUpdateListener;)V

    return-void
.end method

.method public onPluginsChanged()V
    .locals 7

    .line 219
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->getView()Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    const v1, 0x7f090168

    .line 223
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;

    .line 225
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->getPlugins()Ljava/util/List;

    move-result-object v2

    .line 226
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    const/4 v4, 0x0

    const/16 v5, 0x8

    const v6, 0x7f0900ba

    if-eqz v3, :cond_1

    .line 227
    invoke-virtual {v1, v5}, Landroidx/recyclerview/widget/RecyclerView;->setVisibility(I)V

    .line 228
    invoke-virtual {v0, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    .line 230
    :cond_1
    new-instance v3, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$PluginAdapter;

    invoke-direct {v3, p0, v2}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$PluginAdapter;-><init>(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;Ljava/util/List;)V

    iput-object v3, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->mAdapter:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$PluginAdapter;

    .line 231
    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->mAdapter:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$PluginAdapter;

    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 232
    invoke-virtual {v0, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    .line 233
    invoke-virtual {v1, v4}, Landroidx/recyclerview/widget/RecyclerView;->setVisibility(I)V

    .line 234
    iget v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->mBusyPlugin:I

    const/4 v1, -0x1

    if-le v0, v1, :cond_2

    .line 235
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->mAdapter:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$PluginAdapter;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$PluginAdapter;->notifyDataSetChanged()V

    :cond_2
    :goto_0
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    .line 139
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    const-string v0, "BUSY_PLUGIN"

    .line 140
    iget v1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->mBusyPlugin:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    return-void
.end method

.method public onStart()V
    .locals 1

    .line 132
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onStart()V

    .line 133
    invoke-static {}, Lcom/sonymobile/scan3d/sharing/SharingManager;->getInstance()Lcom/sonymobile/scan3d/sharing/SharingManager;

    move-result-object v0

    .line 134
    invoke-virtual {v0, p0}, Lcom/sonymobile/scan3d/sharing/SharingManager;->registerPluginUpdateListener(Lcom/sonymobile/scan3d/sharing/OnPluginUpdateListener;)V

    return-void
.end method

.method protected sendClickEvent(Lcom/sonymobile/scan3d/sharing/Plugin;)V
    .locals 2

    .line 190
    instance-of v0, p1, Lcom/sonymobile/scan3d/sharing/NamedPlugin;

    if-eqz v0, :cond_0

    .line 191
    sget-object v0, Lcom/sonymobile/scan3d/analytics/HitEvent;->SHARING_CARD_CLICKED:Lcom/sonymobile/scan3d/analytics/HitEvent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->getContext()Landroid/content/Context;

    move-result-object v1

    check-cast p1, Lcom/sonymobile/scan3d/sharing/NamedPlugin;

    invoke-interface {p1}, Lcom/sonymobile/scan3d/sharing/NamedPlugin;->getAppName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    .line 192
    :cond_0
    instance-of v0, p1, Lcom/sonymobile/scan3d/sharing/LocalPlugin;

    if-eqz v0, :cond_1

    .line 193
    sget-object v0, Lcom/sonymobile/scan3d/analytics/HitEvent;->SHARING_CARD_CLICKED:Lcom/sonymobile/scan3d/analytics/HitEvent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->getContext()Landroid/content/Context;

    move-result-object v1

    check-cast p1, Lcom/sonymobile/scan3d/sharing/LocalPlugin;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/sharing/LocalPlugin;->getDescriptor()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    .line 195
    :cond_1
    sget-object p1, Lcom/sonymobile/scan3d/analytics/HitEvent;->SHARING_CARD_CLICKED:Lcom/sonymobile/scan3d/analytics/HitEvent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "UnknownCard"

    invoke-virtual {p1, v0, v1}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method protected setupPermissionsButton(I[Ljava/lang/String;I)V
    .locals 2

    .line 395
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->mPermissionsContainer:Landroid/view/View;

    const v1, 0x7f09014e

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 396
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 397
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->mPermissionsContainer:Landroid/view/View;

    const v0, 0x7f09014b

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    .line 398
    new-instance v0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/-$$Lambda$TabPageBase$ocMi9uVVdfwaFpBKIE9KO7pHQVo;

    invoke-direct {v0, p0, p2, p3}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/-$$Lambda$TabPageBase$ocMi9uVVdfwaFpBKIE9KO7pHQVo;-><init>(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;[Ljava/lang/String;I)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method protected showFragment(Landroidx/fragment/app/Fragment;)V
    .locals 1

    .line 387
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->getParentFragment()Landroidx/fragment/app/Fragment;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->showFragment(Landroidx/fragment/app/FragmentManager;Landroidx/fragment/app/Fragment;)V

    return-void
.end method

.method protected startGooglePlay(Ljava/lang/String;)Z
    .locals 3

    .line 201
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.android.vending"

    .line 202
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 203
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "market://search?c=apps&q="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 204
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p1, 0x1

    return p1

    .line 208
    :catch_0
    sget-object p1, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->TAG:Ljava/lang/String;

    const-string v0, "No google play found"

    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    return p1
.end method

.method protected updateAdapter(I)V
    .locals 0

    .line 180
    iput p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->mBusyPlugin:I

    .line 181
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->mAdapter:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$PluginAdapter;

    if-eqz p1, :cond_0

    .line 182
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$PluginAdapter;->notifyDataSetChanged()V

    :cond_0
    return-void
.end method
