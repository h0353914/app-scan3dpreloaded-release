.class public Lcom/sonymobile/scan3d/viewer/asynctasks/ImproveTask;
.super Landroid/os/AsyncTask;
.source "ImproveTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Landroid/net/Uri;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "com.sonymobile.scan3d.viewer.asynctasks.ImproveTask"

.field private static final WHERE:Ljava/lang/String; = "improvement_type=? AND parent_id=?"


# instance fields
.field private final mContext:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field private final mType:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    .line 53
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 54
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/ImproveTask;->mContext:Ljava/lang/ref/WeakReference;

    .line 55
    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/ImproveTask;->mType:Ljava/lang/String;

    return-void
.end method

.method private deleteImprovement(Landroid/content/ContentResolver;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V
    .locals 5

    .line 102
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/provider/Contract$ImprovementRecord;->CONTENT_URI:Landroid/net/Uri;

    const-string v1, "improvement_type=? AND parent_id=?"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    iget-object v3, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/ImproveTask;->mType:Ljava/lang/String;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    .line 103
    invoke-interface {p2}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getId()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p2

    const/4 v3, 0x1

    aput-object p2, v2, v3

    .line 102
    invoke-virtual {p1, v0, v1, v2}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 24
    check-cast p1, [Landroid/net/Uri;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/asynctasks/ImproveTask;->doInBackground([Landroid/net/Uri;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Landroid/net/Uri;)Ljava/lang/Void;
    .locals 6

    const/4 v0, 0x0

    .line 60
    aget-object p1, p1, v0

    .line 61
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/ImproveTask;->mContext:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    if-eqz v0, :cond_0

    .line 64
    invoke-static {v0, p1}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->create(Landroid/content/Context;Landroid/net/Uri;)Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 67
    invoke-interface {p1, v0}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->isImprovable(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 68
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 71
    invoke-direct {p0, v1, p1}, Lcom/sonymobile/scan3d/viewer/asynctasks/ImproveTask;->deleteImprovement(Landroid/content/ContentResolver;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V

    .line 73
    new-instance v2, Landroid/content/ContentValues;

    const/4 v3, 0x4

    invoke-direct {v2, v3}, Landroid/content/ContentValues;-><init>(I)V

    const-string v3, "parent_id"

    .line 74
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getId()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v3, "improvement_type"

    .line 75
    iget-object v4, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/ImproveTask;->mType:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "name"

    .line 76
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "scan_type"

    .line 77
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getScanType()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 78
    sget-object v3, Lcom/sonymobile/scan3d/storageservice/provider/Contract$ImprovementRecord;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v1, v3, v2}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v2

    .line 80
    sget-object v3, Lcom/sonymobile/scan3d/viewer/asynctasks/ImproveTask;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Created improvement uri "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v2, :cond_0

    .line 83
    invoke-static {v0, v2}, Lcom/sonymobile/scan3d/storageservice/content/Jobs;->requestInitImprovementJob(Landroid/content/Context;Landroid/net/Uri;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 86
    sget-object v0, Lcom/sonymobile/scan3d/viewer/asynctasks/ImproveTask;->TAG:Ljava/lang/String;

    const-string v2, "Job could not be posted."

    invoke-static {v0, v2}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    invoke-direct {p0, v1, p1}, Lcom/sonymobile/scan3d/viewer/asynctasks/ImproveTask;->deleteImprovement(Landroid/content/ContentResolver;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method
