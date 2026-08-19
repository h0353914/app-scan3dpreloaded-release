.class public Lcom/sonymobile/scan3d/viewer/asynctasks/RigModelTask;
.super Landroid/os/AsyncTask;
.source "RigModelTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Landroid/net/Uri;",
        "Ljava/lang/Void;",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field private mContext:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field private mListener:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$GltfConversionListener;",
            ">;"
        }
    .end annotation
.end field

.field private mSphanRenderer:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/sonymobile/scan3d/viewer/SphanRenderer;",
            ">;"
        }
    .end annotation
.end field

.field private mUri:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$GltfConversionListener;)V
    .locals 1

    .line 55
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 56
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/RigModelTask;->mContext:Ljava/lang/ref/WeakReference;

    .line 57
    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/RigModelTask;->mListener:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/sonymobile/scan3d/viewer/SphanRenderer;Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$GltfConversionListener;)V
    .locals 1

    .line 61
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 62
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/RigModelTask;->mContext:Ljava/lang/ref/WeakReference;

    .line 63
    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/RigModelTask;->mSphanRenderer:Ljava/lang/ref/WeakReference;

    .line 64
    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/RigModelTask;->mListener:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method private createDateStampedBaseFileName(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 145
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyyMMdd_HHmmss"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 146
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    .line 147
    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    .line 149
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "/3DCreator_"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method protected varargs doInBackground([Landroid/net/Uri;)Ljava/lang/Boolean;
    .locals 9

    .line 80
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/RigModelTask;->mContext:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 82
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    .line 84
    :cond_0
    aget-object p1, p1, v1

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/RigModelTask;->mUri:Landroid/net/Uri;

    .line 85
    const-class p1, Lcom/sonymobile/scan3d/viewer/asynctasks/RigModelTask;

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "RigModelTask started for: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/RigModelTask;->mUri:Landroid/net/Uri;

    .line 86
    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 85
    invoke-static {p1, v2}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/RigModelTask;->mUri:Landroid/net/Uri;

    invoke-static {v0, p1}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->create(Landroid/content/Context;Landroid/net/Uri;)Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object p1

    .line 89
    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/RigModelTask;->mSphanRenderer:Ljava/lang/ref/WeakReference;

    const/4 v3, 0x0

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    goto :goto_0

    :cond_1
    move-object v2, v3

    :goto_0
    if-eqz p1, :cond_3

    .line 91
    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->getPassword(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    .line 92
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getIdentifier()Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v5}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->getResultsDirectory(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    move-result-object v5

    .line 94
    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/sonymobile/scan3d/viewer/asynctasks/RigModelTask;->createDateStampedBaseFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 95
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, ".glb.zip"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 96
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, ".gif"

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 99
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getZipFileUrl()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v4, v6, v4, v2}, Lcom/sonymobile/scan3d/animation/ObjToGltfConverter;->convert(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/sonymobile/scan3d/viewer/SphanRenderer;)Z

    move-result p1

    const/4 v7, 0x1

    if-eqz p1, :cond_2

    .line 102
    invoke-static {v3, v7}, Lcom/sonymobile/scan3d/NativeEGL;->createContext(Landroid/view/Surface;Z)J

    move-result-wide v7

    .line 103
    invoke-static {v6, v4, v5, v2}, Lcom/sonymobile/scan3d/animation/ObjToGltfConverter;->createPreview(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/sonymobile/scan3d/viewer/SphanRenderer;)V

    .line 104
    invoke-static {v7, v8}, Lcom/sonymobile/scan3d/NativeEGL;->destroyContext(J)V

    .line 106
    new-instance v1, Landroid/content/ContentValues;

    const/4 v2, 0x2

    invoke-direct {v1, v2}, Landroid/content/ContentValues;-><init>(I)V

    const-string v2, "rigged_scan_url"

    .line 107
    invoke-virtual {v1, v2, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "rigged_preview_url"

    .line 108
    invoke-virtual {v1, v2, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/RigModelTask;->mUri:Landroid/net/Uri;

    invoke-virtual {v0, v2, v1, v3, v3}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_1

    .line 112
    :cond_2
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2, v7}, Landroid/content/ContentValues;-><init>(I)V

    const-string v4, "riggable"

    .line 113
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v2, v4, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 114
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/RigModelTask;->mUri:Landroid/net/Uri;

    invoke-virtual {v0, v1, v2, v3, v3}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_1

    :cond_3
    move p1, v1

    .line 117
    :goto_1
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 36
    check-cast p1, [Landroid/net/Uri;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/asynctasks/RigModelTask;->doInBackground([Landroid/net/Uri;)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method protected onPostExecute(Ljava/lang/Boolean;)V
    .locals 2

    .line 122
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/RigModelTask;->mListener:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$GltfConversionListener;

    .line 123
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/RigModelTask;->mUri:Landroid/net/Uri;

    if-eqz v1, :cond_3

    if-eqz v0, :cond_3

    .line 124
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 125
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/RigModelTask;->mContext:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 126
    sget-object p1, Lcom/sonymobile/scan3d/analytics/HitEvent;->RIGGING_PROCESS_COMPLETED:Lcom/sonymobile/scan3d/analytics/HitEvent;

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/RigModelTask;->mContext:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/Context;

    invoke-virtual {p1, v1}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;)V

    .line 128
    :cond_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/RigModelTask;->mUri:Landroid/net/Uri;

    invoke-interface {v0, p1}, Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$GltfConversionListener;->onConversionDone(Landroid/net/Uri;)V

    goto :goto_0

    .line 130
    :cond_1
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/RigModelTask;->mContext:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 131
    sget-object p1, Lcom/sonymobile/scan3d/analytics/HitEvent;->RIGGING_PROCESS_FAILED:Lcom/sonymobile/scan3d/analytics/HitEvent;

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/RigModelTask;->mContext:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/Context;

    invoke-virtual {p1, v1}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;)V

    .line 133
    :cond_2
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/RigModelTask;->mUri:Landroid/net/Uri;

    invoke-interface {v0, p1}, Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$GltfConversionListener;->onConversionFailed(Landroid/net/Uri;)V

    :cond_3
    :goto_0
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 36
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/asynctasks/RigModelTask;->onPostExecute(Ljava/lang/Boolean;)V

    return-void
.end method

.method public setListener(Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$GltfConversionListener;)V
    .locals 1

    .line 74
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/RigModelTask;->mListener:Ljava/lang/ref/WeakReference;

    return-void
.end method
