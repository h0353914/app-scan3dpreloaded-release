.class public final synthetic Lcom/sonymobile/scan3d/storageservice/ui/fragment/-$$Lambda$SettingsFragment$pBHuEiLdZ3gFm4pAUYLMg3gaS_M;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Landroidx/preference/Preference$OnPreferenceClickListener;


# instance fields
.field private final synthetic f$0:Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;

.field private final synthetic f$1:Landroid/content/SharedPreferences$Editor;


# direct methods
.method public synthetic constructor <init>(Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;Landroid/content/SharedPreferences$Editor;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/-$$Lambda$SettingsFragment$pBHuEiLdZ3gFm4pAUYLMg3gaS_M;->f$0:Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;

    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/-$$Lambda$SettingsFragment$pBHuEiLdZ3gFm4pAUYLMg3gaS_M;->f$1:Landroid/content/SharedPreferences$Editor;

    return-void
.end method


# virtual methods
.method public final onPreferenceClick(Landroidx/preference/Preference;)Z
    .locals 2

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/-$$Lambda$SettingsFragment$pBHuEiLdZ3gFm4pAUYLMg3gaS_M;->f$0:Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;

    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/-$$Lambda$SettingsFragment$pBHuEiLdZ3gFm4pAUYLMg3gaS_M;->f$1:Landroid/content/SharedPreferences$Editor;

    invoke-static {v0, v1, p1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;->lambda$onCreate$0(Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;Landroid/content/SharedPreferences$Editor;Landroidx/preference/Preference;)Z

    move-result p1

    return p1
.end method
