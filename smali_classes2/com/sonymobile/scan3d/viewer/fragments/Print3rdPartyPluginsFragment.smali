.class public Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;
.super Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;
.source "Print3rdPartyPluginsFragment.java"

# interfaces
.implements Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;
.implements Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$MeshLoadingListener;
.implements Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$PrintMeshLoadingListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$SaveModelForPrintPlugin;,
        Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$WorkerFragment;,
        Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrinterPluginsAdapter;,
        Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrintSharePrivacyDialog;,
        Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrintPrivacyDialog;
    }
.end annotation


# static fields
.field private static final COORD_SYSTEM_DEFAULT:I = 0x652

.field private static final KEY_COMPONENT_NAME:Ljava/lang/String; = "component_name"

.field private static final KEY_PRINT_SELECTION:Ljava/lang/String; = "print_selection"

.field private static final KEY_SELECTED_BUTTON:Ljava/lang/String; = "key_selected_button"

.field private static final KEY_USE_PRINT_SHARE:Ljava/lang/String; = "use_print_share"

.field private static final KEY_USE_PRINT_SHARE_STL:Ljava/lang/String; = "use_print_share_stl"

.field private static final PRIVACY_DIALOG_TAG:Ljava/lang/String; = "privacy_dialog"


# instance fields
.field private mComponentNameToStart:Landroid/content/ComponentName;

.field private mLargeSize:Landroid/view/View;

.field private mListView:Landroid/widget/ListView;

.field private mMediumSize:Landroid/view/View;

.field private mMeshHolder:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

.field private mOrigContainer:Lcom/sonymobile/scan3d/viewer/ModelContainer;

.field private mPrintContainer:Lcom/sonymobile/scan3d/viewer/ModelContainer;

.field private mPrintSelection:Lcom/sonymobile/scan3d/PrintSelection;

.field private mSelectedHeight:I

.field private mSmallSize:Landroid/view/View;

.field private mUsePrintSharePlugin:Z

.field private mUsePrintShareStl:Z

.field private mWorker:Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$WorkerFragment;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 70
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;)V
    .locals 0

    .line 70
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->onPositiveAnswer()V

    return-void
.end method

.method static synthetic access$100(Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;)Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;
    .locals 0

    .line 70
    iget-object p0, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mMeshHolder:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    return-object p0
.end method

.method static synthetic access$200(Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;Lcom/sonymobile/scan3d/viewer/ModelContainer;Ljava/lang/String;)V
    .locals 0

    .line 70
    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->onRescalingDone(Lcom/sonymobile/scan3d/viewer/ModelContainer;Ljava/lang/String;)V

    return-void
.end method

.method private getWorkerFragment()Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$WorkerFragment;
    .locals 3

    .line 426
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    .line 427
    sget-object v1, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$WorkerFragment;->TAG:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v1

    check-cast v1, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$WorkerFragment;

    if-nez v1, :cond_0

    .line 429
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object v0

    .line 430
    new-instance v1, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$WorkerFragment;

    invoke-direct {v1}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$WorkerFragment;-><init>()V

    .line 431
    sget-object v2, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$WorkerFragment;->TAG:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroidx/fragment/app/FragmentTransaction;->add(Landroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/FragmentTransaction;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentTransaction;->commit()I

    :cond_0
    return-object v1
.end method

.method public static synthetic lambda$onViewCreated$0(Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0

    .line 151
    iget p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mSelectedHeight:I

    const/4 p4, 0x0

    if-nez p1, :cond_0

    .line 152
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    const p2, 0x7f100220

    invoke-static {p1, p2, p4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p1

    .line 153
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void

    .line 156
    :cond_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mListView:Landroid/widget/ListView;

    invoke-virtual {p1}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object p1

    check-cast p1, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrinterPluginsAdapter;

    .line 157
    invoke-virtual {p1, p3}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrinterPluginsAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p5

    instance-of p5, p5, Lcom/sonymobile/scan3d/sharing/PrintShareStlPlugin;

    iput-boolean p5, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mUsePrintShareStl:Z

    .line 158
    iget-boolean p5, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mUsePrintShareStl:Z

    if-nez p5, :cond_2

    .line 159
    invoke-virtual {p1, p3}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrinterPluginsAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p5

    instance-of p5, p5, Lcom/sonymobile/scan3d/sharing/PrintSharePlugin;

    if-eqz p5, :cond_1

    goto :goto_0

    :cond_1
    move p5, p4

    goto :goto_1

    :cond_2
    :goto_0
    const/4 p5, 0x1

    :goto_1
    iput-boolean p5, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mUsePrintSharePlugin:Z

    .line 161
    iget-boolean p5, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mUsePrintSharePlugin:Z

    if-eqz p5, :cond_4

    const/4 p1, 0x0

    .line 162
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mComponentNameToStart:Landroid/content/ComponentName;

    .line 164
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    const-string p3, "FileSharePlugin_dontShowAgain"

    .line 165
    invoke-interface {p1, p3, p4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 167
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->onPositiveAnswer()V

    goto :goto_2

    :cond_3
    const-string p1, "FileSharePlugin_dontShowAgain"

    .line 170
    invoke-static {p1}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrintSharePrivacyDialog;->newInstance(Ljava/lang/String;)Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrintSharePrivacyDialog;

    move-result-object p1

    .line 171
    invoke-virtual {p1, p0, p4}, Landroidx/fragment/app/DialogFragment;->setTargetFragment(Landroidx/fragment/app/Fragment;I)V

    .line 172
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p3

    const-string p4, "privacy_dialog"

    invoke-virtual {p1, p3, p4}, Landroidx/fragment/app/DialogFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    .line 174
    :goto_2
    sget-object p1, Lcom/sonymobile/scan3d/analytics/HitEvent;->SHARE_AS_FILE:Lcom/sonymobile/scan3d/analytics/HitEvent;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    const-wide/16 p3, 0x1

    invoke-virtual {p1, p2, p3, p4}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;J)V

    goto :goto_3

    .line 176
    :cond_4
    invoke-virtual {p1, p3}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrinterPluginsAdapter;->getComponentForPosition(I)Landroid/content/ComponentName;

    move-result-object p2

    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mComponentNameToStart:Landroid/content/ComponentName;

    const-string p2, "application/sla"

    .line 177
    invoke-virtual {p1, p3, p2}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrinterPluginsAdapter;->componentSupportsMime(ILjava/lang/String;)Z

    move-result p2

    iput-boolean p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mUsePrintShareStl:Z

    .line 179
    invoke-virtual {p1, p3}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrinterPluginsAdapter;->getNameForPosition(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrintPrivacyDialog;->newInstance(Ljava/lang/String;)Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrintPrivacyDialog;

    move-result-object p1

    .line 180
    invoke-virtual {p1, p0, p4}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrintPrivacyDialog;->setTargetFragment(Landroidx/fragment/app/Fragment;I)V

    .line 181
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p2

    const-string p3, "privacy_dialog"

    invoke-virtual {p1, p2, p3}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrintPrivacyDialog;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    :goto_3
    return-void
.end method

.method public static newInstance(Lcom/sonymobile/scan3d/PrintSelection;)Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;
    .locals 2
    .param p0    # Lcom/sonymobile/scan3d/PrintSelection;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 115
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "print_selection"

    .line 116
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/PrintSelection;->clone()Lcom/sonymobile/scan3d/PrintSelection;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 118
    new-instance p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;

    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;-><init>()V

    .line 119
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->setArguments(Landroid/os/Bundle;)V

    return-object p0
.end method

.method private onPositiveAnswer()V
    .locals 5

    const v0, 0x7f10024a

    const/4 v1, 0x1

    .line 342
    invoke-virtual {p0, v0, v1}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->showProgressDialog(IZ)V

    .line 343
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mWorker:Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$WorkerFragment;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$WorkerFragment;->setTargetFragment(Landroidx/fragment/app/Fragment;I)V

    .line 344
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mWorker:Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$WorkerFragment;

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mMeshHolder:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mOrigContainer:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    iget-object v3, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mPrintContainer:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    iget-object v4, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mPrintSelection:Lcom/sonymobile/scan3d/PrintSelection;

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$WorkerFragment;->executeAsync(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/PrintSelection;)V

    return-void
.end method

.method private onRescalingDone(Lcom/sonymobile/scan3d/viewer/ModelContainer;Ljava/lang/String;)V
    .locals 7

    if-eqz p1, :cond_1

    .line 418
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mUsePrintSharePlugin:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mComponentNameToStart:Landroid/content/ComponentName;

    :goto_0
    move-object v3, v0

    .line 419
    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$SaveModelForPrintPlugin;

    iget-boolean v5, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mUsePrintShareStl:Z

    move-object v1, v0

    move-object v2, p0

    move-object v4, p2

    move-object v6, p1

    invoke-direct/range {v1 .. v6}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$SaveModelForPrintPlugin;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;Landroid/content/ComponentName;Ljava/lang/String;ZLcom/sonymobile/scan3d/viewer/ModelContainer;)V

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/lang/Void;

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$SaveModelForPrintPlugin;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_1

    .line 421
    :cond_1
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->dismissProgressDialog()V

    :goto_1
    return-void
.end method


# virtual methods
.method allowProgressDialogCancellation()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public doClick(Landroid/view/View;)V
    .locals 4

    .line 319
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_0

    .line 333
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unexpected view: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 321
    :pswitch_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mPrintSelection:Lcom/sonymobile/scan3d/PrintSelection;

    sget-object v3, Lcom/sonymobile/scan3d/utils/PrintSize;->SMALL:Lcom/sonymobile/scan3d/utils/PrintSize;

    invoke-virtual {v0, v3}, Lcom/sonymobile/scan3d/PrintSelection;->setSize(Lcom/sonymobile/scan3d/utils/PrintSize;)V

    move v0, v2

    move v2, v1

    move v1, v0

    goto :goto_0

    .line 325
    :pswitch_1
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mPrintSelection:Lcom/sonymobile/scan3d/PrintSelection;

    sget-object v3, Lcom/sonymobile/scan3d/utils/PrintSize;->LARGE:Lcom/sonymobile/scan3d/utils/PrintSize;

    invoke-virtual {v0, v3}, Lcom/sonymobile/scan3d/PrintSelection;->setSize(Lcom/sonymobile/scan3d/utils/PrintSize;)V

    move v0, v2

    goto :goto_0

    .line 329
    :pswitch_2
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mPrintSelection:Lcom/sonymobile/scan3d/PrintSelection;

    sget-object v3, Lcom/sonymobile/scan3d/utils/PrintSize;->X_LARGE:Lcom/sonymobile/scan3d/utils/PrintSize;

    invoke-virtual {v0, v3}, Lcom/sonymobile/scan3d/PrintSelection;->setSize(Lcom/sonymobile/scan3d/utils/PrintSize;)V

    move v0, v1

    move v1, v2

    .line 335
    :goto_0
    iget-object v3, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mSmallSize:Landroid/view/View;

    invoke-virtual {v3, v2}, Landroid/view/View;->setSelected(Z)V

    .line 336
    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mMediumSize:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->setSelected(Z)V

    .line 337
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mLargeSize:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setSelected(Z)V

    .line 338
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    iput p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mSelectedHeight:I

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x7f0901a8
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getContentLayout()I
    .locals 1

    const v0, 0x7f0c006d

    return v0
.end method

.method public onAttach(Landroid/content/Context;)V
    .locals 0

    .line 304
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->onAttach(Landroid/content/Context;)V

    .line 305
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    check-cast p1, Lcom/sonymobile/scan3d/viewer/fragments/ViewerActivityInterface;

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mActivityInterface:Lcom/sonymobile/scan3d/viewer/fragments/ViewerActivityInterface;

    return-void
.end method

.method public onMeshLoadFailed(Landroid/net/Uri;)V
    .locals 0

    .line 204
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->handleFailedMesh()V

    return-void
.end method

.method public onMeshLoaded(Landroid/net/Uri;Lcom/sonymobile/scan3d/viewer/ModelContainer;)V
    .locals 0

    .line 195
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->isAdded()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 196
    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mOrigContainer:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    .line 197
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mMeshHolder:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {p1, p0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->computePrintMesh(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$PrintMeshLoadingListener;)Z

    .line 198
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mListView:Landroid/widget/ListView;

    new-instance p2, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrinterPluginsAdapter;

    invoke-direct {p2, p0}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$PrinterPluginsAdapter;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;)V

    invoke-virtual {p1, p2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    :cond_0
    return-void
.end method

.method public onMeshLoading(Landroid/net/Uri;)V
    .locals 1

    const p1, 0x7f10024a

    const/4 v0, 0x1

    .line 209
    invoke-virtual {p0, p1, v0}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->showProgressDialog(IZ)V

    return-void
.end method

.method public onPrintMeshComputed(Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;)V
    .locals 0

    .line 215
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->isAdded()Z

    move-result p2

    if-eqz p2, :cond_0

    .line 216
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->dismissProgressDialog()V

    .line 217
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mPrintContainer:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    :cond_0
    return-void
.end method

.method public onPrintMeshFailed(Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;)V
    .locals 0

    .line 225
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->handleFailedMesh()V

    return-void
.end method

.method public onPrintMeshLoading()V
    .locals 2

    const v0, 0x7f10024a

    const/4 v1, 0x1

    .line 230
    invoke-virtual {p0, v0, v1}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->showProgressDialog(IZ)V

    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    .line 235
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    const-string v0, "key_selected_button"

    .line 236
    iget v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mSelectedHeight:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "print_selection"

    .line 237
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mPrintSelection:Lcom/sonymobile/scan3d/PrintSelection;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string v0, "component_name"

    .line 238
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mComponentNameToStart:Landroid/content/ComponentName;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string v0, "use_print_share"

    .line 239
    iget-boolean v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mUsePrintSharePlugin:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v0, "use_print_share_stl"

    .line 240
    iget-boolean v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mUsePrintShareStl:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 2
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 126
    invoke-super {p0, p1, p2}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    if-eqz p2, :cond_0

    const-string v0, "key_selected_button"

    const/4 v1, 0x0

    .line 129
    invoke-virtual {p2, v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mSelectedHeight:I

    const-string v0, "print_selection"

    .line 130
    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/PrintSelection;

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mPrintSelection:Lcom/sonymobile/scan3d/PrintSelection;

    const-string v0, "component_name"

    .line 131
    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/content/ComponentName;

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mComponentNameToStart:Landroid/content/ComponentName;

    const-string v0, "use_print_share"

    .line 132
    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mUsePrintSharePlugin:Z

    const-string v0, "use_print_share_stl"

    .line 133
    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mUsePrintShareStl:Z

    goto :goto_0

    .line 135
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "print_selection"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/PrintSelection;

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mPrintSelection:Lcom/sonymobile/scan3d/PrintSelection;

    .line 138
    :goto_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->getWorkerFragment()Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$WorkerFragment;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mWorker:Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$WorkerFragment;

    const v0, 0x7f0901aa

    .line 140
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mSmallSize:Landroid/view/View;

    .line 141
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mSmallSize:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f0901a9

    .line 143
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mMediumSize:Landroid/view/View;

    .line 144
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mMediumSize:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f0901a8

    .line 146
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mLargeSize:Landroid/view/View;

    .line 147
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mLargeSize:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f090113

    .line 149
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mListView:Landroid/widget/ListView;

    .line 150
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mListView:Landroid/widget/ListView;

    new-instance v1, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$Print3rdPartyPluginsFragment$V4R6j8mPlrszE7sO-1vGvnrmeTo;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$Print3rdPartyPluginsFragment$V4R6j8mPlrszE7sO-1vGvnrmeTo;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    if-eqz p2, :cond_1

    .line 185
    iget p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mSelectedHeight:I

    if-eqz p2, :cond_1

    .line 186
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->onClick(Landroid/view/View;)V

    .line 189
    :cond_1
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-static {p1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getInstance(Landroidx/fragment/app/FragmentActivity;)Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mMeshHolder:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    .line 190
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->mMeshHolder:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {p1, p0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->setMeshLoadingListener(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$MeshLoadingListener;)V

    return-void
.end method
