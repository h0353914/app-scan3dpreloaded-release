.class Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$SaveModelForPrintPlugin;
.super Landroid/os/AsyncTask;
.source "Print3rdPartyPluginsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SaveModelForPrintPlugin"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Landroid/util/Pair<",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        ">;>;"
    }
.end annotation


# instance fields
.field private final mComponent:Landroid/content/ComponentName;

.field private final mName:Ljava/lang/String;

.field private final mPrintModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

.field private final mUseStl:Z

.field final synthetic this$0:Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;Landroid/content/ComponentName;Ljava/lang/String;ZLcom/sonymobile/scan3d/viewer/ModelContainer;)V
    .locals 0

    .line 516
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$SaveModelForPrintPlugin;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 517
    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$SaveModelForPrintPlugin;->mComponent:Landroid/content/ComponentName;

    .line 518
    invoke-virtual {p5}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->copy()Lcom/sonymobile/scan3d/viewer/ModelContainer;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$SaveModelForPrintPlugin;->mPrintModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    .line 519
    iput-object p3, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$SaveModelForPrintPlugin;->mName:Ljava/lang/String;

    .line 520
    iput-boolean p4, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$SaveModelForPrintPlugin;->mUseStl:Z

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Landroid/util/Pair;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Void;",
            ")",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 527
    iget-boolean p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$SaveModelForPrintPlugin;->mUseStl:Z

    if-eqz p1, :cond_0

    .line 528
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$SaveModelForPrintPlugin;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$SaveModelForPrintPlugin;->mName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ".stl"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->getShareFile(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p1

    .line 529
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$SaveModelForPrintPlugin;->mPrintModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->getNativeHandle()J

    move-result-wide v0

    const/4 v2, 0x0

    invoke-static {v0, v1, p1, v2}, Lcom/sonymobile/scan3d/PrintExecution;->exportPrintToSTL(JLjava/lang/String;I)Z

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    const/4 v0, 0x1

    .line 531
    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/NativeEGL;->createContext(Landroid/view/Surface;Z)J

    move-result-wide v0

    .line 533
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$SaveModelForPrintPlugin;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$SaveModelForPrintPlugin;->mName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ".zip"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->getShareFile(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p1

    .line 534
    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$SaveModelForPrintPlugin;->mPrintModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    invoke-virtual {v2}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->getNativeHandle()J

    move-result-wide v2

    sget-object v4, Lcom/sonymobile/scan3d/PrintMaterialType;->ORIGINAL:Lcom/sonymobile/scan3d/PrintMaterialType;

    .line 535
    invoke-virtual {v4}, Lcom/sonymobile/scan3d/PrintMaterialType;->ordinal()I

    move-result v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/16 v10, 0x652

    const/4 v11, 0x0

    move-object v4, p1

    .line 534
    invoke-static/range {v2 .. v11}, Lcom/sonymobile/scan3d/PrintExecution;->exportPrintToZip(JLjava/lang/String;IZFZZII)Z

    .line 538
    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/NativeEGL;->destroyContext(J)V

    .line 541
    :goto_0
    new-instance v0, Landroid/util/Pair;

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$SaveModelForPrintPlugin;->mName:Ljava/lang/String;

    invoke-direct {v0, p1, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 509
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$SaveModelForPrintPlugin;->doInBackground([Ljava/lang/Void;)Landroid/util/Pair;

    move-result-object p1

    return-object p1
.end method

.method protected onCancelled()V
    .locals 1

    .line 546
    invoke-super {p0}, Landroid/os/AsyncTask;->onCancelled()V

    .line 547
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$SaveModelForPrintPlugin;->mPrintModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->release()V

    return-void
.end method

.method protected onPostExecute(Landroid/util/Pair;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 552
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$SaveModelForPrintPlugin;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/provider/FileTasks;->scheduleShareFileDeletion(Landroid/content/Context;)V

    .line 553
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$SaveModelForPrintPlugin;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->dismissProgressDialog()V

    .line 554
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$SaveModelForPrintPlugin;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 558
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.SEND"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 560
    new-instance v2, Ljava/io/File;

    iget-object v3, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 561
    iget-object v3, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Lorg/apache/commons/io/FilenameUtils;->getExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "stl"

    .line 562
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    .line 563
    iget-object v4, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$SaveModelForPrintPlugin;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;

    const v5, 0x7f100123

    invoke-virtual {v4, v5}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4, v2}, Landroidx/core/content/FileProvider;->getUriForFile(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    if-eqz v3, :cond_0

    const-string v2, "application/sla"

    goto :goto_0

    .line 565
    :cond_0
    sget-object v2, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->ZIP:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    invoke-virtual {v2}, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->toMimeString()Ljava/lang/String;

    move-result-object v2

    :goto_0
    invoke-virtual {v1, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const-string v2, "android.intent.extra.STREAM"

    .line 566
    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 567
    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$SaveModelForPrintPlugin;->mComponent:Landroid/content/ComponentName;

    if-eqz v2, :cond_2

    .line 568
    invoke-virtual {v1, v2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    if-eqz v3, :cond_1

    const-string v2, "application/sla"

    goto :goto_1

    :cond_1
    const-string v2, "application/vnd.sony.scan3d"

    .line 569
    :goto_1
    invoke-virtual {v1, v0, v2}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    :cond_2
    const-string v0, "android.intent.extra.SUBJECT"

    .line 572
    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$SaveModelForPrintPlugin;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;

    const v3, 0x7f100274

    .line 573
    invoke-virtual {v2, v3}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    aput-object p1, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 572
    invoke-virtual {v1, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/high16 p1, 0x10000000

    .line 574
    invoke-virtual {v1, p1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 575
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$SaveModelForPrintPlugin;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;

    invoke-virtual {p1, v1}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->startActivity(Landroid/content/Intent;)V

    .line 577
    :cond_3
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$SaveModelForPrintPlugin;->mPrintModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->release()V

    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 509
    check-cast p1, Landroid/util/Pair;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$SaveModelForPrintPlugin;->onPostExecute(Landroid/util/Pair;)V

    return-void
.end method
