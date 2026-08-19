.class public Lorg/apache/avalon/framework/parameters/Parameters;
.super Ljava/lang/Object;
.source "Parameters.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static final EMPTY_PARAMETERS:Lorg/apache/avalon/framework/parameters/Parameters;


# instance fields
.field private m_parameters:Ljava/util/Map;

.field private m_readOnly:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 59
    new-instance v0, Lorg/apache/avalon/framework/parameters/Parameters;

    invoke-direct {v0}, Lorg/apache/avalon/framework/parameters/Parameters;-><init>()V

    sput-object v0, Lorg/apache/avalon/framework/parameters/Parameters;->EMPTY_PARAMETERS:Lorg/apache/avalon/framework/parameters/Parameters;

    .line 60
    sget-object v0, Lorg/apache/avalon/framework/parameters/Parameters;->EMPTY_PARAMETERS:Lorg/apache/avalon/framework/parameters/Parameters;

    invoke-virtual {v0}, Lorg/apache/avalon/framework/parameters/Parameters;->makeReadOnly()V

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/avalon/framework/parameters/Parameters;->m_parameters:Ljava/util/Map;

    return-void
.end method

.method public static fromConfiguration(Lorg/apache/avalon/framework/configuration/Configuration;)Lorg/apache/avalon/framework/parameters/Parameters;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/avalon/framework/configuration/ConfigurationException;
        }
    .end annotation

    const-string v0, "parameter"

    .line 555
    invoke-static {p0, v0}, Lorg/apache/avalon/framework/parameters/Parameters;->fromConfiguration(Lorg/apache/avalon/framework/configuration/Configuration;Ljava/lang/String;)Lorg/apache/avalon/framework/parameters/Parameters;

    move-result-object p0

    return-object p0
.end method

.method public static fromConfiguration(Lorg/apache/avalon/framework/configuration/Configuration;Ljava/lang/String;)Lorg/apache/avalon/framework/parameters/Parameters;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/avalon/framework/configuration/ConfigurationException;
        }
    .end annotation

    if-eqz p0, :cond_1

    .line 577
    invoke-interface {p0, p1}, Lorg/apache/avalon/framework/configuration/Configuration;->getChildren(Ljava/lang/String;)[Lorg/apache/avalon/framework/configuration/Configuration;

    move-result-object p0

    .line 578
    new-instance p1, Lorg/apache/avalon/framework/parameters/Parameters;

    invoke-direct {p1}, Lorg/apache/avalon/framework/parameters/Parameters;-><init>()V

    const/4 v0, 0x0

    .line 580
    :goto_0
    array-length v1, p0

    if-lt v0, v1, :cond_0

    return-object p1

    .line 584
    :cond_0
    :try_start_0
    aget-object v1, p0, v0

    const-string v2, "name"

    invoke-interface {v1, v2}, Lorg/apache/avalon/framework/configuration/Configuration;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 585
    aget-object v2, p0, v0

    const-string v3, "value"

    invoke-interface {v2, v3}, Lorg/apache/avalon/framework/configuration/Configuration;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 586
    invoke-virtual {p1, v1, v2}, Lorg/apache/avalon/framework/parameters/Parameters;->setParameter(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :catch_0
    move-exception p0

    .line 590
    new-instance p1, Lorg/apache/avalon/framework/configuration/ConfigurationException;

    const-string v0, "Cannot process Configurable"

    invoke-direct {p1, v0, p0}, Lorg/apache/avalon/framework/configuration/ConfigurationException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1

    .line 573
    :cond_1
    new-instance p0, Lorg/apache/avalon/framework/configuration/ConfigurationException;

    const-string p1, "You cannot convert to parameters with a null Configuration"

    invoke-direct {p0, p1}, Lorg/apache/avalon/framework/configuration/ConfigurationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static fromProperties(Ljava/util/Properties;)Lorg/apache/avalon/framework/parameters/Parameters;
    .locals 4

    .line 606
    new-instance v0, Lorg/apache/avalon/framework/parameters/Parameters;

    invoke-direct {v0}, Lorg/apache/avalon/framework/parameters/Parameters;-><init>()V

    .line 607
    invoke-virtual {p0}, Ljava/util/Properties;->propertyNames()Ljava/util/Enumeration;

    move-result-object v1

    .line 609
    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-nez v2, :cond_0

    return-object v0

    .line 611
    :cond_0
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 612
    invoke-virtual {p0, v2}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 613
    invoke-virtual {v0, v2, v3}, Lorg/apache/avalon/framework/parameters/Parameters;->setParameter(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    goto :goto_0
.end method

.method private parseInt(Ljava/lang/String;)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    const-string v0, "0x"

    .line 210
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x2

    if-eqz v0, :cond_0

    .line 212
    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    const/16 v0, 0x10

    invoke-static {p1, v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result p1

    return p1

    :cond_0
    const-string v0, "0o"

    .line 214
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 216
    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    const/16 v0, 0x8

    invoke-static {p1, v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result p1

    return p1

    :cond_1
    const-string v0, "0b"

    .line 218
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 220
    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result p1

    return p1

    .line 224
    :cond_2
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method private parseLong(Ljava/lang/String;)J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    const-string v0, "0x"

    .line 298
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x2

    if-eqz v0, :cond_0

    .line 300
    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    const/16 v0, 0x10

    invoke-static {p1, v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    move-result-wide v0

    return-wide v0

    :cond_0
    const-string v0, "0o"

    .line 302
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 304
    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    const/16 v0, 0x8

    invoke-static {p1, v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    move-result-wide v0

    return-wide v0

    :cond_1
    const-string v0, "0b"

    .line 306
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 308
    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    move-result-wide v0

    return-wide v0

    .line 312
    :cond_2
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public static toProperties(Lorg/apache/avalon/framework/parameters/Parameters;)Ljava/util/Properties;
    .locals 6

    .line 628
    new-instance v0, Ljava/util/Properties;

    invoke-direct {v0}, Ljava/util/Properties;-><init>()V

    .line 629
    invoke-virtual {p0}, Lorg/apache/avalon/framework/parameters/Parameters;->getNames()[Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    .line 631
    :goto_0
    array-length v3, v1

    if-lt v2, v3, :cond_0

    return-object v0

    .line 634
    :cond_0
    aget-object v3, v1, v2

    aget-object v4, v1, v2

    const-string v5, ""

    invoke-virtual {p0, v4, v5}, Lorg/apache/avalon/framework/parameters/Parameters;->getParameter(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method


# virtual methods
.method protected final checkWriteable()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 535
    iget-boolean v0, p0, Lorg/apache/avalon/framework/parameters/Parameters;->m_readOnly:Z

    if-nez v0, :cond_0

    return-void

    .line 537
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Context is read only and can not be modified"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getNames()[Ljava/lang/String;
    .locals 2

    .line 123
    iget-object v0, p0, Lorg/apache/avalon/framework/parameters/Parameters;->m_parameters:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    return-object v0
.end method

.method public getParameter(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/avalon/framework/parameters/ParameterException;
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 154
    iget-object v0, p0, Lorg/apache/avalon/framework/parameters/Parameters;->m_parameters:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_0

    return-object v0

    .line 158
    :cond_0
    new-instance v0, Lorg/apache/avalon/framework/parameters/ParameterException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "The parameter \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string p1, "\' does not contain a value"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lorg/apache/avalon/framework/parameters/ParameterException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 151
    :cond_1
    new-instance p1, Lorg/apache/avalon/framework/parameters/ParameterException;

    const-string v0, "You cannot lookup a null parameter"

    invoke-direct {p1, v0}, Lorg/apache/avalon/framework/parameters/ParameterException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public getParameter(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    if-nez p1, :cond_0

    return-object p2

    .line 185
    :cond_0
    iget-object v0, p0, Lorg/apache/avalon/framework/parameters/Parameters;->m_parameters:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-nez p1, :cond_1

    return-object p2

    :cond_1
    return-object p1
.end method

.method public getParameterAsBoolean(Ljava/lang/String;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/avalon/framework/parameters/ParameterException;
        }
    .end annotation

    .line 437
    invoke-virtual {p0, p1}, Lorg/apache/avalon/framework/parameters/Parameters;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "true"

    .line 439
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const-string v0, "false"

    .line 443
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 p1, 0x0

    return p1

    .line 449
    :cond_1
    new-instance p1, Lorg/apache/avalon/framework/parameters/ParameterException;

    const-string v0, "Could not return a boolean value"

    invoke-direct {p1, v0}, Lorg/apache/avalon/framework/parameters/ParameterException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public getParameterAsBoolean(Ljava/lang/String;Z)Z
    .locals 1

    const/4 v0, 0x0

    .line 465
    invoke-virtual {p0, p1, v0}, Lorg/apache/avalon/framework/parameters/Parameters;->getParameter(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    return p2

    :cond_0
    const-string v0, "true"

    .line 471
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 p1, 0x1

    return p1

    :cond_1
    const-string v0, "false"

    .line 475
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_2

    const/4 p1, 0x0

    return p1

    :cond_2
    return p2
.end method

.method public getParameterAsFloat(Ljava/lang/String;)F
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/avalon/framework/parameters/ParameterException;
        }
    .end annotation

    .line 388
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/apache/avalon/framework/parameters/Parameters;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result p1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    move-exception p1

    .line 392
    new-instance v0, Lorg/apache/avalon/framework/parameters/ParameterException;

    const-string v1, "Could not return a float value"

    invoke-direct {v0, v1, p1}, Lorg/apache/avalon/framework/parameters/ParameterException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method public getParameterAsFloat(Ljava/lang/String;F)F
    .locals 1

    const/4 v0, 0x0

    .line 410
    :try_start_0
    invoke-virtual {p0, p1, v0}, Lorg/apache/avalon/framework/parameters/Parameters;->getParameter(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    return p2

    .line 416
    :cond_0
    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result p1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    return p2
.end method

.method public getParameterAsInteger(Ljava/lang/String;)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/avalon/framework/parameters/ParameterException;
        }
    .end annotation

    .line 246
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/apache/avalon/framework/parameters/Parameters;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/apache/avalon/framework/parameters/Parameters;->parseInt(Ljava/lang/String;)I

    move-result p1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    move-exception p1

    .line 250
    new-instance v0, Lorg/apache/avalon/framework/parameters/ParameterException;

    const-string v1, "Could not return an integer value"

    invoke-direct {v0, v1, p1}, Lorg/apache/avalon/framework/parameters/ParameterException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method public getParameterAsInteger(Ljava/lang/String;I)I
    .locals 1

    const/4 v0, 0x0

    .line 271
    :try_start_0
    invoke-virtual {p0, p1, v0}, Lorg/apache/avalon/framework/parameters/Parameters;->getParameter(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    return p2

    .line 277
    :cond_0
    invoke-direct {p0, p1}, Lorg/apache/avalon/framework/parameters/Parameters;->parseInt(Ljava/lang/String;)I

    move-result p1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    return p2
.end method

.method public getParameterAsLong(Ljava/lang/String;)J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/avalon/framework/parameters/ParameterException;
        }
    .end annotation

    .line 334
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/apache/avalon/framework/parameters/Parameters;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/apache/avalon/framework/parameters/Parameters;->parseLong(Ljava/lang/String;)J

    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    :catch_0
    move-exception p1

    .line 338
    new-instance v0, Lorg/apache/avalon/framework/parameters/ParameterException;

    const-string v1, "Could not return a long value"

    invoke-direct {v0, v1, p1}, Lorg/apache/avalon/framework/parameters/ParameterException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method public getParameterAsLong(Ljava/lang/String;J)J
    .locals 1

    const/4 v0, 0x0

    .line 359
    :try_start_0
    invoke-virtual {p0, p1, v0}, Lorg/apache/avalon/framework/parameters/Parameters;->getParameter(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    return-wide p2

    .line 365
    :cond_0
    invoke-direct {p0, p1}, Lorg/apache/avalon/framework/parameters/Parameters;->parseLong(Ljava/lang/String;)J

    move-result-wide p1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide p1

    :catch_0
    return-wide p2
.end method

.method public getParameterNames()Ljava/util/Iterator;
    .locals 1

    .line 113
    iget-object v0, p0, Lorg/apache/avalon/framework/parameters/Parameters;->m_parameters:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public isParameter(Ljava/lang/String;)Z
    .locals 1

    .line 134
    iget-object v0, p0, Lorg/apache/avalon/framework/parameters/Parameters;->m_parameters:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public makeReadOnly()V
    .locals 1

    const/4 v0, 0x1

    .line 524
    iput-boolean v0, p0, Lorg/apache/avalon/framework/parameters/Parameters;->m_readOnly:Z

    return-void
.end method

.method public merge(Lorg/apache/avalon/framework/parameters/Parameters;)Lorg/apache/avalon/framework/parameters/Parameters;
    .locals 4

    .line 494
    invoke-virtual {p0}, Lorg/apache/avalon/framework/parameters/Parameters;->checkWriteable()V

    .line 496
    invoke-virtual {p1}, Lorg/apache/avalon/framework/parameters/Parameters;->getNames()[Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    .line 498
    :goto_0
    array-length v2, v0

    if-lt v1, v2, :cond_0

    return-object p0

    .line 500
    :cond_0
    aget-object v2, v0, v1

    .line 504
    :try_start_0
    invoke-virtual {p1, v2}, Lorg/apache/avalon/framework/parameters/Parameters;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3
    :try_end_0
    .catch Lorg/apache/avalon/framework/parameters/ParameterException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    const/4 v3, 0x0

    .line 511
    :goto_1
    invoke-virtual {p0, v2, v3}, Lorg/apache/avalon/framework/parameters/Parameters;->setParameter(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public removeParameter(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 102
    invoke-virtual {p0, p1, v0}, Lorg/apache/avalon/framework/parameters/Parameters;->setParameter(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    return-void
.end method

.method public setParameter(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 81
    invoke-virtual {p0}, Lorg/apache/avalon/framework/parameters/Parameters;->checkWriteable()V

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    if-nez p2, :cond_1

    .line 90
    iget-object p2, p0, Lorg/apache/avalon/framework/parameters/Parameters;->m_parameters:Ljava/util/Map;

    invoke-interface {p2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1

    .line 93
    :cond_1
    iget-object v0, p0, Lorg/apache/avalon/framework/parameters/Parameters;->m_parameters:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1
.end method
