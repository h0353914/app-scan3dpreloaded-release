.class public final Lcom/sonymobile/scan3d/storageservice/provider/FileTasks;
.super Ljava/lang/Object;
.source "FileTasks.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static checkEncryption(Landroid/content/Context;)V
    .locals 0

    .line 45
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->checkEncryption(Landroid/content/Context;)V

    return-void
.end method

.method public static checkIntegrity(Landroid/content/Context;)V
    .locals 0

    .line 36
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->checkIntegrity(Landroid/content/Context;)V

    return-void
.end method

.method public static delete(Landroid/content/Context;Landroid/net/Uri;)V
    .locals 0

    .line 165
    invoke-static {p0, p1}, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->delete(Landroid/content/Context;Landroid/net/Uri;)V

    return-void
.end method

.method public static deleteAnimation(Landroid/content/Context;Landroid/net/Uri;)V
    .locals 0

    .line 155
    invoke-static {p0, p1}, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->deleteAnimation(Landroid/content/Context;Landroid/net/Uri;)V

    return-void
.end method

.method public static deleteFileSet(Landroid/content/Context;Landroid/net/Uri;Z)V
    .locals 3

    .line 125
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->isSignedIn(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 126
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "sync_state"

    const/4 v2, 0x7

    .line 127
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 128
    invoke-static {p0, p1, v0, p2}, Lcom/sonymobile/scan3d/storageservice/provider/FileTasks;->update(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ContentValues;Z)V

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    .line 130
    invoke-static {p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->deleteFileSet(Landroid/content/Context;Landroid/net/Uri;Z)V

    :goto_0
    return-void
.end method

.method public static deleteImprovement(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/Improvement;)V
    .locals 2

    .line 143
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->getFileSetUri()Landroid/net/Uri;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lcom/sonymobile/scan3d/storageservice/provider/FileTasks;->deleteFileSet(Landroid/content/Context;Landroid/net/Uri;Z)V

    .line 145
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->getUri()Landroid/net/Uri;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/sonymobile/scan3d/storageservice/provider/FileTasks;->delete(Landroid/content/Context;Landroid/net/Uri;)V

    return-void
.end method

.method public static insertExampleScans(Landroid/content/Context;)V
    .locals 0

    .line 54
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->insertExampleScans(Landroid/content/Context;)V

    return-void
.end method

.method public static scheduleShareFileDeletion(Landroid/content/Context;)V
    .locals 0

    .line 63
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->scheduleShareFileDeletion(Landroid/content/Context;)V

    return-void
.end method

.method public static shareGltfMesh(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Landroid/content/ComponentName;ILandroid/os/Handler;)V
    .locals 0

    .line 101
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getUri()Landroid/net/Uri;

    move-result-object p1

    invoke-static {p0, p1, p2, p3, p4}, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->shareGlbMesh(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ComponentName;ILandroid/os/Handler;)V

    return-void
.end method

.method public static shareGltfObject(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Ljava/lang/String;Landroid/content/ComponentName;I)V
    .locals 0

    .line 114
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getUri()Landroid/net/Uri;

    move-result-object p1

    invoke-static {p0, p1, p2, p3, p4}, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->shareGlb(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;Landroid/content/ComponentName;I)V

    return-void
.end method

.method public static shareMesh(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Landroid/content/ComponentName;)V
    .locals 1

    const/4 v0, 0x1

    .line 74
    invoke-static {p0, p1, p2, v0}, Lcom/sonymobile/scan3d/storageservice/provider/FileTasks;->shareMesh(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Landroid/content/ComponentName;Z)V

    return-void
.end method

.method public static shareMesh(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Landroid/content/ComponentName;Z)V
    .locals 0

    .line 87
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getUri()Landroid/net/Uri;

    move-result-object p1

    invoke-static {p0, p1, p2, p3}, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->shareMesh(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ComponentName;Z)V

    return-void
.end method

.method public static storeFile(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ContentValues;)V
    .locals 0

    .line 202
    invoke-static {p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->storeFile(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ContentValues;)V

    return-void
.end method

.method public static update(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ContentValues;Z)V
    .locals 0

    .line 191
    invoke-static {p0, p1, p2, p3}, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->update(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ContentValues;Z)V

    return-void
.end method

.method public static updateName(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;Z)V
    .locals 2

    .line 177
    new-instance v0, Landroid/content/ContentValues;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/content/ContentValues;-><init>(I)V

    const-string v1, "name"

    .line 178
    invoke-virtual {v0, v1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 179
    invoke-static {p0, p1, v0, p3}, Lcom/sonymobile/scan3d/storageservice/provider/FileRecordService;->updateMetaData(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ContentValues;Z)V

    return-void
.end method
