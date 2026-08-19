.class public Lorg/apache/log/format/XMLFormatter;
.super Ljava/lang/Object;
.source "XMLFormatter.java"

# interfaces
.implements Lorg/apache/log/format/Formatter;
.implements Lorg/apache/log/Formatter;


# static fields
.field private static final EOL:Ljava/lang/String;


# instance fields
.field private m_printCategory:Z

.field private m_printContext:Z

.field private m_printException:Z

.field private m_printMessage:Z

.field private m_printNumericTime:Z

.field private m_printPriority:Z

.field private m_printRelativeTime:Z

.field private m_printTime:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-string v0, "line.separator"

    const-string v1, "\n"

    .line 24
    invoke-static {v0, v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/log/format/XMLFormatter;->EOL:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 28
    iput-boolean v0, p0, Lorg/apache/log/format/XMLFormatter;->m_printTime:Z

    const/4 v1, 0x0

    .line 29
    iput-boolean v1, p0, Lorg/apache/log/format/XMLFormatter;->m_printRelativeTime:Z

    .line 30
    iput-boolean v0, p0, Lorg/apache/log/format/XMLFormatter;->m_printPriority:Z

    .line 31
    iput-boolean v0, p0, Lorg/apache/log/format/XMLFormatter;->m_printCategory:Z

    .line 32
    iput-boolean v0, p0, Lorg/apache/log/format/XMLFormatter;->m_printContext:Z

    .line 33
    iput-boolean v0, p0, Lorg/apache/log/format/XMLFormatter;->m_printMessage:Z

    .line 34
    iput-boolean v0, p0, Lorg/apache/log/format/XMLFormatter;->m_printException:Z

    .line 36
    iput-boolean v0, p0, Lorg/apache/log/format/XMLFormatter;->m_printNumericTime:Z

    return-void
.end method


# virtual methods
.method public format(Lorg/apache/log/LogEvent;)Ljava/lang/String;
    .locals 4

    .line 116
    new-instance v0, Ljava/lang/StringBuffer;

    const/16 v1, 0x190

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(I)V

    const-string v1, "<log-entry>"

    .line 118
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 119
    sget-object v1, Lorg/apache/log/format/XMLFormatter;->EOL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 121
    iget-boolean v1, p0, Lorg/apache/log/format/XMLFormatter;->m_printTime:Z

    if-eqz v1, :cond_1

    const-string v1, "  <time>"

    .line 123
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 125
    iget-boolean v1, p0, Lorg/apache/log/format/XMLFormatter;->m_printNumericTime:Z

    if-eqz v1, :cond_0

    .line 127
    invoke-virtual {p1}, Lorg/apache/log/LogEvent;->getTime()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 131
    :cond_0
    new-instance v1, Ljava/util/Date;

    invoke-virtual {p1}, Lorg/apache/log/LogEvent;->getTime()J

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    :goto_0
    const-string v1, "</time>"

    .line 134
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 135
    sget-object v1, Lorg/apache/log/format/XMLFormatter;->EOL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 138
    :cond_1
    iget-boolean v1, p0, Lorg/apache/log/format/XMLFormatter;->m_printRelativeTime:Z

    if-eqz v1, :cond_2

    const-string v1, "  <relative-time>"

    .line 140
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 141
    invoke-virtual {p1}, Lorg/apache/log/LogEvent;->getRelativeTime()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    const-string v1, "</relative-time>"

    .line 142
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 143
    sget-object v1, Lorg/apache/log/format/XMLFormatter;->EOL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 146
    :cond_2
    iget-boolean v1, p0, Lorg/apache/log/format/XMLFormatter;->m_printPriority:Z

    if-eqz v1, :cond_3

    const-string v1, "  <priority>"

    .line 148
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 149
    invoke-virtual {p1}, Lorg/apache/log/LogEvent;->getPriority()Lorg/apache/log/Priority;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/log/Priority;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v1, "</priority>"

    .line 150
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 151
    sget-object v1, Lorg/apache/log/format/XMLFormatter;->EOL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 154
    :cond_3
    iget-boolean v1, p0, Lorg/apache/log/format/XMLFormatter;->m_printCategory:Z

    if-eqz v1, :cond_4

    const-string v1, "  <category>"

    .line 156
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 157
    invoke-virtual {p1}, Lorg/apache/log/LogEvent;->getCategory()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v1, "</category>"

    .line 158
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 159
    sget-object v1, Lorg/apache/log/format/XMLFormatter;->EOL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 162
    :cond_4
    iget-boolean v1, p0, Lorg/apache/log/format/XMLFormatter;->m_printContext:Z

    if-eqz v1, :cond_5

    invoke-virtual {p1}, Lorg/apache/log/LogEvent;->getContextStack()Lorg/apache/log/ContextStack;

    move-result-object v1

    if-eqz v1, :cond_5

    const-string v1, "  <context-stack>"

    .line 164
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 165
    invoke-virtual {p1}, Lorg/apache/log/LogEvent;->getContextStack()Lorg/apache/log/ContextStack;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    const-string v1, "</context-stack>"

    .line 166
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 167
    sget-object v1, Lorg/apache/log/format/XMLFormatter;->EOL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 170
    :cond_5
    iget-boolean v1, p0, Lorg/apache/log/format/XMLFormatter;->m_printMessage:Z

    if-eqz v1, :cond_6

    invoke-virtual {p1}, Lorg/apache/log/LogEvent;->getMessage()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_6

    const-string v1, "  <message><![CDATA["

    .line 172
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 173
    invoke-virtual {p1}, Lorg/apache/log/LogEvent;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v1, "]]></message>"

    .line 174
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 175
    sget-object v1, Lorg/apache/log/format/XMLFormatter;->EOL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 178
    :cond_6
    iget-boolean v1, p0, Lorg/apache/log/format/XMLFormatter;->m_printException:Z

    if-eqz v1, :cond_7

    invoke-virtual {p1}, Lorg/apache/log/LogEvent;->getThrowable()Ljava/lang/Throwable;

    move-result-object p1

    if-eqz p1, :cond_7

    const-string p1, "  <exception><![CDATA["

    .line 180
    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string p1, "]]></exception>"

    .line 182
    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 183
    sget-object p1, Lorg/apache/log/format/XMLFormatter;->EOL:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    :cond_7
    const-string p1, "</log-entry>"

    .line 186
    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 187
    sget-object p1, Lorg/apache/log/format/XMLFormatter;->EOL:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 189
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public setPrintCategory(Z)V
    .locals 0

    .line 75
    iput-boolean p1, p0, Lorg/apache/log/format/XMLFormatter;->m_printCategory:Z

    return-void
.end method

.method public setPrintContext(Z)V
    .locals 0

    .line 85
    iput-boolean p1, p0, Lorg/apache/log/format/XMLFormatter;->m_printContext:Z

    return-void
.end method

.method public setPrintException(Z)V
    .locals 0

    .line 105
    iput-boolean p1, p0, Lorg/apache/log/format/XMLFormatter;->m_printException:Z

    return-void
.end method

.method public setPrintMessage(Z)V
    .locals 0

    .line 95
    iput-boolean p1, p0, Lorg/apache/log/format/XMLFormatter;->m_printMessage:Z

    return-void
.end method

.method public setPrintPriority(Z)V
    .locals 0

    .line 65
    iput-boolean p1, p0, Lorg/apache/log/format/XMLFormatter;->m_printPriority:Z

    return-void
.end method

.method public setPrintRelativeTime(Z)V
    .locals 0

    .line 55
    iput-boolean p1, p0, Lorg/apache/log/format/XMLFormatter;->m_printRelativeTime:Z

    return-void
.end method

.method public setPrintTime(Z)V
    .locals 0

    .line 45
    iput-boolean p1, p0, Lorg/apache/log/format/XMLFormatter;->m_printTime:Z

    return-void
.end method
