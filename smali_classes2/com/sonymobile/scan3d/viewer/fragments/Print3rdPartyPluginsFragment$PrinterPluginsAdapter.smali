.class Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrinterPluginsAdapter;
.super Landroid/widget/BaseAdapter;
.source "Print3rdPartyPluginsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PrinterPluginsAdapter"
.end annotation


# instance fields
.field private final mPlugins:[Lcom/sonymobile/scan3d/sharing/Plugin;

.field final synthetic this$0:Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;)V
    .locals 5

    .line 351
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrinterPluginsAdapter;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 352
    new-instance v0, Lcom/sonymobile/scan3d/sharing/PrintSharePlugin;

    invoke-direct {v0, p1}, Lcom/sonymobile/scan3d/sharing/PrintSharePlugin;-><init>(Landroidx/fragment/app/Fragment;)V

    .line 353
    new-instance v1, Lcom/sonymobile/scan3d/sharing/PrintShareStlPlugin;

    invoke-direct {v1, p1}, Lcom/sonymobile/scan3d/sharing/PrintShareStlPlugin;-><init>(Landroidx/fragment/app/Fragment;)V

    .line 354
    invoke-static {}, Lcom/sonymobile/scan3d/sharing/SharingManager;->getInstance()Lcom/sonymobile/scan3d/sharing/SharingManager;

    move-result-object v2

    sget-object v3, Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;->PRINT:Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;

    invoke-static {p1}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->access$100(Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;)Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    move-result-object p1

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getScanType()I

    move-result p1

    invoke-virtual {v2, v3, p1}, Lcom/sonymobile/scan3d/sharing/SharingManager;->getPlugins(Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;I)Ljava/util/Set;

    move-result-object p1

    const/4 v2, 0x1

    const/4 v3, 0x2

    if-eqz p1, :cond_0

    .line 356
    invoke-interface {p1}, Ljava/util/Set;->size()I

    move-result v4

    add-int/2addr v4, v3

    new-array v3, v4, [Lcom/sonymobile/scan3d/sharing/Plugin;

    iput-object v3, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrinterPluginsAdapter;->mPlugins:[Lcom/sonymobile/scan3d/sharing/Plugin;

    .line 357
    iget-object v3, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrinterPluginsAdapter;->mPlugins:[Lcom/sonymobile/scan3d/sharing/Plugin;

    invoke-interface {p1, v3}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 358
    iget-object v3, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrinterPluginsAdapter;->mPlugins:[Lcom/sonymobile/scan3d/sharing/Plugin;

    invoke-interface {p1}, Ljava/util/Set;->size()I

    move-result v4

    aput-object v0, v3, v4

    .line 359
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrinterPluginsAdapter;->mPlugins:[Lcom/sonymobile/scan3d/sharing/Plugin;

    invoke-interface {p1}, Ljava/util/Set;->size()I

    move-result p1

    add-int/2addr p1, v2

    aput-object v1, v0, p1

    goto :goto_0

    .line 361
    :cond_0
    new-array p1, v3, [Lcom/sonymobile/scan3d/sharing/Plugin;

    const/4 v3, 0x0

    aput-object v0, p1, v3

    aput-object v1, p1, v2

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrinterPluginsAdapter;->mPlugins:[Lcom/sonymobile/scan3d/sharing/Plugin;

    :goto_0
    return-void
.end method


# virtual methods
.method componentSupportsMime(ILjava/lang/String;)Z
    .locals 1

    .line 407
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrinterPluginsAdapter;->mPlugins:[Lcom/sonymobile/scan3d/sharing/Plugin;

    aget-object p1, v0, p1

    .line 408
    instance-of v0, p1, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;

    if-eqz v0, :cond_0

    .line 409
    check-cast p1, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->supportsMime(Ljava/lang/String;)Z

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method getComponentForPosition(I)Landroid/content/ComponentName;
    .locals 1

    .line 394
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrinterPluginsAdapter;->mPlugins:[Lcom/sonymobile/scan3d/sharing/Plugin;

    aget-object p1, v0, p1

    .line 395
    instance-of v0, p1, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;

    if-eqz v0, :cond_0

    .line 396
    check-cast p1, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->getComponentName()Landroid/content/ComponentName;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getCount()I
    .locals 1

    .line 367
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrinterPluginsAdapter;->mPlugins:[Lcom/sonymobile/scan3d/sharing/Plugin;

    array-length v0, v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1

    .line 372
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrinterPluginsAdapter;->mPlugins:[Lcom/sonymobile/scan3d/sharing/Plugin;

    aget-object p1, v0, p1

    return-object p1
.end method

.method public getItemId(I)J
    .locals 2

    int-to-long v0, p1

    return-wide v0
.end method

.method getNameForPosition(I)Ljava/lang/String;
    .locals 1

    .line 403
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrinterPluginsAdapter;->mPlugins:[Lcom/sonymobile/scan3d/sharing/Plugin;

    aget-object p1, v0, p1

    check-cast p1, Lcom/sonymobile/scan3d/sharing/NamedPlugin;

    invoke-interface {p1}, Lcom/sonymobile/scan3d/sharing/NamedPlugin;->getAppName()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    if-nez p2, :cond_0

    .line 383
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrinterPluginsAdapter;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v0, 0x7f0c00a4

    const/4 v1, 0x0

    .line 384
    invoke-virtual {p2, v0, p3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    :cond_0
    const p3, 0x7f0901d9

    .line 386
    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/widget/TextView;

    .line 387
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrinterPluginsAdapter;->mPlugins:[Lcom/sonymobile/scan3d/sharing/Plugin;

    aget-object v0, v0, p1

    check-cast v0, Lcom/sonymobile/scan3d/sharing/NamedPlugin;

    invoke-interface {v0}, Lcom/sonymobile/scan3d/sharing/NamedPlugin;->getAppName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 388
    iget-object p3, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrinterPluginsAdapter;->mPlugins:[Lcom/sonymobile/scan3d/sharing/Plugin;

    aget-object p1, p3, p1

    check-cast p1, Lcom/sonymobile/scan3d/sharing/NamedPlugin;

    invoke-interface {p1}, Lcom/sonymobile/scan3d/sharing/NamedPlugin;->getAppIcon()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    const p3, 0x7f0900f1

    .line 389
    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/widget/ImageView;

    invoke-virtual {p3, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-object p2
.end method
