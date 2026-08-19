.class public Lorg/apache/log4j/helpers/AppenderAttachableImpl;
.super Ljava/lang/Object;
.source "AppenderAttachableImpl.java"

# interfaces
.implements Lorg/apache/log4j/spi/AppenderAttachable;


# instance fields
.field protected appenderList:Ljava/util/Vector;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public addAppender(Lorg/apache/log4j/Appender;)V
    .locals 2

    if-nez p1, :cond_0

    return-void

    .line 47
    :cond_0
    iget-object v0, p0, Lorg/apache/log4j/helpers/AppenderAttachableImpl;->appenderList:Ljava/util/Vector;

    if-nez v0, :cond_1

    .line 48
    new-instance v0, Ljava/util/Vector;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/Vector;-><init>(I)V

    iput-object v0, p0, Lorg/apache/log4j/helpers/AppenderAttachableImpl;->appenderList:Ljava/util/Vector;

    .line 50
    :cond_1
    iget-object v0, p0, Lorg/apache/log4j/helpers/AppenderAttachableImpl;->appenderList:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 51
    iget-object v0, p0, Lorg/apache/log4j/helpers/AppenderAttachableImpl;->appenderList:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    :cond_2
    return-void
.end method

.method public appendLoopOnAppenders(Lorg/apache/log4j/spi/LoggingEvent;)I
    .locals 3

    .line 61
    iget-object v0, p0, Lorg/apache/log4j/helpers/AppenderAttachableImpl;->appenderList:Ljava/util/Vector;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 62
    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    :goto_0
    if-lt v1, v0, :cond_0

    goto :goto_1

    .line 64
    :cond_0
    iget-object v2, p0, Lorg/apache/log4j/helpers/AppenderAttachableImpl;->appenderList:Ljava/util/Vector;

    invoke-virtual {v2, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/log4j/Appender;

    .line 65
    invoke-interface {v2, p1}, Lorg/apache/log4j/Appender;->doAppend(Lorg/apache/log4j/spi/LoggingEvent;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    move v0, v1

    :goto_1
    return v0
.end method

.method public getAllAppenders()Ljava/util/Enumeration;
    .locals 1

    .line 80
    iget-object v0, p0, Lorg/apache/log4j/helpers/AppenderAttachableImpl;->appenderList:Ljava/util/Vector;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 83
    :cond_0
    invoke-virtual {v0}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public getAppender(Ljava/lang/String;)Lorg/apache/log4j/Appender;
    .locals 5

    .line 95
    iget-object v0, p0, Lorg/apache/log4j/helpers/AppenderAttachableImpl;->appenderList:Ljava/util/Vector;

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    if-nez p1, :cond_0

    goto :goto_1

    .line 98
    :cond_0
    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    const/4 v2, 0x0

    :goto_0
    if-lt v2, v0, :cond_1

    return-object v1

    .line 101
    :cond_1
    iget-object v3, p0, Lorg/apache/log4j/helpers/AppenderAttachableImpl;->appenderList:Ljava/util/Vector;

    invoke-virtual {v3, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/log4j/Appender;

    .line 102
    invoke-interface {v3}, Lorg/apache/log4j/Appender;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    return-object v3

    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_3
    :goto_1
    return-object v1
.end method

.method public isAttached(Lorg/apache/log4j/Appender;)Z
    .locals 4

    .line 116
    iget-object v0, p0, Lorg/apache/log4j/helpers/AppenderAttachableImpl;->appenderList:Ljava/util/Vector;

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    if-nez p1, :cond_0

    goto :goto_1

    .line 119
    :cond_0
    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    move v2, v1

    :goto_0
    if-lt v2, v0, :cond_1

    return v1

    .line 122
    :cond_1
    iget-object v3, p0, Lorg/apache/log4j/helpers/AppenderAttachableImpl;->appenderList:Ljava/util/Vector;

    invoke-virtual {v3, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/log4j/Appender;

    if-ne v3, p1, :cond_2

    const/4 p1, 0x1

    return p1

    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_3
    :goto_1
    return v1
.end method

.method public removeAllAppenders()V
    .locals 3

    .line 136
    iget-object v0, p0, Lorg/apache/log4j/helpers/AppenderAttachableImpl;->appenderList:Ljava/util/Vector;

    if-eqz v0, :cond_1

    .line 137
    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-lt v1, v0, :cond_0

    .line 142
    iget-object v0, p0, Lorg/apache/log4j/helpers/AppenderAttachableImpl;->appenderList:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->removeAllElements()V

    const/4 v0, 0x0

    .line 143
    iput-object v0, p0, Lorg/apache/log4j/helpers/AppenderAttachableImpl;->appenderList:Ljava/util/Vector;

    goto :goto_1

    .line 139
    :cond_0
    iget-object v2, p0, Lorg/apache/log4j/helpers/AppenderAttachableImpl;->appenderList:Ljava/util/Vector;

    invoke-virtual {v2, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/log4j/Appender;

    .line 140
    invoke-interface {v2}, Lorg/apache/log4j/Appender;->close()V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    return-void
.end method

.method public removeAppender(Ljava/lang/String;)V
    .locals 3

    if-eqz p1, :cond_3

    .line 165
    iget-object v0, p0, Lorg/apache/log4j/helpers/AppenderAttachableImpl;->appenderList:Ljava/util/Vector;

    if-nez v0, :cond_0

    goto :goto_2

    .line 166
    :cond_0
    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-lt v1, v0, :cond_1

    goto :goto_1

    .line 168
    :cond_1
    iget-object v2, p0, Lorg/apache/log4j/helpers/AppenderAttachableImpl;->appenderList:Ljava/util/Vector;

    invoke-virtual {v2, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/log4j/Appender;

    invoke-interface {v2}, Lorg/apache/log4j/Appender;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 169
    iget-object p1, p0, Lorg/apache/log4j/helpers/AppenderAttachableImpl;->appenderList:Ljava/util/Vector;

    invoke-virtual {p1, v1}, Ljava/util/Vector;->removeElementAt(I)V

    :goto_1
    return-void

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    :goto_2
    return-void
.end method

.method public removeAppender(Lorg/apache/log4j/Appender;)V
    .locals 1

    if-eqz p1, :cond_1

    .line 153
    iget-object v0, p0, Lorg/apache/log4j/helpers/AppenderAttachableImpl;->appenderList:Ljava/util/Vector;

    if-nez v0, :cond_0

    goto :goto_0

    .line 155
    :cond_0
    invoke-virtual {v0, p1}, Ljava/util/Vector;->removeElement(Ljava/lang/Object;)Z

    return-void

    :cond_1
    :goto_0
    return-void
.end method
