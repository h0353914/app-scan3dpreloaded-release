.class public final Lorg/apache/log/util/StackIntrospector;
.super Ljava/lang/Object;
.source "StackIntrospector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/log/util/StackIntrospector$CallStack;
    }
.end annotation


# static fields
.field private static c_callStack:Lorg/apache/log/util/StackIntrospector$CallStack;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static declared-synchronized getCallStack()Lorg/apache/log/util/StackIntrospector$CallStack;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/SecurityException;
        }
    .end annotation

    const-class v0, Lorg/apache/log/util/StackIntrospector;

    monitor-enter v0

    .line 64
    :try_start_0
    sget-object v1, Lorg/apache/log/util/StackIntrospector;->c_callStack:Lorg/apache/log/util/StackIntrospector$CallStack;

    if-nez v1, :cond_0

    .line 67
    new-instance v1, Lorg/apache/log/util/StackIntrospector$CallStack;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lorg/apache/log/util/StackIntrospector$CallStack;-><init>(Lorg/apache/log/util/StackIntrospector$1;)V

    sput-object v1, Lorg/apache/log/util/StackIntrospector;->c_callStack:Lorg/apache/log/util/StackIntrospector$CallStack;

    .line 70
    :cond_0
    sget-object v1, Lorg/apache/log/util/StackIntrospector;->c_callStack:Lorg/apache/log/util/StackIntrospector$CallStack;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static final getCallerClass(Ljava/lang/Class;)Ljava/lang/Class;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/SecurityException;
        }
    .end annotation

    .line 85
    invoke-static {}, Lorg/apache/log/util/StackIntrospector;->getCallStack()Lorg/apache/log/util/StackIntrospector$CallStack;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/log/util/StackIntrospector$CallStack;->get()[Ljava/lang/Class;

    move-result-object v0

    .line 88
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    :goto_0
    if-gez v1, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 90
    :cond_0
    aget-object v2, v0, v1

    invoke-virtual {p0, v2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_1

    add-int/lit8 v1, v1, 0x1

    .line 93
    aget-object p0, v0, v1

    return-object p0

    :cond_1
    add-int/lit8 v1, v1, -0x1

    goto :goto_0
.end method

.method public static final getCallerMethod(Ljava/lang/Class;)Ljava/lang/String;
    .locals 10

    .line 110
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    .line 113
    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 114
    new-instance v1, Ljava/lang/Throwable;

    invoke-direct {v1}, Ljava/lang/Throwable;-><init>()V

    .line 115
    new-instance v2, Ljava/io/PrintWriter;

    const/4 v3, 0x1

    invoke-direct {v2, v0, v3}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;Z)V

    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 116
    invoke-virtual {v0}, Ljava/io/StringWriter;->getBuffer()Ljava/lang/StringBuffer;

    move-result-object v0

    .line 119
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 120
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->length()I

    move-result v2

    const/4 v4, 0x0

    move v5, v4

    move v6, v5

    move v7, v6

    :goto_0
    if-lt v5, v2, :cond_0

    const-string p0, ""

    return-object p0

    .line 129
    :cond_0
    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->charAt(I)C

    move-result v8

    const/16 v9, 0xa

    packed-switch v6, :pswitch_data_0

    goto :goto_2

    :pswitch_0
    if-eq v9, v8, :cond_1

    .line 151
    invoke-virtual {v1, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 156
    :cond_1
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    .line 159
    invoke-virtual {v6, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-nez v7, :cond_2

    if-eqz v8, :cond_2

    move v7, v3

    goto :goto_1

    :cond_2
    if-eqz v7, :cond_3

    if-nez v8, :cond_3

    return-object v6

    :cond_3
    :goto_1
    move v6, v3

    goto :goto_2

    .line 145
    :pswitch_1
    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->setLength(I)V

    const/4 v6, 0x3

    goto :goto_2

    :pswitch_2
    const/16 v9, 0x74

    if-ne v9, v8, :cond_4

    const/4 v6, 0x2

    goto :goto_2

    :pswitch_3
    if-ne v9, v8, :cond_4

    move v6, v3

    :cond_4
    :goto_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static final getRecentStack(Ljava/lang/Class;I)Ljava/lang/String;
    .locals 11

    .line 196
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    .line 199
    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 200
    new-instance v1, Ljava/lang/Throwable;

    invoke-direct {v1}, Ljava/lang/Throwable;-><init>()V

    .line 201
    new-instance v2, Ljava/io/PrintWriter;

    const/4 v3, 0x1

    invoke-direct {v2, v0, v3}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;Z)V

    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 202
    invoke-virtual {v0}, Ljava/io/StringWriter;->getBuffer()Ljava/lang/StringBuffer;

    move-result-object v0

    .line 205
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 206
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 207
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->length()I

    move-result v4

    const/4 v5, 0x0

    move v8, p1

    move p1, v5

    move v6, p1

    move v7, v6

    :goto_0
    if-lt p1, v4, :cond_0

    const-string p0, ""

    return-object p0

    .line 216
    :cond_0
    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->charAt(I)C

    move-result v9

    const/16 v10, 0xa

    packed-switch v6, :pswitch_data_0

    goto :goto_2

    :pswitch_0
    if-eq v10, v9, :cond_1

    .line 238
    invoke-virtual {v1, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 243
    :cond_1
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    .line 246
    invoke-virtual {v6, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-nez v7, :cond_2

    if-eqz v9, :cond_2

    move v7, v3

    goto :goto_1

    :cond_2
    if-eqz v7, :cond_4

    if-nez v9, :cond_4

    .line 256
    invoke-virtual {v2, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    add-int/lit8 v8, v8, -0x1

    if-nez v8, :cond_3

    .line 258
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_3
    const-string v6, "\n"

    .line 259
    invoke-virtual {v2, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    :cond_4
    :goto_1
    move v6, v3

    goto :goto_2

    .line 232
    :pswitch_1
    invoke-virtual {v1, v5}, Ljava/lang/StringBuffer;->setLength(I)V

    const/4 v6, 0x3

    goto :goto_2

    :pswitch_2
    const/16 v10, 0x74

    if-ne v10, v9, :cond_5

    const/4 v6, 0x2

    goto :goto_2

    :pswitch_3
    if-ne v10, v9, :cond_5

    move v6, v3

    :cond_5
    :goto_2
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
