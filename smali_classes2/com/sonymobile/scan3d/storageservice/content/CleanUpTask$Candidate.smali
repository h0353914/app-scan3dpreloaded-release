.class Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask$Candidate;
.super Ljava/lang/Object;
.source "CleanUpTask.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Candidate"
.end annotation


# instance fields
.field private final mFile:Ljava/io/File;

.field private final mUri:Landroid/net/Uri;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V
    .locals 1

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getUri()Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask$Candidate;->mUri:Landroid/net/Uri;

    .line 74
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getLogUrl()Ljava/lang/String;

    move-result-object p1

    .line 76
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 77
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask$Candidate;->mFile:Ljava/io/File;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 79
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask$Candidate;->mFile:Ljava/io/File;

    :goto_0
    return-void
.end method


# virtual methods
.method delete()Z
    .locals 1

    .line 104
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask$Candidate;->mFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v0

    return v0
.end method

.method getUri()Landroid/net/Uri;
    .locals 1

    .line 131
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask$Candidate;->mUri:Landroid/net/Uri;

    return-object v0
.end method

.method isValid(Landroid/content/Context;)Z
    .locals 1

    .line 92
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask$Candidate;->mFile:Ljava/io/File;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 93
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask$Candidate;->mUri:Landroid/net/Uri;

    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->getImprovements(Landroid/content/Context;Landroid/net/Uri;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method modified()J
    .locals 2

    .line 122
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask$Candidate;->mFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    return-wide v0
.end method

.method size()J
    .locals 2

    .line 113
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask$Candidate;->mFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v0

    return-wide v0
.end method
