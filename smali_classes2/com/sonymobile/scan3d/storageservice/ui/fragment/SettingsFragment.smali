.class public Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;
.super Landroidx/preference/PreferenceFragmentCompat;
.source "SettingsFragment.java"

# interfaces
.implements Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment$OnYesNoListener;


# static fields
.field private static final DIALOG_TAG:Ljava/lang/String; = "clear_calibration_tag"

.field private static final PREFERENCE_BACKUP:Ljava/lang/String; = "preference_backup"

.field private static final QUESTION_ID_CLEAR_CALIB:I = 0x1


# instance fields
.field private mClicksLeft:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 40
    invoke-direct {p0}, Landroidx/preference/PreferenceFragmentCompat;-><init>()V

    const/4 v0, 0x5

    .line 57
    iput v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;->mClicksLeft:I

    return-void
.end method

.method private enableDeveloperMenu()V
    .locals 2

    const v0, 0x7f130002

    .line 181
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;->addPreferencesFromResource(I)V

    const v0, 0x7f1001eb

    .line 182
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v0

    new-instance v1, Lcom/sonymobile/scan3d/storageservice/ui/fragment/-$$Lambda$SettingsFragment$x8z3LY0lzGSEOrUGi5N973BHs1E;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/-$$Lambda$SettingsFragment$x8z3LY0lzGSEOrUGi5N973BHs1E;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;)V

    .line 183
    invoke-virtual {v0, v1}, Landroidx/preference/Preference;->setOnPreferenceClickListener(Landroidx/preference/Preference$OnPreferenceClickListener;)V

    return-void
.end method

.method public static synthetic lambda$enableDeveloperMenu$2(Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;Landroidx/preference/Preference;)Z
    .locals 2

    .line 184
    new-instance p1, Landroid/content/Intent;

    const-string v0, "android.settings.APPLICATION_DETAILS_SETTINGS"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v0, "com.android.settings"

    .line 185
    invoke-virtual {p1, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 186
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "package:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 187
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    const/4 p1, 0x1

    return p1
.end method

.method public static synthetic lambda$onCreate$0(Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;Landroid/content/SharedPreferences$Editor;Landroidx/preference/Preference;)Z
    .locals 1

    .line 76
    iget p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;->mClicksLeft:I

    const/4 v0, 0x1

    sub-int/2addr p2, v0

    iput p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;->mClicksLeft:I

    .line 77
    iget p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;->mClicksLeft:I

    if-nez p2, :cond_0

    .line 78
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;->enableDeveloperMenu()V

    const p2, 0x7f1001cb

    .line 79
    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, p2, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_0
    return v0
.end method

.method public static synthetic lambda$onCreate$1(Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;Landroidx/preference/Preference;)Z
    .locals 3

    .line 86
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p1

    const/4 v0, 0x1

    const v1, 0x7f1000d7

    const v2, 0x7f1000d8

    .line 88
    invoke-static {v0, v1, v2}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->newInstance(III)Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;

    move-result-object v1

    const/4 v2, 0x0

    .line 91
    invoke-virtual {v1, p0, v2}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->setTargetFragment(Landroidx/fragment/app/Fragment;I)V

    const-string v2, "clear_calibration_tag"

    .line 92
    invoke-virtual {v1, p1, v2}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    return v0
.end method

.method private putObject(Landroid/content/SharedPreferences$Editor;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2

    .line 206
    instance-of v0, p3, Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 207
    check-cast p3, Ljava/lang/String;

    invoke-interface {p1, p2, p3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    .line 208
    :cond_0
    instance-of v0, p3, Ljava/util/Set;

    if-eqz v0, :cond_1

    .line 209
    check-cast p3, Ljava/util/Set;

    invoke-interface {p1, p2, p3}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    .line 210
    :cond_1
    instance-of v0, p3, Ljava/lang/Integer;

    if-eqz v0, :cond_2

    .line 211
    check-cast p3, Ljava/lang/Integer;

    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result p3

    invoke-interface {p1, p2, p3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    .line 212
    :cond_2
    instance-of v0, p3, Ljava/lang/Long;

    if-eqz v0, :cond_3

    .line 213
    check-cast p3, Ljava/lang/Long;

    invoke-virtual {p3}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-interface {p1, p2, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    .line 214
    :cond_3
    instance-of v0, p3, Ljava/lang/Float;

    if-eqz v0, :cond_4

    .line 215
    check-cast p3, Ljava/lang/Float;

    invoke-virtual {p3}, Ljava/lang/Float;->floatValue()F

    move-result p3

    invoke-interface {p1, p2, p3}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    .line 216
    :cond_4
    instance-of v0, p3, Ljava/lang/Boolean;

    if-eqz v0, :cond_5

    .line 217
    check-cast p3, Ljava/lang/Boolean;

    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p3

    invoke-interface {p1, p2, p3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    :cond_5
    :goto_0
    return-void
.end method

.method private saveAndClearPreferences(Landroid/content/SharedPreferences;Landroid/content/SharedPreferences;)V
    .locals 3

    .line 193
    invoke-interface {p1}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v0

    .line 195
    invoke-interface {p2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    .line 196
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 197
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    invoke-direct {p0, p2, v2, v1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;->putObject(Landroid/content/SharedPreferences$Editor;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    .line 200
    :cond_0
    invoke-interface {p2}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 202
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 4

    .line 61
    invoke-super {p0, p1}, Landroidx/preference/PreferenceFragmentCompat;->onCreate(Landroid/os/Bundle;)V

    .line 62
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    const v0, 0x7f110133

    invoke-virtual {p1, v0}, Landroidx/fragment/app/FragmentActivity;->setTheme(I)V

    .line 64
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-static {p1}, Landroidx/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    .line 65
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const v1, 0x7f1001cb

    .line 66
    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {p1, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    const v1, 0x7f130004

    .line 67
    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;->addPreferencesFromResource(I)V

    const v1, 0x7f1001b6

    .line 69
    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 68
    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v1

    .line 70
    invoke-static {}, Lcom/sonymobile/scan3d/utils/LinkUtil;->isUSVariant()Z

    move-result v2

    invoke-virtual {v1, v2}, Landroidx/preference/Preference;->setVisible(Z)V

    const v1, 0x7f1001f5

    .line 71
    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v2

    const-string v3, "3.0.A.0.36"

    invoke-virtual {v2, v3}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    if-eqz p1, :cond_0

    .line 73
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;->enableDeveloperMenu()V

    goto :goto_0

    .line 75
    :cond_0
    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p1

    new-instance v1, Lcom/sonymobile/scan3d/storageservice/ui/fragment/-$$Lambda$SettingsFragment$pBHuEiLdZ3gFm4pAUYLMg3gaS_M;

    invoke-direct {v1, p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/-$$Lambda$SettingsFragment$pBHuEiLdZ3gFm4pAUYLMg3gaS_M;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;Landroid/content/SharedPreferences$Editor;)V

    invoke-virtual {p1, v1}, Landroidx/preference/Preference;->setOnPreferenceClickListener(Landroidx/preference/Preference$OnPreferenceClickListener;)V

    :goto_0
    const p1, 0x7f1001b7

    .line 85
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p1

    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/-$$Lambda$SettingsFragment$gCWQZ7vYSeoua7HCISOKVaAuRRk;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/-$$Lambda$SettingsFragment$gCWQZ7vYSeoua7HCISOKVaAuRRk;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;)V

    invoke-virtual {p1, v0}, Landroidx/preference/Preference;->setOnPreferenceClickListener(Landroidx/preference/Preference$OnPreferenceClickListener;)V

    const/4 p1, 0x1

    .line 97
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;->setHasOptionsMenu(Z)V

    return-void
.end method

.method public onCreatePreferences(Landroid/os/Bundle;Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2

    .line 120
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    if-eqz v0, :cond_0

    const v1, 0x7f10016a

    .line 122
    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setTitle(I)V

    const/4 v1, 0x1

    .line 123
    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setHomeButtonEnabled(Z)V

    .line 124
    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 127
    :cond_0
    invoke-super {p0, p1, p2, p3}, Landroidx/preference/PreferenceFragmentCompat;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onNegativeAnswer(ILandroid/os/Parcelable;)V
    .locals 0

    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2

    .line 107
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x102002c

    if-eq v0, v1, :cond_0

    .line 112
    invoke-super {p0, p1}, Landroidx/preference/PreferenceFragmentCompat;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result p1

    return p1

    .line 109
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->popBackStack()V

    const/4 p1, 0x1

    return p1
.end method

.method public onPositiveAnswer(ILandroid/os/Parcelable;)V
    .locals 0

    const/4 p2, 0x1

    if-ne p1, p2, :cond_0

    .line 224
    invoke-static {}, Lcom/sonymobile/scan3d/Sphinx;->resetCameraCalibration()V

    :cond_0
    return-void
.end method

.method public onPreferenceTreeClick(Landroidx/preference/Preference;)Z
    .locals 5

    .line 132
    invoke-virtual {p1}, Landroidx/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v0

    .line 133
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f1001e1

    .line 134
    invoke-virtual {p0, v2}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_0

    .line 135
    new-instance p1, Lcom/sonymobile/scan3d/storageservice/ui/fragment/OpenSourceFragment;

    invoke-direct {p1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/OpenSourceFragment;-><init>()V

    .line 136
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    .line 137
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object v0

    const/high16 v1, 0x10b0000

    const v2, 0x10b0001

    .line 138
    invoke-virtual {v0, v1, v2}, Landroidx/fragment/app/FragmentTransaction;->setCustomAnimations(II)Landroidx/fragment/app/FragmentTransaction;

    const v1, 0x7f090096

    .line 139
    invoke-virtual {v0, v1, p1}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    const/4 p1, 0x0

    .line 140
    invoke-virtual {v0, p1}, Landroidx/fragment/app/FragmentTransaction;->addToBackStack(Ljava/lang/String;)Landroidx/fragment/app/FragmentTransaction;

    .line 141
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentTransaction;->commit()I

    return v3

    :cond_0
    const v2, 0x7f1001c8

    .line 144
    invoke-virtual {p0, v2}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/4 v4, 0x0

    if-eqz v2, :cond_1

    .line 145
    invoke-static {v1}, Landroidx/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    const-string v0, "preference_backup"

    .line 146
    invoke-virtual {v1, v0, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 149
    invoke-direct {p0, p1, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;->saveAndClearPreferences(Landroid/content/SharedPreferences;Landroid/content/SharedPreferences;)V

    const p1, 0x7f1001bc

    .line 151
    invoke-static {v1, p1, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 152
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentActivity;->finish()V

    return v3

    :cond_1
    const v2, 0x7f1001e7

    .line 155
    invoke-virtual {p0, v2}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 156
    invoke-static {v1}, Landroidx/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    const-string v0, "preference_backup"

    .line 157
    invoke-virtual {v1, v0, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 160
    invoke-interface {v0}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v2

    if-lez v2, :cond_2

    .line 161
    invoke-direct {p0, v0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;->saveAndClearPreferences(Landroid/content/SharedPreferences;Landroid/content/SharedPreferences;)V

    const p1, 0x7f100205

    .line 162
    invoke-static {v1, p1, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p1

    .line 163
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 164
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentActivity;->finish()V

    goto :goto_0

    :cond_2
    const p1, 0x7f100202

    .line 166
    invoke-static {v1, p1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p1

    .line 167
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    :goto_0
    return v3

    :cond_3
    const v1, 0x7f1001b6

    .line 170
    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 171
    new-instance p1, Landroid/content/Intent;

    const-string v0, "android.intent.action.VIEW"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const v0, 0x7f10034a

    .line 172
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 173
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;->startActivity(Landroid/content/Intent;)V

    return v3

    .line 176
    :cond_4
    invoke-super {p0, p1}, Landroidx/preference/PreferenceFragmentCompat;->onPreferenceTreeClick(Landroidx/preference/Preference;)Z

    move-result p1

    return p1
.end method
