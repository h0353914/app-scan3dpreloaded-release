.class public interface abstract Lcom/sonymobile/scan3d/storageservice/provider/ITransientFileSet;
.super Ljava/lang/Object;
.source "ITransientFileSet.java"

# interfaces
.implements Landroid/os/Parcelable;


# virtual methods
.method public abstract deleteAllFiles(Landroid/content/Context;)Z
.end method

.method public abstract getCreated()Ljava/util/Date;
.end method

.method public abstract getFiles()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getIdentifier()Ljava/lang/String;
.end method

.method public abstract getLogUrl()Ljava/lang/String;
.end method

.method public abstract getName()Ljava/lang/String;
.end method

.method public abstract getPreviewUrl()Ljava/lang/String;
.end method

.method public abstract getPropFileUrl()Ljava/lang/String;
.end method

.method public abstract getRiggedFileUrl()Ljava/lang/String;
.end method

.method public abstract getRiggedPreviewUrl()Ljava/lang/String;
.end method

.method public abstract getScanType()I
.end method

.method public abstract getShareHash()Ljava/lang/String;
.end method

.method public abstract getSharedMeshes()I
.end method

.method public abstract getSyncState()I
.end method

.method public abstract getZipFileUrl()Ljava/lang/String;
.end method

.method public abstract isDownloadable()Z
.end method

.method public abstract isImprovement()Z
.end method

.method public abstract isRemote()Z
.end method

.method public abstract isRiggable()Z
.end method

.method public abstract isRigged()Z
.end method

.method public abstract isSynced()Z
.end method

.method public abstract isValid()Z
.end method

.method public abstract isVisible()Z
.end method

.method public abstract toContentValues()Landroid/content/ContentValues;
.end method
