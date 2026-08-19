.class public Lcom/dd/plist/PropertyListParser;
.super Ljava/lang/Object;
.source "PropertyListParser.java"


# static fields
.field private static final TYPE_ASCII:I = 0x2

.field private static final TYPE_BINARY:I = 0x1

.field private static final TYPE_ERROR_BLANK:I = 0xa

.field private static final TYPE_ERROR_UNKNOWN:I = 0xb

.field private static final TYPE_XML:I


# direct methods
.method protected constructor <init>()V
    .locals 0

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static convertToASCII(Ljava/io/File;Ljava/io/File;)V
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

    .line 370
    invoke-static {p0}, Lcom/dd/plist/PropertyListParser;->parse(Ljava/io/File;)Lcom/dd/plist/NSObject;

    move-result-object p0

    .line 371
    instance-of v0, p0, Lcom/dd/plist/NSDictionary;

    if-eqz v0, :cond_0

    .line 372
    check-cast p0, Lcom/dd/plist/NSDictionary;

    invoke-static {p0, p1}, Lcom/dd/plist/PropertyListParser;->saveAsASCII(Lcom/dd/plist/NSDictionary;Ljava/io/File;)V

    goto :goto_0

    .line 374
    :cond_0
    instance-of v0, p0, Lcom/dd/plist/NSArray;

    if-eqz v0, :cond_1

    .line 375
    check-cast p0, Lcom/dd/plist/NSArray;

    invoke-static {p0, p1}, Lcom/dd/plist/PropertyListParser;->saveAsASCII(Lcom/dd/plist/NSArray;Ljava/io/File;)V

    :goto_0
    return-void

    .line 378
    :cond_1
    new-instance p0, Lcom/dd/plist/PropertyListFormatException;

    const-string p1, "The root of the given input property list is neither a Dictionary nor an Array!"

    invoke-direct {p0, p1}, Lcom/dd/plist/PropertyListFormatException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static convertToBinary(Ljava/io/File;Ljava/io/File;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljavax/xml/parsers/ParserConfigurationException;,
            Ljava/text/ParseException;,
            Lorg/xml/sax/SAXException;,
            Lcom/dd/plist/PropertyListFormatException;
        }
    .end annotation

    .line 323
    invoke-static {p0}, Lcom/dd/plist/PropertyListParser;->parse(Ljava/io/File;)Lcom/dd/plist/NSObject;

    move-result-object p0

    .line 324
    invoke-static {p0, p1}, Lcom/dd/plist/PropertyListParser;->saveAsBinary(Lcom/dd/plist/NSObject;Ljava/io/File;)V

    return-void
.end method

.method public static convertToGnuStepASCII(Ljava/io/File;Ljava/io/File;)V
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

    .line 430
    invoke-static {p0}, Lcom/dd/plist/PropertyListParser;->parse(Ljava/io/File;)Lcom/dd/plist/NSObject;

    move-result-object p0

    .line 431
    instance-of v0, p0, Lcom/dd/plist/NSDictionary;

    if-eqz v0, :cond_0

    .line 432
    check-cast p0, Lcom/dd/plist/NSDictionary;

    invoke-static {p0, p1}, Lcom/dd/plist/PropertyListParser;->saveAsGnuStepASCII(Lcom/dd/plist/NSDictionary;Ljava/io/File;)V

    goto :goto_0

    .line 434
    :cond_0
    instance-of v0, p0, Lcom/dd/plist/NSArray;

    if-eqz v0, :cond_1

    .line 435
    check-cast p0, Lcom/dd/plist/NSArray;

    invoke-static {p0, p1}, Lcom/dd/plist/PropertyListParser;->saveAsGnuStepASCII(Lcom/dd/plist/NSArray;Ljava/io/File;)V

    :goto_0
    return-void

    .line 438
    :cond_1
    new-instance p0, Lcom/dd/plist/PropertyListFormatException;

    const-string p1, "The root of the given input property list is neither a Dictionary nor an Array!"

    invoke-direct {p0, p1}, Lcom/dd/plist/PropertyListFormatException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static convertToXml(Ljava/io/File;Ljava/io/File;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/parsers/ParserConfigurationException;,
            Ljava/text/ParseException;,
            Lorg/xml/sax/SAXException;,
            Lcom/dd/plist/PropertyListFormatException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 280
    invoke-static {p0}, Lcom/dd/plist/PropertyListParser;->parse(Ljava/io/File;)Lcom/dd/plist/NSObject;

    move-result-object p0

    .line 281
    invoke-static {p0, p1}, Lcom/dd/plist/PropertyListParser;->saveAsXML(Lcom/dd/plist/NSObject;Ljava/io/File;)V

    return-void
.end method

.method private static determineType(Ljava/io/InputStream;)I
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x8

    .line 110
    new-array v0, v0, [B

    const/4 v1, 0x0

    const-wide/16 v2, -0x1

    move v4, v1

    .line 115
    :cond_0
    invoke-virtual {p0}, Ljava/io/InputStream;->markSupported()Z

    move-result v5

    if-eqz v5, :cond_1

    const/16 v5, 0x10

    .line 116
    invoke-virtual {p0, v5}, Ljava/io/InputStream;->mark(I)V

    .line 117
    :cond_1
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v5

    const-wide/16 v6, 0x1

    add-long/2addr v2, v6

    const-wide/16 v8, 0x3

    cmp-long v8, v2, v8

    const/4 v9, 0x1

    if-gez v8, :cond_5

    const-wide/16 v10, 0x0

    cmp-long v8, v2, v10

    if-nez v8, :cond_2

    const/16 v8, 0xef

    if-eq v5, v8, :cond_4

    :cond_2
    if-eqz v4, :cond_5

    cmp-long v4, v2, v6

    if-nez v4, :cond_3

    const/16 v4, 0xbb

    if-eq v5, v4, :cond_4

    :cond_3
    const-wide/16 v6, 0x2

    cmp-long v4, v2, v6

    if-nez v4, :cond_5

    const/16 v4, 0xbf

    if-ne v5, v4, :cond_5

    :cond_4
    move v4, v9

    goto :goto_0

    :cond_5
    move v4, v1

    :goto_0
    const/4 v6, -0x1

    if-eq v5, v6, :cond_6

    const/16 v6, 0x20

    if-eq v5, v6, :cond_0

    :cond_6
    const/16 v6, 0x9

    if-eq v5, v6, :cond_0

    const/16 v6, 0xd

    if-eq v5, v6, :cond_0

    const/16 v6, 0xa

    if-eq v5, v6, :cond_0

    const/16 v6, 0xc

    if-eq v5, v6, :cond_0

    if-nez v4, :cond_0

    int-to-byte v2, v5

    aput-byte v2, v0, v1

    const/4 v2, 0x7

    .line 124
    invoke-virtual {p0, v0, v9, v2}, Ljava/io/InputStream;->read([BII)I

    move-result v2

    .line 125
    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, v0, v1, v2}, Ljava/lang/String;-><init>([BII)V

    invoke-static {v3}, Lcom/dd/plist/PropertyListParser;->determineType(Ljava/lang/String;)I

    move-result v0

    .line 126
    invoke-virtual {p0}, Ljava/io/InputStream;->markSupported()Z

    move-result v1

    if-eqz v1, :cond_7

    .line 127
    invoke-virtual {p0}, Ljava/io/InputStream;->reset()V

    :cond_7
    return v0
.end method

.method private static determineType(Ljava/lang/String;)I
    .locals 1

    .line 67
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 68
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    const/16 p0, 0xa

    return p0

    :cond_0
    const-string v0, "bplist"

    .line 71
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    const-string v0, "("

    .line 74
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    const-string v0, "{"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_0

    :cond_2
    const-string v0, "<"

    .line 77
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_3

    const/4 p0, 0x0

    return p0

    :cond_3
    const/16 p0, 0xb

    return p0

    :cond_4
    :goto_0
    const/4 p0, 0x2

    return p0
.end method

.method private static determineType([B)I
    .locals 4

    .line 91
    array-length v0, p0

    const/4 v1, 0x3

    const/4 v2, 0x0

    if-lt v0, v1, :cond_0

    aget-byte v0, p0, v2

    and-int/lit16 v0, v0, 0xff

    const/16 v3, 0xef

    if-ne v0, v3, :cond_0

    const/4 v0, 0x1

    aget-byte v0, p0, v0

    and-int/lit16 v0, v0, 0xff

    const/16 v3, 0xbb

    if-ne v0, v3, :cond_0

    const/4 v0, 0x2

    aget-byte v0, p0, v0

    and-int/lit16 v0, v0, 0xff

    const/16 v3, 0xbf

    if-ne v0, v3, :cond_0

    goto :goto_0

    :cond_0
    move v1, v2

    .line 95
    :goto_0
    array-length v0, p0

    if-ge v1, v0, :cond_1

    aget-byte v0, p0, v1

    const/16 v2, 0x20

    if-eq v0, v2, :cond_3

    :cond_1
    aget-byte v0, p0, v1

    const/16 v2, 0x9

    if-eq v0, v2, :cond_3

    aget-byte v0, p0, v1

    const/16 v2, 0xd

    if-eq v0, v2, :cond_3

    aget-byte v0, p0, v1

    const/16 v2, 0xa

    if-eq v0, v2, :cond_3

    aget-byte v0, p0, v1

    const/16 v2, 0xc

    if-ne v0, v2, :cond_2

    goto :goto_1

    .line 98
    :cond_2
    new-instance v0, Ljava/lang/String;

    const/16 v2, 0x8

    array-length v3, p0

    sub-int/2addr v3, v1

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-direct {v0, p0, v1, v2}, Ljava/lang/String;-><init>([BII)V

    invoke-static {v0}, Lcom/dd/plist/PropertyListParser;->determineType(Ljava/lang/String;)I

    move-result p0

    return p0

    :cond_3
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public static parse(Ljava/io/File;)Lcom/dd/plist/NSObject;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/dd/plist/PropertyListFormatException;,
            Ljava/text/ParseException;,
            Ljavax/xml/parsers/ParserConfigurationException;,
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 180
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 181
    invoke-static {v0}, Lcom/dd/plist/PropertyListParser;->determineType(Ljava/io/InputStream;)I

    move-result v1

    .line 182
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V

    packed-switch v1, :pswitch_data_0

    .line 191
    new-instance p0, Lcom/dd/plist/PropertyListFormatException;

    const-string v0, "The given file is not a property list of a supported format."

    invoke-direct {p0, v0}, Lcom/dd/plist/PropertyListFormatException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 189
    :pswitch_0
    invoke-static {p0}, Lcom/dd/plist/ASCIIPropertyListParser;->parse(Ljava/io/File;)Lcom/dd/plist/NSObject;

    move-result-object p0

    return-object p0

    .line 185
    :pswitch_1
    invoke-static {p0}, Lcom/dd/plist/BinaryPropertyListParser;->parse(Ljava/io/File;)Lcom/dd/plist/NSObject;

    move-result-object p0

    return-object p0

    .line 187
    :pswitch_2
    invoke-static {p0}, Lcom/dd/plist/XMLPropertyListParser;->parse(Ljava/io/File;)Lcom/dd/plist/NSObject;

    move-result-object p0

    return-object p0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static parse(Ljava/io/InputStream;)Lcom/dd/plist/NSObject;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/dd/plist/PropertyListFormatException;,
            Ljava/text/ParseException;,
            Ljavax/xml/parsers/ParserConfigurationException;,
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 233
    invoke-static {p0}, Lcom/dd/plist/PropertyListParser;->readAll(Ljava/io/InputStream;)[B

    move-result-object p0

    invoke-static {p0}, Lcom/dd/plist/PropertyListParser;->parse([B)Lcom/dd/plist/NSObject;

    move-result-object p0

    return-object p0
.end method

.method public static parse(Ljava/lang/String;)Lcom/dd/plist/NSObject;
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

    .line 164
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/dd/plist/PropertyListParser;->parse(Ljava/io/File;)Lcom/dd/plist/NSObject;

    move-result-object p0

    return-object p0
.end method

.method public static parse([B)Lcom/dd/plist/NSObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/dd/plist/PropertyListFormatException;,
            Ljava/text/ParseException;,
            Ljavax/xml/parsers/ParserConfigurationException;,
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 208
    invoke-static {p0}, Lcom/dd/plist/PropertyListParser;->determineType([B)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 216
    new-instance p0, Lcom/dd/plist/PropertyListFormatException;

    const-string v0, "The given data is not a property list of a supported format."

    invoke-direct {p0, v0}, Lcom/dd/plist/PropertyListFormatException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 214
    :pswitch_0
    invoke-static {p0}, Lcom/dd/plist/ASCIIPropertyListParser;->parse([B)Lcom/dd/plist/NSObject;

    move-result-object p0

    return-object p0

    .line 210
    :pswitch_1
    invoke-static {p0}, Lcom/dd/plist/BinaryPropertyListParser;->parse([B)Lcom/dd/plist/NSObject;

    move-result-object p0

    return-object p0

    .line 212
    :pswitch_2
    invoke-static {p0}, Lcom/dd/plist/XMLPropertyListParser;->parse([B)Lcom/dd/plist/NSObject;

    move-result-object p0

    return-object p0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected static readAll(Ljava/io/InputStream;)[B
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 140
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    const/16 v1, 0x200

    .line 141
    new-array v2, v1, [B

    move v3, v1

    :cond_0
    :goto_0
    if-ne v3, v1, :cond_1

    .line 144
    invoke-virtual {p0, v2}, Ljava/io/InputStream;->read([B)I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_0

    const/4 v4, 0x0

    .line 146
    invoke-virtual {v0, v2, v4, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 148
    :cond_1
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0

    return-object p0
.end method

.method public static saveAsASCII(Lcom/dd/plist/NSArray;Ljava/io/File;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 352
    new-instance v0, Ljava/io/OutputStreamWriter;

    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    const-string p1, "ASCII"

    invoke-direct {v0, v1, p1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 353
    invoke-virtual {p0}, Lcom/dd/plist/NSArray;->toASCIIPropertyList()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 354
    invoke-virtual {v0}, Ljava/io/OutputStreamWriter;->close()V

    return-void
.end method

.method public static saveAsASCII(Lcom/dd/plist/NSDictionary;Ljava/io/File;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 335
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    .line 336
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_1

    .line 337
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 338
    :cond_0
    new-instance p0, Ljava/io/IOException;

    const-string p1, "The output directory does not exist and could not be created."

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 339
    :cond_1
    :goto_0
    new-instance v0, Ljava/io/OutputStreamWriter;

    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    const-string p1, "ASCII"

    invoke-direct {v0, v1, p1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 340
    invoke-virtual {p0}, Lcom/dd/plist/NSDictionary;->toASCIIPropertyList()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 341
    invoke-virtual {v0}, Ljava/io/OutputStreamWriter;->close()V

    return-void
.end method

.method public static saveAsBinary(Lcom/dd/plist/NSObject;Ljava/io/File;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 292
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    .line 293
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_1

    .line 294
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 295
    :cond_0
    new-instance p0, Ljava/io/IOException;

    const-string p1, "The output directory does not exist and could not be created."

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 296
    :cond_1
    :goto_0
    invoke-static {p1, p0}, Lcom/dd/plist/BinaryPropertyListWriter;->write(Ljava/io/File;Lcom/dd/plist/NSObject;)V

    return-void
.end method

.method public static saveAsBinary(Lcom/dd/plist/NSObject;Ljava/io/OutputStream;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 307
    invoke-static {p1, p0}, Lcom/dd/plist/BinaryPropertyListWriter;->write(Ljava/io/OutputStream;Lcom/dd/plist/NSObject;)V

    return-void
.end method

.method public static saveAsGnuStepASCII(Lcom/dd/plist/NSArray;Ljava/io/File;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 408
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    .line 409
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_1

    .line 410
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 411
    :cond_0
    new-instance p0, Ljava/io/IOException;

    const-string p1, "The output directory does not exist and could not be created."

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 412
    :cond_1
    :goto_0
    new-instance v0, Ljava/io/OutputStreamWriter;

    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    const-string p1, "ASCII"

    invoke-direct {v0, v1, p1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 413
    invoke-virtual {p0}, Lcom/dd/plist/NSArray;->toGnuStepASCIIPropertyList()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 414
    invoke-virtual {v0}, Ljava/io/OutputStreamWriter;->close()V

    return-void
.end method

.method public static saveAsGnuStepASCII(Lcom/dd/plist/NSDictionary;Ljava/io/File;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 391
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    .line 392
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_1

    .line 393
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 394
    :cond_0
    new-instance p0, Ljava/io/IOException;

    const-string p1, "The output directory does not exist and could not be created."

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 395
    :cond_1
    :goto_0
    new-instance v0, Ljava/io/OutputStreamWriter;

    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    const-string p1, "ASCII"

    invoke-direct {v0, v1, p1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 396
    invoke-virtual {p0}, Lcom/dd/plist/NSDictionary;->toGnuStepASCIIPropertyList()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 397
    invoke-virtual {v0}, Ljava/io/OutputStreamWriter;->close()V

    return-void
.end method

.method public static saveAsXML(Lcom/dd/plist/NSObject;Ljava/io/File;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 244
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    .line 245
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_1

    .line 246
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 247
    :cond_0
    new-instance p0, Ljava/io/IOException;

    const-string p1, "The output directory does not exist and could not be created."

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 248
    :cond_1
    :goto_0
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 249
    invoke-static {p0, v0}, Lcom/dd/plist/PropertyListParser;->saveAsXML(Lcom/dd/plist/NSObject;Ljava/io/OutputStream;)V

    .line 250
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    return-void
.end method

.method public static saveAsXML(Lcom/dd/plist/NSObject;Ljava/io/OutputStream;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 261
    new-instance v0, Ljava/io/OutputStreamWriter;

    const-string v1, "UTF-8"

    invoke-direct {v0, p1, v1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 262
    invoke-virtual {p0}, Lcom/dd/plist/NSObject;->toXMLPropertyList()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 263
    invoke-virtual {v0}, Ljava/io/OutputStreamWriter;->close()V

    return-void
.end method
