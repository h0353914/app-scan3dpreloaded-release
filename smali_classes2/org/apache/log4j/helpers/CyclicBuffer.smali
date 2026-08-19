.class public Lorg/apache/log4j/helpers/CyclicBuffer;
.super Ljava/lang/Object;
.source "CyclicBuffer.java"


# instance fields
.field ea:[Lorg/apache/log4j/spi/LoggingEvent;

.field first:I

.field last:I

.field maxSize:I

.field numElems:I


# direct methods
.method public constructor <init>(I)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    if-lt p1, v0, :cond_0

    .line 53
    iput p1, p0, Lorg/apache/log4j/helpers/CyclicBuffer;->maxSize:I

    .line 54
    new-array p1, p1, [Lorg/apache/log4j/spi/LoggingEvent;

    iput-object p1, p0, Lorg/apache/log4j/helpers/CyclicBuffer;->ea:[Lorg/apache/log4j/spi/LoggingEvent;

    const/4 p1, 0x0

    .line 55
    iput p1, p0, Lorg/apache/log4j/helpers/CyclicBuffer;->first:I

    .line 56
    iput p1, p0, Lorg/apache/log4j/helpers/CyclicBuffer;->last:I

    .line 57
    iput p1, p0, Lorg/apache/log4j/helpers/CyclicBuffer;->numElems:I

    return-void

    .line 50
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuffer;

    const-string v2, "The maxSize argument ("

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    const-string p1, ") is not a positive integer."

    .line 51
    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 50
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public add(Lorg/apache/log4j/spi/LoggingEvent;)V
    .locals 2

    .line 66
    iget-object v0, p0, Lorg/apache/log4j/helpers/CyclicBuffer;->ea:[Lorg/apache/log4j/spi/LoggingEvent;

    iget v1, p0, Lorg/apache/log4j/helpers/CyclicBuffer;->last:I

    aput-object p1, v0, v1

    add-int/lit8 v1, v1, 0x1

    .line 67
    iput v1, p0, Lorg/apache/log4j/helpers/CyclicBuffer;->last:I

    iget p1, p0, Lorg/apache/log4j/helpers/CyclicBuffer;->maxSize:I

    const/4 v0, 0x0

    if-ne v1, p1, :cond_0

    .line 68
    iput v0, p0, Lorg/apache/log4j/helpers/CyclicBuffer;->last:I

    .line 70
    :cond_0
    iget p1, p0, Lorg/apache/log4j/helpers/CyclicBuffer;->numElems:I

    iget v1, p0, Lorg/apache/log4j/helpers/CyclicBuffer;->maxSize:I

    if-ge p1, v1, :cond_1

    add-int/lit8 p1, p1, 0x1

    .line 71
    iput p1, p0, Lorg/apache/log4j/helpers/CyclicBuffer;->numElems:I

    goto :goto_0

    .line 72
    :cond_1
    iget p1, p0, Lorg/apache/log4j/helpers/CyclicBuffer;->first:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lorg/apache/log4j/helpers/CyclicBuffer;->first:I

    if-ne p1, v1, :cond_2

    .line 73
    iput v0, p0, Lorg/apache/log4j/helpers/CyclicBuffer;->first:I

    :cond_2
    :goto_0
    return-void
.end method

.method public get()Lorg/apache/log4j/spi/LoggingEvent;
    .locals 4

    .line 104
    iget v0, p0, Lorg/apache/log4j/helpers/CyclicBuffer;->numElems:I

    const/4 v1, 0x0

    if-lez v0, :cond_1

    add-int/lit8 v0, v0, -0x1

    .line 105
    iput v0, p0, Lorg/apache/log4j/helpers/CyclicBuffer;->numElems:I

    .line 106
    iget-object v0, p0, Lorg/apache/log4j/helpers/CyclicBuffer;->ea:[Lorg/apache/log4j/spi/LoggingEvent;

    iget v2, p0, Lorg/apache/log4j/helpers/CyclicBuffer;->first:I

    aget-object v3, v0, v2

    .line 107
    aput-object v1, v0, v2

    add-int/lit8 v2, v2, 0x1

    .line 108
    iput v2, p0, Lorg/apache/log4j/helpers/CyclicBuffer;->first:I

    iget v0, p0, Lorg/apache/log4j/helpers/CyclicBuffer;->maxSize:I

    if-ne v2, v0, :cond_0

    const/4 v0, 0x0

    .line 109
    iput v0, p0, Lorg/apache/log4j/helpers/CyclicBuffer;->first:I

    :cond_0
    move-object v1, v3

    :cond_1
    return-object v1
.end method

.method public get(I)Lorg/apache/log4j/spi/LoggingEvent;
    .locals 2

    if-ltz p1, :cond_1

    .line 86
    iget v0, p0, Lorg/apache/log4j/helpers/CyclicBuffer;->numElems:I

    if-lt p1, v0, :cond_0

    goto :goto_0

    .line 89
    :cond_0
    iget-object v0, p0, Lorg/apache/log4j/helpers/CyclicBuffer;->ea:[Lorg/apache/log4j/spi/LoggingEvent;

    iget v1, p0, Lorg/apache/log4j/helpers/CyclicBuffer;->first:I

    add-int/2addr v1, p1

    iget p1, p0, Lorg/apache/log4j/helpers/CyclicBuffer;->maxSize:I

    rem-int/2addr v1, p1

    aget-object p1, v0, v1

    return-object p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getMaxSize()I
    .locals 1

    .line 94
    iget v0, p0, Lorg/apache/log4j/helpers/CyclicBuffer;->maxSize:I

    return v0
.end method

.method public length()I
    .locals 1

    .line 121
    iget v0, p0, Lorg/apache/log4j/helpers/CyclicBuffer;->numElems:I

    return v0
.end method

.method public resize(I)V
    .locals 7

    if-ltz p1, :cond_5

    .line 135
    iget v0, p0, Lorg/apache/log4j/helpers/CyclicBuffer;->numElems:I

    if-ne p1, v0, :cond_0

    return-void

    .line 138
    :cond_0
    new-array v1, p1, [Lorg/apache/log4j/spi/LoggingEvent;

    if-ge p1, v0, :cond_1

    move v0, p1

    :cond_1
    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-lt v3, v0, :cond_3

    .line 148
    iput-object v1, p0, Lorg/apache/log4j/helpers/CyclicBuffer;->ea:[Lorg/apache/log4j/spi/LoggingEvent;

    .line 149
    iput v2, p0, Lorg/apache/log4j/helpers/CyclicBuffer;->first:I

    .line 150
    iput v0, p0, Lorg/apache/log4j/helpers/CyclicBuffer;->numElems:I

    .line 151
    iput p1, p0, Lorg/apache/log4j/helpers/CyclicBuffer;->maxSize:I

    if-ne v0, p1, :cond_2

    .line 153
    iput v2, p0, Lorg/apache/log4j/helpers/CyclicBuffer;->last:I

    goto :goto_1

    .line 155
    :cond_2
    iput v0, p0, Lorg/apache/log4j/helpers/CyclicBuffer;->last:I

    :goto_1
    return-void

    .line 143
    :cond_3
    iget-object v4, p0, Lorg/apache/log4j/helpers/CyclicBuffer;->ea:[Lorg/apache/log4j/spi/LoggingEvent;

    iget v5, p0, Lorg/apache/log4j/helpers/CyclicBuffer;->first:I

    aget-object v6, v4, v5

    aput-object v6, v1, v3

    const/4 v6, 0x0

    .line 144
    aput-object v6, v4, v5

    add-int/lit8 v5, v5, 0x1

    .line 145
    iput v5, p0, Lorg/apache/log4j/helpers/CyclicBuffer;->first:I

    iget v4, p0, Lorg/apache/log4j/helpers/CyclicBuffer;->numElems:I

    if-ne v5, v4, :cond_4

    .line 146
    iput v2, p0, Lorg/apache/log4j/helpers/CyclicBuffer;->first:I

    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 132
    :cond_5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuffer;

    const-string v2, "Negative array size ["

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    const-string p1, "] not allowed."

    .line 133
    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 132
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
