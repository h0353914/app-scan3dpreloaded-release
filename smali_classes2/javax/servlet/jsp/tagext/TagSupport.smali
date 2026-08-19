.class public Ljavax/servlet/jsp/tagext/TagSupport;
.super Ljava/lang/Object;
.source "TagSupport.java"

# interfaces
.implements Ljavax/servlet/jsp/tagext/IterationTag;
.implements Ljava/io/Serializable;


# static fields
.field static synthetic class$javax$servlet$jsp$tagext$Tag:Ljava/lang/Class;


# instance fields
.field protected id:Ljava/lang/String;

.field protected pageContext:Ljavax/servlet/jsp/PageContext;

.field private parent:Ljavax/servlet/jsp/tagext/Tag;

.field private values:Ljava/util/Hashtable;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 152
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 1

    .line 82
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    new-instance v0, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static final findAncestorWithClass(Ljavax/servlet/jsp/tagext/Tag;Ljava/lang/Class;)Ljavax/servlet/jsp/tagext/Tag;
    .locals 3

    const/4 v0, 0x0

    if-eqz p0, :cond_6

    if-eqz p1, :cond_6

    .line 121
    sget-object v1, Ljavax/servlet/jsp/tagext/TagSupport;->class$javax$servlet$jsp$tagext$Tag:Ljava/lang/Class;

    if-nez v1, :cond_0

    const-string v1, "javax.servlet.jsp.tagext.Tag"

    invoke-static {v1}, Ljavax/servlet/jsp/tagext/TagSupport;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Ljavax/servlet/jsp/tagext/TagSupport;->class$javax$servlet$jsp$tagext$Tag:Ljava/lang/Class;

    :cond_0
    invoke-virtual {v1, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {p1}, Ljava/lang/Class;->isInterface()Z

    move-result v1

    if-nez v1, :cond_2

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    .line 129
    :cond_2
    invoke-interface {p0}, Ljavax/servlet/jsp/tagext/Tag;->getParent()Ljavax/servlet/jsp/tagext/Tag;

    move-result-object p0

    if-nez p0, :cond_3

    return-object v0

    :cond_3
    if-eqz v1, :cond_4

    .line 135
    invoke-virtual {p1, p0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    :cond_4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_2

    :cond_5
    return-object p0

    :cond_6
    :goto_0
    return-object v0
.end method


# virtual methods
.method public doAfterBody()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/jsp/JspException;
        }
    .end annotation

    const/4 v0, 0x0

    return v0
.end method

.method public doEndTag()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/jsp/JspException;
        }
    .end annotation

    const/4 v0, 0x6

    return v0
.end method

.method public doStartTag()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/jsp/JspException;
        }
    .end annotation

    const/4 v0, 0x0

    return v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    .line 243
    iget-object v0, p0, Ljavax/servlet/jsp/tagext/TagSupport;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getParent()Ljavax/servlet/jsp/tagext/Tag;
    .locals 1

    .line 223
    iget-object v0, p0, Ljavax/servlet/jsp/tagext/TagSupport;->parent:Ljavax/servlet/jsp/tagext/Tag;

    return-object v0
.end method

.method public getValue(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1

    .line 279
    iget-object v0, p0, Ljavax/servlet/jsp/tagext/TagSupport;->values:Ljava/util/Hashtable;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 282
    :cond_0
    invoke-virtual {v0, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getValues()Ljava/util/Enumeration;
    .locals 1

    .line 305
    iget-object v0, p0, Ljavax/servlet/jsp/tagext/TagSupport;->values:Ljava/util/Hashtable;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 308
    :cond_0
    invoke-virtual {v0}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public release()V
    .locals 1

    const/4 v0, 0x0

    .line 201
    iput-object v0, p0, Ljavax/servlet/jsp/tagext/TagSupport;->parent:Ljavax/servlet/jsp/tagext/Tag;

    return-void
.end method

.method public removeValue(Ljava/lang/String;)V
    .locals 1

    .line 293
    iget-object v0, p0, Ljavax/servlet/jsp/tagext/TagSupport;->values:Ljava/util/Hashtable;

    if-eqz v0, :cond_0

    .line 294
    invoke-virtual {v0, p1}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method public setId(Ljava/lang/String;)V
    .locals 0

    .line 233
    iput-object p1, p0, Ljavax/servlet/jsp/tagext/TagSupport;->id:Ljava/lang/String;

    return-void
.end method

.method public setPageContext(Ljavax/servlet/jsp/PageContext;)V
    .locals 0

    .line 254
    iput-object p1, p0, Ljavax/servlet/jsp/tagext/TagSupport;->pageContext:Ljavax/servlet/jsp/PageContext;

    return-void
.end method

.method public setParent(Ljavax/servlet/jsp/tagext/Tag;)V
    .locals 0

    .line 212
    iput-object p1, p0, Ljavax/servlet/jsp/tagext/TagSupport;->parent:Ljavax/servlet/jsp/tagext/Tag;

    return-void
.end method

.method public setValue(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    .line 265
    iget-object v0, p0, Ljavax/servlet/jsp/tagext/TagSupport;->values:Ljava/util/Hashtable;

    if-nez v0, :cond_0

    .line 266
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Ljavax/servlet/jsp/tagext/TagSupport;->values:Ljava/util/Hashtable;

    .line 268
    :cond_0
    iget-object v0, p0, Ljavax/servlet/jsp/tagext/TagSupport;->values:Ljava/util/Hashtable;

    invoke-virtual {v0, p1, p2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
