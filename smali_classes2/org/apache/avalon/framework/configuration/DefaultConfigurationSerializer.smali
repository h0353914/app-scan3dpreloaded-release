.class public Lorg/apache/avalon/framework/configuration/DefaultConfigurationSerializer;
.super Ljava/lang/Object;
.source "DefaultConfigurationSerializer.java"


# instance fields
.field private m_format:Ljava/util/Properties;

.field private m_tfactory:Ljavax/xml/transform/sax/SAXTransformerFactory;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    new-instance v0, Ljava/util/Properties;

    invoke-direct {v0}, Ljava/util/Properties;-><init>()V

    iput-object v0, p0, Lorg/apache/avalon/framework/configuration/DefaultConfigurationSerializer;->m_format:Ljava/util/Properties;

    return-void
.end method


# virtual methods
.method protected createContentHandler(Ljavax/xml/transform/Result;)Lorg/xml/sax/ContentHandler;
    .locals 4

    .line 66
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/avalon/framework/configuration/DefaultConfigurationSerializer;->getTransformerFactory()Ljavax/xml/transform/sax/SAXTransformerFactory;

    move-result-object v0

    invoke-virtual {v0}, Ljavax/xml/transform/sax/SAXTransformerFactory;->newTransformerHandler()Ljavax/xml/transform/sax/TransformerHandler;

    move-result-object v0

    .line 68
    iget-object v1, p0, Lorg/apache/avalon/framework/configuration/DefaultConfigurationSerializer;->m_format:Ljava/util/Properties;

    const-string v2, "method"

    const-string v3, "xml"

    invoke-virtual {v1, v2, v3}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    invoke-interface {v0, p1}, Ljavax/xml/transform/sax/TransformerHandler;->setResult(Ljavax/xml/transform/Result;)V

    .line 70
    invoke-interface {v0}, Ljavax/xml/transform/sax/TransformerHandler;->getTransformer()Ljavax/xml/transform/Transformer;

    move-result-object p1

    iget-object v1, p0, Lorg/apache/avalon/framework/configuration/DefaultConfigurationSerializer;->m_format:Ljava/util/Properties;

    invoke-virtual {p1, v1}, Ljavax/xml/transform/Transformer;->setOutputProperties(Ljava/util/Properties;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p1

    .line 76
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-virtual {p1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected getTransformerFactory()Ljavax/xml/transform/sax/SAXTransformerFactory;
    .locals 1

    .line 87
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/DefaultConfigurationSerializer;->m_tfactory:Ljavax/xml/transform/sax/SAXTransformerFactory;

    if-nez v0, :cond_0

    .line 89
    invoke-static {}, Ljavax/xml/transform/TransformerFactory;->newInstance()Ljavax/xml/transform/TransformerFactory;

    move-result-object v0

    check-cast v0, Ljavax/xml/transform/sax/SAXTransformerFactory;

    iput-object v0, p0, Lorg/apache/avalon/framework/configuration/DefaultConfigurationSerializer;->m_tfactory:Ljavax/xml/transform/sax/SAXTransformerFactory;

    .line 92
    :cond_0
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/DefaultConfigurationSerializer;->m_tfactory:Ljavax/xml/transform/sax/SAXTransformerFactory;

    return-object v0
.end method

.method public serialize(Lorg/apache/avalon/framework/configuration/Configuration;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;,
            Lorg/apache/avalon/framework/configuration/ConfigurationException;
        }
    .end annotation

    .line 307
    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 309
    new-instance v1, Ljavax/xml/transform/stream/StreamResult;

    invoke-direct {v1, v0}, Ljavax/xml/transform/stream/StreamResult;-><init>(Ljava/io/Writer;)V

    invoke-virtual {p0, v1}, Lorg/apache/avalon/framework/configuration/DefaultConfigurationSerializer;->createContentHandler(Ljavax/xml/transform/Result;)Lorg/xml/sax/ContentHandler;

    move-result-object v1

    invoke-virtual {p0, v1, p1}, Lorg/apache/avalon/framework/configuration/DefaultConfigurationSerializer;->serialize(Lorg/xml/sax/ContentHandler;Lorg/apache/avalon/framework/configuration/Configuration;)V

    .line 311
    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Ljava/io/OutputStream;Lorg/apache/avalon/framework/configuration/Configuration;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;,
            Ljava/io/IOException;,
            Lorg/apache/avalon/framework/configuration/ConfigurationException;
        }
    .end annotation

    .line 267
    new-instance v0, Ljavax/xml/transform/stream/StreamResult;

    invoke-direct {v0, p1}, Ljavax/xml/transform/stream/StreamResult;-><init>(Ljava/io/OutputStream;)V

    invoke-virtual {p0, v0}, Lorg/apache/avalon/framework/configuration/DefaultConfigurationSerializer;->createContentHandler(Ljavax/xml/transform/Result;)Lorg/xml/sax/ContentHandler;

    move-result-object p1

    invoke-virtual {p0, p1, p2}, Lorg/apache/avalon/framework/configuration/DefaultConfigurationSerializer;->serialize(Lorg/xml/sax/ContentHandler;Lorg/apache/avalon/framework/configuration/Configuration;)V

    return-void
.end method

.method public serialize(Ljava/lang/String;Lorg/apache/avalon/framework/configuration/Configuration;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;,
            Ljava/io/IOException;,
            Lorg/apache/avalon/framework/configuration/ConfigurationException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 285
    :try_start_0
    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p1

    invoke-virtual {p1}, Ljava/net/URLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    .line 286
    invoke-virtual {p0, v0, p2}, Lorg/apache/avalon/framework/configuration/DefaultConfigurationSerializer;->serialize(Ljava/io/OutputStream;Lorg/apache/avalon/framework/configuration/Configuration;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    .line 292
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    :cond_0
    return-void

    :catchall_0
    move-exception p1

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 290
    :cond_1
    throw p1
.end method

.method public serialize(Lorg/xml/sax/ContentHandler;Lorg/apache/avalon/framework/configuration/Configuration;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;,
            Lorg/apache/avalon/framework/configuration/ConfigurationException;
        }
    .end annotation

    .line 105
    invoke-interface {p1}, Lorg/xml/sax/ContentHandler;->startDocument()V

    .line 106
    new-instance v0, Lorg/xml/sax/helpers/NamespaceSupport;

    invoke-direct {v0}, Lorg/xml/sax/helpers/NamespaceSupport;-><init>()V

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/avalon/framework/configuration/DefaultConfigurationSerializer;->serializeElement(Lorg/xml/sax/ContentHandler;Lorg/xml/sax/helpers/NamespaceSupport;Lorg/apache/avalon/framework/configuration/Configuration;)V

    .line 107
    invoke-interface {p1}, Lorg/xml/sax/ContentHandler;->endDocument()V

    return-void
.end method

.method protected serializeElement(Lorg/xml/sax/ContentHandler;Lorg/xml/sax/helpers/NamespaceSupport;Lorg/apache/avalon/framework/configuration/Configuration;)V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;,
            Lorg/apache/avalon/framework/configuration/ConfigurationException;
        }
    .end annotation

    .line 123
    invoke-virtual {p2}, Lorg/xml/sax/helpers/NamespaceSupport;->pushContext()V

    .line 125
    new-instance v6, Lorg/xml/sax/helpers/AttributesImpl;

    invoke-direct {v6}, Lorg/xml/sax/helpers/AttributesImpl;-><init>()V

    .line 126
    invoke-interface {p3}, Lorg/apache/avalon/framework/configuration/Configuration;->getAttributeNames()[Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    if-eqz v7, :cond_1

    move v9, v8

    .line 130
    :goto_0
    array-length v0, v7

    if-lt v9, v0, :cond_0

    goto :goto_1

    :cond_0
    const-string v1, ""

    .line 132
    aget-object v2, v7, v9

    aget-object v3, v7, v9

    const-string v4, "CDATA"

    aget-object v0, v7, v9

    const-string v5, ""

    invoke-interface {p3, v0, v5}, Lorg/apache/avalon/framework/configuration/Configuration;->getAttribute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object v0, v6

    invoke-virtual/range {v0 .. v5}, Lorg/xml/sax/helpers/AttributesImpl;->addAttribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 141
    :cond_1
    :goto_1
    invoke-interface {p3}, Lorg/apache/avalon/framework/configuration/Configuration;->getNamespace()Ljava/lang/String;

    move-result-object v7

    const-string v0, ""

    .line 144
    instance-of v1, p3, Lorg/apache/avalon/framework/configuration/AbstractConfiguration;

    if-eqz v1, :cond_2

    .line 146
    move-object v0, p3

    check-cast v0, Lorg/apache/avalon/framework/configuration/AbstractConfiguration;

    invoke-virtual {v0}, Lorg/apache/avalon/framework/configuration/AbstractConfiguration;->getPrefix()Ljava/lang/String;

    move-result-object v0

    move-object v9, v0

    goto :goto_2

    :cond_2
    move-object v9, v0

    .line 152
    :goto_2
    invoke-virtual {p2, v9}, Lorg/xml/sax/helpers/NamespaceSupport;->getURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 156
    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    goto :goto_3

    :cond_3
    move v0, v8

    goto :goto_5

    :cond_4
    :goto_3
    const-string v0, ""

    .line 159
    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    const-string v0, ""

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    goto :goto_4

    :cond_5
    const-string v0, ""

    .line 163
    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    const-string v1, ""

    const-string v2, "xmlns"

    const-string v3, "xmlns"

    const-string v4, "CDATA"

    move-object v0, v6

    move-object v5, v7

    .line 166
    invoke-virtual/range {v0 .. v5}, Lorg/xml/sax/helpers/AttributesImpl;->addAttribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    :cond_6
    const-string v1, ""

    .line 171
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "xmlns:"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "xmlns:"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "CDATA"

    move-object v0, v6

    move-object v5, v7

    invoke-virtual/range {v0 .. v5}, Lorg/xml/sax/helpers/AttributesImpl;->addAttribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 173
    :goto_4
    invoke-interface {p1, v9, v7}, Lorg/xml/sax/ContentHandler;->startPrefixMapping(Ljava/lang/String;Ljava/lang/String;)V

    .line 174
    invoke-virtual {p2, v9, v7}, Lorg/xml/sax/helpers/NamespaceSupport;->declarePrefix(Ljava/lang/String;Ljava/lang/String;)Z

    const/4 v0, 0x1

    .line 177
    :goto_5
    invoke-interface {p3}, Lorg/apache/avalon/framework/configuration/Configuration;->getName()Ljava/lang/String;

    move-result-object v1

    .line 178
    invoke-interface {p3}, Lorg/apache/avalon/framework/configuration/Configuration;->getName()Ljava/lang/String;

    if-eqz v9, :cond_8

    .line 179
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_7

    goto :goto_6

    .line 185
    :cond_7
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_7

    :cond_8
    :goto_6
    move-object v2, v1

    .line 188
    :goto_7
    invoke-interface {p1, v7, v1, v2, v6}, Lorg/xml/sax/ContentHandler;->startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    const/4 v3, 0x0

    .line 190
    invoke-interface {p3, v3}, Lorg/apache/avalon/framework/configuration/Configuration;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_a

    .line 194
    invoke-interface {p3}, Lorg/apache/avalon/framework/configuration/Configuration;->getChildren()[Lorg/apache/avalon/framework/configuration/Configuration;

    move-result-object p3

    .line 196
    :goto_8
    array-length v3, p3

    if-lt v8, v3, :cond_9

    goto :goto_9

    .line 198
    :cond_9
    aget-object v3, p3, v8

    invoke-virtual {p0, p1, p2, v3}, Lorg/apache/avalon/framework/configuration/DefaultConfigurationSerializer;->serializeElement(Lorg/xml/sax/ContentHandler;Lorg/xml/sax/helpers/NamespaceSupport;Lorg/apache/avalon/framework/configuration/Configuration;)V

    add-int/lit8 v8, v8, 0x1

    goto :goto_8

    .line 203
    :cond_a
    invoke-virtual {v3}, Ljava/lang/String;->toCharArray()[C

    move-result-object p3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    invoke-interface {p1, p3, v8, v3}, Lorg/xml/sax/ContentHandler;->characters([CII)V

    .line 206
    :goto_9
    invoke-interface {p1, v7, v1, v2}, Lorg/xml/sax/ContentHandler;->endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v0, :cond_b

    .line 210
    invoke-interface {p1, v9}, Lorg/xml/sax/ContentHandler;->endPrefixMapping(Ljava/lang/String;)V

    .line 213
    :cond_b
    invoke-virtual {p2}, Lorg/xml/sax/helpers/NamespaceSupport;->popContext()V

    return-void
.end method

.method public serializeToFile(Ljava/io/File;Lorg/apache/avalon/framework/configuration/Configuration;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;,
            Ljava/io/IOException;,
            Lorg/apache/avalon/framework/configuration/ConfigurationException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 244
    :try_start_0
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 245
    :try_start_1
    invoke-virtual {p0, v1, p2}, Lorg/apache/avalon/framework/configuration/DefaultConfigurationSerializer;->serialize(Ljava/io/OutputStream;Lorg/apache/avalon/framework/configuration/Configuration;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 251
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    return-void

    :catchall_0
    move-exception p1

    move-object v0, v1

    goto :goto_0

    :catchall_1
    move-exception p1

    :goto_0
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 249
    :cond_0
    throw p1
.end method

.method public serializeToFile(Ljava/lang/String;Lorg/apache/avalon/framework/configuration/Configuration;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;,
            Ljava/io/IOException;,
            Lorg/apache/avalon/framework/configuration/ConfigurationException;
        }
    .end annotation

    .line 227
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0, p2}, Lorg/apache/avalon/framework/configuration/DefaultConfigurationSerializer;->serializeToFile(Ljava/io/File;Lorg/apache/avalon/framework/configuration/Configuration;)V

    return-void
.end method

.method public setIndent(Z)V
    .locals 2

    if-eqz p1, :cond_0

    .line 49
    iget-object p1, p0, Lorg/apache/avalon/framework/configuration/DefaultConfigurationSerializer;->m_format:Ljava/util/Properties;

    const-string v0, "indent"

    const-string v1, "yes"

    invoke-virtual {p1, v0, v1}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 53
    :cond_0
    iget-object p1, p0, Lorg/apache/avalon/framework/configuration/DefaultConfigurationSerializer;->m_format:Ljava/util/Properties;

    const-string v0, "indent"

    const-string v1, "no"

    invoke-virtual {p1, v0, v1}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_0
    return-void
.end method
