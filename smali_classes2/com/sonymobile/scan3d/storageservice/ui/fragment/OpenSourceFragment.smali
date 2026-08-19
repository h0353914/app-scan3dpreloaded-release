.class public Lcom/sonymobile/scan3d/storageservice/ui/fragment/OpenSourceFragment;
.super Landroidx/preference/PreferenceFragmentCompat;
.source "OpenSourceFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Landroidx/preference/PreferenceFragmentCompat;-><init>()V

    return-void
.end method

.method private openLicense(II)V
    .locals 2

    .line 128
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "KEY_LICENSE_TITLE"

    .line 129
    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p1, "KEY_LICENSE_TEXT"

    .line 130
    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 132
    new-instance p1, Lcom/sonymobile/scan3d/storageservice/ui/fragment/LicenseFragment;

    invoke-direct {p1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/LicenseFragment;-><init>()V

    .line 133
    invoke-virtual {p1, v0}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 134
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/OpenSourceFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p2

    .line 135
    invoke-virtual {p2}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object p2

    const/high16 v0, 0x10b0000

    const v1, 0x10b0001

    .line 136
    invoke-virtual {p2, v0, v1}, Landroidx/fragment/app/FragmentTransaction;->setCustomAnimations(II)Landroidx/fragment/app/FragmentTransaction;

    .line 137
    const-class v0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/LicenseFragment;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const v1, 0x7f090096

    invoke-virtual {p2, v1, p1, v0}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/FragmentTransaction;

    const/4 p1, 0x0

    .line 138
    invoke-virtual {p2, p1}, Landroidx/fragment/app/FragmentTransaction;->addToBackStack(Ljava/lang/String;)Landroidx/fragment/app/FragmentTransaction;

    .line 139
    invoke-virtual {p2}, Landroidx/fragment/app/FragmentTransaction;->commit()I

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 29
    invoke-super {p0, p1}, Landroidx/preference/PreferenceFragmentCompat;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x1

    .line 32
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/OpenSourceFragment;->setHasOptionsMenu(Z)V

    const/high16 p1, 0x7f130000

    .line 34
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/OpenSourceFragment;->addPreferencesFromResource(I)V

    return-void
.end method

.method public onCreatePreferences(Landroid/os/Bundle;Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2

    .line 48
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/OpenSourceFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    if-eqz v0, :cond_0

    const v1, 0x7f10001d

    .line 50
    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setTitle(I)V

    const/4 v1, 0x1

    .line 51
    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setHomeButtonEnabled(Z)V

    .line 52
    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 55
    :cond_0
    invoke-super {p0, p1, p2, p3}, Landroidx/preference/PreferenceFragmentCompat;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2

    .line 60
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x102002c

    if-eq v0, v1, :cond_0

    .line 65
    invoke-super {p0, p1}, Landroidx/preference/PreferenceFragmentCompat;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result p1

    return p1

    .line 62
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/OpenSourceFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->popBackStack()V

    const/4 p1, 0x1

    return p1
.end method

.method public onPreferenceTreeClick(Landroidx/preference/Preference;)Z
    .locals 2

    .line 71
    invoke-virtual {p1}, Landroidx/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object p1

    const v0, 0x7f1001c7

    .line 75
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/OpenSourceFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const v1, 0x7f100302

    const p1, 0x7f1002c0

    goto/16 :goto_0

    :cond_0
    const v0, 0x7f1001cc

    .line 78
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/OpenSourceFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const v1, 0x7f100303

    const p1, 0x7f1002c1

    goto/16 :goto_0

    :cond_1
    const v0, 0x7f1001ce

    .line 81
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/OpenSourceFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const v1, 0x7f100304

    const p1, 0x7f1002c7

    goto/16 :goto_0

    :cond_2
    const v0, 0x7f1001db

    .line 84
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/OpenSourceFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const v1, 0x7f100307

    const p1, 0x7f1002c4

    goto/16 :goto_0

    :cond_3
    const v0, 0x7f1001de

    .line 87
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/OpenSourceFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const v1, 0x7f100308

    const p1, 0x7f1002c5

    goto/16 :goto_0

    :cond_4
    const v0, 0x7f1001df

    .line 90
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/OpenSourceFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    const v1, 0x7f100309

    const p1, 0x7f1002c6

    goto/16 :goto_0

    :cond_5
    const v0, 0x7f1001e2

    .line 93
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/OpenSourceFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    const v1, 0x7f10030a

    const p1, 0x7f1002c8

    goto/16 :goto_0

    :cond_6
    const v0, 0x7f1001e6

    .line 96
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/OpenSourceFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    const v1, 0x7f10030c

    const p1, 0x7f1002ca

    goto :goto_0

    :cond_7
    const v0, 0x7f1001c6

    .line 99
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/OpenSourceFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    const v1, 0x7f100301

    const p1, 0x7f1002bf

    goto :goto_0

    :cond_8
    const v0, 0x7f1001da

    .line 102
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/OpenSourceFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    const v1, 0x7f100306

    const p1, 0x7f1002c3

    goto :goto_0

    :cond_9
    const v0, 0x7f1001f6

    .line 105
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/OpenSourceFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    const v1, 0x7f10030d

    const p1, 0x7f1002cb

    goto :goto_0

    :cond_a
    const v0, 0x7f1001e3

    .line 108
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/OpenSourceFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    const v1, 0x7f10030b

    const p1, 0x7f1002c9

    goto :goto_0

    :cond_b
    const v0, 0x7f1001d7

    .line 111
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/OpenSourceFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_c

    const v1, 0x7f100305

    const p1, 0x7f1002c2

    goto :goto_0

    :cond_c
    move p1, v1

    .line 115
    :goto_0
    invoke-direct {p0, v1, p1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/OpenSourceFragment;->openLicense(II)V

    const/4 p1, 0x1

    return p1
.end method
