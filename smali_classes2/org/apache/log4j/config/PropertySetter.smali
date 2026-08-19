.class public Lorg/apache/log4j/config/PropertySetter;
.super Ljava/lang/Object;
.source "PropertySetter.java"


# static fields
.field static synthetic class$java$lang$String:Ljava/lang/Class;

.field static synthetic class$org$apache$log4j$Priority:Ljava/lang/Class;


# instance fields
.field protected obj:Ljava/lang/Object;

.field protected props:[Ljava/beans/PropertyDescriptor;


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .locals 0

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    iput-object p1, p0, Lorg/apache/log4j/config/PropertySetter;->obj:Ljava/lang/Object;

    return-void
.end method

.method static synthetic class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 1

    .line 53
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

.method public static setProperties(Ljava/lang/Object;Ljava/util/Properties;Ljava/lang/String;)V
    .locals 1

    .line 96
    new-instance v0, Lorg/apache/log4j/config/PropertySetter;

    invoke-direct {v0, p0}, Lorg/apache/log4j/config/PropertySetter;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, p1, p2}, Lorg/apache/log4j/config/PropertySetter;->setProperties(Ljava/util/Properties;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public activate()V
    .locals 2

    .line 255
    iget-object v0, p0, Lorg/apache/log4j/config/PropertySetter;->obj:Ljava/lang/Object;

    instance-of v1, v0, Lorg/apache/log4j/spi/OptionHandler;

    if-eqz v1, :cond_0

    .line 256
    check-cast v0, Lorg/apache/log4j/spi/OptionHandler;

    invoke-interface {v0}, Lorg/apache/log4j/spi/OptionHandler;->activateOptions()V

    :cond_0
    return-void
.end method

.method protected convertArg(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 3

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    .line 221
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 222
    sget-object v2, Lorg/apache/log4j/config/PropertySetter;->class$java$lang$String:Ljava/lang/Class;

    if-eqz v2, :cond_1

    goto :goto_0

    :cond_1
    const-string v2, "java.lang.String"

    invoke-static {v2}, Lorg/apache/log4j/config/PropertySetter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lorg/apache/log4j/config/PropertySetter;->class$java$lang$String:Ljava/lang/Class;

    :goto_0
    invoke-virtual {v2, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_2

    return-object p1

    .line 224
    :cond_2
    sget-object p1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-virtual {p1, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 225
    new-instance p1, Ljava/lang/Integer;

    invoke-direct {p1, v1}, Ljava/lang/Integer;-><init>(Ljava/lang/String;)V

    return-object p1

    .line 226
    :cond_3
    sget-object p1, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    invoke-virtual {p1, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 227
    new-instance p1, Ljava/lang/Long;

    invoke-direct {p1, v1}, Ljava/lang/Long;-><init>(Ljava/lang/String;)V

    return-object p1

    .line 228
    :cond_4
    sget-object p1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-virtual {p1, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result p1

    if-eqz p1, :cond_6

    const-string p1, "true"

    .line 229
    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_5

    .line 230
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object p1

    :cond_5
    const-string p1, "false"

    .line 231
    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_8

    .line 232
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p1

    .line 234
    :cond_6
    sget-object p1, Lorg/apache/log4j/config/PropertySetter;->class$org$apache$log4j$Priority:Ljava/lang/Class;

    if-eqz p1, :cond_7

    goto :goto_1

    :cond_7
    const-string p1, "org.apache.log4j.Priority"

    invoke-static {p1}, Lorg/apache/log4j/config/PropertySetter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    sput-object p1, Lorg/apache/log4j/config/PropertySetter;->class$org$apache$log4j$Priority:Ljava/lang/Class;

    :goto_1
    invoke-virtual {p1, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result p1

    if-eqz p1, :cond_8

    .line 235
    sget-object p1, Lorg/apache/log4j/Level;->DEBUG:Lorg/apache/log4j/Level;

    invoke-static {v1, p1}, Lorg/apache/log4j/helpers/OptionConverter;->toLevel(Ljava/lang/String;Lorg/apache/log4j/Level;)Lorg/apache/log4j/Level;

    move-result-object p1

    return-object p1

    :cond_8
    return-object v0
.end method

.method protected getPropertyDescriptor(Ljava/lang/String;)Ljava/beans/PropertyDescriptor;
    .locals 3

    .line 243
    iget-object v0, p0, Lorg/apache/log4j/config/PropertySetter;->props:[Ljava/beans/PropertyDescriptor;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/log4j/config/PropertySetter;->introspect()V

    :cond_0
    const/4 v0, 0x0

    .line 245
    :goto_0
    iget-object v1, p0, Lorg/apache/log4j/config/PropertySetter;->props:[Ljava/beans/PropertyDescriptor;

    array-length v2, v1

    if-lt v0, v2, :cond_1

    const/4 p1, 0x0

    return-object p1

    .line 246
    :cond_1
    aget-object v1, v1, v0

    invoke-virtual {v1}, Ljava/beans/FeatureDescriptor;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 247
    iget-object p1, p0, Lorg/apache/log4j/config/PropertySetter;->props:[Ljava/beans/PropertyDescriptor;

    aget-object p1, p1, v0

    return-object p1

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method protected introspect()V
    .locals 3

    .line 75
    :try_start_0
    iget-object v0, p0, Lorg/apache/log4j/config/PropertySetter;->obj:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Ljava/beans/Introspector;->getBeanInfo(Ljava/lang/Class;)Ljava/beans/BeanInfo;

    move-result-object v0

    .line 76
    invoke-interface {v0}, Ljava/beans/BeanInfo;->getPropertyDescriptors()[Ljava/beans/PropertyDescriptor;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/log4j/config/PropertySetter;->props:[Ljava/beans/PropertyDescriptor;
    :try_end_0
    .catch Ljava/beans/IntrospectionException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 78
    new-instance v1, Ljava/lang/StringBuffer;

    const-string v2, "Failed to introspect "

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lorg/apache/log4j/config/PropertySetter;->obj:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/log4j/helpers/LogLog;->error(Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 79
    new-array v0, v0, [Ljava/beans/PropertyDescriptor;

    iput-object v0, p0, Lorg/apache/log4j/config/PropertySetter;->props:[Ljava/beans/PropertyDescriptor;

    :goto_0
    return-void
.end method

.method public setProperties(Ljava/util/Properties;Ljava/lang/String;)V
    .locals 5

    .line 108
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    .line 110
    invoke-virtual {p1}, Ljava/util/Properties;->propertyNames()Ljava/util/Enumeration;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-nez v2, :cond_1

    .line 132
    invoke-virtual {p0}, Lorg/apache/log4j/config/PropertySetter;->activate()V

    return-void

    .line 111
    :cond_1
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 114
    invoke-virtual {v2, p2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/16 v3, 0x2e

    add-int/lit8 v4, v0, 0x1

    .line 118
    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->indexOf(II)I

    move-result v3

    if-gtz v3, :cond_0

    .line 124
    invoke-static {v2, p1}, Lorg/apache/log4j/helpers/OptionConverter;->findAndSubst(Ljava/lang/String;Ljava/util/Properties;)Ljava/lang/String;

    move-result-object v3

    .line 125
    invoke-virtual {v2, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    const-string v4, "layout"

    .line 126
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    iget-object v4, p0, Lorg/apache/log4j/config/PropertySetter;->obj:Ljava/lang/Object;

    instance-of v4, v4, Lorg/apache/log4j/Appender;

    if-nez v4, :cond_0

    .line 129
    :cond_2
    invoke-virtual {p0, v2, v3}, Lorg/apache/log4j/config/PropertySetter;->setProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public setProperty(Ljava/beans/PropertyDescriptor;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/log4j/config/PropertySetterException;
        }
    .end annotation

    .line 183
    invoke-virtual {p1}, Ljava/beans/PropertyDescriptor;->getWriteMethod()Ljava/lang/reflect/Method;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 187
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v0

    .line 188
    array-length v1, v0

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    const/4 v1, 0x0

    .line 194
    :try_start_0
    aget-object v3, v0, v1

    invoke-virtual {p0, p3, v3}, Lorg/apache/log4j/config/PropertySetter;->convertArg(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p3
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1

    if-eqz p3, :cond_0

    .line 203
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v3, "Setting property ["

    invoke-direct {v0, v3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string p2, "] to ["

    invoke-virtual {v0, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    const-string p2, "]."

    invoke-virtual {v0, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    .line 205
    :try_start_1
    iget-object p2, p0, Lorg/apache/log4j/config/PropertySetter;->obj:Ljava/lang/Object;

    new-array v0, v2, [Ljava/lang/Object;

    aput-object p3, v0, v1

    invoke-virtual {p1, p2, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 207
    new-instance p2, Lorg/apache/log4j/config/PropertySetterException;

    invoke-direct {p2, p1}, Lorg/apache/log4j/config/PropertySetterException;-><init>(Ljava/lang/Throwable;)V

    throw p2

    .line 200
    :cond_0
    new-instance p1, Lorg/apache/log4j/config/PropertySetterException;

    .line 201
    new-instance p2, Ljava/lang/StringBuffer;

    const-string p3, "Conversion to type ["

    invoke-direct {p2, p3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    aget-object p3, v0, v1

    invoke-virtual {p2, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    const-string p3, "] failed."

    invoke-virtual {p2, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p2

    .line 200
    invoke-direct {p1, p2}, Lorg/apache/log4j/config/PropertySetterException;-><init>(Ljava/lang/String;)V

    throw p1

    :catch_1
    move-exception p1

    .line 196
    new-instance p2, Lorg/apache/log4j/config/PropertySetterException;

    new-instance p3, Ljava/lang/StringBuffer;

    const-string v2, "Conversion to type ["

    invoke-direct {p3, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    aget-object v0, v0, v1

    invoke-virtual {p3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    const-string v0, "] failed. Reason: "

    .line 197
    invoke-virtual {p3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    invoke-virtual {p3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    .line 196
    invoke-direct {p2, p1}, Lorg/apache/log4j/config/PropertySetterException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 189
    :cond_1
    new-instance p1, Lorg/apache/log4j/config/PropertySetterException;

    const-string p2, "#params for setter != 1"

    invoke-direct {p1, p2}, Lorg/apache/log4j/config/PropertySetterException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 185
    :cond_2
    new-instance p1, Lorg/apache/log4j/config/PropertySetterException;

    new-instance p3, Ljava/lang/StringBuffer;

    const-string v0, "No setter for property ["

    invoke-direct {p3, v0}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string p2, "]."

    invoke-virtual {p3, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lorg/apache/log4j/config/PropertySetterException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setProperty(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    if-nez p2, :cond_0

    return-void

    .line 154
    :cond_0
    invoke-static {p1}, Ljava/beans/Introspector;->decapitalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 155
    invoke-virtual {p0, p1}, Lorg/apache/log4j/config/PropertySetter;->getPropertyDescriptor(Ljava/lang/String;)Ljava/beans/PropertyDescriptor;

    move-result-object v0

    if-nez v0, :cond_1

    .line 160
    new-instance p2, Ljava/lang/StringBuffer;

    const-string v0, "No such property ["

    invoke-direct {p2, v0}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string p1, "] in "

    invoke-virtual {p2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 161
    iget-object p1, p0, Lorg/apache/log4j/config/PropertySetter;->obj:Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string p1, "."

    invoke-virtual {p2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    .line 160
    invoke-static {p1}, Lorg/apache/log4j/helpers/LogLog;->warn(Ljava/lang/String;)V

    goto :goto_0

    .line 164
    :cond_1
    :try_start_0
    invoke-virtual {p0, v0, p1, p2}, Lorg/apache/log4j/config/PropertySetter;->setProperty(Ljava/beans/PropertyDescriptor;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/apache/log4j/config/PropertySetterException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 166
    new-instance v1, Ljava/lang/StringBuffer;

    const-string v2, "Failed to set property ["

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string p1, "] to value \""

    .line 167
    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string p1, "\". "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object p2, v0, Lorg/apache/log4j/config/PropertySetterException;->rootCause:Ljava/lang/Throwable;

    .line 166
    invoke-static {p1, p2}, Lorg/apache/log4j/helpers/LogLog;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method
