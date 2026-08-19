.class public final enum Lcom/sonymobile/scan3d/analytics/EngineTimeEvent;
.super Ljava/lang/Enum;
.source "EngineTimeEvent.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/analytics/EngineTimeEvent;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/analytics/EngineTimeEvent;

.field public static final enum ENGINE:Lcom/sonymobile/scan3d/analytics/EngineTimeEvent;

.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 22
    new-instance v0, Lcom/sonymobile/scan3d/analytics/EngineTimeEvent;

    const-string v1, "ENGINE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/sonymobile/scan3d/analytics/EngineTimeEvent;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/EngineTimeEvent;->ENGINE:Lcom/sonymobile/scan3d/analytics/EngineTimeEvent;

    const/4 v0, 0x1

    .line 17
    new-array v0, v0, [Lcom/sonymobile/scan3d/analytics/EngineTimeEvent;

    sget-object v1, Lcom/sonymobile/scan3d/analytics/EngineTimeEvent;->ENGINE:Lcom/sonymobile/scan3d/analytics/EngineTimeEvent;

    aput-object v1, v0, v2

    sput-object v0, Lcom/sonymobile/scan3d/analytics/EngineTimeEvent;->$VALUES:[Lcom/sonymobile/scan3d/analytics/EngineTimeEvent;

    .line 24
    const-class v0, Lcom/sonymobile/scan3d/analytics/EngineTimeEvent;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/sonymobile/scan3d/analytics/EngineTimeEvent;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 30
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method private pushEngineTiming(Landroid/content/Context;JJJJI)V
    .locals 2

    .line 50
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_0
    const-string v1, "scale_time"

    .line 52
    invoke-virtual {v0, v1, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string p2, "sculpt_time"

    .line 53
    invoke-virtual {v0, p2, p4, p5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string p2, "blob_time"

    .line 54
    invoke-virtual {v0, p2, p6, p7}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string p2, "spray_painting_time"

    .line 55
    invoke-virtual {v0, p2, p8, p9}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string p2, "ScanMode"

    .line 56
    invoke-virtual {v0, p2, p10}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const/4 p2, 0x0

    .line 57
    invoke-static {p1, v0, p2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;->addScanIdToPayload(Landroid/content/Context;Lorg/json/JSONObject;Z)V

    .line 58
    invoke-static {p1}, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->getInstance(Landroid/content/Context;)Lcom/sonymobile/scan3d/analytics/SBDPUtil;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->pushEngineTiming(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 61
    sget-object p2, Lcom/sonymobile/scan3d/analytics/EngineTimeEvent;->TAG:Ljava/lang/String;

    invoke-virtual {p1}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3, p1}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/analytics/EngineTimeEvent;
    .locals 1

    .line 17
    const-class v0, Lcom/sonymobile/scan3d/analytics/EngineTimeEvent;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/analytics/EngineTimeEvent;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/analytics/EngineTimeEvent;
    .locals 1

    .line 17
    sget-object v0, Lcom/sonymobile/scan3d/analytics/EngineTimeEvent;->$VALUES:[Lcom/sonymobile/scan3d/analytics/EngineTimeEvent;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/analytics/EngineTimeEvent;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/analytics/EngineTimeEvent;

    return-object v0
.end method


# virtual methods
.method public send(Landroid/content/Context;JJJJI)V
    .locals 0

    .line 45
    invoke-direct/range {p0 .. p10}, Lcom/sonymobile/scan3d/analytics/EngineTimeEvent;->pushEngineTiming(Landroid/content/Context;JJJJI)V

    return-void
.end method
