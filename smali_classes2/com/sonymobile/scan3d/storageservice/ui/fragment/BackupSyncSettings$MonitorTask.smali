.class Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings$MonitorTask;
.super Landroid/os/AsyncTask;
.source "BackupSyncSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MonitorTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings$MonitorStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final PROJECTION:[Ljava/lang/String;

.field private static final SELECTION:Ljava/lang/String; = "sync_state!=? AND sync_state!=? AND sync_state!=? AND sync_state!=?"

.field private static final SELECTION_ARGS:[Ljava/lang/String;


# instance fields
.field private final mHandler:Landroid/os/Handler;

.field private mResolver:Landroid/content/ContentResolver;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const-string v0, "sync_state"

    .line 136
    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings$MonitorTask;->PROJECTION:[Ljava/lang/String;

    const/4 v0, 0x4

    .line 142
    new-array v0, v0, [Ljava/lang/String;

    const/16 v1, 0x8

    .line 143
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const/16 v1, 0x9

    .line 144
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    const/4 v1, 0x7

    .line 145
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x2

    aput-object v1, v0, v2

    const/16 v1, 0xa

    .line 146
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings$MonitorTask;->SELECTION_ARGS:[Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Landroid/os/Handler;)V
    .locals 0

    .line 165
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 166
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings$MonitorTask;->mResolver:Landroid/content/ContentResolver;

    .line 167
    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings$MonitorTask;->mHandler:Landroid/os/Handler;

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings$MonitorStatus;
    .locals 7

    .line 173
    new-instance p1, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings$MonitorStatus;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings$MonitorStatus;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings$1;)V

    .line 175
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings$MonitorTask;->mResolver:Landroid/content/ContentResolver;

    sget-object v2, Lcom/sonymobile/scan3d/storageservice/provider/Contract$FileRecord;->CONTENT_URI:Landroid/net/Uri;

    sget-object v3, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings$MonitorTask;->PROJECTION:[Ljava/lang/String;

    const-string v4, "sync_state!=? AND sync_state!=? AND sync_state!=? AND sync_state!=?"

    sget-object v5, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings$MonitorTask;->SELECTION_ARGS:[Ljava/lang/String;

    const/4 v6, 0x0

    .line 176
    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 178
    :try_start_0
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_4

    const-string v2, "sync_state"

    .line 179
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 182
    :cond_0
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    const/4 v4, 0x6

    const/4 v5, 0x1

    if-eq v3, v4, :cond_1

    packed-switch v3, :pswitch_data_0

    goto :goto_0

    .line 189
    :pswitch_0
    iput-boolean v5, p1, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings$MonitorStatus;->active:Z

    goto :goto_0

    .line 185
    :cond_1
    :pswitch_1
    iget v3, p1, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings$MonitorStatus;->numSynced:I

    add-int/2addr v3, v5

    iput v3, p1, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings$MonitorStatus;->numSynced:I

    .line 194
    :goto_0
    iget v3, p1, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings$MonitorStatus;->numScans:I

    add-int/2addr v3, v5

    iput v3, p1, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings$MonitorStatus;->numScans:I

    .line 195
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v3, :cond_0

    goto :goto_3

    :catchall_0
    move-exception p1

    goto :goto_1

    :catch_0
    move-exception p1

    move-object v0, p1

    .line 175
    :try_start_1
    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_1
    if-eqz v1, :cond_3

    if-eqz v0, :cond_2

    .line 197
    :try_start_2
    invoke-interface {v1}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_2

    :catch_1
    move-exception v1

    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_2

    :cond_2
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_3
    :goto_2
    throw p1

    :cond_4
    :goto_3
    if-eqz v1, :cond_5

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_5
    return-object p1

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 135
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings$MonitorTask;->doInBackground([Ljava/lang/Void;)Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings$MonitorStatus;

    move-result-object p1

    return-object p1
.end method

.method protected onPostExecute(Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings$MonitorStatus;)V
    .locals 2

    .line 204
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 205
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings$MonitorTask;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-static {v0, v1, p1}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 135
    check-cast p1, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings$MonitorStatus;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings$MonitorTask;->onPostExecute(Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings$MonitorStatus;)V

    return-void
.end method
