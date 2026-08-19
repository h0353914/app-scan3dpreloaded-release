.class public final enum Lcom/sonymobile/scan3d/analytics/ScreenEvent;
.super Ljava/lang/Enum;
.source "ScreenEvent.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/analytics/ScreenEvent;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/analytics/ScreenEvent;

.field public static final enum AUTH_SCREEN:Lcom/sonymobile/scan3d/analytics/ScreenEvent;

.field public static final ENTERING_SCREEN:Z = true

.field public static final enum GALLERY_SCREEN:Lcom/sonymobile/scan3d/analytics/ScreenEvent;

.field public static final enum ONBOARDING:Lcom/sonymobile/scan3d/analytics/ScreenEvent;

.field public static final enum SCREEN_EVENT_FROM_REFERENS_ID:Lcom/sonymobile/scan3d/analytics/ScreenEvent;

.field public static final enum VIEWER_SCREEN:Lcom/sonymobile/scan3d/analytics/ScreenEvent;

.field public static final enum WALLPAPER_SCREEN:Lcom/sonymobile/scan3d/analytics/ScreenEvent;

.field public static final enum WEBVIEWER_SCREEN:Lcom/sonymobile/scan3d/analytics/ScreenEvent;


# instance fields
.field private final mName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 17
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScreenEvent;

    const-string v1, "ONBOARDING"

    const-string v2, "Onboarding screen"

    const/4 v3, 0x0

    invoke-direct {v0, v1, v3, v2}, Lcom/sonymobile/scan3d/analytics/ScreenEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->ONBOARDING:Lcom/sonymobile/scan3d/analytics/ScreenEvent;

    .line 22
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScreenEvent;

    const-string v1, "WALLPAPER_SCREEN"

    const-string v2, "Wallpaper screen"

    const/4 v4, 0x1

    invoke-direct {v0, v1, v4, v2}, Lcom/sonymobile/scan3d/analytics/ScreenEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->WALLPAPER_SCREEN:Lcom/sonymobile/scan3d/analytics/ScreenEvent;

    .line 27
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScreenEvent;

    const-string v1, "WEBVIEWER_SCREEN"

    const-string v2, "Scan3d web viewer screen"

    const/4 v5, 0x2

    invoke-direct {v0, v1, v5, v2}, Lcom/sonymobile/scan3d/analytics/ScreenEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->WEBVIEWER_SCREEN:Lcom/sonymobile/scan3d/analytics/ScreenEvent;

    .line 32
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScreenEvent;

    const-string v1, "VIEWER_SCREEN"

    const-string v2, "Viewer screen"

    const/4 v6, 0x3

    invoke-direct {v0, v1, v6, v2}, Lcom/sonymobile/scan3d/analytics/ScreenEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->VIEWER_SCREEN:Lcom/sonymobile/scan3d/analytics/ScreenEvent;

    .line 37
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScreenEvent;

    const-string v1, "GALLERY_SCREEN"

    const-string v2, "Gallery screen"

    const/4 v7, 0x4

    invoke-direct {v0, v1, v7, v2}, Lcom/sonymobile/scan3d/analytics/ScreenEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->GALLERY_SCREEN:Lcom/sonymobile/scan3d/analytics/ScreenEvent;

    .line 42
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScreenEvent;

    const-string v1, "AUTH_SCREEN"

    const-string v2, "Auth screen"

    const/4 v8, 0x5

    invoke-direct {v0, v1, v8, v2}, Lcom/sonymobile/scan3d/analytics/ScreenEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->AUTH_SCREEN:Lcom/sonymobile/scan3d/analytics/ScreenEvent;

    .line 48
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScreenEvent;

    const-string v1, "SCREEN_EVENT_FROM_REFERENS_ID"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/sonymobile/scan3d/analytics/ScreenEvent;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->SCREEN_EVENT_FROM_REFERENS_ID:Lcom/sonymobile/scan3d/analytics/ScreenEvent;

    const/4 v0, 0x7

    .line 12
    new-array v0, v0, [Lcom/sonymobile/scan3d/analytics/ScreenEvent;

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->ONBOARDING:Lcom/sonymobile/scan3d/analytics/ScreenEvent;

    aput-object v1, v0, v3

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->WALLPAPER_SCREEN:Lcom/sonymobile/scan3d/analytics/ScreenEvent;

    aput-object v1, v0, v4

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->WEBVIEWER_SCREEN:Lcom/sonymobile/scan3d/analytics/ScreenEvent;

    aput-object v1, v0, v5

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->VIEWER_SCREEN:Lcom/sonymobile/scan3d/analytics/ScreenEvent;

    aput-object v1, v0, v6

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->GALLERY_SCREEN:Lcom/sonymobile/scan3d/analytics/ScreenEvent;

    aput-object v1, v0, v7

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->AUTH_SCREEN:Lcom/sonymobile/scan3d/analytics/ScreenEvent;

    aput-object v1, v0, v8

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->SCREEN_EVENT_FROM_REFERENS_ID:Lcom/sonymobile/scan3d/analytics/ScreenEvent;

    aput-object v1, v0, v2

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->$VALUES:[Lcom/sonymobile/scan3d/analytics/ScreenEvent;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    const-string v0, ""

    .line 75
    invoke-direct {p0, p1, p2, v0}, Lcom/sonymobile/scan3d/analytics/ScreenEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 66
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 67
    iput-object p3, p0, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->mName:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/analytics/ScreenEvent;
    .locals 1

    .line 12
    const-class v0, Lcom/sonymobile/scan3d/analytics/ScreenEvent;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/analytics/ScreenEvent;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/analytics/ScreenEvent;
    .locals 1

    .line 12
    sget-object v0, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->$VALUES:[Lcom/sonymobile/scan3d/analytics/ScreenEvent;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/analytics/ScreenEvent;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/analytics/ScreenEvent;

    return-object v0
.end method


# virtual methods
.method public send(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x1

    .line 83
    invoke-virtual {p0, p1, v0}, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->send(Landroid/content/Context;Z)V

    return-void
.end method

.method public send(Landroid/content/Context;I)V
    .locals 1

    .line 101
    invoke-static {p1}, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->getInstance(Landroid/content/Context;)Lcom/sonymobile/scan3d/analytics/SBDPUtil;

    move-result-object v0

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x1

    invoke-virtual {v0, p1, p2}, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->pushAppView(Ljava/lang/String;Z)V

    return-void
.end method

.method public send(Landroid/content/Context;Z)V
    .locals 1

    .line 91
    invoke-static {p1}, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->getInstance(Landroid/content/Context;)Lcom/sonymobile/scan3d/analytics/SBDPUtil;

    move-result-object p1

    iget-object v0, p0, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->mName:Ljava/lang/String;

    invoke-virtual {p1, v0, p2}, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->pushAppView(Ljava/lang/String;Z)V

    return-void
.end method
