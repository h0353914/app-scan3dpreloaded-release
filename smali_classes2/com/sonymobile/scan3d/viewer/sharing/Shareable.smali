.class public Lcom/sonymobile/scan3d/viewer/sharing/Shareable;
.super Ljava/lang/Object;
.source "Shareable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;
    }
.end annotation


# static fields
.field private static final KEY_FILESET:Ljava/lang/String; = "fileset"

.field private static final KEY_IS_TESSELATED:Ljava/lang/String; = "is_tesselated"

.field private static final KEY_RECIPIENT_CN:Ljava/lang/String; = "recipient_component_name"

.field private static final KEY_RECIPIENT_REQUIRED:Ljava/lang/String; = "recipient_required"

.field private static final KEY_RECIPIENT_SP:Ljava/lang/String; = "recipient_service_provider"

.field private static final KEY_SCANFORMAT:Ljava/lang/String; = "scanformat"

.field private static final KEY_SHARETYPE:Ljava/lang/String; = "sharetype"

.field private static final KEY_TEXTURE_SIZE:Ljava/lang/String; = "texture_size"

.field private static final KEY_URL:Ljava/lang/String; = "url"

.field private static final KEY_VIEW_MATRIX:Ljava/lang/String; = "view_matrix"


# instance fields
.field private mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

.field private mIsTessellated:Z

.field private mRecipientComponentName:Landroid/content/ComponentName;

.field private mRecipientRequired:Z

.field private mRecipientServiceProvider:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

.field private mScanFormat:I

.field private mShareType:Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

.field private mTextureSize:I

.field private mUrl:Ljava/lang/String;

.field private mViewMatrix:[F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 175
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 155
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mRecipientRequired:Z

    return-void
.end method

.method public constructor <init>(Landroid/os/Bundle;)V
    .locals 1

    .line 183
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 155
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mRecipientRequired:Z

    if-eqz p1, :cond_0

    const-string v0, "fileset"

    .line 185
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    const-string v0, "url"

    .line 186
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mUrl:Ljava/lang/String;

    const-string v0, "scanformat"

    .line 187
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mScanFormat:I

    const-string v0, "sharetype"

    .line 188
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mShareType:Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    const-string v0, "recipient_component_name"

    .line 189
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/content/ComponentName;

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mRecipientComponentName:Landroid/content/ComponentName;

    const-string v0, "recipient_service_provider"

    .line 190
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mRecipientServiceProvider:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    const-string v0, "recipient_required"

    .line 191
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mRecipientRequired:Z

    const-string v0, "texture_size"

    .line 192
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mTextureSize:I

    const-string v0, "is_tesselated"

    .line 193
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mIsTessellated:Z

    const-string v0, "view_matrix"

    .line 194
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getFloatArray(Ljava/lang/String;)[F

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mViewMatrix:[F

    :cond_0
    return-void
.end method


# virtual methods
.method public getFileSet()Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;
    .locals 1

    .line 229
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    return-object v0
.end method

.method public getRecipient()Ljava/lang/Object;
    .locals 1

    .line 238
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mRecipientComponentName:Landroid/content/ComponentName;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mRecipientServiceProvider:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    :goto_0
    return-object v0
.end method

.method public getScanFormat()I
    .locals 1

    .line 202
    iget v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mScanFormat:I

    return v0
.end method

.method public getShareType()Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;
    .locals 1

    .line 220
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mShareType:Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    return-object v0
.end method

.method public getTextureSize()I
    .locals 1

    .line 256
    iget v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mTextureSize:I

    return v0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 1

    .line 211
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getViewMatrix()[F
    .locals 1

    .line 274
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mViewMatrix:[F

    invoke-virtual {v0}, [F->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [F

    return-object v0
.end method

.method public isRecipientRequired()Z
    .locals 1

    .line 247
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mRecipientRequired:Z

    return v0
.end method

.method public isShared()Z
    .locals 2

    .line 284
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    if-eqz v0, :cond_0

    .line 285
    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getSharedMeshes()I

    move-result v0

    int-to-long v0, v0

    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v0

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mShareType:Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->getCloudContentType()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->testBit(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isTessellated()Z
    .locals 1

    .line 265
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mIsTessellated:Z

    return v0
.end method

.method public setFileSet(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;
    .locals 0

    .line 295
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    return-object p0
.end method

.method public setRecipient(Landroid/content/ComponentName;)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;
    .locals 0

    .line 341
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mRecipientComponentName:Landroid/content/ComponentName;

    const/4 p1, 0x0

    .line 342
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mRecipientServiceProvider:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    const/4 p1, 0x1

    .line 343
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mRecipientRequired:Z

    return-object p0
.end method

.method public setRecipient(Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;
    .locals 0

    .line 355
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mRecipientServiceProvider:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    const/4 p1, 0x0

    .line 356
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mRecipientComponentName:Landroid/content/ComponentName;

    const/4 p1, 0x1

    .line 357
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mRecipientRequired:Z

    return-object p0
.end method

.method public setRecipientRequired(Z)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;
    .locals 0

    .line 368
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mRecipientRequired:Z

    const/4 p1, 0x0

    .line 369
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mRecipientServiceProvider:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    .line 370
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mRecipientComponentName:Landroid/content/ComponentName;

    return-object p0
.end method

.method public setScanFormat(I)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;
    .locals 0

    .line 329
    iput p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mScanFormat:I

    return-object p0
.end method

.method public setShareType(Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;
    .locals 0

    .line 307
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mShareType:Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    return-object p0
.end method

.method public setTessellated(Z)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;
    .locals 0

    .line 392
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mIsTessellated:Z

    return-object p0
.end method

.method public setTextureSize(I)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;
    .locals 0

    .line 381
    iput p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mTextureSize:I

    return-object p0
.end method

.method public setUrl(Ljava/lang/String;)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;
    .locals 0

    .line 318
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mUrl:Ljava/lang/String;

    return-object p0
.end method

.method public setViewMatrix([F)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;
    .locals 0

    if-eqz p1, :cond_0

    .line 404
    invoke-virtual {p1}, [F->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [F

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mViewMatrix:[F

    :cond_0
    return-object p0
.end method

.method public share(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 435
    invoke-virtual {p0, p1, v0}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->share(Landroid/content/Context;Landroid/os/Handler;)V

    return-void
.end method

.method public share(Landroid/content/Context;Landroid/os/Handler;)V
    .locals 3

    .line 447
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mRecipientServiceProvider:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    if-eqz v0, :cond_1

    .line 448
    sget-object p2, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$1;->$SwitchMap$com$sonymobile$scan3d$storageservice$ui$upload$ServiceProvider:[I

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mRecipientServiceProvider:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->ordinal()I

    move-result v0

    aget p2, p2, v0

    const/4 v0, 0x1

    if-eq p2, v0, :cond_0

    goto :goto_0

    .line 450
    :cond_0
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mRecipientServiceProvider:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    invoke-virtual {p2, p1, v0, p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->share(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/viewer/sharing/Shareable;)V

    goto :goto_0

    .line 457
    :cond_1
    iget v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mScanFormat:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 462
    :pswitch_0
    sget-object v0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$1;->$SwitchMap$com$sonymobile$scan3d$viewer$sharing$Shareable$Type:[I

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mShareType:Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_1

    goto :goto_0

    .line 469
    :pswitch_1
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mUrl:Ljava/lang/String;

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mRecipientComponentName:Landroid/content/ComponentName;

    iget v2, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mTextureSize:I

    invoke-static {p1, p2, v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/provider/FileTasks;->shareGltfObject(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Ljava/lang/String;Landroid/content/ComponentName;I)V

    goto :goto_0

    .line 465
    :pswitch_2
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mRecipientComponentName:Landroid/content/ComponentName;

    iget v2, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mTextureSize:I

    invoke-static {p1, v0, v1, v2, p2}, Lcom/sonymobile/scan3d/storageservice/provider/FileTasks;->shareGltfMesh(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Landroid/content/ComponentName;ILandroid/os/Handler;)V

    goto :goto_0

    .line 459
    :pswitch_3
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mRecipientComponentName:Landroid/content/ComponentName;

    iget-boolean v1, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mIsTessellated:Z

    invoke-static {p1, p2, v0, v1}, Lcom/sonymobile/scan3d/storageservice/provider/FileTasks;->shareMesh(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Landroid/content/ComponentName;Z)V

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_2
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public toBundle()Landroid/os/Bundle;
    .locals 3

    .line 415
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "fileset"

    .line 416
    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string v1, "url"

    .line 417
    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mUrl:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "scanformat"

    .line 418
    iget v2, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mScanFormat:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "sharetype"

    .line 419
    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mShareType:Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    const-string v1, "recipient_component_name"

    .line 420
    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mRecipientComponentName:Landroid/content/ComponentName;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string v1, "recipient_service_provider"

    .line 421
    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mRecipientServiceProvider:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    const-string v1, "recipient_required"

    .line 422
    iget-boolean v2, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mRecipientRequired:Z

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v1, "texture_size"

    .line 423
    iget v2, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mTextureSize:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "is_tesselated"

    .line 424
    iget-boolean v2, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mIsTessellated:Z

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v1, "view_matrix"

    .line 425
    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->mViewMatrix:[F

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putFloatArray(Ljava/lang/String;[F)V

    return-object v0
.end method
