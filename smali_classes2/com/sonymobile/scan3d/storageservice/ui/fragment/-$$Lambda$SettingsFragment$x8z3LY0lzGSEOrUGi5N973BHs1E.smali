.class public final synthetic Lcom/sonymobile/scan3d/storageservice/ui/fragment/-$$Lambda$SettingsFragment$x8z3LY0lzGSEOrUGi5N973BHs1E;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Landroidx/preference/Preference$OnPreferenceClickListener;


# instance fields
.field private final synthetic f$0:Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;


# direct methods
.method public synthetic constructor <init>(Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/-$$Lambda$SettingsFragment$x8z3LY0lzGSEOrUGi5N973BHs1E;->f$0:Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;

    return-void
.end method


# virtual methods
.method public final onPreferenceClick(Landroidx/preference/Preference;)Z
    .locals 1

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/-$$Lambda$SettingsFragment$x8z3LY0lzGSEOrUGi5N973BHs1E;->f$0:Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;

    invoke-static {v0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;->lambda$enableDeveloperMenu$2(Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;Landroidx/preference/Preference;)Z

    move-result p1

    return p1
.end method
