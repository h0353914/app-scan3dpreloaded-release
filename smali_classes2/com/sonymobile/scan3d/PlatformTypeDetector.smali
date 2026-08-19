.class public Lcom/sonymobile/scan3d/PlatformTypeDetector;
.super Ljava/lang/Object;
.source "PlatformTypeDetector.java"


# static fields
.field private static final sPlatformsLowEnd:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 13
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/sonymobile/scan3d/PlatformTypeDetector;->sPlatformsLowEnd:Ljava/util/Set;

    .line 16
    sget-object v0, Lcom/sonymobile/scan3d/PlatformTypeDetector;->sPlatformsLowEnd:Ljava/util/Set;

    const-string v1, "sdm660"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static detectPlatform()I
    .locals 2

    .line 20
    sget-object v0, Landroid/os/Build;->BOARD:Ljava/lang/String;

    .line 22
    sget-object v1, Lcom/sonymobile/scan3d/PlatformTypeDetector;->sPlatformsLowEnd:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
