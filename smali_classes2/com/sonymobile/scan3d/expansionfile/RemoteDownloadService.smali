.class public Lcom/sonymobile/scan3d/expansionfile/RemoteDownloadService;
.super Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;
.source "RemoteDownloadService.java"


# static fields
.field private static final BASE64_PUBLIC_KEY:Ljava/lang/String; = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAmZJmj3D1FUAMYQWlyiTX3okE4fdBqYQCJYZTCeB+QuN2WAqYbIQGkDXbhLeY+RZO3G1qDSjwsx8rF2VIGpg3Pm6tBZdmel4PHZndCSM1V2NYGGMAhG/LxgkZN0DOMDVfBQoQZr2FoUnX/e0nlitjf4utDtSadQvhJIQJbdrPpFYX5ognY9PFFp7xO1I+Je0qdLCspfCSE95eM2E3etYEyOmwOrJ3bMZ7Gs05RCl69ONomYBEkfP0kjlFeC3K3TO+C6U7CYQtVPLz3xGHPsgGxjL5XXhaxY2wex+l0GpUa51VNrV5hEm2YyY0zKgr6ALxdKHAxidw2utpsp2pwMiafwIDAQAB"

.field private static SALT:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x14

    .line 23
    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lcom/sonymobile/scan3d/expansionfile/RemoteDownloadService;->SALT:[B

    return-void

    :array_0
    .array-data 1
        0x78t
        0x37t
        0x7dt
        -0x3dt
        0x42t
        0x16t
        0x19t
        0x9t
        -0x1dt
        0x73t
        0x42t
        -0x5ft
        0x3t
        -0x7at
        0x75t
        0x7ct
        -0x3dt
        0x8t
        0x13t
        0x34t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;-><init>()V

    return-void
.end method


# virtual methods
.method public getAlarmReceiverClassName()Ljava/lang/String;
    .locals 1

    .line 37
    const-class v0, Lcom/sonymobile/scan3d/expansionfile/RemoteAlarmReceiver;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPublicKey()Ljava/lang/String;
    .locals 1

    const-string v0, "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAmZJmj3D1FUAMYQWlyiTX3okE4fdBqYQCJYZTCeB+QuN2WAqYbIQGkDXbhLeY+RZO3G1qDSjwsx8rF2VIGpg3Pm6tBZdmel4PHZndCSM1V2NYGGMAhG/LxgkZN0DOMDVfBQoQZr2FoUnX/e0nlitjf4utDtSadQvhJIQJbdrPpFYX5ognY9PFFp7xO1I+Je0qdLCspfCSE95eM2E3etYEyOmwOrJ3bMZ7Gs05RCl69ONomYBEkfP0kjlFeC3K3TO+C6U7CYQtVPLz3xGHPsgGxjL5XXhaxY2wex+l0GpUa51VNrV5hEm2YyY0zKgr6ALxdKHAxidw2utpsp2pwMiafwIDAQAB"

    return-object v0
.end method

.method public getSALT()[B
    .locals 1

    .line 32
    sget-object v0, Lcom/sonymobile/scan3d/expansionfile/RemoteDownloadService;->SALT:[B

    return-object v0
.end method
