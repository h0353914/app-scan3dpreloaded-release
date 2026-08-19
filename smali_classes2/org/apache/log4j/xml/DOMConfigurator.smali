.class public Lorg/apache/log4j/xml/DOMConfigurator;
.super Ljava/lang/Object;
.source "DOMConfigurator.java"

# interfaces
.implements Lorg/apache/log4j/spi/Configurator;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/log4j/xml/DOMConfigurator$ParseAction;
    }
.end annotation


# static fields
.field static final ADDITIVITY_ATTR:Ljava/lang/String; = "additivity"

.field static final APPENDER_REF_TAG:Ljava/lang/String; = "appender-ref"

.field static final APPENDER_TAG:Ljava/lang/String; = "appender"

.field static final CATEGORY:Ljava/lang/String; = "category"

.field static final CATEGORY_FACTORY_TAG:Ljava/lang/String; = "categoryFactory"

.field static final CLASS_ATTR:Ljava/lang/String; = "class"

.field static final CONFIGURATION_TAG:Ljava/lang/String; = "log4j:configuration"

.field static final CONFIG_DEBUG_ATTR:Ljava/lang/String; = "configDebug"

.field static final EMPTY_STR:Ljava/lang/String; = ""

.field static final ERROR_HANDLER_TAG:Ljava/lang/String; = "errorHandler"

.field static final FILTER_TAG:Ljava/lang/String; = "filter"

.field static final INTERNAL_DEBUG_ATTR:Ljava/lang/String; = "debug"

.field static final LAYOUT_TAG:Ljava/lang/String; = "layout"

.field static final LEVEL_TAG:Ljava/lang/String; = "level"

.field static final LOGGER:Ljava/lang/String; = "logger"

.field static final LOGGER_REF:Ljava/lang/String; = "logger-ref"

.field static final NAME_ATTR:Ljava/lang/String; = "name"

.field static final OLD_CONFIGURATION_TAG:Ljava/lang/String; = "configuration"

.field static final ONE_STRING_PARAM:[Ljava/lang/Class;

.field static final PARAM_TAG:Ljava/lang/String; = "param"

.field static final PRIORITY_TAG:Ljava/lang/String; = "priority"

.field static final REF_ATTR:Ljava/lang/String; = "ref"

.field static final RENDERED_CLASS_ATTR:Ljava/lang/String; = "renderedClass"

.field static final RENDERER_TAG:Ljava/lang/String; = "renderer"

.field static final RENDERING_CLASS_ATTR:Ljava/lang/String; = "renderingClass"

.field static final ROOT_REF:Ljava/lang/String; = "root-ref"

.field static final ROOT_TAG:Ljava/lang/String; = "root"

.field static final THRESHOLD_ATTR:Ljava/lang/String; = "threshold"

.field static final VALUE_ATTR:Ljava/lang/String; = "value"

.field static synthetic class$java$lang$String:Ljava/lang/Class; = null

.field static synthetic class$org$apache$log4j$spi$ErrorHandler:Ljava/lang/Class; = null

.field static synthetic class$org$apache$log4j$spi$Filter:Ljava/lang/Class; = null

.field static synthetic class$org$apache$log4j$spi$LoggerFactory:Ljava/lang/Class; = null

.field static final dbfKey:Ljava/lang/String; = "javax.xml.parsers.DocumentBuilderFactory"


# instance fields
.field appenderBag:Ljava/util/Hashtable;

.field props:Ljava/util/Properties;

.field repository:Lorg/apache/log4j/spi/LoggerRepository;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/4 v0, 0x1

    .line 100
    new-array v0, v0, [Ljava/lang/Class;

    sget-object v1, Lorg/apache/log4j/xml/DOMConfigurator;->class$java$lang$String:Ljava/lang/Class;

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    const-string v1, "java.lang.String"

    invoke-static {v1}, Lorg/apache/log4j/xml/DOMConfigurator;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/log4j/xml/DOMConfigurator;->class$java$lang$String:Ljava/lang/Class;

    :goto_0
    const/4 v2, 0x0

    aput-object v1, v0, v2

    sput-object v0, Lorg/apache/log4j/xml/DOMConfigurator;->ONE_STRING_PARAM:[Ljava/lang/Class;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 115
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 116
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/log4j/xml/DOMConfigurator;->appenderBag:Ljava/util/Hashtable;

    return-void
.end method

.method static synthetic class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 1

    .line 69
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

.method public static configure(Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/parsers/FactoryConfigurationError;
        }
    .end annotation

    .line 733
    new-instance v0, Lorg/apache/log4j/xml/DOMConfigurator;

    invoke-direct {v0}, Lorg/apache/log4j/xml/DOMConfigurator;-><init>()V

    .line 734
    invoke-static {}, Lorg/apache/log4j/LogManager;->getLoggerRepository()Lorg/apache/log4j/spi/LoggerRepository;

    move-result-object v1

    .line 733
    invoke-virtual {v0, p0, v1}, Lorg/apache/log4j/xml/DOMConfigurator;->doConfigure(Ljava/lang/String;Lorg/apache/log4j/spi/LoggerRepository;)V

    return-void
.end method

.method public static configure(Ljava/net/URL;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/parsers/FactoryConfigurationError;
        }
    .end annotation

    .line 743
    new-instance v0, Lorg/apache/log4j/xml/DOMConfigurator;

    invoke-direct {v0}, Lorg/apache/log4j/xml/DOMConfigurator;-><init>()V

    invoke-static {}, Lorg/apache/log4j/LogManager;->getLoggerRepository()Lorg/apache/log4j/spi/LoggerRepository;

    move-result-object v1

    invoke-virtual {v0, p0, v1}, Lorg/apache/log4j/xml/DOMConfigurator;->doConfigure(Ljava/net/URL;Lorg/apache/log4j/spi/LoggerRepository;)V

    return-void
.end method

.method public static configure(Lorg/w3c/dom/Element;)V
    .locals 2

    .line 552
    new-instance v0, Lorg/apache/log4j/xml/DOMConfigurator;

    invoke-direct {v0}, Lorg/apache/log4j/xml/DOMConfigurator;-><init>()V

    .line 553
    invoke-static {}, Lorg/apache/log4j/LogManager;->getLoggerRepository()Lorg/apache/log4j/spi/LoggerRepository;

    move-result-object v1

    invoke-virtual {v0, p0, v1}, Lorg/apache/log4j/xml/DOMConfigurator;->doConfigure(Lorg/w3c/dom/Element;Lorg/apache/log4j/spi/LoggerRepository;)V

    return-void
.end method

.method public static configureAndWatch(Ljava/lang/String;)V
    .locals 2

    const-wide/32 v0, 0xea60

    .line 567
    invoke-static {p0, v0, v1}, Lorg/apache/log4j/xml/DOMConfigurator;->configureAndWatch(Ljava/lang/String;J)V

    return-void
.end method

.method public static configureAndWatch(Ljava/lang/String;J)V
    .locals 1

    .line 584
    new-instance v0, Lorg/apache/log4j/xml/XMLWatchdog;

    invoke-direct {v0, p0}, Lorg/apache/log4j/xml/XMLWatchdog;-><init>(Ljava/lang/String;)V

    .line 585
    invoke-virtual {v0, p1, p2}, Lorg/apache/log4j/helpers/FileWatchdog;->setDelay(J)V

    .line 586
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method private final doConfigure(Lorg/apache/log4j/xml/DOMConfigurator$ParseAction;Lorg/apache/log4j/spi/LoggerRepository;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/parsers/FactoryConfigurationError;
        }
    .end annotation

    .line 689
    iput-object p2, p0, Lorg/apache/log4j/xml/DOMConfigurator;->repository:Lorg/apache/log4j/spi/LoggerRepository;

    .line 691
    :try_start_0
    new-instance p2, Ljava/lang/StringBuffer;

    const-string v0, "System property is :"

    invoke-direct {p2, v0}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    const-string v0, "javax.xml.parsers.DocumentBuilderFactory"

    const/4 v1, 0x0

    .line 692
    invoke-static {v0, v1}, Lorg/apache/log4j/helpers/OptionConverter;->getSystemProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 691
    invoke-virtual {p2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    .line 694
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object p2

    const-string v0, "Standard DocumentBuilderFactory search succeded."

    .line 695
    invoke-static {v0}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    .line 696
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v1, "DocumentBuilderFactory is: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V
    :try_end_0
    .catch Ljavax/xml/parsers/FactoryConfigurationError; {:try_start_0 .. :try_end_0} :catch_1

    const/4 v0, 0x1

    .line 704
    :try_start_1
    invoke-virtual {p2, v0}, Ljavax/xml/parsers/DocumentBuilderFactory;->setValidating(Z)V

    .line 706
    invoke-virtual {p2}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object p2

    .line 708
    new-instance v0, Lorg/apache/log4j/xml/SAXErrorHandler;

    invoke-direct {v0}, Lorg/apache/log4j/xml/SAXErrorHandler;-><init>()V

    invoke-virtual {p2, v0}, Ljavax/xml/parsers/DocumentBuilder;->setErrorHandler(Lorg/xml/sax/ErrorHandler;)V

    .line 709
    new-instance v0, Lorg/apache/log4j/xml/Log4jEntityResolver;

    invoke-direct {v0}, Lorg/apache/log4j/xml/Log4jEntityResolver;-><init>()V

    invoke-virtual {p2, v0}, Ljavax/xml/parsers/DocumentBuilder;->setEntityResolver(Lorg/xml/sax/EntityResolver;)V

    .line 711
    invoke-interface {p1, p2}, Lorg/apache/log4j/xml/DOMConfigurator$ParseAction;->parse(Ljavax/xml/parsers/DocumentBuilder;)Lorg/w3c/dom/Document;

    move-result-object p2

    .line 712
    invoke-interface {p2}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object p2

    invoke-virtual {p0, p2}, Lorg/apache/log4j/xml/DOMConfigurator;->parse(Lorg/w3c/dom/Element;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception p2

    .line 715
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v1, "Could not parse "

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string p1, "."

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, p2}, Lorg/apache/log4j/helpers/LogLog;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void

    :catch_1
    move-exception p1

    .line 698
    invoke-virtual {p1}, Ljavax/xml/parsers/FactoryConfigurationError;->getException()Ljava/lang/Exception;

    move-result-object p2

    const-string v0, "Could not instantiate a DocumentBuilderFactory."

    .line 699
    invoke-static {v0, p2}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 700
    throw p1
.end method


# virtual methods
.method public doConfigure(Ljava/io/InputStream;Lorg/apache/log4j/spi/LoggerRepository;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/parsers/FactoryConfigurationError;
        }
    .end annotation

    .line 629
    new-instance v0, Lorg/apache/log4j/xml/DOMConfigurator$3;

    invoke-direct {v0, p1}, Lorg/apache/log4j/xml/DOMConfigurator$3;-><init>(Ljava/io/InputStream;)V

    .line 639
    invoke-direct {p0, v0, p2}, Lorg/apache/log4j/xml/DOMConfigurator;->doConfigure(Lorg/apache/log4j/xml/DOMConfigurator$ParseAction;Lorg/apache/log4j/spi/LoggerRepository;)V

    return-void
.end method

.method public doConfigure(Ljava/io/Reader;Lorg/apache/log4j/spi/LoggerRepository;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/parsers/FactoryConfigurationError;
        }
    .end annotation

    .line 650
    new-instance v0, Lorg/apache/log4j/xml/DOMConfigurator$4;

    invoke-direct {v0, p1}, Lorg/apache/log4j/xml/DOMConfigurator$4;-><init>(Ljava/io/Reader;)V

    .line 660
    invoke-direct {p0, v0, p2}, Lorg/apache/log4j/xml/DOMConfigurator;->doConfigure(Lorg/apache/log4j/xml/DOMConfigurator$ParseAction;Lorg/apache/log4j/spi/LoggerRepository;)V

    return-void
.end method

.method public doConfigure(Ljava/lang/String;Lorg/apache/log4j/spi/LoggerRepository;)V
    .locals 1

    .line 596
    new-instance v0, Lorg/apache/log4j/xml/DOMConfigurator$1;

    invoke-direct {v0, p1}, Lorg/apache/log4j/xml/DOMConfigurator$1;-><init>(Ljava/lang/String;)V

    .line 604
    invoke-direct {p0, v0, p2}, Lorg/apache/log4j/xml/DOMConfigurator;->doConfigure(Lorg/apache/log4j/xml/DOMConfigurator$ParseAction;Lorg/apache/log4j/spi/LoggerRepository;)V

    return-void
.end method

.method public doConfigure(Ljava/net/URL;Lorg/apache/log4j/spi/LoggerRepository;)V
    .locals 1

    .line 610
    new-instance v0, Lorg/apache/log4j/xml/DOMConfigurator$2;

    invoke-direct {v0, p1}, Lorg/apache/log4j/xml/DOMConfigurator$2;-><init>(Ljava/net/URL;)V

    .line 618
    invoke-direct {p0, v0, p2}, Lorg/apache/log4j/xml/DOMConfigurator;->doConfigure(Lorg/apache/log4j/xml/DOMConfigurator$ParseAction;Lorg/apache/log4j/spi/LoggerRepository;)V

    return-void
.end method

.method public doConfigure(Lorg/w3c/dom/Element;Lorg/apache/log4j/spi/LoggerRepository;)V
    .locals 0

    .line 723
    iput-object p2, p0, Lorg/apache/log4j/xml/DOMConfigurator;->repository:Lorg/apache/log4j/spi/LoggerRepository;

    .line 724
    invoke-virtual {p0, p1}, Lorg/apache/log4j/xml/DOMConfigurator;->parse(Lorg/w3c/dom/Element;)V

    return-void
.end method

.method protected doConfigure(Lorg/xml/sax/InputSource;Lorg/apache/log4j/spi/LoggerRepository;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/parsers/FactoryConfigurationError;
        }
    .end annotation

    .line 671
    invoke-virtual {p1}, Lorg/xml/sax/InputSource;->getSystemId()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, "dummy://log4j.dtd"

    .line 672
    invoke-virtual {p1, v0}, Lorg/xml/sax/InputSource;->setSystemId(Ljava/lang/String;)V

    .line 674
    :cond_0
    new-instance v0, Lorg/apache/log4j/xml/DOMConfigurator$5;

    invoke-direct {v0, p1}, Lorg/apache/log4j/xml/DOMConfigurator$5;-><init>(Lorg/xml/sax/InputSource;)V

    .line 682
    invoke-direct {p0, v0, p2}, Lorg/apache/log4j/xml/DOMConfigurator;->doConfigure(Lorg/apache/log4j/xml/DOMConfigurator$ParseAction;Lorg/apache/log4j/spi/LoggerRepository;)V

    return-void
.end method

.method protected findAppenderByName(Lorg/w3c/dom/Document;Ljava/lang/String;)Lorg/apache/log4j/Appender;
    .locals 5

    .line 124
    iget-object v0, p0, Lorg/apache/log4j/xml/DOMConfigurator;->appenderBag:Ljava/util/Hashtable;

    invoke-virtual {v0, p2}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/log4j/Appender;

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    const-string v0, "appender"

    .line 134
    invoke-interface {p1, v0}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object p1

    const/4 v0, 0x0

    .line 135
    :goto_0
    invoke-interface {p1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v1

    const/4 v2, 0x0

    if-lt v0, v1, :cond_1

    move-object p1, v2

    goto :goto_1

    .line 136
    :cond_1
    invoke-interface {p1, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    .line 137
    invoke-interface {v1}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v3

    const-string v4, "name"

    .line 138
    invoke-interface {v3, v4}, Lorg/w3c/dom/NamedNodeMap;->getNamedItem(Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v3

    .line 139
    invoke-interface {v3}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 140
    move-object p1, v1

    check-cast p1, Lorg/w3c/dom/Element;

    :goto_1
    if-nez p1, :cond_2

    .line 147
    new-instance p1, Ljava/lang/StringBuffer;

    const-string v0, "No appender named ["

    invoke-direct {p1, v0}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string p2, "] could be found."

    invoke-virtual {p1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lorg/apache/log4j/helpers/LogLog;->error(Ljava/lang/String;)V

    return-object v2

    .line 150
    :cond_2
    invoke-virtual {p0, p1}, Lorg/apache/log4j/xml/DOMConfigurator;->parseAppender(Lorg/w3c/dom/Element;)Lorg/apache/log4j/Appender;

    move-result-object p1

    .line 151
    iget-object v0, p0, Lorg/apache/log4j/xml/DOMConfigurator;->appenderBag:Ljava/util/Hashtable;

    invoke-virtual {v0, p2, p1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p1

    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method protected findAppenderByReference(Lorg/w3c/dom/Element;)Lorg/apache/log4j/Appender;
    .locals 1

    const-string v0, "ref"

    .line 161
    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/log4j/xml/DOMConfigurator;->subst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 162
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object p1

    .line 163
    invoke-virtual {p0, p1, v0}, Lorg/apache/log4j/xml/DOMConfigurator;->findAppenderByName(Lorg/w3c/dom/Document;Ljava/lang/String;)Lorg/apache/log4j/Appender;

    move-result-object p1

    return-object p1
.end method

.method protected parse(Lorg/w3c/dom/Element;)V
    .locals 7

    .line 755
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getTagName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "log4j:configuration"

    .line 757
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "configuration"

    .line 758
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "The <configuration> element has been deprecated."

    .line 759
    invoke-static {v0}, Lorg/apache/log4j/helpers/LogLog;->warn(Ljava/lang/String;)V

    const-string v0, "Use the <log4j:configuration> element instead."

    .line 761
    invoke-static {v0}, Lorg/apache/log4j/helpers/LogLog;->warn(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const-string p1, "DOM element is - not a <log4j:configuration> element."

    .line 763
    invoke-static {p1}, Lorg/apache/log4j/helpers/LogLog;->error(Ljava/lang/String;)V

    return-void

    :cond_1
    :goto_0
    const-string v0, "debug"

    .line 768
    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/log4j/xml/DOMConfigurator;->subst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 770
    new-instance v1, Ljava/lang/StringBuffer;

    const-string v2, "debug attribute= \""

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v2, "\"."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    const-string v1, ""

    .line 773
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x1

    if-nez v1, :cond_2

    const-string v1, "null"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 774
    invoke-static {v0, v2}, Lorg/apache/log4j/helpers/OptionConverter;->toBoolean(Ljava/lang/String;Z)Z

    move-result v0

    invoke-static {v0}, Lorg/apache/log4j/helpers/LogLog;->setInternalDebugging(Z)V

    goto :goto_1

    :cond_2
    const-string v0, "Ignoring debug attribute."

    .line 776
    invoke-static {v0}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    :goto_1
    const-string v0, "configDebug"

    .line 780
    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/log4j/xml/DOMConfigurator;->subst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, ""

    .line 781
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    const-string v1, "null"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    const-string v1, "The \"configDebug\" attribute is deprecated."

    .line 782
    invoke-static {v1}, Lorg/apache/log4j/helpers/LogLog;->warn(Ljava/lang/String;)V

    const-string v1, "Use the \"debug\" attribute instead."

    .line 783
    invoke-static {v1}, Lorg/apache/log4j/helpers/LogLog;->warn(Ljava/lang/String;)V

    .line 784
    invoke-static {v0, v2}, Lorg/apache/log4j/helpers/OptionConverter;->toBoolean(Ljava/lang/String;Z)Z

    move-result v0

    invoke-static {v0}, Lorg/apache/log4j/helpers/LogLog;->setInternalDebugging(Z)V

    :cond_3
    const-string v0, "threshold"

    .line 787
    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/log4j/xml/DOMConfigurator;->subst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 788
    new-instance v1, Ljava/lang/StringBuffer;

    const-string v3, "Threshold =\""

    invoke-direct {v1, v3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v3, "\"."

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    const-string v1, ""

    .line 789
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    const-string v1, "null"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 790
    iget-object v1, p0, Lorg/apache/log4j/xml/DOMConfigurator;->repository:Lorg/apache/log4j/spi/LoggerRepository;

    invoke-interface {v1, v0}, Lorg/apache/log4j/spi/LoggerRepository;->setThreshold(Ljava/lang/String;)V

    .line 805
    :cond_4
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object p1

    .line 806
    invoke-interface {p1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v0

    const/4 v1, 0x0

    move v3, v1

    :goto_2
    if-lt v3, v0, :cond_a

    :goto_3
    if-lt v1, v0, :cond_5

    return-void

    .line 821
    :cond_5
    invoke-interface {p1, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v3

    .line 822
    invoke-interface {v3}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v4

    if-ne v4, v2, :cond_9

    .line 823
    check-cast v3, Lorg/w3c/dom/Element;

    .line 824
    invoke-interface {v3}, Lorg/w3c/dom/Element;->getTagName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "category"

    .line 826
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_8

    const-string v5, "logger"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    goto :goto_4

    :cond_6
    const-string v5, "root"

    .line 828
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 829
    invoke-virtual {p0, v3}, Lorg/apache/log4j/xml/DOMConfigurator;->parseRoot(Lorg/w3c/dom/Element;)V

    goto :goto_5

    :cond_7
    const-string v5, "renderer"

    .line 830
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_9

    .line 831
    invoke-virtual {p0, v3}, Lorg/apache/log4j/xml/DOMConfigurator;->parseRenderer(Lorg/w3c/dom/Element;)V

    goto :goto_5

    .line 827
    :cond_8
    :goto_4
    invoke-virtual {p0, v3}, Lorg/apache/log4j/xml/DOMConfigurator;->parseCategory(Lorg/w3c/dom/Element;)V

    :cond_9
    :goto_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 809
    :cond_a
    invoke-interface {p1, v3}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    .line 810
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v5

    if-ne v5, v2, :cond_b

    .line 811
    check-cast v4, Lorg/w3c/dom/Element;

    .line 812
    invoke-interface {v4}, Lorg/w3c/dom/Element;->getTagName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "categoryFactory"

    .line 814
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_b

    .line 815
    invoke-virtual {p0, v4}, Lorg/apache/log4j/xml/DOMConfigurator;->parseCategoryFactory(Lorg/w3c/dom/Element;)V

    :cond_b
    add-int/lit8 v3, v3, 0x1

    goto :goto_2
.end method

.method protected parseAppender(Lorg/w3c/dom/Element;)Lorg/apache/log4j/Appender;
    .locals 9

    const-string v0, "class"

    .line 171
    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/log4j/xml/DOMConfigurator;->subst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 172
    new-instance v1, Ljava/lang/StringBuffer;

    const-string v2, "Class name: ["

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const/16 v2, 0x5d

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    .line 174
    :try_start_0
    invoke-static {v0}, Lorg/apache/log4j/helpers/Loader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    .line 175
    check-cast v0, Lorg/apache/log4j/Appender;

    .line 176
    new-instance v1, Lorg/apache/log4j/config/PropertySetter;

    invoke-direct {v1, v0}, Lorg/apache/log4j/config/PropertySetter;-><init>(Ljava/lang/Object;)V

    const-string v2, "name"

    .line 178
    invoke-interface {p1, v2}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/log4j/xml/DOMConfigurator;->subst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Lorg/apache/log4j/Appender;->setName(Ljava/lang/String;)V

    .line 180
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object p1

    .line 181
    invoke-interface {p1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v2

    const/4 v3, 0x0

    :goto_0
    if-lt v3, v2, :cond_0

    .line 220
    invoke-virtual {v1}, Lorg/apache/log4j/config/PropertySetter;->activate()V

    return-object v0

    .line 184
    :cond_0
    invoke-interface {p1, v3}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    .line 187
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_6

    .line 188
    check-cast v4, Lorg/w3c/dom/Element;

    .line 191
    invoke-interface {v4}, Lorg/w3c/dom/Element;->getTagName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "param"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 192
    invoke-virtual {p0, v4, v1}, Lorg/apache/log4j/xml/DOMConfigurator;->setParameter(Lorg/w3c/dom/Element;Lorg/apache/log4j/config/PropertySetter;)V

    goto/16 :goto_1

    .line 195
    :cond_1
    invoke-interface {v4}, Lorg/w3c/dom/Element;->getTagName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "layout"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 196
    invoke-virtual {p0, v4}, Lorg/apache/log4j/xml/DOMConfigurator;->parseLayout(Lorg/w3c/dom/Element;)Lorg/apache/log4j/Layout;

    move-result-object v4

    invoke-interface {v0, v4}, Lorg/apache/log4j/Appender;->setLayout(Lorg/apache/log4j/Layout;)V

    goto/16 :goto_1

    .line 199
    :cond_2
    invoke-interface {v4}, Lorg/w3c/dom/Element;->getTagName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "filter"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 200
    invoke-virtual {p0, v4, v0}, Lorg/apache/log4j/xml/DOMConfigurator;->parseFilters(Lorg/w3c/dom/Element;Lorg/apache/log4j/Appender;)V

    goto/16 :goto_1

    .line 202
    :cond_3
    invoke-interface {v4}, Lorg/w3c/dom/Element;->getTagName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "errorHandler"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 203
    invoke-virtual {p0, v4, v0}, Lorg/apache/log4j/xml/DOMConfigurator;->parseErrorHandler(Lorg/w3c/dom/Element;Lorg/apache/log4j/Appender;)V

    goto :goto_1

    .line 205
    :cond_4
    invoke-interface {v4}, Lorg/w3c/dom/Element;->getTagName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "appender-ref"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    const-string v5, "ref"

    .line 206
    invoke-interface {v4, v5}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lorg/apache/log4j/xml/DOMConfigurator;->subst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 207
    instance-of v6, v0, Lorg/apache/log4j/spi/AppenderAttachable;

    if-eqz v6, :cond_5

    .line 208
    move-object v6, v0

    check-cast v6, Lorg/apache/log4j/spi/AppenderAttachable;

    .line 209
    new-instance v7, Ljava/lang/StringBuffer;

    const-string v8, "Attaching appender named ["

    invoke-direct {v7, v8}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v5, "] to appender named ["

    .line 210
    invoke-virtual {v7, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-interface {v0}, Lorg/apache/log4j/Appender;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v7, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v5, "]."

    invoke-virtual {v7, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 209
    invoke-static {v5}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    .line 211
    invoke-virtual {p0, v4}, Lorg/apache/log4j/xml/DOMConfigurator;->findAppenderByReference(Lorg/w3c/dom/Element;)Lorg/apache/log4j/Appender;

    move-result-object v4

    invoke-interface {v6, v4}, Lorg/apache/log4j/spi/AppenderAttachable;->addAppender(Lorg/apache/log4j/Appender;)V

    goto :goto_1

    .line 213
    :cond_5
    new-instance v4, Ljava/lang/StringBuffer;

    const-string v6, "Requesting attachment of appender named ["

    invoke-direct {v4, v6}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 214
    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v5, "] to appender named ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-interface {v0}, Lorg/apache/log4j/Appender;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v5, "] which does not implement org.apache.log4j.spi.AppenderAttachable."

    .line 215
    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 214
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 213
    invoke-static {v4}, Lorg/apache/log4j/helpers/LogLog;->error(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_6
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    :catch_0
    move-exception p1

    const-string v0, "Could not create an Appender. Reported error follows."

    .line 226
    invoke-static {v0, p1}, Lorg/apache/log4j/helpers/LogLog;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 p1, 0x0

    return-object p1
.end method

.method protected parseCategory(Lorg/w3c/dom/Element;)V
    .locals 6

    const-string v0, "name"

    .line 310
    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/log4j/xml/DOMConfigurator;->subst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "class"

    .line 314
    invoke-interface {p1, v1}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/log4j/xml/DOMConfigurator;->subst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    .line 317
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_0

    const-string v1, "Retreiving an instance of org.apache.log4j.Logger."

    .line 318
    invoke-static {v1}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    .line 319
    iget-object v1, p0, Lorg/apache/log4j/xml/DOMConfigurator;->repository:Lorg/apache/log4j/spi/LoggerRepository;

    invoke-interface {v1, v0}, Lorg/apache/log4j/spi/LoggerRepository;->getLogger(Ljava/lang/String;)Lorg/apache/log4j/Logger;

    move-result-object v0

    goto :goto_0

    .line 322
    :cond_0
    new-instance v2, Ljava/lang/StringBuffer;

    const-string v5, "Desired logger sub-class: ["

    invoke-direct {v2, v5}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const/16 v5, 0x5d

    invoke-virtual {v2, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    .line 324
    :try_start_0
    invoke-static {v1}, Lorg/apache/log4j/helpers/Loader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "getLogger"

    .line 326
    sget-object v5, Lorg/apache/log4j/xml/DOMConfigurator;->ONE_STRING_PARAM:[Ljava/lang/Class;

    .line 325
    invoke-virtual {v1, v2, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    const/4 v2, 0x0

    .line 327
    new-array v5, v4, [Ljava/lang/Object;

    aput-object v0, v5, v3

    invoke-virtual {v1, v2, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/log4j/Logger;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    .line 338
    :goto_0
    monitor-enter v0

    :try_start_1
    const-string v1, "additivity"

    .line 340
    invoke-interface {p1, v1}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/log4j/xml/DOMConfigurator;->subst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 339
    invoke-static {v1, v4}, Lorg/apache/log4j/helpers/OptionConverter;->toBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 343
    new-instance v2, Ljava/lang/StringBuffer;

    const-string v4, "Setting ["

    invoke-direct {v2, v4}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lorg/apache/log4j/Category;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v4, "] additivity to ["

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    const-string v4, "]."

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    .line 344
    invoke-virtual {v0, v1}, Lorg/apache/log4j/Category;->setAdditivity(Z)V

    .line 345
    invoke-virtual {p0, p1, v0, v3}, Lorg/apache/log4j/xml/DOMConfigurator;->parseChildrenOfLoggerElement(Lorg/w3c/dom/Element;Lorg/apache/log4j/Logger;Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 338
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0

    throw p1

    :catch_0
    move-exception p1

    .line 329
    new-instance v1, Ljava/lang/StringBuffer;

    const-string v2, "Could not retrieve category ["

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v0, "]. Reported error follows."

    .line 330
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 329
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Lorg/apache/log4j/helpers/LogLog;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method protected parseCategoryFactory(Lorg/w3c/dom/Element;)V
    .locals 6

    const-string v0, "class"

    .line 355
    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/log4j/xml/DOMConfigurator;->subst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, ""

    .line 357
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string p1, "Category Factory tag class attribute not found."

    .line 358
    invoke-static {p1}, Lorg/apache/log4j/helpers/LogLog;->error(Ljava/lang/String;)V

    const-string p1, "No Category Factory configured."

    .line 359
    invoke-static {p1}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    goto :goto_2

    .line 362
    :cond_0
    new-instance v1, Ljava/lang/StringBuffer;

    const-string v2, "Desired category factory: ["

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const/16 v2, 0x5d

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    .line 364
    sget-object v1, Lorg/apache/log4j/xml/DOMConfigurator;->class$org$apache$log4j$spi$LoggerFactory:Ljava/lang/Class;

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    const-string v1, "org.apache.log4j.spi.LoggerFactory"

    invoke-static {v1}, Lorg/apache/log4j/xml/DOMConfigurator;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/log4j/xml/DOMConfigurator;->class$org$apache$log4j$spi$LoggerFactory:Ljava/lang/Class;

    :goto_0
    const/4 v2, 0x0

    .line 363
    invoke-static {v0, v1, v2}, Lorg/apache/log4j/helpers/OptionConverter;->instantiateByClassName(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 366
    new-instance v1, Lorg/apache/log4j/config/PropertySetter;

    invoke-direct {v1, v0}, Lorg/apache/log4j/config/PropertySetter;-><init>(Ljava/lang/Object;)V

    .line 370
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object p1

    .line 371
    invoke-interface {p1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v0

    const/4 v2, 0x0

    :goto_1
    if-lt v2, v0, :cond_2

    :goto_2
    return-void

    .line 374
    :cond_2
    invoke-interface {p1, v2}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v3

    .line 375
    invoke-interface {v3}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_3

    .line 376
    check-cast v3, Lorg/w3c/dom/Element;

    .line 377
    invoke-interface {v3}, Lorg/w3c/dom/Element;->getTagName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "param"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 378
    invoke-virtual {p0, v3, v1}, Lorg/apache/log4j/xml/DOMConfigurator;->setParameter(Lorg/w3c/dom/Element;Lorg/apache/log4j/config/PropertySetter;)V

    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method protected parseChildrenOfLoggerElement(Lorg/w3c/dom/Element;Lorg/apache/log4j/Logger;Z)V
    .locals 7

    .line 406
    new-instance v0, Lorg/apache/log4j/config/PropertySetter;

    invoke-direct {v0, p2}, Lorg/apache/log4j/config/PropertySetter;-><init>(Ljava/lang/Object;)V

    .line 410
    invoke-virtual {p2}, Lorg/apache/log4j/Category;->removeAllAppenders()V

    .line 413
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object p1

    .line 414
    invoke-interface {p1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v1

    const/4 v2, 0x0

    :goto_0
    if-lt v2, v1, :cond_0

    .line 444
    invoke-virtual {v0}, Lorg/apache/log4j/config/PropertySetter;->activate()V

    return-void

    .line 417
    :cond_0
    invoke-interface {p1, v2}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v3

    .line 419
    invoke-interface {v3}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_5

    .line 420
    check-cast v3, Lorg/w3c/dom/Element;

    .line 421
    invoke-interface {v3}, Lorg/w3c/dom/Element;->getTagName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "appender-ref"

    .line 423
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 425
    invoke-virtual {p0, v3}, Lorg/apache/log4j/xml/DOMConfigurator;->findAppenderByReference(Lorg/w3c/dom/Element;)Lorg/apache/log4j/Appender;

    move-result-object v4

    const-string v5, "ref"

    .line 426
    invoke-interface {v3, v5}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/apache/log4j/xml/DOMConfigurator;->subst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v4, :cond_1

    .line 428
    new-instance v5, Ljava/lang/StringBuffer;

    const-string v6, "Adding appender named ["

    invoke-direct {v5, v6}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v3, "] to category ["

    .line 429
    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p2}, Lorg/apache/log4j/Category;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v3, "]."

    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    .line 428
    invoke-static {v3}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    goto :goto_1

    .line 431
    :cond_1
    new-instance v5, Ljava/lang/StringBuffer;

    const-string v6, "Appender named ["

    invoke-direct {v5, v6}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v3, "] not found."

    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    .line 433
    :goto_1
    invoke-virtual {p2, v4}, Lorg/apache/log4j/Category;->addAppender(Lorg/apache/log4j/Appender;)V

    goto :goto_2

    :cond_2
    const-string v5, "level"

    .line 435
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 436
    invoke-virtual {p0, v3, p2, p3}, Lorg/apache/log4j/xml/DOMConfigurator;->parseLevel(Lorg/w3c/dom/Element;Lorg/apache/log4j/Logger;Z)V

    goto :goto_2

    :cond_3
    const-string v5, "priority"

    .line 437
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 438
    invoke-virtual {p0, v3, p2, p3}, Lorg/apache/log4j/xml/DOMConfigurator;->parseLevel(Lorg/w3c/dom/Element;Lorg/apache/log4j/Logger;Z)V

    goto :goto_2

    :cond_4
    const-string v5, "param"

    .line 439
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 440
    invoke-virtual {p0, v3, v0}, Lorg/apache/log4j/xml/DOMConfigurator;->setParameter(Lorg/w3c/dom/Element;Lorg/apache/log4j/config/PropertySetter;)V

    :cond_5
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0
.end method

.method protected parseErrorHandler(Lorg/w3c/dom/Element;Lorg/apache/log4j/Appender;)V
    .locals 7

    const-string v0, "class"

    .line 238
    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/log4j/xml/DOMConfigurator;->subst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 239
    sget-object v1, Lorg/apache/log4j/xml/DOMConfigurator;->class$org$apache$log4j$spi$ErrorHandler:Ljava/lang/Class;

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    const-string v1, "org.apache.log4j.spi.ErrorHandler"

    invoke-static {v1}, Lorg/apache/log4j/xml/DOMConfigurator;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/log4j/xml/DOMConfigurator;->class$org$apache$log4j$spi$ErrorHandler:Ljava/lang/Class;

    :goto_0
    const/4 v2, 0x0

    .line 237
    invoke-static {v0, v1, v2}, Lorg/apache/log4j/helpers/OptionConverter;->instantiateByClassName(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/log4j/spi/ErrorHandler;

    if-eqz v0, :cond_6

    .line 243
    invoke-interface {v0, p2}, Lorg/apache/log4j/spi/ErrorHandler;->setAppender(Lorg/apache/log4j/Appender;)V

    .line 245
    new-instance v1, Lorg/apache/log4j/config/PropertySetter;

    invoke-direct {v1, v0}, Lorg/apache/log4j/config/PropertySetter;-><init>(Ljava/lang/Object;)V

    .line 246
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object p1

    .line 247
    invoke-interface {p1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v2

    const/4 v3, 0x0

    :goto_1
    if-lt v3, v2, :cond_1

    .line 268
    invoke-virtual {v1}, Lorg/apache/log4j/config/PropertySetter;->activate()V

    .line 269
    invoke-interface {p2, v0}, Lorg/apache/log4j/Appender;->setErrorHandler(Lorg/apache/log4j/spi/ErrorHandler;)V

    goto :goto_3

    .line 250
    :cond_1
    invoke-interface {p1, v3}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    .line 251
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_5

    .line 252
    check-cast v4, Lorg/w3c/dom/Element;

    .line 253
    invoke-interface {v4}, Lorg/w3c/dom/Element;->getTagName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "param"

    .line 254
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 255
    invoke-virtual {p0, v4, v1}, Lorg/apache/log4j/xml/DOMConfigurator;->setParameter(Lorg/w3c/dom/Element;Lorg/apache/log4j/config/PropertySetter;)V

    goto :goto_2

    :cond_2
    const-string v6, "appender-ref"

    .line 256
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 257
    invoke-virtual {p0, v4}, Lorg/apache/log4j/xml/DOMConfigurator;->findAppenderByReference(Lorg/w3c/dom/Element;)Lorg/apache/log4j/Appender;

    move-result-object v4

    invoke-interface {v0, v4}, Lorg/apache/log4j/spi/ErrorHandler;->setBackupAppender(Lorg/apache/log4j/Appender;)V

    goto :goto_2

    :cond_3
    const-string v6, "logger-ref"

    .line 258
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    const-string v5, "ref"

    .line 259
    invoke-interface {v4, v5}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 260
    iget-object v5, p0, Lorg/apache/log4j/xml/DOMConfigurator;->repository:Lorg/apache/log4j/spi/LoggerRepository;

    invoke-interface {v5, v4}, Lorg/apache/log4j/spi/LoggerRepository;->getLogger(Ljava/lang/String;)Lorg/apache/log4j/Logger;

    move-result-object v4

    .line 261
    invoke-interface {v0, v4}, Lorg/apache/log4j/spi/ErrorHandler;->setLogger(Lorg/apache/log4j/Logger;)V

    goto :goto_2

    :cond_4
    const-string v4, "root-ref"

    .line 262
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 263
    iget-object v4, p0, Lorg/apache/log4j/xml/DOMConfigurator;->repository:Lorg/apache/log4j/spi/LoggerRepository;

    invoke-interface {v4}, Lorg/apache/log4j/spi/LoggerRepository;->getRootLogger()Lorg/apache/log4j/Logger;

    move-result-object v4

    .line 264
    invoke-interface {v0, v4}, Lorg/apache/log4j/spi/ErrorHandler;->setLogger(Lorg/apache/log4j/Logger;)V

    :cond_5
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_6
    :goto_3
    return-void
.end method

.method protected parseFilters(Lorg/w3c/dom/Element;Lorg/apache/log4j/Appender;)V
    .locals 7

    const-string v0, "class"

    .line 278
    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/log4j/xml/DOMConfigurator;->subst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 280
    sget-object v1, Lorg/apache/log4j/xml/DOMConfigurator;->class$org$apache$log4j$spi$Filter:Ljava/lang/Class;

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    const-string v1, "org.apache.log4j.spi.Filter"

    invoke-static {v1}, Lorg/apache/log4j/xml/DOMConfigurator;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/log4j/xml/DOMConfigurator;->class$org$apache$log4j$spi$Filter:Ljava/lang/Class;

    :goto_0
    const/4 v2, 0x0

    .line 279
    invoke-static {v0, v1, v2}, Lorg/apache/log4j/helpers/OptionConverter;->instantiateByClassName(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/log4j/spi/Filter;

    if-eqz v0, :cond_3

    .line 283
    new-instance v1, Lorg/apache/log4j/config/PropertySetter;

    invoke-direct {v1, v0}, Lorg/apache/log4j/config/PropertySetter;-><init>(Ljava/lang/Object;)V

    .line 284
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object p1

    .line 285
    invoke-interface {p1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v2

    const/4 v3, 0x0

    :goto_1
    if-lt v3, v2, :cond_1

    .line 297
    invoke-virtual {v1}, Lorg/apache/log4j/config/PropertySetter;->activate()V

    .line 298
    new-instance p1, Ljava/lang/StringBuffer;

    const-string v1, "Adding filter of type ["

    invoke-direct {p1, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    const-string v1, "] to appender named ["

    .line 299
    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-interface {p2}, Lorg/apache/log4j/Appender;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v1, "]."

    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    .line 298
    invoke-static {p1}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    .line 300
    invoke-interface {p2, v0}, Lorg/apache/log4j/Appender;->addFilter(Lorg/apache/log4j/spi/Filter;)V

    goto :goto_2

    .line 288
    :cond_1
    invoke-interface {p1, v3}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    .line 289
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_2

    .line 290
    check-cast v4, Lorg/w3c/dom/Element;

    .line 291
    invoke-interface {v4}, Lorg/w3c/dom/Element;->getTagName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "param"

    .line 292
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 293
    invoke-virtual {p0, v4, v1}, Lorg/apache/log4j/xml/DOMConfigurator;->setParameter(Lorg/w3c/dom/Element;Lorg/apache/log4j/config/PropertySetter;)V

    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_3
    :goto_2
    return-void
.end method

.method protected parseLayout(Lorg/w3c/dom/Element;)Lorg/apache/log4j/Layout;
    .locals 7

    const-string v0, "class"

    .line 452
    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/log4j/xml/DOMConfigurator;->subst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 453
    new-instance v1, Ljava/lang/StringBuffer;

    const-string v2, "Parsing layout of class: \""

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    .line 455
    :try_start_0
    invoke-static {v0}, Lorg/apache/log4j/helpers/Loader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    .line 456
    check-cast v0, Lorg/apache/log4j/Layout;

    .line 457
    new-instance v1, Lorg/apache/log4j/config/PropertySetter;

    invoke-direct {v1, v0}, Lorg/apache/log4j/config/PropertySetter;-><init>(Ljava/lang/Object;)V

    .line 459
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object p1

    .line 460
    invoke-interface {p1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v2

    const/4 v3, 0x0

    :goto_0
    if-lt v3, v2, :cond_0

    .line 473
    invoke-virtual {v1}, Lorg/apache/log4j/config/PropertySetter;->activate()V

    return-object v0

    .line 463
    :cond_0
    invoke-interface {p1, v3}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    .line 464
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_1

    .line 465
    check-cast v4, Lorg/w3c/dom/Element;

    .line 466
    invoke-interface {v4}, Lorg/w3c/dom/Element;->getTagName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "param"

    .line 467
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 468
    invoke-virtual {p0, v4, v1}, Lorg/apache/log4j/xml/DOMConfigurator;->setParameter(Lorg/w3c/dom/Element;Lorg/apache/log4j/config/PropertySetter;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "Could not create the Layout. Reported error follows."

    .line 477
    invoke-static {v0, p1}, Lorg/apache/log4j/helpers/LogLog;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 p1, 0x0

    return-object p1
.end method

.method protected parseLevel(Lorg/w3c/dom/Element;Lorg/apache/log4j/Logger;Z)V
    .locals 4

    .line 498
    invoke-virtual {p2}, Lorg/apache/log4j/Category;->getName()Ljava/lang/String;

    move-result-object v0

    if-eqz p3, :cond_0

    const-string v0, "root"

    :cond_0
    const-string v1, "value"

    .line 503
    invoke-interface {p1, v1}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/log4j/xml/DOMConfigurator;->subst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 504
    new-instance v2, Ljava/lang/StringBuffer;

    const-string v3, "Level value for "

    invoke-direct {v2, v3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v3, " is  ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v3, "]."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    const-string v2, "inherited"

    .line 506
    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_3

    const-string v2, "null"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_0

    :cond_1
    const-string p3, "class"

    .line 513
    invoke-interface {p1, p3}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/apache/log4j/xml/DOMConfigurator;->subst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string p3, ""

    .line 514
    invoke-virtual {p3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_2

    .line 515
    sget-object p1, Lorg/apache/log4j/Level;->DEBUG:Lorg/apache/log4j/Level;

    invoke-static {v1, p1}, Lorg/apache/log4j/helpers/OptionConverter;->toLevel(Ljava/lang/String;Lorg/apache/log4j/Level;)Lorg/apache/log4j/Level;

    move-result-object p1

    invoke-virtual {p2, p1}, Lorg/apache/log4j/Category;->setLevel(Lorg/apache/log4j/Level;)V

    goto :goto_1

    .line 517
    :cond_2
    new-instance p3, Ljava/lang/StringBuffer;

    const-string v2, "Desired Level sub-class: ["

    invoke-direct {p3, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const/16 v2, 0x5d

    invoke-virtual {p3, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    invoke-virtual {p3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p3}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    .line 519
    :try_start_0
    invoke-static {p1}, Lorg/apache/log4j/helpers/Loader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    const-string p3, "toLevel"

    .line 521
    sget-object v2, Lorg/apache/log4j/xml/DOMConfigurator;->ONE_STRING_PARAM:[Ljava/lang/Class;

    .line 520
    invoke-virtual {p1, p3, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    const/4 p3, 0x1

    .line 523
    new-array p3, p3, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v1, p3, v2

    .line 522
    invoke-virtual {p1, v3, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/log4j/Level;

    .line 524
    invoke-virtual {p2, p1}, Lorg/apache/log4j/Category;->setLevel(Lorg/apache/log4j/Level;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    .line 526
    new-instance p2, Ljava/lang/StringBuffer;

    const-string p3, "Could not create level ["

    invoke-direct {p2, p3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string p3, "]. Reported error follows."

    .line 527
    invoke-virtual {p2, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 526
    invoke-virtual {p2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2, p1}, Lorg/apache/log4j/helpers/LogLog;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void

    :cond_3
    :goto_0
    if-eqz p3, :cond_4

    const-string p1, "Root level cannot be inherited. Ignoring directive."

    .line 508
    invoke-static {p1}, Lorg/apache/log4j/helpers/LogLog;->error(Ljava/lang/String;)V

    goto :goto_1

    .line 510
    :cond_4
    invoke-virtual {p2, v3}, Lorg/apache/log4j/Category;->setLevel(Lorg/apache/log4j/Level;)V

    .line 532
    :goto_1
    new-instance p1, Ljava/lang/StringBuffer;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    invoke-direct {p1, p3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    const-string p3, " level set to "

    invoke-virtual {p1, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p2}, Lorg/apache/log4j/Category;->getLevel()Lorg/apache/log4j/Level;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    invoke-virtual {p1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    return-void
.end method

.method protected parseRenderer(Lorg/w3c/dom/Element;)V
    .locals 3

    const-string v0, "renderingClass"

    .line 485
    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/log4j/xml/DOMConfigurator;->subst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "renderedClass"

    .line 486
    invoke-interface {p1, v1}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/apache/log4j/xml/DOMConfigurator;->subst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 487
    iget-object v1, p0, Lorg/apache/log4j/xml/DOMConfigurator;->repository:Lorg/apache/log4j/spi/LoggerRepository;

    instance-of v2, v1, Lorg/apache/log4j/spi/RendererSupport;

    if-eqz v2, :cond_0

    .line 488
    check-cast v1, Lorg/apache/log4j/spi/RendererSupport;

    invoke-static {v1, p1, v0}, Lorg/apache/log4j/or/RendererMap;->addRenderer(Lorg/apache/log4j/spi/RendererSupport;Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method protected parseRoot(Lorg/w3c/dom/Element;)V
    .locals 2

    .line 391
    iget-object v0, p0, Lorg/apache/log4j/xml/DOMConfigurator;->repository:Lorg/apache/log4j/spi/LoggerRepository;

    invoke-interface {v0}, Lorg/apache/log4j/spi/LoggerRepository;->getRootLogger()Lorg/apache/log4j/Logger;

    move-result-object v0

    .line 393
    monitor-enter v0

    const/4 v1, 0x1

    .line 394
    :try_start_0
    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/log4j/xml/DOMConfigurator;->parseChildrenOfLoggerElement(Lorg/w3c/dom/Element;Lorg/apache/log4j/Logger;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 393
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0

    throw p1
.end method

.method protected setParameter(Lorg/w3c/dom/Element;Lorg/apache/log4j/config/PropertySetter;)V
    .locals 2

    const-string v0, "name"

    .line 537
    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/log4j/xml/DOMConfigurator;->subst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "value"

    .line 538
    invoke-interface {p1, v1}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 539
    invoke-static {p1}, Lorg/apache/log4j/helpers/OptionConverter;->convertSpecialChars(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/apache/log4j/xml/DOMConfigurator;->subst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 540
    invoke-virtual {p2, v0, p1}, Lorg/apache/log4j/config/PropertySetter;->setProperty(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method protected subst(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 841
    :try_start_0
    iget-object v0, p0, Lorg/apache/log4j/xml/DOMConfigurator;->props:Ljava/util/Properties;

    invoke-static {p1, v0}, Lorg/apache/log4j/helpers/OptionConverter;->substVars(Ljava/lang/String;Ljava/util/Properties;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    const-string v1, "Could not perform variable substitution."

    .line 843
    invoke-static {v1, v0}, Lorg/apache/log4j/helpers/LogLog;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object p1
.end method
