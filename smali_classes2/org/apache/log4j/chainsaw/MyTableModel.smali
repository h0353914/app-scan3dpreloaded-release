.class Lorg/apache/log4j/chainsaw/MyTableModel;
.super Ljavax/swing/table/AbstractTableModel;
.source "MyTableModel.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/log4j/chainsaw/MyTableModel$Processor;
    }
.end annotation


# static fields
.field private static final COL_NAMES:[Ljava/lang/String;

.field private static final DATE_FORMATTER:Ljava/text/DateFormat;

.field private static final EMPTY_LIST:[Lorg/apache/log4j/chainsaw/EventDetails;

.field private static final LOG:Lorg/apache/log4j/Logger;

.field private static final MY_COMP:Ljava/util/Comparator;

.field static synthetic class$java$lang$Boolean:Ljava/lang/Class;

.field static synthetic class$java$lang$Object:Ljava/lang/Class;

.field static synthetic class$org$apache$log4j$chainsaw$MyTableModel:Ljava/lang/Class;


# instance fields
.field private final mAllEvents:Ljava/util/SortedSet;

.field private mCategoryFilter:Ljava/lang/String;

.field private mFilteredEvents:[Lorg/apache/log4j/chainsaw/EventDetails;

.field private final mLock:Ljava/lang/Object;

.field private mMessageFilter:Ljava/lang/String;

.field private mNDCFilter:Ljava/lang/String;

.field private mPaused:Z

.field private final mPendingEvents:Ljava/util/List;

.field private mPriorityFilter:Lorg/apache/log4j/Priority;

.field private mThreadFilter:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 41
    sget-object v0, Lorg/apache/log4j/chainsaw/MyTableModel;->class$org$apache$log4j$chainsaw$MyTableModel:Ljava/lang/Class;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const-string v0, "org.apache.log4j.chainsaw.MyTableModel"

    invoke-static {v0}, Lorg/apache/log4j/chainsaw/MyTableModel;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/log4j/chainsaw/MyTableModel;->class$org$apache$log4j$chainsaw$MyTableModel:Ljava/lang/Class;

    :goto_0
    invoke-static {v0}, Lorg/apache/log4j/Logger;->getLogger(Ljava/lang/Class;)Lorg/apache/log4j/Logger;

    move-result-object v0

    sput-object v0, Lorg/apache/log4j/chainsaw/MyTableModel;->LOG:Lorg/apache/log4j/Logger;

    .line 44
    new-instance v0, Lorg/apache/log4j/chainsaw/MyTableModel$1;

    invoke-direct {v0}, Lorg/apache/log4j/chainsaw/MyTableModel$1;-><init>()V

    sput-object v0, Lorg/apache/log4j/chainsaw/MyTableModel;->MY_COMP:Ljava/util/Comparator;

    const-string v1, "Time"

    const-string v2, "Priority"

    const-string v3, "Trace"

    const-string v4, "Category"

    const-string v5, "NDC"

    const-string v6, "Message"

    .line 111
    filled-new-array/range {v1 .. v6}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/log4j/chainsaw/MyTableModel;->COL_NAMES:[Ljava/lang/String;

    const/4 v0, 0x0

    .line 115
    new-array v0, v0, [Lorg/apache/log4j/chainsaw/EventDetails;

    sput-object v0, Lorg/apache/log4j/chainsaw/MyTableModel;->EMPTY_LIST:[Lorg/apache/log4j/chainsaw/EventDetails;

    const/4 v0, 0x3

    const/4 v1, 0x2

    .line 119
    invoke-static {v0, v1}, Ljava/text/DateFormat;->getDateTimeInstance(II)Ljava/text/DateFormat;

    move-result-object v0

    .line 118
    sput-object v0, Lorg/apache/log4j/chainsaw/MyTableModel;->DATE_FORMATTER:Ljava/text/DateFormat;

    return-void
.end method

.method constructor <init>()V
    .locals 2

    .line 148
    invoke-direct {p0}, Ljavax/swing/table/AbstractTableModel;-><init>()V

    .line 122
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mLock:Ljava/lang/Object;

    .line 124
    new-instance v0, Ljava/util/TreeSet;

    sget-object v1, Lorg/apache/log4j/chainsaw/MyTableModel;->MY_COMP:Ljava/util/Comparator;

    invoke-direct {v0, v1}, Ljava/util/TreeSet;-><init>(Ljava/util/Comparator;)V

    iput-object v0, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mAllEvents:Ljava/util/SortedSet;

    .line 126
    sget-object v0, Lorg/apache/log4j/chainsaw/MyTableModel;->EMPTY_LIST:[Lorg/apache/log4j/chainsaw/EventDetails;

    iput-object v0, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mFilteredEvents:[Lorg/apache/log4j/chainsaw/EventDetails;

    .line 128
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mPendingEvents:Ljava/util/List;

    const/4 v0, 0x0

    .line 130
    iput-boolean v0, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mPaused:Z

    const-string v0, ""

    .line 133
    iput-object v0, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mThreadFilter:Ljava/lang/String;

    const-string v0, ""

    .line 135
    iput-object v0, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mMessageFilter:Ljava/lang/String;

    const-string v0, ""

    .line 137
    iput-object v0, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mNDCFilter:Ljava/lang/String;

    const-string v0, ""

    .line 139
    iput-object v0, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mCategoryFilter:Ljava/lang/String;

    .line 141
    sget-object v0, Lorg/apache/log4j/Priority;->DEBUG:Lorg/apache/log4j/Priority;

    iput-object v0, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mPriorityFilter:Lorg/apache/log4j/Priority;

    .line 149
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lorg/apache/log4j/chainsaw/MyTableModel$Processor;

    invoke-direct {v1, p0}, Lorg/apache/log4j/chainsaw/MyTableModel$Processor;-><init>(Lorg/apache/log4j/chainsaw/MyTableModel;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    const/4 v1, 0x1

    .line 150
    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 151
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method static synthetic access$0(Lorg/apache/log4j/chainsaw/MyTableModel;)Ljava/lang/Object;
    .locals 0

    .line 122
    iget-object p0, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mLock:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$1(Lorg/apache/log4j/chainsaw/MyTableModel;)Z
    .locals 0

    .line 130
    iget-boolean p0, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mPaused:Z

    return p0
.end method

.method static synthetic access$2(Lorg/apache/log4j/chainsaw/MyTableModel;)Ljava/util/List;
    .locals 0

    .line 128
    iget-object p0, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mPendingEvents:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$3(Lorg/apache/log4j/chainsaw/MyTableModel;)Ljava/util/SortedSet;
    .locals 0

    .line 124
    iget-object p0, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mAllEvents:Ljava/util/SortedSet;

    return-object p0
.end method

.method static synthetic access$4(Lorg/apache/log4j/chainsaw/MyTableModel;Lorg/apache/log4j/chainsaw/EventDetails;)Z
    .locals 0

    .line 370
    invoke-direct {p0, p1}, Lorg/apache/log4j/chainsaw/MyTableModel;->matchFilter(Lorg/apache/log4j/chainsaw/EventDetails;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$5(Lorg/apache/log4j/chainsaw/MyTableModel;Z)V
    .locals 0

    .line 329
    invoke-direct {p0, p1}, Lorg/apache/log4j/chainsaw/MyTableModel;->updateFilteredEvents(Z)V

    return-void
.end method

.method static synthetic class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 1

    .line 36
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    new-instance v0, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private matchFilter(Lorg/apache/log4j/chainsaw/EventDetails;)Z
    .locals 3

    .line 371
    invoke-virtual {p1}, Lorg/apache/log4j/chainsaw/EventDetails;->getPriority()Lorg/apache/log4j/Priority;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mPriorityFilter:Lorg/apache/log4j/Priority;

    invoke-virtual {v0, v1}, Lorg/apache/log4j/Priority;->isGreaterOrEqual(Lorg/apache/log4j/Priority;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_4

    .line 372
    invoke-virtual {p1}, Lorg/apache/log4j/chainsaw/EventDetails;->getThreadName()Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mThreadFilter:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-ltz v0, :cond_4

    .line 373
    invoke-virtual {p1}, Lorg/apache/log4j/chainsaw/EventDetails;->getCategoryName()Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mCategoryFilter:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-ltz v0, :cond_4

    .line 374
    iget-object v0, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mNDCFilter:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    .line 375
    invoke-virtual {p1}, Lorg/apache/log4j/chainsaw/EventDetails;->getNDC()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 376
    invoke-virtual {p1}, Lorg/apache/log4j/chainsaw/EventDetails;->getNDC()Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mNDCFilter:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-ltz v0, :cond_4

    .line 378
    :cond_0
    invoke-virtual {p1}, Lorg/apache/log4j/chainsaw/EventDetails;->getMessage()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x1

    if-nez p1, :cond_2

    .line 381
    iget-object p1, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mMessageFilter:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    if-eqz p1, :cond_1

    move v0, v1

    :cond_1
    return v0

    .line 383
    :cond_2
    iget-object v2, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mMessageFilter:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p1

    if-gez p1, :cond_3

    move v0, v1

    :cond_3
    return v0

    :cond_4
    return v1
.end method

.method private updateFilteredEvents(Z)V
    .locals 7

    .line 330
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 331
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 332
    iget-object v3, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mAllEvents:Ljava/util/SortedSet;

    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v3

    .line 333
    iget-object v4, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mAllEvents:Ljava/util/SortedSet;

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 335
    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_4

    .line 342
    iget-object v4, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mFilteredEvents:[Lorg/apache/log4j/chainsaw/EventDetails;

    array-length v5, v4

    const/4 v6, 0x0

    if-nez v5, :cond_1

    const/4 v4, 0x0

    goto :goto_1

    .line 344
    :cond_1
    aget-object v4, v4, v6

    .line 345
    :goto_1
    sget-object v5, Lorg/apache/log4j/chainsaw/MyTableModel;->EMPTY_LIST:[Lorg/apache/log4j/chainsaw/EventDetails;

    invoke-interface {v2, v5}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Lorg/apache/log4j/chainsaw/EventDetails;

    iput-object v5, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mFilteredEvents:[Lorg/apache/log4j/chainsaw/EventDetails;

    if-eqz p1, :cond_3

    if-eqz v4, :cond_3

    .line 348
    invoke-interface {v2, v4}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result p1

    const/4 v2, 0x1

    if-ge p1, v2, :cond_2

    .line 350
    sget-object p1, Lorg/apache/log4j/chainsaw/MyTableModel;->LOG:Lorg/apache/log4j/Logger;

    const-string v2, "In strange state"

    invoke-virtual {p1, v2}, Lorg/apache/log4j/Category;->warn(Ljava/lang/Object;)V

    .line 351
    invoke-virtual {p0}, Ljavax/swing/table/AbstractTableModel;->fireTableDataChanged()V

    goto :goto_2

    :cond_2
    sub-int/2addr p1, v2

    .line 353
    invoke-virtual {p0, v6, p1}, Ljavax/swing/table/AbstractTableModel;->fireTableRowsInserted(II)V

    goto :goto_2

    .line 356
    :cond_3
    invoke-virtual {p0}, Ljavax/swing/table/AbstractTableModel;->fireTableDataChanged()V

    .line 359
    :goto_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 360
    sget-object p1, Lorg/apache/log4j/chainsaw/MyTableModel;->LOG:Lorg/apache/log4j/Logger;

    new-instance v2, Ljava/lang/StringBuffer;

    const-string v6, "Total time [ms]: "

    invoke-direct {v2, v6}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    sub-long/2addr v4, v0

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    const-string v0, " in update, size: "

    .line 361
    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 360
    invoke-virtual {p1, v0}, Lorg/apache/log4j/Category;->debug(Ljava/lang/Object;)V

    return-void

    .line 336
    :cond_4
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/apache/log4j/chainsaw/EventDetails;

    .line 337
    invoke-direct {p0, v5}, Lorg/apache/log4j/chainsaw/MyTableModel;->matchFilter(Lorg/apache/log4j/chainsaw/EventDetails;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 338
    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method


# virtual methods
.method public addEvent(Lorg/apache/log4j/chainsaw/EventDetails;)V
    .locals 2

    .line 276
    iget-object v0, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 277
    :try_start_0
    iget-object v1, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mPendingEvents:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 276
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0

    throw p1
.end method

.method public clear()V
    .locals 2

    .line 285
    iget-object v0, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 286
    :try_start_0
    iget-object v1, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mAllEvents:Ljava/util/SortedSet;

    invoke-interface {v1}, Ljava/util/Set;->clear()V

    const/4 v1, 0x0

    .line 287
    new-array v1, v1, [Lorg/apache/log4j/chainsaw/EventDetails;

    iput-object v1, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mFilteredEvents:[Lorg/apache/log4j/chainsaw/EventDetails;

    .line 288
    iget-object v1, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mPendingEvents:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 289
    invoke-virtual {p0}, Ljavax/swing/table/AbstractTableModel;->fireTableDataChanged()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 285
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public getColumnClass(I)Ljava/lang/Class;
    .locals 1

    const/4 v0, 0x2

    if-ne p1, v0, :cond_1

    .line 181
    sget-object p1, Lorg/apache/log4j/chainsaw/MyTableModel;->class$java$lang$Boolean:Ljava/lang/Class;

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const-string p1, "java.lang.Boolean"

    invoke-static {p1}, Lorg/apache/log4j/chainsaw/MyTableModel;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    sput-object p1, Lorg/apache/log4j/chainsaw/MyTableModel;->class$java$lang$Boolean:Ljava/lang/Class;

    goto :goto_0

    :cond_1
    sget-object p1, Lorg/apache/log4j/chainsaw/MyTableModel;->class$java$lang$Object:Ljava/lang/Class;

    if-eqz p1, :cond_2

    goto :goto_0

    :cond_2
    const-string p1, "java.lang.Object"

    invoke-static {p1}, Lorg/apache/log4j/chainsaw/MyTableModel;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    sput-object p1, Lorg/apache/log4j/chainsaw/MyTableModel;->class$java$lang$Object:Ljava/lang/Class;

    :goto_0
    return-object p1
.end method

.method public getColumnCount()I
    .locals 1

    .line 169
    sget-object v0, Lorg/apache/log4j/chainsaw/MyTableModel;->COL_NAMES:[Ljava/lang/String;

    array-length v0, v0

    return v0
.end method

.method public getColumnName(I)Ljava/lang/String;
    .locals 1

    .line 175
    sget-object v0, Lorg/apache/log4j/chainsaw/MyTableModel;->COL_NAMES:[Ljava/lang/String;

    aget-object p1, v0, p1

    return-object p1
.end method

.method public getEventDetails(I)Lorg/apache/log4j/chainsaw/EventDetails;
    .locals 2

    .line 314
    iget-object v0, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 315
    :try_start_0
    iget-object v1, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mFilteredEvents:[Lorg/apache/log4j/chainsaw/EventDetails;

    aget-object p1, v1, p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 314
    monitor-exit v0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit v0

    throw p1
.end method

.method public getRowCount()I
    .locals 2

    .line 161
    iget-object v0, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 162
    :try_start_0
    iget-object v1, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mFilteredEvents:[Lorg/apache/log4j/chainsaw/EventDetails;

    array-length v1, v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 161
    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public getValueAt(II)Ljava/lang/Object;
    .locals 4

    .line 186
    iget-object v0, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 187
    :try_start_0
    iget-object v1, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mFilteredEvents:[Lorg/apache/log4j/chainsaw/EventDetails;

    aget-object p1, v1, p1

    if-nez p2, :cond_0

    .line 190
    sget-object p2, Lorg/apache/log4j/chainsaw/MyTableModel;->DATE_FORMATTER:Ljava/text/DateFormat;

    new-instance v1, Ljava/util/Date;

    invoke-virtual {p1}, Lorg/apache/log4j/chainsaw/EventDetails;->getTimeStamp()J

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {p2, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 186
    monitor-exit v0

    return-object p1

    :cond_0
    const/4 v1, 0x1

    if-ne p2, v1, :cond_1

    .line 192
    :try_start_1
    invoke-virtual {p1}, Lorg/apache/log4j/chainsaw/EventDetails;->getPriority()Lorg/apache/log4j/Priority;

    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 186
    monitor-exit v0

    return-object p1

    :cond_1
    const/4 v1, 0x2

    if-ne p2, v1, :cond_3

    .line 194
    :try_start_2
    invoke-virtual {p1}, Lorg/apache/log4j/chainsaw/EventDetails;->getThrowableStrRep()[Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_2

    .line 195
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0

    :cond_2
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 186
    :goto_0
    monitor-exit v0

    return-object p1

    :cond_3
    const/4 v1, 0x3

    if-ne p2, v1, :cond_4

    .line 197
    :try_start_3
    invoke-virtual {p1}, Lorg/apache/log4j/chainsaw/EventDetails;->getCategoryName()Ljava/lang/String;

    move-result-object p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 186
    monitor-exit v0

    return-object p1

    :cond_4
    const/4 v1, 0x4

    if-ne p2, v1, :cond_5

    .line 199
    :try_start_4
    invoke-virtual {p1}, Lorg/apache/log4j/chainsaw/EventDetails;->getNDC()Ljava/lang/String;

    move-result-object p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 186
    monitor-exit v0

    return-object p1

    .line 201
    :cond_5
    :try_start_5
    invoke-virtual {p1}, Lorg/apache/log4j/chainsaw/EventDetails;->getMessage()Ljava/lang/String;

    move-result-object p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 186
    monitor-exit v0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit v0

    throw p1
.end method

.method public isPaused()Z
    .locals 2

    .line 302
    iget-object v0, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 303
    :try_start_0
    iget-boolean v1, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mPaused:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 302
    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public setCategoryFilter(Ljava/lang/String;)V
    .locals 1

    .line 264
    iget-object v0, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 265
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mCategoryFilter:Ljava/lang/String;

    const/4 p1, 0x0

    .line 266
    invoke-direct {p0, p1}, Lorg/apache/log4j/chainsaw/MyTableModel;->updateFilteredEvents(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 264
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0

    throw p1
.end method

.method public setMessageFilter(Ljava/lang/String;)V
    .locals 1

    .line 240
    iget-object v0, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 241
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mMessageFilter:Ljava/lang/String;

    const/4 p1, 0x0

    .line 242
    invoke-direct {p0, p1}, Lorg/apache/log4j/chainsaw/MyTableModel;->updateFilteredEvents(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 240
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0

    throw p1
.end method

.method public setNDCFilter(Ljava/lang/String;)V
    .locals 1

    .line 252
    iget-object v0, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 253
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mNDCFilter:Ljava/lang/String;

    const/4 p1, 0x0

    .line 254
    invoke-direct {p0, p1}, Lorg/apache/log4j/chainsaw/MyTableModel;->updateFilteredEvents(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 252
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0

    throw p1
.end method

.method public setPriorityFilter(Lorg/apache/log4j/Priority;)V
    .locals 1

    .line 216
    iget-object v0, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 217
    :try_start_0
    iput-object p1, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mPriorityFilter:Lorg/apache/log4j/Priority;

    const/4 p1, 0x0

    .line 218
    invoke-direct {p0, p1}, Lorg/apache/log4j/chainsaw/MyTableModel;->updateFilteredEvents(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 216
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0

    throw p1
.end method

.method public setThreadFilter(Ljava/lang/String;)V
    .locals 1

    .line 228
    iget-object v0, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 229
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mThreadFilter:Ljava/lang/String;

    const/4 p1, 0x0

    .line 230
    invoke-direct {p0, p1}, Lorg/apache/log4j/chainsaw/MyTableModel;->updateFilteredEvents(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 228
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0

    throw p1
.end method

.method public toggle()V
    .locals 2

    .line 295
    iget-object v0, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 296
    :try_start_0
    iget-boolean v1, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mPaused:Z

    xor-int/lit8 v1, v1, 0x1

    iput-boolean v1, p0, Lorg/apache/log4j/chainsaw/MyTableModel;->mPaused:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 295
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method
