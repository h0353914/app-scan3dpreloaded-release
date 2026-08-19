.class public Lorg/apache/log4j/Category;
.super Ljava/lang/Object;
.source "Category.java"

# interfaces
.implements Lorg/apache/log4j/spi/AppenderAttachable;


# static fields
.field private static final FQCN:Ljava/lang/String;

.field static synthetic class$org$apache$log4j$Category:Ljava/lang/Class;


# instance fields
.field aai:Lorg/apache/log4j/helpers/AppenderAttachableImpl;

.field protected additive:Z

.field protected volatile level:Lorg/apache/log4j/Level;

.field protected name:Ljava/lang/String;

.field protected volatile parent:Lorg/apache/log4j/Category;

.field protected repository:Lorg/apache/log4j/spi/LoggerRepository;

.field protected resourceBundle:Ljava/util/ResourceBundle;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 115
    sget-object v0, Lorg/apache/log4j/Category;->class$org$apache$log4j$Category:Ljava/lang/Class;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const-string v0, "org.apache.log4j.Category"

    invoke-static {v0}, Lorg/apache/log4j/Category;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/log4j/Category;->class$org$apache$log4j$Category:Ljava/lang/Class;

    :goto_0
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/log4j/Category;->FQCN:Ljava/lang/String;

    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 144
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 132
    iput-boolean v0, p0, Lorg/apache/log4j/Category;->additive:Z

    .line 145
    iput-object p1, p0, Lorg/apache/log4j/Category;->name:Ljava/lang/String;

    return-void
.end method

.method static synthetic class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 1

    .line 86
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

.method public static exists(Ljava/lang/String;)Lorg/apache/log4j/Logger;
    .locals 0

    .line 335
    invoke-static {p0}, Lorg/apache/log4j/LogManager;->exists(Ljava/lang/String;)Lorg/apache/log4j/Logger;

    move-result-object p0

    return-object p0
.end method

.method public static getCurrentCategories()Ljava/util/Enumeration;
    .locals 1

    .line 473
    invoke-static {}, Lorg/apache/log4j/LogManager;->getCurrentLoggers()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public static getDefaultHierarchy()Lorg/apache/log4j/spi/LoggerRepository;
    .locals 1

    .line 487
    invoke-static {}, Lorg/apache/log4j/LogManager;->getLoggerRepository()Lorg/apache/log4j/spi/LoggerRepository;

    move-result-object v0

    return-object v0
.end method

.method public static getInstance(Ljava/lang/Class;)Lorg/apache/log4j/Category;
    .locals 0

    .line 528
    invoke-static {p0}, Lorg/apache/log4j/LogManager;->getLogger(Ljava/lang/Class;)Lorg/apache/log4j/Logger;

    move-result-object p0

    return-object p0
.end method

.method public static getInstance(Ljava/lang/String;)Lorg/apache/log4j/Category;
    .locals 0

    .line 519
    invoke-static {p0}, Lorg/apache/log4j/LogManager;->getLogger(Ljava/lang/String;)Lorg/apache/log4j/Logger;

    move-result-object p0

    return-object p0
.end method

.method public static final getRoot()Lorg/apache/log4j/Category;
    .locals 1

    .line 584
    invoke-static {}, Lorg/apache/log4j/LogManager;->getRootLogger()Lorg/apache/log4j/Logger;

    move-result-object v0

    return-object v0
.end method

.method public static shutdown()V
    .locals 0

    .line 979
    invoke-static {}, Lorg/apache/log4j/LogManager;->shutdown()V

    return-void
.end method


# virtual methods
.method public declared-synchronized addAppender(Lorg/apache/log4j/Appender;)V
    .locals 1

    monitor-enter p0

    .line 158
    :try_start_0
    iget-object v0, p0, Lorg/apache/log4j/Category;->aai:Lorg/apache/log4j/helpers/AppenderAttachableImpl;

    if-nez v0, :cond_0

    .line 159
    new-instance v0, Lorg/apache/log4j/helpers/AppenderAttachableImpl;

    invoke-direct {v0}, Lorg/apache/log4j/helpers/AppenderAttachableImpl;-><init>()V

    iput-object v0, p0, Lorg/apache/log4j/Category;->aai:Lorg/apache/log4j/helpers/AppenderAttachableImpl;

    .line 161
    :cond_0
    iget-object v0, p0, Lorg/apache/log4j/Category;->aai:Lorg/apache/log4j/helpers/AppenderAttachableImpl;

    invoke-virtual {v0, p1}, Lorg/apache/log4j/helpers/AppenderAttachableImpl;->addAppender(Lorg/apache/log4j/Appender;)V

    .line 162
    iget-object v0, p0, Lorg/apache/log4j/Category;->repository:Lorg/apache/log4j/spi/LoggerRepository;

    invoke-interface {v0, p0, p1}, Lorg/apache/log4j/spi/LoggerRepository;->fireAddAppenderEvent(Lorg/apache/log4j/Category;Lorg/apache/log4j/Appender;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 157
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public assertLog(ZLjava/lang/String;)V
    .locals 0

    if-nez p1, :cond_0

    .line 181
    invoke-virtual {p0, p2}, Lorg/apache/log4j/Category;->error(Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public callAppenders(Lorg/apache/log4j/spi/LoggingEvent;)V
    .locals 3

    const/4 v0, 0x0

    move v1, v0

    move-object v0, p0

    :goto_0
    if-nez v0, :cond_0

    goto :goto_1

    .line 201
    :cond_0
    monitor-enter v0

    .line 202
    :try_start_0
    iget-object v2, v0, Lorg/apache/log4j/Category;->aai:Lorg/apache/log4j/helpers/AppenderAttachableImpl;

    if-eqz v2, :cond_1

    .line 203
    iget-object v2, v0, Lorg/apache/log4j/Category;->aai:Lorg/apache/log4j/helpers/AppenderAttachableImpl;

    invoke-virtual {v2, p1}, Lorg/apache/log4j/helpers/AppenderAttachableImpl;->appendLoopOnAppenders(Lorg/apache/log4j/spi/LoggingEvent;)I

    move-result v2

    add-int/2addr v1, v2

    .line 205
    :cond_1
    iget-boolean v2, v0, Lorg/apache/log4j/Category;->additive:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_3

    .line 196
    monitor-exit v0

    :goto_1
    if-nez v1, :cond_2

    .line 212
    iget-object p1, p0, Lorg/apache/log4j/Category;->repository:Lorg/apache/log4j/spi/LoggerRepository;

    invoke-interface {p1, p0}, Lorg/apache/log4j/spi/LoggerRepository;->emitNoAppenderWarning(Lorg/apache/log4j/Category;)V

    :cond_2
    return-void

    .line 201
    :cond_3
    monitor-exit v0

    .line 199
    iget-object v0, v0, Lorg/apache/log4j/Category;->parent:Lorg/apache/log4j/Category;

    goto :goto_0

    :catchall_0
    move-exception p1

    .line 201
    monitor-exit v0

    throw p1
.end method

.method declared-synchronized closeNestedAppenders()V
    .locals 3

    monitor-enter p0

    .line 223
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/log4j/Category;->getAllAppenders()Ljava/util/Enumeration;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 225
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_1

    .line 226
    :cond_1
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/log4j/Appender;

    .line 227
    instance-of v2, v1, Lorg/apache/log4j/spi/AppenderAttachable;

    if-eqz v2, :cond_0

    .line 228
    invoke-interface {v1}, Lorg/apache/log4j/Appender;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 222
    :cond_2
    :goto_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public debug(Ljava/lang/Object;)V
    .locals 3

    .line 254
    iget-object v0, p0, Lorg/apache/log4j/Category;->repository:Lorg/apache/log4j/spi/LoggerRepository;

    const/16 v1, 0x2710

    invoke-interface {v0, v1}, Lorg/apache/log4j/spi/LoggerRepository;->isDisabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 256
    :cond_0
    sget-object v0, Lorg/apache/log4j/Level;->DEBUG:Lorg/apache/log4j/Level;

    invoke-virtual {p0}, Lorg/apache/log4j/Category;->getEffectiveLevel()Lorg/apache/log4j/Level;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/log4j/Priority;->isGreaterOrEqual(Lorg/apache/log4j/Priority;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 257
    sget-object v0, Lorg/apache/log4j/Category;->FQCN:Ljava/lang/String;

    sget-object v1, Lorg/apache/log4j/Level;->DEBUG:Lorg/apache/log4j/Level;

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, p1, v2}, Lorg/apache/log4j/Category;->forcedLog(Ljava/lang/String;Lorg/apache/log4j/Priority;Ljava/lang/Object;Ljava/lang/Throwable;)V

    :cond_1
    return-void
.end method

.method public debug(Ljava/lang/Object;Ljava/lang/Throwable;)V
    .locals 2

    .line 273
    iget-object v0, p0, Lorg/apache/log4j/Category;->repository:Lorg/apache/log4j/spi/LoggerRepository;

    const/16 v1, 0x2710

    invoke-interface {v0, v1}, Lorg/apache/log4j/spi/LoggerRepository;->isDisabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 275
    :cond_0
    sget-object v0, Lorg/apache/log4j/Level;->DEBUG:Lorg/apache/log4j/Level;

    invoke-virtual {p0}, Lorg/apache/log4j/Category;->getEffectiveLevel()Lorg/apache/log4j/Level;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/log4j/Priority;->isGreaterOrEqual(Lorg/apache/log4j/Priority;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 276
    sget-object v0, Lorg/apache/log4j/Category;->FQCN:Ljava/lang/String;

    sget-object v1, Lorg/apache/log4j/Level;->DEBUG:Lorg/apache/log4j/Level;

    invoke-virtual {p0, v0, v1, p1, p2}, Lorg/apache/log4j/Category;->forcedLog(Ljava/lang/String;Lorg/apache/log4j/Priority;Ljava/lang/Object;Ljava/lang/Throwable;)V

    :cond_1
    return-void
.end method

.method public error(Ljava/lang/Object;)V
    .locals 3

    .line 299
    iget-object v0, p0, Lorg/apache/log4j/Category;->repository:Lorg/apache/log4j/spi/LoggerRepository;

    const v1, 0x9c40

    invoke-interface {v0, v1}, Lorg/apache/log4j/spi/LoggerRepository;->isDisabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 301
    :cond_0
    sget-object v0, Lorg/apache/log4j/Level;->ERROR:Lorg/apache/log4j/Level;

    invoke-virtual {p0}, Lorg/apache/log4j/Category;->getEffectiveLevel()Lorg/apache/log4j/Level;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/log4j/Priority;->isGreaterOrEqual(Lorg/apache/log4j/Priority;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 302
    sget-object v0, Lorg/apache/log4j/Category;->FQCN:Ljava/lang/String;

    sget-object v1, Lorg/apache/log4j/Level;->ERROR:Lorg/apache/log4j/Level;

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, p1, v2}, Lorg/apache/log4j/Category;->forcedLog(Ljava/lang/String;Lorg/apache/log4j/Priority;Ljava/lang/Object;Ljava/lang/Throwable;)V

    :cond_1
    return-void
.end method

.method public error(Ljava/lang/Object;Ljava/lang/Throwable;)V
    .locals 2

    .line 316
    iget-object v0, p0, Lorg/apache/log4j/Category;->repository:Lorg/apache/log4j/spi/LoggerRepository;

    const v1, 0x9c40

    invoke-interface {v0, v1}, Lorg/apache/log4j/spi/LoggerRepository;->isDisabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 318
    :cond_0
    sget-object v0, Lorg/apache/log4j/Level;->ERROR:Lorg/apache/log4j/Level;

    invoke-virtual {p0}, Lorg/apache/log4j/Category;->getEffectiveLevel()Lorg/apache/log4j/Level;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/log4j/Priority;->isGreaterOrEqual(Lorg/apache/log4j/Priority;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 319
    sget-object v0, Lorg/apache/log4j/Category;->FQCN:Ljava/lang/String;

    sget-object v1, Lorg/apache/log4j/Level;->ERROR:Lorg/apache/log4j/Level;

    invoke-virtual {p0, v0, v1, p1, p2}, Lorg/apache/log4j/Category;->forcedLog(Ljava/lang/String;Lorg/apache/log4j/Priority;Ljava/lang/Object;Ljava/lang/Throwable;)V

    :cond_1
    return-void
.end method

.method public fatal(Ljava/lang/Object;)V
    .locals 3

    .line 359
    iget-object v0, p0, Lorg/apache/log4j/Category;->repository:Lorg/apache/log4j/spi/LoggerRepository;

    const v1, 0xc350

    invoke-interface {v0, v1}, Lorg/apache/log4j/spi/LoggerRepository;->isDisabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 361
    :cond_0
    sget-object v0, Lorg/apache/log4j/Level;->FATAL:Lorg/apache/log4j/Level;

    invoke-virtual {p0}, Lorg/apache/log4j/Category;->getEffectiveLevel()Lorg/apache/log4j/Level;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/log4j/Priority;->isGreaterOrEqual(Lorg/apache/log4j/Priority;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 362
    sget-object v0, Lorg/apache/log4j/Category;->FQCN:Ljava/lang/String;

    sget-object v1, Lorg/apache/log4j/Level;->FATAL:Lorg/apache/log4j/Level;

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, p1, v2}, Lorg/apache/log4j/Category;->forcedLog(Ljava/lang/String;Lorg/apache/log4j/Priority;Ljava/lang/Object;Ljava/lang/Throwable;)V

    :cond_1
    return-void
.end method

.method public fatal(Ljava/lang/Object;Ljava/lang/Throwable;)V
    .locals 2

    .line 376
    iget-object v0, p0, Lorg/apache/log4j/Category;->repository:Lorg/apache/log4j/spi/LoggerRepository;

    const v1, 0xc350

    invoke-interface {v0, v1}, Lorg/apache/log4j/spi/LoggerRepository;->isDisabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 378
    :cond_0
    sget-object v0, Lorg/apache/log4j/Level;->FATAL:Lorg/apache/log4j/Level;

    invoke-virtual {p0}, Lorg/apache/log4j/Category;->getEffectiveLevel()Lorg/apache/log4j/Level;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/log4j/Priority;->isGreaterOrEqual(Lorg/apache/log4j/Priority;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 379
    sget-object v0, Lorg/apache/log4j/Category;->FQCN:Ljava/lang/String;

    sget-object v1, Lorg/apache/log4j/Level;->FATAL:Lorg/apache/log4j/Level;

    invoke-virtual {p0, v0, v1, p1, p2}, Lorg/apache/log4j/Category;->forcedLog(Ljava/lang/String;Lorg/apache/log4j/Priority;Ljava/lang/Object;Ljava/lang/Throwable;)V

    :cond_1
    return-void
.end method

.method protected forcedLog(Ljava/lang/String;Lorg/apache/log4j/Priority;Ljava/lang/Object;Ljava/lang/Throwable;)V
    .locals 7

    .line 388
    new-instance v6, Lorg/apache/log4j/spi/LoggingEvent;

    move-object v0, v6

    move-object v1, p1

    move-object v2, p0

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lorg/apache/log4j/spi/LoggingEvent;-><init>(Ljava/lang/String;Lorg/apache/log4j/Category;Lorg/apache/log4j/Priority;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {p0, v6}, Lorg/apache/log4j/Category;->callAppenders(Lorg/apache/log4j/spi/LoggingEvent;)V

    return-void
.end method

.method public getAdditivity()Z
    .locals 1

    .line 397
    iget-boolean v0, p0, Lorg/apache/log4j/Category;->additive:Z

    return v0
.end method

.method public declared-synchronized getAllAppenders()Ljava/util/Enumeration;
    .locals 1

    monitor-enter p0

    .line 409
    :try_start_0
    iget-object v0, p0, Lorg/apache/log4j/Category;->aai:Lorg/apache/log4j/helpers/AppenderAttachableImpl;

    if-nez v0, :cond_0

    .line 410
    invoke-static {}, Lorg/apache/log4j/helpers/NullEnumeration;->getInstance()Lorg/apache/log4j/helpers/NullEnumeration;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 412
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/apache/log4j/Category;->aai:Lorg/apache/log4j/helpers/AppenderAttachableImpl;

    invoke-virtual {v0}, Lorg/apache/log4j/helpers/AppenderAttachableImpl;->getAllAppenders()Ljava/util/Enumeration;

    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getAppender(Ljava/lang/String;)Lorg/apache/log4j/Appender;
    .locals 1

    monitor-enter p0

    .line 423
    :try_start_0
    iget-object v0, p0, Lorg/apache/log4j/Category;->aai:Lorg/apache/log4j/helpers/AppenderAttachableImpl;

    if-eqz v0, :cond_1

    if-nez p1, :cond_0

    goto :goto_0

    .line 426
    :cond_0
    iget-object v0, p0, Lorg/apache/log4j/Category;->aai:Lorg/apache/log4j/helpers/AppenderAttachableImpl;

    invoke-virtual {v0, p1}, Lorg/apache/log4j/helpers/AppenderAttachableImpl;->getAppender(Ljava/lang/String;)Lorg/apache/log4j/Appender;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    .line 424
    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public getChainedPriority()Lorg/apache/log4j/Priority;
    .locals 2

    move-object v0, p0

    :goto_0
    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 454
    :cond_0
    iget-object v1, v0, Lorg/apache/log4j/Category;->level:Lorg/apache/log4j/Level;

    if-eqz v1, :cond_1

    .line 455
    iget-object v0, v0, Lorg/apache/log4j/Category;->level:Lorg/apache/log4j/Level;

    return-object v0

    .line 453
    :cond_1
    iget-object v0, v0, Lorg/apache/log4j/Category;->parent:Lorg/apache/log4j/Category;

    goto :goto_0
.end method

.method public getEffectiveLevel()Lorg/apache/log4j/Level;
    .locals 2

    move-object v0, p0

    :goto_0
    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 440
    :cond_0
    iget-object v1, v0, Lorg/apache/log4j/Category;->level:Lorg/apache/log4j/Level;

    if-eqz v1, :cond_1

    .line 441
    iget-object v0, v0, Lorg/apache/log4j/Category;->level:Lorg/apache/log4j/Level;

    return-object v0

    .line 439
    :cond_1
    iget-object v0, v0, Lorg/apache/log4j/Category;->parent:Lorg/apache/log4j/Category;

    goto :goto_0
.end method

.method public getHierarchy()Lorg/apache/log4j/spi/LoggerRepository;
    .locals 1

    .line 499
    iget-object v0, p0, Lorg/apache/log4j/Category;->repository:Lorg/apache/log4j/spi/LoggerRepository;

    return-object v0
.end method

.method public final getLevel()Lorg/apache/log4j/Level;
    .locals 1

    .line 564
    iget-object v0, p0, Lorg/apache/log4j/Category;->level:Lorg/apache/log4j/Level;

    return-object v0
.end method

.method public getLoggerRepository()Lorg/apache/log4j/spi/LoggerRepository;
    .locals 1

    .line 509
    iget-object v0, p0, Lorg/apache/log4j/Category;->repository:Lorg/apache/log4j/spi/LoggerRepository;

    return-object v0
.end method

.method public final getName()Ljava/lang/String;
    .locals 1

    .line 537
    iget-object v0, p0, Lorg/apache/log4j/Category;->name:Ljava/lang/String;

    return-object v0
.end method

.method public final getParent()Lorg/apache/log4j/Category;
    .locals 1

    .line 552
    iget-object v0, p0, Lorg/apache/log4j/Category;->parent:Lorg/apache/log4j/Category;

    return-object v0
.end method

.method public final getPriority()Lorg/apache/log4j/Level;
    .locals 1

    .line 573
    iget-object v0, p0, Lorg/apache/log4j/Category;->level:Lorg/apache/log4j/Level;

    return-object v0
.end method

.method public getResourceBundle()Ljava/util/ResourceBundle;
    .locals 2

    move-object v0, p0

    :goto_0
    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 601
    :cond_0
    iget-object v1, v0, Lorg/apache/log4j/Category;->resourceBundle:Ljava/util/ResourceBundle;

    if-eqz v1, :cond_1

    return-object v1

    .line 600
    :cond_1
    iget-object v0, v0, Lorg/apache/log4j/Category;->parent:Lorg/apache/log4j/Category;

    goto :goto_0
.end method

.method protected getResourceBundleString(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 618
    invoke-virtual {p0}, Lorg/apache/log4j/Category;->getResourceBundle()Ljava/util/ResourceBundle;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 630
    :cond_0
    :try_start_0
    invoke-virtual {v0, p1}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/util/MissingResourceException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    .line 633
    :catch_0
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v2, "No resource is associated with key \""

    invoke-direct {v0, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string p1, "\"."

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/apache/log4j/Category;->error(Ljava/lang/Object;)V

    return-object v1
.end method

.method public info(Ljava/lang/Object;)V
    .locals 3

    .line 660
    iget-object v0, p0, Lorg/apache/log4j/Category;->repository:Lorg/apache/log4j/spi/LoggerRepository;

    const/16 v1, 0x4e20

    invoke-interface {v0, v1}, Lorg/apache/log4j/spi/LoggerRepository;->isDisabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 662
    :cond_0
    sget-object v0, Lorg/apache/log4j/Level;->INFO:Lorg/apache/log4j/Level;

    invoke-virtual {p0}, Lorg/apache/log4j/Category;->getEffectiveLevel()Lorg/apache/log4j/Level;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/log4j/Priority;->isGreaterOrEqual(Lorg/apache/log4j/Priority;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 663
    sget-object v0, Lorg/apache/log4j/Category;->FQCN:Ljava/lang/String;

    sget-object v1, Lorg/apache/log4j/Level;->INFO:Lorg/apache/log4j/Level;

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, p1, v2}, Lorg/apache/log4j/Category;->forcedLog(Ljava/lang/String;Lorg/apache/log4j/Priority;Ljava/lang/Object;Ljava/lang/Throwable;)V

    :cond_1
    return-void
.end method

.method public info(Ljava/lang/Object;Ljava/lang/Throwable;)V
    .locals 2

    .line 677
    iget-object v0, p0, Lorg/apache/log4j/Category;->repository:Lorg/apache/log4j/spi/LoggerRepository;

    const/16 v1, 0x4e20

    invoke-interface {v0, v1}, Lorg/apache/log4j/spi/LoggerRepository;->isDisabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 679
    :cond_0
    sget-object v0, Lorg/apache/log4j/Level;->INFO:Lorg/apache/log4j/Level;

    invoke-virtual {p0}, Lorg/apache/log4j/Category;->getEffectiveLevel()Lorg/apache/log4j/Level;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/log4j/Priority;->isGreaterOrEqual(Lorg/apache/log4j/Priority;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 680
    sget-object v0, Lorg/apache/log4j/Category;->FQCN:Ljava/lang/String;

    sget-object v1, Lorg/apache/log4j/Level;->INFO:Lorg/apache/log4j/Level;

    invoke-virtual {p0, v0, v1, p1, p2}, Lorg/apache/log4j/Category;->forcedLog(Ljava/lang/String;Lorg/apache/log4j/Priority;Ljava/lang/Object;Ljava/lang/Throwable;)V

    :cond_1
    return-void
.end method

.method public isAttached(Lorg/apache/log4j/Appender;)Z
    .locals 1

    if-eqz p1, :cond_1

    .line 688
    iget-object v0, p0, Lorg/apache/log4j/Category;->aai:Lorg/apache/log4j/helpers/AppenderAttachableImpl;

    if-nez v0, :cond_0

    goto :goto_0

    .line 691
    :cond_0
    invoke-virtual {v0, p1}, Lorg/apache/log4j/helpers/AppenderAttachableImpl;->isAttached(Lorg/apache/log4j/Appender;)Z

    move-result p1

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public isDebugEnabled()Z
    .locals 2

    .line 731
    iget-object v0, p0, Lorg/apache/log4j/Category;->repository:Lorg/apache/log4j/spi/LoggerRepository;

    const/16 v1, 0x2710

    invoke-interface {v0, v1}, Lorg/apache/log4j/spi/LoggerRepository;->isDisabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 733
    :cond_0
    sget-object v0, Lorg/apache/log4j/Level;->DEBUG:Lorg/apache/log4j/Level;

    invoke-virtual {p0}, Lorg/apache/log4j/Category;->getEffectiveLevel()Lorg/apache/log4j/Level;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/log4j/Priority;->isGreaterOrEqual(Lorg/apache/log4j/Priority;)Z

    move-result v0

    return v0
.end method

.method public isEnabledFor(Lorg/apache/log4j/Priority;)Z
    .locals 2

    .line 746
    iget-object v0, p0, Lorg/apache/log4j/Category;->repository:Lorg/apache/log4j/spi/LoggerRepository;

    iget v1, p1, Lorg/apache/log4j/Priority;->level:I

    invoke-interface {v0, v1}, Lorg/apache/log4j/spi/LoggerRepository;->isDisabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    return p1

    .line 748
    :cond_0
    invoke-virtual {p0}, Lorg/apache/log4j/Category;->getEffectiveLevel()Lorg/apache/log4j/Level;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/apache/log4j/Priority;->isGreaterOrEqual(Lorg/apache/log4j/Priority;)Z

    move-result p1

    return p1
.end method

.method public isInfoEnabled()Z
    .locals 2

    .line 760
    iget-object v0, p0, Lorg/apache/log4j/Category;->repository:Lorg/apache/log4j/spi/LoggerRepository;

    const/16 v1, 0x4e20

    invoke-interface {v0, v1}, Lorg/apache/log4j/spi/LoggerRepository;->isDisabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 762
    :cond_0
    sget-object v0, Lorg/apache/log4j/Level;->INFO:Lorg/apache/log4j/Level;

    invoke-virtual {p0}, Lorg/apache/log4j/Category;->getEffectiveLevel()Lorg/apache/log4j/Level;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/log4j/Priority;->isGreaterOrEqual(Lorg/apache/log4j/Priority;)Z

    move-result v0

    return v0
.end method

.method public l7dlog(Lorg/apache/log4j/Priority;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2

    .line 776
    iget-object v0, p0, Lorg/apache/log4j/Category;->repository:Lorg/apache/log4j/spi/LoggerRepository;

    iget v1, p1, Lorg/apache/log4j/Priority;->level:I

    invoke-interface {v0, v1}, Lorg/apache/log4j/spi/LoggerRepository;->isDisabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 779
    :cond_0
    invoke-virtual {p0}, Lorg/apache/log4j/Category;->getEffectiveLevel()Lorg/apache/log4j/Level;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/apache/log4j/Priority;->isGreaterOrEqual(Lorg/apache/log4j/Priority;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 780
    invoke-virtual {p0, p2}, Lorg/apache/log4j/Category;->getResourceBundleString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    move-object p2, v0

    .line 786
    :goto_0
    sget-object v0, Lorg/apache/log4j/Category;->FQCN:Ljava/lang/String;

    invoke-virtual {p0, v0, p1, p2, p3}, Lorg/apache/log4j/Category;->forcedLog(Ljava/lang/String;Lorg/apache/log4j/Priority;Ljava/lang/Object;Ljava/lang/Throwable;)V

    :cond_2
    return-void
.end method

.method public l7dlog(Lorg/apache/log4j/Priority;Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V
    .locals 2

    .line 800
    iget-object v0, p0, Lorg/apache/log4j/Category;->repository:Lorg/apache/log4j/spi/LoggerRepository;

    iget v1, p1, Lorg/apache/log4j/Priority;->level:I

    invoke-interface {v0, v1}, Lorg/apache/log4j/spi/LoggerRepository;->isDisabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 803
    :cond_0
    invoke-virtual {p0}, Lorg/apache/log4j/Category;->getEffectiveLevel()Lorg/apache/log4j/Level;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/apache/log4j/Priority;->isGreaterOrEqual(Lorg/apache/log4j/Priority;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 804
    invoke-virtual {p0, p2}, Lorg/apache/log4j/Category;->getResourceBundleString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    goto :goto_0

    .line 809
    :cond_1
    invoke-static {v0, p3}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 810
    :goto_0
    sget-object p3, Lorg/apache/log4j/Category;->FQCN:Ljava/lang/String;

    invoke-virtual {p0, p3, p1, p2, p4}, Lorg/apache/log4j/Category;->forcedLog(Ljava/lang/String;Lorg/apache/log4j/Priority;Ljava/lang/Object;Ljava/lang/Throwable;)V

    :cond_2
    return-void
.end method

.method public log(Ljava/lang/String;Lorg/apache/log4j/Priority;Ljava/lang/Object;Ljava/lang/Throwable;)V
    .locals 2

    .line 849
    iget-object v0, p0, Lorg/apache/log4j/Category;->repository:Lorg/apache/log4j/spi/LoggerRepository;

    iget v1, p2, Lorg/apache/log4j/Priority;->level:I

    invoke-interface {v0, v1}, Lorg/apache/log4j/spi/LoggerRepository;->isDisabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 852
    :cond_0
    invoke-virtual {p0}, Lorg/apache/log4j/Category;->getEffectiveLevel()Lorg/apache/log4j/Level;

    move-result-object v0

    invoke-virtual {p2, v0}, Lorg/apache/log4j/Priority;->isGreaterOrEqual(Lorg/apache/log4j/Priority;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 853
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/apache/log4j/Category;->forcedLog(Ljava/lang/String;Lorg/apache/log4j/Priority;Ljava/lang/Object;Ljava/lang/Throwable;)V

    :cond_1
    return-void
.end method

.method public log(Lorg/apache/log4j/Priority;Ljava/lang/Object;)V
    .locals 2

    .line 831
    iget-object v0, p0, Lorg/apache/log4j/Category;->repository:Lorg/apache/log4j/spi/LoggerRepository;

    iget v1, p1, Lorg/apache/log4j/Priority;->level:I

    invoke-interface {v0, v1}, Lorg/apache/log4j/spi/LoggerRepository;->isDisabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 834
    :cond_0
    invoke-virtual {p0}, Lorg/apache/log4j/Category;->getEffectiveLevel()Lorg/apache/log4j/Level;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/apache/log4j/Priority;->isGreaterOrEqual(Lorg/apache/log4j/Priority;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 835
    sget-object v0, Lorg/apache/log4j/Category;->FQCN:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, p2, v1}, Lorg/apache/log4j/Category;->forcedLog(Ljava/lang/String;Lorg/apache/log4j/Priority;Ljava/lang/Object;Ljava/lang/Throwable;)V

    :cond_1
    return-void
.end method

.method public log(Lorg/apache/log4j/Priority;Ljava/lang/Object;Ljava/lang/Throwable;)V
    .locals 2

    .line 819
    iget-object v0, p0, Lorg/apache/log4j/Category;->repository:Lorg/apache/log4j/spi/LoggerRepository;

    iget v1, p1, Lorg/apache/log4j/Priority;->level:I

    invoke-interface {v0, v1}, Lorg/apache/log4j/spi/LoggerRepository;->isDisabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 822
    :cond_0
    invoke-virtual {p0}, Lorg/apache/log4j/Category;->getEffectiveLevel()Lorg/apache/log4j/Level;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/apache/log4j/Priority;->isGreaterOrEqual(Lorg/apache/log4j/Priority;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 823
    sget-object v0, Lorg/apache/log4j/Category;->FQCN:Ljava/lang/String;

    invoke-virtual {p0, v0, p1, p2, p3}, Lorg/apache/log4j/Category;->forcedLog(Ljava/lang/String;Lorg/apache/log4j/Priority;Ljava/lang/Object;Ljava/lang/Throwable;)V

    :cond_1
    return-void
.end method

.method public declared-synchronized removeAllAppenders()V
    .locals 1

    monitor-enter p0

    .line 867
    :try_start_0
    iget-object v0, p0, Lorg/apache/log4j/Category;->aai:Lorg/apache/log4j/helpers/AppenderAttachableImpl;

    if-eqz v0, :cond_0

    .line 868
    iget-object v0, p0, Lorg/apache/log4j/Category;->aai:Lorg/apache/log4j/helpers/AppenderAttachableImpl;

    invoke-virtual {v0}, Lorg/apache/log4j/helpers/AppenderAttachableImpl;->removeAllAppenders()V

    const/4 v0, 0x0

    .line 869
    iput-object v0, p0, Lorg/apache/log4j/Category;->aai:Lorg/apache/log4j/helpers/AppenderAttachableImpl;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 866
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized removeAppender(Ljava/lang/String;)V
    .locals 1

    monitor-enter p0

    if-eqz p1, :cond_1

    .line 894
    :try_start_0
    iget-object v0, p0, Lorg/apache/log4j/Category;->aai:Lorg/apache/log4j/helpers/AppenderAttachableImpl;

    if-nez v0, :cond_0

    goto :goto_0

    .line 895
    :cond_0
    iget-object v0, p0, Lorg/apache/log4j/Category;->aai:Lorg/apache/log4j/helpers/AppenderAttachableImpl;

    invoke-virtual {v0, p1}, Lorg/apache/log4j/helpers/AppenderAttachableImpl;->removeAppender(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 893
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1

    .line 894
    :cond_1
    :goto_0
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized removeAppender(Lorg/apache/log4j/Appender;)V
    .locals 1

    monitor-enter p0

    if-eqz p1, :cond_1

    .line 881
    :try_start_0
    iget-object v0, p0, Lorg/apache/log4j/Category;->aai:Lorg/apache/log4j/helpers/AppenderAttachableImpl;

    if-nez v0, :cond_0

    goto :goto_0

    .line 883
    :cond_0
    iget-object v0, p0, Lorg/apache/log4j/Category;->aai:Lorg/apache/log4j/helpers/AppenderAttachableImpl;

    invoke-virtual {v0, p1}, Lorg/apache/log4j/helpers/AppenderAttachableImpl;->removeAppender(Lorg/apache/log4j/Appender;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 880
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1

    .line 882
    :cond_1
    :goto_0
    monitor-exit p0

    return-void
.end method

.method public setAdditivity(Z)V
    .locals 0

    .line 904
    iput-boolean p1, p0, Lorg/apache/log4j/Category;->additive:Z

    return-void
.end method

.method final setHierarchy(Lorg/apache/log4j/spi/LoggerRepository;)V
    .locals 0

    .line 912
    iput-object p1, p0, Lorg/apache/log4j/Category;->repository:Lorg/apache/log4j/spi/LoggerRepository;

    return-void
.end method

.method public setLevel(Lorg/apache/log4j/Level;)V
    .locals 0

    .line 928
    iput-object p1, p0, Lorg/apache/log4j/Category;->level:Lorg/apache/log4j/Level;

    return-void
.end method

.method public setPriority(Lorg/apache/log4j/Priority;)V
    .locals 0

    .line 941
    check-cast p1, Lorg/apache/log4j/Level;

    iput-object p1, p0, Lorg/apache/log4j/Category;->level:Lorg/apache/log4j/Level;

    return-void
.end method

.method public setResourceBundle(Ljava/util/ResourceBundle;)V
    .locals 0

    .line 954
    iput-object p1, p0, Lorg/apache/log4j/Category;->resourceBundle:Ljava/util/ResourceBundle;

    return-void
.end method

.method public warn(Ljava/lang/Object;)V
    .locals 3

    .line 1004
    iget-object v0, p0, Lorg/apache/log4j/Category;->repository:Lorg/apache/log4j/spi/LoggerRepository;

    const/16 v1, 0x7530

    invoke-interface {v0, v1}, Lorg/apache/log4j/spi/LoggerRepository;->isDisabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 1007
    :cond_0
    sget-object v0, Lorg/apache/log4j/Level;->WARN:Lorg/apache/log4j/Level;

    invoke-virtual {p0}, Lorg/apache/log4j/Category;->getEffectiveLevel()Lorg/apache/log4j/Level;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/log4j/Priority;->isGreaterOrEqual(Lorg/apache/log4j/Priority;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1008
    sget-object v0, Lorg/apache/log4j/Category;->FQCN:Ljava/lang/String;

    sget-object v1, Lorg/apache/log4j/Level;->WARN:Lorg/apache/log4j/Level;

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, p1, v2}, Lorg/apache/log4j/Category;->forcedLog(Ljava/lang/String;Lorg/apache/log4j/Priority;Ljava/lang/Object;Ljava/lang/Throwable;)V

    :cond_1
    return-void
.end method

.method public warn(Ljava/lang/Object;Ljava/lang/Throwable;)V
    .locals 2

    .line 1022
    iget-object v0, p0, Lorg/apache/log4j/Category;->repository:Lorg/apache/log4j/spi/LoggerRepository;

    const/16 v1, 0x7530

    invoke-interface {v0, v1}, Lorg/apache/log4j/spi/LoggerRepository;->isDisabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 1024
    :cond_0
    sget-object v0, Lorg/apache/log4j/Level;->WARN:Lorg/apache/log4j/Level;

    invoke-virtual {p0}, Lorg/apache/log4j/Category;->getEffectiveLevel()Lorg/apache/log4j/Level;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/log4j/Priority;->isGreaterOrEqual(Lorg/apache/log4j/Priority;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1025
    sget-object v0, Lorg/apache/log4j/Category;->FQCN:Ljava/lang/String;

    sget-object v1, Lorg/apache/log4j/Level;->WARN:Lorg/apache/log4j/Level;

    invoke-virtual {p0, v0, v1, p1, p2}, Lorg/apache/log4j/Category;->forcedLog(Ljava/lang/String;Lorg/apache/log4j/Priority;Ljava/lang/Object;Ljava/lang/Throwable;)V

    :cond_1
    return-void
.end method
