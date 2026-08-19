.class public Ljavax/servlet/jsp/tagext/TagVariableInfo;
.super Ljava/lang/Object;
.source "TagVariableInfo.java"


# instance fields
.field private className:Ljava/lang/String;

.field private declare:Z

.field private nameFromAttribute:Ljava/lang/String;

.field private nameGiven:Ljava/lang/String;

.field private scope:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZI)V
    .locals 0

    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 85
    iput-object p1, p0, Ljavax/servlet/jsp/tagext/TagVariableInfo;->nameGiven:Ljava/lang/String;

    .line 86
    iput-object p2, p0, Ljavax/servlet/jsp/tagext/TagVariableInfo;->nameFromAttribute:Ljava/lang/String;

    .line 87
    iput-object p3, p0, Ljavax/servlet/jsp/tagext/TagVariableInfo;->className:Ljava/lang/String;

    .line 88
    iput-boolean p4, p0, Ljavax/servlet/jsp/tagext/TagVariableInfo;->declare:Z

    .line 89
    iput p5, p0, Ljavax/servlet/jsp/tagext/TagVariableInfo;->scope:I

    return-void
.end method


# virtual methods
.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 122
    iget-object v0, p0, Ljavax/servlet/jsp/tagext/TagVariableInfo;->className:Ljava/lang/String;

    return-object v0
.end method

.method public getDeclare()Z
    .locals 1

    .line 132
    iget-boolean v0, p0, Ljavax/servlet/jsp/tagext/TagVariableInfo;->declare:Z

    return v0
.end method

.method public getNameFromAttribute()Ljava/lang/String;
    .locals 1

    .line 112
    iget-object v0, p0, Ljavax/servlet/jsp/tagext/TagVariableInfo;->nameFromAttribute:Ljava/lang/String;

    return-object v0
.end method

.method public getNameGiven()Ljava/lang/String;
    .locals 1

    .line 99
    iget-object v0, p0, Ljavax/servlet/jsp/tagext/TagVariableInfo;->nameGiven:Ljava/lang/String;

    return-object v0
.end method

.method public getScope()I
    .locals 1

    .line 142
    iget v0, p0, Ljavax/servlet/jsp/tagext/TagVariableInfo;->scope:I

    return v0
.end method
