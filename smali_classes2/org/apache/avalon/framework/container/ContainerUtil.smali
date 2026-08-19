.class public final Lorg/apache/avalon/framework/container/ContainerUtil;
.super Ljava/lang/Object;
.source "ContainerUtil.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static compose(Ljava/lang/Object;Lorg/apache/avalon/framework/component/ComponentManager;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/avalon/framework/component/ComponentException;
        }
    .end annotation

    .line 157
    instance-of v0, p0, Lorg/apache/avalon/framework/component/Composable;

    if-eqz v0, :cond_1

    if-eqz p1, :cond_0

    .line 164
    check-cast p0, Lorg/apache/avalon/framework/component/Composable;

    invoke-interface {p0, p1}, Lorg/apache/avalon/framework/component/Composable;->compose(Lorg/apache/avalon/framework/component/ComponentManager;)V

    goto :goto_0

    .line 162
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "componentManager is null"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    :goto_0
    return-void
.end method

.method public static configure(Ljava/lang/Object;Lorg/apache/avalon/framework/configuration/Configuration;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/avalon/framework/configuration/ConfigurationException;
        }
    .end annotation

    .line 185
    instance-of v0, p0, Lorg/apache/avalon/framework/configuration/Configurable;

    if-eqz v0, :cond_1

    if-eqz p1, :cond_0

    .line 192
    check-cast p0, Lorg/apache/avalon/framework/configuration/Configurable;

    invoke-interface {p0, p1}, Lorg/apache/avalon/framework/configuration/Configurable;->configure(Lorg/apache/avalon/framework/configuration/Configuration;)V

    goto :goto_0

    .line 190
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "configuration is null"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    :goto_0
    return-void
.end method

.method public static contextualize(Ljava/lang/Object;Lorg/apache/avalon/framework/context/Context;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/avalon/framework/context/ContextException;
        }
    .end annotation

    .line 100
    instance-of v0, p0, Lorg/apache/avalon/framework/context/Contextualizable;

    if-eqz v0, :cond_1

    if-eqz p1, :cond_0

    .line 107
    check-cast p0, Lorg/apache/avalon/framework/context/Contextualizable;

    invoke-interface {p0, p1}, Lorg/apache/avalon/framework/context/Contextualizable;->contextualize(Lorg/apache/avalon/framework/context/Context;)V

    goto :goto_0

    .line 105
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "context is null"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    :goto_0
    return-void
.end method

.method public static dispose(Ljava/lang/Object;)V
    .locals 1

    .line 279
    instance-of v0, p0, Lorg/apache/avalon/framework/activity/Disposable;

    if-eqz v0, :cond_0

    .line 281
    check-cast p0, Lorg/apache/avalon/framework/activity/Disposable;

    invoke-interface {p0}, Lorg/apache/avalon/framework/activity/Disposable;->dispose()V

    :cond_0
    return-void
.end method

.method public static enableLogging(Ljava/lang/Object;Lorg/apache/avalon/framework/logger/Logger;)V
    .locals 1

    .line 73
    instance-of v0, p0, Lorg/apache/avalon/framework/logger/LogEnabled;

    if-eqz v0, :cond_1

    if-eqz p1, :cond_0

    .line 80
    check-cast p0, Lorg/apache/avalon/framework/logger/LogEnabled;

    invoke-interface {p0, p1}, Lorg/apache/avalon/framework/logger/LogEnabled;->enableLogging(Lorg/apache/avalon/framework/logger/Logger;)V

    goto :goto_0

    .line 78
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "logger is null"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    :goto_0
    return-void
.end method

.method public static initialize(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 233
    instance-of v0, p0, Lorg/apache/avalon/framework/activity/Initializable;

    if-eqz v0, :cond_0

    .line 235
    check-cast p0, Lorg/apache/avalon/framework/activity/Initializable;

    invoke-interface {p0}, Lorg/apache/avalon/framework/activity/Initializable;->initialize()V

    :cond_0
    return-void
.end method

.method public static parameterize(Ljava/lang/Object;Lorg/apache/avalon/framework/parameters/Parameters;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/avalon/framework/parameters/ParameterException;
        }
    .end annotation

    .line 212
    instance-of v0, p0, Lorg/apache/avalon/framework/parameters/Parameterizable;

    if-eqz v0, :cond_1

    if-eqz p1, :cond_0

    .line 219
    check-cast p0, Lorg/apache/avalon/framework/parameters/Parameterizable;

    invoke-interface {p0, p1}, Lorg/apache/avalon/framework/parameters/Parameterizable;->parameterize(Lorg/apache/avalon/framework/parameters/Parameters;)V

    goto :goto_0

    .line 217
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "parameters is null"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    :goto_0
    return-void
.end method

.method public static service(Ljava/lang/Object;Lorg/apache/avalon/framework/service/ServiceManager;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/avalon/framework/service/ServiceException;
        }
    .end annotation

    .line 127
    instance-of v0, p0, Lorg/apache/avalon/framework/service/Serviceable;

    if-eqz v0, :cond_1

    if-eqz p1, :cond_0

    .line 134
    check-cast p0, Lorg/apache/avalon/framework/service/Serviceable;

    invoke-interface {p0, p1}, Lorg/apache/avalon/framework/service/Serviceable;->service(Lorg/apache/avalon/framework/service/ServiceManager;)V

    goto :goto_0

    .line 132
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "ServiceManager is null"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    :goto_0
    return-void
.end method

.method public static shutdown(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 57
    invoke-static {p0}, Lorg/apache/avalon/framework/container/ContainerUtil;->stop(Ljava/lang/Object;)V

    .line 58
    invoke-static {p0}, Lorg/apache/avalon/framework/container/ContainerUtil;->dispose(Ljava/lang/Object;)V

    return-void
.end method

.method public static start(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 249
    instance-of v0, p0, Lorg/apache/avalon/framework/activity/Startable;

    if-eqz v0, :cond_0

    .line 251
    check-cast p0, Lorg/apache/avalon/framework/activity/Startable;

    invoke-interface {p0}, Lorg/apache/avalon/framework/activity/Startable;->start()V

    :cond_0
    return-void
.end method

.method public static stop(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 265
    instance-of v0, p0, Lorg/apache/avalon/framework/activity/Startable;

    if-eqz v0, :cond_0

    .line 267
    check-cast p0, Lorg/apache/avalon/framework/activity/Startable;

    invoke-interface {p0}, Lorg/apache/avalon/framework/activity/Startable;->stop()V

    :cond_0
    return-void
.end method
