.class public Lcom/sonymobile/scan3d/storageservice/network/firebase/MessagingService;
.super Lcom/google/firebase/messaging/FirebaseMessagingService;
.source "MessagingService.java"


# static fields
.field private static final DELETE_ACCOUNT_NOTIFICATION_ID:I = -0x2

.field private static final EXTRACT_DATA_NOTIFICATION_ID:I = -0x1

.field private static final TAG:Ljava/lang/String; = "com.sonymobile.scan3d.storageservice.network.firebase.MessagingService"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 36
    invoke-direct {p0}, Lcom/google/firebase/messaging/FirebaseMessagingService;-><init>()V

    return-void
.end method

.method private handleDeleteAccount(Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;)V
    .locals 1

    .line 208
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;->getState()I

    move-result p1

    packed-switch p1, :pswitch_data_0

    .line 224
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/network/firebase/MessagingService;->handleFailedDelete()V

    goto :goto_0

    .line 217
    :pswitch_0
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/content/Jobs;->requestDeleteAccountJob(Landroid/content/Context;)Z

    goto :goto_0

    :pswitch_1
    const-string p1, "gdpr"

    .line 213
    invoke-static {p0, p1}, Lcom/sonymobile/scan3d/utils/notification/NotificationUtil;->newNotifier(Landroid/content/Context;Ljava/lang/String;)Lcom/sonymobile/scan3d/utils/notification/Notifier;

    move-result-object p1

    const/4 v0, -0x2

    .line 214
    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/utils/notification/Notifier;->cancel(I)V

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private handleExtractData(Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;)V
    .locals 1

    .line 168
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;->getState()I

    move-result p1

    packed-switch p1, :pswitch_data_0

    .line 184
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/network/firebase/MessagingService;->handleFailedExtract()V

    goto :goto_0

    :pswitch_0
    const/4 p1, 0x0

    .line 177
    invoke-static {p0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->setExtractDataOngoing(Landroid/content/Context;Z)V

    goto :goto_0

    :pswitch_1
    const-string p1, "gdpr"

    .line 173
    invoke-static {p0, p1}, Lcom/sonymobile/scan3d/utils/notification/NotificationUtil;->newNotifier(Landroid/content/Context;Ljava/lang/String;)Lcom/sonymobile/scan3d/utils/notification/Notifier;

    move-result-object p1

    const/4 v0, -0x1

    .line 174
    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/utils/notification/Notifier;->cancel(I)V

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private handleFailedDelete()V
    .locals 2

    const/4 v0, 0x0

    .line 233
    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->setDeleteOngoing(Landroid/content/Context;Z)V

    const v0, 0x7f100186

    const/4 v1, -0x2

    .line 234
    invoke-direct {p0, v0, v1}, Lcom/sonymobile/scan3d/storageservice/network/firebase/MessagingService;->showGdprNotification(II)V

    return-void
.end method

.method private handleFailedExtract()V
    .locals 2

    const/4 v0, 0x0

    .line 193
    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->setExtractDataOngoing(Landroid/content/Context;Z)V

    const v0, 0x7f100187

    const/4 v1, -0x1

    .line 194
    invoke-direct {p0, v0, v1}, Lcom/sonymobile/scan3d/storageservice/network/firebase/MessagingService;->showGdprNotification(II)V

    return-void
.end method

.method private handleFailedImprovement(Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;)V
    .locals 7

    .line 309
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;->getMessageId()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->getImprovement(Landroid/content/Context;Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/provider/Improvement;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 311
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->getParentUri()Landroid/net/Uri;

    move-result-object v1

    .line 312
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/network/firebase/MessagingService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    .line 313
    invoke-static {p0, v1}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->create(Landroid/content/Context;Landroid/net/Uri;)Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v3

    const/4 v4, 0x0

    if-eqz v3, :cond_1

    .line 316
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;->getState()I

    move-result p1

    const/4 v5, 0x3

    const/4 v6, 0x1

    if-eq p1, v5, :cond_0

    const/4 v5, 0x5

    if-eq p1, v5, :cond_0

    .line 334
    new-instance p1, Landroid/content/ContentValues;

    invoke-direct {p1, v6}, Landroid/content/ContentValues;-><init>(I)V

    const-string v1, "fail_state"

    .line 336
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 335
    invoke-virtual {p1, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 337
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->getUri()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v2, v0, p1, v4, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_0

    .line 320
    :cond_0
    invoke-interface {v3}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getTransferFlags()I

    move-result p1

    and-int/lit8 p1, p1, -0x9

    .line 321
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3, v6}, Landroid/content/ContentValues;-><init>(I)V

    const-string v5, "transfer_flags"

    .line 322
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v3, v5, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 323
    invoke-virtual {v2, v1, v3, v4, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 325
    new-instance p1, Landroid/content/ContentValues;

    invoke-direct {p1, v6}, Landroid/content/ContentValues;-><init>(I)V

    const-string v1, "fail_state"

    const/4 v3, 0x2

    .line 327
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 326
    invoke-virtual {p1, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 328
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->getUri()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v2, v0, p1, v4, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_0

    .line 343
    :cond_1
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->getUri()Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {v2, p1, v4, v4}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    :cond_2
    :goto_0
    return-void
.end method

.method private handleFailedKeyInit(Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;)V
    .locals 5

    .line 138
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;->getProtocolVersion()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    .line 153
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/network/firebase/MessagingService;->handleFailedImprovement(Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;)V

    goto :goto_2

    .line 140
    :cond_0
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;->getReceivingRequest()Ljava/lang/String;

    move-result-object v0

    const/4 v2, -0x1

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v3

    const v4, -0xb2b1a08

    if-eq v3, v4, :cond_2

    const v4, 0x5b070c68

    if-eq v3, v4, :cond_1

    goto :goto_0

    :cond_1
    const-string v3, "execution_request"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    goto :goto_1

    :cond_2
    const-string v1, "extract_data_request"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v1, 0x0

    goto :goto_1

    :cond_3
    :goto_0
    move v1, v2

    :goto_1
    packed-switch v1, :pswitch_data_0

    goto :goto_2

    .line 145
    :pswitch_0
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/network/firebase/MessagingService;->handleFailedImprovement(Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;)V

    goto :goto_2

    .line 142
    :pswitch_1
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/network/firebase/MessagingService;->handleFailedExtract()V

    :goto_2
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private handleImprovement(Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;)V
    .locals 4

    .line 267
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;->getState()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 298
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/network/firebase/MessagingService;->handleFailedImprovement(Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;)V

    goto :goto_1

    .line 274
    :pswitch_0
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;->getRequestType()Ljava/lang/String;

    move-result-object v0

    const/4 v1, -0x1

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v2

    const v3, 0x5b070c68

    if-eq v2, v3, :cond_0

    goto :goto_0

    :cond_0
    const-string v2, "execution_request"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v1, 0x0

    :cond_1
    :goto_0
    if-eqz v1, :cond_2

    goto :goto_1

    .line 277
    :cond_2
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;->getMessageId()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->getImprovement(Landroid/content/Context;Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/provider/Improvement;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 281
    new-instance v1, Landroid/content/ContentValues;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Landroid/content/ContentValues;-><init>(I)V

    const-string v2, "s3_key"

    .line 282
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;->getS3Key()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, v2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 283
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/network/firebase/MessagingService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->getUri()Landroid/net/Uri;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v1, v2, v2}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 286
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/content/Jobs;->requestReceiveImprovementJob(Landroid/content/Context;)Z

    :cond_3
    :goto_1
    :pswitch_1
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private handleKeyInit(Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;)V
    .locals 1

    .line 91
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;->getState()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 100
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/network/firebase/MessagingService;->handleFailedKeyInit(Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;)V

    goto :goto_0

    .line 96
    :pswitch_0
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/network/firebase/MessagingService;->handleSuccessfulKeyInit(Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;)V

    :goto_0
    :pswitch_1
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private handleSuccessfulKeyInit(Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;)V
    .locals 5

    .line 112
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;->getProtocolVersion()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    .line 127
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/network/firebase/MessagingService;->startImprovement(Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;)V

    goto :goto_2

    .line 114
    :cond_0
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;->getReceivingRequest()Ljava/lang/String;

    move-result-object v0

    const/4 v2, -0x1

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v3

    const v4, -0xb2b1a08

    if-eq v3, v4, :cond_2

    const v4, 0x5b070c68

    if-eq v3, v4, :cond_1

    goto :goto_0

    :cond_1
    const-string v3, "execution_request"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    goto :goto_1

    :cond_2
    const-string v1, "extract_data_request"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v1, 0x0

    goto :goto_1

    :cond_3
    :goto_0
    move v1, v2

    :goto_1
    packed-switch v1, :pswitch_data_0

    goto :goto_2

    .line 119
    :pswitch_0
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/network/firebase/MessagingService;->startImprovement(Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;)V

    goto :goto_2

    .line 116
    :pswitch_1
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;->getAesKey()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;->getSession()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, v0, p1}, Lcom/sonymobile/scan3d/storageservice/content/Jobs;->requestExtractDataJob(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    :goto_2
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private showGdprNotification(II)V
    .locals 4

    const-string v0, "gdpr"

    .line 355
    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/utils/notification/NotificationUtil;->newNotifier(Landroid/content/Context;Ljava/lang/String;)Lcom/sonymobile/scan3d/utils/notification/Notifier;

    move-result-object v0

    const/4 v1, 0x1

    .line 356
    invoke-virtual {v0, p0, v1}, Lcom/sonymobile/scan3d/utils/notification/Notifier;->newBuilder(Landroid/content/Context;I)Landroid/app/Notification$Builder;

    move-result-object v2

    .line 357
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/network/firebase/MessagingService;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    const p1, 0x7f100188

    .line 358
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/network/firebase/MessagingService;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    const p1, 0x7f08010e

    .line 359
    invoke-virtual {v2, p1}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    .line 360
    invoke-virtual {v2, v1}, Landroid/app/Notification$Builder;->setAutoCancel(Z)Landroid/app/Notification$Builder;

    .line 362
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->getBackupSyncIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object p1

    const/4 v1, 0x0

    const/high16 v3, 0x10000000

    .line 363
    invoke-static {p0, v1, p1, v3}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p1

    .line 365
    invoke-virtual {v2, p1}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    .line 366
    invoke-virtual {v2}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object p1

    invoke-virtual {v0, p2, p1}, Lcom/sonymobile/scan3d/utils/notification/Notifier;->notify(ILandroid/app/Notification;)V

    return-void
.end method

.method private startImprovement(Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;)V
    .locals 3

    .line 248
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;->getMessageId()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->getImprovement(Landroid/content/Context;Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/provider/Improvement;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 251
    new-instance v1, Lcom/sonymobile/scan3d/storageservice/content/Jobs$RequestBuilder;

    const-string v2, "refinement"

    invoke-direct {v1, v2}, Lcom/sonymobile/scan3d/storageservice/content/Jobs$RequestBuilder;-><init>(Ljava/lang/String;)V

    .line 252
    invoke-virtual {v1, v0}, Lcom/sonymobile/scan3d/storageservice/content/Jobs$RequestBuilder;->withImprovement(Lcom/sonymobile/scan3d/storageservice/provider/Improvement;)Lcom/sonymobile/scan3d/storageservice/content/Jobs$RequestBuilder;

    move-result-object v0

    .line 253
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;->getProtocolVersion()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/content/Jobs$RequestBuilder;->withProtocolVersion(I)Lcom/sonymobile/scan3d/storageservice/content/Jobs$RequestBuilder;

    move-result-object v0

    .line 254
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;->getAesKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/content/Jobs$RequestBuilder;->withServerKey(Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/content/Jobs$RequestBuilder;

    move-result-object v0

    .line 255
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;->getSession()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/storageservice/content/Jobs$RequestBuilder;->withSessionId(Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/content/Jobs$RequestBuilder;

    move-result-object p1

    .line 257
    invoke-static {p0, p1}, Lcom/sonymobile/scan3d/storageservice/content/Jobs;->requestExecuteImprovementJob(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/content/Jobs$RequestBuilder;)Z

    :cond_0
    return-void
.end method


# virtual methods
.method public onMessageReceived(Lcom/google/firebase/messaging/RemoteMessage;)V
    .locals 3

    .line 55
    invoke-super {p0, p1}, Lcom/google/firebase/messaging/FirebaseMessagingService;->onMessageReceived(Lcom/google/firebase/messaging/RemoteMessage;)V

    .line 56
    invoke-virtual {p1}, Lcom/google/firebase/messaging/RemoteMessage;->getData()Ljava/util/Map;

    move-result-object p1

    .line 57
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;->from(Ljava/util/Map;)Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;

    move-result-object p1

    .line 59
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/network/firebase/MessagingService;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "handleMessage(): type="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;->getRequestType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", state="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;->getState()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", receiving_request="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;->getReceivingRequest()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", version="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;->getProtocolVersion()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 59
    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;->getRequestType()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v1

    const v2, -0xc1b3417

    if-eq v1, v2, :cond_3

    const v2, -0xb2b1a08

    if-eq v1, v2, :cond_2

    const v2, 0x5121ee60

    if-eq v1, v2, :cond_1

    const v2, 0x5b070c68

    if-eq v1, v2, :cond_0

    goto :goto_0

    :cond_0
    const-string v1, "execution_request"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const/4 v0, 0x3

    goto :goto_1

    :cond_1
    const-string v1, "init_request"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const/4 v0, 0x0

    goto :goto_1

    :cond_2
    const-string v1, "extract_data_request"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const/4 v0, 0x2

    goto :goto_1

    :cond_3
    const-string v1, "delete_account_request"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const/4 v0, 0x1

    goto :goto_1

    :cond_4
    :goto_0
    const/4 v0, -0x1

    :goto_1
    packed-switch v0, :pswitch_data_0

    .line 76
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/network/firebase/MessagingService;->handleImprovement(Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;)V

    goto :goto_2

    .line 72
    :pswitch_0
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/network/firebase/MessagingService;->handleExtractData(Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;)V

    goto :goto_2

    .line 69
    :pswitch_1
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/network/firebase/MessagingService;->handleDeleteAccount(Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;)V

    goto :goto_2

    .line 66
    :pswitch_2
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/network/firebase/MessagingService;->handleKeyInit(Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;)V

    :goto_2
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
