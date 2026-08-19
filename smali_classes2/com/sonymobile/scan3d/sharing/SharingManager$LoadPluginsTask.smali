.class Lcom/sonymobile/scan3d/sharing/SharingManager$LoadPluginsTask;
.super Landroid/os/AsyncTask;
.source "SharingManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/sharing/SharingManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LoadPluginsTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/util/Map<",
        "Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;",
        "Ljava/util/Map<",
        "Ljava/lang/Integer;",
        "Ljava/util/Set<",
        "Lcom/sonymobile/scan3d/sharing/Plugin;",
        ">;>;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/sharing/SharingManager;


# direct methods
.method private constructor <init>(Lcom/sonymobile/scan3d/sharing/SharingManager;)V
    .locals 0

    .line 241
    iput-object p1, p0, Lcom/sonymobile/scan3d/sharing/SharingManager$LoadPluginsTask;->this$0:Lcom/sonymobile/scan3d/sharing/SharingManager;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/sonymobile/scan3d/sharing/SharingManager;Lcom/sonymobile/scan3d/sharing/SharingManager$1;)V
    .locals 0

    .line 241
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/sharing/SharingManager$LoadPluginsTask;-><init>(Lcom/sonymobile/scan3d/sharing/SharingManager;)V

    return-void
.end method

.method private addPluginPackagesByMime(Ljava/lang/String;Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/content/pm/ResolveInfo;",
            ">;)V"
        }
    .end annotation

    .line 297
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.SEND"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 298
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 299
    iget-object v1, p0, Lcom/sonymobile/scan3d/sharing/SharingManager$LoadPluginsTask;->this$0:Lcom/sonymobile/scan3d/sharing/SharingManager;

    invoke-static {v1}, Lcom/sonymobile/scan3d/sharing/SharingManager;->access$200(Lcom/sonymobile/scan3d/sharing/SharingManager;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const/16 v2, 0xc0

    invoke-virtual {v1, v0, v2}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v0

    .line 301
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/pm/ResolveInfo;

    .line 302
    iget-object v2, v1, Landroid/content/pm/ResolveInfo;->filter:Landroid/content/IntentFilter;

    invoke-virtual {v2}, Landroid/content/IntentFilter;->typesIterator()Ljava/util/Iterator;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 306
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 309
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object v3, v1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v3, v3, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    .line 310
    invoke-interface {p2, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 311
    iget-object v2, v1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v2, v2, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-interface {p2, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_2
    return-void
.end method

.method private getMetaValue(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    if-nez p1, :cond_0

    goto :goto_0

    .line 320
    :cond_0
    invoke-virtual {p1, p2, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method private getPluginList(Ljava/util/Map;Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;I)Ljava/util/Set;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/Set<",
            "Lcom/sonymobile/scan3d/sharing/Plugin;",
            ">;>;>;",
            "Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;",
            "I)",
            "Ljava/util/Set<",
            "Lcom/sonymobile/scan3d/sharing/Plugin;",
            ">;"
        }
    .end annotation

    .line 285
    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    sget-object p3, Lcom/sonymobile/scan3d/sharing/-$$Lambda$SharingManager$LoadPluginsTask$vfYDNQiTMJxB7VrG71aLEYxg89Q;->INSTANCE:Lcom/sonymobile/scan3d/sharing/-$$Lambda$SharingManager$LoadPluginsTask$vfYDNQiTMJxB7VrG71aLEYxg89Q;

    invoke-interface {p1, p2, p3}, Ljava/util/Map;->computeIfAbsent(Ljava/lang/Object;Ljava/util/function/Function;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Set;

    return-object p1
.end method

.method private getPluginPackages()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/content/pm/ResolveInfo;",
            ">;"
        }
    .end annotation

    .line 289
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "application/vnd.sony.scan3d"

    .line 290
    invoke-direct {p0, v1, v0}, Lcom/sonymobile/scan3d/sharing/SharingManager$LoadPluginsTask;->addPluginPackagesByMime(Ljava/lang/String;Ljava/util/Map;)V

    const-string v1, "application/sla"

    .line 291
    invoke-direct {p0, v1, v0}, Lcom/sonymobile/scan3d/sharing/SharingManager$LoadPluginsTask;->addPluginPackagesByMime(Ljava/lang/String;Ljava/util/Map;)V

    const-string v1, "model/gltf-binary"

    .line 292
    invoke-direct {p0, v1, v0}, Lcom/sonymobile/scan3d/sharing/SharingManager$LoadPluginsTask;->addPluginPackagesByMime(Ljava/lang/String;Ljava/util/Map;)V

    .line 293
    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v1
.end method

.method static synthetic lambda$getPluginList$0(Ljava/lang/Integer;)Ljava/util/Set;
    .locals 0

    .line 285
    new-instance p0, Ljava/util/HashSet;

    invoke-direct {p0}, Ljava/util/HashSet;-><init>()V

    return-object p0
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 241
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/sharing/SharingManager$LoadPluginsTask;->doInBackground([Ljava/lang/Void;)Ljava/util/Map;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/util/Map;
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Void;",
            ")",
            "Ljava/util/Map<",
            "Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/Set<",
            "Lcom/sonymobile/scan3d/sharing/Plugin;",
            ">;>;>;"
        }
    .end annotation

    move-object/from16 v0, p0

    .line 245
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 248
    invoke-static {}, Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;->values()[Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;

    move-result-object v2

    array-length v3, v2

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v3, :cond_0

    aget-object v6, v2, v5

    .line 249
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 250
    invoke-interface {v1, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 254
    :cond_0
    invoke-direct/range {p0 .. p0}, Lcom/sonymobile/scan3d/sharing/SharingManager$LoadPluginsTask;->getPluginPackages()Ljava/util/List;

    move-result-object v2

    .line 255
    iget-object v3, v0, Lcom/sonymobile/scan3d/sharing/SharingManager$LoadPluginsTask;->this$0:Lcom/sonymobile/scan3d/sharing/SharingManager;

    invoke-static {v3}, Lcom/sonymobile/scan3d/sharing/SharingManager;->access$200(Lcom/sonymobile/scan3d/sharing/SharingManager;)Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    .line 256
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_6

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    move-object v11, v5

    check-cast v11, Landroid/content/pm/ResolveInfo;

    .line 257
    iget-object v5, v11, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v5, v5, Landroid/content/pm/ActivityInfo;->metaData:Landroid/os/Bundle;

    const-string v6, "com.sonymobile.scan3d.meta.scan_type"

    .line 258
    invoke-direct {v0, v5, v6}, Lcom/sonymobile/scan3d/sharing/SharingManager$LoadPluginsTask;->getMetaValue(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "com.sonymobile.scan3d.meta.category"

    .line 259
    invoke-direct {v0, v5, v7}, Lcom/sonymobile/scan3d/sharing/SharingManager$LoadPluginsTask;->getMetaValue(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_5

    if-nez v6, :cond_2

    goto :goto_3

    .line 263
    :cond_2
    iget-object v7, v0, Lcom/sonymobile/scan3d/sharing/SharingManager$LoadPluginsTask;->this$0:Lcom/sonymobile/scan3d/sharing/SharingManager;

    invoke-static {v7}, Lcom/sonymobile/scan3d/sharing/SharingManager;->access$200(Lcom/sonymobile/scan3d/sharing/SharingManager;)Landroid/content/Context;

    move-result-object v7

    iget-object v8, v11, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v8, v8, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-static {v7, v8}, Lcom/sonymobile/scan3d/storageservice/Config;->isProviderEnabled(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 264
    invoke-static {v5}, Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;->parse(Ljava/lang/String;)Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;

    move-result-object v5

    if-nez v5, :cond_3

    .line 265
    sget-object v5, Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;->MISC:Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;

    :cond_3
    move-object v12, v5

    .line 267
    invoke-static {v6}, Lcom/sonymobile/scan3d/sharing/SharingManager;->parseType(Ljava/lang/String;)[I

    move-result-object v13

    array-length v14, v13

    const/4 v15, 0x0

    :goto_2
    if-ge v15, v14, :cond_1

    aget v10, v13, v15

    .line 268
    invoke-direct {v0, v1, v12, v10}, Lcom/sonymobile/scan3d/sharing/SharingManager$LoadPluginsTask;->getPluginList(Ljava/util/Map;Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;I)Ljava/util/Set;

    move-result-object v9

    .line 269
    new-instance v8, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;

    iget-object v5, v0, Lcom/sonymobile/scan3d/sharing/SharingManager$LoadPluginsTask;->this$0:Lcom/sonymobile/scan3d/sharing/SharingManager;

    invoke-static {v5}, Lcom/sonymobile/scan3d/sharing/SharingManager;->access$200(Lcom/sonymobile/scan3d/sharing/SharingManager;)Landroid/content/Context;

    move-result-object v6

    move-object v5, v8

    move-object v7, v3

    move-object/from16 p1, v8

    move-object v8, v11

    move-object v4, v9

    move-object v9, v12

    invoke-direct/range {v5 .. v10}, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;-><init>(Landroid/content/Context;Landroid/content/pm/PackageManager;Landroid/content/pm/ResolveInfo;Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;I)V

    .line 272
    invoke-virtual/range {p1 .. p1}, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->isValid()Z

    move-result v5

    if-eqz v5, :cond_4

    move-object/from16 v5, p1

    .line 273
    invoke-interface {v4, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :cond_4
    add-int/lit8 v15, v15, 0x1

    goto :goto_2

    :cond_5
    :goto_3
    const-string v4, "SharingManager"

    .line 261
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "meta keys com.sonymobile.scan3d.meta.category or com.sonymobile.scan3d.meta.scan_type are missing for activity "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, v11, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v6, v6, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, " skipping"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    :cond_6
    return-object v1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 241
    check-cast p1, Ljava/util/Map;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/sharing/SharingManager$LoadPluginsTask;->onPostExecute(Ljava/util/Map;)V

    return-void
.end method

.method protected onPostExecute(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/Set<",
            "Lcom/sonymobile/scan3d/sharing/Plugin;",
            ">;>;>;)V"
        }
    .end annotation

    .line 326
    iget-object v0, p0, Lcom/sonymobile/scan3d/sharing/SharingManager$LoadPluginsTask;->this$0:Lcom/sonymobile/scan3d/sharing/SharingManager;

    invoke-static {v0}, Lcom/sonymobile/scan3d/sharing/SharingManager;->access$300(Lcom/sonymobile/scan3d/sharing/SharingManager;)Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/sonymobile/scan3d/sharing/SharingManager$LoadPluginsTask;->this$0:Lcom/sonymobile/scan3d/sharing/SharingManager;

    invoke-static {v0}, Lcom/sonymobile/scan3d/sharing/SharingManager;->access$300(Lcom/sonymobile/scan3d/sharing/SharingManager;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 327
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/sharing/SharingManager$LoadPluginsTask;->this$0:Lcom/sonymobile/scan3d/sharing/SharingManager;

    invoke-static {v0, p1}, Lcom/sonymobile/scan3d/sharing/SharingManager;->access$302(Lcom/sonymobile/scan3d/sharing/SharingManager;Ljava/util/Map;)Ljava/util/Map;

    .line 328
    iget-object p1, p0, Lcom/sonymobile/scan3d/sharing/SharingManager$LoadPluginsTask;->this$0:Lcom/sonymobile/scan3d/sharing/SharingManager;

    invoke-static {p1}, Lcom/sonymobile/scan3d/sharing/SharingManager;->access$400(Lcom/sonymobile/scan3d/sharing/SharingManager;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/sharing/OnPluginUpdateListener;

    .line 329
    invoke-interface {v0}, Lcom/sonymobile/scan3d/sharing/OnPluginUpdateListener;->onPluginsChanged()V

    goto :goto_0

    :cond_1
    return-void
.end method
