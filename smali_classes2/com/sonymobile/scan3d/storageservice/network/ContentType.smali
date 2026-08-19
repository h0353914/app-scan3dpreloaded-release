.class public final enum Lcom/sonymobile/scan3d/storageservice/network/ContentType;
.super Ljava/lang/Enum;
.source "ContentType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/storageservice/network/ContentType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/storageservice/network/ContentType;

.field public static final enum GLB:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

.field private static final GLB_MIME:Ljava/lang/String; = "model/gltf-binary"

.field public static final enum JPG:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

.field private static final JPG_MIME:Ljava/lang/String; = "image/jpeg"

.field public static final enum JSON:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

.field private static final JSON_MIME:Ljava/lang/String; = "application/json"

.field public static final enum MULTIPART:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

.field private static final MULTIPART_MIME:Ljava/lang/String; = "multipart/form-data"

.field public static final enum PLAIN_TEXT:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

.field private static final PLAIN_TEXT_MIME:Ljava/lang/String; = "text/plain"

.field public static final enum PNG:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

.field private static final PNG_MIME:Ljava/lang/String; = "image/png"

.field private static final SUFFIX_JPEG:Ljava/lang/String; = ".jpeg"

.field private static final SUFFIX_JSON:Ljava/lang/String; = ".json"

.field private static final SUFFIX_PNG:Ljava/lang/String; = ".png"

.field private static final SUFFIX_XML:Ljava/lang/String; = ".xml"

.field private static final SUFFIX_ZIP:Ljava/lang/String; = ".zip"

.field public static final enum UNKNOWN:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

.field public static final enum XML:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

.field private static final XML_MIME:Ljava/lang/String; = "application/xml"

.field public static final enum XML_TEXT:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

.field private static final XML_TEXT_MIME:Ljava/lang/String; = "text/xml"

.field public static final enum ZIP:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

.field private static final ZIP_MIME:Ljava/lang/String; = "application/zip"


# instance fields
.field private final mMimeType:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 13

    .line 20
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    const-string v1, "UNKNOWN"

    const-string v2, " "

    const/4 v3, 0x0

    invoke-direct {v0, v1, v3, v2}, Lcom/sonymobile/scan3d/storageservice/network/ContentType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->UNKNOWN:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    .line 24
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    const-string v1, "JSON"

    const-string v2, "application/json"

    const/4 v4, 0x1

    invoke-direct {v0, v1, v4, v2}, Lcom/sonymobile/scan3d/storageservice/network/ContentType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->JSON:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    .line 29
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    const-string v1, "XML"

    const-string v2, "application/xml"

    const/4 v5, 0x2

    invoke-direct {v0, v1, v5, v2}, Lcom/sonymobile/scan3d/storageservice/network/ContentType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->XML:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    .line 34
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    const-string v1, "XML_TEXT"

    const-string v2, "text/xml"

    const/4 v6, 0x3

    invoke-direct {v0, v1, v6, v2}, Lcom/sonymobile/scan3d/storageservice/network/ContentType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->XML_TEXT:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    .line 39
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    const-string v1, "ZIP"

    const-string v2, "application/zip"

    const/4 v7, 0x4

    invoke-direct {v0, v1, v7, v2}, Lcom/sonymobile/scan3d/storageservice/network/ContentType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->ZIP:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    .line 44
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    const-string v1, "MULTIPART"

    const-string v2, "multipart/form-data"

    const/4 v8, 0x5

    invoke-direct {v0, v1, v8, v2}, Lcom/sonymobile/scan3d/storageservice/network/ContentType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->MULTIPART:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    .line 49
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    const-string v1, "PLAIN_TEXT"

    const-string v2, "text/plain"

    const/4 v9, 0x6

    invoke-direct {v0, v1, v9, v2}, Lcom/sonymobile/scan3d/storageservice/network/ContentType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->PLAIN_TEXT:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    .line 54
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    const-string v1, "PNG"

    const-string v2, "image/png"

    const/4 v10, 0x7

    invoke-direct {v0, v1, v10, v2}, Lcom/sonymobile/scan3d/storageservice/network/ContentType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->PNG:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    .line 59
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    const-string v1, "JPG"

    const-string v2, "image/jpeg"

    const/16 v11, 0x8

    invoke-direct {v0, v1, v11, v2}, Lcom/sonymobile/scan3d/storageservice/network/ContentType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->JPG:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    .line 64
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    const-string v1, "GLB"

    const-string v2, "model/gltf-binary"

    const/16 v12, 0x9

    invoke-direct {v0, v1, v12, v2}, Lcom/sonymobile/scan3d/storageservice/network/ContentType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->GLB:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    const/16 v0, 0xa

    .line 16
    new-array v0, v0, [Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->UNKNOWN:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->JSON:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->XML:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->XML_TEXT:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    aput-object v1, v0, v6

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->ZIP:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    aput-object v1, v0, v7

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->MULTIPART:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    aput-object v1, v0, v8

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->PLAIN_TEXT:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    aput-object v1, v0, v9

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->PNG:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    aput-object v1, v0, v10

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->JPG:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    aput-object v1, v0, v11

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->GLB:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    aput-object v1, v0, v12

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->$VALUES:[Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 146
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 147
    iput-object p3, p0, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->mMimeType:Ljava/lang/String;

    return-void
.end method

.method public static getContentType(Ljava/io/File;)Lcom/sonymobile/scan3d/storageservice/network/ContentType;
    .locals 3

    .line 186
    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p0

    const/16 v0, 0x2e

    .line 187
    invoke-virtual {p0, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 188
    sget-object v1, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->UNKNOWN:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    if-ltz v0, :cond_1

    .line 191
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    const/4 v0, -0x1

    .line 193
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v2

    sparse-switch v2, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v2, ".json"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :sswitch_1
    const-string v2, ".jpeg"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 v0, 0x2

    goto :goto_0

    :sswitch_2
    const-string v2, ".zip"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :sswitch_3
    const-string v2, ".xml"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :sswitch_4
    const-string v2, ".png"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 v0, 0x3

    :cond_0
    :goto_0
    packed-switch v0, :pswitch_data_0

    goto :goto_1

    .line 207
    :pswitch_0
    sget-object v1, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->XML:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    goto :goto_1

    .line 204
    :pswitch_1
    sget-object v1, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->PNG:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    goto :goto_1

    .line 201
    :pswitch_2
    sget-object v1, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->JPG:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    goto :goto_1

    .line 198
    :pswitch_3
    sget-object v1, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->JSON:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    goto :goto_1

    .line 195
    :pswitch_4
    sget-object v1, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->ZIP:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    :cond_1
    :goto_1
    return-object v1

    nop

    :sswitch_data_0
    .sparse-switch
        0x169b3b -> :sswitch_4
        0x16b929 -> :sswitch_3
        0x16c033 -> :sswitch_2
        0x2ba1996 -> :sswitch_1
        0x2ba2616 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static getContentType(Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/network/ContentType;
    .locals 5

    .line 167
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 168
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    .line 170
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->values()[Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 171
    iget-object v4, v3, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->mMimeType:Ljava/lang/String;

    invoke-virtual {p0, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 176
    :cond_1
    sget-object p0, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->UNKNOWN:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/network/ContentType;
    .locals 1

    .line 16
    const-class v0, Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/storageservice/network/ContentType;
    .locals 1

    .line 16
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->$VALUES:[Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/storageservice/network/ContentType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    return-object v0
.end method


# virtual methods
.method public toMimeString()Ljava/lang/String;
    .locals 1

    .line 156
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->mMimeType:Ljava/lang/String;

    return-object v0
.end method
