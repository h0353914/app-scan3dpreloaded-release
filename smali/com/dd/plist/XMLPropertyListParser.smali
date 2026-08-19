.class public Lcom/dd/plist/XMLPropertyListParser;
.super Ljava/lang/Object;
.source "XMLPropertyListParser.java"


# static fields
.field private static docBuilderFactory:Ljavax/xml/parsers/DocumentBuilderFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method protected constructor <init>()V
    .locals 0

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static filterElementNodes(Lorg/w3c/dom/NodeList;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/NodeList;",
            ")",
            "Ljava/util/List<",
            "Lorg/w3c/dom/Node;",
            ">;"
        }
    .end annotation

    .line 245
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v1, 0x0

    .line 246
    :goto_0
    invoke-interface {p0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 247
    invoke-interface {p0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    .line 248
    invoke-interface {p0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method private static declared-synchronized getDocBuilder()Ljavax/xml/parsers/DocumentBuilder;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/parsers/ParserConfigurationException;
        }
    .end annotation

    const-class v0, Lcom/dd/plist/XMLPropertyListParser;

    monitor-enter v0

    .line 76
    :try_start_0
    sget-object v1, Lcom/dd/plist/XMLPropertyListParser;->docBuilderFactory:Ljavax/xml/parsers/DocumentBuilderFactory;

    if-nez v1, :cond_0

    .line 77
    invoke-static {}, Lcom/dd/plist/XMLPropertyListParser;->initDocBuilderFactory()V

    .line 78
    :cond_0
    sget-object v1, Lcom/dd/plist/XMLPropertyListParser;->docBuilderFactory:Ljavax/xml/parsers/DocumentBuilderFactory;

    invoke-virtual {v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v1

    .line 79
    new-instance v2, Lcom/dd/plist/XMLPropertyListParser$1;

    invoke-direct {v2}, Lcom/dd/plist/XMLPropertyListParser$1;-><init>()V

    invoke-virtual {v1, v2}, Ljavax/xml/parsers/DocumentBuilder;->setEntityResolver(Lorg/xml/sax/EntityResolver;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 90
    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private static getNodeTextContents(Lorg/w3c/dom/Node;)Ljava/lang/String;
    .locals 5

    .line 263
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_6

    invoke-interface {p0}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v0

    const/4 v2, 0x4

    if-ne v0, v2, :cond_0

    goto :goto_2

    .line 271
    :cond_0
    invoke-interface {p0}, Lorg/w3c/dom/Node;->hasChildNodes()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 272
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object p0

    const/4 v0, 0x0

    .line 274
    :goto_0
    invoke-interface {p0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v3

    if-ge v0, v3, :cond_4

    .line 276
    invoke-interface {p0, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v3

    .line 277
    invoke-interface {v3}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v4

    if-eq v4, v1, :cond_2

    invoke-interface {v3}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v4

    if-ne v4, v2, :cond_1

    goto :goto_1

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 278
    :cond_2
    :goto_1
    check-cast v3, Lorg/w3c/dom/Text;

    .line 279
    invoke-interface {v3}, Lorg/w3c/dom/Text;->getWholeText()Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_3

    const-string p0, ""

    return-object p0

    :cond_3
    return-object p0

    :cond_4
    const-string p0, ""

    return-object p0

    :cond_5
    const-string p0, ""

    return-object p0

    .line 264
    :cond_6
    :goto_2
    check-cast p0, Lorg/w3c/dom/Text;

    .line 265
    invoke-interface {p0}, Lorg/w3c/dom/Text;->getWholeText()Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_7

    const-string p0, ""

    return-object p0

    :cond_7
    return-object p0
.end method

.method private static declared-synchronized initDocBuilderFactory()V
    .locals 3

    const-class v0, Lcom/dd/plist/XMLPropertyListParser;

    monitor-enter v0

    .line 62
    :try_start_0
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v1

    sput-object v1, Lcom/dd/plist/XMLPropertyListParser;->docBuilderFactory:Ljavax/xml/parsers/DocumentBuilderFactory;

    .line 63
    sget-object v1, Lcom/dd/plist/XMLPropertyListParser;->docBuilderFactory:Ljavax/xml/parsers/DocumentBuilderFactory;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljavax/xml/parsers/DocumentBuilderFactory;->setIgnoringComments(Z)V

    .line 64
    sget-object v1, Lcom/dd/plist/XMLPropertyListParser;->docBuilderFactory:Ljavax/xml/parsers/DocumentBuilderFactory;

    invoke-virtual {v1, v2}, Ljavax/xml/parsers/DocumentBuilderFactory;->setCoalescing(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 65
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static parse(Ljava/io/File;)Lcom/dd/plist/NSObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/parsers/ParserConfigurationException;,
            Ljava/io/IOException;,
            Lorg/xml/sax/SAXException;,
            Lcom/dd/plist/PropertyListFormatException;,
            Ljava/text/ParseException;
        }
    .end annotation

    .line 107
    invoke-static {}, Lcom/dd/plist/XMLPropertyListParser;->getDocBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v0

    .line 109
    invoke-virtual {v0, p0}, Ljavax/xml/parsers/DocumentBuilder;->parse(Ljava/io/File;)Lorg/w3c/dom/Document;

    move-result-object p0

    .line 111
    invoke-static {p0}, Lcom/dd/plist/XMLPropertyListParser;->parseDocument(Lorg/w3c/dom/Document;)Lcom/dd/plist/NSObject;

    move-result-object p0

    return-object p0
.end method

.method public static parse(Ljava/io/InputStream;)Lcom/dd/plist/NSObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/parsers/ParserConfigurationException;,
            Ljava/io/IOException;,
            Lorg/xml/sax/SAXException;,
            Lcom/dd/plist/PropertyListFormatException;,
            Ljava/text/ParseException;
        }
    .end annotation

    .line 145
    invoke-static {}, Lcom/dd/plist/XMLPropertyListParser;->getDocBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v0

    .line 147
    invoke-virtual {v0, p0}, Ljavax/xml/parsers/DocumentBuilder;->parse(Ljava/io/InputStream;)Lorg/w3c/dom/Document;

    move-result-object p0

    .line 149
    invoke-static {p0}, Lcom/dd/plist/XMLPropertyListParser;->parseDocument(Lorg/w3c/dom/Document;)Lcom/dd/plist/NSObject;

    move-result-object p0

    return-object p0
.end method

.method public static parse([B)Lcom/dd/plist/NSObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/parsers/ParserConfigurationException;,
            Ljava/text/ParseException;,
            Lorg/xml/sax/SAXException;,
            Lcom/dd/plist/PropertyListFormatException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 127
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 128
    invoke-static {v0}, Lcom/dd/plist/XMLPropertyListParser;->parse(Ljava/io/InputStream;)Lcom/dd/plist/NSObject;

    move-result-object p0

    return-object p0
.end method

.method private static parseDocument(Lorg/w3c/dom/Document;)Lcom/dd/plist/NSObject;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dd/plist/PropertyListFormatException;,
            Ljava/io/IOException;,
            Ljava/text/ParseException;
        }
    .end annotation

    .line 162
    invoke-interface {p0}, Lorg/w3c/dom/Document;->getDoctype()Lorg/w3c/dom/DocumentType;

    move-result-object v0

    if-nez v0, :cond_1

    .line 164
    invoke-interface {p0}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v0

    invoke-interface {v0}, Lorg/w3c/dom/Element;->getNodeName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "plist"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 165
    :cond_0
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string v0, "The given XML document is not a property list."

    invoke-direct {p0, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 167
    :cond_1
    invoke-interface {v0}, Lorg/w3c/dom/DocumentType;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "plist"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 173
    :goto_0
    invoke-interface {p0}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v0

    invoke-interface {v0}, Lorg/w3c/dom/Element;->getNodeName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "plist"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 175
    invoke-interface {p0}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object p0

    invoke-interface {p0}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object p0

    invoke-static {p0}, Lcom/dd/plist/XMLPropertyListParser;->filterElementNodes(Lorg/w3c/dom/NodeList;)Ljava/util/List;

    move-result-object p0

    .line 176
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    .line 178
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_2

    const/4 v0, 0x0

    .line 179
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorg/w3c/dom/Node;

    goto :goto_1

    .line 181
    :cond_2
    new-instance p0, Lcom/dd/plist/PropertyListFormatException;

    const-string v0, "The given XML property list has more than one root element!"

    invoke-direct {p0, v0}, Lcom/dd/plist/PropertyListFormatException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 177
    :cond_3
    new-instance p0, Lcom/dd/plist/PropertyListFormatException;

    const-string v0, "The given XML property list has no root element!"

    invoke-direct {p0, v0}, Lcom/dd/plist/PropertyListFormatException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 185
    :cond_4
    invoke-interface {p0}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object p0

    .line 188
    :goto_1
    invoke-static {p0}, Lcom/dd/plist/XMLPropertyListParser;->parseObject(Lorg/w3c/dom/Node;)Lcom/dd/plist/NSObject;

    move-result-object p0

    return-object p0

    .line 168
    :cond_5
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string v0, "The given XML document is not a property list."

    invoke-direct {p0, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static parseObject(Lorg/w3c/dom/Node;)Lcom/dd/plist/NSObject;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 200
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "dict"

    .line 201
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 202
    new-instance v0, Lcom/dd/plist/NSDictionary;

    invoke-direct {v0}, Lcom/dd/plist/NSDictionary;-><init>()V

    .line 203
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object p0

    invoke-static {p0}, Lcom/dd/plist/XMLPropertyListParser;->filterElementNodes(Lorg/w3c/dom/NodeList;)Ljava/util/List;

    move-result-object p0

    .line 204
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    if-ge v2, v1, :cond_0

    .line 205
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Node;

    add-int/lit8 v3, v2, 0x1

    .line 206
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/w3c/dom/Node;

    .line 208
    invoke-static {v1}, Lcom/dd/plist/XMLPropertyListParser;->getNodeTextContents(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    .line 210
    invoke-static {v3}, Lcom/dd/plist/XMLPropertyListParser;->parseObject(Lorg/w3c/dom/Node;)Lcom/dd/plist/NSObject;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Lcom/dd/plist/NSDictionary;->put(Ljava/lang/String;Lcom/dd/plist/NSObject;)Lcom/dd/plist/NSObject;

    add-int/lit8 v2, v2, 0x2

    goto :goto_0

    :cond_0
    return-object v0

    :cond_1
    const-string v1, "array"

    .line 213
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 214
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object p0

    invoke-static {p0}, Lcom/dd/plist/XMLPropertyListParser;->filterElementNodes(Lorg/w3c/dom/NodeList;)Ljava/util/List;

    move-result-object p0

    .line 215
    new-instance v0, Lcom/dd/plist/NSArray;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Lcom/dd/plist/NSArray;-><init>(I)V

    .line 216
    :goto_1
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    if-ge v2, v1, :cond_2

    .line 217
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Node;

    invoke-static {v1}, Lcom/dd/plist/XMLPropertyListParser;->parseObject(Lorg/w3c/dom/Node;)Lcom/dd/plist/NSObject;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Lcom/dd/plist/NSArray;->setValue(ILjava/lang/Object;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_2
    return-object v0

    :cond_3
    const-string v1, "true"

    .line 220
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 221
    new-instance p0, Lcom/dd/plist/NSNumber;

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/dd/plist/NSNumber;-><init>(Z)V

    return-object p0

    :cond_4
    const-string v1, "false"

    .line 222
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 223
    new-instance p0, Lcom/dd/plist/NSNumber;

    invoke-direct {p0, v2}, Lcom/dd/plist/NSNumber;-><init>(Z)V

    return-object p0

    :cond_5
    const-string v1, "integer"

    .line 224
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 225
    new-instance v0, Lcom/dd/plist/NSNumber;

    invoke-static {p0}, Lcom/dd/plist/XMLPropertyListParser;->getNodeTextContents(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/dd/plist/NSNumber;-><init>(Ljava/lang/String;)V

    return-object v0

    :cond_6
    const-string v1, "real"

    .line 226
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 227
    new-instance v0, Lcom/dd/plist/NSNumber;

    invoke-static {p0}, Lcom/dd/plist/XMLPropertyListParser;->getNodeTextContents(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/dd/plist/NSNumber;-><init>(Ljava/lang/String;)V

    return-object v0

    :cond_7
    const-string v1, "string"

    .line 228
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 229
    new-instance v0, Lcom/dd/plist/NSString;

    invoke-static {p0}, Lcom/dd/plist/XMLPropertyListParser;->getNodeTextContents(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/dd/plist/NSString;-><init>(Ljava/lang/String;)V

    return-object v0

    :cond_8
    const-string v1, "data"

    .line 230
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 231
    new-instance v0, Lcom/dd/plist/NSData;

    invoke-static {p0}, Lcom/dd/plist/XMLPropertyListParser;->getNodeTextContents(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/dd/plist/NSData;-><init>(Ljava/lang/String;)V

    return-object v0

    :cond_9
    const-string v1, "date"

    .line 232
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 233
    new-instance v0, Lcom/dd/plist/NSDate;

    invoke-static {p0}, Lcom/dd/plist/XMLPropertyListParser;->getNodeTextContents(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/dd/plist/NSDate;-><init>(Ljava/lang/String;)V

    return-object v0

    :cond_a
    const/4 p0, 0x0

    return-object p0
.end method
