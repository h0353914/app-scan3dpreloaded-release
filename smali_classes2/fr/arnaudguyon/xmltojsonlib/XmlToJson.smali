.class public Lfr/arnaudguyon/xmltojsonlib/XmlToJson;
.super Ljava/lang/Object;
.source "XmlToJson.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;
    }
.end annotation


# static fields
.field private static final DEFAULT_CONTENT_NAME:Ljava/lang/String; = "content"

.field private static final DEFAULT_ENCODING:Ljava/lang/String; = "utf-8"

.field private static final DEFAULT_INDENTATION:Ljava/lang/String; = "   "

.field private static final TAG:Ljava/lang/String; = "XmlToJson"


# instance fields
.field private mAttributeNameReplacements:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mContentNameReplacements:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mForceListPaths:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mForceStringForPath:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mIndentationPattern:Ljava/lang/String;

.field private mInputEncoding:Ljava/lang/String;

.field private mInputStreamSource:Ljava/io/InputStream;

.field private mJsonObject:Lorg/json/JSONObject;

.field private mSkippedAttributes:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mSkippedTags:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mStringSource:Ljava/io/StringReader;


# direct methods
.method private constructor <init>(Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;)V
    .locals 1

    .line 177
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "   "

    .line 49
    iput-object v0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->mIndentationPattern:Ljava/lang/String;

    .line 173
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->mSkippedAttributes:Ljava/util/HashSet;

    .line 174
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->mSkippedTags:Ljava/util/HashSet;

    .line 178
    invoke-static {p1}, Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;->access$100(Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;)Ljava/io/StringReader;

    move-result-object v0

    iput-object v0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->mStringSource:Ljava/io/StringReader;

    .line 179
    invoke-static {p1}, Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;->access$200(Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;)Ljava/io/InputStream;

    move-result-object v0

    iput-object v0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->mInputStreamSource:Ljava/io/InputStream;

    .line 180
    invoke-static {p1}, Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;->access$300(Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->mInputEncoding:Ljava/lang/String;

    .line 181
    invoke-static {p1}, Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;->access$400(Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;)Ljava/util/HashSet;

    move-result-object v0

    iput-object v0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->mForceListPaths:Ljava/util/HashSet;

    .line 182
    invoke-static {p1}, Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;->access$500(Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;)Ljava/util/HashMap;

    move-result-object v0

    iput-object v0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->mAttributeNameReplacements:Ljava/util/HashMap;

    .line 183
    invoke-static {p1}, Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;->access$600(Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;)Ljava/util/HashMap;

    move-result-object v0

    iput-object v0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->mContentNameReplacements:Ljava/util/HashMap;

    .line 184
    invoke-static {p1}, Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;->access$700(Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;)Ljava/util/HashSet;

    move-result-object v0

    iput-object v0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->mForceStringForPath:Ljava/util/HashSet;

    .line 185
    invoke-static {p1}, Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;->access$800(Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;)Ljava/util/HashSet;

    move-result-object v0

    iput-object v0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->mSkippedAttributes:Ljava/util/HashSet;

    .line 186
    invoke-static {p1}, Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;->access$900(Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;)Ljava/util/HashSet;

    move-result-object p1

    iput-object p1, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->mSkippedTags:Ljava/util/HashSet;

    .line 188
    invoke-direct {p0}, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->convertToJSONObject()Lorg/json/JSONObject;

    move-result-object p1

    iput-object p1, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->mJsonObject:Lorg/json/JSONObject;

    return-void
.end method

.method synthetic constructor <init>(Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;Lfr/arnaudguyon/xmltojsonlib/XmlToJson$1;)V
    .locals 0

    .line 43
    invoke-direct {p0, p1}, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;-><init>(Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;)V

    return-void
.end method

.method private convertTagToJson(Lfr/arnaudguyon/xmltojsonlib/Tag;Z)Lorg/json/JSONObject;
    .locals 6

    .line 300
    new-instance p2, Lorg/json/JSONObject;

    invoke-direct {p2}, Lorg/json/JSONObject;-><init>()V

    .line 303
    invoke-virtual {p1}, Lfr/arnaudguyon/xmltojsonlib/Tag;->getContent()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 304
    invoke-virtual {p1}, Lfr/arnaudguyon/xmltojsonlib/Tag;->getPath()Ljava/lang/String;

    move-result-object v0

    const-string v1, "content"

    .line 305
    invoke-direct {p0, v0, v1}, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->getContentNameReplacement(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 306
    invoke-virtual {p1}, Lfr/arnaudguyon/xmltojsonlib/Tag;->getContent()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v0, p2, v1, v2}, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->putContent(Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    .line 311
    :cond_0
    :try_start_0
    invoke-virtual {p1}, Lfr/arnaudguyon/xmltojsonlib/Tag;->getGroupedElements()Ljava/util/HashMap;

    move-result-object p1

    .line 312
    invoke-virtual {p1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 314
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne v1, v3, :cond_3

    .line 315
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfr/arnaudguyon/xmltojsonlib/Tag;

    .line 316
    invoke-direct {p0, v0}, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->isForcedList(Lfr/arnaudguyon/xmltojsonlib/Tag;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 317
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 318
    invoke-direct {p0, v0, v3}, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->convertTagToJson(Lfr/arnaudguyon/xmltojsonlib/Tag;Z)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 319
    invoke-virtual {v0}, Lfr/arnaudguyon/xmltojsonlib/Tag;->getName()Ljava/lang/String;

    move-result-object v0

    .line 320
    invoke-virtual {p2, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    .line 322
    :cond_1
    invoke-virtual {v0}, Lfr/arnaudguyon/xmltojsonlib/Tag;->hasChildren()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 323
    invoke-direct {p0, v0, v2}, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->convertTagToJson(Lfr/arnaudguyon/xmltojsonlib/Tag;Z)Lorg/json/JSONObject;

    move-result-object v1

    .line 324
    invoke-virtual {v0}, Lfr/arnaudguyon/xmltojsonlib/Tag;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    .line 326
    :cond_2
    invoke-virtual {v0}, Lfr/arnaudguyon/xmltojsonlib/Tag;->getPath()Ljava/lang/String;

    move-result-object v1

    .line 327
    invoke-virtual {v0}, Lfr/arnaudguyon/xmltojsonlib/Tag;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lfr/arnaudguyon/xmltojsonlib/Tag;->getContent()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v1, p2, v2, v0}, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->putContent(Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 331
    :cond_3
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 332
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lfr/arnaudguyon/xmltojsonlib/Tag;

    .line 333
    invoke-direct {p0, v5, v3}, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->convertTagToJson(Lfr/arnaudguyon/xmltojsonlib/Tag;Z)Lorg/json/JSONObject;

    move-result-object v5

    invoke-virtual {v1, v5}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_1

    .line 335
    :cond_4
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfr/arnaudguyon/xmltojsonlib/Tag;

    invoke-virtual {v0}, Lfr/arnaudguyon/xmltojsonlib/Tag;->getName()Ljava/lang/String;

    move-result-object v0

    .line 336
    invoke-virtual {p2, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    :cond_5
    return-object p2

    :catch_0
    move-exception p1

    .line 342
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    const/4 p1, 0x0

    return-object p1
.end method

.method private convertToJSONObject()Lorg/json/JSONObject;
    .locals 4
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 204
    :try_start_0
    new-instance v0, Lfr/arnaudguyon/xmltojsonlib/Tag;

    const-string v1, ""

    const-string v2, "xml"

    invoke-direct {v0, v1, v2}, Lfr/arnaudguyon/xmltojsonlib/Tag;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 206
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    move-result-object v1

    const/4 v2, 0x0

    .line 207
    invoke-virtual {v1, v2}, Lorg/xmlpull/v1/XmlPullParserFactory;->setNamespaceAware(Z)V

    .line 208
    invoke-virtual {v1}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v1

    .line 210
    invoke-direct {p0, v1}, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->setInput(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 212
    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v3

    :goto_0
    if-eqz v3, :cond_0

    .line 214
    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v3

    goto :goto_0

    .line 216
    :cond_0
    invoke-direct {p0, v0, v1}, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->readTags(Lfr/arnaudguyon/xmltojsonlib/Tag;Lorg/xmlpull/v1/XmlPullParser;)V

    .line 218
    invoke-direct {p0}, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->unsetInput()V

    .line 220
    invoke-direct {p0, v0, v2}, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->convertTagToJson(Lfr/arnaudguyon/xmltojsonlib/Tag;Z)Lorg/json/JSONObject;

    move-result-object v0
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    goto :goto_1

    :catch_1
    move-exception v0

    .line 222
    :goto_1
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    const/4 v0, 0x0

    return-object v0
.end method

.method private format(Lorg/json/JSONObject;Ljava/lang/StringBuilder;Ljava/lang/String;)V
    .locals 4

    .line 438
    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v0

    .line 439
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 440
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 441
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 442
    iget-object v2, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->mIndentationPattern:Ljava/lang/String;

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\""

    .line 443
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 444
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\": "

    .line 445
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 446
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 447
    instance-of v2, v1, Lorg/json/JSONObject;

    if-eqz v2, :cond_0

    .line 448
    check-cast v1, Lorg/json/JSONObject;

    .line 449
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "{\n"

    .line 450
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 451
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->mIndentationPattern:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v1, p2, v2}, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->format(Lorg/json/JSONObject;Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 452
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 453
    iget-object v1, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->mIndentationPattern:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    .line 454
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 455
    :cond_0
    instance-of v2, v1, Lorg/json/JSONArray;

    if-eqz v2, :cond_1

    .line 456
    check-cast v1, Lorg/json/JSONArray;

    .line 457
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->mIndentationPattern:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v1, p2, v2}, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->formatArray(Lorg/json/JSONArray;Ljava/lang/StringBuilder;Ljava/lang/String;)V

    goto :goto_1

    .line 459
    :cond_1
    invoke-direct {p0, v1, p2}, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->formatValue(Ljava/lang/Object;Ljava/lang/StringBuilder;)V

    .line 461
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, ",\n"

    .line 462
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_2
    const-string v1, "\n"

    .line 464
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_0

    :cond_3
    return-void
.end method

.method private formatArray(Lorg/json/JSONArray;Ljava/lang/StringBuilder;Ljava/lang/String;)V
    .locals 4

    const-string v0, "[\n"

    .line 470
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v0, 0x0

    .line 472
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v0, v1, :cond_3

    .line 473
    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->opt(I)Ljava/lang/Object;

    move-result-object v1

    .line 474
    instance-of v2, v1, Lorg/json/JSONObject;

    if-eqz v2, :cond_0

    .line 475
    check-cast v1, Lorg/json/JSONObject;

    .line 476
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 477
    iget-object v2, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->mIndentationPattern:Ljava/lang/String;

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "{\n"

    .line 478
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 479
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->mIndentationPattern:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v1, p2, v2}, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->format(Lorg/json/JSONObject;Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 480
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 481
    iget-object v1, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->mIndentationPattern:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    .line 482
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 483
    :cond_0
    instance-of v2, v1, Lorg/json/JSONArray;

    if-eqz v2, :cond_1

    .line 484
    check-cast v1, Lorg/json/JSONArray;

    .line 485
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->mIndentationPattern:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v1, p2, v2}, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->formatArray(Lorg/json/JSONArray;Ljava/lang/StringBuilder;Ljava/lang/String;)V

    goto :goto_1

    .line 487
    :cond_1
    invoke-direct {p0, v1, p2}, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->formatValue(Ljava/lang/Object;Ljava/lang/StringBuilder;)V

    .line 489
    :goto_1
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ge v0, v1, :cond_2

    const-string v1, ","

    .line 490
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_2
    const-string v1, "\n"

    .line 492
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 494
    :cond_3
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "]"

    .line 495
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method

.method private formatValue(Ljava/lang/Object;Ljava/lang/StringBuilder;)V
    .locals 1

    .line 499
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 500
    check-cast p1, Ljava/lang/String;

    const-string v0, "\""

    .line 501
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 502
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\""

    .line 503
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 504
    :cond_0
    instance-of v0, p1, Ljava/lang/Long;

    if-eqz v0, :cond_1

    .line 505
    check-cast p1, Ljava/lang/Long;

    .line 506
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 507
    :cond_1
    instance-of v0, p1, Ljava/lang/Integer;

    if-eqz v0, :cond_2

    .line 508
    check-cast p1, Ljava/lang/Integer;

    .line 509
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 510
    :cond_2
    instance-of v0, p1, Ljava/lang/Boolean;

    if-eqz v0, :cond_3

    .line 511
    check-cast p1, Ljava/lang/Boolean;

    .line 512
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 513
    :cond_3
    instance-of v0, p1, Ljava/lang/Double;

    if-eqz v0, :cond_4

    .line 514
    check-cast p1, Ljava/lang/Double;

    .line 515
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 517
    :cond_4
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_0
    return-void
.end method

.method private getAttributeNameReplacement(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 380
    iget-object v0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->mAttributeNameReplacements:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_0

    return-object p1

    :cond_0
    return-object p2
.end method

.method private getContentNameReplacement(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 388
    iget-object v0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->mContentNameReplacements:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_0

    return-object p1

    :cond_0
    return-object p2
.end method

.method private isForcedList(Lfr/arnaudguyon/xmltojsonlib/Tag;)Z
    .locals 1

    .line 375
    invoke-virtual {p1}, Lfr/arnaudguyon/xmltojsonlib/Tag;->getPath()Ljava/lang/String;

    move-result-object p1

    .line 376
    iget-object v0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->mForceListPaths:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method private putContent(Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    if-eqz p4, :cond_3

    .line 350
    :try_start_0
    iget-object v0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->mForceStringForPath:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 351
    invoke-virtual {p2, p3, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    :cond_0
    const-string p1, "true"

    .line 352
    invoke-virtual {p4, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 p1, 0x1

    .line 353
    invoke-virtual {p2, p3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    goto :goto_0

    :cond_1
    const-string p1, "false"

    .line 354
    invoke-virtual {p4, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_2

    const/4 p1, 0x0

    .line 355
    invoke-virtual {p2, p3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_2

    goto :goto_0

    .line 358
    :cond_2
    :try_start_1
    invoke-static {p4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    .line 359
    invoke-virtual {p2, p3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_2

    goto :goto_0

    .line 362
    :catch_0
    :try_start_2
    invoke-static {p4}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p1

    .line 363
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    invoke-virtual {p2, p3, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_0

    .line 365
    :catch_1
    :try_start_3
    invoke-virtual {p2, p3, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_2

    :catch_2
    :cond_3
    :goto_0
    return-void
.end method

.method private readTags(Lfr/arnaudguyon/xmltojsonlib/Tag;Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 8

    .line 254
    :cond_0
    :try_start_0
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_4

    .line 256
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v1

    .line 257
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lfr/arnaudguyon/xmltojsonlib/Tag;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 259
    iget-object v3, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->mSkippedTags:Ljava/util/HashSet;

    invoke-virtual {v3, v2}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v3

    .line 261
    new-instance v4, Lfr/arnaudguyon/xmltojsonlib/Tag;

    invoke-direct {v4, v2, v1}, Lfr/arnaudguyon/xmltojsonlib/Tag;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    if-nez v3, :cond_1

    .line 263
    invoke-virtual {p1, v4}, Lfr/arnaudguyon/xmltojsonlib/Tag;->addChild(Lfr/arnaudguyon/xmltojsonlib/Tag;)V

    .line 267
    :cond_1
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    move-result v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_3

    .line 269
    invoke-interface {p2, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v3

    .line 270
    invoke-interface {p2, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v5

    .line 271
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lfr/arnaudguyon/xmltojsonlib/Tag;->getPath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Lfr/arnaudguyon/xmltojsonlib/Tag;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 274
    iget-object v7, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->mSkippedAttributes:Ljava/util/HashSet;

    invoke-virtual {v7, v6}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    goto :goto_1

    .line 278
    :cond_2
    invoke-direct {p0, v6, v3}, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->getAttributeNameReplacement(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 279
    new-instance v7, Lfr/arnaudguyon/xmltojsonlib/Tag;

    invoke-direct {v7, v6, v3}, Lfr/arnaudguyon/xmltojsonlib/Tag;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 280
    invoke-virtual {v7, v5}, Lfr/arnaudguyon/xmltojsonlib/Tag;->setContent(Ljava/lang/String;)V

    .line 281
    invoke-virtual {v4, v7}, Lfr/arnaudguyon/xmltojsonlib/Tag;->addChild(Lfr/arnaudguyon/xmltojsonlib/Tag;)V

    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 284
    :cond_3
    invoke-direct {p0, v4, p2}, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->readTags(Lfr/arnaudguyon/xmltojsonlib/Tag;Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_2

    :cond_4
    const/4 v1, 0x4

    if-ne v0, v1, :cond_5

    .line 286
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v1

    .line 287
    invoke-virtual {p1, v1}, Lfr/arnaudguyon/xmltojsonlib/Tag;->setContent(Ljava/lang/String;)V

    goto :goto_2

    :cond_5
    const/4 v1, 0x3

    if-ne v0, v1, :cond_6

    return-void

    :cond_6
    const-string v1, "XmlToJson"

    .line 291
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "unknown xml eventType "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_2
    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_4

    :catch_0
    move-exception p1

    goto :goto_3

    :catch_1
    move-exception p1

    goto :goto_3

    :catch_2
    move-exception p1

    .line 295
    :goto_3
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_4
    return-void
.end method

.method private setInput(Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 2

    .line 228
    iget-object v0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->mStringSource:Ljava/io/StringReader;

    if-eqz v0, :cond_0

    .line 230
    :try_start_0
    invoke-interface {p1, v0}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/Reader;)V
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 232
    invoke-virtual {p1}, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V

    goto :goto_0

    .line 236
    :cond_0
    :try_start_1
    iget-object v0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->mInputStreamSource:Ljava/io/InputStream;

    iget-object v1, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->mInputEncoding:Ljava/lang/String;

    invoke-interface {p1, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    :catch_1
    move-exception p1

    .line 238
    invoke-virtual {p1}, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V

    :goto_0
    return-void
.end method

.method private unsetInput()V
    .locals 1

    .line 244
    iget-object v0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->mStringSource:Ljava/io/StringReader;

    if-eqz v0, :cond_0

    .line 245
    invoke-virtual {v0}, Ljava/io/StringReader;->close()V

    :cond_0
    return-void
.end method


# virtual methods
.method public toFormattedString()Ljava/lang/String;
    .locals 3

    .line 426
    iget-object v0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->mJsonObject:Lorg/json/JSONObject;

    if-eqz v0, :cond_0

    const-string v0, ""

    .line 428
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "{\n"

    .line 429
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 430
    iget-object v2, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->mJsonObject:Lorg/json/JSONObject;

    invoke-direct {p0, v2, v1, v0}, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->format(Lorg/json/JSONObject;Ljava/lang/StringBuilder;Ljava/lang/String;)V

    const-string v0, "}\n"

    .line 431
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 432
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public toFormattedString(Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    if-nez p1, :cond_0

    const-string p1, "   "

    .line 412
    iput-object p1, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->mIndentationPattern:Ljava/lang/String;

    goto :goto_0

    .line 414
    :cond_0
    iput-object p1, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->mIndentationPattern:Ljava/lang/String;

    .line 416
    :goto_0
    invoke-virtual {p0}, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->toFormattedString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public toJson()Lorg/json/JSONObject;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 197
    iget-object v0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->mJsonObject:Lorg/json/JSONObject;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 397
    iget-object v0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;->mJsonObject:Lorg/json/JSONObject;

    if-eqz v0, :cond_0

    .line 398
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method
