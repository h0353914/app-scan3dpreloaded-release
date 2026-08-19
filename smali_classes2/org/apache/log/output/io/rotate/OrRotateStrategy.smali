.class public Lorg/apache/log/output/io/rotate/OrRotateStrategy;
.super Ljava/lang/Object;
.source "OrRotateStrategy.java"

# interfaces
.implements Lorg/apache/log/output/io/rotate/RotateStrategy;


# instance fields
.field private m_strategies:[Lorg/apache/log/output/io/rotate/RotateStrategy;

.field private m_usedRotation:I


# direct methods
.method public constructor <init>([Lorg/apache/log/output/io/rotate/RotateStrategy;)V
    .locals 1

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 29
    iput v0, p0, Lorg/apache/log/output/io/rotate/OrRotateStrategy;->m_usedRotation:I

    .line 36
    iput-object p1, p0, Lorg/apache/log/output/io/rotate/OrRotateStrategy;->m_strategies:[Lorg/apache/log/output/io/rotate/RotateStrategy;

    return-void
.end method


# virtual methods
.method public isRotationNeeded(Ljava/lang/String;Ljava/io/File;)Z
    .locals 5

    const/4 v0, -0x1

    .line 62
    iput v0, p0, Lorg/apache/log/output/io/rotate/OrRotateStrategy;->m_usedRotation:I

    .line 64
    iget-object v0, p0, Lorg/apache/log/output/io/rotate/OrRotateStrategy;->m_strategies:[Lorg/apache/log/output/io/rotate/RotateStrategy;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 66
    array-length v0, v0

    move v2, v1

    :goto_0
    if-lt v2, v0, :cond_0

    goto :goto_1

    .line 69
    :cond_0
    iget-object v3, p0, Lorg/apache/log/output/io/rotate/OrRotateStrategy;->m_strategies:[Lorg/apache/log/output/io/rotate/RotateStrategy;

    aget-object v3, v3, v2

    invoke-interface {v3, p1, p2}, Lorg/apache/log/output/io/rotate/RotateStrategy;->isRotationNeeded(Ljava/lang/String;Ljava/io/File;)Z

    move-result v3

    const/4 v4, 0x1

    if-ne v4, v3, :cond_1

    .line 71
    iput v2, p0, Lorg/apache/log/output/io/rotate/OrRotateStrategy;->m_usedRotation:I

    return v4

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    :goto_1
    return v1
.end method

.method public reset()V
    .locals 3

    .line 44
    iget v0, p0, Lorg/apache/log/output/io/rotate/OrRotateStrategy;->m_usedRotation:I

    const/4 v1, -0x1

    if-eq v1, v0, :cond_0

    .line 46
    iget-object v2, p0, Lorg/apache/log/output/io/rotate/OrRotateStrategy;->m_strategies:[Lorg/apache/log/output/io/rotate/RotateStrategy;

    aget-object v0, v2, v0

    invoke-interface {v0}, Lorg/apache/log/output/io/rotate/RotateStrategy;->reset()V

    .line 47
    iput v1, p0, Lorg/apache/log/output/io/rotate/OrRotateStrategy;->m_usedRotation:I

    :cond_0
    return-void
.end method
