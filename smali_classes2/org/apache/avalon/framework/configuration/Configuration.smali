.class public interface abstract Lorg/apache/avalon/framework/configuration/Configuration;
.super Ljava/lang/Object;
.source "Configuration.java"


# virtual methods
.method public abstract getAttribute(Ljava/lang/String;)Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/avalon/framework/configuration/ConfigurationException;
        }
    .end annotation
.end method

.method public abstract getAttribute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract getAttributeAsBoolean(Ljava/lang/String;)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/avalon/framework/configuration/ConfigurationException;
        }
    .end annotation
.end method

.method public abstract getAttributeAsBoolean(Ljava/lang/String;Z)Z
.end method

.method public abstract getAttributeAsFloat(Ljava/lang/String;)F
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/avalon/framework/configuration/ConfigurationException;
        }
    .end annotation
.end method

.method public abstract getAttributeAsFloat(Ljava/lang/String;F)F
.end method

.method public abstract getAttributeAsInteger(Ljava/lang/String;)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/avalon/framework/configuration/ConfigurationException;
        }
    .end annotation
.end method

.method public abstract getAttributeAsInteger(Ljava/lang/String;I)I
.end method

.method public abstract getAttributeAsLong(Ljava/lang/String;)J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/avalon/framework/configuration/ConfigurationException;
        }
    .end annotation
.end method

.method public abstract getAttributeAsLong(Ljava/lang/String;J)J
.end method

.method public abstract getAttributeNames()[Ljava/lang/String;
.end method

.method public abstract getChild(Ljava/lang/String;)Lorg/apache/avalon/framework/configuration/Configuration;
.end method

.method public abstract getChild(Ljava/lang/String;Z)Lorg/apache/avalon/framework/configuration/Configuration;
.end method

.method public abstract getChildren()[Lorg/apache/avalon/framework/configuration/Configuration;
.end method

.method public abstract getChildren(Ljava/lang/String;)[Lorg/apache/avalon/framework/configuration/Configuration;
.end method

.method public abstract getLocation()Ljava/lang/String;
.end method

.method public abstract getName()Ljava/lang/String;
.end method

.method public abstract getNamespace()Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/avalon/framework/configuration/ConfigurationException;
        }
    .end annotation
.end method

.method public abstract getValue()Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/avalon/framework/configuration/ConfigurationException;
        }
    .end annotation
.end method

.method public abstract getValue(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract getValueAsBoolean()Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/avalon/framework/configuration/ConfigurationException;
        }
    .end annotation
.end method

.method public abstract getValueAsBoolean(Z)Z
.end method

.method public abstract getValueAsFloat()F
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/avalon/framework/configuration/ConfigurationException;
        }
    .end annotation
.end method

.method public abstract getValueAsFloat(F)F
.end method

.method public abstract getValueAsInteger()I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/avalon/framework/configuration/ConfigurationException;
        }
    .end annotation
.end method

.method public abstract getValueAsInteger(I)I
.end method

.method public abstract getValueAsLong()J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/avalon/framework/configuration/ConfigurationException;
        }
    .end annotation
.end method

.method public abstract getValueAsLong(J)J
.end method
