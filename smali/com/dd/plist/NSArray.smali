.class public Lcom/dd/plist/NSArray;
.super Lcom/dd/plist/NSObject;
.source "NSArray.java"


# instance fields
.field private array:[Lcom/dd/plist/NSObject;


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 43
    invoke-direct {p0}, Lcom/dd/plist/NSObject;-><init>()V

    .line 44
    new-array p1, p1, [Lcom/dd/plist/NSObject;

    iput-object p1, p0, Lcom/dd/plist/NSArray;->array:[Lcom/dd/plist/NSObject;

    return-void
.end method

.method public varargs constructor <init>([Lcom/dd/plist/NSObject;)V
    .locals 0

    .line 52
    invoke-direct {p0}, Lcom/dd/plist/NSObject;-><init>()V

    .line 53
    iput-object p1, p0, Lcom/dd/plist/NSArray;->array:[Lcom/dd/plist/NSObject;

    return-void
.end method


# virtual methods
.method assignIDs(Lcom/dd/plist/BinaryPropertyListWriter;)V
    .locals 4

    .line 238
    invoke-super {p0, p1}, Lcom/dd/plist/NSObject;->assignIDs(Lcom/dd/plist/BinaryPropertyListWriter;)V

    .line 239
    iget-object v0, p0, Lcom/dd/plist/NSArray;->array:[Lcom/dd/plist/NSObject;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 240
    invoke-virtual {v3, p1}, Lcom/dd/plist/NSObject;->assignIDs(Lcom/dd/plist/BinaryPropertyListWriter;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public containsObject(Ljava/lang/Object;)Z
    .locals 7

    .line 122
    invoke-static {p1}, Lcom/dd/plist/NSObject;->wrap(Ljava/lang/Object;)Lcom/dd/plist/NSObject;

    move-result-object v0

    .line 123
    iget-object v1, p0, Lcom/dd/plist/NSArray;->array:[Lcom/dd/plist/NSObject;

    array-length v2, v1

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-ge v4, v2, :cond_2

    aget-object v5, v1, v4

    const/4 v6, 0x1

    if-nez v5, :cond_0

    if-nez p1, :cond_1

    return v6

    .line 129
    :cond_0
    invoke-virtual {v5, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    return v6

    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_2
    return v3
.end method

.method public count()I
    .locals 1

    .line 110
    iget-object v0, p0, Lcom/dd/plist/NSArray;->array:[Lcom/dd/plist/NSObject;

    array-length v0, v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 205
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lcom/dd/plist/NSArray;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 206
    check-cast p1, Lcom/dd/plist/NSArray;

    invoke-virtual {p1}, Lcom/dd/plist/NSArray;->getArray()[Lcom/dd/plist/NSObject;

    move-result-object p1

    iget-object v0, p0, Lcom/dd/plist/NSArray;->array:[Lcom/dd/plist/NSObject;

    invoke-static {p1, v0}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result p1

    return p1

    .line 208
    :cond_1
    invoke-static {p1}, Lcom/dd/plist/NSObject;->wrap(Ljava/lang/Object;)Lcom/dd/plist/NSObject;

    move-result-object p1

    .line 209
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lcom/dd/plist/NSArray;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 210
    check-cast p1, Lcom/dd/plist/NSArray;

    invoke-virtual {p1}, Lcom/dd/plist/NSArray;->getArray()[Lcom/dd/plist/NSObject;

    move-result-object p1

    iget-object v0, p0, Lcom/dd/plist/NSArray;->array:[Lcom/dd/plist/NSObject;

    invoke-static {p1, v0}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_2
    return v0
.end method

.method public getArray()[Lcom/dd/plist/NSObject;
    .locals 1

    .line 101
    iget-object v0, p0, Lcom/dd/plist/NSArray;->array:[Lcom/dd/plist/NSObject;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .line 219
    iget-object v0, p0, Lcom/dd/plist/NSArray;->array:[Lcom/dd/plist/NSObject;

    invoke-static {v0}, Ljava/util/Arrays;->deepHashCode([Ljava/lang/Object;)I

    move-result v0

    const/16 v1, 0x26f

    add-int/2addr v1, v0

    return v1
.end method

.method public indexOfIdenticalObject(Ljava/lang/Object;)I
    .locals 3

    .line 167
    invoke-static {p1}, Lcom/dd/plist/NSObject;->wrap(Ljava/lang/Object;)Lcom/dd/plist/NSObject;

    move-result-object p1

    const/4 v0, 0x0

    .line 168
    :goto_0
    iget-object v1, p0, Lcom/dd/plist/NSArray;->array:[Lcom/dd/plist/NSObject;

    array-length v2, v1

    if-ge v0, v2, :cond_1

    .line 169
    aget-object v1, v1, v0

    if-ne v1, p1, :cond_0

    return v0

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, -0x1

    return p1
.end method

.method public indexOfObject(Ljava/lang/Object;)I
    .locals 3

    .line 147
    invoke-static {p1}, Lcom/dd/plist/NSObject;->wrap(Ljava/lang/Object;)Lcom/dd/plist/NSObject;

    move-result-object p1

    const/4 v0, 0x0

    .line 148
    :goto_0
    iget-object v1, p0, Lcom/dd/plist/NSArray;->array:[Lcom/dd/plist/NSObject;

    array-length v2, v1

    if-ge v0, v2, :cond_1

    .line 149
    aget-object v1, v1, v0

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return v0

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, -0x1

    return p1
.end method

.method public lastObject()Lcom/dd/plist/NSObject;
    .locals 2

    .line 183
    iget-object v0, p0, Lcom/dd/plist/NSArray;->array:[Lcom/dd/plist/NSObject;

    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    aget-object v0, v0, v1

    return-object v0
.end method

.method public objectAtIndex(I)Lcom/dd/plist/NSObject;
    .locals 1

    .line 64
    iget-object v0, p0, Lcom/dd/plist/NSArray;->array:[Lcom/dd/plist/NSObject;

    aget-object p1, v0, p1

    return-object p1
.end method

.method public varargs objectsAtIndexes([I)[Lcom/dd/plist/NSObject;
    .locals 4

    .line 194
    array-length v0, p1

    new-array v0, v0, [Lcom/dd/plist/NSObject;

    .line 195
    invoke-static {p1}, Ljava/util/Arrays;->sort([I)V

    const/4 v1, 0x0

    .line 196
    :goto_0
    array-length v2, p1

    if-ge v1, v2, :cond_0

    .line 197
    iget-object v2, p0, Lcom/dd/plist/NSArray;->array:[Lcom/dd/plist/NSObject;

    aget v3, p1, v1

    aget-object v2, v2, v3

    aput-object v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public remove(I)V
    .locals 4

    .line 74
    iget-object v0, p0, Lcom/dd/plist/NSArray;->array:[Lcom/dd/plist/NSObject;

    array-length v1, v0

    if-ge p1, v1, :cond_0

    if-ltz p1, :cond_0

    .line 76
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    new-array v1, v1, [Lcom/dd/plist/NSObject;

    const/4 v2, 0x0

    .line 77
    invoke-static {v0, v2, v1, v2, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 78
    iget-object v0, p0, Lcom/dd/plist/NSArray;->array:[Lcom/dd/plist/NSObject;

    add-int/lit8 v2, p1, 0x1

    array-length v3, v0

    sub-int/2addr v3, p1

    add-int/lit8 v3, v3, -0x1

    invoke-static {v0, v2, v1, p1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 79
    iput-object v1, p0, Lcom/dd/plist/NSArray;->array:[Lcom/dd/plist/NSObject;

    return-void

    .line 75
    :cond_0
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invalid index:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ";the array length is "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lcom/dd/plist/NSArray;->array:[Lcom/dd/plist/NSObject;

    array-length p1, p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setValue(ILjava/lang/Object;)V
    .locals 1

    .line 91
    iget-object v0, p0, Lcom/dd/plist/NSArray;->array:[Lcom/dd/plist/NSObject;

    invoke-static {p2}, Lcom/dd/plist/NSObject;->wrap(Ljava/lang/Object;)Lcom/dd/plist/NSObject;

    move-result-object p2

    aput-object p2, v0, p1

    return-void
.end method

.method protected toASCII(Ljava/lang/StringBuilder;I)V
    .locals 5

    .line 285
    invoke-virtual {p0, p1, p2}, Lcom/dd/plist/NSArray;->indent(Ljava/lang/StringBuilder;I)V

    const/16 v0, 0x28

    .line 286
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 287
    sget-object v0, Lcom/dd/plist/NSArray;->NEWLINE:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x0

    move v2, v0

    move v0, v1

    .line 288
    :goto_0
    iget-object v3, p0, Lcom/dd/plist/NSArray;->array:[Lcom/dd/plist/NSObject;

    array-length v4, v3

    if-ge v0, v4, :cond_5

    .line 289
    aget-object v3, v3, v0

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    .line 290
    const-class v4, Lcom/dd/plist/NSDictionary;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    const-class v4, Lcom/dd/plist/NSArray;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    const-class v4, Lcom/dd/plist/NSData;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 291
    :cond_0
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-eq v2, v3, :cond_1

    .line 292
    sget-object v2, Lcom/dd/plist/NSArray;->NEWLINE:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 293
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    .line 294
    iget-object v3, p0, Lcom/dd/plist/NSArray;->array:[Lcom/dd/plist/NSObject;

    aget-object v3, v3, v0

    add-int/lit8 v4, p2, 0x1

    invoke-virtual {v3, p1, v4}, Lcom/dd/plist/NSObject;->toASCII(Ljava/lang/StringBuilder;I)V

    goto :goto_1

    :cond_1
    if-eqz v0, :cond_2

    const-string v3, " "

    .line 297
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 298
    :cond_2
    iget-object v3, p0, Lcom/dd/plist/NSArray;->array:[Lcom/dd/plist/NSObject;

    aget-object v3, v3, v0

    invoke-virtual {v3, p1, v1}, Lcom/dd/plist/NSObject;->toASCII(Ljava/lang/StringBuilder;I)V

    .line 301
    :goto_1
    iget-object v3, p0, Lcom/dd/plist/NSArray;->array:[Lcom/dd/plist/NSObject;

    array-length v3, v3

    add-int/lit8 v3, v3, -0x1

    if-eq v0, v3, :cond_3

    const/16 v3, 0x2c

    .line 302
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 304
    :cond_3
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    sub-int/2addr v3, v2

    const/16 v4, 0x50

    if-le v3, v4, :cond_4

    .line 305
    sget-object v2, Lcom/dd/plist/NSArray;->NEWLINE:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 306
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_5
    const/16 p2, 0x29

    .line 309
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    return-void
.end method

.method protected toASCIIGnuStep(Ljava/lang/StringBuilder;I)V
    .locals 5

    .line 314
    invoke-virtual {p0, p1, p2}, Lcom/dd/plist/NSArray;->indent(Ljava/lang/StringBuilder;I)V

    const/16 v0, 0x28

    .line 315
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 316
    sget-object v0, Lcom/dd/plist/NSArray;->NEWLINE:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x0

    move v2, v0

    move v0, v1

    .line 317
    :goto_0
    iget-object v3, p0, Lcom/dd/plist/NSArray;->array:[Lcom/dd/plist/NSObject;

    array-length v4, v3

    if-ge v0, v4, :cond_5

    .line 318
    aget-object v3, v3, v0

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    .line 319
    const-class v4, Lcom/dd/plist/NSDictionary;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    const-class v4, Lcom/dd/plist/NSArray;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    const-class v4, Lcom/dd/plist/NSData;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 320
    :cond_0
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-eq v2, v3, :cond_1

    .line 321
    sget-object v2, Lcom/dd/plist/NSArray;->NEWLINE:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 322
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    .line 323
    iget-object v3, p0, Lcom/dd/plist/NSArray;->array:[Lcom/dd/plist/NSObject;

    aget-object v3, v3, v0

    add-int/lit8 v4, p2, 0x1

    invoke-virtual {v3, p1, v4}, Lcom/dd/plist/NSObject;->toASCIIGnuStep(Ljava/lang/StringBuilder;I)V

    goto :goto_1

    :cond_1
    if-eqz v0, :cond_2

    const-string v3, " "

    .line 326
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 327
    :cond_2
    iget-object v3, p0, Lcom/dd/plist/NSArray;->array:[Lcom/dd/plist/NSObject;

    aget-object v3, v3, v0

    invoke-virtual {v3, p1, v1}, Lcom/dd/plist/NSObject;->toASCIIGnuStep(Ljava/lang/StringBuilder;I)V

    .line 330
    :goto_1
    iget-object v3, p0, Lcom/dd/plist/NSArray;->array:[Lcom/dd/plist/NSObject;

    array-length v3, v3

    add-int/lit8 v3, v3, -0x1

    if-eq v0, v3, :cond_3

    const/16 v3, 0x2c

    .line 331
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 333
    :cond_3
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    sub-int/2addr v3, v2

    const/16 v4, 0x50

    if-le v3, v4, :cond_4

    .line 334
    sget-object v2, Lcom/dd/plist/NSArray;->NEWLINE:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 335
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_5
    const/16 p2, 0x29

    .line 338
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    return-void
.end method

.method public toASCIIPropertyList()Ljava/lang/String;
    .locals 2

    .line 261
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    .line 262
    invoke-virtual {p0, v0, v1}, Lcom/dd/plist/NSArray;->toASCII(Ljava/lang/StringBuilder;I)V

    .line 263
    sget-object v1, Lcom/dd/plist/NSArray;->NEWLINE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 264
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method toBinary(Lcom/dd/plist/BinaryPropertyListWriter;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 246
    iget-object v0, p0, Lcom/dd/plist/NSArray;->array:[Lcom/dd/plist/NSObject;

    array-length v0, v0

    const/16 v1, 0xa

    invoke-virtual {p1, v1, v0}, Lcom/dd/plist/BinaryPropertyListWriter;->writeIntHeader(II)V

    .line 247
    iget-object v0, p0, Lcom/dd/plist/NSArray;->array:[Lcom/dd/plist/NSObject;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 248
    invoke-virtual {p1, v3}, Lcom/dd/plist/BinaryPropertyListWriter;->getID(Lcom/dd/plist/NSObject;)I

    move-result v3

    invoke-virtual {p1, v3}, Lcom/dd/plist/BinaryPropertyListWriter;->writeID(I)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public toGnuStepASCIIPropertyList()Ljava/lang/String;
    .locals 2

    .line 277
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    .line 278
    invoke-virtual {p0, v0, v1}, Lcom/dd/plist/NSArray;->toASCIIGnuStep(Ljava/lang/StringBuilder;I)V

    .line 279
    sget-object v1, Lcom/dd/plist/NSArray;->NEWLINE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 280
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method toXML(Ljava/lang/StringBuilder;I)V
    .locals 5

    .line 225
    invoke-virtual {p0, p1, p2}, Lcom/dd/plist/NSArray;->indent(Ljava/lang/StringBuilder;I)V

    const-string v0, "<array>"

    .line 226
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 227
    sget-object v0, Lcom/dd/plist/NSObject;->NEWLINE:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 228
    iget-object v0, p0, Lcom/dd/plist/NSArray;->array:[Lcom/dd/plist/NSObject;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    add-int/lit8 v4, p2, 0x1

    .line 229
    invoke-virtual {v3, p1, v4}, Lcom/dd/plist/NSObject;->toXML(Ljava/lang/StringBuilder;I)V

    .line 230
    sget-object v3, Lcom/dd/plist/NSObject;->NEWLINE:Ljava/lang/String;

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 232
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/dd/plist/NSArray;->indent(Ljava/lang/StringBuilder;I)V

    const-string p2, "</array>"

    .line 233
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method
