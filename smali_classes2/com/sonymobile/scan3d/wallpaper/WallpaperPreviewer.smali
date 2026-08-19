.class public Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer;
.super Landroidx/fragment/app/FragmentActivity;
.source "WallpaperPreviewer.java"

# interfaces
.implements Lcom/sonymobile/scan3d/viewer/fragments/ViewerActivityInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;
    }
.end annotation


# static fields
.field private static final ANIMATION_DELAY:J = 0xbb8L

.field private static final DEFAULT_ROTATION_SPEED:F = 0.006f

.field private static final FACE_FRONT_ANGLE_LIMIT:I = 0x3c

.field private static final FACE_FRONT_SEGMENTS:I = 0x6

.field private static final MAX_TILT_DEGREES:I = 0x2d

.field private static final PREF_JSON_VIEW_MAT:Ljava/lang/String; = "view_mat"

.field private static final PREF_POSE:Ljava/lang/String; = "pref_lw_pose"

.field private static final RESET_CLICKED_TIMEOUT:I = 0x1f4

.field private static STATE_FRAGMENT:Ljava/lang/String; = "state_fragment"

.field private static final mResetSettingsIconClicked:Ljava/lang/Runnable;

.field private static sSettingsIconClicked:Z


# instance fields
.field private mFragment:Landroidx/fragment/app/Fragment;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 168
    sget-object v0, Lcom/sonymobile/scan3d/wallpaper/-$$Lambda$WallpaperPreviewer$qthf39XtnlJwHXrMz9jBxoFGALE;->INSTANCE:Lcom/sonymobile/scan3d/wallpaper/-$$Lambda$WallpaperPreviewer$qthf39XtnlJwHXrMz9jBxoFGALE;

    sput-object v0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer;->mResetSettingsIconClicked:Ljava/lang/Runnable;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 63
    invoke-direct {p0}, Landroidx/fragment/app/FragmentActivity;-><init>()V

    return-void
.end method

.method static synthetic lambda$static$0()V
    .locals 1

    const/4 v0, 0x0

    .line 168
    sput-boolean v0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer;->sSettingsIconClicked:Z

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5

    .line 118
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 120
    invoke-static {p0}, Lcom/sonymobile/scan3d/Scan3DApp;->isPartOfBetaProgram(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 121
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer;->finish()V

    return-void

    .line 126
    :cond_0
    sget-boolean v0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer;->sSettingsIconClicked:Z

    if-eqz v0, :cond_1

    .line 127
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer;->finish()V

    return-void

    :cond_1
    const/4 v0, 0x1

    .line 130
    sput-boolean v0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer;->sSettingsIconClicked:Z

    .line 131
    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    sget-object v2, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer;->mResetSettingsIconClicked:Ljava/lang/Runnable;

    const-wide/16 v3, 0x1f4

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 135
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer;->requestWindowFeature(I)Z

    .line 137
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    if-eqz p1, :cond_2

    .line 140
    sget-object v1, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer;->STATE_FRAGMENT:Ljava/lang/String;

    invoke-virtual {v0, p1, v1}, Landroidx/fragment/app/FragmentManager;->getFragment(Landroid/os/Bundle;Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer;->mFragment:Landroidx/fragment/app/Fragment;

    goto :goto_0

    .line 142
    :cond_2
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object p1

    .line 143
    new-instance v0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer;->mFragment:Landroidx/fragment/app/Fragment;

    const v0, 0x1020002

    .line 144
    iget-object v1, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer;->mFragment:Landroidx/fragment/app/Fragment;

    invoke-virtual {p1, v0, v1}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 145
    invoke-virtual {p1}, Landroidx/fragment/app/FragmentTransaction;->commit()I

    :goto_0
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 3

    .line 151
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 152
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    sget-object v1, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer;->STATE_FRAGMENT:Ljava/lang/String;

    iget-object v2, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer;->mFragment:Landroidx/fragment/app/Fragment;

    invoke-virtual {v0, p1, v1, v2}, Landroidx/fragment/app/FragmentManager;->putFragment(Landroid/os/Bundle;Ljava/lang/String;Landroidx/fragment/app/Fragment;)V

    return-void
.end method

.method public registerOnBackPressListener(Lcom/sonymobile/scan3d/OnBackPressListener;)V
    .locals 0

    return-void
.end method

.method public unregisterOnBackPressListener(Lcom/sonymobile/scan3d/OnBackPressListener;)V
    .locals 0

    return-void
.end method
