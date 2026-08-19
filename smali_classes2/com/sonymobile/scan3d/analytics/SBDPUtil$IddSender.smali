.class Lcom/sonymobile/scan3d/analytics/SBDPUtil$IddSender;
.super Landroid/os/AsyncTask;
.source "SBDPUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/analytics/SBDPUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "IddSender"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field private mMethodAddAppDataJSON:Ljava/lang/reflect/Method;

.field private mPackageName:Ljava/lang/String;

.field private mPayload:Lorg/json/JSONObject;

.field private mVersionCode:I

.field private mVersionName:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/lang/reflect/Method;Ljava/lang/String;Ljava/lang/String;ILorg/json/JSONObject;)V
    .locals 0

    .line 280
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 281
    iput-object p1, p0, Lcom/sonymobile/scan3d/analytics/SBDPUtil$IddSender;->mMethodAddAppDataJSON:Ljava/lang/reflect/Method;

    .line 282
    iput-object p3, p0, Lcom/sonymobile/scan3d/analytics/SBDPUtil$IddSender;->mVersionName:Ljava/lang/String;

    .line 283
    iput p4, p0, Lcom/sonymobile/scan3d/analytics/SBDPUtil$IddSender;->mVersionCode:I

    .line 284
    iput-object p2, p0, Lcom/sonymobile/scan3d/analytics/SBDPUtil$IddSender;->mPackageName:Ljava/lang/String;

    .line 285
    iput-object p5, p0, Lcom/sonymobile/scan3d/analytics/SBDPUtil$IddSender;->mPayload:Lorg/json/JSONObject;

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/reflect/Method;Ljava/lang/String;Ljava/lang/String;ILorg/json/JSONObject;Lcom/sonymobile/scan3d/analytics/SBDPUtil$1;)V
    .locals 0

    .line 265
    invoke-direct/range {p0 .. p5}, Lcom/sonymobile/scan3d/analytics/SBDPUtil$IddSender;-><init>(Ljava/lang/reflect/Method;Ljava/lang/String;Ljava/lang/String;ILorg/json/JSONObject;)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 265
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/analytics/SBDPUtil$IddSender;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 4

    const/4 p1, 0x0

    .line 292
    :try_start_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/analytics/SBDPUtil$IddSender;->mMethodAddAppDataJSON:Ljava/lang/reflect/Method;

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/sonymobile/scan3d/analytics/SBDPUtil$IddSender;->mPackageName:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/sonymobile/scan3d/analytics/SBDPUtil$IddSender;->mVersionName:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x2

    iget v3, p0, Lcom/sonymobile/scan3d/analytics/SBDPUtil$IddSender;->mVersionCode:I

    .line 293
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x3

    iget-object v3, p0, Lcom/sonymobile/scan3d/analytics/SBDPUtil$IddSender;->mPayload:Lorg/json/JSONObject;

    aput-object v3, v1, v2

    .line 292
    invoke-virtual {v0, p1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 295
    :catch_0
    invoke-static {}, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->access$100()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Error when sending to IDD"

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 297
    :goto_0
    invoke-static {}, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->access$100()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/sonymobile/scan3d/analytics/SBDPUtil$IddSender;->mPayload:Lorg/json/JSONObject;

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-object p1
.end method
