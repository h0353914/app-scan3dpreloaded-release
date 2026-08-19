.class public abstract Ljavax/servlet/jsp/tagext/TagExtraInfo;
.super Ljava/lang/Object;
.source "TagExtraInfo.java"


# instance fields
.field private tagInfo:Ljavax/servlet/jsp/tagext/TagInfo;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final getTagInfo()Ljavax/servlet/jsp/tagext/TagInfo;
    .locals 1

    .line 127
    iget-object v0, p0, Ljavax/servlet/jsp/tagext/TagExtraInfo;->tagInfo:Ljavax/servlet/jsp/tagext/TagInfo;

    return-object v0
.end method

.method public getVariableInfo(Ljavax/servlet/jsp/tagext/TagData;)[Ljavax/servlet/jsp/tagext/VariableInfo;
    .locals 0

    const/4 p1, 0x0

    .line 97
    new-array p1, p1, [Ljavax/servlet/jsp/tagext/VariableInfo;

    return-object p1
.end method

.method public isValid(Ljavax/servlet/jsp/tagext/TagData;)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method

.method public final setTagInfo(Ljavax/servlet/jsp/tagext/TagInfo;)V
    .locals 0

    .line 118
    iput-object p1, p0, Ljavax/servlet/jsp/tagext/TagExtraInfo;->tagInfo:Ljavax/servlet/jsp/tagext/TagInfo;

    return-void
.end method
