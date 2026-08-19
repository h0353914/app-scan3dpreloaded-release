.class public Lcom/dd/plist/ASCIIPropertyListParser;
.super Ljava/lang/Object;
.source "ASCIIPropertyListParser.java"


# static fields
.field public static final ARRAY_BEGIN_TOKEN:C = '('

.field public static final ARRAY_END_TOKEN:C = ')'

.field public static final ARRAY_ITEM_DELIMITER_TOKEN:C = ','

.field public static final COMMENT_BEGIN_TOKEN:C = '/'

.field public static final DATA_BEGIN_TOKEN:C = '<'

.field public static final DATA_END_TOKEN:C = '>'

.field public static final DATA_GSBOOL_BEGIN_TOKEN:C = 'B'

.field public static final DATA_GSBOOL_FALSE_TOKEN:C = 'N'

.field public static final DATA_GSBOOL_TRUE_TOKEN:C = 'Y'

.field public static final DATA_GSDATE_BEGIN_TOKEN:C = 'D'

.field public static final DATA_GSINT_BEGIN_TOKEN:C = 'I'

.field public static final DATA_GSOBJECT_BEGIN_TOKEN:C = '*'

.field public static final DATA_GSREAL_BEGIN_TOKEN:C = 'R'

.field public static final DATE_APPLE_DATE_TIME_DELIMITER:C = 'T'

.field public static final DATE_APPLE_END_TOKEN:C = 'Z'

.field public static final DATE_DATE_FIELD_DELIMITER:C = '-'

.field public static final DATE_GS_DATE_TIME_DELIMITER:C = ' '

.field public static final DATE_TIME_FIELD_DELIMITER:C = ':'

.field public static final DICTIONARY_ASSIGN_TOKEN:C = '='

.field public static final DICTIONARY_BEGIN_TOKEN:C = '{'

.field public static final DICTIONARY_END_TOKEN:C = '}'

.field public static final DICTIONARY_ITEM_DELIMITER_TOKEN:C = ';'

.field public static final MULTILINE_COMMENT_END_TOKEN:C = '/'

.field public static final MULTILINE_COMMENT_SECOND_TOKEN:C = '*'

.field public static final QUOTEDSTRING_BEGIN_TOKEN:C = '\"'

.field public static final QUOTEDSTRING_END_TOKEN:C = '\"'

.field public static final QUOTEDSTRING_ESCAPE_TOKEN:C = '\\'

.field public static final SINGLELINE_COMMENT_SECOND_TOKEN:C = '/'

.field public static final WHITESPACE_CARRIAGE_RETURN:C = '\r'

.field public static final WHITESPACE_NEWLINE:C = '\n'

.field public static final WHITESPACE_SPACE:C = ' '

.field public static final WHITESPACE_TAB:C = '\t'

.field private static asciiEncoder:Ljava/nio/charset/CharsetEncoder;


# instance fields
.field private data:[B

.field private index:I


# direct methods
.method protected constructor <init>()V
    .locals 0

    .line 150
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private constructor <init>([B)V
    .locals 0

    .line 159
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 160
    iput-object p1, p0, Lcom/dd/plist/ASCIIPropertyListParser;->data:[B

    return-void
.end method

.method private accept(C)Z
    .locals 2

    .line 201
    iget-object v0, p0, Lcom/dd/plist/ASCIIPropertyListParser;->data:[B

    iget v1, p0, Lcom/dd/plist/ASCIIPropertyListParser;->index:I

    aget-byte v0, v0, v1

    if-ne v0, p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private varargs accept([C)Z
    .locals 6

    .line 186
    array-length v0, p1

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v1, v0, :cond_1

    aget-char v3, p1, v1

    .line 187
    iget-object v4, p0, Lcom/dd/plist/ASCIIPropertyListParser;->data:[B

    iget v5, p0, Lcom/dd/plist/ASCIIPropertyListParser;->index:I

    aget-byte v4, v4, v5

    if-ne v4, v3, :cond_0

    const/4 v2, 0x1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return v2
.end method

.method private varargs acceptSequence([C)Z
    .locals 4

    const/4 v0, 0x0

    move v1, v0

    .line 170
    :goto_0
    array-length v2, p1

    if-ge v1, v2, :cond_1

    .line 171
    iget-object v2, p0, Lcom/dd/plist/ASCIIPropertyListParser;->data:[B

    iget v3, p0, Lcom/dd/plist/ASCIIPropertyListParser;->index:I

    add-int/2addr v3, v1

    aget-byte v2, v2, v3

    aget-char v3, p1, v1

    if-eq v2, v3, :cond_0

    return v0

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method private expect(C)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 228
    invoke-direct {p0, p1}, Lcom/dd/plist/ASCIIPropertyListParser;->accept(C)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 229
    :cond_0
    new-instance v0, Ljava/text/ParseException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Expected \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string p1, "\' but found \'"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lcom/dd/plist/ASCIIPropertyListParser;->data:[B

    iget v2, p0, Lcom/dd/plist/ASCIIPropertyListParser;->index:I

    aget-byte p1, p1, v2

    int-to-char p1, p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string p1, "\'"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iget v1, p0, Lcom/dd/plist/ASCIIPropertyListParser;->index:I

    invoke-direct {v0, p1, v1}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method private varargs expect([C)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 211
    invoke-direct {p0, p1}, Lcom/dd/plist/ASCIIPropertyListParser;->accept([C)Z

    move-result v0

    if-nez v0, :cond_1

    .line 212
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Expected \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v1, 0x0

    aget-char v1, p1, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    .line 213
    :goto_0
    array-length v2, p1

    if-ge v1, v2, :cond_0

    .line 214
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " or \'"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-char v0, p1, v1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v0, "\'"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 216
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " but found \'"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/dd/plist/ASCIIPropertyListParser;->data:[B

    iget v1, p0, Lcom/dd/plist/ASCIIPropertyListParser;->index:I

    aget-byte v0, v0, v1

    int-to-char v0, v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v0, "\'"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 217
    new-instance v0, Ljava/text/ParseException;

    iget v1, p0, Lcom/dd/plist/ASCIIPropertyListParser;->index:I

    invoke-direct {v0, p1, v1}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0

    :cond_1
    return-void
.end method

.method public static parse(Ljava/io/File;)Lcom/dd/plist/NSObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/text/ParseException;
        }
    .end annotation

    .line 69
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-static {v0}, Lcom/dd/plist/ASCIIPropertyListParser;->parse(Ljava/io/InputStream;)Lcom/dd/plist/NSObject;

    move-result-object p0

    return-object p0
.end method

.method public static parse(Ljava/io/InputStream;)Lcom/dd/plist/NSObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 81
    invoke-static {p0}, Lcom/dd/plist/PropertyListParser;->readAll(Ljava/io/InputStream;)[B

    move-result-object v0

    .line 82
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 83
    invoke-static {v0}, Lcom/dd/plist/ASCIIPropertyListParser;->parse([B)Lcom/dd/plist/NSObject;

    move-result-object p0

    return-object p0
.end method

.method public static parse([B)Lcom/dd/plist/NSObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 94
    new-instance v0, Lcom/dd/plist/ASCIIPropertyListParser;

    invoke-direct {v0, p0}, Lcom/dd/plist/ASCIIPropertyListParser;-><init>([B)V

    .line 95
    invoke-virtual {v0}, Lcom/dd/plist/ASCIIPropertyListParser;->parse()Lcom/dd/plist/NSObject;

    move-result-object p0

    return-object p0
.end method

.method private parseArray()Lcom/dd/plist/NSArray;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 399
    invoke-direct {p0}, Lcom/dd/plist/ASCIIPropertyListParser;->skip()V

    .line 400
    invoke-direct {p0}, Lcom/dd/plist/ASCIIPropertyListParser;->skipWhitespacesAndComments()V

    .line 401
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    :goto_0
    const/16 v1, 0x29

    .line 402
    invoke-direct {p0, v1}, Lcom/dd/plist/ASCIIPropertyListParser;->accept(C)Z

    move-result v2

    if-nez v2, :cond_0

    .line 403
    invoke-direct {p0}, Lcom/dd/plist/ASCIIPropertyListParser;->parseObject()Lcom/dd/plist/NSObject;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 404
    invoke-direct {p0}, Lcom/dd/plist/ASCIIPropertyListParser;->skipWhitespacesAndComments()V

    const/16 v2, 0x2c

    .line 405
    invoke-direct {p0, v2}, Lcom/dd/plist/ASCIIPropertyListParser;->accept(C)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 406
    invoke-direct {p0}, Lcom/dd/plist/ASCIIPropertyListParser;->skip()V

    .line 410
    invoke-direct {p0}, Lcom/dd/plist/ASCIIPropertyListParser;->skipWhitespacesAndComments()V

    goto :goto_0

    .line 413
    :cond_0
    invoke-direct {p0, v1}, Lcom/dd/plist/ASCIIPropertyListParser;->read(C)V

    .line 414
    new-instance v1, Lcom/dd/plist/NSArray;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [Lcom/dd/plist/NSObject;

    invoke-interface {v0, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dd/plist/NSObject;

    invoke-direct {v1, v0}, Lcom/dd/plist/NSArray;-><init>([Lcom/dd/plist/NSObject;)V

    return-object v1
.end method

.method private parseData()Lcom/dd/plist/NSObject;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 463
    invoke-direct {p0}, Lcom/dd/plist/ASCIIPropertyListParser;->skip()V

    const/16 v0, 0x2a

    .line 464
    invoke-direct {p0, v0}, Lcom/dd/plist/ASCIIPropertyListParser;->accept(C)Z

    move-result v0

    const/4 v1, 0x0

    const/16 v2, 0x3e

    const/4 v3, 0x2

    if-eqz v0, :cond_4

    .line 465
    invoke-direct {p0}, Lcom/dd/plist/ASCIIPropertyListParser;->skip()V

    const/4 v0, 0x4

    .line 466
    new-array v0, v0, [C

    fill-array-data v0, :array_0

    invoke-direct {p0, v0}, Lcom/dd/plist/ASCIIPropertyListParser;->expect([C)V

    const/16 v0, 0x42

    .line 467
    invoke-direct {p0, v0}, Lcom/dd/plist/ASCIIPropertyListParser;->accept(C)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 469
    invoke-direct {p0}, Lcom/dd/plist/ASCIIPropertyListParser;->skip()V

    .line 470
    new-array v0, v3, [C

    fill-array-data v0, :array_1

    invoke-direct {p0, v0}, Lcom/dd/plist/ASCIIPropertyListParser;->expect([C)V

    const/16 v0, 0x59

    .line 471
    invoke-direct {p0, v0}, Lcom/dd/plist/ASCIIPropertyListParser;->accept(C)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 472
    new-instance v0, Lcom/dd/plist/NSNumber;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/dd/plist/NSNumber;-><init>(Z)V

    goto :goto_0

    .line 474
    :cond_0
    new-instance v0, Lcom/dd/plist/NSNumber;

    invoke-direct {v0, v1}, Lcom/dd/plist/NSNumber;-><init>(Z)V

    .line 477
    :goto_0
    invoke-direct {p0}, Lcom/dd/plist/ASCIIPropertyListParser;->skip()V

    goto :goto_1

    :cond_1
    const/16 v0, 0x44

    .line 478
    invoke-direct {p0, v0}, Lcom/dd/plist/ASCIIPropertyListParser;->accept(C)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 480
    invoke-direct {p0}, Lcom/dd/plist/ASCIIPropertyListParser;->skip()V

    .line 481
    invoke-direct {p0, v2}, Lcom/dd/plist/ASCIIPropertyListParser;->readInputUntil(C)Ljava/lang/String;

    move-result-object v0

    .line 482
    new-instance v1, Lcom/dd/plist/NSDate;

    invoke-direct {v1, v0}, Lcom/dd/plist/NSDate;-><init>(Ljava/lang/String;)V

    move-object v0, v1

    goto :goto_1

    .line 483
    :cond_2
    new-array v0, v3, [C

    fill-array-data v0, :array_2

    invoke-direct {p0, v0}, Lcom/dd/plist/ASCIIPropertyListParser;->accept([C)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 485
    invoke-direct {p0}, Lcom/dd/plist/ASCIIPropertyListParser;->skip()V

    .line 486
    invoke-direct {p0, v2}, Lcom/dd/plist/ASCIIPropertyListParser;->readInputUntil(C)Ljava/lang/String;

    move-result-object v0

    .line 487
    new-instance v1, Lcom/dd/plist/NSNumber;

    invoke-direct {v1, v0}, Lcom/dd/plist/NSNumber;-><init>(Ljava/lang/String;)V

    move-object v0, v1

    goto :goto_1

    :cond_3
    const/4 v0, 0x0

    .line 490
    :goto_1
    invoke-direct {p0, v2}, Lcom/dd/plist/ASCIIPropertyListParser;->read(C)V

    goto :goto_3

    .line 492
    :cond_4
    invoke-direct {p0, v2}, Lcom/dd/plist/ASCIIPropertyListParser;->readInputUntil(C)Ljava/lang/String;

    move-result-object v0

    const-string v2, "\\s+"

    const-string v4, ""

    .line 493
    invoke-virtual {v0, v2, v4}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 495
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    div-int/2addr v2, v3

    .line 496
    new-array v2, v2, [B

    .line 497
    :goto_2
    array-length v3, v2

    if-ge v1, v3, :cond_5

    mul-int/lit8 v3, v1, 0x2

    add-int/lit8 v4, v3, 0x2

    .line 498
    invoke-virtual {v0, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x10

    .line 499
    invoke-static {v3, v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v3

    int-to-byte v3, v3

    .line 500
    aput-byte v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 502
    :cond_5
    new-instance v0, Lcom/dd/plist/NSData;

    invoke-direct {v0, v2}, Lcom/dd/plist/NSData;-><init>([B)V

    .line 505
    invoke-direct {p0}, Lcom/dd/plist/ASCIIPropertyListParser;->skip()V

    :goto_3
    return-object v0

    nop

    :array_0
    .array-data 2
        0x42s
        0x44s
        0x49s
        0x52s
    .end array-data

    :array_1
    .array-data 2
        0x59s
        0x4es
    .end array-data

    :array_2
    .array-data 2
        0x49s
        0x52s
    .end array-data
.end method

.method private parseDateString()Lcom/dd/plist/NSObject;
    .locals 3

    .line 517
    invoke-direct {p0}, Lcom/dd/plist/ASCIIPropertyListParser;->parseString()Ljava/lang/String;

    move-result-object v0

    .line 518
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x4

    if-le v1, v2, :cond_0

    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x2d

    if-ne v1, v2, :cond_0

    .line 520
    :try_start_0
    new-instance v1, Lcom/dd/plist/NSDate;

    invoke-direct {v1, v0}, Lcom/dd/plist/NSDate;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 525
    :catch_0
    :cond_0
    new-instance v1, Lcom/dd/plist/NSString;

    invoke-direct {v1, v0}, Lcom/dd/plist/NSString;-><init>(Ljava/lang/String;)V

    return-object v1
.end method

.method private parseDictionary()Lcom/dd/plist/NSDictionary;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 425
    invoke-direct {p0}, Lcom/dd/plist/ASCIIPropertyListParser;->skip()V

    .line 426
    invoke-direct {p0}, Lcom/dd/plist/ASCIIPropertyListParser;->skipWhitespacesAndComments()V

    .line 427
    new-instance v0, Lcom/dd/plist/NSDictionary;

    invoke-direct {v0}, Lcom/dd/plist/NSDictionary;-><init>()V

    :goto_0
    const/16 v1, 0x7d

    .line 428
    invoke-direct {p0, v1}, Lcom/dd/plist/ASCIIPropertyListParser;->accept(C)Z

    move-result v1

    if-nez v1, :cond_1

    const/16 v1, 0x22

    .line 431
    invoke-direct {p0, v1}, Lcom/dd/plist/ASCIIPropertyListParser;->accept(C)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 432
    invoke-direct {p0}, Lcom/dd/plist/ASCIIPropertyListParser;->parseQuotedString()Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    .line 434
    :cond_0
    invoke-direct {p0}, Lcom/dd/plist/ASCIIPropertyListParser;->parseString()Ljava/lang/String;

    move-result-object v1

    .line 436
    :goto_1
    invoke-direct {p0}, Lcom/dd/plist/ASCIIPropertyListParser;->skipWhitespacesAndComments()V

    const/16 v2, 0x3d

    .line 439
    invoke-direct {p0, v2}, Lcom/dd/plist/ASCIIPropertyListParser;->read(C)V

    .line 440
    invoke-direct {p0}, Lcom/dd/plist/ASCIIPropertyListParser;->skipWhitespacesAndComments()V

    .line 442
    invoke-direct {p0}, Lcom/dd/plist/ASCIIPropertyListParser;->parseObject()Lcom/dd/plist/NSObject;

    move-result-object v2

    .line 443
    invoke-virtual {v0, v1, v2}, Lcom/dd/plist/NSDictionary;->put(Ljava/lang/String;Lcom/dd/plist/NSObject;)Lcom/dd/plist/NSObject;

    .line 444
    invoke-direct {p0}, Lcom/dd/plist/ASCIIPropertyListParser;->skipWhitespacesAndComments()V

    const/16 v1, 0x3b

    .line 445
    invoke-direct {p0, v1}, Lcom/dd/plist/ASCIIPropertyListParser;->read(C)V

    .line 446
    invoke-direct {p0}, Lcom/dd/plist/ASCIIPropertyListParser;->skipWhitespacesAndComments()V

    goto :goto_0

    .line 449
    :cond_1
    invoke-direct {p0}, Lcom/dd/plist/ASCIIPropertyListParser;->skip()V

    return-object v0
.end method

.method private static parseEscapedSequence(Ljava/text/StringCharacterIterator;)Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .line 635
    invoke-virtual {p0}, Ljava/text/StringCharacterIterator;->next()C

    move-result v0

    const/4 v1, 0x2

    const/16 v2, 0x5c

    if-ne v0, v2, :cond_0

    .line 637
    new-instance p0, Ljava/lang/String;

    new-array v0, v1, [B

    fill-array-data v0, :array_0

    const-string v1, "UTF-8"

    invoke-direct {p0, v0, v1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    return-object p0

    :cond_0
    const/16 v2, 0x22

    if-ne v0, v2, :cond_1

    .line 639
    new-instance p0, Ljava/lang/String;

    new-array v0, v1, [B

    fill-array-data v0, :array_1

    const-string v1, "UTF-8"

    invoke-direct {p0, v0, v1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    return-object p0

    :cond_1
    const/16 v2, 0x62

    if-ne v0, v2, :cond_2

    .line 641
    new-instance p0, Ljava/lang/String;

    new-array v0, v1, [B

    fill-array-data v0, :array_2

    const-string v1, "UTF-8"

    invoke-direct {p0, v0, v1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    return-object p0

    :cond_2
    const/16 v2, 0x6e

    if-ne v0, v2, :cond_3

    .line 643
    new-instance p0, Ljava/lang/String;

    new-array v0, v1, [B

    fill-array-data v0, :array_3

    const-string v1, "UTF-8"

    invoke-direct {p0, v0, v1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    return-object p0

    :cond_3
    const/16 v2, 0x72

    if-ne v0, v2, :cond_4

    .line 645
    new-instance p0, Ljava/lang/String;

    new-array v0, v1, [B

    fill-array-data v0, :array_4

    const-string v1, "UTF-8"

    invoke-direct {p0, v0, v1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    return-object p0

    :cond_4
    const/16 v2, 0x74

    if-ne v0, v2, :cond_5

    .line 647
    new-instance p0, Ljava/lang/String;

    new-array v0, v1, [B

    fill-array-data v0, :array_5

    const-string v1, "UTF-8"

    invoke-direct {p0, v0, v1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    return-object p0

    :cond_5
    const/16 v2, 0x55

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eq v0, v2, :cond_7

    const/16 v2, 0x75

    if-ne v0, v2, :cond_6

    goto :goto_0

    :cond_6
    const-string v2, ""

    .line 661
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 662
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/text/StringCharacterIterator;->next()C

    move-result v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 663
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/text/StringCharacterIterator;->next()C

    move-result p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const/16 v0, 0x8

    .line 664
    invoke-static {p0, v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result p0

    .line 665
    new-array v0, v1, [B

    aput-byte v4, v0, v4

    int-to-byte p0, p0

    aput-byte p0, v0, v3

    .line 666
    new-instance p0, Ljava/lang/String;

    const-string v1, "UTF-8"

    invoke-direct {p0, v0, v1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    return-object p0

    :cond_7
    :goto_0
    const-string v0, ""

    .line 651
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/text/StringCharacterIterator;->next()C

    move-result v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 652
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/text/StringCharacterIterator;->next()C

    move-result v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, ""

    .line 654
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/text/StringCharacterIterator;->next()C

    move-result v2

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 655
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/text/StringCharacterIterator;->next()C

    move-result p0

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 656
    new-array v1, v1, [B

    const/16 v2, 0x10

    invoke-static {v0, v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v0

    int-to-byte v0, v0

    aput-byte v0, v1, v4

    invoke-static {p0, v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result p0

    int-to-byte p0, p0

    aput-byte p0, v1, v3

    .line 657
    new-instance p0, Ljava/lang/String;

    const-string v0, "UTF-8"

    invoke-direct {p0, v1, v0}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    return-object p0

    :array_0
    .array-data 1
        0x0t
        0x5ct
    .end array-data

    nop

    :array_1
    .array-data 1
        0x0t
        0x22t
    .end array-data

    nop

    :array_2
    .array-data 1
        0x0t
        0x8t
    .end array-data

    nop

    :array_3
    .array-data 1
        0x0t
        0xat
    .end array-data

    nop

    :array_4
    .array-data 1
        0x0t
        0xdt
    .end array-data

    nop

    :array_5
    .array-data 1
        0x0t
        0x9t
    .end array-data
.end method

.method private parseObject()Lcom/dd/plist/NSObject;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 353
    iget-object v0, p0, Lcom/dd/plist/ASCIIPropertyListParser;->data:[B

    iget v1, p0, Lcom/dd/plist/ASCIIPropertyListParser;->index:I

    aget-byte v2, v0, v1

    const/16 v3, 0x22

    if-eq v2, v3, :cond_4

    const/16 v3, 0x28

    if-eq v2, v3, :cond_3

    const/16 v3, 0x3c

    if-eq v2, v3, :cond_2

    const/16 v3, 0x7b

    if-eq v2, v3, :cond_1

    .line 379
    aget-byte v2, v0, v1

    const/16 v3, 0x2f

    if-le v2, v3, :cond_0

    aget-byte v0, v0, v1

    const/16 v1, 0x3a

    if-ge v0, v1, :cond_0

    .line 381
    invoke-direct {p0}, Lcom/dd/plist/ASCIIPropertyListParser;->parseDateString()Lcom/dd/plist/NSObject;

    move-result-object v0

    return-object v0

    .line 384
    :cond_0
    invoke-direct {p0}, Lcom/dd/plist/ASCIIPropertyListParser;->parseString()Ljava/lang/String;

    move-result-object v0

    .line 385
    new-instance v1, Lcom/dd/plist/NSString;

    invoke-direct {v1, v0}, Lcom/dd/plist/NSString;-><init>(Ljava/lang/String;)V

    return-object v1

    .line 358
    :cond_1
    invoke-direct {p0}, Lcom/dd/plist/ASCIIPropertyListParser;->parseDictionary()Lcom/dd/plist/NSDictionary;

    move-result-object v0

    return-object v0

    .line 361
    :cond_2
    invoke-direct {p0}, Lcom/dd/plist/ASCIIPropertyListParser;->parseData()Lcom/dd/plist/NSObject;

    move-result-object v0

    return-object v0

    .line 355
    :cond_3
    invoke-direct {p0}, Lcom/dd/plist/ASCIIPropertyListParser;->parseArray()Lcom/dd/plist/NSArray;

    move-result-object v0

    return-object v0

    .line 364
    :cond_4
    invoke-direct {p0}, Lcom/dd/plist/ASCIIPropertyListParser;->parseQuotedString()Ljava/lang/String;

    move-result-object v0

    .line 366
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x14

    if-ne v1, v2, :cond_5

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x2d

    if-ne v1, v2, :cond_5

    .line 368
    :try_start_0
    new-instance v1, Lcom/dd/plist/NSDate;

    invoke-direct {v1, v0}, Lcom/dd/plist/NSDate;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 371
    :catch_0
    new-instance v1, Lcom/dd/plist/NSString;

    invoke-direct {v1, v0}, Lcom/dd/plist/NSString;-><init>(Ljava/lang/String;)V

    return-object v1

    .line 374
    :cond_5
    new-instance v1, Lcom/dd/plist/NSString;

    invoke-direct {v1, v0}, Lcom/dd/plist/NSString;-><init>(Ljava/lang/String;)V

    return-object v1
.end method

.method private parseQuotedString()Ljava/lang/String;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 548
    invoke-direct {p0}, Lcom/dd/plist/ASCIIPropertyListParser;->skip()V

    const-string v0, ""

    const/4 v1, 0x1

    move-object v2, v0

    move v0, v1

    .line 552
    :goto_0
    iget-object v3, p0, Lcom/dd/plist/ASCIIPropertyListParser;->data:[B

    iget v4, p0, Lcom/dd/plist/ASCIIPropertyListParser;->index:I

    aget-byte v5, v3, v4

    const/16 v6, 0x22

    const/16 v7, 0x5c

    if-ne v5, v6, :cond_1

    add-int/lit8 v4, v4, -0x1

    aget-byte v3, v3, v4

    if-ne v3, v7, :cond_0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 561
    :cond_0
    :try_start_0
    invoke-static {v2}, Lcom/dd/plist/ASCIIPropertyListParser;->parseQuotedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 566
    invoke-direct {p0}, Lcom/dd/plist/ASCIIPropertyListParser;->skip()V

    return-object v0

    .line 563
    :catch_0
    new-instance v0, Ljava/text/ParseException;

    iget v1, p0, Lcom/dd/plist/ASCIIPropertyListParser;->index:I

    const-string v2, "The quoted string could not be parsed."

    invoke-direct {v0, v2, v1}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 553
    :cond_1
    :goto_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/dd/plist/ASCIIPropertyListParser;->data:[B

    iget v4, p0, Lcom/dd/plist/ASCIIPropertyListParser;->index:I

    aget-byte v2, v2, v4

    int-to-char v2, v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 554
    invoke-direct {p0, v7}, Lcom/dd/plist/ASCIIPropertyListParser;->accept(C)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 555
    iget-object v3, p0, Lcom/dd/plist/ASCIIPropertyListParser;->data:[B

    iget v4, p0, Lcom/dd/plist/ASCIIPropertyListParser;->index:I

    sub-int/2addr v4, v1

    aget-byte v3, v3, v4

    if-ne v3, v7, :cond_3

    if-nez v0, :cond_2

    goto :goto_2

    :cond_2
    const/4 v0, 0x0

    goto :goto_3

    :cond_3
    :goto_2
    move v0, v1

    .line 557
    :cond_4
    :goto_3
    invoke-direct {p0}, Lcom/dd/plist/ASCIIPropertyListParser;->skip()V

    goto :goto_0
.end method

.method public static declared-synchronized parseQuotedString(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;,
            Ljava/nio/charset/CharacterCodingException;
        }
    .end annotation

    const-class v0, Lcom/dd/plist/ASCIIPropertyListParser;

    monitor-enter v0

    .line 585
    :try_start_0
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 586
    new-instance v2, Ljava/text/StringCharacterIterator;

    invoke-direct {v2, p0}, Ljava/text/StringCharacterIterator;-><init>(Ljava/lang/String;)V

    .line 587
    invoke-virtual {v2}, Ljava/text/StringCharacterIterator;->current()C

    move-result p0

    .line 589
    :goto_0
    invoke-virtual {v2}, Ljava/text/StringCharacterIterator;->getIndex()I

    move-result v3

    invoke-virtual {v2}, Ljava/text/StringCharacterIterator;->getEndIndex()I

    move-result v4

    const/4 v5, 0x0

    if-ge v3, v4, :cond_2

    const/16 v3, 0x5c

    if-eq p0, v3, :cond_0

    .line 598
    invoke-static {v5}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    int-to-byte p0, p0

    .line 599
    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p0

    invoke-interface {v1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 592
    :cond_0
    invoke-static {v2}, Lcom/dd/plist/ASCIIPropertyListParser;->parseEscapedSequence(Ljava/text/StringCharacterIterator;)Ljava/lang/String;

    move-result-object p0

    const-string v3, "UTF-8"

    invoke-virtual {p0, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p0

    .line 593
    array-length v3, p0

    :goto_1
    if-ge v5, v3, :cond_1

    aget-byte v4, p0, v5

    .line 594
    invoke-static {v4}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 603
    :cond_1
    :goto_2
    invoke-virtual {v2}, Ljava/text/StringCharacterIterator;->next()C

    move-result p0

    goto :goto_0

    .line 605
    :cond_2
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result p0

    new-array p0, p0, [B

    .line 607
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Byte;

    .line 608
    invoke-virtual {v2}, Ljava/lang/Byte;->byteValue()B

    move-result v2

    aput-byte v2, p0, v5

    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    .line 612
    :cond_3
    new-instance v1, Ljava/lang/String;

    const-string v2, "UTF-8"

    invoke-direct {v1, p0, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 613
    invoke-static {v1}, Ljava/nio/CharBuffer;->wrap(Ljava/lang/CharSequence;)Ljava/nio/CharBuffer;

    move-result-object p0

    .line 617
    sget-object v2, Lcom/dd/plist/ASCIIPropertyListParser;->asciiEncoder:Ljava/nio/charset/CharsetEncoder;

    if-nez v2, :cond_4

    const-string v2, "ASCII"

    .line 618
    invoke-static {v2}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v2

    invoke-virtual {v2}, Ljava/nio/charset/Charset;->newEncoder()Ljava/nio/charset/CharsetEncoder;

    move-result-object v2

    sput-object v2, Lcom/dd/plist/ASCIIPropertyListParser;->asciiEncoder:Ljava/nio/charset/CharsetEncoder;

    .line 619
    :cond_4
    sget-object v2, Lcom/dd/plist/ASCIIPropertyListParser;->asciiEncoder:Ljava/nio/charset/CharsetEncoder;

    invoke-virtual {v2, p0}, Ljava/nio/charset/CharsetEncoder;->canEncode(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 620
    sget-object v1, Lcom/dd/plist/ASCIIPropertyListParser;->asciiEncoder:Ljava/nio/charset/CharsetEncoder;

    invoke-virtual {v1, p0}, Ljava/nio/charset/CharsetEncoder;->encode(Ljava/nio/CharBuffer;)Ljava/nio/ByteBuffer;

    move-result-object p0

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->asCharBuffer()Ljava/nio/CharBuffer;

    move-result-object p0

    invoke-virtual {p0}, Ljava/nio/CharBuffer;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    .line 624
    :cond_5
    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private parseString()Ljava/lang/String;
    .locals 1

    const/16 v0, 0x8

    .line 535
    new-array v0, v0, [C

    fill-array-data v0, :array_0

    invoke-direct {p0, v0}, Lcom/dd/plist/ASCIIPropertyListParser;->readInputUntil([C)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :array_0
    .array-data 2
        0x20s
        0x9s
        0xas
        0xds
        0x2cs
        0x3bs
        0x3ds
        0x29s
    .end array-data
.end method

.method private read(C)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 239
    invoke-direct {p0, p1}, Lcom/dd/plist/ASCIIPropertyListParser;->expect(C)V

    .line 240
    iget p1, p0, Lcom/dd/plist/ASCIIPropertyListParser;->index:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/dd/plist/ASCIIPropertyListParser;->index:I

    return-void
.end method

.method private readInputUntil(C)Ljava/lang/String;
    .locals 3

    const-string v0, ""

    .line 317
    :goto_0
    invoke-direct {p0, p1}, Lcom/dd/plist/ASCIIPropertyListParser;->accept(C)Z

    move-result v1

    if-nez v1, :cond_0

    .line 318
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/dd/plist/ASCIIPropertyListParser;->data:[B

    iget v2, p0, Lcom/dd/plist/ASCIIPropertyListParser;->index:I

    aget-byte v0, v0, v2

    int-to-char v0, v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 319
    invoke-direct {p0}, Lcom/dd/plist/ASCIIPropertyListParser;->skip()V

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method private varargs readInputUntil([C)Ljava/lang/String;
    .locals 3

    const-string v0, ""

    .line 302
    :goto_0
    invoke-direct {p0, p1}, Lcom/dd/plist/ASCIIPropertyListParser;->accept([C)Z

    move-result v1

    if-nez v1, :cond_0

    .line 303
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/dd/plist/ASCIIPropertyListParser;->data:[B

    iget v2, p0, Lcom/dd/plist/ASCIIPropertyListParser;->index:I

    aget-byte v0, v0, v2

    int-to-char v0, v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 304
    invoke-direct {p0}, Lcom/dd/plist/ASCIIPropertyListParser;->skip()V

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method private skip()V
    .locals 1

    .line 247
    iget v0, p0, Lcom/dd/plist/ASCIIPropertyListParser;->index:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/dd/plist/ASCIIPropertyListParser;->index:I

    return-void
.end method

.method private skip(I)V
    .locals 1

    .line 256
    iget v0, p0, Lcom/dd/plist/ASCIIPropertyListParser;->index:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/dd/plist/ASCIIPropertyListParser;->index:I

    return-void
.end method

.method private skipWhitespacesAndComments()V
    .locals 4

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const/4 v1, 0x4

    .line 268
    new-array v1, v1, [C

    fill-array-data v1, :array_0

    invoke-direct {p0, v1}, Lcom/dd/plist/ASCIIPropertyListParser;->accept([C)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 269
    invoke-direct {p0}, Lcom/dd/plist/ASCIIPropertyListParser;->skip()V

    goto :goto_0

    :cond_1
    const/4 v1, 0x2

    .line 273
    new-array v2, v1, [C

    fill-array-data v2, :array_1

    invoke-direct {p0, v2}, Lcom/dd/plist/ASCIIPropertyListParser;->acceptSequence([C)Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_2

    .line 274
    invoke-direct {p0, v1}, Lcom/dd/plist/ASCIIPropertyListParser;->skip(I)V

    .line 275
    new-array v0, v1, [C

    fill-array-data v0, :array_2

    invoke-direct {p0, v0}, Lcom/dd/plist/ASCIIPropertyListParser;->readInputUntil([C)Ljava/lang/String;

    goto :goto_2

    .line 279
    :cond_2
    new-array v2, v1, [C

    fill-array-data v2, :array_3

    invoke-direct {p0, v2}, Lcom/dd/plist/ASCIIPropertyListParser;->acceptSequence([C)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 280
    invoke-direct {p0, v1}, Lcom/dd/plist/ASCIIPropertyListParser;->skip(I)V

    .line 282
    :goto_1
    new-array v0, v1, [C

    fill-array-data v0, :array_4

    invoke-direct {p0, v0}, Lcom/dd/plist/ASCIIPropertyListParser;->acceptSequence([C)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 283
    invoke-direct {p0, v1}, Lcom/dd/plist/ASCIIPropertyListParser;->skip(I)V

    goto :goto_2

    .line 286
    :cond_3
    invoke-direct {p0}, Lcom/dd/plist/ASCIIPropertyListParser;->skip()V

    goto :goto_1

    :cond_4
    move v3, v0

    :goto_2
    if-nez v3, :cond_0

    return-void

    nop

    :array_0
    .array-data 2
        0xds
        0xas
        0x20s
        0x9s
    .end array-data

    :array_1
    .array-data 2
        0x2fs
        0x2fs
    .end array-data

    :array_2
    .array-data 2
        0xds
        0xas
    .end array-data

    :array_3
    .array-data 2
        0x2fs
        0x2as
    .end array-data

    :array_4
    .array-data 2
        0x2as
        0x2fs
    .end array-data
.end method


# virtual methods
.method public parse()Lcom/dd/plist/NSObject;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 332
    iput v0, p0, Lcom/dd/plist/ASCIIPropertyListParser;->index:I

    .line 334
    iget-object v1, p0, Lcom/dd/plist/ASCIIPropertyListParser;->data:[B

    array-length v2, v1

    const/4 v3, 0x3

    if-lt v2, v3, :cond_0

    aget-byte v0, v1, v0

    and-int/lit16 v0, v0, 0xff

    const/16 v2, 0xef

    if-ne v0, v2, :cond_0

    const/4 v0, 0x1

    aget-byte v0, v1, v0

    and-int/lit16 v0, v0, 0xff

    const/16 v2, 0xbb

    if-ne v0, v2, :cond_0

    const/4 v0, 0x2

    aget-byte v0, v1, v0

    and-int/lit16 v0, v0, 0xff

    const/16 v1, 0xbf

    if-ne v0, v1, :cond_0

    .line 335
    invoke-direct {p0, v3}, Lcom/dd/plist/ASCIIPropertyListParser;->skip(I)V

    .line 336
    :cond_0
    invoke-direct {p0}, Lcom/dd/plist/ASCIIPropertyListParser;->skipWhitespacesAndComments()V

    .line 337
    new-array v0, v3, [C

    fill-array-data v0, :array_0

    invoke-direct {p0, v0}, Lcom/dd/plist/ASCIIPropertyListParser;->expect([C)V

    .line 339
    :try_start_0
    invoke-direct {p0}, Lcom/dd/plist/ASCIIPropertyListParser;->parseObject()Lcom/dd/plist/NSObject;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 341
    :catch_0
    new-instance v0, Ljava/text/ParseException;

    iget v1, p0, Lcom/dd/plist/ASCIIPropertyListParser;->index:I

    const-string v2, "Reached end of input unexpectedly."

    invoke-direct {v0, v2, v1}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0

    :array_0
    .array-data 2
        0x7bs
        0x28s
        0x2fs
    .end array-data
.end method
