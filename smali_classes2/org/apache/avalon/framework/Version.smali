.class public final Lorg/apache/avalon/framework/Version;
.super Ljava/lang/Object;
.source "Version.java"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private m_major:I

.field private m_micro:I

.field private m_minor:I


# direct methods
.method public constructor <init>(III)V
    .locals 0

    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 107
    iput p1, p0, Lorg/apache/avalon/framework/Version;->m_major:I

    .line 108
    iput p2, p0, Lorg/apache/avalon/framework/Version;->m_minor:I

    .line 109
    iput p3, p0, Lorg/apache/avalon/framework/Version;->m_micro:I

    return-void
.end method

.method public static getVersion(Ljava/lang/String;)Lorg/apache/avalon/framework/Version;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 68
    new-instance v0, Ljava/util/StringTokenizer;

    const-string v1, "."

    invoke-direct {v0, p0, v1}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->countTokens()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    move v3, v2

    .line 70
    :goto_0
    array-length v4, v1

    if-lt v3, v4, :cond_3

    .line 75
    array-length v0, v1

    if-eqz v0, :cond_2

    const/4 v0, 0x3

    array-length v3, v1

    if-lt v0, v3, :cond_2

    .line 80
    aget-object p0, v1, v2

    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0

    .line 83
    array-length v0, v1

    const/4 v3, 0x1

    if-ge v3, v0, :cond_0

    .line 85
    aget-object v0, v1, v3

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    goto :goto_1

    :cond_0
    move v0, v2

    .line 89
    :goto_1
    array-length v3, v1

    const/4 v4, 0x2

    if-ge v4, v3, :cond_1

    .line 91
    aget-object v1, v1, v4

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 94
    :cond_1
    new-instance v1, Lorg/apache/avalon/framework/Version;

    invoke-direct {v1, p0, v0, v2}, Lorg/apache/avalon/framework/Version;-><init>(III)V

    return-object v1

    .line 77
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Malformed version string "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 72
    :cond_3
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v1, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method


# virtual methods
.method public complies(Lorg/apache/avalon/framework/Version;)Z
    .locals 3

    .line 223
    iget v0, p0, Lorg/apache/avalon/framework/Version;->m_major:I

    iget v1, p1, Lorg/apache/avalon/framework/Version;->m_major:I

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    return v2

    .line 227
    :cond_0
    iget v0, p0, Lorg/apache/avalon/framework/Version;->m_minor:I

    iget v1, p1, Lorg/apache/avalon/framework/Version;->m_minor:I

    if-ge v0, v1, :cond_1

    return v2

    :cond_1
    if-ne v0, v1, :cond_2

    .line 232
    iget v0, p0, Lorg/apache/avalon/framework/Version;->m_micro:I

    iget p1, p1, Lorg/apache/avalon/framework/Version;->m_micro:I

    if-ge v0, p1, :cond_2

    return v2

    :cond_2
    const/4 p1, 0x1

    return p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    .line 182
    instance-of v0, p1, Lorg/apache/avalon/framework/Version;

    if-eqz v0, :cond_0

    .line 184
    check-cast p1, Lorg/apache/avalon/framework/Version;

    invoke-virtual {p0, p1}, Lorg/apache/avalon/framework/Version;->equals(Lorg/apache/avalon/framework/Version;)Z

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public equals(Lorg/apache/avalon/framework/Version;)Z
    .locals 3

    .line 154
    iget v0, p0, Lorg/apache/avalon/framework/Version;->m_major:I

    iget v1, p1, Lorg/apache/avalon/framework/Version;->m_major:I

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    return v2

    .line 158
    :cond_0
    iget v0, p0, Lorg/apache/avalon/framework/Version;->m_minor:I

    iget v1, p1, Lorg/apache/avalon/framework/Version;->m_minor:I

    if-eq v0, v1, :cond_1

    return v2

    .line 162
    :cond_1
    iget v0, p0, Lorg/apache/avalon/framework/Version;->m_micro:I

    iget p1, p1, Lorg/apache/avalon/framework/Version;->m_micro:I

    if-eq v0, p1, :cond_2

    return v2

    :cond_2
    const/4 p1, 0x1

    return p1
.end method

.method public getMajor()I
    .locals 1

    .line 119
    iget v0, p0, Lorg/apache/avalon/framework/Version;->m_major:I

    return v0
.end method

.method public getMicro()I
    .locals 1

    .line 139
    iget v0, p0, Lorg/apache/avalon/framework/Version;->m_micro:I

    return v0
.end method

.method public getMinor()I
    .locals 1

    .line 129
    iget v0, p0, Lorg/apache/avalon/framework/Version;->m_minor:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 252
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget v1, p0, Lorg/apache/avalon/framework/Version;->m_major:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget v1, p0, Lorg/apache/avalon/framework/Version;->m_minor:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget v1, p0, Lorg/apache/avalon/framework/Version;->m_micro:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
