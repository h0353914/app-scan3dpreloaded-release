.class public final Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/PropertiesUtil;
.super Ljava/lang/Object;
.source "PropertiesUtil.java"


# static fields
.field public static final PROPERTY_1:Ljava/lang/String; = "property_1"

.field public static final PROPERTY_2:Ljava/lang/String; = "property_2"

.field public static final PROPERTY_3:Ljava/lang/String; = "property_3"

.field public static final PROPERTY_4:Ljava/lang/String; = "property_4"

.field public static final PROPERTY_5:Ljava/lang/String; = "property_5"

.field private static final SCAN3D_PACKAGE_NAME:Ljava/lang/String; = "com.sonymobile.scan3d"

.field private static sInstance:Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/PropertiesUtil;

.field private static sPackageName:Ljava/lang/String;


# instance fields
.field private mPropertiesDictionary:Lcom/dd/plist/NSDictionary;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 108
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 64
    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/PropertiesUtil;->mPropertiesDictionary:Lcom/dd/plist/NSDictionary;

    return-void
.end method

.method public static getInstance()Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/PropertiesUtil;
    .locals 1

    .line 73
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/PropertiesUtil;->sInstance:Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/PropertiesUtil;

    if-nez v0, :cond_0

    .line 74
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/PropertiesUtil;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/PropertiesUtil;-><init>()V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/PropertiesUtil;->sInstance:Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/PropertiesUtil;

    .line 76
    :cond_0
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/PropertiesUtil;->sInstance:Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/PropertiesUtil;

    return-object v0
.end method

.method public static isProductionReady()Z
    .locals 2

    .line 91
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/PropertiesUtil;->sPackageName:Ljava/lang/String;

    if-eqz v0, :cond_0

    const-string v1, "com.sonymobile.scan3d"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private loadProperties()Lcom/dd/plist/NSDictionary;
    .locals 1

    .line 116
    :try_start_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/PropertiesUtil;->mergeFiles()[B

    move-result-object v0

    .line 118
    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/PropertiesUtil;->unpack([B)[B

    move-result-object v0

    invoke-static {v0}, Lcom/dd/plist/PropertyListParser;->parse([B)Lcom/dd/plist/NSObject;

    move-result-object v0

    check-cast v0, Lcom/dd/plist/NSDictionary;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Lcom/dd/plist/PropertyListFormatException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    goto :goto_0

    :catch_2
    move-exception v0

    goto :goto_0

    :catch_3
    move-exception v0

    goto :goto_0

    :catch_4
    move-exception v0

    .line 124
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    const/4 v0, 0x0

    return-object v0
.end method

.method private mergeFiles()[B
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 146
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    const/4 v1, 0x0

    :try_start_0
    const-string v2, "properties001"

    const-string v3, "properties002"

    const-string v4, "properties003"

    const-string v5, "properties004"

    .line 149
    filled-new-array {v2, v3, v4, v5}, [Ljava/lang/String;

    move-result-object v2

    .line 154
    array-length v3, v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v4, 0x0

    move-object v5, v1

    move v1, v4

    :goto_0
    if-ge v1, v3, :cond_1

    :try_start_1
    aget-object v6, v2, v1

    .line 155
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "res/raw/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 156
    invoke-virtual {v7, v6}, Ljava/lang/ClassLoader;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v5

    const/16 v6, 0x400

    .line 157
    new-array v6, v6, [B

    .line 159
    :goto_1
    invoke-virtual {v5, v6}, Ljava/io/InputStream;->read([B)I

    move-result v7

    if-lez v7, :cond_0

    .line 160
    invoke-virtual {v0, v6, v4, v7}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_1

    .line 162
    :cond_0
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_2

    :cond_1
    if-eqz v5, :cond_2

    goto :goto_3

    :catchall_0
    move-exception v2

    move-object v5, v1

    move-object v1, v2

    goto :goto_4

    :catch_1
    move-exception v2

    move-object v5, v1

    move-object v1, v2

    .line 166
    :goto_2
    :try_start_2
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz v5, :cond_2

    .line 169
    :goto_3
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V

    .line 172
    :cond_2
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 175
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    return-object v0

    :catchall_1
    move-exception v1

    :goto_4
    if-eqz v5, :cond_3

    .line 169
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V

    .line 172
    :cond_3
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 174
    throw v1
.end method

.method public static setPackageName(Ljava/lang/String;)V
    .locals 0

    .line 84
    sput-object p0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/PropertiesUtil;->sPackageName:Ljava/lang/String;

    return-void
.end method

.method private unpack([B)[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .line 133
    new-instance v0, Ljava/lang/String;

    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v0, p1, v1}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    const-string p1, ":"

    .line 134
    invoke-virtual {v0, p1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    .line 135
    array-length v0, p1

    new-array v0, v0, [C

    const/4 v1, 0x0

    .line 136
    :goto_0
    array-length v2, p1

    if-ge v1, v2, :cond_0

    .line 137
    aget-object v2, p1, v1

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    add-int/lit8 v2, v2, -0x5

    int-to-char v2, v2

    aput-char v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 139
    :cond_0
    new-instance p1, Ljava/lang/String;

    invoke-direct {p1, v0}, Ljava/lang/String;-><init>([C)V

    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public getProperty(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 98
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/PropertiesUtil;->mPropertiesDictionary:Lcom/dd/plist/NSDictionary;

    if-nez v0, :cond_0

    .line 99
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/PropertiesUtil;->loadProperties()Lcom/dd/plist/NSDictionary;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/PropertiesUtil;->mPropertiesDictionary:Lcom/dd/plist/NSDictionary;

    .line 101
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/PropertiesUtil;->mPropertiesDictionary:Lcom/dd/plist/NSDictionary;

    if-eqz v0, :cond_1

    .line 102
    invoke-virtual {v0, p1}, Lcom/dd/plist/NSDictionary;->get(Ljava/lang/Object;)Lcom/dd/plist/NSObject;

    move-result-object p1

    check-cast p1, Lcom/dd/plist/NSString;

    invoke-virtual {p1}, Lcom/dd/plist/NSString;->getContent()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method
