.class public abstract Lcom/sonymobile/scan3d/storageservice/ui/upload/PrintActionTask;
.super Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;
.source "PrintActionTask.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "com.sonymobile.scan3d.storageservice.ui.upload.PrintActionTask"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/network/Credentials;Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;Landroid/net/Uri;Landroid/os/Bundle;)V
    .locals 0

    .line 46
    invoke-direct/range {p0 .. p6}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/network/Credentials;Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;Landroid/net/Uri;Landroid/os/Bundle;)V

    return-void
.end method

.method private applyPrintSelection(Landroid/content/Context;Lcom/sonymobile/scan3d/PrintSelection;Ljava/io/File;Ljava/io/File;)V
    .locals 9

    .line 124
    invoke-virtual {p3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p3

    .line 125
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/PrintActionTask;->getServiceProvider()Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    move-result-object v0

    .line 128
    new-instance v8, Lcom/sonymobile/scan3d/viewer/ModelContainer;

    invoke-direct {v8}, Lcom/sonymobile/scan3d/viewer/ModelContainer;-><init>()V

    .line 129
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->getPassword(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v8, p3, v1}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->importZip(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_2

    .line 131
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->getSupportedModelFormat()I

    move-result p3

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne p3, v2, :cond_0

    move v6, v2

    goto :goto_0

    :cond_0
    move v6, v1

    .line 133
    :goto_0
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->getSupportedTextureFormat()I

    move-result p3

    const/16 v3, 0x65

    if-ne p3, v3, :cond_1

    move v7, v2

    goto :goto_1

    :cond_1
    move v7, v1

    .line 134
    :goto_1
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->getCoordSystem()I

    move-result v5

    move-object v1, p1

    move-object v2, v8

    move-object v3, p4

    move-object v4, p2

    .line 135
    invoke-static/range {v1 .. v7}, Lcom/sonymobile/scan3d/PrintExecution;->apply(Landroid/content/Context;Lcom/sonymobile/scan3d/viewer/ModelContainer;Ljava/io/File;Lcom/sonymobile/scan3d/PrintSelection;IZZ)Z

    .line 137
    :cond_2
    invoke-virtual {v8}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->release()V

    return-void
.end method

.method private savePrint(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/PrintSelection;)Ljava/io/File;
    .locals 3

    const-string v0, ".zip"

    .line 104
    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->generateRandomFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 105
    new-instance v1, Ljava/io/File;

    invoke-interface {p2}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getZipFileUrl()Ljava/lang/String;

    move-result-object p2

    invoke-direct {v1, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 106
    new-instance p2, Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p2, v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 109
    invoke-direct {p0, p1, p3, v1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/PrintActionTask;->applyPrintSelection(Landroid/content/Context;Lcom/sonymobile/scan3d/PrintSelection;Ljava/io/File;Ljava/io/File;)V

    :cond_0
    return-object p2
.end method


# virtual methods
.method public final execute(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/network/Credentials;Landroid/os/Bundle;)Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask$ActionResult;
    .locals 14

    move-object v0, p1

    const-string v1, "com.sonymobile.scan3d.extra.PRINT_SELECTION"

    move-object/from16 v2, p5

    .line 52
    invoke-virtual {v2, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Lcom/sonymobile/scan3d/PrintSelection;

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 53
    invoke-static {v2, v1}, Lcom/sonymobile/scan3d/NativeEGL;->createContext(Landroid/view/Surface;Z)J

    move-result-wide v8

    .line 57
    :try_start_0
    new-instance v3, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask$ActionResult;

    const/4 v4, 0x0

    invoke-direct {v3, v4, v2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask$ActionResult;-><init>(ZLjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    move-object v10, p0

    move-object/from16 v4, p3

    .line 58
    :try_start_1
    invoke-direct {p0, p1, v4, v7}, Lcom/sonymobile/scan3d/storageservice/ui/upload/PrintActionTask;->savePrint(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/PrintSelection;)Ljava/io/File;

    move-result-object v11
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-eqz v7, :cond_0

    .line 59
    :try_start_2
    invoke-virtual {v7}, Lcom/sonymobile/scan3d/PrintSelection;->getPrintType()Lcom/sonymobile/scan3d/PrintType;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 60
    invoke-virtual {v7}, Lcom/sonymobile/scan3d/PrintSelection;->getPrintType()Lcom/sonymobile/scan3d/PrintType;

    move-result-object v1

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/PrintType;->ordinal()I

    move-result v1

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_3

    :cond_0
    :goto_0
    move v12, v1

    .line 61
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/PrintActionTask;->getServiceProvider()Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->getServiceProviderName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v13

    if-eqz v11, :cond_1

    .line 62
    invoke-virtual {v11}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 63
    sget-object v1, Lcom/sonymobile/scan3d/analytics/HitEvent;->PRINTING_UPLOAD_STARTED:Lcom/sonymobile/scan3d/analytics/HitEvent;

    int-to-long v2, v12

    invoke-virtual {v1, p1, v13, v2, v3}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;Ljava/lang/String;J)V

    move-object v1, p0

    move-object v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object v6, v11

    .line 64
    invoke-virtual/range {v1 .. v7}, Lcom/sonymobile/scan3d/storageservice/ui/upload/PrintActionTask;->execute(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/network/Credentials;Ljava/io/File;Lcom/sonymobile/scan3d/PrintSelection;)Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask$ActionResult;

    move-result-object v3

    .line 66
    :cond_1
    invoke-virtual {v3}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask$ActionResult;->success()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 67
    sget-object v1, Lcom/sonymobile/scan3d/analytics/HitEvent;->PRINTING_UPLOAD_SUCCEEDED:Lcom/sonymobile/scan3d/analytics/HitEvent;

    int-to-long v4, v12

    invoke-virtual {v1, p1, v13, v4, v5}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;Ljava/lang/String;J)V

    goto :goto_1

    .line 69
    :cond_2
    sget-object v1, Lcom/sonymobile/scan3d/analytics/HitEvent;->PRINTING_UPLOAD_FAILED:Lcom/sonymobile/scan3d/analytics/HitEvent;

    int-to-long v4, v12

    invoke-virtual {v1, p1, v13, v4, v5}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;Ljava/lang/String;J)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 73
    :goto_1
    invoke-static {v8, v9}, Lcom/sonymobile/scan3d/NativeEGL;->destroyContext(J)V

    if-eqz v11, :cond_3

    .line 74
    invoke-virtual {v11}, Ljava/io/File;->delete()Z

    move-result v0

    if-nez v0, :cond_3

    .line 75
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/PrintActionTask;->TAG:Ljava/lang/String;

    const-string v1, "Failed to delete print file."

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    return-object v3

    :catchall_1
    move-exception v0

    goto :goto_2

    :catchall_2
    move-exception v0

    move-object v10, p0

    :goto_2
    move-object v11, v2

    .line 73
    :goto_3
    invoke-static {v8, v9}, Lcom/sonymobile/scan3d/NativeEGL;->destroyContext(J)V

    if-eqz v11, :cond_4

    .line 74
    invoke-virtual {v11}, Ljava/io/File;->delete()Z

    move-result v1

    if-nez v1, :cond_4

    .line 75
    sget-object v1, Lcom/sonymobile/scan3d/storageservice/ui/upload/PrintActionTask;->TAG:Ljava/lang/String;

    const-string v2, "Failed to delete print file."

    invoke-static {v1, v2}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    :cond_4
    throw v0
.end method

.method public abstract execute(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/network/Credentials;Ljava/io/File;Lcom/sonymobile/scan3d/PrintSelection;)Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask$ActionResult;
.end method
