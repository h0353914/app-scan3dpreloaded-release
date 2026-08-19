.class public Lorg/apache/log4j/LogManager;
.super Ljava/lang/Object;
.source "LogManager.java"


# static fields
.field public static final CONFIGURATOR_CLASS_KEY:Ljava/lang/String; = "log4j.configuratorClass"

.field public static final DEFAULT_CONFIGURATION_FILE:Ljava/lang/String; = "log4j.properties"

.field public static final DEFAULT_CONFIGURATION_KEY:Ljava/lang/String; = "log4j.configuration"

.field public static final DEFAULT_INIT_OVERRIDE_KEY:Ljava/lang/String; = "log4j.defaultInitOverride"

.field static final DEFAULT_XML_CONFIGURATION_FILE:Ljava/lang/String; = "log4j.xml"

.field private static guard:Ljava/lang/Object;

.field private static repositorySelector:Lorg/apache/log4j/spi/RepositorySelector;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 78
    new-instance v0, Lorg/apache/log4j/Hierarchy;

    new-instance v1, Lorg/apache/log4j/spi/RootLogger;

    sget-object v2, Lorg/apache/log4j/Level;->DEBUG:Lorg/apache/log4j/Level;

    invoke-direct {v1, v2}, Lorg/apache/log4j/spi/RootLogger;-><init>(Lorg/apache/log4j/Level;)V

    invoke-direct {v0, v1}, Lorg/apache/log4j/Hierarchy;-><init>(Lorg/apache/log4j/Logger;)V

    .line 79
    new-instance v1, Lorg/apache/log4j/spi/DefaultRepositorySelector;

    invoke-direct {v1, v0}, Lorg/apache/log4j/spi/DefaultRepositorySelector;-><init>(Lorg/apache/log4j/spi/LoggerRepository;)V

    sput-object v1, Lorg/apache/log4j/LogManager;->repositorySelector:Lorg/apache/log4j/spi/RepositorySelector;

    const-string v0, "log4j.defaultInitOverride"

    const/4 v1, 0x0

    .line 82
    invoke-static {v0, v1}, Lorg/apache/log4j/helpers/OptionConverter;->getSystemProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v2, "false"

    .line 87
    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    :cond_0
    const-string v0, "log4j.configuration"

    .line 89
    invoke-static {v0, v1}, Lorg/apache/log4j/helpers/OptionConverter;->getSystemProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "log4j.configuratorClass"

    .line 93
    invoke-static {v2, v1}, Lorg/apache/log4j/helpers/OptionConverter;->getSystemProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v0, :cond_1

    const-string v2, "log4j.xml"

    .line 103
    invoke-static {v2}, Lorg/apache/log4j/helpers/Loader;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v2

    if-nez v2, :cond_2

    const-string v2, "log4j.properties"

    .line 105
    invoke-static {v2}, Lorg/apache/log4j/helpers/Loader;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v2

    goto :goto_0

    .line 109
    :cond_1
    :try_start_0
    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 113
    :catch_0
    invoke-static {v0}, Lorg/apache/log4j/helpers/Loader;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v2

    :cond_2
    :goto_0
    if-eqz v2, :cond_3

    .line 121
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v3, "Using URL ["

    invoke-direct {v0, v3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    const-string v3, "] for automatic log4j configuration."

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    .line 123
    invoke-static {}, Lorg/apache/log4j/LogManager;->getLoggerRepository()Lorg/apache/log4j/spi/LoggerRepository;

    move-result-object v0

    .line 122
    invoke-static {v2, v1, v0}, Lorg/apache/log4j/helpers/OptionConverter;->selectAndConfigure(Ljava/net/URL;Ljava/lang/String;Lorg/apache/log4j/spi/LoggerRepository;)V

    goto :goto_1

    .line 125
    :cond_3
    new-instance v1, Ljava/lang/StringBuffer;

    const-string v2, "Could not find resource: ["

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v0, "]."

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    :cond_4
    :goto_1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static exists(Ljava/lang/String;)Lorg/apache/log4j/Logger;
    .locals 1

    .line 215
    sget-object v0, Lorg/apache/log4j/LogManager;->repositorySelector:Lorg/apache/log4j/spi/RepositorySelector;

    invoke-interface {v0}, Lorg/apache/log4j/spi/RepositorySelector;->getLoggerRepository()Lorg/apache/log4j/spi/LoggerRepository;

    move-result-object v0

    invoke-interface {v0, p0}, Lorg/apache/log4j/spi/LoggerRepository;->exists(Ljava/lang/String;)Lorg/apache/log4j/Logger;

    move-result-object p0

    return-object p0
.end method

.method public static getCurrentLoggers()Ljava/util/Enumeration;
    .locals 1

    .line 221
    sget-object v0, Lorg/apache/log4j/LogManager;->repositorySelector:Lorg/apache/log4j/spi/RepositorySelector;

    invoke-interface {v0}, Lorg/apache/log4j/spi/RepositorySelector;->getLoggerRepository()Lorg/apache/log4j/spi/LoggerRepository;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/log4j/spi/LoggerRepository;->getCurrentLoggers()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public static getLogger(Ljava/lang/Class;)Lorg/apache/log4j/Logger;
    .locals 1

    .line 198
    sget-object v0, Lorg/apache/log4j/LogManager;->repositorySelector:Lorg/apache/log4j/spi/RepositorySelector;

    invoke-interface {v0}, Lorg/apache/log4j/spi/RepositorySelector;->getLoggerRepository()Lorg/apache/log4j/spi/LoggerRepository;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, p0}, Lorg/apache/log4j/spi/LoggerRepository;->getLogger(Ljava/lang/String;)Lorg/apache/log4j/Logger;

    move-result-object p0

    return-object p0
.end method

.method public static getLogger(Ljava/lang/String;)Lorg/apache/log4j/Logger;
    .locals 1

    .line 188
    sget-object v0, Lorg/apache/log4j/LogManager;->repositorySelector:Lorg/apache/log4j/spi/RepositorySelector;

    invoke-interface {v0}, Lorg/apache/log4j/spi/RepositorySelector;->getLoggerRepository()Lorg/apache/log4j/spi/LoggerRepository;

    move-result-object v0

    invoke-interface {v0, p0}, Lorg/apache/log4j/spi/LoggerRepository;->getLogger(Ljava/lang/String;)Lorg/apache/log4j/Logger;

    move-result-object p0

    return-object p0
.end method

.method public static getLogger(Ljava/lang/String;Lorg/apache/log4j/spi/LoggerFactory;)Lorg/apache/log4j/Logger;
    .locals 1

    .line 209
    sget-object v0, Lorg/apache/log4j/LogManager;->repositorySelector:Lorg/apache/log4j/spi/RepositorySelector;

    invoke-interface {v0}, Lorg/apache/log4j/spi/RepositorySelector;->getLoggerRepository()Lorg/apache/log4j/spi/LoggerRepository;

    move-result-object v0

    invoke-interface {v0, p0, p1}, Lorg/apache/log4j/spi/LoggerRepository;->getLogger(Ljava/lang/String;Lorg/apache/log4j/spi/LoggerFactory;)Lorg/apache/log4j/Logger;

    move-result-object p0

    return-object p0
.end method

.method public static getLoggerRepository()Lorg/apache/log4j/spi/LoggerRepository;
    .locals 1

    .line 168
    sget-object v0, Lorg/apache/log4j/LogManager;->repositorySelector:Lorg/apache/log4j/spi/RepositorySelector;

    invoke-interface {v0}, Lorg/apache/log4j/spi/RepositorySelector;->getLoggerRepository()Lorg/apache/log4j/spi/LoggerRepository;

    move-result-object v0

    return-object v0
.end method

.method public static getRootLogger()Lorg/apache/log4j/Logger;
    .locals 1

    .line 178
    sget-object v0, Lorg/apache/log4j/LogManager;->repositorySelector:Lorg/apache/log4j/spi/RepositorySelector;

    invoke-interface {v0}, Lorg/apache/log4j/spi/RepositorySelector;->getLoggerRepository()Lorg/apache/log4j/spi/LoggerRepository;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/log4j/spi/LoggerRepository;->getRootLogger()Lorg/apache/log4j/Logger;

    move-result-object v0

    return-object v0
.end method

.method public static resetConfiguration()V
    .locals 1

    .line 233
    sget-object v0, Lorg/apache/log4j/LogManager;->repositorySelector:Lorg/apache/log4j/spi/RepositorySelector;

    invoke-interface {v0}, Lorg/apache/log4j/spi/RepositorySelector;->getLoggerRepository()Lorg/apache/log4j/spi/LoggerRepository;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/log4j/spi/LoggerRepository;->resetConfiguration()V

    return-void
.end method

.method public static setRepositorySelector(Lorg/apache/log4j/spi/RepositorySelector;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 152
    sget-object v0, Lorg/apache/log4j/LogManager;->guard:Ljava/lang/Object;

    if-eqz v0, :cond_1

    if-ne v0, p1, :cond_0

    goto :goto_0

    .line 153
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Attempted to reset the LoggerFactory without possessing the guard."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    :goto_0
    if-eqz p0, :cond_2

    .line 161
    sput-object p1, Lorg/apache/log4j/LogManager;->guard:Ljava/lang/Object;

    .line 162
    sput-object p0, Lorg/apache/log4j/LogManager;->repositorySelector:Lorg/apache/log4j/spi/RepositorySelector;

    return-void

    .line 158
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "RepositorySelector must be non-null."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static shutdown()V
    .locals 1

    .line 227
    sget-object v0, Lorg/apache/log4j/LogManager;->repositorySelector:Lorg/apache/log4j/spi/RepositorySelector;

    invoke-interface {v0}, Lorg/apache/log4j/spi/RepositorySelector;->getLoggerRepository()Lorg/apache/log4j/spi/LoggerRepository;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/log4j/spi/LoggerRepository;->shutdown()V

    return-void
.end method
