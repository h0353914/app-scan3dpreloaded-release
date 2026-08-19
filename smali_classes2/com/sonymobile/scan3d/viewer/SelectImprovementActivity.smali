.class public Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity;
.super Landroidx/fragment/app/FragmentActivity;
.source "SelectImprovementActivity.java"

# interfaces
.implements Landroidx/loader/app/LoaderManager$LoaderCallbacks;
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity$ImprovementAdapter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/fragment/app/FragmentActivity;",
        "Landroidx/loader/app/LoaderManager$LoaderCallbacks<",
        "Landroid/database/Cursor;",
        ">;",
        "Landroid/widget/AdapterView$OnItemClickListener;"
    }
.end annotation


# static fields
.field public static final EXTRA_IMPROVEMENTS:Ljava/lang/String; = "com.sonymobile.scan3d.extra.IMPROVEMENTS"

.field private static final TAG:Ljava/lang/String; = "com.sonymobile.scan3d.viewer.SelectImprovementActivity"


# instance fields
.field private mAdapter:Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity$ImprovementAdapter;

.field private mListView:Landroid/widget/ListView;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 50
    invoke-direct {p0}, Landroidx/fragment/app/FragmentActivity;-><init>()V

    return-void
.end method

.method private createLoaderForImprovementFileSets(Ljava/util/ArrayList;)Landroidx/loader/content/CursorLoader;
    .locals 5
    .param p1    # Ljava/util/ArrayList;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/sonymobile/scan3d/storageservice/provider/Improvement;",
            ">;)",
            "Landroidx/loader/content/CursorLoader;"
        }
    .end annotation

    .line 266
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "_id=?"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 267
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    .line 269
    :goto_0
    array-length v3, v1

    if-ge v2, v3, :cond_1

    if-lez v2, :cond_0

    const-string v3, " OR "

    .line 271
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "_id=?"

    .line 272
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 274
    :cond_0
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;

    invoke-virtual {v3}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->getFileSetId()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 276
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    invoke-static {p0, p1, v1, v0}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->createFileRecordLoader(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroidx/loader/content/CursorLoader;

    move-result-object p1

    return-object p1
.end method

.method public static getStartIntent(Landroid/content/Context;Ljava/util/ArrayList;)Landroid/content/Intent;
    .locals 2
    .param p1    # Ljava/util/ArrayList;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Landroidx/annotation/Size;
            min = 0x2L
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Lcom/sonymobile/scan3d/storageservice/provider/Improvement;",
            ">;)",
            "Landroid/content/Intent;"
        }
    .end annotation

    .line 173
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x2

    if-lt v0, v1, :cond_0

    .line 176
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string p0, "com.sonymobile.scan3d.extra.IMPROVEMENTS"

    .line 177
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putParcelableArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    const/high16 p0, 0x10000000

    .line 178
    invoke-virtual {v0, p0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    return-object v0

    .line 174
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Should be more than one improvement"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static synthetic lambda$onCreate$0(Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity;Landroid/view/View;)V
    .locals 0

    .line 188
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity;->finish()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 184
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0c0022

    .line 185
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity;->setContentView(I)V

    const p1, 0x7f090082

    .line 187
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    .line 188
    new-instance v0, Lcom/sonymobile/scan3d/viewer/-$$Lambda$SelectImprovementActivity$vyaW4F38NreT9KptjkDOhEEyhCE;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/viewer/-$$Lambda$SelectImprovementActivity$vyaW4F38NreT9KptjkDOhEEyhCE;-><init>(Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 190
    new-instance p1, Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity$ImprovementAdapter;

    invoke-direct {p1, p0}, Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity$ImprovementAdapter;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity;->mAdapter:Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity$ImprovementAdapter;

    const p1, 0x7f090194

    .line 191
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ListView;

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity;->mListView:Landroid/widget/ListView;

    .line 192
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity;->mListView:Landroid/widget/ListView;

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity;->mAdapter:Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity$ImprovementAdapter;

    invoke-virtual {p1, v0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 193
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity;->mListView:Landroid/widget/ListView;

    invoke-virtual {p1, p0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 194
    invoke-static {p0}, Landroidx/loader/app/LoaderManager;->getInstance(Landroidx/lifecycle/LifecycleOwner;)Landroidx/loader/app/LoaderManager;

    move-result-object p1

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1, p0}, Landroidx/loader/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroidx/loader/app/LoaderManager$LoaderCallbacks;)Landroidx/loader/content/Loader;

    return-void
.end method

.method public onCreateLoader(ILandroid/os/Bundle;)Landroidx/loader/content/Loader;
    .locals 0
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/os/Bundle;",
            ")",
            "Landroidx/loader/content/Loader<",
            "Landroid/database/Cursor;",
            ">;"
        }
    .end annotation

    .line 220
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string p2, "com.sonymobile.scan3d.extra.IMPROVEMENTS"

    .line 221
    invoke-virtual {p1, p2}, Landroid/content/Intent;->getParcelableArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p1

    .line 222
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity;->createLoaderForImprovementFileSets(Ljava/util/ArrayList;)Landroidx/loader/content/CursorLoader;

    move-result-object p1

    return-object p1
.end method

.method protected onDestroy()V
    .locals 1

    .line 210
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onDestroy()V

    .line 212
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity;->mAdapter:Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity$ImprovementAdapter;

    if-eqz v0, :cond_0

    .line 213
    invoke-static {v0}, Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity$ImprovementAdapter;->access$000(Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity$ImprovementAdapter;)V

    :cond_0
    return-void
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 246
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string p2, "com.sonymobile.scan3d.extra.IMPROVEMENTS"

    .line 247
    invoke-virtual {p1, p2}, Landroid/content/Intent;->getParcelableArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p1

    .line 248
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;

    .line 249
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->getFileSetId()J

    move-result-wide v0

    cmp-long p3, p4, v0

    if-nez p3, :cond_0

    .line 250
    invoke-static {p0, p2}, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->getImprovementIntent(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/Improvement;)Landroid/content/Intent;

    move-result-object p1

    .line 251
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity;->startActivity(Landroid/content/Intent;)V

    .line 252
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity;->finish()V

    :cond_1
    return-void
.end method

.method public onLoadFinished(Landroidx/loader/content/Loader;Landroid/database/Cursor;)V
    .locals 2
    .param p1    # Landroidx/loader/content/Loader;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/loader/content/Loader<",
            "Landroid/database/Cursor;",
            ">;",
            "Landroid/database/Cursor;",
            ")V"
        }
    .end annotation

    .line 227
    invoke-static {p2}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->createFileRecords(Landroid/database/Cursor;)Ljava/util/List;

    move-result-object p1

    .line 229
    sget-object p2, Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onLoadFinished(): Found "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " improved scans."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 231
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity;->mListView:Landroid/widget/ListView;

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Landroid/widget/ListView;->setVisibility(I)V

    .line 232
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity;->mAdapter:Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity$ImprovementAdapter;

    invoke-static {p2, p1}, Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity$ImprovementAdapter;->access$100(Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity$ImprovementAdapter;Ljava/util/List;)V

    return-void
.end method

.method public bridge synthetic onLoadFinished(Landroidx/loader/content/Loader;Ljava/lang/Object;)V
    .locals 0
    .param p1    # Landroidx/loader/content/Loader;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 50
    check-cast p2, Landroid/database/Cursor;

    invoke-virtual {p0, p1, p2}, Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity;->onLoadFinished(Landroidx/loader/content/Loader;Landroid/database/Cursor;)V

    return-void
.end method

.method public onLoaderReset(Landroidx/loader/content/Loader;)V
    .locals 0
    .param p1    # Landroidx/loader/content/Loader;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/loader/content/Loader<",
            "Landroid/database/Cursor;",
            ">;)V"
        }
    .end annotation

    return-void
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 2

    .line 199
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onNewIntent(Landroid/content/Intent;)V

    .line 204
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity;->setIntent(Landroid/content/Intent;)V

    .line 205
    invoke-static {p0}, Landroidx/loader/app/LoaderManager;->getInstance(Landroidx/lifecycle/LifecycleOwner;)Landroidx/loader/app/LoaderManager;

    move-result-object p1

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1, p0}, Landroidx/loader/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroidx/loader/app/LoaderManager$LoaderCallbacks;)Landroidx/loader/content/Loader;

    return-void
.end method
