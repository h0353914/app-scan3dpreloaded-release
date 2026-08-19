.class public Lcom/sonymobile/scan3d/utils/LinkUtil;
.super Ljava/lang/Object;
.source "LinkUtil.java"


# static fields
.field private static final CUSTOMER_ID:Ljava/lang/String; = "ro.somc.customerid"

.field private static final GET_METHOD_NAME:Ljava/lang/String; = "get"

.field private static final SW_VARIANT:Ljava/lang/String; = "ro.semc.version.sw_variant"

.field private static final SYSTEM_PROPERTIES_CLASS_NAME:Ljava/lang/String; = "android.os.SystemProperties"

.field private static final TAG:Ljava/lang/String; = "com.sonymobile.scan3d.utils.LinkUtil"

.field private static final US_CUSTOMER_ID1:Ljava/lang/String; = "4431"

.field private static final US_CUSTOMER_ID2:Ljava/lang/String; = "9055"

.field private static final US_VARIANT:Ljava/lang/String; = "us"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static varargs createClickableLink(Landroid/content/Context;I[Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;)Landroid/text/SpannableStringBuilder;
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 73
    array-length v0, p2

    invoke-static {v0}, Lcom/sonymobile/scan3d/utils/LinkUtil;->generateGenericLinkTexts(I)[Ljava/lang/Object;

    move-result-object v0

    invoke-static {p0, p1, v0, p2}, Lcom/sonymobile/scan3d/utils/LinkUtil;->createClickableLink(Landroid/content/Context;I[Ljava/lang/Object;[Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;)Landroid/text/SpannableStringBuilder;

    move-result-object p0

    return-object p0
.end method

.method public static varargs createClickableLink(Landroid/content/Context;I[Ljava/lang/Object;[Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;)Landroid/text/SpannableStringBuilder;
    .locals 7
    .param p0    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 92
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const/4 p1, 0x0

    .line 93
    invoke-static {p0, p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;I)Landroid/text/Spanned;

    move-result-object p0

    .line 94
    new-instance p2, Landroid/text/SpannableStringBuilder;

    invoke-direct {p2, p0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 95
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result p0

    const-class v0, Landroid/text/style/URLSpan;

    invoke-virtual {p2, p1, p0, v0}, Landroid/text/SpannableStringBuilder;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Landroid/text/style/URLSpan;

    .line 97
    array-length v0, p0

    move v1, p1

    :goto_0
    if-ge p1, v0, :cond_1

    aget-object v2, p0, p1

    .line 98
    invoke-virtual {v2}, Landroid/text/style/URLSpan;->getURL()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_0

    invoke-virtual {v2}, Landroid/text/style/URLSpan;->getURL()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_0

    .line 99
    array-length v3, p3

    if-ge v1, v3, :cond_0

    add-int/lit8 v3, v1, 0x1

    .line 100
    aget-object v1, p3, v1

    .line 101
    new-instance v4, Lcom/sonymobile/scan3d/utils/LinkUtil$1;

    invoke-direct {v4, v1}, Lcom/sonymobile/scan3d/utils/LinkUtil$1;-><init>(Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;)V

    .line 108
    invoke-virtual {p2, v2}, Landroid/text/SpannableStringBuilder;->getSpanStart(Ljava/lang/Object;)I

    move-result v1

    .line 109
    invoke-virtual {p2, v2}, Landroid/text/SpannableStringBuilder;->getSpanEnd(Ljava/lang/Object;)I

    move-result v5

    .line 110
    invoke-virtual {p2, v2}, Landroid/text/SpannableStringBuilder;->getSpanFlags(Ljava/lang/Object;)I

    move-result v6

    .line 111
    invoke-virtual {p2, v4, v1, v5, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    move v1, v3

    .line 114
    :cond_0
    invoke-virtual {p2, v2}, Landroid/text/SpannableStringBuilder;->removeSpan(Ljava/lang/Object;)V

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_1
    return-object p2
.end method

.method private static generateGenericLinkTexts(I)[Ljava/lang/Object;
    .locals 4

    .line 129
    new-array v0, p0, [Ljava/lang/String;

    const/4 v1, 0x0

    :goto_0
    if-ge v1, p0, :cond_0

    .line 131
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "linktext"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method private static getSystemProperties(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    const-string v0, ""

    :try_start_0
    const-string v1, "android.os.SystemProperties"

    .line 154
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const/4 v2, 0x1

    .line 155
    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const-string v4, "get"

    .line 156
    invoke-virtual {v1, v4, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 157
    new-array v2, v2, [Ljava/lang/Object;

    aput-object p0, v2, v5

    .line 158
    invoke-virtual {v3, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 160
    sget-object v1, Lcom/sonymobile/scan3d/utils/LinkUtil;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to get system properties. "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    move-object p0, v0

    :goto_0
    return-object p0
.end method

.method public static isUSVariant()Z
    .locals 4

    const-string v0, "ro.somc.customerid"

    .line 142
    invoke-static {v0}, Lcom/sonymobile/scan3d/utils/LinkUtil;->getSystemProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 143
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_1

    const-string v0, "ro.semc.version.sw_variant"

    .line 144
    invoke-static {v0}, Lcom/sonymobile/scan3d/utils/LinkUtil;->getSystemProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 145
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, "us"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    move v2, v3

    :cond_0
    return v2

    :cond_1
    const-string v1, "4431"

    .line 147
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "9055"

    .line 148
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_2
    move v2, v3

    :cond_3
    return v2
.end method
