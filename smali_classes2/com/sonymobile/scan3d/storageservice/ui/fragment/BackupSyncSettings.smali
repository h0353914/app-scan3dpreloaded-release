.class public Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;
.super Landroidx/preference/PreferenceFragmentCompat;
.source "BackupSyncSettings.java"

# interfaces
.implements Landroidx/preference/Preference$OnPreferenceClickListener;
.implements Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils$AccountListener;
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings$MonitorTask;,
        Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings$MonitorStatus;,
        Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings$FileSetObserver;
    }
.end annotation


# static fields
.field private static final KEY_SIGNOUT_ONGOING:Ljava/lang/String; = "SIGNOUT_ONGOING"

.field private static final MSG_NOTIFY:I = 0x0

.field private static final MSG_STATUS_UPDATED:I = 0x1

.field private static final REQUEST_CODE_SIGNOUT:I = 0x3e8


# instance fields
.field private mHandler:Landroid/os/Handler;

.field private mObserver:Landroid/database/ContentObserver;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 52
    invoke-direct {p0}, Landroidx/preference/PreferenceFragmentCompat;-><init>()V

    return-void
.end method

.method private exit()V
    .locals 1

    .line 466
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->popBackStackImmediate()Z

    move-result v0

    if-nez v0, :cond_0

    .line 467
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->finish()V

    :cond_0
    return-void
.end method

.method public static synthetic lambda$onPreferenceClick$0(Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 348
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->signOut()V

    return-void
.end method

.method public static synthetic lambda$onPreferenceClick$1(Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 364
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->getContext()Landroid/content/Context;

    move-result-object p1

    const/4 p2, 0x1

    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->setExtractDataOngoing(Landroid/content/Context;Z)V

    return-void
.end method

.method public static synthetic lambda$onPreferenceClick$2(Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 372
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->getContext()Landroid/content/Context;

    move-result-object p1

    const/4 p2, 0x1

    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->setDeleteOngoing(Landroid/content/Context;Z)V

    return-void
.end method

.method private setProgressBarState(Z)V
    .locals 3

    .line 486
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 487
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->getView()Landroid/view/View;

    move-result-object v0

    const v1, 0x7f090159

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    .line 488
    invoke-virtual {v0, p1}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    if-eqz p1, :cond_0

    .line 491
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object p1

    const/4 v0, 0x0

    move v1, v0

    .line 492
    :goto_0
    invoke-virtual {p1}, Landroidx/preference/PreferenceScreen;->getPreferenceCount()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 493
    invoke-virtual {p1, v1}, Landroidx/preference/PreferenceScreen;->getPreference(I)Landroidx/preference/Preference;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroidx/preference/Preference;->setEnabled(Z)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private showDeleteAccountMonitor()V
    .locals 4

    .line 440
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 445
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->popBackStack()V

    .line 447
    new-instance v1, Lcom/sonymobile/scan3d/storageservice/ui/fragment/DeleteAccountMonitorFragment;

    invoke-direct {v1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/DeleteAccountMonitorFragment;-><init>()V

    .line 448
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object v0

    const/high16 v2, 0x10b0000

    const v3, 0x10b0001

    .line 449
    invoke-virtual {v0, v2, v3}, Landroidx/fragment/app/FragmentTransaction;->setCustomAnimations(II)Landroidx/fragment/app/FragmentTransaction;

    const v2, 0x7f090096

    .line 450
    invoke-virtual {v0, v2, v1}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 451
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentTransaction;->addToBackStack(Ljava/lang/String;)Landroidx/fragment/app/FragmentTransaction;

    .line 452
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentTransaction;->commit()I

    :cond_0
    return-void
.end method

.method private signOut()V
    .locals 3

    const/4 v0, 0x1

    .line 475
    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->setProgressBarState(Z)V

    .line 476
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->getContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/16 v1, 0x3e8

    invoke-virtual {p0, v0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method private updateExportPreference(Z)V
    .locals 2

    const v0, 0x7f1001c5

    .line 431
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v0

    if-eqz p1, :cond_0

    const v1, 0x7f100069

    .line 432
    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    const-string v1, ""

    :goto_0
    invoke-virtual {v0, v1}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    xor-int/lit8 p1, p1, 0x1

    .line 433
    invoke-virtual {v0, p1}, Landroidx/preference/Preference;->setEnabled(Z)V

    return-void
.end method

.method private updateMonitorPreference(Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings$MonitorStatus;)V
    .locals 3

    const v0, 0x7f1001f3

    .line 418
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 417
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/storageservice/ui/component/TransferPreference;

    if-eqz v0, :cond_0

    .line 421
    iget-boolean v1, p1, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings$MonitorStatus;->active:Z

    iget v2, p1, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings$MonitorStatus;->numSynced:I

    iget p1, p1, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings$MonitorStatus;->numScans:I

    invoke-virtual {v0, v1, v2, p1}, Lcom/sonymobile/scan3d/storageservice/ui/component/TransferPreference;->setTransferStatus(ZII)V

    :cond_0
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)Z
    .locals 2

    .line 384
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->isResumed()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 385
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 390
    :pswitch_0
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings$MonitorStatus;

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->updateMonitorPreference(Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings$MonitorStatus;)V

    goto :goto_0

    .line 387
    :pswitch_1
    new-instance p1, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings$MonitorTask;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->mHandler:Landroid/os/Handler;

    invoke-direct {p1, v0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings$MonitorTask;-><init>(Landroid/content/Context;Landroid/os/Handler;)V

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Void;

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings$MonitorTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    :cond_0
    :goto_0
    const/4 p1, 0x1

    return p1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1

    .line 275
    invoke-super {p0, p1}, Landroidx/preference/PreferenceFragmentCompat;->onActivityCreated(Landroid/os/Bundle;)V

    .line 278
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object p1

    if-eqz p1, :cond_0

    const v0, 0x7f100162

    .line 280
    invoke-virtual {p1, v0}, Landroid/app/ActionBar;->setTitle(I)V

    const/4 v0, 0x1

    .line 281
    invoke-virtual {p1, v0}, Landroid/app/ActionBar;->setHomeButtonEnabled(Z)V

    .line 282
    invoke-virtual {p1, v0}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    :cond_0
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 0

    const/16 p3, 0x3e8

    if-ne p1, p3, :cond_0

    const/4 p1, -0x1

    if-ne p2, p1, :cond_0

    const/4 p1, 0x0

    .line 402
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->setProgressBarState(Z)V

    .line 403
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->exit()V

    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5

    .line 211
    invoke-super {p0, p1}, Landroidx/preference/PreferenceFragmentCompat;->onCreate(Landroid/os/Bundle;)V

    .line 212
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f130001

    .line 213
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->addPreferencesFromResource(I)V

    const/4 v0, 0x1

    .line 214
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->setHasOptionsMenu(Z)V

    .line 215
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->setRetainInstance(Z)V

    .line 216
    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1, p0}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    iput-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->mHandler:Landroid/os/Handler;

    .line 217
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->getAccountName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 221
    sget-object v2, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->INSTANCE:Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;

    invoke-virtual {v2, p1, p0}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->registerListener(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils$AccountListener;)V

    .line 223
    new-instance v2, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings$FileSetObserver;

    iget-object v3, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->mHandler:Landroid/os/Handler;

    invoke-direct {v2, v3}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings$FileSetObserver;-><init>(Landroid/os/Handler;)V

    iput-object v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->mObserver:Landroid/database/ContentObserver;

    .line 224
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    sget-object v3, Lcom/sonymobile/scan3d/storageservice/provider/Contract$FileRecord;->CONTENT_URI:Landroid/net/Uri;

    iget-object v4, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->mObserver:Landroid/database/ContentObserver;

    .line 225
    invoke-virtual {v2, v3, v0, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    const v0, 0x7f1001f1

    .line 226
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v0

    .line 227
    invoke-virtual {v0, p0}, Landroidx/preference/Preference;->setOnPreferenceClickListener(Landroidx/preference/Preference$OnPreferenceClickListener;)V

    const v0, 0x7f1001f2

    .line 228
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v0

    .line 229
    invoke-virtual {v0, p0}, Landroidx/preference/Preference;->setOnPreferenceClickListener(Landroidx/preference/Preference$OnPreferenceClickListener;)V

    const v0, 0x7f1001ef

    .line 230
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v0

    .line 231
    invoke-virtual {v0, p0}, Landroidx/preference/Preference;->setOnPreferenceClickListener(Landroidx/preference/Preference$OnPreferenceClickListener;)V

    const v0, 0x7f10017a

    .line 232
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v0

    .line 233
    invoke-virtual {v0, p0}, Landroidx/preference/Preference;->setOnPreferenceClickListener(Landroidx/preference/Preference$OnPreferenceClickListener;)V

    const v0, 0x7f1001c2

    .line 234
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroidx/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    const v0, 0x7f1001c5

    .line 236
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v0

    .line 237
    invoke-virtual {v0, p0}, Landroidx/preference/Preference;->setOnPreferenceClickListener(Landroidx/preference/Preference$OnPreferenceClickListener;)V

    .line 238
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->isExtractDataOngoing(Landroid/content/Context;)Z

    move-result v0

    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->updateExportPreference(Z)V

    .line 240
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->isDeleteOngoing(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 241
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->showDeleteAccountMonitor()V

    goto :goto_0

    :cond_0
    const v0, 0x7f1001c4

    .line 243
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v0

    .line 244
    invoke-virtual {v0, p0}, Landroidx/preference/Preference;->setOnPreferenceClickListener(Landroidx/preference/Preference$OnPreferenceClickListener;)V

    .line 248
    :goto_0
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings$MonitorTask;

    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->mHandler:Landroid/os/Handler;

    invoke-direct {v0, p1, v1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings$MonitorTask;-><init>(Landroid/content/Context;Landroid/os/Handler;)V

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/lang/Void;

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings$MonitorTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_1

    .line 251
    :cond_1
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->exit()V

    :goto_1
    return-void
.end method

.method public onCreatePreferences(Landroid/os/Bundle;Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 3
    .param p2    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 262
    invoke-super {p0, p1, p2, p3}, Landroidx/preference/PreferenceFragmentCompat;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    const v2, 0x7f0c0061

    .line 264
    invoke-virtual {p1, v2, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    if-eqz p3, :cond_0

    const p2, 0x7f090159

    .line 266
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ProgressBar;

    const-string v2, "SIGNOUT_ONGOING"

    .line 267
    invoke-virtual {p3, v2, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result p3

    invoke-virtual {p2, p3}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    .line 269
    :cond_0
    move-object p2, p1

    check-cast p2, Landroid/view/ViewGroup;

    invoke-virtual {p2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    return-object p1
.end method

.method public onDeleteAccountChanged(Z)V
    .locals 0

    if-eqz p1, :cond_0

    .line 326
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->showDeleteAccountMonitor()V

    .line 327
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/content/Jobs;->requestDeleteBackendDataJob(Landroid/content/Context;)Z

    :cond_0
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .line 308
    invoke-super {p0}, Landroidx/preference/PreferenceFragmentCompat;->onDestroy()V

    .line 309
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 311
    sget-object v1, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->INSTANCE:Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;

    invoke-virtual {v1, v0, p0}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->unregisterListener(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils$AccountListener;)V

    .line 312
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->mObserver:Landroid/database/ContentObserver;

    if-eqz v1, :cond_0

    .line 313
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->mObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    :cond_0
    return-void
.end method

.method public onExtractAccountChanged(Z)V
    .locals 1

    .line 333
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->updateExportPreference(Z)V

    if-eqz p1, :cond_0

    .line 335
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string v0, "extract_data_request"

    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/storageservice/content/Jobs;->requestKeyInitJob(Landroid/content/Context;Ljava/lang/String;)Z

    :cond_0
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2

    .line 288
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x102002c

    if-eq v0, v1, :cond_0

    .line 293
    invoke-super {p0, p1}, Landroidx/preference/PreferenceFragmentCompat;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result p1

    return p1

    .line 290
    :cond_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->exit()V

    const/4 p1, 0x1

    return p1
.end method

.method public onPreferenceClick(Landroidx/preference/Preference;)Z
    .locals 6

    .line 341
    invoke-virtual {p1}, Landroidx/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object p1

    const v0, 0x7f1001ef

    .line 343
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/high16 v3, 0x1040000

    if-eqz v0, :cond_0

    .line 344
    new-instance p1, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v0, 0x7f1002ab

    .line 345
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    const v0, 0x7f1002aa

    .line 346
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    const v0, 0x7f1002b0

    .line 347
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->getString(I)Ljava/lang/String;

    move-result-object v0

    new-instance v4, Lcom/sonymobile/scan3d/storageservice/ui/fragment/-$$Lambda$BackupSyncSettings$vPpIqMf7Qpcd75jULlPQvdlmvsk;

    invoke-direct {v4, p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/-$$Lambda$BackupSyncSettings$vPpIqMf7Qpcd75jULlPQvdlmvsk;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;)V

    invoke-virtual {p1, v0, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 349
    invoke-virtual {p0, v3}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 350
    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto/16 :goto_0

    :cond_0
    const v0, 0x7f10017a

    .line 351
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v4, 0x1

    if-eqz v0, :cond_1

    .line 352
    new-instance p1, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->getContext()Landroid/content/Context;

    move-result-object v0

    const-class v2, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;

    invoke-direct {p1, v0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v0, "com.sonymobile.scan3d.extras.VIEW_PRIVACY"

    .line 353
    invoke-virtual {p1, v0, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 354
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicies;->getPersonalDataInfoPrivacy()Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;

    move-result-object v0

    const-string v2, "com.sonymobile.scan3d.extras.PRIVACY"

    .line 355
    invoke-virtual {p1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 356
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    :cond_1
    const v0, 0x7f1001c5

    .line 357
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 358
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->getAccountName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    .line 359
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v0, v5}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v5, 0x7f100068

    .line 360
    invoke-virtual {v0, v5}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    const v5, 0x7f100067

    .line 361
    new-array v4, v4, [Ljava/lang/Object;

    aput-object p1, v4, v1

    invoke-virtual {p0, v5, v4}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;I)Landroid/text/Spanned;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    const p1, 0x7f100066

    .line 363
    new-instance v4, Lcom/sonymobile/scan3d/storageservice/ui/fragment/-$$Lambda$BackupSyncSettings$1BUWzqb0yqYC-6b9Y5-SJsbXdMw;

    invoke-direct {v4, p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/-$$Lambda$BackupSyncSettings$1BUWzqb0yqYC-6b9Y5-SJsbXdMw;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;)V

    invoke-virtual {v0, p1, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 365
    invoke-virtual {v0, v3, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 366
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    :cond_2
    const v0, 0x7f1001c4

    .line 367
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 368
    new-instance p1, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v0, 0x7f100063

    .line 369
    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    const v0, 0x7f100062

    .line 370
    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    const v0, 0x7f100061

    .line 371
    new-instance v4, Lcom/sonymobile/scan3d/storageservice/ui/fragment/-$$Lambda$BackupSyncSettings$wZk74leHbYDfn-0Sj49Cxripxv0;

    invoke-direct {v4, p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/-$$Lambda$BackupSyncSettings$wZk74leHbYDfn-0Sj49Cxripxv0;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;)V

    invoke-virtual {p1, v0, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 373
    invoke-virtual {p1, v3, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 374
    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    :cond_3
    const v0, 0x7f1001f1

    .line 375
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    const v0, 0x7f1001f2

    .line 376
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    .line 377
    :cond_4
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1, v4}, Lcom/sonymobile/scan3d/storageservice/content/Jobs;->requestSync(Landroid/content/Context;Z)Z

    :cond_5
    :goto_0
    return v1
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    .line 299
    invoke-super {p0, p1}, Landroidx/preference/PreferenceFragmentCompat;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 300
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 301
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->getView()Landroid/view/View;

    move-result-object v0

    const v1, 0x7f090159

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    const-string v1, "SIGNOUT_ONGOING"

    .line 302
    invoke-virtual {v0}, Landroid/widget/ProgressBar;->isIndeterminate()Z

    move-result v0

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    :cond_0
    return-void
.end method

.method public onSignedOut()V
    .locals 0

    .line 320
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;->exit()V

    return-void
.end method
