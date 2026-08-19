.class public final Lorg/apache/log/Priority;
.super Ljava/lang/Object;
.source "Priority.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static final DEBUG:Lorg/apache/log/Priority;

.field public static final ERROR:Lorg/apache/log/Priority;

.field public static final FATAL_ERROR:Lorg/apache/log/Priority;

.field public static final INFO:Lorg/apache/log/Priority;

.field public static final WARN:Lorg/apache/log/Priority;


# instance fields
.field private final m_name:Ljava/lang/String;

.field private final m_priority:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 24
    new-instance v0, Lorg/apache/log/Priority;

    const-string v1, "DEBUG"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lorg/apache/log/Priority;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/apache/log/Priority;->DEBUG:Lorg/apache/log/Priority;

    .line 29
    new-instance v0, Lorg/apache/log/Priority;

    const-string v1, "INFO"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lorg/apache/log/Priority;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/apache/log/Priority;->INFO:Lorg/apache/log/Priority;

    .line 35
    new-instance v0, Lorg/apache/log/Priority;

    const-string v1, "WARN"

    const/16 v2, 0xf

    invoke-direct {v0, v1, v2}, Lorg/apache/log/Priority;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/apache/log/Priority;->WARN:Lorg/apache/log/Priority;

    .line 40
    new-instance v0, Lorg/apache/log/Priority;

    const-string v1, "ERROR"

    const/16 v2, 0x14

    invoke-direct {v0, v1, v2}, Lorg/apache/log/Priority;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/apache/log/Priority;->ERROR:Lorg/apache/log/Priority;

    .line 46
    new-instance v0, Lorg/apache/log/Priority;

    const-string v1, "FATAL_ERROR"

    const/16 v2, 0x19

    invoke-direct {v0, v1, v2}, Lorg/apache/log/Priority;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/apache/log/Priority;->FATAL_ERROR:Lorg/apache/log/Priority;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    iput-object p1, p0, Lorg/apache/log/Priority;->m_name:Ljava/lang/String;

    .line 76
    iput p2, p0, Lorg/apache/log/Priority;->m_priority:I

    return-void
.end method

.method public static getPriorityForName(Ljava/lang/String;)Lorg/apache/log/Priority;
    .locals 1

    .line 59
    sget-object v0, Lorg/apache/log/Priority;->DEBUG:Lorg/apache/log/Priority;

    invoke-virtual {v0}, Lorg/apache/log/Priority;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object p0, Lorg/apache/log/Priority;->DEBUG:Lorg/apache/log/Priority;

    return-object p0

    .line 60
    :cond_0
    sget-object v0, Lorg/apache/log/Priority;->INFO:Lorg/apache/log/Priority;

    invoke-virtual {v0}, Lorg/apache/log/Priority;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object p0, Lorg/apache/log/Priority;->INFO:Lorg/apache/log/Priority;

    return-object p0

    .line 61
    :cond_1
    sget-object v0, Lorg/apache/log/Priority;->WARN:Lorg/apache/log/Priority;

    invoke-virtual {v0}, Lorg/apache/log/Priority;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    sget-object p0, Lorg/apache/log/Priority;->WARN:Lorg/apache/log/Priority;

    return-object p0

    .line 62
    :cond_2
    sget-object v0, Lorg/apache/log/Priority;->ERROR:Lorg/apache/log/Priority;

    invoke-virtual {v0}, Lorg/apache/log/Priority;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    sget-object p0, Lorg/apache/log/Priority;->ERROR:Lorg/apache/log/Priority;

    return-object p0

    .line 63
    :cond_3
    sget-object v0, Lorg/apache/log/Priority;->FATAL_ERROR:Lorg/apache/log/Priority;

    invoke-virtual {v0}, Lorg/apache/log/Priority;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_4

    sget-object p0, Lorg/apache/log/Priority;->FATAL_ERROR:Lorg/apache/log/Priority;

    return-object p0

    .line 64
    :cond_4
    sget-object p0, Lorg/apache/log/Priority;->DEBUG:Lorg/apache/log/Priority;

    return-object p0
.end method

.method private readResolve()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/ObjectStreamException;
        }
    .end annotation

    .line 148
    iget-object v0, p0, Lorg/apache/log/Priority;->m_name:Ljava/lang/String;

    invoke-static {v0}, Lorg/apache/log/Priority;->getPriorityForName(Ljava/lang/String;)Lorg/apache/log/Priority;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 1

    .line 106
    iget-object v0, p0, Lorg/apache/log/Priority;->m_name:Ljava/lang/String;

    return-object v0
.end method

.method public getValue()I
    .locals 1

    .line 96
    iget v0, p0, Lorg/apache/log/Priority;->m_priority:I

    return v0
.end method

.method public isGreater(Lorg/apache/log/Priority;)Z
    .locals 1

    .line 116
    iget v0, p0, Lorg/apache/log/Priority;->m_priority:I

    invoke-virtual {p1}, Lorg/apache/log/Priority;->getValue()I

    move-result p1

    if-le v0, p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public isLower(Lorg/apache/log/Priority;)Z
    .locals 1

    .line 126
    iget v0, p0, Lorg/apache/log/Priority;->m_priority:I

    invoke-virtual {p1}, Lorg/apache/log/Priority;->getValue()I

    move-result p1

    if-ge v0, p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public isLowerOrEqual(Lorg/apache/log/Priority;)Z
    .locals 1

    .line 136
    iget v0, p0, Lorg/apache/log/Priority;->m_priority:I

    invoke-virtual {p1}, Lorg/apache/log/Priority;->getValue()I

    move-result p1

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

    .line 86
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "Priority["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Lorg/apache/log/Priority;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Lorg/apache/log/Priority;->getValue()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
