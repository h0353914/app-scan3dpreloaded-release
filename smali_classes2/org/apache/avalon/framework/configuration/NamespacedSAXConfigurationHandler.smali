.class public Lorg/apache/avalon/framework/configuration/NamespacedSAXConfigurationHandler;
.super Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;
.source "NamespacedSAXConfigurationHandler.java"


# static fields
.field private static final EXPECTED_DEPTH:I = 0x5


# instance fields
.field private m_configuration:Lorg/apache/avalon/framework/configuration/Configuration;

.field private final m_elements:Ljava/util/ArrayList;

.field private m_locator:Lorg/xml/sax/Locator;

.field private m_namespaceSupport:Lorg/xml/sax/helpers/NamespaceSupport;

.field private final m_prefixes:Ljava/util/ArrayList;

.field private final m_preserveSpace:Ljava/util/BitSet;

.field private final m_values:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 28
    invoke-direct {p0}, Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;-><init>()V

    .line 36
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/apache/avalon/framework/configuration/NamespacedSAXConfigurationHandler;->m_elements:Ljava/util/ArrayList;

    .line 37
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/apache/avalon/framework/configuration/NamespacedSAXConfigurationHandler;->m_prefixes:Ljava/util/ArrayList;

    .line 38
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/apache/avalon/framework/configuration/NamespacedSAXConfigurationHandler;->m_values:Ljava/util/ArrayList;

    .line 43
    new-instance v0, Ljava/util/BitSet;

    invoke-direct {v0}, Ljava/util/BitSet;-><init>()V

    iput-object v0, p0, Lorg/apache/avalon/framework/configuration/NamespacedSAXConfigurationHandler;->m_preserveSpace:Ljava/util/BitSet;

    .line 46
    new-instance v0, Lorg/xml/sax/helpers/NamespaceSupport;

    invoke-direct {v0}, Lorg/xml/sax/helpers/NamespaceSupport;-><init>()V

    iput-object v0, p0, Lorg/apache/avalon/framework/configuration/NamespacedSAXConfigurationHandler;->m_namespaceSupport:Lorg/xml/sax/helpers/NamespaceSupport;

    return-void
.end method


# virtual methods
.method public characters([CII)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 123
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/NamespacedSAXConfigurationHandler;->m_values:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .line 124
    iget-object v1, p0, Lorg/apache/avalon/framework/configuration/NamespacedSAXConfigurationHandler;->m_values:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/StringBuffer;

    .line 125
    invoke-virtual {v0, p1, p2, p3}, Ljava/lang/StringBuffer;->append([CII)Ljava/lang/StringBuffer;

    return-void
.end method

.method public clear()V
    .locals 2

    .line 63
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/NamespacedSAXConfigurationHandler;->m_elements:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 64
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/NamespacedSAXConfigurationHandler;->m_prefixes:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 65
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_0

    .line 69
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/NamespacedSAXConfigurationHandler;->m_prefixes:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 70
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/NamespacedSAXConfigurationHandler;->m_values:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    const/4 v0, 0x0

    .line 71
    iput-object v0, p0, Lorg/apache/avalon/framework/configuration/NamespacedSAXConfigurationHandler;->m_locator:Lorg/xml/sax/Locator;

    return-void

    .line 67
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    goto :goto_0
.end method

.method protected createConfiguration(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/apache/avalon/framework/configuration/DefaultConfiguration;
    .locals 2

    .line 205
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/NamespacedSAXConfigurationHandler;->m_namespaceSupport:Lorg/xml/sax/helpers/NamespaceSupport;

    invoke-virtual {v0, p2}, Lorg/xml/sax/helpers/NamespaceSupport;->getPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, ""

    .line 210
    :cond_0
    new-instance v1, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;

    invoke-direct {v1, p1, p3, p2, v0}, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v1
.end method

.method public endDocument()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 104
    invoke-super {p0}, Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;->endDocument()V

    .line 105
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/NamespacedSAXConfigurationHandler;->m_namespaceSupport:Lorg/xml/sax/helpers/NamespaceSupport;

    invoke-virtual {v0}, Lorg/xml/sax/helpers/NamespaceSupport;->reset()V

    return-void
.end method

.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 141
    iget-object p1, p0, Lorg/apache/avalon/framework/configuration/NamespacedSAXConfigurationHandler;->m_elements:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    .line 142
    iget-object p2, p0, Lorg/apache/avalon/framework/configuration/NamespacedSAXConfigurationHandler;->m_elements:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;

    .line 144
    iget-object p3, p0, Lorg/apache/avalon/framework/configuration/NamespacedSAXConfigurationHandler;->m_values:Ljava/util/ArrayList;

    invoke-virtual {p3, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/StringBuffer;

    invoke-virtual {p3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p3

    .line 146
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/NamespacedSAXConfigurationHandler;->m_prefixes:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 148
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 149
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_5

    .line 153
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 155
    invoke-virtual {p2}, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->getChildren()[Lorg/apache/avalon/framework/configuration/Configuration;

    move-result-object v0

    array-length v0, v0

    if-nez v0, :cond_2

    .line 159
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/NamespacedSAXConfigurationHandler;->m_preserveSpace:Ljava/util/BitSet;

    invoke-virtual {v0, p1}, Ljava/util/BitSet;->get(I)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 163
    :cond_0
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    const/4 p3, 0x0

    goto :goto_1

    .line 169
    :cond_1
    invoke-virtual {p3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p3

    .line 171
    :goto_1
    invoke-virtual {p2, p3}, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->setValue(Ljava/lang/String;)V

    goto :goto_2

    .line 175
    :cond_2
    invoke-virtual {p3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p3

    .line 176
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result p3

    if-gtz p3, :cond_4

    :goto_2
    if-nez p1, :cond_3

    .line 186
    iput-object p2, p0, Lorg/apache/avalon/framework/configuration/NamespacedSAXConfigurationHandler;->m_configuration:Lorg/apache/avalon/framework/configuration/Configuration;

    .line 189
    :cond_3
    iget-object p1, p0, Lorg/apache/avalon/framework/configuration/NamespacedSAXConfigurationHandler;->m_namespaceSupport:Lorg/xml/sax/helpers/NamespaceSupport;

    invoke-virtual {p1}, Lorg/xml/sax/helpers/NamespaceSupport;->popContext()V

    return-void

    .line 178
    :cond_4
    new-instance p1, Lorg/xml/sax/SAXException;

    new-instance p3, Ljava/lang/StringBuffer;

    invoke-direct {p3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v0, "Not allowed to define mixed content in the element "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p2}, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v0, " at "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p2}, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->getLocation()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lorg/xml/sax/SAXException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 151
    :cond_5
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p0, v2}, Lorg/apache/avalon/framework/configuration/NamespacedSAXConfigurationHandler;->endPrefixMapping(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public error(Lorg/xml/sax/SAXParseException;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 302
    throw p1
.end method

.method public fatalError(Lorg/xml/sax/SAXParseException;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 324
    throw p1
.end method

.method public getConfiguration()Lorg/apache/avalon/framework/configuration/Configuration;
    .locals 1

    .line 55
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/NamespacedSAXConfigurationHandler;->m_configuration:Lorg/apache/avalon/framework/configuration/Configuration;

    return-object v0
.end method

.method protected getLocationString()Ljava/lang/String;
    .locals 2

    .line 334
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/NamespacedSAXConfigurationHandler;->m_locator:Lorg/xml/sax/Locator;

    if-nez v0, :cond_0

    const-string v0, "Unknown"

    return-object v0

    .line 340
    :cond_0
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p0, Lorg/apache/avalon/framework/configuration/NamespacedSAXConfigurationHandler;->m_locator:Lorg/xml/sax/Locator;

    invoke-interface {v1}, Lorg/xml/sax/Locator;->getSystemId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget-object v1, p0, Lorg/apache/avalon/framework/configuration/NamespacedSAXConfigurationHandler;->m_locator:Lorg/xml/sax/Locator;

    invoke-interface {v1}, Lorg/xml/sax/Locator;->getLineNumber()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget-object v1, p0, Lorg/apache/avalon/framework/configuration/NamespacedSAXConfigurationHandler;->m_locator:Lorg/xml/sax/Locator;

    invoke-interface {v1}, Lorg/xml/sax/Locator;->getColumnNumber()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setDocumentLocator(Lorg/xml/sax/Locator;)V
    .locals 0

    .line 81
    iput-object p1, p0, Lorg/apache/avalon/framework/configuration/NamespacedSAXConfigurationHandler;->m_locator:Lorg/xml/sax/Locator;

    return-void
.end method

.method public startDocument()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 92
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/NamespacedSAXConfigurationHandler;->m_namespaceSupport:Lorg/xml/sax/helpers/NamespaceSupport;

    invoke-virtual {v0}, Lorg/xml/sax/helpers/NamespaceSupport;->reset()V

    .line 93
    invoke-super {p0}, Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;->startDocument()V

    return-void
.end method

.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 228
    iget-object p3, p0, Lorg/apache/avalon/framework/configuration/NamespacedSAXConfigurationHandler;->m_namespaceSupport:Lorg/xml/sax/helpers/NamespaceSupport;

    invoke-virtual {p3}, Lorg/xml/sax/helpers/NamespaceSupport;->pushContext()V

    .line 229
    invoke-virtual {p0}, Lorg/apache/avalon/framework/configuration/NamespacedSAXConfigurationHandler;->getLocationString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p0, p2, p1, p3}, Lorg/apache/avalon/framework/configuration/NamespacedSAXConfigurationHandler;->createConfiguration(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/apache/avalon/framework/configuration/DefaultConfiguration;

    move-result-object p1

    .line 233
    iget-object p2, p0, Lorg/apache/avalon/framework/configuration/NamespacedSAXConfigurationHandler;->m_elements:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    const/4 p3, 0x0

    if-lez p2, :cond_0

    .line 238
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/NamespacedSAXConfigurationHandler;->m_elements:Ljava/util/ArrayList;

    add-int/lit8 v1, p2, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;

    .line 240
    invoke-virtual {v0, p1}, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->addChild(Lorg/apache/avalon/framework/configuration/Configuration;)V

    .line 242
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/NamespacedSAXConfigurationHandler;->m_preserveSpace:Ljava/util/BitSet;

    invoke-virtual {v0, v1}, Ljava/util/BitSet;->get(I)Z

    move-result v0

    goto :goto_0

    :cond_0
    move v0, p3

    .line 245
    :goto_0
    iget-object v1, p0, Lorg/apache/avalon/framework/configuration/NamespacedSAXConfigurationHandler;->m_elements:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 246
    iget-object v1, p0, Lorg/apache/avalon/framework/configuration/NamespacedSAXConfigurationHandler;->m_values:Ljava/util/ArrayList;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 248
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 249
    new-instance v8, Lorg/xml/sax/helpers/AttributesImpl;

    invoke-direct {v8}, Lorg/xml/sax/helpers/AttributesImpl;-><init>()V

    move v9, v0

    move v0, p3

    .line 251
    :goto_1
    invoke-interface {p4}, Lorg/xml/sax/Attributes;->getLength()I

    move-result v2

    if-lt v0, v2, :cond_3

    if-eqz v9, :cond_1

    .line 275
    iget-object p4, p0, Lorg/apache/avalon/framework/configuration/NamespacedSAXConfigurationHandler;->m_preserveSpace:Ljava/util/BitSet;

    invoke-virtual {p4, p2}, Ljava/util/BitSet;->set(I)V

    goto :goto_2

    .line 279
    :cond_1
    iget-object p4, p0, Lorg/apache/avalon/framework/configuration/NamespacedSAXConfigurationHandler;->m_preserveSpace:Ljava/util/BitSet;

    invoke-virtual {p4, p2}, Ljava/util/BitSet;->clear(I)V

    .line 282
    :goto_2
    iget-object p2, p0, Lorg/apache/avalon/framework/configuration/NamespacedSAXConfigurationHandler;->m_prefixes:Ljava/util/ArrayList;

    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 284
    invoke-virtual {v8}, Lorg/xml/sax/helpers/AttributesImpl;->getLength()I

    move-result v2

    :goto_3
    if-lt p3, v2, :cond_2

    return-void

    .line 288
    :cond_2
    invoke-virtual {v8, p3}, Lorg/xml/sax/helpers/AttributesImpl;->getQName(I)Ljava/lang/String;

    move-result-object p2

    .line 289
    invoke-virtual {v8, p3}, Lorg/xml/sax/helpers/AttributesImpl;->getValue(I)Ljava/lang/String;

    move-result-object p4

    .line 290
    invoke-virtual {p1, p2, p4}, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    add-int/lit8 p3, p3, 0x1

    goto :goto_3

    .line 253
    :cond_3
    invoke-interface {p4, v0}, Lorg/xml/sax/Attributes;->getQName(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "xmlns"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 255
    invoke-interface {p4, v0}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 256
    invoke-interface {p4, v0}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {p4, v0}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lorg/apache/avalon/framework/configuration/NamespacedSAXConfigurationHandler;->startPrefixMapping(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    .line 259
    :cond_4
    invoke-interface {p4, v0}, Lorg/xml/sax/Attributes;->getQName(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "xml:space"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 261
    invoke-interface {p4, v0}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "preserve"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    move v9, v2

    goto :goto_4

    .line 265
    :cond_5
    invoke-interface {p4, v0}, Lorg/xml/sax/Attributes;->getURI(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {p4, v0}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {p4, v0}, Lorg/xml/sax/Attributes;->getQName(I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {p4, v0}, Lorg/xml/sax/Attributes;->getType(I)Ljava/lang/String;

    move-result-object v6

    invoke-interface {p4, v0}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v7

    move-object v2, v8

    invoke-virtual/range {v2 .. v7}, Lorg/xml/sax/helpers/AttributesImpl;->addAttribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :goto_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public startPrefixMapping(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 357
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/NamespacedSAXConfigurationHandler;->m_namespaceSupport:Lorg/xml/sax/helpers/NamespaceSupport;

    invoke-virtual {v0, p1, p2}, Lorg/xml/sax/helpers/NamespaceSupport;->declarePrefix(Ljava/lang/String;Ljava/lang/String;)Z

    .line 358
    invoke-super {p0, p1, p2}, Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;->startPrefixMapping(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public warning(Lorg/xml/sax/SAXParseException;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 313
    throw p1
.end method
