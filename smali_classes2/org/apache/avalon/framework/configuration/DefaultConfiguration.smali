.class public Lorg/apache/avalon/framework/configuration/DefaultConfiguration;
.super Lorg/apache/avalon/framework/configuration/AbstractConfiguration;
.source "DefaultConfiguration.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field protected static final EMPTY_ARRAY:[Lorg/apache/avalon/framework/configuration/Configuration;


# instance fields
.field private m_attributes:Ljava/util/HashMap;

.field private m_children:Ljava/util/ArrayList;

.field private final m_location:Ljava/lang/String;

.field private final m_name:Ljava/lang/String;

.field private final m_namespace:Ljava/lang/String;

.field private final m_prefix:Ljava/lang/String;

.field private m_readOnly:Z

.field private m_value:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    .line 30
    new-array v0, v0, [Lorg/apache/avalon/framework/configuration/Configuration;

    sput-object v0, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->EMPTY_ARRAY:[Lorg/apache/avalon/framework/configuration/Configuration;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    const-string v0, ""

    const-string v1, ""

    .line 48
    invoke-direct {p0, p1, p2, v0, v1}, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 65
    invoke-direct {p0}, Lorg/apache/avalon/framework/configuration/AbstractConfiguration;-><init>()V

    .line 66
    iput-object p1, p0, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->m_name:Ljava/lang/String;

    .line 67
    iput-object p2, p0, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->m_location:Ljava/lang/String;

    .line 68
    iput-object p3, p0, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->m_namespace:Ljava/lang/String;

    .line 69
    iput-object p4, p0, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->m_prefix:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public addAttribute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 354
    invoke-virtual {p0}, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->checkWriteable()V

    .line 356
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->m_attributes:Ljava/util/HashMap;

    if-nez v0, :cond_0

    .line 358
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->m_attributes:Ljava/util/HashMap;

    .line 361
    :cond_0
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->m_attributes:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1
.end method

.method public addChild(Lorg/apache/avalon/framework/configuration/Configuration;)V
    .locals 1

    .line 370
    invoke-virtual {p0}, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->checkWriteable()V

    .line 372
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->m_children:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 374
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->m_children:Ljava/util/ArrayList;

    .line 377
    :cond_0
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->m_children:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public appendValueData(Ljava/lang/String;)V
    .locals 2

    .line 302
    invoke-virtual {p0}, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->checkWriteable()V

    .line 304
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->m_value:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 306
    iput-object p1, p0, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->m_value:Ljava/lang/String;

    goto :goto_0

    .line 310
    :cond_0
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p0, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->m_value:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->m_value:Ljava/lang/String;

    :goto_0
    return-void
.end method

.method protected final checkWriteable()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 426
    iget-boolean v0, p0, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->m_readOnly:Z

    if-nez v0, :cond_0

    return-void

    .line 428
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Configuration is read only and can not be modified"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getAttribute(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/avalon/framework/configuration/ConfigurationException;
        }
    .end annotation

    .line 214
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->m_attributes:Ljava/util/HashMap;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    return-object v0

    .line 223
    :cond_1
    new-instance v0, Lorg/apache/avalon/framework/configuration/ConfigurationException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "No attribute named \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string p1, "\" is "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string p1, "associated with the configuration element \""

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string p1, "\" at "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->getLocation()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lorg/apache/avalon/framework/configuration/ConfigurationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getAttributeNames()[Ljava/lang/String;
    .locals 2

    .line 175
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->m_attributes:Ljava/util/HashMap;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 177
    new-array v0, v1, [Ljava/lang/String;

    return-object v0

    .line 181
    :cond_0
    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    new-array v1, v1, [Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    return-object v0
.end method

.method public getChild(Ljava/lang/String;Z)Lorg/apache/avalon/framework/configuration/Configuration;
    .locals 4

    .line 238
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->m_children:Ljava/util/ArrayList;

    if-eqz v0, :cond_2

    .line 240
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-lt v1, v0, :cond_0

    goto :goto_1

    .line 243
    :cond_0
    iget-object v2, p0, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->m_children:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/avalon/framework/configuration/Configuration;

    .line 244
    invoke-interface {v2}, Lorg/apache/avalon/framework/configuration/Configuration;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    return-object v2

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    :goto_1
    if-eqz p2, :cond_3

    .line 253
    new-instance p2, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;

    const-string v0, "-"

    invoke-direct {p2, p1, v0}, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object p2

    :cond_3
    const/4 p1, 0x0

    return-object p1
.end method

.method public getChildCount()I
    .locals 1

    .line 401
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->m_children:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 406
    :cond_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getChildren()[Lorg/apache/avalon/framework/configuration/Configuration;
    .locals 2

    .line 193
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->m_children:Ljava/util/ArrayList;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 195
    new-array v0, v1, [Lorg/apache/avalon/framework/configuration/Configuration;

    return-object v0

    .line 199
    :cond_0
    new-array v1, v1, [Lorg/apache/avalon/framework/configuration/Configuration;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/apache/avalon/framework/configuration/Configuration;

    return-object v0
.end method

.method public getChildren(Ljava/lang/String;)[Lorg/apache/avalon/framework/configuration/Configuration;
    .locals 6

    .line 272
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->m_children:Ljava/util/ArrayList;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 274
    new-array p1, v1, [Lorg/apache/avalon/framework/configuration/Configuration;

    return-object p1

    .line 278
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 279
    iget-object v2, p0, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->m_children:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    move v3, v1

    :goto_0
    if-lt v3, v2, :cond_1

    .line 290
    new-array p1, v1, [Lorg/apache/avalon/framework/configuration/Configuration;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lorg/apache/avalon/framework/configuration/Configuration;

    return-object p1

    .line 283
    :cond_1
    iget-object v4, p0, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->m_children:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/avalon/framework/configuration/Configuration;

    .line 284
    invoke-interface {v4}, Lorg/apache/avalon/framework/configuration/Configuration;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 286
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method public getLocation()Ljava/lang/String;
    .locals 1

    .line 128
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->m_location:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 78
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->m_name:Ljava/lang/String;

    return-object v0
.end method

.method public getNamespace()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/avalon/framework/configuration/ConfigurationException;
        }
    .end annotation

    .line 88
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->m_namespace:Ljava/lang/String;

    if-eqz v0, :cond_0

    return-object v0

    .line 94
    :cond_0
    new-instance v0, Lorg/apache/avalon/framework/configuration/ConfigurationException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "No namespace (not even default \"\") is associated with the configuration element \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v2, "\" at "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->getLocation()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/avalon/framework/configuration/ConfigurationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected getPrefix()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/avalon/framework/configuration/ConfigurationException;
        }
    .end annotation

    .line 108
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->m_prefix:Ljava/lang/String;

    if-eqz v0, :cond_0

    return-object v0

    .line 114
    :cond_0
    new-instance v0, Lorg/apache/avalon/framework/configuration/ConfigurationException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "No prefix (not even default \"\") is associated with the configuration element \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v2, "\" at "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->getLocation()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/avalon/framework/configuration/ConfigurationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/avalon/framework/configuration/ConfigurationException;
        }
    .end annotation

    .line 157
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->m_value:Ljava/lang/String;

    if-eqz v0, :cond_0

    return-object v0

    .line 163
    :cond_0
    new-instance v0, Lorg/apache/avalon/framework/configuration/ConfigurationException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "No value is associated with the configuration element \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v2, "\" at "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->getLocation()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/avalon/framework/configuration/ConfigurationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 139
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->m_value:Ljava/lang/String;

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    return-object p1
.end method

.method public makeReadOnly()V
    .locals 1

    const/4 v0, 0x1

    .line 415
    iput-boolean v0, p0, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->m_readOnly:Z

    return-void
.end method

.method public removeChild(Lorg/apache/avalon/framework/configuration/Configuration;)V
    .locals 1

    .line 386
    invoke-virtual {p0}, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->checkWriteable()V

    .line 388
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->m_children:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    return-void

    .line 392
    :cond_0
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public setAttribute(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 334
    invoke-virtual {p0}, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->checkWriteable()V

    .line 336
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->m_attributes:Ljava/util/HashMap;

    if-nez v0, :cond_0

    .line 338
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->m_attributes:Ljava/util/HashMap;

    .line 340
    :cond_0
    iget-object v0, p0, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->m_attributes:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 0

    .line 321
    invoke-virtual {p0}, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->checkWriteable()V

    .line 323
    iput-object p1, p0, Lorg/apache/avalon/framework/configuration/DefaultConfiguration;->m_value:Ljava/lang/String;

    return-void
.end method
