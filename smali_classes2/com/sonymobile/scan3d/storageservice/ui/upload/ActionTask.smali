.class public abstract Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;
.super Ljava/lang/Object;
.source "ActionTask.java"

# interfaces
.implements Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor$IRestExecutorProgressListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask$ActionResult;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor$IRestExecutorProgressListener<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# static fields
.field private static final MIN_TIME_BETWEEN_NOTIFY:J = 0x96L


# instance fields
.field private final mAction:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

.field private mContext:Landroid/content/Context;

.field private mCredentials:Lcom/sonymobile/scan3d/storageservice/network/Credentials;

.field private final mExtras:Landroid/os/Bundle;

.field private mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

.field private mLastNotifyTime:J

.field private mNotifier:Lcom/sonymobile/scan3d/utils/notification/Notifier;

.field private mServiceProvider:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

.field private mUploadRecordUri:Landroid/net/Uri;


# direct methods
.method protected constructor <init>(Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/network/Credentials;Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;Landroid/net/Uri;Landroid/os/Bundle;)V
    .locals 0

    .line 142
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 143
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mServiceProvider:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    .line 144
    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    .line 145
    iput-object p4, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mAction:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    .line 146
    iput-object p5, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mUploadRecordUri:Landroid/net/Uri;

    .line 147
    iput-object p3, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mCredentials:Lcom/sonymobile/scan3d/storageservice/network/Credentials;

    .line 148
    iput-object p6, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mExtras:Landroid/os/Bundle;

    return-void
.end method

.method private addActions(Landroid/app/Notification$Builder;Ljava/lang/String;)V
    .locals 8

    .line 473
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mServiceProvider:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->getSupportedActions()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    .line 475
    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mAction:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    invoke-virtual {v2, v1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 476
    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mServiceProvider:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    iget-object v3, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mContext:Landroid/content/Context;

    iget-object v6, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mCredentials:Lcom/sonymobile/scan3d/storageservice/network/Credentials;

    iget-object v7, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mExtras:Landroid/os/Bundle;

    move-object v4, v1

    move-object v5, p2

    invoke-virtual/range {v2 .. v7}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->getIntent(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;Ljava/lang/String;Lcom/sonymobile/scan3d/storageservice/network/Credentials;Landroid/os/Bundle;)Landroid/content/Intent;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 479
    iget-object v3, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v3}, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->getName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 480
    new-instance v3, Landroid/app/Notification$Action$Builder;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mContext:Landroid/content/Context;

    const/4 v6, 0x0

    const/high16 v7, 0x8000000

    .line 481
    invoke-static {v5, v6, v2, v7}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    invoke-direct {v3, v4, v1, v2}, Landroid/app/Notification$Action$Builder;-><init>(Landroid/graphics/drawable/Icon;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 482
    invoke-virtual {v3}, Landroid/app/Notification$Action$Builder;->build()Landroid/app/Notification$Action;

    move-result-object v1

    .line 480
    invoke-virtual {p1, v1}, Landroid/app/Notification$Builder;->addAction(Landroid/app/Notification$Action;)Landroid/app/Notification$Builder;

    goto :goto_0

    :cond_1
    return-void
.end method

.method private finish(Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask$ActionResult;)V
    .locals 4

    .line 362
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask$1;->$SwitchMap$com$sonymobile$scan3d$storageservice$ui$upload$Action:[I

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->ordinal()I

    move-result p1

    aget p1, v0, p1

    const/4 v0, 0x2

    const/4 v1, 0x0

    if-eq p1, v0, :cond_1

    .line 374
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask$ActionResult;->success()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 375
    new-instance p1, Landroid/content/ContentValues;

    invoke-direct {p1, v0}, Landroid/content/ContentValues;-><init>(I)V

    const-string v2, "uid"

    .line 376
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask$ActionResult;->getUid()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "state"

    .line 377
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v2, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 378
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mUploadRecordUri:Landroid/net/Uri;

    invoke-virtual {v0, v2, p1, v1, v1}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_0

    .line 380
    :cond_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mUploadRecordUri:Landroid/net/Uri;

    invoke-virtual {p1, v0, v1, v1}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_0

    .line 364
    :cond_1
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask$ActionResult;->success()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 365
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mUploadRecordUri:Landroid/net/Uri;

    invoke-virtual {p1, v0, v1, v1}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_0

    .line 367
    :cond_2
    new-instance p1, Landroid/content/ContentValues;

    const/4 v0, 0x1

    invoke-direct {p1, v0}, Landroid/content/ContentValues;-><init>(I)V

    const-string v0, "state"

    const/4 v2, 0x3

    .line 368
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p1, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 369
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mUploadRecordUri:Landroid/net/Uri;

    invoke-virtual {v0, v2, p1, v1, v1}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 385
    :goto_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mNotifier:Lcom/sonymobile/scan3d/utils/notification/Notifier;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->getId()I

    move-result v0

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask$ActionResult;->success()Z

    move-result v1

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask$ActionResult;->getUid()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, v1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->getResultingNotification(ZLjava/lang/String;)Landroid/app/Notification;

    move-result-object p2

    invoke-virtual {p1, v0, p2}, Lcom/sonymobile/scan3d/utils/notification/Notifier;->notify(ILandroid/app/Notification;)V

    return-void
.end method

.method private getFinalActionText(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 331
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask$1;->$SwitchMap$com$sonymobile$scan3d$storageservice$ui$upload$Action:[I

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->ordinal()I

    move-result p2

    aget p2, v0, p2

    const/4 v0, 0x0

    const/4 v1, 0x1

    packed-switch p2, :pswitch_data_0

    const p2, 0x7f100340

    .line 347
    new-array v1, v1, [Ljava/lang/Object;

    aput-object p3, v1, v0

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :pswitch_0
    const p2, 0x7f100341

    .line 343
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :pswitch_1
    const p2, 0x7f100345

    .line 339
    new-array v1, v1, [Ljava/lang/Object;

    aput-object p3, v1, v0

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :pswitch_2
    const p2, 0x7f100344

    .line 336
    new-array v1, v1, [Ljava/lang/Object;

    aput-object p3, v1, v0

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :pswitch_3
    const p2, 0x7f100342

    .line 333
    new-array v1, v1, [Ljava/lang/Object;

    aput-object p3, v1, v0

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    :goto_0
    return-object p1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private getGroupKey()Ljava/lang/String;
    .locals 2

    .line 166
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "group_upload_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->getId()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getNotificationTitle(Landroid/content/Context;Z)Ljava/lang/String;
    .locals 5

    .line 409
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mServiceProvider:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->getServiceProviderName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz p2, :cond_0

    .line 411
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mAction:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->getCompletedText(Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;)I

    move-result p2

    new-array v1, v1, [Ljava/lang/Object;

    aput-object v0, v1, v2

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 413
    :cond_0
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mAction:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->getOngoingText(Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;)I

    move-result p2

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    invoke-interface {v4}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getName()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v2

    aput-object v0, v3, v1

    invoke-virtual {p1, p2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private getResultingNotification(ZLjava/lang/String;)Landroid/app/Notification;
    .locals 10

    .line 436
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getName()Ljava/lang/String;

    move-result-object v0

    .line 437
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mNotifier:Lcom/sonymobile/scan3d/utils/notification/Notifier;

    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mContext:Landroid/content/Context;

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Lcom/sonymobile/scan3d/utils/notification/Notifier;->newBuilder(Landroid/content/Context;I)Landroid/app/Notification$Builder;

    move-result-object v1

    const v2, 0x7f08010e

    .line 438
    invoke-virtual {v1, v2}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    .line 439
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->getGroupKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/Notification$Builder;->setGroup(Ljava/lang/String;)Landroid/app/Notification$Builder;

    .line 440
    invoke-virtual {v1, v3}, Landroid/app/Notification$Builder;->setAutoCancel(Z)Landroid/app/Notification$Builder;

    const/4 v2, 0x0

    if-eqz p1, :cond_1

    .line 443
    iget-object v4, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mServiceProvider:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    iget-object v5, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mContext:Landroid/content/Context;

    iget-object v6, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mAction:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    iget-object v8, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mCredentials:Lcom/sonymobile/scan3d/storageservice/network/Credentials;

    iget-object v9, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mExtras:Landroid/os/Bundle;

    move-object v7, p2

    invoke-virtual/range {v4 .. v9}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->getIntent(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;Ljava/lang/String;Lcom/sonymobile/scan3d/storageservice/network/Credentials;Landroid/os/Bundle;)Landroid/content/Intent;

    move-result-object p1

    .line 444
    iget-object v4, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mContext:Landroid/content/Context;

    invoke-direct {p0, v4, v3}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->getNotificationTitle(Landroid/content/Context;Z)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    if-eqz p1, :cond_0

    .line 447
    iget-object v3, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mContext:Landroid/content/Context;

    const/high16 v4, 0x8000000

    .line 448
    invoke-static {v3, v2, p1, v4}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p1

    .line 447
    invoke-virtual {v1, p1}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    .line 449
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mAction:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    invoke-direct {p0, p1, v2, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->getFinalActionText(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 451
    invoke-direct {p0, v1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->addActions(Landroid/app/Notification$Builder;Ljava/lang/String;)V

    goto :goto_0

    .line 453
    :cond_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mContext:Landroid/content/Context;

    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mAction:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    .line 454
    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->getNoFurtherActionText(Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;)I

    move-result p2

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v0, v3, v2

    invoke-virtual {p1, p2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 453
    invoke-virtual {v1, p1}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    goto :goto_0

    .line 457
    :cond_1
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mContext:Landroid/content/Context;

    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mAction:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->getFailedTitle(Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;)I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 459
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mContext:Landroid/content/Context;

    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mAction:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->getFailedText(Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;)I

    move-result p2

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v0, v4, v2

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mServiceProvider:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mContext:Landroid/content/Context;

    .line 460
    invoke-virtual {v0, v2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->getServiceProviderName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v4, v3

    .line 459
    invoke-virtual {p1, p2, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 462
    :goto_0
    invoke-virtual {v1}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object p1

    return-object p1
.end method

.method private showProcessingNotification()V
    .locals 4

    .line 392
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mNotifier:Lcom/sonymobile/scan3d/utils/notification/Notifier;

    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mContext:Landroid/content/Context;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/sonymobile/scan3d/utils/notification/Notifier;->newBuilder(Landroid/content/Context;I)Landroid/app/Notification$Builder;

    move-result-object v0

    const v1, 0x7f08010e

    .line 393
    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    .line 394
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mContext:Landroid/content/Context;

    const/4 v3, 0x0

    invoke-direct {p0, v1, v3}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->getNotificationTitle(Landroid/content/Context;Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 395
    invoke-virtual {v0, v2}, Landroid/app/Notification$Builder;->setOngoing(Z)Landroid/app/Notification$Builder;

    .line 396
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->getGroupKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setGroup(Ljava/lang/String;)Landroid/app/Notification$Builder;

    .line 397
    invoke-virtual {v0, v3, v3, v2}, Landroid/app/Notification$Builder;->setProgress(IIZ)Landroid/app/Notification$Builder;

    .line 398
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mNotifier:Lcom/sonymobile/scan3d/utils/notification/Notifier;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->getId()I

    move-result v2

    invoke-virtual {v0}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Lcom/sonymobile/scan3d/utils/notification/Notifier;->notify(ILandroid/app/Notification;)V

    return-void
.end method

.method private updateState(I)V
    .locals 3

    .line 423
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "state"

    .line 424
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 425
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mUploadRecordUri:Landroid/net/Uri;

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v0, v2, v2}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    return-void
.end method


# virtual methods
.method public abstract execute(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/network/Credentials;Landroid/os/Bundle;)Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask$ActionResult;
.end method

.method final execute(Landroid/app/Service;Lcom/sonymobile/scan3d/utils/notification/Notifier;)V
    .locals 9

    .line 176
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mContext:Landroid/content/Context;

    .line 177
    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mNotifier:Lcom/sonymobile/scan3d/utils/notification/Notifier;

    .line 178
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->getId()I

    move-result p2

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mNotifier:Lcom/sonymobile/scan3d/utils/notification/Notifier;

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->getStartNotification(Landroid/content/Context;Lcom/sonymobile/scan3d/utils/notification/Notifier;ZZ)Landroid/app/Notification;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Landroid/app/Service;->startForeground(ILandroid/app/Notification;)V

    .line 179
    iget-object v4, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mContext:Landroid/content/Context;

    iget-object v5, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mAction:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    iget-object v6, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    iget-object v7, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mCredentials:Lcom/sonymobile/scan3d/storageservice/network/Credentials;

    iget-object v8, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mExtras:Landroid/os/Bundle;

    move-object v3, p0

    invoke-virtual/range {v3 .. v8}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->execute(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/network/Credentials;Landroid/os/Bundle;)Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask$ActionResult;

    move-result-object p2

    .line 180
    invoke-virtual {p1, v2}, Landroid/app/Service;->stopForeground(Z)V

    .line 181
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mAction:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->finish(Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask$ActionResult;)V

    return-void
.end method

.method public getCompletedText(Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;)I
    .locals 0
    .annotation build Landroidx/annotation/StringRes;
    .end annotation

    const p1, 0x7f10033b

    return p1
.end method

.method public getFailedText(Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;)I
    .locals 0
    .annotation build Landroidx/annotation/StringRes;
    .end annotation

    const p1, 0x7f10033d

    return p1
.end method

.method public getFailedTitle(Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;)I
    .locals 0
    .annotation build Landroidx/annotation/StringRes;
    .end annotation

    const p1, 0x7f100227

    return p1
.end method

.method final getId()I
    .locals 2

    .line 157
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mUploadRecordUri:Landroid/net/Uri;

    invoke-static {v0}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v0

    long-to-int v0, v0

    return v0
.end method

.method public getNoFurtherActionText(Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;)I
    .locals 0
    .annotation build Landroidx/annotation/StringRes;
    .end annotation

    const p1, 0x7f100340

    return p1
.end method

.method public getOngoingText(Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;)I
    .locals 0
    .annotation build Landroidx/annotation/StringRes;
    .end annotation

    const p1, 0x7f100348

    return p1
.end method

.method final getServiceProvider()Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;
    .locals 1

    .line 214
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mServiceProvider:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    return-object v0
.end method

.method final getStartNotification(Landroid/content/Context;Lcom/sonymobile/scan3d/utils/notification/Notifier;ZZ)Landroid/app/Notification;
    .locals 1

    const/4 v0, 0x1

    xor-int/2addr p4, v0

    .line 195
    invoke-virtual {p2, p1, p4}, Lcom/sonymobile/scan3d/utils/notification/Notifier;->newBuilder(Landroid/content/Context;I)Landroid/app/Notification$Builder;

    move-result-object p2

    const p4, 0x7f08010e

    .line 197
    invoke-virtual {p2, p4}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    const/4 p4, 0x0

    .line 198
    invoke-direct {p0, p1, p4}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->getNotificationTitle(Landroid/content/Context;Z)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    const/16 p1, 0x64

    .line 199
    invoke-virtual {p2, p1, p4, v0}, Landroid/app/Notification$Builder;->setProgress(IIZ)Landroid/app/Notification$Builder;

    .line 200
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->getGroupKey()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/app/Notification$Builder;->setGroup(Ljava/lang/String;)Landroid/app/Notification$Builder;

    if-eqz p3, :cond_0

    .line 202
    invoke-virtual {p2, v0}, Landroid/app/Notification$Builder;->setGroupSummary(Z)Landroid/app/Notification$Builder;

    .line 204
    :cond_0
    invoke-virtual {p2, v0}, Landroid/app/Notification$Builder;->setOngoing(Z)Landroid/app/Notification$Builder;

    .line 205
    invoke-virtual {p2}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object p1

    return-object p1
.end method

.method public onExecutionProgress(Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;Lcom/sonymobile/scan3d/storageservice/network/TransferProgress;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/sonymobile/scan3d/storageservice/network/TransferProgress;",
            ")V"
        }
    .end annotation

    .line 291
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/network/TransferProgress;->getBytesTransferred()J

    move-result-wide v0

    .line 292
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/network/TransferProgress;->getTotalBytes()J

    move-result-wide v2

    .line 293
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/network/TransferProgress;->getPercent()I

    move-result p1

    const/16 p2, 0x64

    if-ge p1, p2, :cond_1

    .line 296
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 301
    iget-wide v6, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mLastNotifyTime:J

    sub-long v6, v4, v6

    const-wide/16 v8, 0x96

    cmp-long p2, v6, v8

    const/4 v6, 0x1

    if-lez p2, :cond_0

    .line 302
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mNotifier:Lcom/sonymobile/scan3d/utils/notification/Notifier;

    iget-object v7, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mContext:Landroid/content/Context;

    invoke-virtual {p2, v7, v6}, Lcom/sonymobile/scan3d/utils/notification/Notifier;->newBuilder(Landroid/content/Context;I)Landroid/app/Notification$Builder;

    move-result-object p2

    const v7, 0x7f08010e

    .line 303
    invoke-virtual {p2, v7}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    .line 304
    iget-object v7, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mContext:Landroid/content/Context;

    const/4 v8, 0x0

    invoke-direct {p0, v7, v8}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->getNotificationTitle(Landroid/content/Context;Z)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p2, v7}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 305
    invoke-virtual {p2, v6}, Landroid/app/Notification$Builder;->setOngoing(Z)Landroid/app/Notification$Builder;

    .line 306
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->getGroupKey()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p2, v7}, Landroid/app/Notification$Builder;->setGroup(Ljava/lang/String;)Landroid/app/Notification$Builder;

    long-to-int v2, v2

    long-to-int v0, v0

    .line 307
    invoke-virtual {p2, v2, v0, v8}, Landroid/app/Notification$Builder;->setProgress(IIZ)Landroid/app/Notification$Builder;

    .line 308
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mContext:Landroid/content/Context;

    const v1, 0x7f10019e

    new-array v2, v6, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v2, v8

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 310
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mNotifier:Lcom/sonymobile/scan3d/utils/notification/Notifier;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->getId()I

    move-result v0

    invoke-virtual {p2}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object p2

    invoke-virtual {p1, v0, p2}, Lcom/sonymobile/scan3d/utils/notification/Notifier;->notify(ILandroid/app/Notification;)V

    .line 311
    iput-wide v4, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->mLastNotifyTime:J

    .line 314
    :cond_0
    invoke-direct {p0, v6}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->updateState(I)V

    goto :goto_0

    .line 317
    :cond_1
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->showProcessingNotification()V

    :goto_0
    return-void
.end method
