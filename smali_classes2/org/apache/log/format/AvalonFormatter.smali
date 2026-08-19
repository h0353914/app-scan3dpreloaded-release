.class public Lorg/apache/log/format/AvalonFormatter;
.super Lorg/apache/avalon/framework/logger/AvalonFormatter;
.source "AvalonFormatter.java"


# direct methods
.method public constructor <init>()V
    .locals 1

    const-string v0, "%{time} [%7.7{priority}] (%{category}): %{message}\\n%{throwable}"

    .line 27
    invoke-direct {p0, v0}, Lorg/apache/avalon/framework/logger/AvalonFormatter;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 32
    invoke-direct {p0, p1}, Lorg/apache/avalon/framework/logger/AvalonFormatter;-><init>(Ljava/lang/String;)V

    return-void
.end method
