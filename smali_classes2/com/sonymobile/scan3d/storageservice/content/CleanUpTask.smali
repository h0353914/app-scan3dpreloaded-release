.class final Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask;
.super Lcom/sonymobile/scan3d/storageservice/content/Task;
.source "CleanUpTask.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask$Candidate;
    }
.end annotation


# static fields
.field private static final MAX_AGE_IMPROVEMENT:I = 0x1

.field private static final MAX_SIZE:J = 0x40000000L


# instance fields
.field private mCandidates:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask$Candidate;",
            ">;"
        }
    .end annotation
.end field

.field private mTotalSize:J


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/storageservice/content/TaskService;Landroid/app/job/JobParameters;)V
    .locals 1

    const/4 v0, 0x0

    .line 142
    invoke-direct {p0, p1, p2, v0, v0}, Lcom/sonymobile/scan3d/storageservice/content/Task;-><init>(Lcom/sonymobile/scan3d/storageservice/content/TaskService;Landroid/app/job/JobParameters;ZZ)V

    const-wide/16 p1, 0x0

    .line 50
    iput-wide p1, p0, Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask;->mTotalSize:J

    .line 143
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask;->mCandidates:Ljava/util/List;

    return-void
.end method

.method private addCandidate(Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask$Candidate;)V
    .locals 4

    .line 173
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask;->mCandidates:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 174
    iget-wide v0, p0, Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask;->mTotalSize:J

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask$Candidate;->size()J

    move-result-wide v2

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask;->mTotalSize:J

    :cond_0
    return-void
.end method

.method private static handleOldImprovements(Landroid/content/Context;)V
    .locals 6

    const/4 v0, 0x1

    .line 208
    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->getImprovements(Landroid/content/Context;I)Ljava/util/ArrayList;

    move-result-object v1

    .line 210
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;

    .line 211
    invoke-virtual {v2}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->isFailed()Z

    move-result v3

    if-nez v3, :cond_2

    invoke-virtual {v2}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->isWaiting()Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_1

    .line 217
    :cond_0
    invoke-virtual {v2}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->isDownloadable()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 218
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/content/Jobs;->requestReceiveImprovementJob(Landroid/content/Context;)Z

    goto :goto_0

    .line 224
    :cond_1
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/content/Jobs;->scheduleNotificationUpdate(Landroid/content/Context;)Z

    goto :goto_0

    .line 214
    :cond_2
    :goto_1
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3, v0}, Landroid/content/ContentValues;-><init>(I)V

    const-string v4, "fail_state"

    .line 215
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 216
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    invoke-virtual {v2}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->getUri()Landroid/net/Uri;

    move-result-object v2

    const/4 v5, 0x0

    invoke-virtual {v4, v2, v3, v5, v5}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_0

    :cond_3
    return-void
.end method

.method static synthetic lambda$doWork$0(Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask$Candidate;Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask$Candidate;)I
    .locals 2

    .line 158
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask$Candidate;->modified()J

    move-result-wide v0

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask$Candidate;->modified()J

    move-result-wide p0

    sub-long/2addr v0, p0

    long-to-int p0, v0

    return p0
.end method

.method private removeCandidate(Landroid/content/Context;)Z
    .locals 7

    .line 187
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask;->mCandidates:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x0

    if-lez v0, :cond_0

    .line 188
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask;->mCandidates:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask$Candidate;

    .line 189
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask$Candidate;->size()J

    move-result-wide v2

    .line 190
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask$Candidate;->getUri()Landroid/net/Uri;

    move-result-object v4

    .line 192
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask$Candidate;->delete()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 193
    iget-wide v5, p0, Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask;->mTotalSize:J

    sub-long/2addr v5, v2

    iput-wide v5, p0, Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask;->mTotalSize:J

    .line 194
    new-instance v0, Landroid/content/ContentValues;

    const/4 v2, 0x1

    invoke-direct {v0, v2}, Landroid/content/ContentValues;-><init>(I)V

    const-string v3, "log_url"

    const/4 v5, 0x0

    .line 195
    move-object v6, v5

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v0, v3, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 196
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    invoke-virtual {p1, v4, v0, v5, v5}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p1

    if-lez p1, :cond_0

    move v1, v2

    :cond_0
    return v1
.end method


# virtual methods
.method doWork(Landroid/content/Context;Landroid/app/job/JobParameters;)V
    .locals 4

    const/4 p2, 0x0

    .line 148
    invoke-static {p1, p2, p2}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->create(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 150
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    .line 151
    new-instance v2, Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask$Candidate;

    invoke-direct {v2, v1}, Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask$Candidate;-><init>(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V

    .line 153
    invoke-virtual {v2, p1}, Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask$Candidate;->isValid(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 154
    invoke-direct {p0, v2}, Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask;->addCandidate(Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask$Candidate;)V

    goto :goto_0

    .line 158
    :cond_1
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask;->mCandidates:Ljava/util/List;

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/content/-$$Lambda$CleanUpTask$b3CA-_YHLJERmnlJB1r66bfOZNc;->INSTANCE:Lcom/sonymobile/scan3d/storageservice/content/-$$Lambda$CleanUpTask$b3CA-_YHLJERmnlJB1r66bfOZNc;

    invoke-interface {v0, v1}, Ljava/util/List;->sort(Ljava/util/Comparator;)V

    .line 160
    :goto_1
    iget-wide v0, p0, Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask;->mTotalSize:J

    const-wide/32 v2, 0x40000000

    cmp-long v0, v0, v2

    if-ltz v0, :cond_2

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask;->removeCandidate(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_1

    .line 161
    :cond_2
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask;->mCandidates:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 162
    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask;->mCandidates:Ljava/util/List;

    .line 164
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/content/CleanUpTask;->handleOldImprovements(Landroid/content/Context;)V

    return-void
.end method
