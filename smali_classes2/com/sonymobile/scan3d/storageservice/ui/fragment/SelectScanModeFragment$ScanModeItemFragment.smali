.class public Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanModeItemFragment;
.super Landroidx/fragment/app/Fragment;
.source "SelectScanModeFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ScanModeItemFragment"
.end annotation


# static fields
.field private static final ARG_POSITION:Ljava/lang/String; = "position"


# instance fields
.field private mPosition:I

.field private mScanMode:Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 306
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    return-void
.end method

.method public static synthetic lambda$onResume$0(Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanModeItemFragment;Landroid/view/View;)V
    .locals 1

    .line 357
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanModeItemFragment;->mScanMode:Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanModeItemFragment;->saveSelectedScanMode(Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;)V

    .line 358
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanModeItemFragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    move-result-object p1

    check-cast p1, Landroidx/fragment/app/DialogFragment;

    .line 359
    invoke-virtual {p1}, Landroidx/fragment/app/DialogFragment;->getTargetFragment()Landroidx/fragment/app/Fragment;

    move-result-object p1

    check-cast p1, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$IScanChoiceListener;

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanModeItemFragment;->mScanMode:Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;

    .line 360
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;->getTutorial()Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$IScanChoiceListener;->onTutorialSelected(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;)V

    return-void
.end method

.method public static synthetic lambda$onResume$1(Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanModeItemFragment;Landroid/view/View;)V
    .locals 2

    .line 369
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanModeItemFragment;->mScanMode:Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanModeItemFragment;->saveSelectedScanMode(Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;)V

    .line 370
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanModeItemFragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    move-result-object p1

    check-cast p1, Landroidx/fragment/app/DialogFragment;

    .line 371
    invoke-virtual {p1}, Landroidx/fragment/app/DialogFragment;->getTargetFragment()Landroidx/fragment/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$IScanChoiceListener;

    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanModeItemFragment;->mScanMode:Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;

    .line 372
    invoke-interface {v0, p1, v1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$IScanChoiceListener;->onScanModeSelected(Landroidx/fragment/app/DialogFragment;Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;)V

    return-void
.end method

.method public static newInstance(I)Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanModeItemFragment;
    .locals 3

    .line 313
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanModeItemFragment;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanModeItemFragment;-><init>()V

    .line 314
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "position"

    .line 315
    invoke-virtual {v1, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 316
    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanModeItemFragment;->setArguments(Landroid/os/Bundle;)V

    return-object v0
.end method

.method private saveSelectedScanMode(Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;)V
    .locals 2

    .line 378
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanModeItemFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 379
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const v1, 0x7f1001d9

    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanModeItemFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;->name()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 322
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 323
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanModeItemFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "position"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanModeItemFragment;->mPosition:I

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0c007b

    const/4 v0, 0x0

    .line 330
    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onResume()V
    .locals 3

    .line 350
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onResume()V

    .line 353
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanModeItemFragment;->mScanMode:Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;->getTutorial()Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 354
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanModeItemFragment;->getView()Landroid/view/View;

    move-result-object v0

    const v1, 0x7f09006f

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 355
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanModeItemFragment;->mScanMode:Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanModeItemFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;->isTutorialEnabled(Landroid/content/Context;)Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 356
    new-instance v1, Lcom/sonymobile/scan3d/storageservice/ui/fragment/-$$Lambda$SelectScanModeFragment$ScanModeItemFragment$yru8vV4CqKlvzhiNISz-2F9qTyw;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/-$$Lambda$SelectScanModeFragment$ScanModeItemFragment$yru8vV4CqKlvzhiNISz-2F9qTyw;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanModeItemFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 364
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanModeItemFragment;->getView()Landroid/view/View;

    move-result-object v0

    const v1, 0x7f09006e

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 365
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanModeItemFragment;->mScanMode:Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanModeItemFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;->isEnabled(Landroid/content/Context;)Z

    move-result v1

    .line 366
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    if-eqz v1, :cond_1

    .line 368
    new-instance v1, Lcom/sonymobile/scan3d/storageservice/ui/fragment/-$$Lambda$SelectScanModeFragment$ScanModeItemFragment$8bkrTg_j6h2kMLtS6vBqP6vZ9SM;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/-$$Lambda$SelectScanModeFragment$ScanModeItemFragment$8bkrTg_j6h2kMLtS6vBqP6vZ9SM;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanModeItemFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_1
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 1

    .line 335
    invoke-super {p0, p1, p2}, Landroidx/fragment/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 336
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;->values()[Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;

    move-result-object p2

    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanModeItemFragment;->mPosition:I

    aget-object p2, p2, v0

    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanModeItemFragment;->mScanMode:Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;

    const p2, 0x7f0900f1

    .line 338
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ImageView;

    .line 339
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanModeItemFragment;->mScanMode:Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;->getImage()I

    move-result v0

    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    const p2, 0x7f0901f0

    .line 341
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    .line 342
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanModeItemFragment;->mScanMode:Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;->getTitle()I

    move-result v0

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(I)V

    const p2, 0x7f0900a3

    .line 344
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    .line 345
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanModeItemFragment;->mScanMode:Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;->getDescription()I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    return-void
.end method
