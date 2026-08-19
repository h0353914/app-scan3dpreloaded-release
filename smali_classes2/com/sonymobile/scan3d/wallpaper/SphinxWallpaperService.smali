.class public Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;
.super Landroid/service/wallpaper/WallpaperService;
.source "SphinxWallpaperService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;
    }
.end annotation


# static fields
.field private static final CALCULATE_SPEED_MULTIPLIER:F = 0.027777778f

.field private static final DEFAULT_ROTATION_SPEED:F = 0.0027692309f

.field private static final FACE_FRONT_ANGLE_LIMIT:I = 0x3c

.field private static final FACE_FRONT_SEGMENTS:I = 0x6

.field private static final GET_BACK_ROTATION_MULTIPLIER:F = 5.0f

.field private static final MAX_TILT_DEGREES:I = 0x2d

.field private static final PREF_JSON_VIEW_MAT:Ljava/lang/String; = "view_mat"

.field private static final PREF_POSE:Ljava/lang/String; = "pref_lw_pose"

.field private static final PREVIEW_ANIMATION_DELAY:J = 0xbb8L

.field private static final ROTATION_DECELERATION_MULTIPLIER:F = 0.98f

.field private static final VELOCITY_MIN:F = 1500.0f

.field private static final sMutex:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 81
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;->sMutex:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 46
    invoke-direct {p0}, Landroid/service/wallpaper/WallpaperService;-><init>()V

    return-void
.end method

.method static synthetic access$200()Ljava/lang/Object;
    .locals 1

    .line 46
    sget-object v0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;->sMutex:Ljava/lang/Object;

    return-object v0
.end method

.method public static isCurrentWallpaper(Landroid/content/Context;Landroid/net/Uri;)Z
    .locals 5

    .line 577
    invoke-static {p0}, Landroid/app/WallpaperManager;->getInstance(Landroid/content/Context;)Landroid/app/WallpaperManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/WallpaperManager;->getWallpaperInfo()Landroid/app/WallpaperInfo;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 581
    :cond_0
    invoke-virtual {v0}, Landroid/app/WallpaperInfo;->getPackageName()Ljava/lang/String;

    move-result-object v0

    .line 582
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    const v3, 0x7f1001fa

    .line 583
    invoke-virtual {p0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, ""

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 582
    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 584
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    invoke-virtual {v2, p1}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method

.method public static setAsWallpaper(Landroid/content/Context;Landroid/net/Uri;Z)V
    .locals 3

    .line 561
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const v1, 0x7f1001fa

    .line 562
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v0, "pref_lw_pose"

    const-string v1, ""

    .line 563
    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const v0, 0x7f1001f8

    .line 564
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 565
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 566
    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    const-string p2, "android.service.wallpaper.CHANGE_LIVE_WALLPAPER"

    .line 567
    invoke-virtual {p1, p2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string p2, "android.service.wallpaper.extra.LIVE_WALLPAPER_COMPONENT"

    .line 568
    new-instance v0, Landroid/content/ComponentName;

    .line 569
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-class v2, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;

    invoke-virtual {v2}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 568
    invoke-virtual {p1, p2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const/high16 p2, 0x40800000    # 4.0f

    .line 570
    invoke-virtual {p1, p2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 573
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method


# virtual methods
.method public onCreateEngine()Landroid/service/wallpaper/WallpaperService$Engine;
    .locals 2

    .line 85
    new-instance v0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;-><init>(Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$1;)V

    return-object v0
.end method
