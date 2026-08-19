.class Lcom/google/api/client/googleapis/services/AbstractGoogleClientRequest$ApiClientVersion;
.super Ljava/lang/Object;
.source "AbstractGoogleClientRequest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/api/client/googleapis/services/AbstractGoogleClientRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ApiClientVersion"
.end annotation


# static fields
.field private static final JAVA_VERSION:Ljava/lang/String;

.field private static final OS_NAME:Ljava/lang/String;

.field private static final OS_VERSION:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 139
    invoke-static {}, Lcom/google/api/client/googleapis/services/AbstractGoogleClientRequest$ApiClientVersion;->getJavaVersion()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/api/client/googleapis/services/AbstractGoogleClientRequest$ApiClientVersion;->JAVA_VERSION:Ljava/lang/String;

    const-string v0, "os.name"

    .line 140
    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/api/client/googleapis/services/AbstractGoogleClientRequest$ApiClientVersion;->formatName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/api/client/googleapis/services/AbstractGoogleClientRequest$ApiClientVersion;->OS_NAME:Ljava/lang/String;

    const-string v0, "os.version"

    .line 141
    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/api/client/googleapis/services/AbstractGoogleClientRequest$ApiClientVersion;->formatSemver(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/api/client/googleapis/services/AbstractGoogleClientRequest$ApiClientVersion;->OS_VERSION:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 138
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/google/api/client/googleapis/services/AbstractGoogleClient;)Ljava/lang/String;
    .locals 0

    .line 138
    invoke-static {p0}, Lcom/google/api/client/googleapis/services/AbstractGoogleClientRequest$ApiClientVersion;->build(Lcom/google/api/client/googleapis/services/AbstractGoogleClient;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static build(Lcom/google/api/client/googleapis/services/AbstractGoogleClient;)Ljava/lang/String;
    .locals 4

    const-string v0, "java/%s http-google-%s/%s %s/%s"

    const/4 v1, 0x5

    .line 145
    new-array v1, v1, [Ljava/lang/Object;

    sget-object v2, Lcom/google/api/client/googleapis/services/AbstractGoogleClientRequest$ApiClientVersion;->JAVA_VERSION:Ljava/lang/String;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    .line 148
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/google/api/client/googleapis/services/AbstractGoogleClientRequest$ApiClientVersion;->formatName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/4 v2, 0x1

    aput-object p0, v1, v2

    sget-object p0, Lcom/google/api/client/googleapis/GoogleUtils;->VERSION:Ljava/lang/String;

    .line 149
    invoke-static {p0}, Lcom/google/api/client/googleapis/services/AbstractGoogleClientRequest$ApiClientVersion;->formatSemver(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/4 v2, 0x2

    aput-object p0, v1, v2

    sget-object p0, Lcom/google/api/client/googleapis/services/AbstractGoogleClientRequest$ApiClientVersion;->OS_NAME:Ljava/lang/String;

    const/4 v2, 0x3

    aput-object p0, v1, v2

    sget-object p0, Lcom/google/api/client/googleapis/services/AbstractGoogleClientRequest$ApiClientVersion;->OS_VERSION:Ljava/lang/String;

    const/4 v2, 0x4

    aput-object p0, v1, v2

    .line 145
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static formatName(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 167
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    const-string v0, "[^\\w\\d\\-]"

    const-string v1, "-"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static formatSemver(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    const-string v0, "(\\d+\\.\\d+\\.\\d+).*"

    .line 172
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 173
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 p0, 0x1

    .line 174
    invoke-virtual {v0, p0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    return-object p0
.end method

.method private static getJavaVersion()Ljava/lang/String;
    .locals 2

    const-string v0, "java.version"

    .line 156
    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "9"

    .line 158
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v0, "9.0.0"

    return-object v0

    .line 161
    :cond_0
    invoke-static {v0}, Lcom/google/api/client/googleapis/services/AbstractGoogleClientRequest$ApiClientVersion;->formatSemver(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
