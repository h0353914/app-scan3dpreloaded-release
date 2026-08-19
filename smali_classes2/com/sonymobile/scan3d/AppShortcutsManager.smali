.class public Lcom/sonymobile/scan3d/AppShortcutsManager;
.super Ljava/lang/Object;
.source "AppShortcutsManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;
    }
.end annotation


# static fields
.field public static final INTENT_EXTRA_SHORTCUT_POLICY_MODE:Ljava/lang/String; = "com.sonymobile.scan3d.INTENT_EXTRA_SHORTCUT_POLICY_MODE"

.field private static final LAST_SCAN_SHORTCUT_ID:Ljava/lang/String; = "last_scan_shortcut_id"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getShortcut(I)Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    packed-switch p0, :pswitch_data_0

    :pswitch_0
    const/4 p0, 0x0

    return-object p0

    .line 143
    :pswitch_1
    sget-object p0, Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;->SELFIE_SCAN:Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;

    return-object p0

    .line 137
    :pswitch_2
    sget-object p0, Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;->FOOD_SCAN:Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;

    return-object p0

    .line 145
    :pswitch_3
    sget-object p0, Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;->FREEFORM_SCAN:Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;

    return-object p0

    .line 140
    :pswitch_4
    sget-object p0, Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;->HEAD_SCAN:Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;

    return-object p0

    .line 134
    :pswitch_5
    sget-object p0, Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;->FACE_SCAN:Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;

    return-object p0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_5
        :pswitch_4
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method static refreshShortcut(Landroid/content/Context;)V
    .locals 4

    .line 107
    const-class v0, Landroid/content/pm/ShortcutManager;

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/ShortcutManager;

    if-eqz v0, :cond_2

    .line 109
    invoke-virtual {v0}, Landroid/content/pm/ShortcutManager;->getDynamicShortcuts()Ljava/util/List;

    move-result-object v0

    .line 110
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/pm/ShortcutInfo;

    .line 111
    invoke-virtual {v1}, Landroid/content/pm/ShortcutInfo;->getId()Ljava/lang/String;

    move-result-object v2

    const-string v3, "last_scan_shortcut_id"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 112
    invoke-virtual {v1}, Landroid/content/pm/ShortcutInfo;->getIntent()Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_1

    const-string v1, "com.sonymobile.scan3d.INTENT_EXTRA_SHORTCUT_POLICY_MODE"

    const/4 v2, -0x1

    .line 114
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 115
    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/AppShortcutsManager;->updateShortcut(Landroid/content/Context;I)V

    :cond_1
    return-void

    :cond_2
    return-void
.end method

.method protected static updateShortcut(Landroid/content/Context;I)V
    .locals 4
    .param p0    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 83
    const-class v0, Landroid/content/pm/ShortcutManager;

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/ShortcutManager;

    .line 84
    invoke-static {p1}, Lcom/sonymobile/scan3d/AppShortcutsManager;->getShortcut(I)Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;

    move-result-object p1

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    .line 87
    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.sonymobile.scan3d.ACTION_SHORTCUT"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v2, "com.sonymobile.scan3d.INTENT_EXTRA_SHORTCUT_POLICY_MODE"

    .line 88
    invoke-static {p1}, Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;->access$000(Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;)I

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const v2, 0x10008000

    .line 89
    invoke-virtual {v1, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 90
    new-instance v2, Landroid/content/pm/ShortcutInfo$Builder;

    const-string v3, "last_scan_shortcut_id"

    invoke-direct {v2, p0, v3}, Landroid/content/pm/ShortcutInfo$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 92
    invoke-static {p1}, Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;->access$300(Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;)I

    move-result v3

    invoke-virtual {p0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/pm/ShortcutInfo$Builder;->setShortLabel(Ljava/lang/CharSequence;)Landroid/content/pm/ShortcutInfo$Builder;

    move-result-object v2

    .line 93
    invoke-static {p1}, Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;->access$200(Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;)I

    move-result v3

    invoke-virtual {p0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/pm/ShortcutInfo$Builder;->setLongLabel(Ljava/lang/CharSequence;)Landroid/content/pm/ShortcutInfo$Builder;

    move-result-object v2

    .line 94
    invoke-static {p1}, Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;->access$100(Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;)I

    move-result p1

    invoke-static {p0, p1}, Landroid/graphics/drawable/Icon;->createWithResource(Landroid/content/Context;I)Landroid/graphics/drawable/Icon;

    move-result-object p0

    invoke-virtual {v2, p0}, Landroid/content/pm/ShortcutInfo$Builder;->setIcon(Landroid/graphics/drawable/Icon;)Landroid/content/pm/ShortcutInfo$Builder;

    move-result-object p0

    .line 95
    invoke-virtual {p0, v1}, Landroid/content/pm/ShortcutInfo$Builder;->setIntent(Landroid/content/Intent;)Landroid/content/pm/ShortcutInfo$Builder;

    move-result-object p0

    .line 96
    invoke-virtual {p0}, Landroid/content/pm/ShortcutInfo$Builder;->build()Landroid/content/pm/ShortcutInfo;

    move-result-object p0

    .line 97
    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/content/pm/ShortcutManager;->setDynamicShortcuts(Ljava/util/List;)Z

    :cond_0
    return-void
.end method
