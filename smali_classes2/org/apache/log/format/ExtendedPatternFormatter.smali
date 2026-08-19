.class public Lorg/apache/log/format/ExtendedPatternFormatter;
.super Lorg/apache/log/format/PatternFormatter;
.source "ExtendedPatternFormatter.java"


# static fields
.field private static final TYPE_METHOD:I = 0x9

.field private static final TYPE_METHOD_STR:Ljava/lang/String; = "method"

.field private static final TYPE_THREAD:I = 0xa

.field private static final TYPE_THREAD_STR:Ljava/lang/String; = "thread"

.field static synthetic class$org$apache$log$Logger:Ljava/lang/Class;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 42
    invoke-direct {p0, p1}, Lorg/apache/log/format/PatternFormatter;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 1

    .line 31
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    new-instance v0, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {p0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private getMethod(Lorg/apache/log/LogEvent;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 86
    invoke-virtual {p1}, Lorg/apache/log/LogEvent;->getContextMap()Lorg/apache/log/ContextMap;

    move-result-object p1

    if-eqz p1, :cond_0

    const-string p2, "method"

    .line 89
    invoke-virtual {p1, p2}, Lorg/apache/log/ContextMap;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 92
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 96
    :cond_0
    sget-object p1, Lorg/apache/log/format/ExtendedPatternFormatter;->class$org$apache$log$Logger:Ljava/lang/Class;

    if-nez p1, :cond_1

    const-string p1, "org.apache.log.Logger"

    invoke-static {p1}, Lorg/apache/log/format/ExtendedPatternFormatter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    sput-object p1, Lorg/apache/log/format/ExtendedPatternFormatter;->class$org$apache$log$Logger:Ljava/lang/Class;

    :cond_1
    invoke-static {p1}, Lorg/apache/log/util/StackIntrospector;->getCallerMethod(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_2

    const-string p1, "UnknownMethod"

    return-object p1

    :cond_2
    return-object p1
.end method

.method private getThread(Lorg/apache/log/LogEvent;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 113
    invoke-virtual {p1}, Lorg/apache/log/LogEvent;->getContextMap()Lorg/apache/log/ContextMap;

    move-result-object p1

    if-eqz p1, :cond_0

    const-string p2, "thread"

    .line 116
    invoke-virtual {p1, p2}, Lorg/apache/log/ContextMap;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 119
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 123
    :cond_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method protected formatPatternRun(Lorg/apache/log/LogEvent;Lorg/apache/log/format/PatternFormatter$PatternRun;)Ljava/lang/String;
    .locals 1

    .line 69
    iget v0, p2, Lorg/apache/log/format/PatternFormatter$PatternRun;->m_type:I

    packed-switch v0, :pswitch_data_0

    .line 73
    invoke-super {p0, p1, p2}, Lorg/apache/log/format/PatternFormatter;->formatPatternRun(Lorg/apache/log/LogEvent;Lorg/apache/log/format/PatternFormatter$PatternRun;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 72
    :pswitch_0
    iget-object p2, p2, Lorg/apache/log/format/PatternFormatter$PatternRun;->m_format:Ljava/lang/String;

    invoke-direct {p0, p1, p2}, Lorg/apache/log/format/ExtendedPatternFormatter;->getThread(Lorg/apache/log/LogEvent;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 71
    :pswitch_1
    iget-object p2, p2, Lorg/apache/log/format/PatternFormatter$PatternRun;->m_format:Ljava/lang/String;

    invoke-direct {p0, p1, p2}, Lorg/apache/log/format/ExtendedPatternFormatter;->getMethod(Lorg/apache/log/LogEvent;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :pswitch_data_0
    .packed-switch 0x9
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected getTypeIdFor(Ljava/lang/String;)I
    .locals 1

    const-string v0, "method"

    .line 53
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 p1, 0x9

    return p1

    :cond_0
    const-string v0, "thread"

    .line 54
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/16 p1, 0xa

    return p1

    .line 57
    :cond_1
    invoke-super {p0, p1}, Lorg/apache/log/format/PatternFormatter;->getTypeIdFor(Ljava/lang/String;)I

    move-result p1

    return p1
.end method
