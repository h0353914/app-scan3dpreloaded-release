.class Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadLoader;
.super Landroidx/loader/content/AsyncTaskLoader;
.source "UploadLoader.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/loader/content/AsyncTaskLoader<",
        "Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;",
        ">;"
    }
.end annotation


# instance fields
.field private final mAction:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

.field private mData:Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;

.field private final mIsShared:Z

.field private final mServiceProvider:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

.field private final mUri:Landroid/net/Uri;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/content/Intent;Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;)V
    .locals 0

    .line 59
    invoke-direct {p0, p1}, Landroidx/loader/content/AsyncTaskLoader;-><init>(Landroid/content/Context;)V

    .line 60
    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadLoader;->mUri:Landroid/net/Uri;

    .line 61
    iput-object p3, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadLoader;->mServiceProvider:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    .line 62
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->getAction(Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadLoader;->mAction:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    .line 63
    new-instance p1, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    const-string p3, "com.sonymobile.scan3d.extra.SHAREABLE"

    invoke-virtual {p2, p3}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;-><init>(Landroid/os/Bundle;)V

    .line 65
    sget-object p2, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadLoader$1;->$SwitchMap$com$sonymobile$scan3d$storageservice$ui$upload$Action:[I

    iget-object p3, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadLoader;->mAction:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    invoke-virtual {p3}, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->ordinal()I

    move-result p3

    aget p2, p2, p3

    const/4 p3, 0x1

    packed-switch p2, :pswitch_data_0

    .line 77
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->isShared()Z

    move-result p1

    iput-boolean p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadLoader;->mIsShared:Z

    goto :goto_1

    .line 74
    :pswitch_0
    iput-boolean p3, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadLoader;->mIsShared:Z

    goto :goto_1

    .line 69
    :pswitch_1
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->isShared()Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->getShareType()Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    move-result-object p1

    sget-object p2, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->PROPS:Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    if-eq p1, p2, :cond_0

    goto :goto_0

    :cond_0
    const/4 p3, 0x0

    :goto_0
    iput-boolean p3, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadLoader;->mIsShared:Z

    :goto_1
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private getUploadUri(J)Landroid/net/Uri;
    .locals 2

    .line 136
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadLoader;->mUri:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "upload"

    .line 137
    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    .line 138
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    .line 139
    invoke-virtual {p1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public deliverResult(Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;)V
    .locals 1

    .line 118
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadLoader;->isReset()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 122
    :cond_0
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadLoader;->mData:Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;

    .line 124
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadLoader;->isStarted()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 125
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadLoader;->mData:Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;

    invoke-super {p0, p1}, Landroidx/loader/content/AsyncTaskLoader;->deliverResult(Ljava/lang/Object;)V

    :cond_1
    return-void
.end method

.method public bridge synthetic deliverResult(Ljava/lang/Object;)V
    .locals 0

    .line 24
    check-cast p1, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadLoader;->deliverResult(Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;)V

    return-void
.end method

.method public loadInBackground()Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;
    .locals 6

    .line 84
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadLoader;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 85
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadLoader;->mUri:Landroid/net/Uri;

    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadLoader;->mServiceProvider:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    invoke-static {v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->getUpload(Landroid/content/Context;Landroid/net/Uri;Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;)Lcom/sonymobile/scan3d/storageservice/provider/Upload;

    move-result-object v1

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    .line 86
    iget-object v3, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadLoader;->mServiceProvider:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    iget-object v4, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadLoader;->mAction:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    invoke-virtual {v3, v0, v1, v4}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->isValid(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/Upload;Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-boolean v3, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadLoader;->mIsShared:Z

    if-eqz v3, :cond_0

    move v3, v2

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    if-eqz v1, :cond_1

    .line 89
    invoke-virtual {v1}, Lcom/sonymobile/scan3d/storageservice/provider/Upload;->isFinished()Z

    move-result v4

    if-eqz v4, :cond_1

    if-nez v3, :cond_1

    .line 90
    invoke-virtual {v1}, Lcom/sonymobile/scan3d/storageservice/provider/Upload;->getId()J

    move-result-wide v4

    invoke-direct {p0, v4, v5}, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadLoader;->getUploadUri(J)Landroid/net/Uri;

    move-result-object v1

    .line 92
    new-instance v4, Landroid/content/ContentValues;

    invoke-direct {v4, v2}, Landroid/content/ContentValues;-><init>(I)V

    const-string v2, "state"

    const/4 v5, -0x1

    .line 93
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v2, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 94
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const/4 v5, 0x0

    invoke-virtual {v2, v1, v4, v5, v5}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 95
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadLoader;->mUri:Landroid/net/Uri;

    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadLoader;->mServiceProvider:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    invoke-static {v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->getUpload(Landroid/content/Context;Landroid/net/Uri;Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;)Lcom/sonymobile/scan3d/storageservice/provider/Upload;

    move-result-object v1

    .line 97
    :cond_1
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;

    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadLoader;->mAction:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    invoke-direct {v0, v1, v3, v2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;-><init>(Lcom/sonymobile/scan3d/storageservice/provider/Upload;ZLcom/sonymobile/scan3d/storageservice/ui/upload/Action;)V

    return-object v0
.end method

.method public bridge synthetic loadInBackground()Ljava/lang/Object;
    .locals 1

    .line 24
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadLoader;->loadInBackground()Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;

    move-result-object v0

    return-object v0
.end method

.method protected onStartLoading()V
    .locals 1

    .line 102
    invoke-super {p0}, Landroidx/loader/content/AsyncTaskLoader;->onStartLoading()V

    .line 104
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadLoader;->mData:Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;

    if-eqz v0, :cond_0

    .line 105
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadLoader;->deliverResult(Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;)V

    goto :goto_0

    .line 107
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadLoader;->forceLoad()V

    :goto_0
    return-void
.end method

.method protected onStopLoading()V
    .locals 0

    .line 113
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadLoader;->cancelLoad()Z

    return-void
.end method
