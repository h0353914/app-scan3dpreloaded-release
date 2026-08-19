.class public Lorg/apache/avalon/framework/logger/AvalonFormatter;
.super Lorg/apache/log/format/ExtendedPatternFormatter;
.source "AvalonFormatter.java"


# static fields
.field public static final DEFAULT_PRINT_CASCADING:Z = true

.field public static final DEFAULT_STACK_DEPTH:I = 0x8

.field private static final TYPE_CLASS:I = 0x9

.field private static final TYPE_CLASS_SHORT_STR:Ljava/lang/String; = "short"

.field private static final TYPE_CLASS_STR:Ljava/lang/String; = "class"

.field static synthetic class$org$apache$avalon$framework$logger$Logger:Ljava/lang/Class;


# instance fields
.field private final m_printCascading:Z

.field private final m_stackDepth:I


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    const/16 v0, 0x8

    const/4 v1, 0x1

    .line 67
    invoke-direct {p0, p1, v0, v1}, Lorg/apache/avalon/framework/logger/AvalonFormatter;-><init>(Ljava/lang/String;IZ)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IZ)V
    .locals 0

    .line 82
    invoke-direct {p0, p1}, Lorg/apache/log/format/ExtendedPatternFormatter;-><init>(Ljava/lang/String;)V

    .line 83
    iput p2, p0, Lorg/apache/avalon/framework/logger/AvalonFormatter;->m_stackDepth:I

    .line 84
    iput-boolean p3, p0, Lorg/apache/avalon/framework/logger/AvalonFormatter;->m_printCascading:Z

    return-void
.end method

.method static synthetic class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 1

    .line 137
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

.method private getClass(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 137
    sget-object v0, Lorg/apache/avalon/framework/logger/AvalonFormatter;->class$org$apache$avalon$framework$logger$Logger:Ljava/lang/Class;

    if-nez v0, :cond_0

    const-string v0, "org.apache.avalon.framework.logger.Logger"

    invoke-static {v0}, Lorg/apache/avalon/framework/logger/AvalonFormatter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/avalon/framework/logger/AvalonFormatter;->class$org$apache$avalon$framework$logger$Logger:Ljava/lang/Class;

    :cond_0
    invoke-static {v0}, Lorg/apache/log/util/StackIntrospector;->getCallerClass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v0

    if-nez v0, :cond_1

    const-string p1, "Unknown-class"

    return-object p1

    .line 146
    :cond_1
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "short"

    .line 149
    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_2

    const/16 p1, 0x2e

    .line 151
    invoke-virtual {v0, p1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result p1

    if-ltz p1, :cond_2

    add-int/lit8 p1, p1, 0x1

    .line 155
    invoke-virtual {v0, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    :cond_2
    return-object v0
.end method


# virtual methods
.method protected formatPatternRun(Lorg/apache/log/LogEvent;Lorg/apache/log/format/PatternFormatter$PatternRun;)Ljava/lang/String;
    .locals 2

    .line 123
    iget v0, p2, Lorg/apache/log/format/PatternFormatter$PatternRun;->m_type:I

    const/16 v1, 0x9

    if-eq v0, v1, :cond_0

    .line 128
    invoke-super {p0, p1, p2}, Lorg/apache/log/format/ExtendedPatternFormatter;->formatPatternRun(Lorg/apache/log/LogEvent;Lorg/apache/log/format/PatternFormatter$PatternRun;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 126
    :cond_0
    iget-object p1, p2, Lorg/apache/log/format/PatternFormatter$PatternRun;->m_format:Ljava/lang/String;

    invoke-direct {p0, p1}, Lorg/apache/avalon/framework/logger/AvalonFormatter;->getClass(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected getStackTrace(Ljava/lang/Throwable;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    if-nez p1, :cond_0

    const-string p1, ""

    return-object p1

    .line 100
    :cond_0
    iget p2, p0, Lorg/apache/avalon/framework/logger/AvalonFormatter;->m_stackDepth:I

    iget-boolean v0, p0, Lorg/apache/avalon/framework/logger/AvalonFormatter;->m_printCascading:Z

    invoke-static {p1, p2, v0}, Lorg/apache/avalon/framework/ExceptionUtil;->printStackTrace(Ljava/lang/Throwable;IZ)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected getTypeIdFor(Ljava/lang/String;)I
    .locals 1

    const-string v0, "class"

    .line 111
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 p1, 0x9

    return p1

    .line 117
    :cond_0
    invoke-super {p0, p1}, Lorg/apache/log/format/ExtendedPatternFormatter;->getTypeIdFor(Ljava/lang/String;)I

    move-result p1

    return p1
.end method
