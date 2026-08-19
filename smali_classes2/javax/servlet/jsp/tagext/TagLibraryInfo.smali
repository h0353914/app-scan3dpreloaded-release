.class public abstract Ljavax/servlet/jsp/tagext/TagLibraryInfo;
.super Ljava/lang/Object;
.source "TagLibraryInfo.java"


# instance fields
.field protected info:Ljava/lang/String;

.field protected jspversion:Ljava/lang/String;

.field protected prefix:Ljava/lang/String;

.field protected shortname:Ljava/lang/String;

.field protected tags:[Ljavax/servlet/jsp/tagext/TagInfo;

.field protected tlibversion:Ljava/lang/String;

.field protected uri:Ljava/lang/String;

.field protected urn:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    iput-object p1, p0, Ljavax/servlet/jsp/tagext/TagLibraryInfo;->prefix:Ljava/lang/String;

    .line 88
    iput-object p2, p0, Ljavax/servlet/jsp/tagext/TagLibraryInfo;->uri:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getInfoString()Ljava/lang/String;
    .locals 1

    .line 147
    iget-object v0, p0, Ljavax/servlet/jsp/tagext/TagLibraryInfo;->info:Ljava/lang/String;

    return-object v0
.end method

.method public getPrefixString()Ljava/lang/String;
    .locals 1

    .line 111
    iget-object v0, p0, Ljavax/servlet/jsp/tagext/TagLibraryInfo;->prefix:Ljava/lang/String;

    return-object v0
.end method

.method public getReliableURN()Ljava/lang/String;
    .locals 1

    .line 136
    iget-object v0, p0, Ljavax/servlet/jsp/tagext/TagLibraryInfo;->urn:Ljava/lang/String;

    return-object v0
.end method

.method public getRequiredVersion()Ljava/lang/String;
    .locals 1

    .line 159
    iget-object v0, p0, Ljavax/servlet/jsp/tagext/TagLibraryInfo;->jspversion:Ljava/lang/String;

    return-object v0
.end method

.method public getShortName()Ljava/lang/String;
    .locals 1

    .line 124
    iget-object v0, p0, Ljavax/servlet/jsp/tagext/TagLibraryInfo;->shortname:Ljava/lang/String;

    return-object v0
.end method

.method public getTag(Ljava/lang/String;)Ljavax/servlet/jsp/tagext/TagInfo;
    .locals 4

    .line 183
    invoke-virtual {p0}, Ljavax/servlet/jsp/tagext/TagLibraryInfo;->getTags()[Ljavax/servlet/jsp/tagext/TagInfo;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    .line 185
    array-length v2, v0

    if-nez v2, :cond_0

    goto :goto_1

    :cond_0
    const/4 v2, 0x0

    .line 190
    :goto_0
    array-length v3, v0

    if-lt v2, v3, :cond_1

    return-object v1

    .line 191
    :cond_1
    aget-object v3, v0, v2

    invoke-virtual {v3}, Ljavax/servlet/jsp/tagext/TagInfo;->getTagName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 192
    aget-object p1, v0, v2

    return-object p1

    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 186
    :cond_3
    :goto_1
    sget-object p1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v0, "No tags"

    invoke-virtual {p1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    return-object v1
.end method

.method public getTags()[Ljavax/servlet/jsp/tagext/TagInfo;
    .locals 1

    .line 170
    iget-object v0, p0, Ljavax/servlet/jsp/tagext/TagLibraryInfo;->tags:[Ljavax/servlet/jsp/tagext/TagInfo;

    return-object v0
.end method

.method public getURI()Ljava/lang/String;
    .locals 1

    .line 101
    iget-object v0, p0, Ljavax/servlet/jsp/tagext/TagLibraryInfo;->uri:Ljava/lang/String;

    return-object v0
.end method
