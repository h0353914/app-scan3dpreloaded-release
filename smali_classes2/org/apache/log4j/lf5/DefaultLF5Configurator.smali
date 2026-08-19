.class public Lorg/apache/log4j/lf5/DefaultLF5Configurator;
.super Ljava/lang/Object;
.source "DefaultLF5Configurator.java"

# interfaces
.implements Lorg/apache/log4j/spi/Configurator;


# static fields
.field static synthetic class$org$apache$log4j$lf5$DefaultLF5Configurator:Ljava/lang/Class;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 1

    .line 41
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

.method public static configure()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "/org/apache/log4j/lf5/config/defaultconfig.properties"

    .line 80
    sget-object v1, Lorg/apache/log4j/lf5/DefaultLF5Configurator;->class$org$apache$log4j$lf5$DefaultLF5Configurator:Ljava/lang/Class;

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    const-string v1, "org.apache.log4j.lf5.DefaultLF5Configurator"

    invoke-static {v1}, Lorg/apache/log4j/lf5/DefaultLF5Configurator;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/log4j/lf5/DefaultLF5Configurator;->class$org$apache$log4j$lf5$DefaultLF5Configurator:Ljava/lang/Class;

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/Class;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 83
    invoke-static {v1}, Lorg/apache/log4j/PropertyConfigurator;->configure(Ljava/net/URL;)V

    return-void

    .line 85
    :cond_1
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuffer;

    const-string v3, "Error: Unable to open the resource"

    invoke-direct {v2, v3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 86
    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 85
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public doConfigure(Ljava/net/URL;Lorg/apache/log4j/spi/LoggerRepository;)V
    .locals 0

    .line 96
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "This class should NOT be instantiated!"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
