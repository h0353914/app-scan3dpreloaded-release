.class Lcom/sonymobile/scan3d/editor/EditorFragment$1;
.super Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask;
.source "EditorFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonymobile/scan3d/editor/EditorFragment;->lambda$saveModel$14(Landroid/app/Activity;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private dialog:Lcom/sonymobile/scan3d/widgets/SphinxProgressDialog;

.field final synthetic this$0:Lcom/sonymobile/scan3d/editor/EditorFragment;

.field final synthetic val$activity:Landroid/app/Activity;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/editor/EditorFragment;Landroid/content/Context;Lcom/sonymobile/scan3d/viewer/ModelContainer;Ljava/lang/String;Landroid/app/Activity;)V
    .locals 0

    .line 885
    iput-object p1, p0, Lcom/sonymobile/scan3d/editor/EditorFragment$1;->this$0:Lcom/sonymobile/scan3d/editor/EditorFragment;

    iput-object p5, p0, Lcom/sonymobile/scan3d/editor/EditorFragment$1;->val$activity:Landroid/app/Activity;

    invoke-direct {p0, p2, p3, p4}, Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask;-><init>(Landroid/content/Context;Lcom/sonymobile/scan3d/viewer/ModelContainer;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected onPostExecute(Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask$Result;)V
    .locals 6

    .line 897
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask;->onPostExecute(Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask$Result;)V

    .line 899
    new-instance v2, Ljava/io/File;

    iget-object v0, p1, Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask$Result;->path:Ljava/lang/String;

    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 901
    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment$1;->val$activity:Landroid/app/Activity;

    iget-object v1, p1, Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask$Result;->name:Ljava/lang/String;

    iget v5, p1, Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask$Result;->scanType:I

    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 902
    invoke-static/range {v0 .. v5}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->create(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;Ljava/io/File;II)Lcom/sonymobile/scan3d/storageservice/provider/ITransientFileSet;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 907
    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment$1;->val$activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/provider/Contract$FileRecord;->CONTENT_URI:Landroid/net/Uri;

    .line 909
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/ITransientFileSet;->toContentValues()Landroid/content/ContentValues;

    move-result-object p1

    .line 908
    invoke-virtual {v0, v1, p1}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 912
    :goto_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment$1;->dialog:Lcom/sonymobile/scan3d/widgets/SphinxProgressDialog;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/widgets/SphinxProgressDialog;->dismiss()V

    .line 913
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 914
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 915
    iget-object p1, p0, Lcom/sonymobile/scan3d/editor/EditorFragment$1;->val$activity:Landroid/app/Activity;

    const/4 v1, -0x1

    invoke-virtual {p1, v1, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 916
    iget-object p1, p0, Lcom/sonymobile/scan3d/editor/EditorFragment$1;->val$activity:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->finish()V

    .line 917
    iget-object p1, p0, Lcom/sonymobile/scan3d/editor/EditorFragment$1;->this$0:Lcom/sonymobile/scan3d/editor/EditorFragment;

    invoke-static {p1}, Lcom/sonymobile/scan3d/editor/EditorFragment;->access$400(Lcom/sonymobile/scan3d/editor/EditorFragment;)V

    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 885
    check-cast p1, Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask$Result;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/editor/EditorFragment$1;->onPostExecute(Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask$Result;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 4

    .line 889
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask;->onPreExecute()V

    .line 890
    new-instance v0, Lcom/sonymobile/scan3d/widgets/SphinxProgressDialog;

    iget-object v1, p0, Lcom/sonymobile/scan3d/editor/EditorFragment$1;->val$activity:Landroid/app/Activity;

    const v2, 0x7f100102

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lcom/sonymobile/scan3d/widgets/SphinxProgressDialog;-><init>(Landroid/content/Context;IZ)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment$1;->dialog:Lcom/sonymobile/scan3d/widgets/SphinxProgressDialog;

    .line 892
    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment$1;->dialog:Lcom/sonymobile/scan3d/widgets/SphinxProgressDialog;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/widgets/SphinxProgressDialog;->show()V

    return-void
.end method
