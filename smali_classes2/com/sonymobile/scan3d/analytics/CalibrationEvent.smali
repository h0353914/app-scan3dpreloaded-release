.class public final enum Lcom/sonymobile/scan3d/analytics/CalibrationEvent;
.super Ljava/lang/Enum;
.source "CalibrationEvent.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/analytics/CalibrationEvent;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/analytics/CalibrationEvent;

.field private static final TAG:Ljava/lang/String;

.field public static final enum VALUES:Lcom/sonymobile/scan3d/analytics/CalibrationEvent;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 32
    new-instance v0, Lcom/sonymobile/scan3d/analytics/CalibrationEvent;

    const-string v1, "VALUES"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/sonymobile/scan3d/analytics/CalibrationEvent;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/CalibrationEvent;->VALUES:Lcom/sonymobile/scan3d/analytics/CalibrationEvent;

    const/4 v0, 0x1

    .line 27
    new-array v0, v0, [Lcom/sonymobile/scan3d/analytics/CalibrationEvent;

    sget-object v1, Lcom/sonymobile/scan3d/analytics/CalibrationEvent;->VALUES:Lcom/sonymobile/scan3d/analytics/CalibrationEvent;

    aput-object v1, v0, v2

    sput-object v0, Lcom/sonymobile/scan3d/analytics/CalibrationEvent;->$VALUES:[Lcom/sonymobile/scan3d/analytics/CalibrationEvent;

    .line 37
    const-class v0, Lcom/sonymobile/scan3d/analytics/CalibrationEvent;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/sonymobile/scan3d/analytics/CalibrationEvent;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 27
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/analytics/CalibrationEvent;
    .locals 1

    .line 27
    const-class v0, Lcom/sonymobile/scan3d/analytics/CalibrationEvent;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/analytics/CalibrationEvent;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/analytics/CalibrationEvent;
    .locals 1

    .line 27
    sget-object v0, Lcom/sonymobile/scan3d/analytics/CalibrationEvent;->$VALUES:[Lcom/sonymobile/scan3d/analytics/CalibrationEvent;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/analytics/CalibrationEvent;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/analytics/CalibrationEvent;

    return-object v0
.end method


# virtual methods
.method public send(Landroid/content/Context;I)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 44
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/results/calib_auto.xml"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 46
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 47
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 51
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 53
    :try_start_0
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/InputStreamReader;

    new-instance v4, Ljava/io/FileInputStream;

    invoke-direct {v4, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v3, v4, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    const/4 v1, 0x0

    .line 57
    :goto_0
    :try_start_1
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 58
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 61
    :cond_0
    :try_start_2
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_3

    :catchall_0
    move-exception v3

    goto :goto_1

    :catch_0
    move-exception v1

    .line 53
    :try_start_3
    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :goto_1
    if-eqz v1, :cond_1

    .line 61
    :try_start_4
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_2

    :catch_1
    move-exception v2

    :try_start_5
    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_2

    :cond_1
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    :goto_2
    throw v3
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    :catch_2
    move-exception v1

    .line 62
    sget-object v2, Lcom/sonymobile/scan3d/analytics/CalibrationEvent;->TAG:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    :goto_3
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-lez v1, :cond_2

    .line 66
    new-instance v1, Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;->build()Lfr/arnaudguyon/xmltojsonlib/XmlToJson;

    move-result-object v0

    .line 67
    invoke-virtual {v0}, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->toJson()Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "ScanMode"

    .line 68
    invoke-virtual {v0, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const/4 p2, 0x0

    .line 69
    invoke-static {p1, v0, p2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;->addScanIdToPayload(Landroid/content/Context;Lorg/json/JSONObject;Z)V

    .line 70
    invoke-static {p1}, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->getInstance(Landroid/content/Context;)Lcom/sonymobile/scan3d/analytics/SBDPUtil;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->pushConfigValues(Lorg/json/JSONObject;)V

    :cond_2
    return-void
.end method
