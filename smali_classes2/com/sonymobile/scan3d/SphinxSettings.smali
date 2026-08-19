.class public Lcom/sonymobile/scan3d/SphinxSettings;
.super Ljava/lang/Object;
.source "SphinxSettings.java"


# instance fields
.field private mFocusType:Ljava/lang/String;

.field private mUseAutoWhiteBalanceLock:Z

.field private mUseEdgeEnhancement:Z

.field private mUseLamp:Z

.field private mUseNoiseReduction:Z

.field private mUseSound:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 4

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 59
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    const v2, 0x7f100160

    .line 62
    invoke-virtual {p1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    const v3, 0x7f1001d4

    .line 64
    invoke-virtual {p1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/sonymobile/scan3d/SphinxSettings;->mFocusType:Ljava/lang/String;

    const v2, 0x7f1001f4

    .line 68
    invoke-virtual {p1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p0, Lcom/sonymobile/scan3d/SphinxSettings;->mUseLamp:Z

    const v2, 0x7f1001ea

    .line 72
    invoke-virtual {p1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p0, Lcom/sonymobile/scan3d/SphinxSettings;->mUseSound:Z

    const v2, 0x7f050005

    .line 75
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    const v3, 0x7f1001cd

    .line 77
    invoke-virtual {p1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p0, Lcom/sonymobile/scan3d/SphinxSettings;->mUseEdgeEnhancement:Z

    const v2, 0x7f050009

    .line 81
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    const v3, 0x7f1001e0

    .line 83
    invoke-virtual {p1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p0, Lcom/sonymobile/scan3d/SphinxSettings;->mUseNoiseReduction:Z

    const v2, 0x7f050003

    .line 87
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    const v2, 0x7f1001c3

    .line 89
    invoke-virtual {p1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v1, p1, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iput-boolean p1, p0, Lcom/sonymobile/scan3d/SphinxSettings;->mUseAutoWhiteBalanceLock:Z

    return-void
.end method


# virtual methods
.method public getFocusType()Ljava/lang/String;
    .locals 1

    .line 100
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxSettings;->mFocusType:Ljava/lang/String;

    return-object v0
.end method

.method public useAutoWhiteBalanceLock()Z
    .locals 1

    .line 136
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/SphinxSettings;->mUseAutoWhiteBalanceLock:Z

    return v0
.end method

.method public useEdgeEnhancement()Z
    .locals 1

    .line 127
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/SphinxSettings;->mUseEdgeEnhancement:Z

    return v0
.end method

.method public useLamp()Z
    .locals 1

    .line 109
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/SphinxSettings;->mUseLamp:Z

    return v0
.end method

.method public useNoiseReduction()Z
    .locals 1

    .line 145
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/SphinxSettings;->mUseNoiseReduction:Z

    return v0
.end method

.method public useSound()Z
    .locals 1

    .line 118
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/SphinxSettings;->mUseSound:Z

    return v0
.end method
