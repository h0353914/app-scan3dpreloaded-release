.class public Lcom/sonymobile/scan3d/utils/notification/NotificationUtil;
.super Ljava/lang/Object;
.source "NotificationUtil.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static newNotifier(Landroid/content/Context;Ljava/lang/String;)Lcom/sonymobile/scan3d/utils/notification/Notifier;
    .locals 1

    const-string v0, "notification"

    .line 70
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/NotificationManager;

    .line 71
    new-instance v0, Lcom/sonymobile/scan3d/utils/notification/Notifier;

    invoke-direct {v0, p0, p1}, Lcom/sonymobile/scan3d/utils/notification/Notifier;-><init>(Landroid/app/NotificationManager;Ljava/lang/String;)V

    return-object v0
.end method

.method public static setup(Landroid/content/Context;)V
    .locals 8

    const-string v0, "notification"

    .line 25
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    const-string v1, "upload_channel"

    .line 27
    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->getNotificationChannel(Ljava/lang/String;)Landroid/app/NotificationChannel;

    move-result-object v1

    const/4 v2, 0x4

    if-nez v1, :cond_0

    const v1, 0x7f100089

    .line 28
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    const v3, 0x7f100086

    .line 29
    invoke-virtual {p0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 31
    new-instance v4, Landroid/app/NotificationChannel;

    const-string v5, "upload_channel"

    invoke-direct {v4, v5, v1, v2}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    .line 33
    invoke-virtual {v4, v3}, Landroid/app/NotificationChannel;->setDescription(Ljava/lang/String;)V

    const/4 v1, 0x0

    .line 34
    invoke-virtual {v4, v1}, Landroid/app/NotificationChannel;->enableVibration(Z)V

    .line 35
    invoke-virtual {v0, v4}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    :cond_0
    const-string v1, "status_channel"

    .line 38
    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->getNotificationChannel(Ljava/lang/String;)Landroid/app/NotificationChannel;

    move-result-object v1

    const/4 v3, 0x1

    if-nez v1, :cond_1

    const v1, 0x7f100088

    .line 39
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    const v4, 0x7f100085

    .line 40
    invoke-virtual {p0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 42
    new-instance v5, Landroid/app/NotificationChannel;

    const-string v6, "status_channel"

    const/4 v7, 0x2

    invoke-direct {v5, v6, v1, v7}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    .line 44
    invoke-virtual {v5, v4}, Landroid/app/NotificationChannel;->setDescription(Ljava/lang/String;)V

    .line 45
    invoke-virtual {v5, v3}, Landroid/app/NotificationChannel;->enableVibration(Z)V

    .line 46
    invoke-virtual {v0, v5}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    :cond_1
    const-string v1, "error_channel"

    .line 49
    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->getNotificationChannel(Ljava/lang/String;)Landroid/app/NotificationChannel;

    move-result-object v1

    if-nez v1, :cond_2

    const v1, 0x7f100087

    .line 50
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    const v4, 0x7f100084

    .line 51
    invoke-virtual {p0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    .line 53
    new-instance v4, Landroid/app/NotificationChannel;

    const-string v5, "error_channel"

    invoke-direct {v4, v5, v1, v2}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    .line 55
    invoke-virtual {v4, p0}, Landroid/app/NotificationChannel;->setDescription(Ljava/lang/String;)V

    .line 56
    invoke-virtual {v4, v3}, Landroid/app/NotificationChannel;->enableVibration(Z)V

    .line 57
    invoke-virtual {v0, v4}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    :cond_2
    return-void
.end method
