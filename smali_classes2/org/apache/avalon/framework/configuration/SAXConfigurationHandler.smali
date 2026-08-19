.class public Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "SAXConfigurationHandler.java"

# interfaces
.implements Lorg/xml/sax/ErrorHandler;


# static fields
.field private static final EXPECTED_DEPTH:I = 0x5


# instance fields
.field private m_configuration:Lorg/apache/avalon/framework/configuration/Configuration;

.field private final m_elements:Ljava/util/ArrayList;

.field private m_locator:Lorg/xml/sax/Locator;

.field private final m_preserveSpace:Ljava/util/BitSet;

.field private final m_values:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 25
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 34
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;->m_elements:Ljava/util/ArrayList;

    .line 35
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;->m_values:Ljava/util/ArrayList;

    .line 40
    new-instance v0, Ljava/util/BitSet;

    invoke-direct {v0}, Ljava/util/BitSet;-><init>()V

    iput-object v0, p0, Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;->m_preserveSpace:Ljava/util/BitSet;

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

    .line 89
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;->m_values:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .line 90
    iget-object v1, p0, Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;->m_values:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/StringBuffer;

    .line 91
    invoke-virtual {v0, p1, p2, p3}, Ljava/lang/StringBuffer;->append([CII)Ljava/lang/StringBuffer;

    return-void
.end method

.method public clear()V
    .locals 1

    .line 59
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;->m_elements:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 60
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;->m_values:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    const/4 v0, 0x0

    .line 61
    iput-object v0, p0, Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;->m_locator:Lorg/xml/sax/Locator;

    return-void
.end method

.method protected createConfiguration(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/avalon/framework/configuration/DefaultConfiguration;
    .locals 1

    .line 159
    new-instance v0, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;

    invoke-direct {v0, p1, p2}, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 107
    iget-object p1, p0, Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;->m_elements:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    .line 108
    iget-object p2, p0, Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;->m_elements:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;

    .line 110
    iget-object p3, p0, Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;->m_values:Ljava/util/ArrayList;

    invoke-virtual {p3, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/StringBuffer;

    invoke-virtual {p3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p3

    .line 113
    invoke-virtual {p2}, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->getChildren()[Lorg/apache/avalon/framework/configuration/Configuration;

    move-result-object v0

    array-length v0, v0

    if-nez v0, :cond_2

    .line 117
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;->m_preserveSpace:Ljava/util/BitSet;

    invoke-virtual {v0, p1}, Ljava/util/BitSet;->get(I)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 121
    :cond_0
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    const/4 p3, 0x0

    goto :goto_0

    .line 127
    :cond_1
    invoke-virtual {p3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p3

    .line 129
    :goto_0
    invoke-virtual {p2, p3}, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->setValue(Ljava/lang/String;)V

    goto :goto_1

    .line 133
    :cond_2
    invoke-virtual {p3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p3

    .line 134
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result p3

    if-gtz p3, :cond_4

    :goto_1
    if-nez p1, :cond_3

    .line 144
    iput-object p2, p0, Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;->m_configuration:Lorg/apache/avalon/framework/configuration/Configuration;

    :cond_3
    return-void

    .line 136
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
.end method

.method public error(Lorg/xml/sax/SAXParseException;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 231
    throw p1
.end method

.method public fatalError(Lorg/xml/sax/SAXParseException;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 253
    throw p1
.end method

.method public getConfiguration()Lorg/apache/avalon/framework/configuration/Configuration;
    .locals 1

    .line 51
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;->m_configuration:Lorg/apache/avalon/framework/configuration/Configuration;

    return-object v0
.end method

.method protected getLocationString()Ljava/lang/String;
    .locals 2

    .line 263
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;->m_locator:Lorg/xml/sax/Locator;

    if-nez v0, :cond_0

    const-string v0, "Unknown"

    return-object v0

    .line 269
    :cond_0
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p0, Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;->m_locator:Lorg/xml/sax/Locator;

    invoke-interface {v1}, Lorg/xml/sax/Locator;->getSystemId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget-object v1, p0, Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;->m_locator:Lorg/xml/sax/Locator;

    invoke-interface {v1}, Lorg/xml/sax/Locator;->getLineNumber()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget-object v1, p0, Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;->m_locator:Lorg/xml/sax/Locator;

    invoke-interface {v1}, Lorg/xml/sax/Locator;->getColumnNumber()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setDocumentLocator(Lorg/xml/sax/Locator;)V
    .locals 0

    .line 71
    iput-object p1, p0, Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;->m_locator:Lorg/xml/sax/Locator;

    return-void
.end method

.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 177
    invoke-virtual {p0}, Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;->getLocationString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p3, p1}, Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;->createConfiguration(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/avalon/framework/configuration/DefaultConfiguration;

    move-result-object p1

    .line 181
    iget-object p2, p0, Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;->m_elements:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    const/4 p3, 0x0

    if-lez p2, :cond_0

    .line 186
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;->m_elements:Ljava/util/ArrayList;

    add-int/lit8 v1, p2, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;

    .line 188
    invoke-virtual {v0, p1}, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->addChild(Lorg/apache/avalon/framework/configuration/Configuration;)V

    .line 190
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;->m_preserveSpace:Ljava/util/BitSet;

    invoke-virtual {v0, v1}, Ljava/util/BitSet;->get(I)Z

    move-result v0

    goto :goto_0

    :cond_0
    move v0, p3

    .line 193
    :goto_0
    iget-object v1, p0, Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;->m_elements:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 194
    iget-object v1, p0, Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;->m_values:Ljava/util/ArrayList;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 196
    invoke-interface {p4}, Lorg/xml/sax/Attributes;->getLength()I

    move-result v1

    :goto_1
    if-lt p3, v1, :cond_2

    if-eqz v0, :cond_1

    .line 215
    iget-object p1, p0, Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;->m_preserveSpace:Ljava/util/BitSet;

    invoke-virtual {p1, p2}, Ljava/util/BitSet;->set(I)V

    goto :goto_2

    .line 219
    :cond_1
    iget-object p1, p0, Lorg/apache/avalon/framework/configuration/SAXConfigurationHandler;->m_preserveSpace:Ljava/util/BitSet;

    invoke-virtual {p1, p2}, Ljava/util/BitSet;->clear(I)V

    :goto_2
    return-void

    .line 200
    :cond_2
    invoke-interface {p4, p3}, Lorg/xml/sax/Attributes;->getQName(I)Ljava/lang/String;

    move-result-object v2

    .line 201
    invoke-interface {p4, p3}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, "xml:space"

    .line 203
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 205
    invoke-virtual {p1, v2, v3}, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    :cond_3
    const-string v0, "preserve"

    .line 209
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    :goto_3
    add-int/lit8 p3, p3, 0x1

    goto :goto_1
.end method

.method public warning(Lorg/xml/sax/SAXParseException;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 242
    throw p1
.end method
