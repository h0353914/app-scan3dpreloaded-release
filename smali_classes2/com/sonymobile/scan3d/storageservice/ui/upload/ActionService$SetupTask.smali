.class Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService$SetupTask;
.super Landroid/os/AsyncTask;
.source "ActionService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SetupTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Landroid/content/Intent;",
        "Ljava/lang/Void;",
        "Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;",
        ">;"
    }
.end annotation


# instance fields
.field private final mServiceRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;",
            ">;"
        }
    .end annotation
.end field

.field private final mStartId:I


# direct methods
.method private constructor <init>(Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;I)V
    .locals 1

    .line 159
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 160
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService$SetupTask;->mServiceRef:Ljava/lang/ref/WeakReference;

    .line 161
    iput p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService$SetupTask;->mStartId:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;ILcom/sonymobile/scan3d/storageservice/ui/upload/ActionService$1;)V
    .locals 0

    .line 141
    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService$SetupTask;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;I)V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Landroid/content/Intent;)Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;
    .locals 11

    const/4 v0, 0x0

    .line 166
    aget-object p1, p1, v0

    .line 167
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v6

    .line 169
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService$SetupTask;->mServiceRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    if-eqz v6, :cond_1

    .line 172
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v3

    const-string v4, "com.sonymobile.scan3d.extra.SERVICE_PROVIDER"

    .line 174
    invoke-virtual {v6, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    move-result-object v4

    const-string v5, "com.sonymobile.scan3d.extra.CREDENTIALS"

    .line 175
    invoke-virtual {v6, v5}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v5

    check-cast v5, Lcom/sonymobile/scan3d/storageservice/network/Credentials;

    .line 176
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->getAction(Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    move-result-object p1

    .line 178
    invoke-static {v1, v3, v4}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->getUpload(Landroid/content/Context;Landroid/net/Uri;Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;)Lcom/sonymobile/scan3d/storageservice/provider/Upload;

    move-result-object v7

    .line 179
    invoke-static {v1, v3}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->create(Landroid/content/Context;Landroid/net/Uri;)Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 183
    new-instance v8, Landroid/content/ContentValues;

    const/4 v9, 0x3

    invoke-direct {v8, v9}, Landroid/content/ContentValues;-><init>(I)V

    const-string v9, "state"

    .line 184
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v8, v9, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    if-nez v7, :cond_0

    const-string v0, "provider"

    .line 187
    invoke-virtual {v4}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v8, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "parent_id"

    .line 188
    invoke-interface {v3}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getId()J

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v8, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 189
    invoke-virtual {v1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/provider/Contract$UploadRecord;->CONTENT_URI:Landroid/net/Uri;

    .line 190
    invoke-virtual {v0, v1, v8}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v0

    goto :goto_0

    .line 193
    :cond_0
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/provider/Contract$UploadRecord;->CONTENT_URI:Landroid/net/Uri;

    .line 194
    invoke-virtual {v7}, Lcom/sonymobile/scan3d/storageservice/provider/Upload;->getId()J

    move-result-wide v9

    .line 193
    invoke-static {v0, v9, v10}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v0

    .line 195
    invoke-virtual {v1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual {v1, v0, v8, v2, v2}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    :goto_0
    move-object v1, v4

    move-object v2, v3

    move-object v3, v5

    move-object v4, p1

    move-object v5, v0

    .line 197
    invoke-virtual/range {v1 .. v6}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->create(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/network/Credentials;Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;Landroid/net/Uri;Landroid/os/Bundle;)Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;

    move-result-object v2

    :cond_1
    return-object v2
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 141
    check-cast p1, [Landroid/content/Intent;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService$SetupTask;->doInBackground([Landroid/content/Intent;)Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;

    move-result-object p1

    return-object p1
.end method

.method protected onPostExecute(Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;)V
    .locals 2

    .line 205
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 206
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService$SetupTask;->mServiceRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;

    if-eqz v0, :cond_0

    .line 209
    iget v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService$SetupTask;->mStartId:I

    invoke-static {v0, p1, v1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;->access$100(Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;I)V

    :cond_0
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 141
    check-cast p1, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService$SetupTask;->onPostExecute(Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;)V

    return-void
.end method
