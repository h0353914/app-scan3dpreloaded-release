.class public Lorg/apache/log/format/RawFormatter;
.super Ljava/lang/Object;
.source "RawFormatter.java"

# interfaces
.implements Lorg/apache/log/format/Formatter;
.implements Lorg/apache/log/Formatter;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public format(Lorg/apache/log/LogEvent;)Ljava/lang/String;
    .locals 0

    .line 29
    invoke-virtual {p1}, Lorg/apache/log/LogEvent;->getMessage()Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    const-string p1, ""

    return-object p1

    :cond_0
    return-object p1
.end method
