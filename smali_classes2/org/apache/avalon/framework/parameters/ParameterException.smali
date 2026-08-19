.class public final Lorg/apache/avalon/framework/parameters/ParameterException;
.super Lorg/apache/avalon/framework/CascadingException;
.source "ParameterException.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 28
    invoke-direct {p0, p1, v0}, Lorg/apache/avalon/framework/parameters/ParameterException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 39
    invoke-direct {p0, p1, p2}, Lorg/apache/avalon/framework/CascadingException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method
