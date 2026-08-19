.class public Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;
.super Ljava/lang/Object;
.source "XmlToJson.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfr/arnaudguyon/xmltojsonlib/XmlToJson;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


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

.field private mInputEncoding:Ljava/lang/String;

.field private mInputStreamSource:Ljava/io/InputStream;

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
.method public constructor <init>(Ljava/io/InputStream;Ljava/lang/String;)V
    .locals 1
    .param p1    # Ljava/io/InputStream;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "utf-8"

    .line 58
    iput-object v0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;->mInputEncoding:Ljava/lang/String;

    .line 59
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;->mForceListPaths:Ljava/util/HashSet;

    .line 60
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;->mAttributeNameReplacements:Ljava/util/HashMap;

    .line 61
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;->mContentNameReplacements:Ljava/util/HashMap;

    .line 62
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;->mForceStringForPath:Ljava/util/HashSet;

    .line 63
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;->mSkippedAttributes:Ljava/util/HashSet;

    .line 64
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;->mSkippedTags:Ljava/util/HashSet;

    .line 82
    iput-object p1, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;->mInputStreamSource:Ljava/io/InputStream;

    if-eqz p2, :cond_0

    goto :goto_0

    :cond_0
    const-string p2, "utf-8"

    .line 83
    :goto_0
    iput-object p2, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;->mInputEncoding:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "utf-8"

    .line 58
    iput-object v0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;->mInputEncoding:Ljava/lang/String;

    .line 59
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;->mForceListPaths:Ljava/util/HashSet;

    .line 60
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;->mAttributeNameReplacements:Ljava/util/HashMap;

    .line 61
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;->mContentNameReplacements:Ljava/util/HashMap;

    .line 62
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;->mForceStringForPath:Ljava/util/HashSet;

    .line 63
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;->mSkippedAttributes:Ljava/util/HashSet;

    .line 64
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;->mSkippedTags:Ljava/util/HashSet;

    .line 72
    new-instance v0, Ljava/io/StringReader;

    invoke-direct {v0, p1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;->mStringSource:Ljava/io/StringReader;

    return-void
.end method

.method static synthetic access$100(Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;)Ljava/io/StringReader;
    .locals 0

    .line 54
    iget-object p0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;->mStringSource:Ljava/io/StringReader;

    return-object p0
.end method

.method static synthetic access$200(Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;)Ljava/io/InputStream;
    .locals 0

    .line 54
    iget-object p0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;->mInputStreamSource:Ljava/io/InputStream;

    return-object p0
.end method

.method static synthetic access$300(Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;)Ljava/lang/String;
    .locals 0

    .line 54
    iget-object p0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;->mInputEncoding:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$400(Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;)Ljava/util/HashSet;
    .locals 0

    .line 54
    iget-object p0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;->mForceListPaths:Ljava/util/HashSet;

    return-object p0
.end method

.method static synthetic access$500(Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;)Ljava/util/HashMap;
    .locals 0

    .line 54
    iget-object p0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;->mAttributeNameReplacements:Ljava/util/HashMap;

    return-object p0
.end method

.method static synthetic access$600(Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;)Ljava/util/HashMap;
    .locals 0

    .line 54
    iget-object p0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;->mContentNameReplacements:Ljava/util/HashMap;

    return-object p0
.end method

.method static synthetic access$700(Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;)Ljava/util/HashSet;
    .locals 0

    .line 54
    iget-object p0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;->mForceStringForPath:Ljava/util/HashSet;

    return-object p0
.end method

.method static synthetic access$800(Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;)Ljava/util/HashSet;
    .locals 0

    .line 54
    iget-object p0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;->mSkippedAttributes:Ljava/util/HashSet;

    return-object p0
.end method

.method static synthetic access$900(Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;)Ljava/util/HashSet;
    .locals 0

    .line 54
    iget-object p0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;->mSkippedTags:Ljava/util/HashSet;

    return-object p0
.end method


# virtual methods
.method public build()Lfr/arnaudguyon/xmltojsonlib/XmlToJson;
    .locals 2

    .line 162
    new-instance v0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lfr/arnaudguyon/xmltojsonlib/XmlToJson;-><init>(Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;Lfr/arnaudguyon/xmltojsonlib/XmlToJson$1;)V

    return-object v0
.end method

.method public forceList(Ljava/lang/String;)Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 93
    iget-object v0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;->mForceListPaths:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public forceStringForPath(Ljava/lang/String;)Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 130
    iget-object v0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;->mForceStringForPath:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setAttributeName(Ljava/lang/String;Ljava/lang/String;)Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 105
    iget-object v0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;->mAttributeNameReplacements:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public setContentName(Ljava/lang/String;Ljava/lang/String;)Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 119
    iget-object v0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;->mContentNameReplacements:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public skipAttribute(Ljava/lang/String;)Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 152
    iget-object v0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;->mSkippedAttributes:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public skipTag(Ljava/lang/String;)Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 141
    iget-object v0, p0, Lfr/arnaudguyon/xmltojsonlib/XmlToJson$Builder;->mSkippedTags:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    return-object p0
.end method
