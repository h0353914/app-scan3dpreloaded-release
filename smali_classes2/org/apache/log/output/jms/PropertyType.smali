.class public Lorg/apache/log/output/jms/PropertyType;
.super Ljava/lang/Object;
.source "PropertyType.java"


# static fields
.field public static final CATEGORY:I = 0x2

.field public static final CATEGORY_STR:Ljava/lang/String; = "category"

.field public static final CONTEXT:I = 0x3

.field public static final CONTEXT_STR:Ljava/lang/String; = "context"

.field public static final MESSAGE:I = 0x4

.field public static final MESSAGE_STR:Ljava/lang/String; = "message"

.field public static final PRIORITY:I = 0x8

.field public static final PRIORITY_STR:Ljava/lang/String; = "priority"

.field public static final RELATIVE_TIME:I = 0x6

.field public static final RELATIVE_TIME_STR:Ljava/lang/String; = "rtime"

.field public static final STATIC:I = 0x1

.field public static final STATIC_STR:Ljava/lang/String; = "static"

.field public static final THROWABLE:I = 0x7

.field public static final THROWABLE_STR:Ljava/lang/String; = "throwable"

.field public static final TIME:I = 0x5

.field public static final TIME_STR:Ljava/lang/String; = "time"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getTypeIdFor(Ljava/lang/String;)I
    .locals 3

    const-string v0, "category"

    .line 42
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x2

    return p0

    :cond_0
    const-string v0, "static"

    .line 43
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    const-string v0, "context"

    .line 44
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 p0, 0x3

    return p0

    :cond_2
    const-string v0, "message"

    .line 45
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 p0, 0x4

    return p0

    :cond_3
    const-string v0, "priority"

    .line 46
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    const/16 p0, 0x8

    return p0

    :cond_4
    const-string v0, "time"

    .line 47
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    const/4 p0, 0x5

    return p0

    :cond_5
    const-string v0, "rtime"

    .line 48
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    const/4 p0, 0x6

    return p0

    :cond_6
    const-string v0, "throwable"

    .line 49
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    const/4 p0, 0x7

    return p0

    .line 55
    :cond_7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Unknown Type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
