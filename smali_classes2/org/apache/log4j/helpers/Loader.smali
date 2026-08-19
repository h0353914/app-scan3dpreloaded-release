.class public Lorg/apache/log4j/helpers/Loader;
.super Ljava/lang/Object;
.source "Loader.java"


# static fields
.field static final TSTR:Ljava/lang/String; = "Caught Exception while in Loader.getResource. This may be innocuous."

.field static synthetic class$java$lang$Thread:Ljava/lang/Class; = null

.field static synthetic class$org$apache$log4j$helpers$Loader:Ljava/lang/Class; = null

.field private static ignoreTCL:Z = false

.field private static java1:Z = true


# direct methods
.method static constructor <clinit>()V
    .locals 5

    const-string v0, "java.version"

    const/4 v1, 0x0

    .line 41
    invoke-static {v0, v1}, Lorg/apache/log4j/helpers/OptionConverter;->getSystemProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    const/16 v3, 0x2e

    .line 44
    invoke-virtual {v0, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_0

    add-int/2addr v3, v2

    .line 46
    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v3, 0x31

    if-eq v0, v3, :cond_0

    const/4 v0, 0x0

    .line 47
    sput-boolean v0, Lorg/apache/log4j/helpers/Loader;->java1:Z

    :cond_0
    const-string v0, "log4j.ignoreTCL"

    .line 50
    invoke-static {v0, v1}, Lorg/apache/log4j/helpers/OptionConverter;->getSystemProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 52
    invoke-static {v0, v2}, Lorg/apache/log4j/helpers/OptionConverter;->toBoolean(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lorg/apache/log4j/helpers/Loader;->ignoreTCL:Z

    :cond_1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

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

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static getResource(Ljava/lang/String;)Ljava/net/URL;
    .locals 3

    .line 91
    :try_start_0
    sget-boolean v0, Lorg/apache/log4j/helpers/Loader;->java1:Z

    if-nez v0, :cond_0

    .line 92
    invoke-static {}, Lorg/apache/log4j/helpers/Loader;->getTCL()Ljava/lang/ClassLoader;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 94
    new-instance v1, Ljava/lang/StringBuffer;

    const-string v2, "Trying to find ["

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v2, "] using context classloader "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 95
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    const-string v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 94
    invoke-static {v1}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    .line 96
    invoke-virtual {v0, p0}, Ljava/lang/ClassLoader;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    .line 105
    :cond_0
    sget-object v0, Lorg/apache/log4j/helpers/Loader;->class$org$apache$log4j$helpers$Loader:Ljava/lang/Class;

    if-eqz v0, :cond_1

    sget-object v0, Lorg/apache/log4j/helpers/Loader;->class$org$apache$log4j$helpers$Loader:Ljava/lang/Class;

    goto :goto_0

    :cond_1
    const-string v0, "org.apache.log4j.helpers.Loader"

    invoke-static {v0}, Lorg/apache/log4j/helpers/Loader;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/log4j/helpers/Loader;->class$org$apache$log4j$helpers$Loader:Ljava/lang/Class;

    :goto_0
    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 107
    new-instance v1, Ljava/lang/StringBuffer;

    const-string v2, "Trying to find ["

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v2, "] using "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    const-string v2, " class loader."

    .line 108
    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 107
    invoke-static {v1}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    .line 109
    invoke-virtual {v0, p0}, Ljava/lang/ClassLoader;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v0, :cond_2

    return-object v0

    :catch_0
    move-exception v0

    const-string v1, "Caught Exception while in Loader.getResource. This may be innocuous."

    .line 115
    invoke-static {v1, v0}, Lorg/apache/log4j/helpers/LogLog;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 122
    :cond_2
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v1, "Trying to find ["

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v1, "] using ClassLoader.getSystemResource()."

    .line 123
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 122
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    .line 124
    invoke-static {p0}, Ljava/lang/ClassLoader;->getSystemResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object p0

    return-object p0
.end method

.method public static getResource(Ljava/lang/String;Ljava/lang/Class;)Ljava/net/URL;
    .locals 0

    .line 64
    invoke-static {p0}, Lorg/apache/log4j/helpers/Loader;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object p0

    return-object p0
.end method

.method private static getTCL()Ljava/lang/ClassLoader;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 148
    :try_start_0
    sget-object v1, Lorg/apache/log4j/helpers/Loader;->class$java$lang$Thread:Ljava/lang/Class;

    if-eqz v1, :cond_0

    sget-object v1, Lorg/apache/log4j/helpers/Loader;->class$java$lang$Thread:Ljava/lang/Class;

    goto :goto_0

    :cond_0
    const-string v1, "java.lang.Thread"

    invoke-static {v1}, Lorg/apache/log4j/helpers/Loader;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/log4j/helpers/Loader;->class$java$lang$Thread:Ljava/lang/Class;

    :goto_0
    const-string v2, "getContextClassLoader"

    invoke-virtual {v1, v2, v0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    .line 154
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ClassLoader;

    return-object v0

    :catch_0
    return-object v0
.end method

.method public static isJava1()Z
    .locals 1

    .line 133
    sget-boolean v0, Lorg/apache/log4j/helpers/Loader;->java1:Z

    return v0
.end method

.method public static loadClass(Ljava/lang/String;)Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 169
    sget-boolean v0, Lorg/apache/log4j/helpers/Loader;->java1:Z

    if-nez v0, :cond_1

    sget-boolean v0, Lorg/apache/log4j/helpers/Loader;->ignoreTCL:Z

    if-eqz v0, :cond_0

    goto :goto_0

    .line 173
    :cond_0
    :try_start_0
    invoke-static {}, Lorg/apache/log4j/helpers/Loader;->getTCL()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 178
    :catch_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0

    return-object p0

    .line 170
    :cond_1
    :goto_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0

    return-object p0
.end method
