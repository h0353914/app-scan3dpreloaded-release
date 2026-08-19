.class public Lorg/apache/log4j/Level;
.super Lorg/apache/log4j/Priority;
.source "Level.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static final ALL:Lorg/apache/log4j/Level;

.field public static final DEBUG:Lorg/apache/log4j/Level;

.field public static final ERROR:Lorg/apache/log4j/Level;

.field public static final FATAL:Lorg/apache/log4j/Level;

.field public static final INFO:Lorg/apache/log4j/Level;

.field public static final OFF:Lorg/apache/log4j/Level;

.field public static final TRACE:Lorg/apache/log4j/Level;

.field public static final TRACE_INT:I = 0x1388

.field public static final WARN:Lorg/apache/log4j/Level;

.field static synthetic class$org$apache$log4j$Level:Ljava/lang/Class; = null

.field static final serialVersionUID:J = 0x3073071f1f02c436L


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 50
    new-instance v0, Lorg/apache/log4j/Level;

    const-string v1, "OFF"

    const/4 v2, 0x0

    const v3, 0x7fffffff

    invoke-direct {v0, v3, v1, v2}, Lorg/apache/log4j/Level;-><init>(ILjava/lang/String;I)V

    sput-object v0, Lorg/apache/log4j/Level;->OFF:Lorg/apache/log4j/Level;

    .line 56
    new-instance v0, Lorg/apache/log4j/Level;

    const-string v1, "FATAL"

    const v3, 0xc350

    invoke-direct {v0, v3, v1, v2}, Lorg/apache/log4j/Level;-><init>(ILjava/lang/String;I)V

    sput-object v0, Lorg/apache/log4j/Level;->FATAL:Lorg/apache/log4j/Level;

    .line 61
    new-instance v0, Lorg/apache/log4j/Level;

    const-string v1, "ERROR"

    const v2, 0x9c40

    const/4 v3, 0x3

    invoke-direct {v0, v2, v1, v3}, Lorg/apache/log4j/Level;-><init>(ILjava/lang/String;I)V

    sput-object v0, Lorg/apache/log4j/Level;->ERROR:Lorg/apache/log4j/Level;

    .line 66
    new-instance v0, Lorg/apache/log4j/Level;

    const-string v1, "WARN"

    const/16 v2, 0x7530

    const/4 v3, 0x4

    invoke-direct {v0, v2, v1, v3}, Lorg/apache/log4j/Level;-><init>(ILjava/lang/String;I)V

    sput-object v0, Lorg/apache/log4j/Level;->WARN:Lorg/apache/log4j/Level;

    .line 72
    new-instance v0, Lorg/apache/log4j/Level;

    const-string v1, "INFO"

    const/16 v2, 0x4e20

    const/4 v3, 0x6

    invoke-direct {v0, v2, v1, v3}, Lorg/apache/log4j/Level;-><init>(ILjava/lang/String;I)V

    sput-object v0, Lorg/apache/log4j/Level;->INFO:Lorg/apache/log4j/Level;

    .line 78
    new-instance v0, Lorg/apache/log4j/Level;

    const-string v1, "DEBUG"

    const/4 v2, 0x7

    const/16 v3, 0x2710

    invoke-direct {v0, v3, v1, v2}, Lorg/apache/log4j/Level;-><init>(ILjava/lang/String;I)V

    sput-object v0, Lorg/apache/log4j/Level;->DEBUG:Lorg/apache/log4j/Level;

    .line 85
    new-instance v0, Lorg/apache/log4j/Level;

    const-string v1, "TRACE"

    const/16 v3, 0x1388

    invoke-direct {v0, v3, v1, v2}, Lorg/apache/log4j/Level;-><init>(ILjava/lang/String;I)V

    sput-object v0, Lorg/apache/log4j/Level;->TRACE:Lorg/apache/log4j/Level;

    .line 91
    new-instance v0, Lorg/apache/log4j/Level;

    const-string v1, "ALL"

    const/high16 v3, -0x80000000

    invoke-direct {v0, v3, v1, v2}, Lorg/apache/log4j/Level;-><init>(ILjava/lang/String;I)V

    sput-object v0, Lorg/apache/log4j/Level;->ALL:Lorg/apache/log4j/Level;

    return-void
.end method

.method protected constructor <init>(ILjava/lang/String;I)V
    .locals 0

    .line 103
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/log4j/Priority;-><init>(ILjava/lang/String;I)V

    return-void
.end method

.method static synthetic class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 1

    .line 39
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    new-instance v0, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 179
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 180
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v0

    iput v0, p0, Lorg/apache/log4j/Priority;->level:I

    .line 181
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v0

    iput v0, p0, Lorg/apache/log4j/Priority;->syslogEquivalent:I

    .line 182
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readUTF()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/log4j/Priority;->levelStr:Ljava/lang/String;

    .line 183
    iget-object p1, p0, Lorg/apache/log4j/Priority;->levelStr:Ljava/lang/String;

    if-nez p1, :cond_0

    const-string p1, ""

    .line 184
    iput-object p1, p0, Lorg/apache/log4j/Priority;->levelStr:Ljava/lang/String;

    :cond_0
    return-void
.end method

.method private readResolve()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/ObjectStreamException;
        }
    .end annotation

    .line 210
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    sget-object v1, Lorg/apache/log4j/Level;->class$org$apache$log4j$Level:Ljava/lang/Class;

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    const-string v1, "org.apache.log4j.Level"

    invoke-static {v1}, Lorg/apache/log4j/Level;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/log4j/Level;->class$org$apache$log4j$Level:Ljava/lang/Class;

    :goto_0
    if-ne v0, v1, :cond_1

    .line 211
    iget v0, p0, Lorg/apache/log4j/Priority;->level:I

    invoke-static {v0}, Lorg/apache/log4j/Level;->toLevel(I)Lorg/apache/log4j/Level;

    move-result-object v0

    return-object v0

    :cond_1
    return-object p0
.end method

.method public static toLevel(I)Lorg/apache/log4j/Level;
    .locals 1

    .line 125
    sget-object v0, Lorg/apache/log4j/Level;->DEBUG:Lorg/apache/log4j/Level;

    invoke-static {p0, v0}, Lorg/apache/log4j/Level;->toLevel(ILorg/apache/log4j/Level;)Lorg/apache/log4j/Level;

    move-result-object p0

    return-object p0
.end method

.method public static toLevel(ILorg/apache/log4j/Level;)Lorg/apache/log4j/Level;
    .locals 1

    const/high16 v0, -0x80000000

    if-eq p0, v0, :cond_7

    const/16 v0, 0x1388

    if-eq p0, v0, :cond_6

    const/16 v0, 0x2710

    if-eq p0, v0, :cond_5

    const/16 v0, 0x4e20

    if-eq p0, v0, :cond_4

    const/16 v0, 0x7530

    if-eq p0, v0, :cond_3

    const v0, 0x9c40

    if-eq p0, v0, :cond_2

    const v0, 0xc350

    if-eq p0, v0, :cond_1

    const v0, 0x7fffffff

    if-eq p0, v0, :cond_0

    return-object p1

    .line 142
    :cond_0
    sget-object p0, Lorg/apache/log4j/Level;->OFF:Lorg/apache/log4j/Level;

    return-object p0

    .line 141
    :cond_1
    sget-object p0, Lorg/apache/log4j/Level;->FATAL:Lorg/apache/log4j/Level;

    return-object p0

    .line 140
    :cond_2
    sget-object p0, Lorg/apache/log4j/Level;->ERROR:Lorg/apache/log4j/Level;

    return-object p0

    .line 139
    :cond_3
    sget-object p0, Lorg/apache/log4j/Level;->WARN:Lorg/apache/log4j/Level;

    return-object p0

    .line 138
    :cond_4
    sget-object p0, Lorg/apache/log4j/Level;->INFO:Lorg/apache/log4j/Level;

    return-object p0

    .line 137
    :cond_5
    sget-object p0, Lorg/apache/log4j/Level;->DEBUG:Lorg/apache/log4j/Level;

    return-object p0

    .line 143
    :cond_6
    sget-object p0, Lorg/apache/log4j/Level;->TRACE:Lorg/apache/log4j/Level;

    return-object p0

    .line 136
    :cond_7
    sget-object p0, Lorg/apache/log4j/Level;->ALL:Lorg/apache/log4j/Level;

    return-object p0
.end method

.method public static toLevel(Ljava/lang/String;)Lorg/apache/log4j/Level;
    .locals 1

    .line 114
    sget-object v0, Lorg/apache/log4j/Level;->DEBUG:Lorg/apache/log4j/Level;

    invoke-static {p0, v0}, Lorg/apache/log4j/Level;->toLevel(Ljava/lang/String;Lorg/apache/log4j/Level;)Lorg/apache/log4j/Level;

    move-result-object p0

    return-object p0
.end method

.method public static toLevel(Ljava/lang/String;Lorg/apache/log4j/Level;)Lorg/apache/log4j/Level;
    .locals 1

    if-nez p0, :cond_0

    return-object p1

    .line 159
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object p0

    const-string v0, "ALL"

    .line 161
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object p0, Lorg/apache/log4j/Level;->ALL:Lorg/apache/log4j/Level;

    return-object p0

    :cond_1
    const-string v0, "DEBUG"

    .line 162
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    sget-object p0, Lorg/apache/log4j/Level;->DEBUG:Lorg/apache/log4j/Level;

    return-object p0

    :cond_2
    const-string v0, "INFO"

    .line 163
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    sget-object p0, Lorg/apache/log4j/Level;->INFO:Lorg/apache/log4j/Level;

    return-object p0

    :cond_3
    const-string v0, "WARN"

    .line 164
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    sget-object p0, Lorg/apache/log4j/Level;->WARN:Lorg/apache/log4j/Level;

    return-object p0

    :cond_4
    const-string v0, "ERROR"

    .line 165
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    sget-object p0, Lorg/apache/log4j/Level;->ERROR:Lorg/apache/log4j/Level;

    return-object p0

    :cond_5
    const-string v0, "FATAL"

    .line 166
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    sget-object p0, Lorg/apache/log4j/Level;->FATAL:Lorg/apache/log4j/Level;

    return-object p0

    :cond_6
    const-string v0, "OFF"

    .line 167
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    sget-object p0, Lorg/apache/log4j/Level;->OFF:Lorg/apache/log4j/Level;

    return-object p0

    :cond_7
    const-string v0, "TRACE"

    .line 168
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_8

    sget-object p0, Lorg/apache/log4j/Level;->TRACE:Lorg/apache/log4j/Level;

    return-object p0

    :cond_8
    return-object p1
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 194
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->defaultWriteObject()V

    .line 195
    iget v0, p0, Lorg/apache/log4j/Priority;->level:I

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 196
    iget v0, p0, Lorg/apache/log4j/Priority;->syslogEquivalent:I

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 197
    iget-object v0, p0, Lorg/apache/log4j/Priority;->levelStr:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeUTF(Ljava/lang/String;)V

    return-void
.end method
