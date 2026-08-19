.class public Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;
.super Landroidx/fragment/app/Fragment;
.source "MonitorFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment$UploadMonitorTask;,
        Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment$UploadObserver;
    }
.end annotation


# static fields
.field private static final KEY_CREDENTIALS:Ljava/lang/String; = "credentials"

.field protected static final KEY_FILESET:Ljava/lang/String; = "fileset"

.field protected static final KEY_SERVICE_PROVIDER:Ljava/lang/String; = "service_provider"


# instance fields
.field private mHandler:Landroid/os/Handler;

.field private mObserver:Landroid/database/ContentObserver;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 37
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;)Landroid/net/Uri;
    .locals 0

    .line 37
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;->getUri()Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;Lcom/sonymobile/scan3d/storageservice/provider/Upload;)V
    .locals 0

    .line 37
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;->onUploadReceived(Lcom/sonymobile/scan3d/storageservice/provider/Upload;)V

    return-void
.end method

.method private getCredentials()Lcom/sonymobile/scan3d/storageservice/network/Credentials;
    .locals 2

    .line 252
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "credentials"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/storageservice/network/Credentials;

    return-object v0
.end method

.method private getUri()Landroid/net/Uri;
    .locals 2

    .line 233
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "fileset"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    .line 234
    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getUri()Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method public static newInstance(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;Lcom/sonymobile/scan3d/storageservice/network/Credentials;)Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;
    .locals 1

    .line 74
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;-><init>()V

    .line 75
    invoke-static {p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;->prepareArgs(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;Lcom/sonymobile/scan3d/storageservice/network/Credentials;)Landroid/os/Bundle;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;->setArguments(Landroid/os/Bundle;)V

    return-object v0
.end method

.method private onUploadReceived(Lcom/sonymobile/scan3d/storageservice/provider/Upload;)V
    .locals 7

    .line 195
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v6

    if-eqz v6, :cond_2

    if-eqz p1, :cond_1

    .line 198
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/provider/Upload;->isUploaded()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 199
    invoke-virtual {v6}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 200
    invoke-virtual {v0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    .line 201
    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v5

    .line 203
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/provider/Upload;->getUid()Ljava/lang/String;

    move-result-object v3

    .line 205
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;->getServiceProvider()Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    move-result-object v0

    .line 206
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;->getCredentials()Lcom/sonymobile/scan3d/storageservice/network/Credentials;

    move-result-object v4

    move-object v1, v6

    invoke-virtual/range {v0 .. v5}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->startActivity(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/sonymobile/scan3d/storageservice/network/Credentials;Landroid/os/Bundle;)Z

    .line 207
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "notification"

    .line 208
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    if-eqz v0, :cond_0

    const-string v1, "upload"

    .line 210
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/provider/Upload;->getId()J

    move-result-wide v2

    long-to-int p1, v2

    invoke-virtual {v0, v1, p1}, Landroid/app/NotificationManager;->cancel(Ljava/lang/String;I)V

    .line 212
    :cond_0
    invoke-virtual {v6}, Landroid/app/Activity;->finish()V

    goto :goto_0

    :cond_1
    if-nez p1, :cond_2

    .line 214
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;->onHandleNoUploadRecord()V

    :cond_2
    :goto_0
    return-void
.end method

.method protected static prepareArgs(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;Lcom/sonymobile/scan3d/storageservice/network/Credentials;)Landroid/os/Bundle;
    .locals 2

    .line 89
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "fileset"

    .line 90
    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string p0, "service_provider"

    .line 91
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->name()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p0, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "credentials"

    .line 92
    invoke-virtual {v0, p0, p2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    return-object v0
.end method


# virtual methods
.method protected getServiceProvider()Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;
    .locals 2

    .line 243
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "service_provider"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    move-result-object v0

    return-object v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 160
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 161
    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;->mHandler:Landroid/os/Handler;

    .line 162
    new-instance p1, Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment$UploadObserver;

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;->mHandler:Landroid/os/Handler;

    invoke-direct {p1, p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment$UploadObserver;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;Landroid/os/Handler;)V

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;->mObserver:Landroid/database/ContentObserver;

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0c00a6

    const/4 v0, 0x0

    .line 168
    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method protected onHandleNoUploadRecord()V
    .locals 1

    .line 224
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->finish()V

    return-void
.end method

.method public onStart()V
    .locals 4

    .line 173
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onStart()V

    .line 176
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/provider/Contract$UploadRecord;->CONTENT_URI:Landroid/net/Uri;

    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;->mObserver:Landroid/database/ContentObserver;

    const/4 v3, 0x1

    .line 177
    invoke-virtual {v0, v1, v3, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    return-void
.end method

.method public onStop()V
    .locals 3

    .line 182
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onStop()V

    .line 183
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;->mObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 184
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 186
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;->mObserver:Landroid/database/ContentObserver;

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/provider/Contract$UploadRecord;->CONTENT_URI:Landroid/net/Uri;

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Landroid/database/ContentObserver;->dispatchChange(ZLandroid/net/Uri;)V

    return-void
.end method
