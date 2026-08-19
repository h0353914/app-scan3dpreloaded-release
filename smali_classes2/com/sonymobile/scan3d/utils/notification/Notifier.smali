.class public Lcom/sonymobile/scan3d/utils/notification/Notifier;
.super Ljava/lang/Object;
.source "Notifier.java"


# static fields
.field static final CHANNEL_ID_ERROR:Ljava/lang/String; = "error_channel"

.field static final CHANNEL_ID_STATUS:Ljava/lang/String; = "status_channel"

.field static final CHANNEL_ID_UPLOAD:Ljava/lang/String; = "upload_channel"

.field public static final SEVERITY_ERROR:I = -0x1

.field public static final SEVERITY_STATUS:I = 0x1

.field public static final SEVERITY_UPLOAD:I = 0x0

.field public static final TYPE_GPDR:Ljava/lang/String; = "gdpr"

.field public static final TYPE_POST_PROCESS:Ljava/lang/String; = "post_process"

.field public static final TYPE_UPLOAD:Ljava/lang/String; = "upload"

.field public static final TYPE_WALLPAPER:Ljava/lang/String; = "wall_paper"


# instance fields
.field private mManager:Landroid/app/NotificationManager;

.field private mTag:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/app/NotificationManager;Ljava/lang/String;)V
    .locals 0

    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 86
    iput-object p1, p0, Lcom/sonymobile/scan3d/utils/notification/Notifier;->mManager:Landroid/app/NotificationManager;

    .line 87
    iput-object p2, p0, Lcom/sonymobile/scan3d/utils/notification/Notifier;->mTag:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public cancel(I)V
    .locals 2

    .line 130
    iget-object v0, p0, Lcom/sonymobile/scan3d/utils/notification/Notifier;->mManager:Landroid/app/NotificationManager;

    iget-object v1, p0, Lcom/sonymobile/scan3d/utils/notification/Notifier;->mTag:Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, Landroid/app/NotificationManager;->cancel(Ljava/lang/String;I)V

    return-void
.end method

.method public newBuilder(Landroid/content/Context;I)Landroid/app/Notification$Builder;
    .locals 1

    packed-switch p2, :pswitch_data_0

    const-string p2, "error_channel"

    goto :goto_0

    :pswitch_0
    const-string p2, "status_channel"

    goto :goto_0

    :pswitch_1
    const-string p2, "upload_channel"

    .line 109
    :goto_0
    new-instance v0, Landroid/app/Notification$Builder;

    invoke-direct {v0, p1, p2}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    const p2, 0x7f060097

    .line 110
    invoke-virtual {p1, p2}, Landroid/content/Context;->getColor(I)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/app/Notification$Builder;->setColor(I)Landroid/app/Notification$Builder;

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public notify(ILandroid/app/Notification;)V
    .locals 2

    .line 121
    iget-object v0, p0, Lcom/sonymobile/scan3d/utils/notification/Notifier;->mManager:Landroid/app/NotificationManager;

    iget-object v1, p0, Lcom/sonymobile/scan3d/utils/notification/Notifier;->mTag:Ljava/lang/String;

    invoke-virtual {v0, v1, p1, p2}, Landroid/app/NotificationManager;->notify(Ljava/lang/String;ILandroid/app/Notification;)V

    return-void
.end method
