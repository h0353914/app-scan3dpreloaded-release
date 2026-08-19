.class public Lcom/sonymobile/scan3d/PreferenceUtils;
.super Ljava/lang/Object;
.source "PreferenceUtils.java"


# static fields
.field private static final KEY_SHARED_PREFERENCES_VERSION:Ljava/lang/String; = "shared_prefs_version"

.field static final SHARED_PREFERENCES_VERSION:I = 0xd
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field private static final TAG:Ljava/lang/String; = "PreferenceUtils"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static updatePreferences(Landroid/content/Context;)V
    .locals 4

    .line 35
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "shared_prefs_version"

    const/4 v2, 0x0

    .line 36
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    const/16 v2, 0xd

    if-eq v1, v2, :cond_1

    .line 38
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    :goto_0
    if-ge v1, v2, :cond_0

    .line 40
    invoke-static {v1, p0, v0, v3}, Lcom/sonymobile/scan3d/PreferenceUtils;->upgrade(ILandroid/content/Context;Landroid/content/SharedPreferences;Landroid/content/SharedPreferences$Editor;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    const-string p0, "shared_prefs_version"

    .line 42
    invoke-interface {v3, p0, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 43
    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_1
    return-void
.end method

.method static upgrade(ILandroid/content/Context;Landroid/content/SharedPreferences;Landroid/content/SharedPreferences$Editor;)V
    .locals 0
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    packed-switch p0, :pswitch_data_0

    .line 93
    sget-object p1, Lcom/sonymobile/scan3d/PreferenceUtils;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Unsupported shared preferences version "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 89
    :pswitch_0
    invoke-static {p1, p2, p3}, Lcom/sonymobile/scan3d/PreferenceUtils;->upgradeToVersion_13(Landroid/content/Context;Landroid/content/SharedPreferences;Landroid/content/SharedPreferences$Editor;)V

    goto :goto_0

    .line 86
    :pswitch_1
    invoke-static {p1, p2, p3}, Lcom/sonymobile/scan3d/PreferenceUtils;->upgradeToVersion_12(Landroid/content/Context;Landroid/content/SharedPreferences;Landroid/content/SharedPreferences$Editor;)V

    goto :goto_0

    .line 83
    :pswitch_2
    invoke-static {p1, p2, p3}, Lcom/sonymobile/scan3d/PreferenceUtils;->upgradeToVersion_11(Landroid/content/Context;Landroid/content/SharedPreferences;Landroid/content/SharedPreferences$Editor;)V

    goto :goto_0

    .line 80
    :pswitch_3
    invoke-static {p1, p2, p3}, Lcom/sonymobile/scan3d/PreferenceUtils;->upgradeToVersion_10(Landroid/content/Context;Landroid/content/SharedPreferences;Landroid/content/SharedPreferences$Editor;)V

    goto :goto_0

    .line 77
    :pswitch_4
    invoke-static {p1, p3}, Lcom/sonymobile/scan3d/PreferenceUtils;->upgradeToVersion_9(Landroid/content/Context;Landroid/content/SharedPreferences$Editor;)V

    goto :goto_0

    .line 71
    :pswitch_5
    invoke-static {p1, p3}, Lcom/sonymobile/scan3d/PreferenceUtils;->upgradeToVersion_7(Landroid/content/Context;Landroid/content/SharedPreferences$Editor;)V

    goto :goto_0

    .line 61
    :pswitch_6
    invoke-static {p1, p3}, Lcom/sonymobile/scan3d/PreferenceUtils;->upgradeToVersion_4(Landroid/content/Context;Landroid/content/SharedPreferences$Editor;)V

    :goto_0
    :pswitch_7
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_6
        :pswitch_7
        :pswitch_7
        :pswitch_5
        :pswitch_7
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static upgradeToVersion_10(Landroid/content/Context;Landroid/content/SharedPreferences;Landroid/content/SharedPreferences$Editor;)V
    .locals 2

    const v0, 0x7f1001d3

    .line 116
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    const v0, 0x7f1001d2

    .line 117
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-interface {p2, p0, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    return-void
.end method

.method private static upgradeToVersion_11(Landroid/content/Context;Landroid/content/SharedPreferences;Landroid/content/SharedPreferences$Editor;)V
    .locals 10

    const v0, 0x7f1001cf

    .line 122
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    .line 124
    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 126
    new-instance v1, Ljava/util/HashSet;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Ljava/util/HashSet;-><init>(I)V

    .line 127
    const-class v3, Lcom/sonymobile/scan3d/R$string;

    invoke-virtual {v3}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;

    move-result-object v3

    .line 129
    array-length v4, v3

    :goto_0
    if-ge v2, v4, :cond_1

    aget-object v5, v3, v2

    .line 130
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v7

    const-string v8, "string"

    .line 131
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v9

    .line 130
    invoke-virtual {v6, v7, v8, v9}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v6

    if-eqz v6, :cond_0

    .line 132
    invoke-virtual {p0, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-interface {p1, v6}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 133
    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 138
    :cond_1
    invoke-interface {p2, v0, v1}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    :cond_2
    return-void
.end method

.method private static upgradeToVersion_12(Landroid/content/Context;Landroid/content/SharedPreferences;Landroid/content/SharedPreferences$Editor;)V
    .locals 8

    const v0, 0x7f1001f7

    .line 153
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p2, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    const-string v0, "pref_gallery_show_wizard"

    .line 156
    invoke-interface {p2, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    const v0, 0x7f1001e9

    .line 159
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 161
    invoke-interface {p1, v0}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_5

    .line 167
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->values()[Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    move v4, v3

    move v5, v4

    :goto_0
    if-ge v4, v2, :cond_2

    aget-object v6, v1, v4

    .line 168
    invoke-virtual {v6, p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->isSlideshowCompleted(Landroid/content/Context;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 169
    invoke-virtual {v6, p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->isTutorialCompleted(Landroid/content/Context;)Z

    move-result v6

    if-eqz v6, :cond_0

    goto :goto_1

    :cond_0
    move v6, v3

    goto :goto_2

    :cond_1
    :goto_1
    const/4 v6, 0x1

    :goto_2
    or-int/2addr v5, v6

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_2
    const-string p0, "key_show_scan_coach_mark"

    .line 172
    invoke-interface {p1, p0, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    if-nez v5, :cond_4

    if-eqz p0, :cond_3

    goto :goto_3

    :cond_3
    const/4 v3, 0x3

    .line 174
    :cond_4
    :goto_3
    invoke-interface {p2, v0, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    :cond_5
    const-string p0, "key_show_scan_coach_mark"

    .line 179
    invoke-interface {p2, p0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    const-string p0, "pref_key_skip_tutorials"

    .line 182
    invoke-interface {p2, p0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    return-void
.end method

.method private static upgradeToVersion_13(Landroid/content/Context;Landroid/content/SharedPreferences;Landroid/content/SharedPreferences$Editor;)V
    .locals 0

    const-string p0, "pref_gallery_show_promotions"

    .line 191
    invoke-interface {p2, p0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    return-void
.end method

.method private static upgradeToVersion_4(Landroid/content/Context;Landroid/content/SharedPreferences$Editor;)V
    .locals 1

    const v0, 0x7f1001d6

    .line 99
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-interface {p1, p0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    return-void
.end method

.method private static upgradeToVersion_7(Landroid/content/Context;Landroid/content/SharedPreferences$Editor;)V
    .locals 2

    const v0, 0x7f1001d4

    .line 103
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const v1, 0x7f10015d

    .line 104
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    .line 103
    invoke-interface {p1, v0, p0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    return-void
.end method

.method private static upgradeToVersion_9(Landroid/content/Context;Landroid/content/SharedPreferences$Editor;)V
    .locals 1

    const v0, 0x7f1001e0

    .line 108
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x1

    invoke-interface {p1, p0, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    return-void
.end method
