.class public Ljavax/servlet/jsp/tagext/TagData;
.super Ljava/lang/Object;
.source "TagData.java"

# interfaces
.implements Ljava/lang/Cloneable;


# static fields
.field public static final REQUEST_TIME_VALUE:Ljava/lang/Object;


# instance fields
.field private attributes:Ljava/util/Hashtable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 76
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Ljavax/servlet/jsp/tagext/TagData;->REQUEST_TIME_VALUE:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/util/Hashtable;)V
    .locals 0

    .line 116
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 117
    iput-object p1, p0, Ljavax/servlet/jsp/tagext/TagData;->attributes:Ljava/util/Hashtable;

    return-void
.end method

.method public constructor <init>([[Ljava/lang/Object;)V
    .locals 6

    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-nez p1, :cond_0

    .line 96
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Ljavax/servlet/jsp/tagext/TagData;->attributes:Ljava/util/Hashtable;

    goto :goto_0

    .line 98
    :cond_0
    new-instance v0, Ljava/util/Hashtable;

    array-length v1, p1

    invoke-direct {v0, v1}, Ljava/util/Hashtable;-><init>(I)V

    iput-object v0, p0, Ljavax/servlet/jsp/tagext/TagData;->attributes:Ljava/util/Hashtable;

    :goto_0
    if-eqz p1, :cond_2

    const/4 v0, 0x0

    move v1, v0

    .line 102
    :goto_1
    array-length v2, p1

    if-lt v1, v2, :cond_1

    goto :goto_2

    .line 103
    :cond_1
    iget-object v2, p0, Ljavax/servlet/jsp/tagext/TagData;->attributes:Ljava/util/Hashtable;

    aget-object v3, p1, v1

    aget-object v3, v3, v0

    aget-object v4, p1, v1

    const/4 v5, 0x1

    aget-object v4, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_2
    :goto_2
    return-void
.end method


# virtual methods
.method public getAttribute(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1

    .line 139
    iget-object v0, p0, Ljavax/servlet/jsp/tagext/TagData;->attributes:Ljava/util/Hashtable;

    invoke-virtual {v0, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getAttributeString(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 161
    iget-object v0, p0, Ljavax/servlet/jsp/tagext/TagData;->attributes:Ljava/util/Hashtable;

    invoke-virtual {v0, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 165
    :cond_0
    check-cast p1, Ljava/lang/String;

    return-object p1
.end method

.method public getAttributes()Ljava/util/Enumeration;
    .locals 1

    .line 175
    iget-object v0, p0, Ljavax/servlet/jsp/tagext/TagData;->attributes:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    const-string v0, "id"

    .line 127
    invoke-virtual {p0, v0}, Ljavax/servlet/jsp/tagext/TagData;->getAttributeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setAttribute(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    .line 150
    iget-object v0, p0, Ljavax/servlet/jsp/tagext/TagData;->attributes:Ljava/util/Hashtable;

    invoke-virtual {v0, p1, p2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
