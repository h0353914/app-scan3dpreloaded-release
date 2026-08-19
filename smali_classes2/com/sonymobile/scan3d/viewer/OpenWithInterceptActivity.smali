.class public Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;
.super Landroid/app/Activity;
.source "OpenWithInterceptActivity.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "OpenWithInterceptActivity"

.field private static final TEMP_FILE_NAME:Ljava/lang/String; = "temp.zip"


# instance fields
.field private mLoadedScanUri:Landroid/net/Uri;

.field private mWaitForOnboarding:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 39
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    const/4 v0, 0x1

    .line 54
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;->mWaitForOnboarding:Z

    return-void
.end method

.method static synthetic access$000(Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;)Ljava/io/File;
    .locals 0

    .line 39
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;->createTempFile()Ljava/io/File;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;)Ljava/io/File;
    .locals 0

    .line 39
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;->createDateStampedFile()Ljava/io/File;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$202(Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;Landroid/net/Uri;)Landroid/net/Uri;
    .locals 0

    .line 39
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;->mLoadedScanUri:Landroid/net/Uri;

    return-object p1
.end method

.method static synthetic access$300(Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;)V
    .locals 0

    .line 39
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;->openInViewer()V

    return-void
.end method

.method private createDateStampedFile()Ljava/io/File;
    .locals 4

    .line 172
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyyMMdd_HHmmss"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 173
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    .line 174
    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    .line 177
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;->getFilesDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/results"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 178
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 179
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_0

    .line 180
    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    .line 183
    :cond_0
    new-instance v2, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/3DCreator_"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ".obj.zip"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    return-object v2
.end method

.method private createTempFile()Ljava/io/File;
    .locals 3

    .line 191
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;->getFilesDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "temp.zip"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method private openInViewer()V
    .locals 2

    .line 160
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;->mLoadedScanUri:Landroid/net/Uri;

    if-eqz v0, :cond_0

    iget-boolean v1, p0, Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;->mWaitForOnboarding:Z

    if-nez v1, :cond_0

    .line 161
    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->showInOpenWithMode(Landroid/content/Context;Landroid/net/Uri;)V

    .line 162
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;->finish()V

    :cond_0
    return-void
.end method

.method private startScanValidation()V
    .locals 4

    .line 92
    new-instance v0, Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity$1;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity$1;-><init>(Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;)V

    const/4 v1, 0x1

    new-array v1, v1, [Landroid/net/Uri;

    .line 152
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity$1;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 0

    .line 81
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    const/4 p1, 0x0

    .line 84
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;->mWaitForOnboarding:Z

    .line 85
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;->openInViewer()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 60
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 63
    invoke-static {p0}, Lcom/sonymobile/scan3d/Scan3DApp;->isPartOfBetaProgram(Landroid/content/Context;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 64
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;->finish()V

    return-void

    .line 68
    :cond_0
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    const v0, 0x7f1001ed

    .line 69
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    .line 70
    new-instance p1, Landroid/content/Intent;

    const-class v1, Lcom/sonymobile/scan3d/storageservice/ui/activity/OnBoardingActivity;

    invoke-direct {p1, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 71
    invoke-virtual {p0, p1, v0}, Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0

    .line 73
    :cond_1
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;->mWaitForOnboarding:Z

    .line 76
    :goto_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;->startScanValidation()V

    return-void
.end method
