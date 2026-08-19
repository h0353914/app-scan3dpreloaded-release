.class public abstract Lorg/apache/avalon/framework/ValuedEnum;
.super Lorg/apache/avalon/framework/Enum;
.source "ValuedEnum.java"


# instance fields
.field private final m_value:I


# direct methods
.method protected constructor <init>(Ljava/lang/String;I)V
    .locals 1

    const/4 v0, 0x0

    .line 92
    invoke-direct {p0, p1, p2, v0}, Lorg/apache/avalon/framework/ValuedEnum;-><init>(Ljava/lang/String;ILjava/util/Map;)V

    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;ILjava/util/Map;)V
    .locals 0

    .line 110
    invoke-direct {p0, p1, p3}, Lorg/apache/avalon/framework/Enum;-><init>(Ljava/lang/String;Ljava/util/Map;)V

    .line 111
    iput p2, p0, Lorg/apache/avalon/framework/ValuedEnum;->m_value:I

    return-void
.end method


# virtual methods
.method public final getValue()I
    .locals 1

    .line 121
    iget v0, p0, Lorg/apache/avalon/framework/ValuedEnum;->m_value:I

    return v0
.end method

.method public final isEqualTo(Lorg/apache/avalon/framework/ValuedEnum;)Z
    .locals 1

    .line 132
    iget v0, p0, Lorg/apache/avalon/framework/ValuedEnum;->m_value:I

    iget p1, p1, Lorg/apache/avalon/framework/ValuedEnum;->m_value:I

    if-ne v0, p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public final isGreaterThan(Lorg/apache/avalon/framework/ValuedEnum;)Z
    .locals 1

    .line 143
    iget v0, p0, Lorg/apache/avalon/framework/ValuedEnum;->m_value:I

    iget p1, p1, Lorg/apache/avalon/framework/ValuedEnum;->m_value:I

    if-le v0, p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public final isGreaterThanOrEqual(Lorg/apache/avalon/framework/ValuedEnum;)Z
    .locals 1

    .line 154
    iget v0, p0, Lorg/apache/avalon/framework/ValuedEnum;->m_value:I

    iget p1, p1, Lorg/apache/avalon/framework/ValuedEnum;->m_value:I

    if-lt v0, p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public final isLessThan(Lorg/apache/avalon/framework/ValuedEnum;)Z
    .locals 1

    .line 165
    iget v0, p0, Lorg/apache/avalon/framework/ValuedEnum;->m_value:I

    iget p1, p1, Lorg/apache/avalon/framework/ValuedEnum;->m_value:I

    if-ge v0, p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public final isLessThanOrEqual(Lorg/apache/avalon/framework/ValuedEnum;)Z
    .locals 1

    .line 176
    iget v0, p0, Lorg/apache/avalon/framework/ValuedEnum;->m_value:I

    iget p1, p1, Lorg/apache/avalon/framework/ValuedEnum;->m_value:I

    if-gt v0, p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 187
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Lorg/apache/avalon/framework/ValuedEnum;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget v1, p0, Lorg/apache/avalon/framework/ValuedEnum;->m_value:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
