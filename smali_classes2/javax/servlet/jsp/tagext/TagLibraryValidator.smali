.class public abstract Ljavax/servlet/jsp/tagext/TagLibraryValidator;
.super Ljava/lang/Object;
.source "TagLibraryValidator.java"


# instance fields
.field private initParameters:Ljava/util/Map;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getInitParameters()Ljava/util/Map;
    .locals 1

    .line 126
    iget-object v0, p0, Ljavax/servlet/jsp/tagext/TagLibraryValidator;->initParameters:Ljava/util/Map;

    return-object v0
.end method

.method public release()V
    .locals 1

    const/4 v0, 0x0

    .line 150
    iput-object v0, p0, Ljavax/servlet/jsp/tagext/TagLibraryValidator;->initParameters:Ljava/util/Map;

    return-void
.end method

.method public setInitParameters(Ljava/util/Map;)V
    .locals 0

    .line 115
    iput-object p1, p0, Ljavax/servlet/jsp/tagext/TagLibraryValidator;->initParameters:Ljava/util/Map;

    return-void
.end method

.method public validate(Ljava/lang/String;Ljava/lang/String;Ljavax/servlet/jsp/tagext/PageData;)[Ljavax/servlet/jsp/tagext/ValidationMessage;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method
