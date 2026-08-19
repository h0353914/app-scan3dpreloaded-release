.class public final Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;
.super Landroidx/fragment/app/FragmentActivity;
.source "ActionActivity.java"

# interfaces
.implements Landroidx/loader/app/LoaderManager$LoaderCallbacks;
.implements Lcom/sonymobile/scan3d/storageservice/ui/upload/IStatusListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/fragment/app/FragmentActivity;",
        "Landroidx/loader/app/LoaderManager$LoaderCallbacks<",
        "Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;",
        ">;",
        "Lcom/sonymobile/scan3d/storageservice/ui/upload/IStatusListener<",
        "Lcom/sonymobile/scan3d/storageservice/network/Credentials;",
        ">;"
    }
.end annotation


# static fields
.field private static final DIALOG_TAG:Ljava/lang/String; = "dialog"

.field public static final EXTRA_CREDENTIALS:Ljava/lang/String; = "com.sonymobile.scan3d.extra.CREDENTIALS"

.field private static final EXTRA_FILESET:Ljava/lang/String; = "com.sonymobile.scan3d.extra.FILESET"

.field public static final EXTRA_SERVICE_PROVIDER:Ljava/lang/String; = "com.sonymobile.scan3d.extra.SERVICE_PROVIDER"

.field public static final EXTRA_SHAREABLE:Ljava/lang/String; = "com.sonymobile.scan3d.extra.SHAREABLE"

.field private static final KEY_CREDENTIALS:Ljava/lang/String; = "credentials"

.field private static final KEY_UID:Ljava/lang/String; = "uid"

.field private static final KEY_UPLOAD:Ljava/lang/String; = "upload"

.field private static final NO_RES_ID:I = 0x0

.field protected static final STATE_AUTHENTICATE:I = 0x1

.field protected static final STATE_ERROR:I = 0x2

.field protected static final STATE_MONITOR:I = 0x3

.field protected static final STATE_WELCOME:I = 0x0

.field private static final TAG:Ljava/lang/String; = "com.sonymobile.scan3d.storageservice.ui.upload.ActionActivity"


# instance fields
.field private mCredentials:Lcom/sonymobile/scan3d/storageservice/network/Credentials;

.field private mHandler:Landroid/os/Handler;

.field private mProvider:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

.field private mUid:Ljava/lang/String;

.field private mUploadData:Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 39
    invoke-direct {p0}, Landroidx/fragment/app/FragmentActivity;-><init>()V

    return-void
.end method

.method static getStartIntent(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;)Landroid/content/Intent;
    .locals 1

    const/4 v0, 0x0

    .line 214
    invoke-static {p0, p1, p2, p3, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->getStartIntent(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;Lcom/sonymobile/scan3d/viewer/sharing/Shareable;)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method static getStartIntent(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;Lcom/sonymobile/scan3d/viewer/sharing/Shareable;)Landroid/content/Intent;
    .locals 2

    .line 230
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "com.sonymobile.scan3d.extra.FILESET"

    .line 231
    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string v1, "com.sonymobile.scan3d.extra.SERVICE_PROVIDER"

    .line 232
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->name()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p4, :cond_0

    const-string p2, "com.sonymobile.scan3d.extra.SHAREABLE"

    .line 235
    invoke-virtual {p4}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->toBundle()Landroid/os/Bundle;

    move-result-object p4

    invoke-virtual {v0, p2, p4}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 237
    :cond_0
    new-instance p2, Landroid/content/Intent;

    const-class p4, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;

    invoke-direct {p2, p0, p4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 238
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getUri()Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {p2, p0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 239
    invoke-virtual {p3}, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->getIntentAction()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const/high16 p0, 0x10000000

    .line 240
    invoke-virtual {p2, p0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 241
    invoke-virtual {p2, v0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    return-object p2
.end method

.method public static synthetic lambda$postLoadFragmentFromState$0(Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;ILjava/lang/String;)V
    .locals 0

    .line 263
    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->loadFragmentFromState(ILjava/lang/String;)V

    return-void
.end method

.method private loadFragmentFromState(II)V
    .locals 0
    .param p2    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    if-eqz p2, :cond_0

    .line 329
    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->getString(I)Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->loadFragmentFromState(ILjava/lang/String;)V

    return-void
.end method

.method private loadFragmentFromState(ILjava/lang/String;)V
    .locals 3

    .line 339
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "loadFragmentFromState() : state="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 342
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    .line 343
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object v1

    const v2, 0x7f0900dc

    .line 348
    invoke-virtual {v0, v2}, Landroidx/fragment/app/FragmentManager;->findFragmentById(I)Landroidx/fragment/app/Fragment;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 350
    invoke-virtual {v1, v0}, Landroidx/fragment/app/FragmentTransaction;->remove(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    :cond_0
    packed-switch p1, :pswitch_data_0

    .line 375
    new-instance p2, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "loadFragmentFromState() : Unknown state: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 355
    :pswitch_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string p2, "com.sonymobile.scan3d.extra.FILESET"

    invoke-virtual {p1, p2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    .line 356
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->mProvider:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->mCredentials:Lcom/sonymobile/scan3d/storageservice/network/Credentials;

    invoke-virtual {p2, p1, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->getMonitorFragment(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/network/Credentials;)Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;

    move-result-object p1

    .line 357
    invoke-virtual {v1, v2, p1}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 358
    invoke-virtual {v1}, Landroidx/fragment/app/FragmentTransaction;->commit()I

    goto :goto_0

    :pswitch_1
    const/4 p1, 0x2

    .line 370
    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ErrorFragment;->newInstance(ILjava/lang/String;)Lcom/sonymobile/scan3d/storageservice/ui/upload/ErrorFragment;

    move-result-object p1

    const-string p2, "dialog"

    .line 371
    invoke-virtual {p1, v1, p2}, Landroidx/fragment/app/DialogFragment;->show(Landroidx/fragment/app/FragmentTransaction;Ljava/lang/String;)I

    goto :goto_0

    .line 365
    :pswitch_2
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->mProvider:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    const/4 p2, 0x1

    invoke-virtual {p1, p0, p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->getAuthenticationFragment(Landroid/content/Context;I)Lcom/sonymobile/scan3d/storageservice/ui/upload/ListenableFragment;

    move-result-object p1

    .line 366
    invoke-virtual {v1, v2, p1}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 367
    invoke-virtual {v1}, Landroidx/fragment/app/FragmentTransaction;->commit()I

    goto :goto_0

    .line 361
    :pswitch_3
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->mProvider:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    const/4 p2, 0x0

    invoke-virtual {p1, p0, p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->getInfoFragment(Landroid/content/Context;I)Lcom/sonymobile/scan3d/storageservice/ui/upload/InfoFragment;

    move-result-object p1

    const-string p2, "dialog"

    .line 362
    invoke-virtual {p1, v1, p2}, Landroidx/fragment/app/DialogFragment;->show(Landroidx/fragment/app/FragmentTransaction;Ljava/lang/String;)I

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private postLoadFragmentFromState(II)V
    .locals 0
    .param p2    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    if-eqz p2, :cond_0

    .line 252
    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->getString(I)Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->postLoadFragmentFromState(ILjava/lang/String;)V

    return-void
.end method

.method private postLoadFragmentFromState(ILjava/lang/String;)V
    .locals 2

    .line 263
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/sonymobile/scan3d/storageservice/ui/upload/-$$Lambda$ActionActivity$qtRfGesw9apZw55vSF1JwLCLjvE;

    invoke-direct {v1, p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/-$$Lambda$ActionActivity$qtRfGesw9apZw55vSF1JwLCLjvE;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;ILjava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private startAction()V
    .locals 13

    .line 270
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->mUploadData:Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;->getUpload()Lcom/sonymobile/scan3d/storageservice/provider/Upload;

    move-result-object v0

    .line 271
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "com.sonymobile.scan3d.extra.FILESET"

    .line 272
    invoke-virtual {v1, v2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    .line 273
    new-instance v3, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    const-string v4, "com.sonymobile.scan3d.extra.SHAREABLE"

    invoke-virtual {v1, v4}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;-><init>(Landroid/os/Bundle;)V

    .line 276
    invoke-interface {v2}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getSharedMeshes()I

    move-result v2

    .line 278
    invoke-virtual {v3}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->getShareType()Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    move-result-object v4

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-eqz v4, :cond_0

    .line 279
    sget-object v4, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity$1;->$SwitchMap$com$sonymobile$scan3d$viewer$sharing$Shareable$Type:[I

    invoke-virtual {v3}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->getShareType()Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    move-result-object v3

    invoke-virtual {v3}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->ordinal()I

    move-result v3

    aget v3, v4, v3

    packed-switch v3, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    int-to-long v2, v2

    .line 287
    invoke-static {v2, v3}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v2

    const/4 v3, 0x5

    invoke-virtual {v2, v3}, Ljava/math/BigInteger;->testBit(I)Z

    move-result v2

    goto :goto_1

    :pswitch_1
    int-to-long v2, v2

    .line 284
    invoke-static {v2, v3}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v2

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Ljava/math/BigInteger;->testBit(I)Z

    move-result v2

    goto :goto_1

    :pswitch_2
    int-to-long v2, v2

    .line 281
    invoke-static {v2, v3}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {v2, v5}, Ljava/math/BigInteger;->testBit(I)Z

    move-result v2

    goto :goto_1

    :cond_0
    :goto_0
    move v2, v6

    .line 295
    :goto_1
    iget-object v3, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->mUploadData:Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;

    invoke-virtual {v3}, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;->isValid()Z

    move-result v3

    if-eqz v3, :cond_2

    if-eqz v2, :cond_2

    .line 297
    iget-object v7, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->mProvider:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    invoke-virtual {v1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    .line 298
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/provider/Upload;->getUid()Ljava/lang/String;

    move-result-object v10

    iget-object v11, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->mCredentials:Lcom/sonymobile/scan3d/storageservice/network/Credentials;

    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v12

    move-object v8, p0

    .line 297
    invoke-virtual/range {v7 .. v12}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->startActivity(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/sonymobile/scan3d/storageservice/network/Credentials;Landroid/os/Bundle;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 301
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->finish()V

    goto :goto_2

    :cond_1
    const/4 v0, 0x2

    const v1, 0x7f10033a

    .line 304
    new-array v2, v5, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->mProvider:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    .line 305
    invoke-virtual {v3, p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->getServiceProviderName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v6

    .line 304
    invoke-virtual {p0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->postLoadFragmentFromState(ILjava/lang/String;)V

    goto :goto_2

    .line 308
    :cond_2
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->mProvider:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->isPasswordProtected()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 313
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "-"

    const-string v3, ""

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const/16 v2, 0x10

    invoke-virtual {v0, v6, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 314
    new-instance v2, Lcom/sonymobile/scan3d/storageservice/network/Credentials;

    invoke-direct {v2, v0}, Lcom/sonymobile/scan3d/storageservice/network/Credentials;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->mCredentials:Lcom/sonymobile/scan3d/storageservice/network/Credentials;

    .line 317
    :cond_3
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->mCredentials:Lcom/sonymobile/scan3d/storageservice/network/Credentials;

    invoke-static {p0, v1, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;->executeTask(Landroid/content/Context;Landroid/content/Intent;Lcom/sonymobile/scan3d/storageservice/network/Credentials;)V

    const/4 v0, 0x3

    .line 318
    invoke-direct {p0, v0, v6}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->postLoadFragmentFromState(II)V

    :goto_2
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public onBackPressed()V
    .locals 2

    .line 190
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    const v1, 0x7f0900dc

    .line 191
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->findFragmentById(I)Landroidx/fragment/app/Fragment;

    move-result-object v0

    .line 192
    instance-of v1, v0, Lcom/sonymobile/scan3d/OnBackPressListener;

    if-eqz v1, :cond_0

    .line 193
    check-cast v0, Lcom/sonymobile/scan3d/OnBackPressListener;

    invoke-interface {v0}, Lcom/sonymobile/scan3d/OnBackPressListener;->onBackPressed()Z

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_1

    .line 198
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onBackPressed()V

    :cond_1
    return-void
.end method

.method public onCancel(I)V
    .locals 1

    if-eqz p1, :cond_0

    goto :goto_0

    .line 447
    :cond_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->mProvider:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    invoke-virtual {p1, p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->getLearnMoreIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 449
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->startActivity(Landroid/content/Intent;)V

    .line 455
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->finish()V

    const/4 p1, 0x0

    const v0, 0x10a0001

    .line 456
    invoke-virtual {p0, p1, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->overridePendingTransition(II)V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 145
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 147
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "com.sonymobile.scan3d.extra.SERVICE_PROVIDER"

    .line 148
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->mProvider:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    const v0, 0x7f0c0025

    .line 150
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->setContentView(I)V

    .line 153
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->mHandler:Landroid/os/Handler;

    if-eqz p1, :cond_0

    const-string v0, "upload"

    .line 157
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->mUploadData:Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;

    const-string v0, "credentials"

    .line 158
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/storageservice/network/Credentials;

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->mCredentials:Lcom/sonymobile/scan3d/storageservice/network/Credentials;

    const-string v0, "uid"

    .line 159
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->mUid:Ljava/lang/String;

    goto :goto_0

    .line 163
    :cond_0
    new-instance p1, Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;

    invoke-direct {p1, p0}, Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;-><init>(Landroid/content/Context;)V

    .line 164
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;->hasDataConnection()Z

    move-result p1

    if-nez p1, :cond_1

    const/4 p1, 0x2

    const v0, 0x7f10017e

    .line 166
    invoke-direct {p0, p1, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->loadFragmentFromState(II)V

    goto :goto_0

    .line 169
    :cond_1
    invoke-static {p0}, Landroidx/loader/app/LoaderManager;->getInstance(Landroidx/lifecycle/LifecycleOwner;)Landroidx/loader/app/LoaderManager;

    move-result-object p1

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 170
    invoke-virtual {p1, v0, v1, p0}, Landroidx/loader/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroidx/loader/app/LoaderManager$LoaderCallbacks;)Landroidx/loader/content/Loader;

    .line 172
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->mProvider:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    invoke-virtual {p1, p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->sendActionScreenEvent(Landroid/content/Context;)V

    :goto_0
    return-void
.end method

.method public onCreateLoader(ILandroid/os/Bundle;)Landroidx/loader/content/Loader;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/os/Bundle;",
            ")",
            "Landroidx/loader/content/Loader<",
            "Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;",
            ">;"
        }
    .end annotation

    .line 382
    new-instance p1, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadLoader;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->getIntent()Landroid/content/Intent;

    move-result-object p2

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->mProvider:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    invoke-direct {p1, p0, p2, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadLoader;-><init>(Landroid/content/Context;Landroid/content/Intent;Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;)V

    return-object p1
.end method

.method public onDismiss(I)V
    .locals 1

    .line 439
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->finish()V

    const/4 p1, 0x0

    const v0, 0x10a0001

    .line 440
    invoke-virtual {p0, p1, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->overridePendingTransition(II)V

    return-void
.end method

.method public onFailure(II)V
    .locals 0
    .param p2    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    const/4 p1, 0x2

    .line 434
    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->loadFragmentFromState(II)V

    return-void
.end method

.method public onLoadFinished(Landroidx/loader/content/Loader;Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;)V
    .locals 1
    .param p1    # Landroidx/loader/content/Loader;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/loader/content/Loader<",
            "Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;",
            ">;",
            "Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;",
            ")V"
        }
    .end annotation

    .line 387
    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->mUploadData:Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;

    .line 388
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->mUploadData:Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;->getUpload()Lcom/sonymobile/scan3d/storageservice/provider/Upload;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 390
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/provider/Upload;->isActive()Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x2

    const p2, 0x7f10033e

    .line 392
    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->postLoadFragmentFromState(II)V

    goto :goto_0

    .line 393
    :cond_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->mProvider:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    invoke-virtual {p1, p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->showInfo(Landroid/content/Context;)Z

    move-result p1

    const/4 p2, 0x0

    if-eqz p1, :cond_1

    .line 394
    invoke-direct {p0, p2, p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->postLoadFragmentFromState(II)V

    goto :goto_0

    .line 395
    :cond_1
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->mProvider:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->mUploadData:Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;

    invoke-virtual {p1, p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->needsAuthentication(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;)Z

    move-result p1

    if-eqz p1, :cond_2

    const/4 p1, 0x1

    .line 397
    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->postLoadFragmentFromState(II)V

    goto :goto_0

    .line 400
    :cond_2
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->startAction()V

    :goto_0
    return-void
.end method

.method public bridge synthetic onLoadFinished(Landroidx/loader/content/Loader;Ljava/lang/Object;)V
    .locals 0
    .param p1    # Landroidx/loader/content/Loader;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 39
    check-cast p2, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;

    invoke-virtual {p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->onLoadFinished(Landroidx/loader/content/Loader;Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;)V

    return-void
.end method

.method public onLoaderReset(Landroidx/loader/content/Loader;)V
    .locals 0
    .param p1    # Landroidx/loader/content/Loader;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/loader/content/Loader<",
            "Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;",
            ">;)V"
        }
    .end annotation

    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 179
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    const-string v0, "upload"

    .line 180
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->mUploadData:Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string v0, "credentials"

    .line 181
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->mCredentials:Lcom/sonymobile/scan3d/storageservice/network/Credentials;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string v0, "uid"

    .line 182
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->mUid:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onSuccess(ILcom/sonymobile/scan3d/storageservice/network/Credentials;)V
    .locals 2

    packed-switch p1, :pswitch_data_0

    .line 428
    new-instance p2, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onSuccess() : Unknown state: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 422
    :pswitch_0
    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->mCredentials:Lcom/sonymobile/scan3d/storageservice/network/Credentials;

    .line 424
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->startAction()V

    goto :goto_0

    .line 414
    :pswitch_1
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->mProvider:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    invoke-virtual {p1, p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->hideInfo(Landroid/content/Context;)V

    .line 415
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->mProvider:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->mUploadData:Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;

    invoke-virtual {p1, p0, p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->needsAuthentication(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    const/4 p2, 0x0

    .line 416
    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->loadFragmentFromState(II)V

    goto :goto_0

    .line 418
    :cond_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->startAction()V

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public bridge synthetic onSuccess(ILjava/lang/Object;)V
    .locals 0

    .line 39
    check-cast p2, Lcom/sonymobile/scan3d/storageservice/network/Credentials;

    invoke-virtual {p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->onSuccess(ILcom/sonymobile/scan3d/storageservice/network/Credentials;)V

    return-void
.end method
