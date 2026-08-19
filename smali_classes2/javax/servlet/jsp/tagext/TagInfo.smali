.class public Ljavax/servlet/jsp/tagext/TagInfo;
.super Ljava/lang/Object;
.source "TagInfo.java"


# static fields
.field public static final BODY_CONTENT_EMPTY:Ljava/lang/String; = "EMPTY"

.field public static final BODY_CONTENT_JSP:Ljava/lang/String; = "JSP"

.field public static final BODY_CONTENT_TAG_DEPENDENT:Ljava/lang/String; = "TAGDEPENDENT"


# instance fields
.field private attributeInfo:[Ljavax/servlet/jsp/tagext/TagAttributeInfo;

.field private bodyContent:Ljava/lang/String;

.field private displayName:Ljava/lang/String;

.field private infoString:Ljava/lang/String;

.field private largeIcon:Ljava/lang/String;

.field private smallIcon:Ljava/lang/String;

.field private tagClassName:Ljava/lang/String;

.field private tagExtraInfo:Ljavax/servlet/jsp/tagext/TagExtraInfo;

.field private tagLibrary:Ljavax/servlet/jsp/tagext/TagLibraryInfo;

.field private tagName:Ljava/lang/String;

.field private tagVariableInfo:[Ljavax/servlet/jsp/tagext/TagVariableInfo;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljavax/servlet/jsp/tagext/TagLibraryInfo;Ljavax/servlet/jsp/tagext/TagExtraInfo;[Ljavax/servlet/jsp/tagext/TagAttributeInfo;)V
    .locals 0

    .line 114
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 115
    iput-object p1, p0, Ljavax/servlet/jsp/tagext/TagInfo;->tagName:Ljava/lang/String;

    .line 116
    iput-object p2, p0, Ljavax/servlet/jsp/tagext/TagInfo;->tagClassName:Ljava/lang/String;

    .line 117
    iput-object p3, p0, Ljavax/servlet/jsp/tagext/TagInfo;->bodyContent:Ljava/lang/String;

    .line 118
    iput-object p4, p0, Ljavax/servlet/jsp/tagext/TagInfo;->infoString:Ljava/lang/String;

    .line 119
    iput-object p5, p0, Ljavax/servlet/jsp/tagext/TagInfo;->tagLibrary:Ljavax/servlet/jsp/tagext/TagLibraryInfo;

    .line 120
    iput-object p6, p0, Ljavax/servlet/jsp/tagext/TagInfo;->tagExtraInfo:Ljavax/servlet/jsp/tagext/TagExtraInfo;

    .line 121
    iput-object p7, p0, Ljavax/servlet/jsp/tagext/TagInfo;->attributeInfo:[Ljavax/servlet/jsp/tagext/TagAttributeInfo;

    if-eqz p6, :cond_0

    .line 124
    invoke-virtual {p6, p0}, Ljavax/servlet/jsp/tagext/TagExtraInfo;->setTagInfo(Ljavax/servlet/jsp/tagext/TagInfo;)V

    :cond_0
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljavax/servlet/jsp/tagext/TagLibraryInfo;Ljavax/servlet/jsp/tagext/TagExtraInfo;[Ljavax/servlet/jsp/tagext/TagAttributeInfo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljavax/servlet/jsp/tagext/TagVariableInfo;)V
    .locals 0

    .line 161
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 162
    iput-object p1, p0, Ljavax/servlet/jsp/tagext/TagInfo;->tagName:Ljava/lang/String;

    .line 163
    iput-object p2, p0, Ljavax/servlet/jsp/tagext/TagInfo;->tagClassName:Ljava/lang/String;

    .line 164
    iput-object p3, p0, Ljavax/servlet/jsp/tagext/TagInfo;->bodyContent:Ljava/lang/String;

    .line 165
    iput-object p4, p0, Ljavax/servlet/jsp/tagext/TagInfo;->infoString:Ljava/lang/String;

    .line 166
    iput-object p5, p0, Ljavax/servlet/jsp/tagext/TagInfo;->tagLibrary:Ljavax/servlet/jsp/tagext/TagLibraryInfo;

    .line 167
    iput-object p6, p0, Ljavax/servlet/jsp/tagext/TagInfo;->tagExtraInfo:Ljavax/servlet/jsp/tagext/TagExtraInfo;

    .line 168
    iput-object p7, p0, Ljavax/servlet/jsp/tagext/TagInfo;->attributeInfo:[Ljavax/servlet/jsp/tagext/TagAttributeInfo;

    .line 169
    iput-object p8, p0, Ljavax/servlet/jsp/tagext/TagInfo;->displayName:Ljava/lang/String;

    .line 170
    iput-object p9, p0, Ljavax/servlet/jsp/tagext/TagInfo;->smallIcon:Ljava/lang/String;

    .line 171
    iput-object p10, p0, Ljavax/servlet/jsp/tagext/TagInfo;->largeIcon:Ljava/lang/String;

    .line 172
    iput-object p11, p0, Ljavax/servlet/jsp/tagext/TagInfo;->tagVariableInfo:[Ljavax/servlet/jsp/tagext/TagVariableInfo;

    if-eqz p6, :cond_0

    .line 175
    invoke-virtual {p6, p0}, Ljavax/servlet/jsp/tagext/TagExtraInfo;->setTagInfo(Ljavax/servlet/jsp/tagext/TagInfo;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public getAttributes()[Ljavax/servlet/jsp/tagext/TagAttributeInfo;
    .locals 1

    .line 198
    iget-object v0, p0, Ljavax/servlet/jsp/tagext/TagInfo;->attributeInfo:[Ljavax/servlet/jsp/tagext/TagAttributeInfo;

    return-object v0
.end method

.method public getBodyContent()Ljava/lang/String;
    .locals 1

    .line 276
    iget-object v0, p0, Ljavax/servlet/jsp/tagext/TagInfo;->bodyContent:Ljava/lang/String;

    return-object v0
.end method

.method public getDisplayName()Ljava/lang/String;
    .locals 1

    .line 331
    iget-object v0, p0, Ljavax/servlet/jsp/tagext/TagInfo;->displayName:Ljava/lang/String;

    return-object v0
.end method

.method public getInfoString()Ljava/lang/String;
    .locals 1

    .line 287
    iget-object v0, p0, Ljavax/servlet/jsp/tagext/TagInfo;->infoString:Ljava/lang/String;

    return-object v0
.end method

.method public getLargeIcon()Ljava/lang/String;
    .locals 1

    .line 351
    iget-object v0, p0, Ljavax/servlet/jsp/tagext/TagInfo;->largeIcon:Ljava/lang/String;

    return-object v0
.end method

.method public getSmallIcon()Ljava/lang/String;
    .locals 1

    .line 341
    iget-object v0, p0, Ljavax/servlet/jsp/tagext/TagInfo;->smallIcon:Ljava/lang/String;

    return-object v0
.end method

.method public getTagClassName()Ljava/lang/String;
    .locals 1

    .line 265
    iget-object v0, p0, Ljavax/servlet/jsp/tagext/TagInfo;->tagClassName:Ljava/lang/String;

    return-object v0
.end method

.method public getTagExtraInfo()Ljavax/servlet/jsp/tagext/TagExtraInfo;
    .locals 1

    .line 254
    iget-object v0, p0, Ljavax/servlet/jsp/tagext/TagInfo;->tagExtraInfo:Ljavax/servlet/jsp/tagext/TagExtraInfo;

    return-object v0
.end method

.method public getTagLibrary()Ljavax/servlet/jsp/tagext/TagLibraryInfo;
    .locals 1

    .line 317
    iget-object v0, p0, Ljavax/servlet/jsp/tagext/TagInfo;->tagLibrary:Ljavax/servlet/jsp/tagext/TagLibraryInfo;

    return-object v0
.end method

.method public getTagName()Ljava/lang/String;
    .locals 1

    .line 185
    iget-object v0, p0, Ljavax/servlet/jsp/tagext/TagInfo;->tagName:Ljava/lang/String;

    return-object v0
.end method

.method public getTagVariableInfos()[Ljavax/servlet/jsp/tagext/TagVariableInfo;
    .locals 1

    .line 361
    iget-object v0, p0, Ljavax/servlet/jsp/tagext/TagInfo;->tagVariableInfo:[Ljavax/servlet/jsp/tagext/TagVariableInfo;

    return-object v0
.end method

.method public getVariableInfo(Ljavax/servlet/jsp/tagext/TagData;)[Ljavax/servlet/jsp/tagext/VariableInfo;
    .locals 1

    .line 213
    invoke-virtual {p0}, Ljavax/servlet/jsp/tagext/TagInfo;->getTagExtraInfo()Ljavax/servlet/jsp/tagext/TagExtraInfo;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 217
    :cond_0
    invoke-virtual {v0, p1}, Ljavax/servlet/jsp/tagext/TagExtraInfo;->getVariableInfo(Ljavax/servlet/jsp/tagext/TagData;)[Ljavax/servlet/jsp/tagext/VariableInfo;

    move-result-object p1

    return-object p1
.end method

.method public isValid(Ljavax/servlet/jsp/tagext/TagData;)Z
    .locals 1

    .line 230
    invoke-virtual {p0}, Ljavax/servlet/jsp/tagext/TagInfo;->getTagExtraInfo()Ljavax/servlet/jsp/tagext/TagExtraInfo;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 p1, 0x1

    return p1

    .line 234
    :cond_0
    invoke-virtual {v0, p1}, Ljavax/servlet/jsp/tagext/TagExtraInfo;->isValid(Ljavax/servlet/jsp/tagext/TagData;)Z

    move-result p1

    return p1
.end method

.method public setTagExtraInfo(Ljavax/servlet/jsp/tagext/TagExtraInfo;)V
    .locals 0

    .line 244
    iput-object p1, p0, Ljavax/servlet/jsp/tagext/TagInfo;->tagExtraInfo:Ljavax/servlet/jsp/tagext/TagExtraInfo;

    return-void
.end method

.method public setTagLibrary(Ljavax/servlet/jsp/tagext/TagLibraryInfo;)V
    .locals 0

    .line 307
    iput-object p1, p0, Ljavax/servlet/jsp/tagext/TagInfo;->tagLibrary:Ljavax/servlet/jsp/tagext/TagLibraryInfo;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 370
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 371
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "name = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget-object v2, p0, Ljavax/servlet/jsp/tagext/TagInfo;->tagName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 372
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "class = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget-object v2, p0, Ljavax/servlet/jsp/tagext/TagInfo;->tagClassName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 373
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "body = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget-object v2, p0, Ljavax/servlet/jsp/tagext/TagInfo;->bodyContent:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 374
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "info = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget-object v2, p0, Ljavax/servlet/jsp/tagext/TagInfo;->infoString:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v1, "attributes = {\n"

    .line 375
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const/4 v1, 0x0

    .line 376
    :goto_0
    iget-object v2, p0, Ljavax/servlet/jsp/tagext/TagInfo;->attributeInfo:[Ljavax/servlet/jsp/tagext/TagAttributeInfo;

    array-length v2, v2

    if-lt v1, v2, :cond_0

    const-string v1, "\n}\n"

    .line 378
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 379
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 377
    :cond_0
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "\t"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget-object v3, p0, Ljavax/servlet/jsp/tagext/TagInfo;->attributeInfo:[Ljavax/servlet/jsp/tagext/TagAttributeInfo;

    aget-object v3, v3, v1

    invoke-virtual {v3}, Ljavax/servlet/jsp/tagext/TagAttributeInfo;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method
