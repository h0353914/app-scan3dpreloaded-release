.class public Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/WizardActivity;
.super Landroidx/fragment/app/FragmentActivity;
.source "WizardActivity.java"


# static fields
.field public static final EXTRA_CATEGORY:Ljava/lang/String; = "com.sonymobile.scan3d.extras.TIP_CATEGORY"

.field public static final EXTRA_TIP_INDEX:Ljava/lang/String; = "com.sonymobile.scan3d.extras.TIP_INDEX"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Landroidx/fragment/app/FragmentActivity;-><init>()V

    return-void
.end method

.method private static getCurrentItem(Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;)I
    .locals 3

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    .line 169
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/WizardActivity;->getTipsWithVisuals(Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;)Ljava/util/List;

    move-result-object p0

    move v1, v0

    .line 170
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 171
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;

    if-ne v2, p1, :cond_0

    return v1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return v0
.end method

.method public static getStartIntent(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;I)Landroid/content/Intent;
    .locals 2

    .line 80
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/WizardActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string p0, "com.sonymobile.scan3d.extras.TIP_CATEGORY"

    .line 81
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const-string p0, "com.sonymobile.scan3d.extras.TIP_INDEX"

    .line 82
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    return-object v0
.end method

.method private static getTipsWithVisuals(Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;",
            ")",
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;",
            ">;"
        }
    .end annotation

    .line 150
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 151
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->getTips()Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;

    .line 152
    invoke-virtual {v1}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->getType()I

    move-result v2

    if-lez v2, :cond_0

    .line 153
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public static synthetic lambda$onCreate$0(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/WizardActivity;Landroid/view/View;)V
    .locals 0

    .line 97
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/WizardActivity;->finishAfterTransition()V

    return-void
.end method

.method static showWizard(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;I)V
    .locals 0

    .line 66
    invoke-static {p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/WizardActivity;->getStartIntent(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;I)Landroid/content/Intent;

    move-result-object p1

    .line 67
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public static showWizard(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;)V
    .locals 0

    .line 54
    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/WizardActivity;->getCurrentItem(Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;)I

    move-result p2

    invoke-static {p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/WizardActivity;->showWizard(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;I)V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4

    .line 88
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    const v0, 0x7f0c00c7

    .line 89
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/WizardActivity;->setContentView(I)V

    .line 90
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/WizardActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "com.sonymobile.scan3d.extras.TIP_CATEGORY"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;

    if-eqz v0, :cond_5

    .line 93
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/WizardActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "com.sonymobile.scan3d.extras.TIP_INDEX"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    const v2, 0x7f0901f8

    .line 95
    invoke-virtual {p0, v2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/WizardActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Toolbar;

    .line 96
    invoke-virtual {p0, v2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/WizardActivity;->setActionBar(Landroid/widget/Toolbar;)V

    .line 97
    new-instance v3, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/-$$Lambda$WizardActivity$BFe9qCs4CC_51vZZiT4XFHCaNWE;

    invoke-direct {v3, p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/-$$Lambda$WizardActivity$BFe9qCs4CC_51vZZiT4XFHCaNWE;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/WizardActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/Toolbar;->setNavigationOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 99
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/WizardActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 101
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->getTitle()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/app/ActionBar;->setTitle(I)V

    :cond_0
    if-nez p1, :cond_1

    .line 105
    sget-object p1, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->SCREEN_EVENT_FROM_REFERENS_ID:Lcom/sonymobile/scan3d/analytics/ScreenEvent;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->getScreenEvent()I

    move-result v2

    invoke-virtual {p1, p0, v2}, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->send(Landroid/content/Context;I)V

    :cond_1
    const/4 p1, 0x0

    .line 109
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->getWizardType()I

    move-result v2

    if-eqz v2, :cond_2

    packed-switch v2, :pswitch_data_0

    .line 127
    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment;->newInstance(Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;I)Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment;

    move-result-object p1

    goto :goto_0

    .line 111
    :pswitch_0
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->getActionUrl()I

    move-result v0

    if-lez v0, :cond_3

    .line 113
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 114
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/WizardActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 115
    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/WizardActivity;->startActivity(Landroid/content/Intent;)V

    .line 116
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/WizardActivity;->finish()V

    goto :goto_0

    .line 120
    :pswitch_1
    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/ExpandableListFragment;->newInstance(Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;)Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/ExpandableListFragment;

    move-result-object p1

    goto :goto_0

    .line 123
    :cond_2
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/AboutTechFragment;->newInstance()Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/AboutTechFragment;

    move-result-object p1

    :cond_3
    :goto_0
    if-eqz p1, :cond_4

    .line 132
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/WizardActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    .line 133
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object v0

    const v1, 0x7f090096

    .line 134
    const-class v2, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/fragment/PagerFragment;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, p1, v2}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/FragmentTransaction;

    .line 135
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentTransaction;->commit()I

    :cond_4
    return-void

    .line 138
    :cond_5
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "No tip category added."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
