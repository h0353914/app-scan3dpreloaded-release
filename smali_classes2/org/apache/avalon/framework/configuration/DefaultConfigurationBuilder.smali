.class public Lorg/apache/avalon/framework/configuration/DefaultConfigurationBuilder;
.super Ljava/lang/Object;
.source "DefaultConfigurationBuilder.java"


# instance fields
.field private m_handler:Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;

.field private m_parser:Lorg/xml/sax/XMLReader;


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 73
    invoke-direct {p0, v0}, Lorg/apache/avalon/framework/configuration/DefaultConfigurationBuilder;-><init>(Z)V

    return-void
.end method

.method public constructor <init>(Lorg/xml/sax/XMLReader;)V
    .locals 0

    .line 110
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 111
    invoke-direct {p0, p1}, Lorg/apache/avalon/framework/configuration/DefaultConfigurationBuilder;->setParser(Lorg/xml/sax/XMLReader;)V

    return-void
.end method

.method public constructor <init>(Z)V
    .locals 3

    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    :try_start_0
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v0

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    .line 93
    invoke-virtual {v0, p1}, Ljavax/xml/parsers/SAXParserFactory;->setNamespaceAware(Z)V

    .line 96
    :cond_0
    invoke-virtual {v0}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object p1

    .line 97
    invoke-virtual {p1}, Ljavax/xml/parsers/SAXParser;->getXMLReader()Lorg/xml/sax/XMLReader;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/apache/avalon/framework/configuration/DefaultConfigurationBuilder;->setParser(Lorg/xml/sax/XMLReader;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 101
    new-instance v0, Ljava/lang/Error;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Unable to setup SAX parser"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private setParser(Lorg/xml/sax/XMLReader;)V
    .locals 1

    .line 119
    iput-object p1, p0, Lorg/apache/avalon/framework/configuration/DefaultConfigurationBuilder;->m_parser:Lorg/xml/sax/XMLReader;

    .line 121
    invoke-virtual {p0}, Lorg/apache/avalon/framework/configuration/DefaultConfigurationBuilder;->getHandler()Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/avalon/framework/configuration/DefaultConfigurationBuilder;->m_handler:Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;

    .line 123
    iget-object p1, p0, Lorg/apache/avalon/framework/configuration/DefaultConfigurationBuilder;->m_parser:Lorg/xml/sax/XMLReader;

    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/DefaultConfigurationBuilder;->m_handler:Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;

    invoke-interface {p1, v0}, Lorg/xml/sax/XMLReader;->setContentHandler(Lorg/xml/sax/ContentHandler;)V

    .line 124
    iget-object p1, p0, Lorg/apache/avalon/framework/configuration/DefaultConfigurationBuilder;->m_parser:Lorg/xml/sax/XMLReader;

    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/DefaultConfigurationBuilder;->m_handler:Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;

    invoke-interface {p1, v0}, Lorg/xml/sax/XMLReader;->setErrorHandler(Lorg/xml/sax/ErrorHandler;)V

    return-void
.end method


# virtual methods
.method public build(Ljava/io/InputStream;)Lorg/apache/avalon/framework/configuration/Configuration;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;,
            Ljava/io/IOException;,
            Lorg/apache/avalon/framework/configuration/ConfigurationException;
        }
    .end annotation

    .line 192
    new-instance v0, Lorg/xml/sax/InputSource;

    invoke-direct {v0, p1}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {p0, v0}, Lorg/apache/avalon/framework/configuration/DefaultConfigurationBuilder;->build(Lorg/xml/sax/InputSource;)Lorg/apache/avalon/framework/configuration/Configuration;

    move-result-object p1

    return-object p1
.end method

.method public build(Ljava/lang/String;)Lorg/apache/avalon/framework/configuration/Configuration;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;,
            Ljava/io/IOException;,
            Lorg/apache/avalon/framework/configuration/ConfigurationException;
        }
    .end annotation

    .line 206
    new-instance v0, Lorg/xml/sax/InputSource;

    invoke-direct {v0, p1}, Lorg/xml/sax/InputSource;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lorg/apache/avalon/framework/configuration/DefaultConfigurationBuilder;->build(Lorg/xml/sax/InputSource;)Lorg/apache/avalon/framework/configuration/Configuration;

    move-result-object p1

    return-object p1
.end method

.method public build(Lorg/xml/sax/InputSource;)Lorg/apache/avalon/framework/configuration/Configuration;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;,
            Ljava/io/IOException;,
            Lorg/apache/avalon/framework/configuration/ConfigurationException;
        }
    .end annotation

    .line 220
    monitor-enter p0

    .line 222
    :try_start_0
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/DefaultConfigurationBuilder;->m_handler:Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;

    invoke-virtual {v0}, Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;->clear()V

    .line 223
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/DefaultConfigurationBuilder;->m_parser:Lorg/xml/sax/XMLReader;

    invoke-interface {v0, p1}, Lorg/xml/sax/XMLReader;->parse(Lorg/xml/sax/InputSource;)V

    .line 224
    iget-object p1, p0, Lorg/apache/avalon/framework/configuration/DefaultConfigurationBuilder;->m_handler:Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;

    invoke-virtual {p1}, Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;->getConfiguration()Lorg/apache/avalon/framework/configuration/Configuration;

    move-result-object p1

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    .line 225
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public buildFromFile(Ljava/io/File;)Lorg/apache/avalon/framework/configuration/Configuration;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;,
            Ljava/io/IOException;,
            Lorg/apache/avalon/framework/configuration/ConfigurationException;
        }
    .end annotation

    .line 173
    monitor-enter p0

    .line 175
    :try_start_0
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/DefaultConfigurationBuilder;->m_handler:Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;

    invoke-virtual {v0}, Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;->clear()V

    .line 176
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/DefaultConfigurationBuilder;->m_parser:Lorg/xml/sax/XMLReader;

    invoke-virtual {p1}, Ljava/io/File;->toURL()Ljava/net/URL;

    move-result-object p1

    invoke-virtual {p1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Lorg/xml/sax/XMLReader;->parse(Ljava/lang/String;)V

    .line 177
    iget-object p1, p0, Lorg/apache/avalon/framework/configuration/DefaultConfigurationBuilder;->m_handler:Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;

    invoke-virtual {p1}, Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;->getConfiguration()Lorg/apache/avalon/framework/configuration/Configuration;

    move-result-object p1

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    .line 178
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public buildFromFile(Ljava/lang/String;)Lorg/apache/avalon/framework/configuration/Configuration;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;,
            Ljava/io/IOException;,
            Lorg/apache/avalon/framework/configuration/ConfigurationException;
        }
    .end annotation

    .line 159
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lorg/apache/avalon/framework/configuration/DefaultConfigurationBuilder;->buildFromFile(Ljava/io/File;)Lorg/apache/avalon/framework/configuration/Configuration;

    move-result-object p1

    return-object p1
.end method

.method protected getHandler()Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;
    .locals 2

    .line 135
    :try_start_0
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/DefaultConfigurationBuilder;->m_parser:Lorg/xml/sax/XMLReader;

    const-string v1, "http://xml.org/sax/features/namespaces"

    invoke-interface {v0, v1}, Lorg/xml/sax/XMLReader;->getFeature(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 137
    new-instance v0, Lorg/apache/avalon/framework/configuration/NamespacedSAXConfigurationHandler;

    invoke-direct {v0}, Lorg/apache/avalon/framework/configuration/NamespacedSAXConfigurationHandler;-><init>()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 145
    :catch_0
    :cond_0
    new-instance v0, Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;

    invoke-direct {v0}, Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;-><init>()V

    return-object v0
.end method
