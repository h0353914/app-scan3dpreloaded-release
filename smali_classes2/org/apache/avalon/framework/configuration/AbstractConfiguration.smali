.class public abstract Lorg/apache/avalon/framework/configuration/AbstractConfiguration;
.super Ljava/lang/Object;
.source "AbstractConfiguration.java"

# interfaces
.implements Lorg/apache/avalon/framework/configuration/Configuration;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private isFalse(Ljava/lang/String;)Z
    .locals 1

    const-string v0, "false"

    .line 473
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "no"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "off"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "0"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method private isTrue(Ljava/lang/String;)Z
    .locals 1

    const-string v0, "true"

    .line 465
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "yes"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "on"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "1"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method


# virtual methods
.method public getAttribute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 511
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/apache/avalon/framework/configuration/AbstractConfiguration;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Lorg/apache/avalon/framework/configuration/ConfigurationException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    return-object p2
.end method

.method public getAttributeAsBoolean(Ljava/lang/String;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/avalon/framework/configuration/ConfigurationException;
        }
    .end annotation

    .line 445
    invoke-virtual {p0, p1}, Lorg/apache/avalon/framework/configuration/AbstractConfiguration;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 447
    invoke-direct {p0, v0}, Lorg/apache/avalon/framework/configuration/AbstractConfiguration;->isTrue(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 p1, 0x1

    return p1

    .line 451
    :cond_0
    invoke-direct {p0, v0}, Lorg/apache/avalon/framework/configuration/AbstractConfiguration;->isFalse(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 p1, 0x0

    return p1

    .line 457
    :cond_1
    new-instance v1, Lorg/apache/avalon/framework/configuration/ConfigurationException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Cannot parse the value \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v0, "\" as a boolean in the attribute \""

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string p1, "\" at "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Lorg/apache/avalon/framework/configuration/AbstractConfiguration;->getLocation()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Lorg/apache/avalon/framework/configuration/ConfigurationException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getAttributeAsBoolean(Ljava/lang/String;Z)Z
    .locals 0

    .line 491
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/apache/avalon/framework/configuration/AbstractConfiguration;->getAttributeAsBoolean(Ljava/lang/String;)Z

    move-result p1
    :try_end_0
    .catch Lorg/apache/avalon/framework/configuration/ConfigurationException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    return p2
.end method

.method public getAttributeAsFloat(Ljava/lang/String;)F
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/avalon/framework/configuration/ConfigurationException;
        }
    .end annotation

    .line 401
    invoke-virtual {p0, p1}, Lorg/apache/avalon/framework/configuration/AbstractConfiguration;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 404
    :try_start_0
    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    .line 408
    :catch_0
    new-instance v1, Lorg/apache/avalon/framework/configuration/ConfigurationException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Cannot parse the value \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v0, "\" as a float in the attribute \""

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string p1, "\" at "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Lorg/apache/avalon/framework/configuration/AbstractConfiguration;->getLocation()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Lorg/apache/avalon/framework/configuration/ConfigurationException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getAttributeAsFloat(Ljava/lang/String;F)F
    .locals 0

    .line 426
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/apache/avalon/framework/configuration/AbstractConfiguration;->getAttributeAsFloat(Ljava/lang/String;)F

    move-result p1
    :try_end_0
    .catch Lorg/apache/avalon/framework/configuration/ConfigurationException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    return p2
.end method

.method public getAttributeAsInteger(Ljava/lang/String;)I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/avalon/framework/configuration/ConfigurationException;
        }
    .end annotation

    .line 273
    invoke-virtual {p0, p1}, Lorg/apache/avalon/framework/configuration/AbstractConfiguration;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    :try_start_0
    const-string v1, "0x"

    .line 276
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x2

    if-eqz v1, :cond_0

    .line 278
    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x10

    invoke-static {v1, v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result p1

    return p1

    :cond_0
    const-string v1, "0o"

    .line 280
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 282
    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x8

    invoke-static {v1, v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result p1

    return p1

    :cond_1
    const-string v1, "0b"

    .line 284
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 286
    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result p1

    return p1

    .line 290
    :cond_2
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    .line 295
    :catch_0
    new-instance v1, Lorg/apache/avalon/framework/configuration/ConfigurationException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Cannot parse the value \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v0, "\" as an integer in the attribute \""

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string p1, "\" at "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Lorg/apache/avalon/framework/configuration/AbstractConfiguration;->getLocation()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Lorg/apache/avalon/framework/configuration/ConfigurationException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getAttributeAsInteger(Ljava/lang/String;I)I
    .locals 0

    .line 316
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/apache/avalon/framework/configuration/AbstractConfiguration;->getAttributeAsInteger(Ljava/lang/String;)I

    move-result p1
    :try_end_0
    .catch Lorg/apache/avalon/framework/configuration/ConfigurationException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    return p2
.end method

.method public getAttributeAsLong(Ljava/lang/String;)J
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/avalon/framework/configuration/ConfigurationException;
        }
    .end annotation

    .line 338
    invoke-virtual {p0, p1}, Lorg/apache/avalon/framework/configuration/AbstractConfiguration;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :try_start_0
    const-string v1, "0x"

    .line 342
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x2

    if-eqz v1, :cond_0

    .line 344
    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x10

    invoke-static {v1, v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    move-result-wide v0

    return-wide v0

    :cond_0
    const-string v1, "0o"

    .line 346
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 348
    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x8

    invoke-static {v1, v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    move-result-wide v0

    return-wide v0

    :cond_1
    const-string v1, "0b"

    .line 350
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 352
    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    move-result-wide v0

    return-wide v0

    .line 356
    :cond_2
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    .line 361
    :catch_0
    new-instance v1, Lorg/apache/avalon/framework/configuration/ConfigurationException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Cannot parse the value \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v0, "\" as a long in the attribute \""

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string p1, "\" at "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Lorg/apache/avalon/framework/configuration/AbstractConfiguration;->getLocation()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Lorg/apache/avalon/framework/configuration/ConfigurationException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getAttributeAsLong(Ljava/lang/String;J)J
    .locals 0

    .line 382
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/apache/avalon/framework/configuration/AbstractConfiguration;->getAttributeAsLong(Ljava/lang/String;)J

    move-result-wide p1
    :try_end_0
    .catch Lorg/apache/avalon/framework/configuration/ConfigurationException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide p1

    :catch_0
    return-wide p2
.end method

.method public getChild(Ljava/lang/String;)Lorg/apache/avalon/framework/configuration/Configuration;
    .locals 1

    const/4 v0, 0x1

    .line 529
    invoke-virtual {p0, p1, v0}, Lorg/apache/avalon/framework/configuration/AbstractConfiguration;->getChild(Ljava/lang/String;Z)Lorg/apache/avalon/framework/configuration/Configuration;

    move-result-object p1

    return-object p1
.end method

.method public getChild(Ljava/lang/String;Z)Lorg/apache/avalon/framework/configuration/Configuration;
    .locals 2

    .line 542
    invoke-virtual {p0, p1}, Lorg/apache/avalon/framework/configuration/AbstractConfiguration;->getChildren(Ljava/lang/String;)[Lorg/apache/avalon/framework/configuration/Configuration;

    move-result-object v0

    .line 543
    array-length v1, v0

    if-lez v1, :cond_0

    const/4 p1, 0x0

    .line 545
    aget-object p1, v0, p1

    return-object p1

    :cond_0
    if-eqz p2, :cond_1

    .line 551
    new-instance p2, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;

    const-string v0, "-"

    invoke-direct {p2, p1, v0}, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object p2

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method protected abstract getPrefix()Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/avalon/framework/configuration/ConfigurationException;
        }
    .end annotation
.end method

.method public getValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 251
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/avalon/framework/configuration/AbstractConfiguration;->getValue()Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Lorg/apache/avalon/framework/configuration/ConfigurationException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    return-object p1
.end method

.method public getValueAsBoolean()Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/avalon/framework/configuration/ConfigurationException;
        }
    .end annotation

    .line 205
    invoke-virtual {p0}, Lorg/apache/avalon/framework/configuration/AbstractConfiguration;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 207
    invoke-direct {p0, v0}, Lorg/apache/avalon/framework/configuration/AbstractConfiguration;->isTrue(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    return v0

    .line 211
    :cond_0
    invoke-direct {p0, v0}, Lorg/apache/avalon/framework/configuration/AbstractConfiguration;->isFalse(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v0, 0x0

    return v0

    .line 217
    :cond_1
    new-instance v1, Lorg/apache/avalon/framework/configuration/ConfigurationException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Cannot parse the value \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v0, "\" as a boolean in the configuration element \""

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Lorg/apache/avalon/framework/configuration/AbstractConfiguration;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v0, "\" at "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Lorg/apache/avalon/framework/configuration/AbstractConfiguration;->getLocation()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lorg/apache/avalon/framework/configuration/ConfigurationException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getValueAsBoolean(Z)Z
    .locals 0

    .line 233
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/avalon/framework/configuration/AbstractConfiguration;->getValueAsBoolean()Z

    move-result p1
    :try_end_0
    .catch Lorg/apache/avalon/framework/configuration/ConfigurationException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    return p1
.end method

.method public getValueAsFloat()F
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/avalon/framework/configuration/ConfigurationException;
        }
    .end annotation

    .line 165
    invoke-virtual {p0}, Lorg/apache/avalon/framework/configuration/AbstractConfiguration;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 168
    :try_start_0
    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 172
    :catch_0
    new-instance v1, Lorg/apache/avalon/framework/configuration/ConfigurationException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Cannot parse the value \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v0, "\" as a float in the configuration element \""

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Lorg/apache/avalon/framework/configuration/AbstractConfiguration;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v0, "\" at "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Lorg/apache/avalon/framework/configuration/AbstractConfiguration;->getLocation()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lorg/apache/avalon/framework/configuration/ConfigurationException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getValueAsFloat(F)F
    .locals 0

    .line 188
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/avalon/framework/configuration/AbstractConfiguration;->getValueAsFloat()F

    move-result p1
    :try_end_0
    .catch Lorg/apache/avalon/framework/configuration/ConfigurationException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    return p1
.end method

.method public getValueAsInteger()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/avalon/framework/configuration/ConfigurationException;
        }
    .end annotation

    .line 46
    invoke-virtual {p0}, Lorg/apache/avalon/framework/configuration/AbstractConfiguration;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    :try_start_0
    const-string v1, "0x"

    .line 49
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x2

    if-eqz v1, :cond_0

    .line 51
    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x10

    invoke-static {v1, v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v0

    return v0

    :cond_0
    const-string v1, "0o"

    .line 53
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 55
    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x8

    invoke-static {v1, v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v0

    return v0

    :cond_1
    const-string v1, "0b"

    .line 57
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 59
    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v0

    return v0

    .line 63
    :cond_2
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 68
    :catch_0
    new-instance v1, Lorg/apache/avalon/framework/configuration/ConfigurationException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Cannot parse the value \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v0, "\" as an integer in the configuration element \""

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Lorg/apache/avalon/framework/configuration/AbstractConfiguration;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v0, "\" at "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Lorg/apache/avalon/framework/configuration/AbstractConfiguration;->getLocation()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lorg/apache/avalon/framework/configuration/ConfigurationException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getValueAsInteger(I)I
    .locals 0

    .line 87
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/avalon/framework/configuration/AbstractConfiguration;->getValueAsInteger()I

    move-result p1
    :try_end_0
    .catch Lorg/apache/avalon/framework/configuration/ConfigurationException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    return p1
.end method

.method public getValueAsLong()J
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/avalon/framework/configuration/ConfigurationException;
        }
    .end annotation

    .line 107
    invoke-virtual {p0}, Lorg/apache/avalon/framework/configuration/AbstractConfiguration;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    :try_start_0
    const-string v1, "0x"

    .line 110
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x2

    if-eqz v1, :cond_0

    .line 112
    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x10

    invoke-static {v1, v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    move-result-wide v0

    return-wide v0

    :cond_0
    const-string v1, "0o"

    .line 114
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 116
    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x8

    invoke-static {v1, v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    move-result-wide v0

    return-wide v0

    :cond_1
    const-string v1, "0b"

    .line 118
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 120
    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    move-result-wide v0

    return-wide v0

    .line 124
    :cond_2
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    .line 129
    :catch_0
    new-instance v1, Lorg/apache/avalon/framework/configuration/ConfigurationException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Cannot parse the value \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v0, "\" as a long in the configuration element \""

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Lorg/apache/avalon/framework/configuration/AbstractConfiguration;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v0, "\" at "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Lorg/apache/avalon/framework/configuration/AbstractConfiguration;->getLocation()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lorg/apache/avalon/framework/configuration/ConfigurationException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getValueAsLong(J)J
    .locals 0

    .line 148
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/avalon/framework/configuration/AbstractConfiguration;->getValueAsLong()J

    move-result-wide p1
    :try_end_0
    .catch Lorg/apache/avalon/framework/configuration/ConfigurationException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide p1

    :catch_0
    return-wide p1
.end method
