.class public abstract Lorg/apache/log4j/AppenderSkeleton;
.super Ljava/lang/Object;
.source "AppenderSkeleton.java"

# interfaces
.implements Lorg/apache/log4j/Appender;
.implements Lorg/apache/log4j/spi/OptionHandler;


# instance fields
.field protected closed:Z

.field protected errorHandler:Lorg/apache/log4j/spi/ErrorHandler;

.field protected headFilter:Lorg/apache/log4j/spi/Filter;

.field protected layout:Lorg/apache/log4j/Layout;

.field protected name:Ljava/lang/String;

.field protected tailFilter:Lorg/apache/log4j/spi/Filter;

.field protected threshold:Lorg/apache/log4j/Priority;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    new-instance v0, Lorg/apache/log4j/helpers/OnlyOnceErrorHandler;

    invoke-direct {v0}, Lorg/apache/log4j/helpers/OnlyOnceErrorHandler;-><init>()V

    iput-object v0, p0, Lorg/apache/log4j/AppenderSkeleton;->errorHandler:Lorg/apache/log4j/spi/ErrorHandler;

    const/4 v0, 0x0

    .line 64
    iput-boolean v0, p0, Lorg/apache/log4j/AppenderSkeleton;->closed:Z

    return-void
.end method


# virtual methods
.method public activateOptions()V
    .locals 0

    return-void
.end method

.method public addFilter(Lorg/apache/log4j/spi/Filter;)V
    .locals 1

    .line 82
    iget-object v0, p0, Lorg/apache/log4j/AppenderSkeleton;->headFilter:Lorg/apache/log4j/spi/Filter;

    if-nez v0, :cond_0

    .line 83
    iput-object p1, p0, Lorg/apache/log4j/AppenderSkeleton;->tailFilter:Lorg/apache/log4j/spi/Filter;

    iput-object p1, p0, Lorg/apache/log4j/AppenderSkeleton;->headFilter:Lorg/apache/log4j/spi/Filter;

    goto :goto_0

    .line 85
    :cond_0
    iget-object v0, p0, Lorg/apache/log4j/AppenderSkeleton;->tailFilter:Lorg/apache/log4j/spi/Filter;

    iput-object p1, v0, Lorg/apache/log4j/spi/Filter;->next:Lorg/apache/log4j/spi/Filter;

    .line 86
    iput-object p1, p0, Lorg/apache/log4j/AppenderSkeleton;->tailFilter:Lorg/apache/log4j/spi/Filter;

    :goto_0
    return-void
.end method

.method protected abstract append(Lorg/apache/log4j/spi/LoggingEvent;)V
.end method

.method public clearFilters()V
    .locals 1

    const/4 v0, 0x0

    .line 108
    iput-object v0, p0, Lorg/apache/log4j/AppenderSkeleton;->tailFilter:Lorg/apache/log4j/spi/Filter;

    iput-object v0, p0, Lorg/apache/log4j/AppenderSkeleton;->headFilter:Lorg/apache/log4j/spi/Filter;

    return-void
.end method

.method public abstract close()V
.end method

.method public declared-synchronized doAppend(Lorg/apache/log4j/spi/LoggingEvent;)V
    .locals 2

    monitor-enter p0

    .line 210
    :try_start_0
    iget-boolean v0, p0, Lorg/apache/log4j/AppenderSkeleton;->closed:Z

    if-eqz v0, :cond_0

    .line 211
    new-instance p1, Ljava/lang/StringBuffer;

    const-string v0, "Attempted to append to closed appender named ["

    invoke-direct {p1, v0}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lorg/apache/log4j/AppenderSkeleton;->name:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v0, "]."

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lorg/apache/log4j/helpers/LogLog;->error(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 212
    monitor-exit p0

    return-void

    .line 215
    :cond_0
    :try_start_1
    invoke-virtual {p1}, Lorg/apache/log4j/spi/LoggingEvent;->getLevel()Lorg/apache/log4j/Level;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/log4j/AppenderSkeleton;->isAsSevereAsThreshold(Lorg/apache/log4j/Priority;)Z

    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v0, :cond_1

    .line 216
    monitor-exit p0

    return-void

    .line 219
    :cond_1
    :try_start_2
    iget-object v0, p0, Lorg/apache/log4j/AppenderSkeleton;->headFilter:Lorg/apache/log4j/spi/Filter;

    :goto_0
    if-nez v0, :cond_2

    goto :goto_1

    .line 223
    :cond_2
    invoke-virtual {v0, p1}, Lorg/apache/log4j/spi/Filter;->decide(Lorg/apache/log4j/spi/LoggingEvent;)I

    move-result v1

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    .line 230
    :goto_1
    :pswitch_0
    invoke-virtual {p0, p1}, Lorg/apache/log4j/AppenderSkeleton;->append(Lorg/apache/log4j/spi/LoggingEvent;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 209
    monitor-exit p0

    return-void

    .line 226
    :pswitch_1
    :try_start_3
    iget-object v0, v0, Lorg/apache/log4j/spi/Filter;->next:Lorg/apache/log4j/spi/Filter;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 224
    :pswitch_2
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1

    nop

    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public finalize()V
    .locals 2

    .line 120
    iget-boolean v0, p0, Lorg/apache/log4j/AppenderSkeleton;->closed:Z

    if-eqz v0, :cond_0

    return-void

    .line 123
    :cond_0
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v1, "Finalizing appender named ["

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lorg/apache/log4j/AppenderSkeleton;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v1, "]."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    .line 124
    invoke-virtual {p0}, Lorg/apache/log4j/AppenderSkeleton;->close()V

    return-void
.end method

.method public getErrorHandler()Lorg/apache/log4j/spi/ErrorHandler;
    .locals 1

    .line 135
    iget-object v0, p0, Lorg/apache/log4j/AppenderSkeleton;->errorHandler:Lorg/apache/log4j/spi/ErrorHandler;

    return-object v0
.end method

.method public getFilter()Lorg/apache/log4j/spi/Filter;
    .locals 1

    .line 146
    iget-object v0, p0, Lorg/apache/log4j/AppenderSkeleton;->headFilter:Lorg/apache/log4j/spi/Filter;

    return-object v0
.end method

.method public final getFirstFilter()Lorg/apache/log4j/spi/Filter;
    .locals 1

    .line 158
    iget-object v0, p0, Lorg/apache/log4j/AppenderSkeleton;->headFilter:Lorg/apache/log4j/spi/Filter;

    return-object v0
.end method

.method public getLayout()Lorg/apache/log4j/Layout;
    .locals 1

    .line 166
    iget-object v0, p0, Lorg/apache/log4j/AppenderSkeleton;->layout:Lorg/apache/log4j/Layout;

    return-object v0
.end method

.method public final getName()Ljava/lang/String;
    .locals 1

    .line 176
    iget-object v0, p0, Lorg/apache/log4j/AppenderSkeleton;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getThreshold()Lorg/apache/log4j/Priority;
    .locals 1

    .line 186
    iget-object v0, p0, Lorg/apache/log4j/AppenderSkeleton;->threshold:Lorg/apache/log4j/Priority;

    return-object v0
.end method

.method public isAsSevereAsThreshold(Lorg/apache/log4j/Priority;)Z
    .locals 1

    .line 198
    iget-object v0, p0, Lorg/apache/log4j/AppenderSkeleton;->threshold:Lorg/apache/log4j/Priority;

    if-eqz v0, :cond_0

    invoke-virtual {p1, v0}, Lorg/apache/log4j/Priority;->isGreaterOrEqual(Lorg/apache/log4j/Priority;)Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    :goto_0
    return p1
.end method

.method public abstract requiresLayout()Z
.end method

.method public declared-synchronized setErrorHandler(Lorg/apache/log4j/spi/ErrorHandler;)V
    .locals 0

    monitor-enter p0

    if-nez p1, :cond_0

    :try_start_0
    const-string p1, "You have tried to set a null error-handler."

    .line 243
    invoke-static {p1}, Lorg/apache/log4j/helpers/LogLog;->warn(Ljava/lang/String;)V

    goto :goto_0

    .line 245
    :cond_0
    iput-object p1, p0, Lorg/apache/log4j/AppenderSkeleton;->errorHandler:Lorg/apache/log4j/spi/ErrorHandler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 239
    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public setLayout(Lorg/apache/log4j/Layout;)V
    .locals 0

    .line 257
    iput-object p1, p0, Lorg/apache/log4j/AppenderSkeleton;->layout:Lorg/apache/log4j/Layout;

    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0

    .line 266
    iput-object p1, p0, Lorg/apache/log4j/AppenderSkeleton;->name:Ljava/lang/String;

    return-void
.end method

.method public setThreshold(Lorg/apache/log4j/Priority;)V
    .locals 0

    .line 281
    iput-object p1, p0, Lorg/apache/log4j/AppenderSkeleton;->threshold:Lorg/apache/log4j/Priority;

    return-void
.end method
