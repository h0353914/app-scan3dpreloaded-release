.class public Lorg/apache/log/output/io/rotate/RevolvingFileStrategy;
.super Ljava/lang/Object;
.source "RevolvingFileStrategy.java"

# interfaces
.implements Lorg/apache/log/output/io/rotate/FileStrategy;


# static fields
.field private static final PATTERN:Ljava/lang/String; = "\'.\'000000"


# instance fields
.field private m_baseFile:Ljava/io/File;

.field private m_decimalFormat:Ljava/text/DecimalFormat;

.field private m_maxRotations:I

.field private m_rotation:I


# direct methods
.method public constructor <init>(Ljava/io/File;I)V
    .locals 1

    const/4 v0, -0x1

    .line 64
    invoke-direct {p0, p1, v0, p2}, Lorg/apache/log/output/io/rotate/RevolvingFileStrategy;-><init>(Ljava/io/File;II)V

    return-void
.end method

.method public constructor <init>(Ljava/io/File;II)V
    .locals 2

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    new-instance v0, Ljava/text/DecimalFormat;

    const-string v1, "\'.\'000000"

    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/apache/log/output/io/rotate/RevolvingFileStrategy;->m_decimalFormat:Ljava/text/DecimalFormat;

    .line 44
    iput-object p1, p0, Lorg/apache/log/output/io/rotate/RevolvingFileStrategy;->m_baseFile:Ljava/io/File;

    .line 45
    iput p2, p0, Lorg/apache/log/output/io/rotate/RevolvingFileStrategy;->m_rotation:I

    .line 46
    iput p3, p0, Lorg/apache/log/output/io/rotate/RevolvingFileStrategy;->m_maxRotations:I

    const/4 p1, -0x1

    .line 53
    iget p2, p0, Lorg/apache/log/output/io/rotate/RevolvingFileStrategy;->m_maxRotations:I

    if-ne p1, p2, :cond_0

    const p1, 0x7fffffff

    .line 55
    iput p1, p0, Lorg/apache/log/output/io/rotate/RevolvingFileStrategy;->m_maxRotations:I

    .line 58
    :cond_0
    iget p1, p0, Lorg/apache/log/output/io/rotate/RevolvingFileStrategy;->m_rotation:I

    iget p2, p0, Lorg/apache/log/output/io/rotate/RevolvingFileStrategy;->m_maxRotations:I

    if-le p1, p2, :cond_1

    iput p2, p0, Lorg/apache/log/output/io/rotate/RevolvingFileStrategy;->m_rotation:I

    .line 59
    :cond_1
    iget p1, p0, Lorg/apache/log/output/io/rotate/RevolvingFileStrategy;->m_rotation:I

    if-gez p1, :cond_2

    const/4 p1, 0x0

    iput p1, p0, Lorg/apache/log/output/io/rotate/RevolvingFileStrategy;->m_rotation:I

    :cond_2
    return-void
.end method


# virtual methods
.method public nextFile()Ljava/io/File;
    .locals 6

    .line 74
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 75
    new-instance v1, Ljava/text/FieldPosition;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Ljava/text/FieldPosition;-><init>(I)V

    .line 76
    iget-object v3, p0, Lorg/apache/log/output/io/rotate/RevolvingFileStrategy;->m_baseFile:Ljava/io/File;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 78
    iget-object v3, p0, Lorg/apache/log/output/io/rotate/RevolvingFileStrategy;->m_decimalFormat:Ljava/text/DecimalFormat;

    iget v4, p0, Lorg/apache/log/output/io/rotate/RevolvingFileStrategy;->m_rotation:I

    int-to-long v4, v4

    invoke-virtual {v3, v4, v5, v0, v1}, Ljava/text/DecimalFormat;->format(JLjava/lang/StringBuffer;Ljava/text/FieldPosition;)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 79
    iget v1, p0, Lorg/apache/log/output/io/rotate/RevolvingFileStrategy;->m_rotation:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/apache/log/output/io/rotate/RevolvingFileStrategy;->m_rotation:I

    .line 81
    iget v1, p0, Lorg/apache/log/output/io/rotate/RevolvingFileStrategy;->m_rotation:I

    iget v3, p0, Lorg/apache/log/output/io/rotate/RevolvingFileStrategy;->m_maxRotations:I

    if-lt v1, v3, :cond_0

    iput v2, p0, Lorg/apache/log/output/io/rotate/RevolvingFileStrategy;->m_rotation:I

    .line 83
    :cond_0
    new-instance v1, Ljava/io/File;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    return-object v1
.end method
