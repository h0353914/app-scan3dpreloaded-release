.class public abstract Lcom/dd/plist/NSObject;
.super Ljava/lang/Object;
.source "NSObject.java"


# static fields
.field static final ASCII_LINE_LENGTH:I = 0x50

.field static final INDENT:Ljava/lang/String; = "\t"

.field static final NEWLINE:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "line.separator"

    .line 44
    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/dd/plist/NSObject;->NEWLINE:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static wrap([Ljava/lang/Object;)Lcom/dd/plist/NSArray;
    .locals 3

    .line 183
    new-instance v0, Lcom/dd/plist/NSArray;

    array-length v1, p0

    invoke-direct {v0, v1}, Lcom/dd/plist/NSArray;-><init>(I)V

    const/4 v1, 0x0

    .line 184
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_0

    .line 185
    aget-object v2, p0, v1

    invoke-static {v2}, Lcom/dd/plist/NSObject;->wrap(Ljava/lang/Object;)Lcom/dd/plist/NSObject;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/dd/plist/NSArray;->setValue(ILjava/lang/Object;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public static wrap([B)Lcom/dd/plist/NSData;
    .locals 1

    .line 172
    new-instance v0, Lcom/dd/plist/NSData;

    invoke-direct {v0, p0}, Lcom/dd/plist/NSData;-><init>([B)V

    return-object v0
.end method

.method public static wrap(Ljava/util/Map;)Lcom/dd/plist/NSDictionary;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/dd/plist/NSDictionary;"
        }
    .end annotation

    .line 198
    new-instance v0, Lcom/dd/plist/NSDictionary;

    invoke-direct {v0}, Lcom/dd/plist/NSDictionary;-><init>()V

    .line 199
    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 200
    invoke-interface {p0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lcom/dd/plist/NSObject;->wrap(Ljava/lang/Object;)Lcom/dd/plist/NSObject;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/dd/plist/NSDictionary;->put(Ljava/lang/String;Lcom/dd/plist/NSObject;)Lcom/dd/plist/NSObject;

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public static wrap(D)Lcom/dd/plist/NSNumber;
    .locals 1

    .line 152
    new-instance v0, Lcom/dd/plist/NSNumber;

    invoke-direct {v0, p0, p1}, Lcom/dd/plist/NSNumber;-><init>(D)V

    return-object v0
.end method

.method public static wrap(J)Lcom/dd/plist/NSNumber;
    .locals 1

    .line 142
    new-instance v0, Lcom/dd/plist/NSNumber;

    invoke-direct {v0, p0, p1}, Lcom/dd/plist/NSNumber;-><init>(J)V

    return-object v0
.end method

.method public static wrap(Z)Lcom/dd/plist/NSNumber;
    .locals 1

    .line 162
    new-instance v0, Lcom/dd/plist/NSNumber;

    invoke-direct {v0, p0}, Lcom/dd/plist/NSNumber;-><init>(Z)V

    return-object v0
.end method

.method public static wrap(Ljava/lang/Object;)Lcom/dd/plist/NSObject;
    .locals 5

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 240
    :cond_0
    instance-of v0, p0, Lcom/dd/plist/NSObject;

    if-eqz v0, :cond_1

    .line 241
    check-cast p0, Lcom/dd/plist/NSObject;

    return-object p0

    .line 243
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 244
    const-class v1, Ljava/lang/Boolean;

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 245
    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    invoke-static {p0}, Lcom/dd/plist/NSObject;->wrap(Z)Lcom/dd/plist/NSNumber;

    move-result-object p0

    return-object p0

    .line 247
    :cond_2
    const-class v1, Ljava/lang/Byte;

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 248
    check-cast p0, Ljava/lang/Byte;

    invoke-virtual {p0}, Ljava/lang/Byte;->byteValue()B

    move-result p0

    int-to-long v0, p0

    invoke-static {v0, v1}, Lcom/dd/plist/NSObject;->wrap(J)Lcom/dd/plist/NSNumber;

    move-result-object p0

    return-object p0

    .line 250
    :cond_3
    const-class v1, Ljava/lang/Short;

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 251
    check-cast p0, Ljava/lang/Short;

    invoke-virtual {p0}, Ljava/lang/Short;->shortValue()S

    move-result p0

    int-to-long v0, p0

    invoke-static {v0, v1}, Lcom/dd/plist/NSObject;->wrap(J)Lcom/dd/plist/NSNumber;

    move-result-object p0

    return-object p0

    .line 253
    :cond_4
    const-class v1, Ljava/lang/Integer;

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 254
    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    int-to-long v0, p0

    invoke-static {v0, v1}, Lcom/dd/plist/NSObject;->wrap(J)Lcom/dd/plist/NSNumber;

    move-result-object p0

    return-object p0

    .line 256
    :cond_5
    const-class v1, Ljava/lang/Long;

    invoke-virtual {v1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 257
    check-cast p0, Ljava/lang/Long;

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/dd/plist/NSObject;->wrap(J)Lcom/dd/plist/NSNumber;

    move-result-object p0

    return-object p0

    .line 259
    :cond_6
    const-class v1, Ljava/lang/Float;

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 260
    check-cast p0, Ljava/lang/Float;

    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    move-result p0

    float-to-double v0, p0

    invoke-static {v0, v1}, Lcom/dd/plist/NSObject;->wrap(D)Lcom/dd/plist/NSNumber;

    move-result-object p0

    return-object p0

    .line 262
    :cond_7
    const-class v1, Ljava/lang/Double;

    invoke-virtual {v1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 263
    check-cast p0, Ljava/lang/Double;

    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/dd/plist/NSObject;->wrap(D)Lcom/dd/plist/NSNumber;

    move-result-object p0

    return-object p0

    .line 265
    :cond_8
    const-class v1, Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 266
    new-instance v0, Lcom/dd/plist/NSString;

    check-cast p0, Ljava/lang/String;

    invoke-direct {v0, p0}, Lcom/dd/plist/NSString;-><init>(Ljava/lang/String;)V

    return-object v0

    .line 268
    :cond_9
    const-class v1, Ljava/util/Date;

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 269
    new-instance v0, Lcom/dd/plist/NSDate;

    check-cast p0, Ljava/util/Date;

    invoke-direct {v0, p0}, Lcom/dd/plist/NSDate;-><init>(Ljava/util/Date;)V

    return-object v0

    .line 271
    :cond_a
    invoke-virtual {v0}, Ljava/lang/Class;->isArray()Z

    move-result v1

    if-eqz v1, :cond_18

    .line 272
    invoke-virtual {v0}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v0

    .line 273
    sget-object v1, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 274
    check-cast p0, [B

    invoke-static {p0}, Lcom/dd/plist/NSObject;->wrap([B)Lcom/dd/plist/NSData;

    move-result-object p0

    return-object p0

    .line 276
    :cond_b
    sget-object v1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_d

    .line 277
    check-cast p0, [Z

    .line 278
    new-instance v0, Lcom/dd/plist/NSArray;

    array-length v1, p0

    invoke-direct {v0, v1}, Lcom/dd/plist/NSArray;-><init>(I)V

    .line 279
    :goto_0
    array-length v1, p0

    if-ge v2, v1, :cond_c

    .line 280
    aget-boolean v1, p0, v2

    invoke-static {v1}, Lcom/dd/plist/NSObject;->wrap(Z)Lcom/dd/plist/NSNumber;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Lcom/dd/plist/NSArray;->setValue(ILjava/lang/Object;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_c
    return-object v0

    .line 283
    :cond_d
    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_f

    .line 284
    check-cast p0, [F

    .line 285
    new-instance v0, Lcom/dd/plist/NSArray;

    array-length v1, p0

    invoke-direct {v0, v1}, Lcom/dd/plist/NSArray;-><init>(I)V

    .line 286
    :goto_1
    array-length v1, p0

    if-ge v2, v1, :cond_e

    .line 287
    aget v1, p0, v2

    float-to-double v3, v1

    invoke-static {v3, v4}, Lcom/dd/plist/NSObject;->wrap(D)Lcom/dd/plist/NSNumber;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Lcom/dd/plist/NSArray;->setValue(ILjava/lang/Object;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_e
    return-object v0

    .line 290
    :cond_f
    sget-object v1, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_11

    .line 291
    check-cast p0, [D

    .line 292
    new-instance v0, Lcom/dd/plist/NSArray;

    array-length v1, p0

    invoke-direct {v0, v1}, Lcom/dd/plist/NSArray;-><init>(I)V

    .line 293
    :goto_2
    array-length v1, p0

    if-ge v2, v1, :cond_10

    .line 294
    aget-wide v3, p0, v2

    invoke-static {v3, v4}, Lcom/dd/plist/NSObject;->wrap(D)Lcom/dd/plist/NSNumber;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Lcom/dd/plist/NSArray;->setValue(ILjava/lang/Object;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :cond_10
    return-object v0

    .line 297
    :cond_11
    sget-object v1, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_13

    .line 298
    check-cast p0, [S

    .line 299
    new-instance v0, Lcom/dd/plist/NSArray;

    array-length v1, p0

    invoke-direct {v0, v1}, Lcom/dd/plist/NSArray;-><init>(I)V

    .line 300
    :goto_3
    array-length v1, p0

    if-ge v2, v1, :cond_12

    .line 301
    aget-short v1, p0, v2

    int-to-long v3, v1

    invoke-static {v3, v4}, Lcom/dd/plist/NSObject;->wrap(J)Lcom/dd/plist/NSNumber;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Lcom/dd/plist/NSArray;->setValue(ILjava/lang/Object;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    :cond_12
    return-object v0

    .line 304
    :cond_13
    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_15

    .line 305
    check-cast p0, [I

    .line 306
    new-instance v0, Lcom/dd/plist/NSArray;

    array-length v1, p0

    invoke-direct {v0, v1}, Lcom/dd/plist/NSArray;-><init>(I)V

    .line 307
    :goto_4
    array-length v1, p0

    if-ge v2, v1, :cond_14

    .line 308
    aget v1, p0, v2

    int-to-long v3, v1

    invoke-static {v3, v4}, Lcom/dd/plist/NSObject;->wrap(J)Lcom/dd/plist/NSNumber;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Lcom/dd/plist/NSArray;->setValue(ILjava/lang/Object;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    :cond_14
    return-object v0

    .line 311
    :cond_15
    sget-object v1, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_17

    .line 312
    check-cast p0, [J

    .line 313
    new-instance v0, Lcom/dd/plist/NSArray;

    array-length v1, p0

    invoke-direct {v0, v1}, Lcom/dd/plist/NSArray;-><init>(I)V

    .line 314
    :goto_5
    array-length v1, p0

    if-ge v2, v1, :cond_16

    .line 315
    aget-wide v3, p0, v2

    invoke-static {v3, v4}, Lcom/dd/plist/NSObject;->wrap(J)Lcom/dd/plist/NSNumber;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Lcom/dd/plist/NSArray;->setValue(ILjava/lang/Object;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    :cond_16
    return-object v0

    .line 319
    :cond_17
    check-cast p0, [Ljava/lang/Object;

    invoke-static {p0}, Lcom/dd/plist/NSObject;->wrap([Ljava/lang/Object;)Lcom/dd/plist/NSArray;

    move-result-object p0

    return-object p0

    .line 322
    :cond_18
    const-class v1, Ljava/util/Map;

    invoke-virtual {v1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 323
    check-cast p0, Ljava/util/Map;

    .line 324
    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    .line 325
    new-instance v1, Lcom/dd/plist/NSDictionary;

    invoke-direct {v1}, Lcom/dd/plist/NSDictionary;-><init>()V

    .line 326
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_19

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 327
    invoke-interface {p0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 328
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v3}, Lcom/dd/plist/NSObject;->wrap(Ljava/lang/Object;)Lcom/dd/plist/NSObject;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/dd/plist/NSDictionary;->put(Ljava/lang/String;Lcom/dd/plist/NSObject;)Lcom/dd/plist/NSObject;

    goto :goto_6

    :cond_19
    return-object v1

    .line 332
    :cond_1a
    const-class v1, Ljava/util/Collection;

    invoke-virtual {v1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_1b

    .line 333
    check-cast p0, Ljava/util/Collection;

    .line 334
    invoke-interface {p0}, Ljava/util/Collection;->toArray()[Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lcom/dd/plist/NSObject;->wrap([Ljava/lang/Object;)Lcom/dd/plist/NSArray;

    move-result-object p0

    return-object p0

    .line 336
    :cond_1b
    invoke-static {p0}, Lcom/dd/plist/NSObject;->wrapSerialized(Ljava/lang/Object;)Lcom/dd/plist/NSData;

    move-result-object p0

    return-object p0
.end method

.method public static wrap(Ljava/util/Set;)Lcom/dd/plist/NSSet;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/dd/plist/NSSet;"
        }
    .end annotation

    .line 212
    new-instance v0, Lcom/dd/plist/NSSet;

    invoke-direct {v0}, Lcom/dd/plist/NSSet;-><init>()V

    .line 213
    invoke-interface {p0}, Ljava/util/Set;->toArray()[Ljava/lang/Object;

    move-result-object p0

    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, p0, v2

    .line 214
    invoke-static {v3}, Lcom/dd/plist/NSObject;->wrap(Ljava/lang/Object;)Lcom/dd/plist/NSObject;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/dd/plist/NSSet;->addObject(Lcom/dd/plist/NSObject;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public static wrapSerialized(Ljava/lang/Object;)Lcom/dd/plist/NSData;
    .locals 3

    .line 349
    :try_start_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 350
    new-instance v1, Ljava/io/ObjectOutputStream;

    invoke-direct {v1, v0}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 351
    invoke-virtual {v1, p0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 352
    new-instance v1, Lcom/dd/plist/NSData;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/dd/plist/NSData;-><init>([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 354
    :catch_0
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "The given object of class "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " could not be serialized and stored in a NSData object."

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method assignIDs(Lcom/dd/plist/BinaryPropertyListWriter;)V
    .locals 0

    .line 73
    invoke-virtual {p1, p0}, Lcom/dd/plist/BinaryPropertyListWriter;->assignID(Lcom/dd/plist/NSObject;)V

    return-void
.end method

.method indent(Ljava/lang/StringBuilder;I)V
    .locals 2

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p2, :cond_0

    const-string v1, "\t"

    .line 132
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method protected abstract toASCII(Ljava/lang/StringBuilder;I)V
.end method

.method protected abstract toASCIIGnuStep(Ljava/lang/StringBuilder;I)V
.end method

.method abstract toBinary(Lcom/dd/plist/BinaryPropertyListWriter;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public toJavaObject()Ljava/lang/Object;
    .locals 5

    .line 374
    instance-of v0, p0, Lcom/dd/plist/NSArray;

    if-eqz v0, :cond_1

    .line 375
    move-object v0, p0

    check-cast v0, Lcom/dd/plist/NSArray;

    invoke-virtual {v0}, Lcom/dd/plist/NSArray;->getArray()[Lcom/dd/plist/NSObject;

    move-result-object v0

    .line 376
    array-length v1, v0

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    .line 377
    :goto_0
    array-length v3, v0

    if-ge v2, v3, :cond_0

    .line 378
    aget-object v3, v0, v2

    invoke-virtual {v3}, Lcom/dd/plist/NSObject;->toJavaObject()Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-object v1

    .line 381
    :cond_1
    instance-of v0, p0, Lcom/dd/plist/NSDictionary;

    if-eqz v0, :cond_3

    .line 382
    move-object v0, p0

    check-cast v0, Lcom/dd/plist/NSDictionary;

    invoke-virtual {v0}, Lcom/dd/plist/NSDictionary;->getHashMap()Ljava/util/HashMap;

    move-result-object v0

    .line 383
    new-instance v1, Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    .line 384
    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 385
    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/dd/plist/NSObject;

    invoke-virtual {v4}, Lcom/dd/plist/NSObject;->toJavaObject()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_2
    return-object v1

    .line 388
    :cond_3
    instance-of v0, p0, Lcom/dd/plist/NSSet;

    if-eqz v0, :cond_6

    .line 389
    move-object v0, p0

    check-cast v0, Lcom/dd/plist/NSSet;

    invoke-virtual {v0}, Lcom/dd/plist/NSSet;->getSet()Ljava/util/Set;

    move-result-object v0

    .line 391
    instance-of v1, v0, Ljava/util/LinkedHashSet;

    if-eqz v1, :cond_4

    .line 392
    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/LinkedHashSet;-><init>(I)V

    goto :goto_2

    .line 394
    :cond_4
    new-instance v1, Ljava/util/TreeSet;

    invoke-direct {v1}, Ljava/util/TreeSet;-><init>()V

    .line 396
    :goto_2
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/dd/plist/NSObject;

    .line 397
    invoke-virtual {v2}, Lcom/dd/plist/NSObject;->toJavaObject()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :cond_5
    return-object v1

    .line 400
    :cond_6
    instance-of v0, p0, Lcom/dd/plist/NSNumber;

    if-eqz v0, :cond_9

    .line 401
    move-object v0, p0

    check-cast v0, Lcom/dd/plist/NSNumber;

    .line 402
    invoke-virtual {v0}, Lcom/dd/plist/NSNumber;->type()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 418
    invoke-virtual {v0}, Lcom/dd/plist/NSNumber;->doubleValue()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    return-object v0

    .line 415
    :pswitch_0
    invoke-virtual {v0}, Lcom/dd/plist/NSNumber;->boolValue()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    .line 412
    :pswitch_1
    invoke-virtual {v0}, Lcom/dd/plist/NSNumber;->doubleValue()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    return-object v0

    .line 404
    :pswitch_2
    invoke-virtual {v0}, Lcom/dd/plist/NSNumber;->longValue()J

    move-result-wide v1

    const-wide/32 v3, 0x7fffffff

    cmp-long v3, v1, v3

    if-gtz v3, :cond_8

    const-wide/32 v3, -0x80000000

    cmp-long v3, v1, v3

    if-gez v3, :cond_7

    goto :goto_4

    .line 408
    :cond_7
    invoke-virtual {v0}, Lcom/dd/plist/NSNumber;->intValue()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0

    .line 406
    :cond_8
    :goto_4
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0

    .line 421
    :cond_9
    instance-of v0, p0, Lcom/dd/plist/NSString;

    if-eqz v0, :cond_a

    .line 422
    move-object v0, p0

    check-cast v0, Lcom/dd/plist/NSString;

    invoke-virtual {v0}, Lcom/dd/plist/NSString;->getContent()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 423
    :cond_a
    instance-of v0, p0, Lcom/dd/plist/NSData;

    if-eqz v0, :cond_b

    .line 424
    move-object v0, p0

    check-cast v0, Lcom/dd/plist/NSData;

    invoke-virtual {v0}, Lcom/dd/plist/NSData;->bytes()[B

    move-result-object v0

    return-object v0

    .line 425
    :cond_b
    instance-of v0, p0, Lcom/dd/plist/NSDate;

    if-eqz v0, :cond_c

    .line 426
    move-object v0, p0

    check-cast v0, Lcom/dd/plist/NSDate;

    invoke-virtual {v0}, Lcom/dd/plist/NSDate;->getDate()Ljava/util/Date;

    move-result-object v0

    return-object v0

    .line 427
    :cond_c
    instance-of v0, p0, Lcom/dd/plist/UID;

    if-eqz v0, :cond_d

    .line 428
    move-object v0, p0

    check-cast v0, Lcom/dd/plist/UID;

    invoke-virtual {v0}, Lcom/dd/plist/UID;->getBytes()[B

    move-result-object v0

    return-object v0

    :cond_d
    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method abstract toXML(Ljava/lang/StringBuilder;I)V
.end method

.method public toXMLPropertyList()Ljava/lang/String;
    .locals 2

    .line 91
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 92
    sget-object v1, Lcom/dd/plist/NSObject;->NEWLINE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">"

    .line 93
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    sget-object v1, Lcom/dd/plist/NSObject;->NEWLINE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "<plist version=\"1.0\">"

    .line 95
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    sget-object v1, Lcom/dd/plist/NSObject;->NEWLINE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v1, 0x0

    .line 97
    invoke-virtual {p0, v0, v1}, Lcom/dd/plist/NSObject;->toXML(Ljava/lang/StringBuilder;I)V

    .line 98
    sget-object v1, Lcom/dd/plist/NSObject;->NEWLINE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "</plist>"

    .line 99
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
