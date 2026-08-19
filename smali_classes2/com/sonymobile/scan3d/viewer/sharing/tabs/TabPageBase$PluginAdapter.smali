.class Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$PluginAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "TabPageBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PluginAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Landroidx/recyclerview/widget/RecyclerView$ViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private final mPlugins:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/sharing/Plugin;",
            ">;)V"
        }
    .end annotation

    .line 319
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$PluginAdapter;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;

    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 317
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$PluginAdapter;->mPlugins:Ljava/util/List;

    .line 320
    iget-object v0, p1, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getScanType()I

    move-result v0

    .line 321
    invoke-static {p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->access$100(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;)I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_1

    .line 322
    invoke-static {p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->access$100(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;)I

    move-result v1

    const/16 v4, 0xa

    if-eq v1, v4, :cond_1

    .line 323
    invoke-static {p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->access$100(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;)I

    move-result v1

    if-eq v1, v3, :cond_1

    .line 324
    invoke-static {p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->access$100(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;)I

    move-result v1

    const/16 v4, 0xb

    if-ne v1, v4, :cond_0

    goto :goto_0

    :cond_0
    move v1, v2

    goto :goto_1

    :cond_1
    :goto_0
    move v1, v3

    :goto_1
    const/16 v4, 0x100

    if-eq v0, v4, :cond_2

    const/16 v4, 0x101

    if-ne v0, v4, :cond_3

    :cond_2
    move v2, v3

    :cond_3
    if-eqz v1, :cond_4

    .line 326
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->hasFacePlugins()Z

    move-result v0

    if-eqz v0, :cond_4

    if-nez v2, :cond_4

    .line 329
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$PluginAdapter;->mPlugins:Ljava/util/List;

    new-instance v1, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$InfoCard;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->getContext()Landroid/content/Context;

    move-result-object p1

    const v2, 0x7f10017f

    invoke-virtual {p1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    const/4 v2, 0x0

    invoke-direct {v1, p1, v2}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$InfoCard;-><init>(Ljava/lang/String;Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$1;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 331
    :cond_4
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$PluginAdapter;->mPlugins:Ljava/util/List;

    invoke-interface {p1, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .line 374
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$PluginAdapter;->mPlugins:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItemViewType(I)I
    .locals 1

    .line 365
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$PluginAdapter;->mPlugins:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    instance-of p1, p1, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$InfoCard;

    if-eqz p1, :cond_0

    const p1, 0x7f0c00b2

    return p1

    :cond_0
    const p1, 0x7f0c00b0

    return p1
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 1
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 355
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$PluginAdapter;->mPlugins:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$InfoCard;

    if-eqz v0, :cond_0

    .line 356
    check-cast p1, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$InfoHolder;

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$PluginAdapter;->mPlugins:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$InfoCard;

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$InfoHolder;->bind(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$InfoCard;)V

    goto :goto_0

    .line 358
    :cond_0
    check-cast p1, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$ViewHolder;

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$PluginAdapter;->mPlugins:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/sonymobile/scan3d/sharing/Plugin;

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$ViewHolder;->bind(Lcom/sonymobile/scan3d/sharing/Plugin;)V

    :goto_0
    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 2
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    const/4 v0, 0x0

    const v1, 0x7f0c00b0

    if-eq p2, v1, :cond_1

    const v1, 0x7f0c00b2

    if-ne p2, v1, :cond_0

    .line 344
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    invoke-virtual {p2, v1, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 346
    new-instance p2, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$InfoHolder;

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$PluginAdapter;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;

    invoke-direct {p2, v0, p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$InfoHolder;-><init>(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;Landroid/view/View;)V

    return-object p2

    .line 349
    :cond_0
    new-instance p1, Ljava/lang/RuntimeException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unknown ViewType: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 339
    :cond_1
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    invoke-virtual {p2, v1, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 341
    new-instance p2, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$ViewHolder;

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$PluginAdapter;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;

    invoke-direct {p2, v0, p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$ViewHolder;-><init>(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;Landroid/view/View;)V

    return-object p2
.end method
