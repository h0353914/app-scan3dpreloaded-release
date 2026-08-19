.class public Lorg/apache/log4j/Hierarchy;
.super Ljava/lang/Object;
.source "Hierarchy.java"

# interfaces
.implements Lorg/apache/log4j/spi/LoggerRepository;
.implements Lorg/apache/log4j/spi/RendererSupport;


# instance fields
.field private defaultFactory:Lorg/apache/log4j/spi/LoggerFactory;

.field emittedNoAppenderWarning:Z

.field emittedNoResourceBundleWarning:Z

.field ht:Ljava/util/Hashtable;

.field private listeners:Ljava/util/Vector;

.field rendererMap:Lorg/apache/log4j/or/RendererMap;

.field root:Lorg/apache/log4j/Logger;

.field threshold:Lorg/apache/log4j/Level;

.field thresholdInt:I


# direct methods
.method public constructor <init>(Lorg/apache/log4j/Logger;)V
    .locals 2

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 76
    iput-boolean v0, p0, Lorg/apache/log4j/Hierarchy;->emittedNoAppenderWarning:Z

    .line 77
    iput-boolean v0, p0, Lorg/apache/log4j/Hierarchy;->emittedNoResourceBundleWarning:Z

    .line 87
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/log4j/Hierarchy;->ht:Ljava/util/Hashtable;

    .line 88
    new-instance v0, Ljava/util/Vector;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/Vector;-><init>(I)V

    iput-object v0, p0, Lorg/apache/log4j/Hierarchy;->listeners:Ljava/util/Vector;

    .line 89
    iput-object p1, p0, Lorg/apache/log4j/Hierarchy;->root:Lorg/apache/log4j/Logger;

    .line 91
    sget-object p1, Lorg/apache/log4j/Level;->ALL:Lorg/apache/log4j/Level;

    invoke-virtual {p0, p1}, Lorg/apache/log4j/Hierarchy;->setThreshold(Lorg/apache/log4j/Level;)V

    .line 92
    iget-object p1, p0, Lorg/apache/log4j/Hierarchy;->root:Lorg/apache/log4j/Logger;

    invoke-virtual {p1, p0}, Lorg/apache/log4j/Category;->setHierarchy(Lorg/apache/log4j/spi/LoggerRepository;)V

    .line 93
    new-instance p1, Lorg/apache/log4j/or/RendererMap;

    invoke-direct {p1}, Lorg/apache/log4j/or/RendererMap;-><init>()V

    iput-object p1, p0, Lorg/apache/log4j/Hierarchy;->rendererMap:Lorg/apache/log4j/or/RendererMap;

    .line 94
    new-instance p1, Lorg/apache/log4j/DefaultCategoryFactory;

    invoke-direct {p1}, Lorg/apache/log4j/DefaultCategoryFactory;-><init>()V

    iput-object p1, p0, Lorg/apache/log4j/Hierarchy;->defaultFactory:Lorg/apache/log4j/spi/LoggerFactory;

    return-void
.end method

.method private final updateChildren(Lorg/apache/log4j/ProvisionNode;Lorg/apache/log4j/Logger;)V
    .locals 5

    .line 540
    invoke-virtual {p1}, Ljava/util/Vector;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-lt v1, v0, :cond_0

    return-void

    .line 543
    :cond_0
    invoke-virtual {p1, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/log4j/Logger;

    .line 548
    iget-object v3, v2, Lorg/apache/log4j/Category;->parent:Lorg/apache/log4j/Category;

    iget-object v3, v3, Lorg/apache/log4j/Category;->name:Ljava/lang/String;

    iget-object v4, p2, Lorg/apache/log4j/Category;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 549
    iget-object v3, v2, Lorg/apache/log4j/Category;->parent:Lorg/apache/log4j/Category;

    iput-object v3, p2, Lorg/apache/log4j/Category;->parent:Lorg/apache/log4j/Category;

    .line 550
    iput-object p2, v2, Lorg/apache/log4j/Category;->parent:Lorg/apache/log4j/Category;

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private final updateParents(Lorg/apache/log4j/Logger;)V
    .locals 8

    .line 484
    iget-object v0, p1, Lorg/apache/log4j/Category;->name:Ljava/lang/String;

    .line 485
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    const/16 v3, 0x2e

    .line 491
    invoke-virtual {v0, v3, v1}, Ljava/lang/String;->lastIndexOf(II)I

    move-result v1

    :goto_0
    const/4 v4, 0x0

    if-gez v1, :cond_0

    move v2, v4

    goto :goto_1

    .line 493
    :cond_0
    invoke-virtual {v0, v4, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 496
    new-instance v5, Lorg/apache/log4j/CategoryKey;

    invoke-direct {v5, v4}, Lorg/apache/log4j/CategoryKey;-><init>(Ljava/lang/String;)V

    .line 497
    iget-object v4, p0, Lorg/apache/log4j/Hierarchy;->ht:Ljava/util/Hashtable;

    invoke-virtual {v4, v5}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-nez v4, :cond_1

    .line 501
    new-instance v4, Lorg/apache/log4j/ProvisionNode;

    invoke-direct {v4, p1}, Lorg/apache/log4j/ProvisionNode;-><init>(Lorg/apache/log4j/Logger;)V

    .line 502
    iget-object v6, p0, Lorg/apache/log4j/Hierarchy;->ht:Ljava/util/Hashtable;

    invoke-virtual {v6, v5, v4}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 503
    :cond_1
    instance-of v5, v4, Lorg/apache/log4j/Category;

    if-eqz v5, :cond_3

    .line 505
    check-cast v4, Lorg/apache/log4j/Category;

    iput-object v4, p1, Lorg/apache/log4j/Category;->parent:Lorg/apache/log4j/Category;

    :goto_1
    if-nez v2, :cond_2

    .line 518
    iget-object v0, p0, Lorg/apache/log4j/Hierarchy;->root:Lorg/apache/log4j/Logger;

    iput-object v0, p1, Lorg/apache/log4j/Category;->parent:Lorg/apache/log4j/Category;

    :cond_2
    return-void

    .line 508
    :cond_3
    instance-of v5, v4, Lorg/apache/log4j/ProvisionNode;

    if-eqz v5, :cond_4

    .line 509
    check-cast v4, Lorg/apache/log4j/ProvisionNode;

    invoke-virtual {v4, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_2

    .line 511
    :cond_4
    new-instance v5, Ljava/lang/IllegalStateException;

    new-instance v6, Ljava/lang/StringBuffer;

    const-string v7, "unexpected object type "

    invoke-direct {v6, v7}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 512
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v6, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    const-string v4, " in ht."

    invoke-virtual {v6, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 511
    invoke-direct {v5, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 513
    invoke-virtual {v5}, Ljava/lang/Throwable;->printStackTrace()V

    :goto_2
    add-int/lit8 v1, v1, -0x1

    .line 492
    invoke-virtual {v0, v3, v1}, Ljava/lang/String;->lastIndexOf(II)I

    move-result v1

    goto :goto_0
.end method


# virtual methods
.method public addHierarchyEventListener(Lorg/apache/log4j/spi/HierarchyEventListener;)V
    .locals 1

    .line 107
    iget-object v0, p0, Lorg/apache/log4j/Hierarchy;->listeners:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p1, "Ignoring attempt to add an existent listener."

    .line 108
    invoke-static {p1}, Lorg/apache/log4j/helpers/LogLog;->warn(Ljava/lang/String;)V

    goto :goto_0

    .line 110
    :cond_0
    iget-object v0, p0, Lorg/apache/log4j/Hierarchy;->listeners:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method public addRenderer(Ljava/lang/Class;Lorg/apache/log4j/or/ObjectRenderer;)V
    .locals 1

    .line 102
    iget-object v0, p0, Lorg/apache/log4j/Hierarchy;->rendererMap:Lorg/apache/log4j/or/RendererMap;

    invoke-virtual {v0, p1, p2}, Lorg/apache/log4j/or/RendererMap;->put(Ljava/lang/Class;Lorg/apache/log4j/or/ObjectRenderer;)V

    return-void
.end method

.method public clear()V
    .locals 1

    .line 126
    iget-object v0, p0, Lorg/apache/log4j/Hierarchy;->ht:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->clear()V

    return-void
.end method

.method public emitNoAppenderWarning(Lorg/apache/log4j/Category;)V
    .locals 2

    .line 132
    iget-boolean v0, p0, Lorg/apache/log4j/Hierarchy;->emittedNoAppenderWarning:Z

    if-nez v0, :cond_0

    .line 133
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v1, "No appenders could be found for logger ("

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 134
    invoke-virtual {p1}, Lorg/apache/log4j/Category;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string p1, ")."

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    .line 133
    invoke-static {p1}, Lorg/apache/log4j/helpers/LogLog;->warn(Ljava/lang/String;)V

    const-string p1, "Please initialize the log4j system properly."

    .line 135
    invoke-static {p1}, Lorg/apache/log4j/helpers/LogLog;->warn(Ljava/lang/String;)V

    const/4 p1, 0x1

    .line 136
    iput-boolean p1, p0, Lorg/apache/log4j/Hierarchy;->emittedNoAppenderWarning:Z

    :cond_0
    return-void
.end method

.method public exists(Ljava/lang/String;)Lorg/apache/log4j/Logger;
    .locals 2

    .line 149
    iget-object v0, p0, Lorg/apache/log4j/Hierarchy;->ht:Ljava/util/Hashtable;

    new-instance v1, Lorg/apache/log4j/CategoryKey;

    invoke-direct {v1, p1}, Lorg/apache/log4j/CategoryKey;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 150
    instance-of v0, p1, Lorg/apache/log4j/Logger;

    if-eqz v0, :cond_0

    .line 151
    check-cast p1, Lorg/apache/log4j/Logger;

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public fireAddAppenderEvent(Lorg/apache/log4j/Category;Lorg/apache/log4j/Appender;)V
    .locals 3

    .line 187
    iget-object v0, p0, Lorg/apache/log4j/Hierarchy;->listeners:Ljava/util/Vector;

    if-eqz v0, :cond_1

    .line 188
    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-lt v1, v0, :cond_0

    goto :goto_1

    .line 191
    :cond_0
    iget-object v2, p0, Lorg/apache/log4j/Hierarchy;->listeners:Ljava/util/Vector;

    invoke-virtual {v2, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/log4j/spi/HierarchyEventListener;

    .line 192
    invoke-interface {v2, p1, p2}, Lorg/apache/log4j/spi/HierarchyEventListener;->addAppenderEvent(Lorg/apache/log4j/Category;Lorg/apache/log4j/Appender;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    return-void
.end method

.method fireRemoveAppenderEvent(Lorg/apache/log4j/Category;Lorg/apache/log4j/Appender;)V
    .locals 3

    .line 198
    iget-object v0, p0, Lorg/apache/log4j/Hierarchy;->listeners:Ljava/util/Vector;

    if-eqz v0, :cond_1

    .line 199
    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-lt v1, v0, :cond_0

    goto :goto_1

    .line 202
    :cond_0
    iget-object v2, p0, Lorg/apache/log4j/Hierarchy;->listeners:Ljava/util/Vector;

    invoke-virtual {v2, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/log4j/spi/HierarchyEventListener;

    .line 203
    invoke-interface {v2, p1, p2}, Lorg/apache/log4j/spi/HierarchyEventListener;->removeAppenderEvent(Lorg/apache/log4j/Category;Lorg/apache/log4j/Appender;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    return-void
.end method

.method public getCurrentCategories()Ljava/util/Enumeration;
    .locals 1

    .line 321
    invoke-virtual {p0}, Lorg/apache/log4j/Hierarchy;->getCurrentLoggers()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public getCurrentLoggers()Ljava/util/Enumeration;
    .locals 4

    .line 304
    new-instance v0, Ljava/util/Vector;

    iget-object v1, p0, Lorg/apache/log4j/Hierarchy;->ht:Ljava/util/Hashtable;

    invoke-virtual {v1}, Ljava/util/Hashtable;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/Vector;-><init>(I)V

    .line 306
    iget-object v1, p0, Lorg/apache/log4j/Hierarchy;->ht:Ljava/util/Hashtable;

    invoke-virtual {v1}, Ljava/util/Hashtable;->elements()Ljava/util/Enumeration;

    move-result-object v1

    .line 307
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-nez v2, :cond_1

    .line 313
    invoke-virtual {v0}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0

    .line 308
    :cond_1
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    .line 309
    instance-of v3, v2, Lorg/apache/log4j/Logger;

    if-eqz v3, :cond_0

    .line 310
    invoke-virtual {v0, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public getLogger(Ljava/lang/String;)Lorg/apache/log4j/Logger;
    .locals 1

    .line 242
    iget-object v0, p0, Lorg/apache/log4j/Hierarchy;->defaultFactory:Lorg/apache/log4j/spi/LoggerFactory;

    invoke-virtual {p0, p1, v0}, Lorg/apache/log4j/Hierarchy;->getLogger(Ljava/lang/String;Lorg/apache/log4j/spi/LoggerFactory;)Lorg/apache/log4j/Logger;

    move-result-object p1

    return-object p1
.end method

.method public getLogger(Ljava/lang/String;Lorg/apache/log4j/spi/LoggerFactory;)Lorg/apache/log4j/Logger;
    .locals 4

    .line 261
    new-instance v0, Lorg/apache/log4j/CategoryKey;

    invoke-direct {v0, p1}, Lorg/apache/log4j/CategoryKey;-><init>(Ljava/lang/String;)V

    .line 267
    iget-object v1, p0, Lorg/apache/log4j/Hierarchy;->ht:Ljava/util/Hashtable;

    monitor-enter v1

    .line 268
    :try_start_0
    iget-object v2, p0, Lorg/apache/log4j/Hierarchy;->ht:Ljava/util/Hashtable;

    invoke-virtual {v2, v0}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_0

    .line 270
    invoke-interface {p2, p1}, Lorg/apache/log4j/spi/LoggerFactory;->makeNewLoggerInstance(Ljava/lang/String;)Lorg/apache/log4j/Logger;

    move-result-object p1

    .line 271
    invoke-virtual {p1, p0}, Lorg/apache/log4j/Category;->setHierarchy(Lorg/apache/log4j/spi/LoggerRepository;)V

    .line 272
    iget-object p2, p0, Lorg/apache/log4j/Hierarchy;->ht:Ljava/util/Hashtable;

    invoke-virtual {p2, v0, p1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 273
    invoke-direct {p0, p1}, Lorg/apache/log4j/Hierarchy;->updateParents(Lorg/apache/log4j/Logger;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 267
    monitor-exit v1

    return-object p1

    .line 275
    :cond_0
    :try_start_1
    instance-of v3, v2, Lorg/apache/log4j/Logger;

    if-eqz v3, :cond_1

    .line 276
    check-cast v2, Lorg/apache/log4j/Logger;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 267
    monitor-exit v1

    return-object v2

    .line 277
    :cond_1
    :try_start_2
    instance-of v3, v2, Lorg/apache/log4j/ProvisionNode;

    if-eqz v3, :cond_2

    .line 279
    invoke-interface {p2, p1}, Lorg/apache/log4j/spi/LoggerFactory;->makeNewLoggerInstance(Ljava/lang/String;)Lorg/apache/log4j/Logger;

    move-result-object p1

    .line 280
    invoke-virtual {p1, p0}, Lorg/apache/log4j/Category;->setHierarchy(Lorg/apache/log4j/spi/LoggerRepository;)V

    .line 281
    iget-object p2, p0, Lorg/apache/log4j/Hierarchy;->ht:Ljava/util/Hashtable;

    invoke-virtual {p2, v0, p1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 282
    check-cast v2, Lorg/apache/log4j/ProvisionNode;

    invoke-direct {p0, v2, p1}, Lorg/apache/log4j/Hierarchy;->updateChildren(Lorg/apache/log4j/ProvisionNode;Lorg/apache/log4j/Logger;)V

    .line 283
    invoke-direct {p0, p1}, Lorg/apache/log4j/Hierarchy;->updateParents(Lorg/apache/log4j/Logger;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 267
    monitor-exit v1

    return-object p1

    :cond_2
    const/4 p1, 0x0

    monitor-exit v1

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit v1

    throw p1
.end method

.method public getRendererMap()Lorg/apache/log4j/or/RendererMap;
    .locals 1

    .line 330
    iget-object v0, p0, Lorg/apache/log4j/Hierarchy;->rendererMap:Lorg/apache/log4j/or/RendererMap;

    return-object v0
.end method

.method public getRootLogger()Lorg/apache/log4j/Logger;
    .locals 1

    .line 341
    iget-object v0, p0, Lorg/apache/log4j/Hierarchy;->root:Lorg/apache/log4j/Logger;

    return-object v0
.end method

.method public getThreshold()Lorg/apache/log4j/Level;
    .locals 1

    .line 215
    iget-object v0, p0, Lorg/apache/log4j/Hierarchy;->threshold:Lorg/apache/log4j/Level;

    return-object v0
.end method

.method public isDisabled(I)Z
    .locals 1

    .line 351
    iget v0, p0, Lorg/apache/log4j/Hierarchy;->thresholdInt:I

    if-gt v0, p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    :goto_0
    return p1
.end method

.method public overrideAsNeeded(Ljava/lang/String;)V
    .locals 0

    const-string p1, "The Hiearchy.overrideAsNeeded method has been deprecated."

    .line 359
    invoke-static {p1}, Lorg/apache/log4j/helpers/LogLog;->warn(Ljava/lang/String;)V

    return-void
.end method

.method public resetConfiguration()V
    .locals 5

    .line 379
    invoke-virtual {p0}, Lorg/apache/log4j/Hierarchy;->getRootLogger()Lorg/apache/log4j/Logger;

    move-result-object v0

    sget-object v1, Lorg/apache/log4j/Level;->DEBUG:Lorg/apache/log4j/Level;

    invoke-virtual {v0, v1}, Lorg/apache/log4j/Category;->setLevel(Lorg/apache/log4j/Level;)V

    .line 380
    iget-object v0, p0, Lorg/apache/log4j/Hierarchy;->root:Lorg/apache/log4j/Logger;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/apache/log4j/Category;->setResourceBundle(Ljava/util/ResourceBundle;)V

    .line 381
    sget-object v0, Lorg/apache/log4j/Level;->ALL:Lorg/apache/log4j/Level;

    invoke-virtual {p0, v0}, Lorg/apache/log4j/Hierarchy;->setThreshold(Lorg/apache/log4j/Level;)V

    .line 385
    iget-object v0, p0, Lorg/apache/log4j/Hierarchy;->ht:Ljava/util/Hashtable;

    monitor-enter v0

    .line 386
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/log4j/Hierarchy;->shutdown()V

    .line 388
    invoke-virtual {p0}, Lorg/apache/log4j/Hierarchy;->getCurrentLoggers()Ljava/util/Enumeration;

    move-result-object v2

    .line 389
    :goto_0
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v3, :cond_0

    .line 385
    monitor-exit v0

    .line 396
    iget-object v0, p0, Lorg/apache/log4j/Hierarchy;->rendererMap:Lorg/apache/log4j/or/RendererMap;

    invoke-virtual {v0}, Lorg/apache/log4j/or/RendererMap;->clear()V

    return-void

    .line 390
    :cond_0
    :try_start_1
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/log4j/Logger;

    .line 391
    invoke-virtual {v3, v1}, Lorg/apache/log4j/Category;->setLevel(Lorg/apache/log4j/Level;)V

    const/4 v4, 0x1

    .line 392
    invoke-virtual {v3, v4}, Lorg/apache/log4j/Category;->setAdditivity(Z)V

    .line 393
    invoke-virtual {v3, v1}, Lorg/apache/log4j/Category;->setResourceBundle(Ljava/util/ResourceBundle;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v1

    .line 385
    monitor-exit v0

    throw v1
.end method

.method public setDisableOverride(Ljava/lang/String;)V
    .locals 0

    const-string p1, "The Hiearchy.setDisableOverride method has been deprecated."

    .line 406
    invoke-static {p1}, Lorg/apache/log4j/helpers/LogLog;->warn(Ljava/lang/String;)V

    return-void
.end method

.method public setRenderer(Ljava/lang/Class;Lorg/apache/log4j/or/ObjectRenderer;)V
    .locals 1

    .line 416
    iget-object v0, p0, Lorg/apache/log4j/Hierarchy;->rendererMap:Lorg/apache/log4j/or/RendererMap;

    invoke-virtual {v0, p1, p2}, Lorg/apache/log4j/or/RendererMap;->put(Ljava/lang/Class;Lorg/apache/log4j/or/ObjectRenderer;)V

    return-void
.end method

.method public setThreshold(Ljava/lang/String;)V
    .locals 2

    const/4 v0, 0x0

    .line 162
    invoke-static {p1, v0}, Lorg/apache/log4j/Level;->toLevel(Ljava/lang/String;Lorg/apache/log4j/Level;)Lorg/apache/log4j/Level;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 164
    invoke-virtual {p0, v0}, Lorg/apache/log4j/Hierarchy;->setThreshold(Lorg/apache/log4j/Level;)V

    goto :goto_0

    .line 166
    :cond_0
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v1, "Could not convert ["

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string p1, "] to Level."

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lorg/apache/log4j/helpers/LogLog;->warn(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public setThreshold(Lorg/apache/log4j/Level;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 180
    iget v0, p1, Lorg/apache/log4j/Priority;->level:I

    iput v0, p0, Lorg/apache/log4j/Hierarchy;->thresholdInt:I

    .line 181
    iput-object p1, p0, Lorg/apache/log4j/Hierarchy;->threshold:Lorg/apache/log4j/Level;

    :cond_0
    return-void
.end method

.method public shutdown()V
    .locals 4

    .line 438
    invoke-virtual {p0}, Lorg/apache/log4j/Hierarchy;->getRootLogger()Lorg/apache/log4j/Logger;

    move-result-object v0

    .line 441
    invoke-virtual {v0}, Lorg/apache/log4j/Category;->closeNestedAppenders()V

    .line 443
    iget-object v1, p0, Lorg/apache/log4j/Hierarchy;->ht:Ljava/util/Hashtable;

    monitor-enter v1

    .line 444
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/log4j/Hierarchy;->getCurrentLoggers()Ljava/util/Enumeration;

    move-result-object v2

    .line 445
    :goto_0
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-nez v3, :cond_1

    .line 451
    invoke-virtual {v0}, Lorg/apache/log4j/Category;->removeAllAppenders()V

    .line 452
    invoke-virtual {p0}, Lorg/apache/log4j/Hierarchy;->getCurrentLoggers()Ljava/util/Enumeration;

    move-result-object v0

    .line 453
    :goto_1
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_0

    .line 443
    monitor-exit v1

    return-void

    .line 454
    :cond_0
    :try_start_1
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/log4j/Logger;

    .line 455
    invoke-virtual {v2}, Lorg/apache/log4j/Category;->removeAllAppenders()V

    goto :goto_1

    .line 446
    :cond_1
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/log4j/Logger;

    .line 447
    invoke-virtual {v3}, Lorg/apache/log4j/Category;->closeNestedAppenders()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 443
    monitor-exit v1

    throw v0
.end method
