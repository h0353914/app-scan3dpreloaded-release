.class public final Lcom/sonymobile/scan3d/storageservice/network/RestApi;
.super Ljava/lang/Object;
.source "RestApi.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "com.sonymobile.scan3d.storageservice.network.RestApi"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getBitmap(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .line 44
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/network/RestApi;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getBitmap(): "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/network/RestApi$1;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/storageservice/network/RestApi$1;-><init>()V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    .line 66
    invoke-virtual {v0, p0, p1, p2, v1}, Lcom/sonymobile/scan3d/storageservice/network/RestApi$1;->init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;

    move-result-object p0

    return-object p0
.end method

.method public static getBitmapAsync(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/sonymobile/scan3d/storageservice/network/AsyncViewSetter;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/sonymobile/scan3d/storageservice/network/AsyncViewSetter<",
            "Landroid/widget/ImageView;",
            "Landroid/graphics/Bitmap;",
            ">;)V"
        }
    .end annotation

    .line 79
    invoke-static {p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/network/RestApi;->getBitmap(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;

    move-result-object p0

    invoke-interface {p0, p3}, Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;->executeAsync(Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor$IRestExecutorListener;)Lcom/sonymobile/scan3d/storageservice/Cancellable;

    return-void
.end method
