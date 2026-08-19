.class public Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;
.super Ljava/lang/Object;
.source "DownloadNotification.java"

# interfaces
.implements Lcom/google/android/vending/expansion/downloader/IDownloaderClient;


# static fields
.field static final LOGTAG:Ljava/lang/String; = "DownloadNotification"

.field static final NOTIFICATION_ID:I


# instance fields
.field private mActiveDownloadBuilder:Landroidx/core/app/NotificationCompat$Builder;

.field private mBuilder:Landroidx/core/app/NotificationCompat$Builder;

.field private mClientProxy:Lcom/google/android/vending/expansion/downloader/IDownloaderClient;

.field private mContentIntent:Landroid/app/PendingIntent;

.field private final mContext:Landroid/content/Context;

.field private mCurrentBuilder:Landroidx/core/app/NotificationCompat$Builder;

.field private mCurrentText:Ljava/lang/String;

.field private mCurrentTitle:Ljava/lang/CharSequence;

.field private mLabel:Ljava/lang/CharSequence;

.field private final mNotificationManager:Landroid/app/NotificationManager;

.field private mProgressInfo:Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;

.field private mState:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "DownloadNotification"

    .line 62
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    sput v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->NOTIFICATION_ID:I

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Ljava/lang/CharSequence;)V
    .locals 2

    .line 204
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 205
    iput v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mState:I

    .line 206
    iput-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mContext:Landroid/content/Context;

    .line 207
    iput-object p2, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mLabel:Ljava/lang/CharSequence;

    .line 208
    iget-object p2, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mContext:Landroid/content/Context;

    const-string v1, "notification"

    .line 209
    invoke-virtual {p2, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/app/NotificationManager;

    iput-object p2, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mNotificationManager:Landroid/app/NotificationManager;

    .line 210
    new-instance p2, Landroidx/core/app/NotificationCompat$Builder;

    const-string v1, "status_channel"

    invoke-direct {p2, p1, v1}, Landroidx/core/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object p2, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mActiveDownloadBuilder:Landroidx/core/app/NotificationCompat$Builder;

    .line 211
    new-instance p2, Landroidx/core/app/NotificationCompat$Builder;

    const-string v1, "status_channel"

    invoke-direct {p2, p1, v1}, Landroidx/core/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object p2, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mBuilder:Landroidx/core/app/NotificationCompat$Builder;

    .line 215
    iget-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mActiveDownloadBuilder:Landroidx/core/app/NotificationCompat$Builder;

    invoke-virtual {p1, v0}, Landroidx/core/app/NotificationCompat$Builder;->setPriority(I)Landroidx/core/app/NotificationCompat$Builder;

    .line 216
    iget-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mActiveDownloadBuilder:Landroidx/core/app/NotificationCompat$Builder;

    const-string p2, "progress"

    invoke-virtual {p1, p2}, Landroidx/core/app/NotificationCompat$Builder;->setCategory(Ljava/lang/String;)Landroidx/core/app/NotificationCompat$Builder;

    .line 218
    iget-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mBuilder:Landroidx/core/app/NotificationCompat$Builder;

    invoke-virtual {p1, v0}, Landroidx/core/app/NotificationCompat$Builder;->setPriority(I)Landroidx/core/app/NotificationCompat$Builder;

    .line 219
    iget-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mBuilder:Landroidx/core/app/NotificationCompat$Builder;

    const-string p2, "progress"

    invoke-virtual {p1, p2}, Landroidx/core/app/NotificationCompat$Builder;->setCategory(Ljava/lang/String;)Landroidx/core/app/NotificationCompat$Builder;

    .line 221
    iget-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mBuilder:Landroidx/core/app/NotificationCompat$Builder;

    iput-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCurrentBuilder:Landroidx/core/app/NotificationCompat$Builder;

    return-void
.end method


# virtual methods
.method public getClientIntent()Landroid/app/PendingIntent;
    .locals 1

    .line 65
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mContentIntent:Landroid/app/PendingIntent;

    return-object v0
.end method

.method public onDownloadProgress(Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;)V
    .locals 7

    .line 158
    iput-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mProgressInfo:Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;

    .line 159
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mClientProxy:Lcom/google/android/vending/expansion/downloader/IDownloaderClient;

    if-eqz v0, :cond_0

    .line 160
    invoke-interface {v0, p1}, Lcom/google/android/vending/expansion/downloader/IDownloaderClient;->onDownloadProgress(Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;)V

    .line 162
    :cond_0
    iget-wide v0, p1, Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;->mOverallTotal:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    const v1, 0x1080081

    if-gtz v0, :cond_1

    .line 164
    iget-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mBuilder:Landroidx/core/app/NotificationCompat$Builder;

    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCurrentTitle:Ljava/lang/CharSequence;

    invoke-virtual {p1, v0}, Landroidx/core/app/NotificationCompat$Builder;->setTicker(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    .line 165
    iget-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mBuilder:Landroidx/core/app/NotificationCompat$Builder;

    invoke-virtual {p1, v1}, Landroidx/core/app/NotificationCompat$Builder;->setSmallIcon(I)Landroidx/core/app/NotificationCompat$Builder;

    .line 166
    iget-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mBuilder:Landroidx/core/app/NotificationCompat$Builder;

    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCurrentTitle:Ljava/lang/CharSequence;

    invoke-virtual {p1, v0}, Landroidx/core/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    .line 167
    iget-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mBuilder:Landroidx/core/app/NotificationCompat$Builder;

    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCurrentText:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroidx/core/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    .line 168
    iget-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mBuilder:Landroidx/core/app/NotificationCompat$Builder;

    iput-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCurrentBuilder:Landroidx/core/app/NotificationCompat$Builder;

    goto :goto_0

    .line 170
    :cond_1
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mActiveDownloadBuilder:Landroidx/core/app/NotificationCompat$Builder;

    iget-wide v2, p1, Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;->mOverallTotal:J

    long-to-int v2, v2

    iget-wide v3, p1, Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;->mOverallProgress:J

    long-to-int v3, v3

    const/4 v4, 0x0

    invoke-virtual {v0, v2, v3, v4}, Landroidx/core/app/NotificationCompat$Builder;->setProgress(IIZ)Landroidx/core/app/NotificationCompat$Builder;

    .line 171
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mActiveDownloadBuilder:Landroidx/core/app/NotificationCompat$Builder;

    iget-wide v2, p1, Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;->mOverallProgress:J

    iget-wide v5, p1, Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;->mOverallTotal:J

    invoke-static {v2, v3, v5, v6}, Lcom/google/android/vending/expansion/downloader/Helpers;->getDownloadProgressString(JJ)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroidx/core/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    .line 172
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mActiveDownloadBuilder:Landroidx/core/app/NotificationCompat$Builder;

    invoke-virtual {v0, v1}, Landroidx/core/app/NotificationCompat$Builder;->setSmallIcon(I)Landroidx/core/app/NotificationCompat$Builder;

    .line 173
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mActiveDownloadBuilder:Landroidx/core/app/NotificationCompat$Builder;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mLabel:Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCurrentText:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/core/app/NotificationCompat$Builder;->setTicker(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    .line 174
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mActiveDownloadBuilder:Landroidx/core/app/NotificationCompat$Builder;

    iget-object v1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mLabel:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroidx/core/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    .line 175
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mActiveDownloadBuilder:Landroidx/core/app/NotificationCompat$Builder;

    iget-object v1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mContext:Landroid/content/Context;

    sget v2, Lcom/android/vending/expansion/downloader/R$string;->time_remaining_notification:I

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    iget-wide v5, p1, Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;->mTimeRemaining:J

    .line 176
    invoke-static {v5, v6}, Lcom/google/android/vending/expansion/downloader/Helpers;->getTimeRemaining(J)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v3, v4

    .line 175
    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroidx/core/app/NotificationCompat$Builder;->setContentInfo(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    .line 177
    iget-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mActiveDownloadBuilder:Landroidx/core/app/NotificationCompat$Builder;

    iput-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCurrentBuilder:Landroidx/core/app/NotificationCompat$Builder;

    .line 179
    :goto_0
    iget-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mNotificationManager:Landroid/app/NotificationManager;

    sget v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->NOTIFICATION_ID:I

    iget-object v1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCurrentBuilder:Landroidx/core/app/NotificationCompat$Builder;

    invoke-virtual {v1}, Landroidx/core/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    return-void
.end method

.method public onDownloadStateChanged(I)V
    .locals 6

    .line 82
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mClientProxy:Lcom/google/android/vending/expansion/downloader/IDownloaderClient;

    if-eqz v0, :cond_0

    .line 83
    invoke-interface {v0, p1}, Lcom/google/android/vending/expansion/downloader/IDownloaderClient;->onDownloadStateChanged(I)V

    .line 85
    :cond_0
    iget v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mState:I

    if-eq p1, v0, :cond_6

    .line 86
    iput p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mState:I

    const/4 v0, 0x1

    if-eq p1, v0, :cond_5

    .line 87
    iget-object v1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mContentIntent:Landroid/app/PendingIntent;

    if-nez v1, :cond_1

    goto/16 :goto_3

    :cond_1
    const v1, 0x1080082

    const v2, 0x108008a

    const/4 v3, 0x0

    if-eqz p1, :cond_3

    const/4 v4, 0x7

    if-eq p1, v4, :cond_2

    packed-switch p1, :pswitch_data_0

    packed-switch p1, :pswitch_data_1

    .line 135
    invoke-static {p1}, Lcom/google/android/vending/expansion/downloader/Helpers;->getDownloaderStringResourceIDFromState(I)I

    move-result p1

    move v1, v2

    move v2, v0

    goto :goto_1

    .line 129
    :pswitch_0
    invoke-static {p1}, Lcom/google/android/vending/expansion/downloader/Helpers;->getDownloaderStringResourceIDFromState(I)I

    move-result p1

    move v1, v2

    move v2, v3

    goto :goto_1

    .line 116
    :pswitch_1
    iget-object v2, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mNotificationManager:Landroid/app/NotificationManager;

    sget v4, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->NOTIFICATION_ID:I

    invoke-virtual {v2, v4}, Landroid/app/NotificationManager;->cancel(I)V

    goto :goto_0

    :pswitch_2
    const v1, 0x1080081

    .line 104
    invoke-static {p1}, Lcom/google/android/vending/expansion/downloader/Helpers;->getDownloaderStringResourceIDFromState(I)I

    move-result p1

    move v2, v0

    goto :goto_1

    .line 111
    :pswitch_3
    invoke-static {p1}, Lcom/google/android/vending/expansion/downloader/Helpers;->getDownloaderStringResourceIDFromState(I)I

    move-result p1

    move v2, v0

    goto :goto_1

    .line 119
    :cond_2
    :goto_0
    invoke-static {p1}, Lcom/google/android/vending/expansion/downloader/Helpers;->getDownloaderStringResourceIDFromState(I)I

    move-result p1

    move v2, v3

    goto :goto_1

    .line 98
    :cond_3
    sget p1, Lcom/android/vending/expansion/downloader/R$string;->state_unknown:I

    move v1, v2

    move v2, v3

    .line 140
    :goto_1
    iget-object v4, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mContext:Landroid/content/Context;

    invoke-virtual {v4, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCurrentText:Ljava/lang/String;

    .line 141
    iget-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mLabel:Ljava/lang/CharSequence;

    iput-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCurrentTitle:Ljava/lang/CharSequence;

    .line 142
    iget-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCurrentBuilder:Landroidx/core/app/NotificationCompat$Builder;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mLabel:Ljava/lang/CharSequence;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCurrentText:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Landroidx/core/app/NotificationCompat$Builder;->setTicker(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    .line 143
    iget-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCurrentBuilder:Landroidx/core/app/NotificationCompat$Builder;

    invoke-virtual {p1, v1}, Landroidx/core/app/NotificationCompat$Builder;->setSmallIcon(I)Landroidx/core/app/NotificationCompat$Builder;

    .line 144
    iget-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCurrentBuilder:Landroidx/core/app/NotificationCompat$Builder;

    iget-object v1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCurrentTitle:Ljava/lang/CharSequence;

    invoke-virtual {p1, v1}, Landroidx/core/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    .line 145
    iget-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCurrentBuilder:Landroidx/core/app/NotificationCompat$Builder;

    iget-object v1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCurrentText:Ljava/lang/String;

    invoke-virtual {p1, v1}, Landroidx/core/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    if-eqz v2, :cond_4

    .line 147
    iget-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCurrentBuilder:Landroidx/core/app/NotificationCompat$Builder;

    invoke-virtual {p1, v0}, Landroidx/core/app/NotificationCompat$Builder;->setOngoing(Z)Landroidx/core/app/NotificationCompat$Builder;

    goto :goto_2

    .line 149
    :cond_4
    iget-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCurrentBuilder:Landroidx/core/app/NotificationCompat$Builder;

    invoke-virtual {p1, v3}, Landroidx/core/app/NotificationCompat$Builder;->setOngoing(Z)Landroidx/core/app/NotificationCompat$Builder;

    .line 150
    iget-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCurrentBuilder:Landroidx/core/app/NotificationCompat$Builder;

    invoke-virtual {p1, v0}, Landroidx/core/app/NotificationCompat$Builder;->setAutoCancel(Z)Landroidx/core/app/NotificationCompat$Builder;

    .line 152
    :goto_2
    iget-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mNotificationManager:Landroid/app/NotificationManager;

    sget v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->NOTIFICATION_ID:I

    iget-object v1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCurrentBuilder:Landroidx/core/app/NotificationCompat$Builder;

    invoke-virtual {v1}, Landroidx/core/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    goto :goto_4

    :cond_5
    :goto_3
    return-void

    :cond_6
    :goto_4
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0xf
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public onServiceConnected(Landroid/os/Messenger;)V
    .locals 0

    return-void
.end method

.method public resendState()V
    .locals 2

    .line 75
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mClientProxy:Lcom/google/android/vending/expansion/downloader/IDownloaderClient;

    if-eqz v0, :cond_0

    .line 76
    iget v1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mState:I

    invoke-interface {v0, v1}, Lcom/google/android/vending/expansion/downloader/IDownloaderClient;->onDownloadStateChanged(I)V

    :cond_0
    return-void
.end method

.method public setClientIntent(Landroid/app/PendingIntent;)V
    .locals 1

    .line 69
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mBuilder:Landroidx/core/app/NotificationCompat$Builder;

    invoke-virtual {v0, p1}, Landroidx/core/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroidx/core/app/NotificationCompat$Builder;

    .line 70
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mActiveDownloadBuilder:Landroidx/core/app/NotificationCompat$Builder;

    invoke-virtual {v0, p1}, Landroidx/core/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroidx/core/app/NotificationCompat$Builder;

    .line 71
    iput-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mContentIntent:Landroid/app/PendingIntent;

    return-void
.end method

.method public setMessenger(Landroid/os/Messenger;)V
    .locals 1

    .line 189
    invoke-static {p1}, Lcom/google/android/vending/expansion/downloader/DownloaderClientMarshaller;->CreateProxy(Landroid/os/Messenger;)Lcom/google/android/vending/expansion/downloader/IDownloaderClient;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mClientProxy:Lcom/google/android/vending/expansion/downloader/IDownloaderClient;

    .line 190
    iget-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mProgressInfo:Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;

    if-eqz p1, :cond_0

    .line 191
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mClientProxy:Lcom/google/android/vending/expansion/downloader/IDownloaderClient;

    invoke-interface {v0, p1}, Lcom/google/android/vending/expansion/downloader/IDownloaderClient;->onDownloadProgress(Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;)V

    .line 193
    :cond_0
    iget p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mState:I

    const/4 v0, -0x1

    if-eq p1, v0, :cond_1

    .line 194
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mClientProxy:Lcom/google/android/vending/expansion/downloader/IDownloaderClient;

    invoke-interface {v0, p1}, Lcom/google/android/vending/expansion/downloader/IDownloaderClient;->onDownloadStateChanged(I)V

    :cond_1
    return-void
.end method
