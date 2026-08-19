.class public final Lcom/sonymobile/scan3d/storageservice/ui/tips/TipParser;
.super Ljava/lang/Object;
.source "TipParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/storageservice/ui/tips/TipParser$TipPair;
    }
.end annotation


# static fields
.field public static final FIRST_TIME_TUTORIAL_ADV:I = 0x4

.field public static final FIRST_TIME_TUTORIAL_FACE:I = 0x1

.field public static final FIRST_TIME_TUTORIAL_FOOD:I = 0x3

.field public static final FIRST_TIME_TUTORIAL_HEAD:I = 0x2

.field public static final FIRST_TIME_TUTORIAL_SELFIE:I = 0x0

.field private static final PROMOTIONS_DATE_FORMAT:Ljava/lang/String; = "yyyy-MM-dd"

.field private static final PROMOTIONS_JSON_DESCRIPTION:Ljava/lang/String; = "json_description"

.field private static final PROMOTIONS_JSON_EXPIRE_DATE:Ljava/lang/String; = "json_expire"

.field private static final TAG:Ljava/lang/String; = "TipParser"

.field private static final TAG_CLIP:Ljava/lang/String; = "Clip"

.field private static final TAG_TIP:Ljava/lang/String; = "Tip"

.field private static final TAG_TIP_CATEGORY:Ljava/lang/String; = "TipCategory"

.field private static final TAG_VIDEO:Ljava/lang/String; = "Video"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static cleanTipList(Landroid/content/Context;Ljava/util/List;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;",
            ">;)V"
        }
    .end annotation

    .line 193
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipParser;->getDescriptionIdsFromPrefs(Landroid/content/Context;)Ljava/util/Set;

    move-result-object p0

    .line 194
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 195
    new-instance v1, Landroid/util/ArraySet;

    invoke-direct {v1}, Landroid/util/ArraySet;-><init>()V

    .line 196
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;

    .line 197
    invoke-virtual {v3}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->isRemovable()Z

    move-result v4

    if-nez v4, :cond_1

    goto :goto_0

    .line 203
    :cond_1
    invoke-virtual {v3}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->getExpireDate()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 206
    :try_start_0
    invoke-virtual {v0, v4}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v5

    .line 207
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-virtual {v5}, Ljava/util/Date;->getTime()J

    move-result-wide v8

    cmp-long v5, v6, v8

    if-lez v5, :cond_2

    .line 208
    invoke-interface {v1, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 211
    :catch_0
    sget-object v5, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipParser;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Wrong date format: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ". This promotion item will not be removed."

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v5, v4}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 215
    :cond_2
    :goto_1
    invoke-virtual {v3}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->getDescription()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {p0, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 216
    invoke-interface {v1, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 219
    :cond_3
    invoke-interface {p1, v1}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    return-void
.end method

.method private static createJSON(ILjava/lang/String;)Lorg/json/JSONObject;
    .locals 2
    .param p0    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 438
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "json_description"

    .line 439
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string p0, "json_expire"

    .line 440
    invoke-virtual {v0, p0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    return-object v0
.end method

.method public static getDescriptionIdsFromPrefs(Landroid/content/Context;)Ljava/util/Set;
    .locals 5
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 228
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const v1, 0x7f1001e5

    .line 230
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    new-instance v1, Landroid/util/ArraySet;

    invoke-direct {v1}, Landroid/util/ArraySet;-><init>()V

    .line 229
    invoke-interface {v0, p0, v1}, Landroid/content/SharedPreferences;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object p0

    .line 231
    new-instance v0, Landroid/util/ArraySet;

    invoke-direct {v0}, Landroid/util/ArraySet;-><init>()V

    .line 232
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 234
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v3, "json_description"

    .line 235
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 238
    :catch_0
    sget-object v2, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipParser;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Promotion json string bad format: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public static getFirstTimeTutorial(Landroid/content/Context;I)Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;
    .locals 1

    const v0, 0x7f130008

    .line 280
    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipParser;->parse(Landroid/content/Context;I)Ljava/util/List;

    move-result-object p0

    if-ltz p1, :cond_0

    .line 282
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 283
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return-object p0
.end method

.method public static getPromotionCards(Landroid/content/Context;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;",
            ">;"
        }
    .end annotation

    const v0, 0x7f130007

    .line 163
    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipParser;->parse(Landroid/content/Context;I)Ljava/util/List;

    move-result-object v0

    .line 164
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->getTips()Ljava/util/List;

    move-result-object v0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 165
    :goto_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Configuration;->getLayoutDirection()I

    move-result v1

    if-ne v1, v2, :cond_1

    .line 166
    invoke-static {v0}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 168
    :cond_1
    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/storageservice/Config;->customizePromotionsList(Landroid/content/Context;Ljava/util/List;)V

    .line 170
    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipParser;->cleanTipList(Landroid/content/Context;Ljava/util/List;)V

    return-object v0
.end method

.method public static getQuickTutorials(Landroid/content/Context;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;",
            ">;"
        }
    .end annotation

    const v0, 0x7f13000a

    .line 153
    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipParser;->parse(Landroid/content/Context;I)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static getScanDiscardedTips(Landroid/content/Context;II)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "II)",
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/ui/tips/TipParser$TipPair;",
            ">;"
        }
    .end annotation

    .line 324
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const v1, 0x7f13000a

    .line 326
    invoke-static {p0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipParser;->parse(Landroid/content/Context;I)Ljava/util/List;

    move-result-object v1

    const v2, 0x7f130009

    .line 327
    invoke-static {p0, v2}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipParser;->parse(Landroid/content/Context;I)Ljava/util/List;

    move-result-object p0

    invoke-interface {v1, p0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 329
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;

    .line 330
    invoke-virtual {v1, p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->getTipsForScanTypeOrPolicy(II)Ljava/util/List;

    move-result-object v2

    .line 331
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;

    .line 332
    invoke-virtual {v3}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->isForKeptScanOnly()Z

    move-result v4

    if-nez v4, :cond_1

    .line 333
    new-instance v4, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipParser$TipPair;

    invoke-direct {v4, v1, v3}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipParser$TipPair;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;)V

    .line 334
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    return-object v0
.end method

.method public static getScanKeptTips(Landroid/content/Context;II)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "II)",
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/ui/tips/TipParser$TipPair;",
            ">;"
        }
    .end annotation

    .line 298
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const v1, 0x7f13000a

    .line 300
    invoke-static {p0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipParser;->parse(Landroid/content/Context;I)Ljava/util/List;

    move-result-object v1

    const v2, 0x7f130009

    .line 301
    invoke-static {p0, v2}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipParser;->parse(Landroid/content/Context;I)Ljava/util/List;

    move-result-object p0

    invoke-interface {v1, p0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 303
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;

    .line 304
    invoke-virtual {v1, p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->getTipsForScanTypeOrPolicy(II)Ljava/util/List;

    move-result-object v2

    .line 305
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;

    .line 306
    new-instance v4, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipParser$TipPair;

    invoke-direct {v4, v1, v3}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipParser$TipPair;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;)V

    .line 307
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public static isPromotionListPopulated(Landroid/content/Context;)Z
    .locals 0

    .line 181
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipParser;->getPromotionCards(Landroid/content/Context;)Ljava/util/List;

    move-result-object p0

    .line 182
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    if-lez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private static parse(Landroid/content/Context;I)Ljava/util/List;
    .locals 12
    .param p1    # I
        .annotation build Landroidx/annotation/XmlRes;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I)",
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;",
            ">;"
        }
    .end annotation

    .line 351
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 352
    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Configuration;->getLayoutDirection()I

    move-result v1

    .line 353
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 356
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/Config;->isGooglePlayEnabled(Landroid/content/Context;)Z

    move-result p0

    .line 358
    :try_start_0
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    const/4 v0, 0x0

    .line 360
    :try_start_1
    invoke-interface {p1}, Landroid/content/res/XmlResourceParser;->getEventType()I

    move-result v3

    move-object v4, v0

    move-object v5, v4

    :goto_0
    const/4 v6, 0x0

    const/4 v7, 0x1

    if-eq v7, v3, :cond_a

    .line 362
    invoke-interface {p1}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    move-result-object v8

    const v9, 0x1487b

    const v10, -0xe084167

    const/4 v11, -0x1

    packed-switch v3, :pswitch_data_0

    goto/16 :goto_5

    .line 398
    :pswitch_0
    invoke-virtual {v8}, Ljava/lang/String;->hashCode()I

    move-result v3

    if-eq v3, v10, :cond_1

    if-eq v3, v9, :cond_0

    goto :goto_1

    :cond_0
    const-string v3, "Tip"

    invoke-virtual {v8, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    move v6, v7

    goto :goto_2

    :cond_1
    const-string v3, "TipCategory"

    invoke-virtual {v8, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_2

    :cond_2
    :goto_1
    move v6, v11

    :goto_2
    packed-switch v6, :pswitch_data_1

    goto/16 :goto_5

    :pswitch_1
    move-object v5, v0

    goto/16 :goto_5

    :pswitch_2
    move-object v4, v0

    goto/16 :goto_5

    .line 366
    :pswitch_3
    invoke-virtual {v8}, Ljava/lang/String;->hashCode()I

    move-result v3

    if-eq v3, v10, :cond_6

    if-eq v3, v9, :cond_5

    const v6, 0x201770

    if-eq v3, v6, :cond_4

    const v6, 0x4ed245b

    if-eq v3, v6, :cond_3

    goto :goto_3

    :cond_3
    const-string v3, "Video"

    invoke-virtual {v8, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    const/4 v6, 0x3

    goto :goto_4

    :cond_4
    const-string v3, "Clip"

    invoke-virtual {v8, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    const/4 v6, 0x2

    goto :goto_4

    :cond_5
    const-string v3, "Tip"

    invoke-virtual {v8, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    move v6, v7

    goto :goto_4

    :cond_6
    const-string v3, "TipCategory"

    invoke-virtual {v8, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    goto :goto_4

    :cond_7
    :goto_3
    move v6, v11

    :goto_4
    packed-switch v6, :pswitch_data_2

    goto :goto_5

    :pswitch_4
    if-eqz v5, :cond_9

    .line 387
    invoke-static {p1, p0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Video;->newInstance(Landroid/content/res/XmlResourceParser;Z)Lcom/sonymobile/scan3d/storageservice/ui/tips/Video;

    move-result-object v3

    .line 388
    invoke-virtual {v3}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Video;->isDisplayable()Z

    move-result v6

    if-eqz v6, :cond_9

    .line 389
    invoke-virtual {v5, v3}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->setAdditionalVideo(Lcom/sonymobile/scan3d/storageservice/ui/tips/Video;)V

    goto :goto_5

    :pswitch_5
    if-eqz v5, :cond_9

    .line 381
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Clip;->newInstance(Landroid/content/res/XmlResourceParser;)Lcom/sonymobile/scan3d/storageservice/ui/tips/Clip;

    move-result-object v3

    .line 382
    invoke-virtual {v5, v3}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->addClip(Lcom/sonymobile/scan3d/storageservice/ui/tips/Clip;)V

    goto :goto_5

    :pswitch_6
    if-eqz v4, :cond_9

    .line 375
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->newInstance(Landroid/content/res/XmlResourceParser;)Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;

    move-result-object v5

    .line 376
    invoke-virtual {v4, v5}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->addTip(Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;)V

    goto :goto_5

    .line 368
    :pswitch_7
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->newInstance(Landroid/content/res/XmlResourceParser;)Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;

    move-result-object v4

    .line 369
    invoke-virtual {v4}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->isGoogleDependent()Z

    move-result v3

    if-eqz v3, :cond_8

    if-eqz p0, :cond_9

    .line 370
    :cond_8
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 413
    :cond_9
    :goto_5
    invoke-interface {p1}, Landroid/content/res/XmlResourceParser;->next()I

    move-result v3
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_0

    :cond_a
    if-eqz p1, :cond_b

    .line 415
    :try_start_2
    invoke-interface {p1}, Landroid/content/res/XmlResourceParser;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    :cond_b
    if-ne v1, v7, :cond_d

    .line 420
    :goto_6
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result p0

    if-ge v6, p0, :cond_d

    .line 421
    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->hasTips()Z

    move-result p0

    if-eqz p0, :cond_c

    .line 422
    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->revertTips()V

    :cond_c
    add-int/lit8 v6, v6, 0x1

    goto :goto_6

    :cond_d
    return-object v2

    :catchall_0
    move-exception p0

    goto :goto_7

    :catch_0
    move-exception p0

    move-object v0, p0

    .line 358
    :try_start_3
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :goto_7
    if-eqz p1, :cond_f

    if-eqz v0, :cond_e

    .line 415
    :try_start_4
    invoke-interface {p1}, Landroid/content/res/XmlResourceParser;->close()V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_8

    :catch_1
    move-exception p1

    :try_start_5
    invoke-virtual {v0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_8

    :cond_e
    invoke-interface {p1}, Landroid/content/res/XmlResourceParser;->close()V

    :cond_f
    :goto_8
    throw p0
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    :catch_2
    move-exception p0

    .line 416
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "Parsing failed"

    invoke-direct {p1, v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_3
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
    .end packed-switch
.end method

.method public static saveRemovedItemToPrefs(ILjava/lang/String;Landroid/content/Context;)V
    .locals 4
    .param p0    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 256
    :try_start_0
    invoke-static {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipParser;->createJSON(ILjava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    .line 257
    invoke-static {p2}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const v1, 0x7f1001e5

    .line 259
    invoke-virtual {p2, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Landroid/util/ArraySet;

    invoke-direct {v3}, Landroid/util/ArraySet;-><init>()V

    .line 258
    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v2

    .line 260
    new-instance v3, Landroid/util/ArraySet;

    invoke-direct {v3}, Landroid/util/ArraySet;-><init>()V

    .line 261
    invoke-interface {v3, v2}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 262
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 263
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 264
    invoke-virtual {p2, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, p2, v3}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    .line 265
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 267
    :catch_0
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipParser;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Failed to add promotion to blacklist. Promo id: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method
