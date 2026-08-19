.class public Lcom/dd/plist/BinaryPropertyListWriter;
.super Ljava/lang/Object;
.source "BinaryPropertyListWriter.java"


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field public static final VERSION_00:I = 0x0

.field public static final VERSION_10:I = 0xa

.field public static final VERSION_15:I = 0xf

.field public static final VERSION_20:I = 0x14


# instance fields
.field private count:J

.field private idMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/dd/plist/NSObject;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private idSizeInBytes:I

.field private out:Ljava/io/OutputStream;

.field private version:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method constructor <init>(Ljava/io/OutputStream;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 156
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 137
    iput v0, p0, Lcom/dd/plist/BinaryPropertyListWriter;->version:I

    .line 146
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/dd/plist/BinaryPropertyListWriter;->idMap:Ljava/util/Map;

    .line 157
    new-instance v0, Ljava/io/BufferedOutputStream;

    invoke-direct {v0, p1}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v0, p0, Lcom/dd/plist/BinaryPropertyListWriter;->out:Ljava/io/OutputStream;

    return-void
.end method

.method constructor <init>(Ljava/io/OutputStream;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 160
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 137
    iput v0, p0, Lcom/dd/plist/BinaryPropertyListWriter;->version:I

    .line 146
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/dd/plist/BinaryPropertyListWriter;->idMap:Ljava/util/Map;

    .line 161
    iput p2, p0, Lcom/dd/plist/BinaryPropertyListWriter;->version:I

    .line 162
    new-instance p2, Ljava/io/BufferedOutputStream;

    invoke-direct {p2, p1}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object p2, p0, Lcom/dd/plist/BinaryPropertyListWriter;->out:Ljava/io/OutputStream;

    return-void
.end method

.method private static computeIdSizeInBytes(I)I
    .locals 1

    const/16 v0, 0x100

    if-ge p0, v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/high16 v0, 0x10000

    if-ge p0, v0, :cond_1

    const/4 p0, 0x2

    return p0

    :cond_1
    const/4 p0, 0x4

    return p0
.end method

.method private computeOffsetSizeInBytes(J)I
    .locals 2

    const-wide/16 v0, 0x100

    cmp-long v0, p1, v0

    if-gez v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const-wide/32 v0, 0x10000

    cmp-long v0, p1, v0

    if-gez v0, :cond_1

    const/4 p1, 0x2

    return p1

    :cond_1
    const-wide v0, 0x100000000L

    cmp-long p1, p1, v0

    if-gez p1, :cond_2

    const/4 p1, 0x4

    return p1

    :cond_2
    const/16 p1, 0x8

    return p1
.end method

.method private static getMinimumRequiredVersion(Lcom/dd/plist/NSObject;)I
    .locals 4

    const/16 v0, 0xa

    const/4 v1, 0x0

    if-nez p0, :cond_0

    move v2, v0

    goto :goto_0

    :cond_0
    move v2, v1

    .line 62
    :goto_0
    instance-of v3, p0, Lcom/dd/plist/NSDictionary;

    if-eqz v3, :cond_2

    .line 63
    check-cast p0, Lcom/dd/plist/NSDictionary;

    .line 64
    invoke-virtual {p0}, Lcom/dd/plist/NSDictionary;->getHashMap()Ljava/util/HashMap;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_1
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/dd/plist/NSObject;

    .line 65
    invoke-static {v0}, Lcom/dd/plist/BinaryPropertyListWriter;->getMinimumRequiredVersion(Lcom/dd/plist/NSObject;)I

    move-result v0

    if-le v0, v2, :cond_1

    move v2, v0

    goto :goto_1

    .line 69
    :cond_2
    instance-of v3, p0, Lcom/dd/plist/NSArray;

    if-eqz v3, :cond_4

    .line 70
    check-cast p0, Lcom/dd/plist/NSArray;

    .line 71
    invoke-virtual {p0}, Lcom/dd/plist/NSArray;->getArray()[Lcom/dd/plist/NSObject;

    move-result-object p0

    array-length v0, p0

    :goto_2
    if-ge v1, v0, :cond_7

    aget-object v3, p0, v1

    .line 72
    invoke-static {v3}, Lcom/dd/plist/BinaryPropertyListWriter;->getMinimumRequiredVersion(Lcom/dd/plist/NSObject;)I

    move-result v3

    if-le v3, v2, :cond_3

    move v2, v3

    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 76
    :cond_4
    instance-of v3, p0, Lcom/dd/plist/NSSet;

    if-eqz v3, :cond_7

    .line 79
    check-cast p0, Lcom/dd/plist/NSSet;

    .line 80
    invoke-virtual {p0}, Lcom/dd/plist/NSSet;->allObjects()[Lcom/dd/plist/NSObject;

    move-result-object p0

    array-length v2, p0

    :goto_3
    if-ge v1, v2, :cond_6

    aget-object v3, p0, v1

    .line 81
    invoke-static {v3}, Lcom/dd/plist/BinaryPropertyListWriter;->getMinimumRequiredVersion(Lcom/dd/plist/NSObject;)I

    move-result v3

    if-le v3, v0, :cond_5

    move v0, v3

    :cond_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    :cond_6
    move v2, v0

    :cond_7
    return v2
.end method

.method public static write(Ljava/io/File;Lcom/dd/plist/NSObject;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 98
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 99
    invoke-static {v0, p1}, Lcom/dd/plist/BinaryPropertyListWriter;->write(Ljava/io/OutputStream;Lcom/dd/plist/NSObject;)V

    .line 100
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    return-void
.end method

.method public static write(Ljava/io/OutputStream;Lcom/dd/plist/NSObject;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 112
    invoke-static {p1}, Lcom/dd/plist/BinaryPropertyListWriter;->getMinimumRequiredVersion(Lcom/dd/plist/NSObject;)I

    move-result v0

    if-lez v0, :cond_3

    const/16 p0, 0xa

    if-eq v0, p0, :cond_2

    const/16 p0, 0xf

    if-eq v0, p0, :cond_1

    const/16 p0, 0x14

    if-ne v0, p0, :cond_0

    const-string p0, "v2.0"

    goto :goto_0

    :cond_0
    const-string p0, "v0.0"

    goto :goto_0

    :cond_1
    const-string p0, "v1.5"

    goto :goto_0

    :cond_2
    const-string p0, "v1.0"

    .line 115
    :goto_0
    new-instance p1, Ljava/io/IOException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "The given property list structure cannot be saved. The required version of the binary format ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ") is not yet supported."

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 118
    :cond_3
    new-instance v1, Lcom/dd/plist/BinaryPropertyListWriter;

    invoke-direct {v1, p0, v0}, Lcom/dd/plist/BinaryPropertyListWriter;-><init>(Ljava/io/OutputStream;I)V

    .line 119
    invoke-virtual {v1, p1}, Lcom/dd/plist/BinaryPropertyListWriter;->write(Lcom/dd/plist/NSObject;)V

    return-void
.end method

.method public static writeToArray(Lcom/dd/plist/NSObject;)[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 132
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 133
    invoke-static {v0, p0}, Lcom/dd/plist/BinaryPropertyListWriter;->write(Ljava/io/OutputStream;Lcom/dd/plist/NSObject;)V

    .line 134
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method assignID(Lcom/dd/plist/NSObject;)V
    .locals 2

    .line 236
    iget-object v0, p0, Lcom/dd/plist/BinaryPropertyListWriter;->idMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 237
    iget-object v0, p0, Lcom/dd/plist/BinaryPropertyListWriter;->idMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method getID(Lcom/dd/plist/NSObject;)I
    .locals 1

    .line 242
    iget-object v0, p0, Lcom/dd/plist/BinaryPropertyListWriter;->idMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    return p1
.end method

.method write(I)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 278
    iget-object v0, p0, Lcom/dd/plist/BinaryPropertyListWriter;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 279
    iget-wide v0, p0, Lcom/dd/plist/BinaryPropertyListWriter;->count:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/dd/plist/BinaryPropertyListWriter;->count:J

    return-void
.end method

.method write(Lcom/dd/plist/NSObject;)V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x6

    .line 167
    new-array v1, v0, [B

    fill-array-data v1, :array_0

    invoke-virtual {p0, v1}, Lcom/dd/plist/BinaryPropertyListWriter;->write([B)V

    .line 170
    iget v1, p0, Lcom/dd/plist/BinaryPropertyListWriter;->version:I

    const/16 v2, 0xf

    const/4 v3, 0x2

    if-eqz v1, :cond_3

    const/16 v4, 0xa

    if-eq v1, v4, :cond_2

    if-eq v1, v2, :cond_1

    const/16 v4, 0x14

    if-eq v1, v4, :cond_0

    goto :goto_0

    .line 184
    :cond_0
    new-array v1, v3, [B

    fill-array-data v1, :array_1

    invoke-virtual {p0, v1}, Lcom/dd/plist/BinaryPropertyListWriter;->write([B)V

    goto :goto_0

    .line 180
    :cond_1
    new-array v1, v3, [B

    fill-array-data v1, :array_2

    invoke-virtual {p0, v1}, Lcom/dd/plist/BinaryPropertyListWriter;->write([B)V

    goto :goto_0

    .line 176
    :cond_2
    new-array v1, v3, [B

    fill-array-data v1, :array_3

    invoke-virtual {p0, v1}, Lcom/dd/plist/BinaryPropertyListWriter;->write([B)V

    goto :goto_0

    .line 172
    :cond_3
    new-array v1, v3, [B

    fill-array-data v1, :array_4

    invoke-virtual {p0, v1}, Lcom/dd/plist/BinaryPropertyListWriter;->write([B)V

    .line 190
    :goto_0
    invoke-virtual {p1, p0}, Lcom/dd/plist/NSObject;->assignIDs(Lcom/dd/plist/BinaryPropertyListWriter;)V

    .line 192
    iget-object v1, p0, Lcom/dd/plist/BinaryPropertyListWriter;->idMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    invoke-static {v1}, Lcom/dd/plist/BinaryPropertyListWriter;->computeIdSizeInBytes(I)I

    move-result v1

    iput v1, p0, Lcom/dd/plist/BinaryPropertyListWriter;->idSizeInBytes:I

    .line 195
    iget-object v1, p0, Lcom/dd/plist/BinaryPropertyListWriter;->idMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    new-array v1, v1, [J

    .line 198
    iget-object v3, p0, Lcom/dd/plist/BinaryPropertyListWriter;->idMap:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    const/4 v5, 0x0

    if-eqz v4, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 199
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/dd/plist/NSObject;

    .line 200
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 201
    iget-wide v7, p0, Lcom/dd/plist/BinaryPropertyListWriter;->count:J

    aput-wide v7, v1, v4

    if-nez v6, :cond_4

    .line 203
    invoke-virtual {p0, v5}, Lcom/dd/plist/BinaryPropertyListWriter;->write(I)V

    goto :goto_1

    .line 205
    :cond_4
    invoke-virtual {v6, p0}, Lcom/dd/plist/NSObject;->toBinary(Lcom/dd/plist/BinaryPropertyListWriter;)V

    goto :goto_1

    .line 210
    :cond_5
    iget-wide v3, p0, Lcom/dd/plist/BinaryPropertyListWriter;->count:J

    .line 211
    invoke-direct {p0, v3, v4}, Lcom/dd/plist/BinaryPropertyListWriter;->computeOffsetSizeInBytes(J)I

    move-result v6

    .line 212
    array-length v7, v1

    :goto_2
    if-ge v5, v7, :cond_6

    aget-wide v8, v1, v5

    .line 213
    invoke-virtual {p0, v8, v9, v6}, Lcom/dd/plist/BinaryPropertyListWriter;->writeBytes(JI)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 216
    :cond_6
    iget v1, p0, Lcom/dd/plist/BinaryPropertyListWriter;->version:I

    if-eq v1, v2, :cond_7

    .line 219
    new-array v0, v0, [B

    invoke-virtual {p0, v0}, Lcom/dd/plist/BinaryPropertyListWriter;->write([B)V

    .line 221
    invoke-virtual {p0, v6}, Lcom/dd/plist/BinaryPropertyListWriter;->write(I)V

    .line 223
    iget v0, p0, Lcom/dd/plist/BinaryPropertyListWriter;->idSizeInBytes:I

    invoke-virtual {p0, v0}, Lcom/dd/plist/BinaryPropertyListWriter;->write(I)V

    .line 225
    iget-object v0, p0, Lcom/dd/plist/BinaryPropertyListWriter;->idMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    int-to-long v0, v0

    invoke-virtual {p0, v0, v1}, Lcom/dd/plist/BinaryPropertyListWriter;->writeLong(J)V

    .line 227
    iget-object v0, p0, Lcom/dd/plist/BinaryPropertyListWriter;->idMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    int-to-long v0, p1

    invoke-virtual {p0, v0, v1}, Lcom/dd/plist/BinaryPropertyListWriter;->writeLong(J)V

    .line 229
    invoke-virtual {p0, v3, v4}, Lcom/dd/plist/BinaryPropertyListWriter;->writeLong(J)V

    .line 232
    :cond_7
    iget-object p1, p0, Lcom/dd/plist/BinaryPropertyListWriter;->out:Ljava/io/OutputStream;

    invoke-virtual {p1}, Ljava/io/OutputStream;->flush()V

    return-void

    nop

    :array_0
    .array-data 1
        0x62t
        0x70t
        0x6ct
        0x69t
        0x73t
        0x74t
    .end array-data

    nop

    :array_1
    .array-data 1
        0x32t
        0x30t
    .end array-data

    nop

    :array_2
    .array-data 1
        0x31t
        0x35t
    .end array-data

    nop

    :array_3
    .array-data 1
        0x31t
        0x30t
    .end array-data

    nop

    :array_4
    .array-data 1
        0x30t
        0x30t
    .end array-data
.end method

.method write([B)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 283
    iget-object v0, p0, Lcom/dd/plist/BinaryPropertyListWriter;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write([B)V

    .line 284
    iget-wide v0, p0, Lcom/dd/plist/BinaryPropertyListWriter;->count:J

    array-length p1, p1

    int-to-long v2, p1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/dd/plist/BinaryPropertyListWriter;->count:J

    return-void
.end method

.method writeBytes(JI)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    add-int/lit8 p3, p3, -0x1

    :goto_0
    if-ltz p3, :cond_0

    mul-int/lit8 v0, p3, 0x8

    shr-long v0, p1, v0

    long-to-int v0, v0

    .line 290
    invoke-virtual {p0, v0}, Lcom/dd/plist/BinaryPropertyListWriter;->write(I)V

    add-int/lit8 p3, p3, -0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method writeDouble(D)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 303
    invoke-static {p1, p2}, Ljava/lang/Double;->doubleToRawLongBits(D)J

    move-result-wide p1

    invoke-virtual {p0, p1, p2}, Lcom/dd/plist/BinaryPropertyListWriter;->writeLong(J)V

    return-void
.end method

.method writeID(I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    int-to-long v0, p1

    .line 295
    iget p1, p0, Lcom/dd/plist/BinaryPropertyListWriter;->idSizeInBytes:I

    invoke-virtual {p0, v0, v1, p1}, Lcom/dd/plist/BinaryPropertyListWriter;->writeBytes(JI)V

    return-void
.end method

.method writeIntHeader(II)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0xf

    const/4 v1, 0x4

    if-ge p2, v0, :cond_0

    shl-int/2addr p1, v1

    add-int/2addr p1, p2

    .line 261
    invoke-virtual {p0, p1}, Lcom/dd/plist/BinaryPropertyListWriter;->write(I)V

    goto :goto_0

    :cond_0
    const/16 v2, 0x100

    if-ge p2, v2, :cond_1

    shl-int/2addr p1, v1

    add-int/2addr p1, v0

    .line 263
    invoke-virtual {p0, p1}, Lcom/dd/plist/BinaryPropertyListWriter;->write(I)V

    const/16 p1, 0x10

    .line 264
    invoke-virtual {p0, p1}, Lcom/dd/plist/BinaryPropertyListWriter;->write(I)V

    int-to-long p1, p2

    const/4 v0, 0x1

    .line 265
    invoke-virtual {p0, p1, p2, v0}, Lcom/dd/plist/BinaryPropertyListWriter;->writeBytes(JI)V

    goto :goto_0

    :cond_1
    const/high16 v2, 0x10000

    if-ge p2, v2, :cond_2

    shl-int/2addr p1, v1

    add-int/2addr p1, v0

    .line 267
    invoke-virtual {p0, p1}, Lcom/dd/plist/BinaryPropertyListWriter;->write(I)V

    const/16 p1, 0x11

    .line 268
    invoke-virtual {p0, p1}, Lcom/dd/plist/BinaryPropertyListWriter;->write(I)V

    int-to-long p1, p2

    const/4 v0, 0x2

    .line 269
    invoke-virtual {p0, p1, p2, v0}, Lcom/dd/plist/BinaryPropertyListWriter;->writeBytes(JI)V

    goto :goto_0

    :cond_2
    shl-int/2addr p1, v1

    add-int/2addr p1, v0

    .line 271
    invoke-virtual {p0, p1}, Lcom/dd/plist/BinaryPropertyListWriter;->write(I)V

    const/16 p1, 0x12

    .line 272
    invoke-virtual {p0, p1}, Lcom/dd/plist/BinaryPropertyListWriter;->write(I)V

    int-to-long p1, p2

    .line 273
    invoke-virtual {p0, p1, p2, v1}, Lcom/dd/plist/BinaryPropertyListWriter;->writeBytes(JI)V

    :goto_0
    return-void
.end method

.method writeLong(J)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x8

    .line 299
    invoke-virtual {p0, p1, p2, v0}, Lcom/dd/plist/BinaryPropertyListWriter;->writeBytes(JI)V

    return-void
.end method
