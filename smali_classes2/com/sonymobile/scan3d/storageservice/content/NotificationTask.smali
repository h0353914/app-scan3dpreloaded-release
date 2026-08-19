.class Lcom/sonymobile/scan3d/storageservice/content/NotificationTask;
.super Lcom/sonymobile/scan3d/storageservice/content/Task;
.source "NotificationTask.java"


# static fields
.field private static final NOTIFICATION_ID:I = -0x2


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/storageservice/content/TaskService;Landroid/app/job/JobParameters;)V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 43
    invoke-direct {p0, p1, p2, v0, v1}, Lcom/sonymobile/scan3d/storageservice/content/Task;-><init>(Lcom/sonymobile/scan3d/storageservice/content/TaskService;Landroid/app/job/JobParameters;ZZ)V

    return-void
.end method

.method private getViewIntent(Landroid/content/Context;Landroid/net/Uri;)Landroid/app/PendingIntent;
    .locals 2

    .line 114
    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->getViewerModeIntent(Landroid/content/Context;Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object p2

    const/4 v0, 0x0

    const/high16 v1, 0x10000000

    .line 115
    invoke-static {p1, v0, p2, v1}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method doWork(Landroid/content/Context;Landroid/app/job/JobParameters;)V
    .locals 10

    const-string p2, "post_process"

    .line 48
    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/utils/notification/NotificationUtil;->newNotifier(Landroid/content/Context;Ljava/lang/String;)Lcom/sonymobile/scan3d/utils/notification/Notifier;

    move-result-object p2

    .line 50
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->getImprovements(Landroid/content/Context;)Ljava/util/ArrayList;

    move-result-object v0

    .line 55
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    move v2, v1

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const v4, 0x7f08010e

    const/4 v5, 0x1

    if-eqz v3, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;

    .line 56
    invoke-virtual {v3}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->isFailed()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 57
    invoke-virtual {v3}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->getParentUri()Landroid/net/Uri;

    move-result-object v6

    .line 58
    invoke-static {p1, v6}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->create(Landroid/content/Context;Landroid/net/Uri;)Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v7

    .line 60
    invoke-virtual {p2, p1, v5}, Lcom/sonymobile/scan3d/utils/notification/Notifier;->newBuilder(Landroid/content/Context;I)Landroid/app/Notification$Builder;

    move-result-object v8

    const v9, 0x7f10018b

    .line 62
    invoke-virtual {p1, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 61
    invoke-virtual {v8, v9}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 63
    invoke-virtual {v8, v4}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    if-eqz v7, :cond_1

    .line 66
    invoke-virtual {v8, v5}, Landroid/app/Notification$Builder;->setAutoCancel(Z)Landroid/app/Notification$Builder;

    .line 67
    invoke-direct {p0, p1, v6}, Lcom/sonymobile/scan3d/storageservice/content/NotificationTask;->getViewIntent(Landroid/content/Context;Landroid/net/Uri;)Landroid/app/PendingIntent;

    move-result-object v4

    invoke-virtual {v8, v4}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    const v4, 0x7f10018c

    .line 68
    invoke-virtual {p1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v8, v4}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 71
    :cond_1
    invoke-virtual {v3}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->getId()J

    move-result-wide v3

    long-to-int v3, v3

    invoke-virtual {v8}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v4

    invoke-virtual {p2, v3, v4}, Lcom/sonymobile/scan3d/utils/notification/Notifier;->notify(ILandroid/app/Notification;)V

    goto :goto_0

    .line 72
    :cond_2
    invoke-virtual {v3}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->isImproved()Z

    move-result v3

    if-eqz v3, :cond_0

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_3
    const/4 v0, -0x2

    if-lez v2, :cond_4

    .line 79
    invoke-static {p1}, Lcom/sonymobile/scan3d/viewer/ProxyReceiver;->getImprovementIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v2

    const/high16 v3, 0x8000000

    .line 80
    invoke-static {p1, v1, v2, v3}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    .line 83
    invoke-virtual {p2, p1, v5}, Lcom/sonymobile/scan3d/utils/notification/Notifier;->newBuilder(Landroid/content/Context;I)Landroid/app/Notification$Builder;

    move-result-object v3

    .line 84
    invoke-virtual {v3, v2}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    .line 85
    invoke-virtual {v3, v4}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    const v2, 0x7f10018a

    .line 87
    invoke-virtual {p1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 86
    invoke-virtual {v3, v2}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    const v2, 0x7f100189

    .line 89
    invoke-virtual {p1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    .line 88
    invoke-virtual {v3, p1}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 91
    invoke-virtual {v3, v5}, Landroid/app/Notification$Builder;->setOngoing(Z)Landroid/app/Notification$Builder;

    .line 93
    invoke-virtual {v3, v1}, Landroid/app/Notification$Builder;->setAutoCancel(Z)Landroid/app/Notification$Builder;

    .line 94
    invoke-virtual {v3}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object p1

    invoke-virtual {p2, v0, p1}, Lcom/sonymobile/scan3d/utils/notification/Notifier;->notify(ILandroid/app/Notification;)V

    goto :goto_1

    .line 96
    :cond_4
    invoke-virtual {p2, v0}, Lcom/sonymobile/scan3d/utils/notification/Notifier;->cancel(I)V

    .line 98
    :goto_1
    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/storageservice/content/NotificationTask;->setReschedule(Z)V

    return-void
.end method

.method onFinished(Landroid/content/Context;)V
    .locals 0

    .line 103
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/content/Jobs;->scheduleNotificationUpdate(Landroid/content/Context;)Z

    return-void
.end method
