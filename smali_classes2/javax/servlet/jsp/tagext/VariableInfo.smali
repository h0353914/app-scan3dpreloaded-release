.class public Ljavax/servlet/jsp/tagext/VariableInfo;
.super Ljava/lang/Object;
.source "VariableInfo.java"


# static fields
.field public static final AT_BEGIN:I = 0x1

.field public static final AT_END:I = 0x2

.field public static final NESTED:I


# instance fields
.field private className:Ljava/lang/String;

.field private declare:Z

.field private scope:I

.field private varName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;ZI)V
    .locals 0

    .line 191
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 192
    iput-object p1, p0, Ljavax/servlet/jsp/tagext/VariableInfo;->varName:Ljava/lang/String;

    .line 193
    iput-object p2, p0, Ljavax/servlet/jsp/tagext/VariableInfo;->className:Ljava/lang/String;

    .line 194
    iput-boolean p3, p0, Ljavax/servlet/jsp/tagext/VariableInfo;->declare:Z

    .line 195
    iput p4, p0, Ljavax/servlet/jsp/tagext/VariableInfo;->scope:I

    return-void
.end method


# virtual methods
.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 200
    iget-object v0, p0, Ljavax/servlet/jsp/tagext/VariableInfo;->className:Ljava/lang/String;

    return-object v0
.end method

.method public getDeclare()Z
    .locals 1

    .line 201
    iget-boolean v0, p0, Ljavax/servlet/jsp/tagext/VariableInfo;->declare:Z

    return v0
.end method

.method public getScope()I
    .locals 1

    .line 202
    iget v0, p0, Ljavax/servlet/jsp/tagext/VariableInfo;->scope:I

    return v0
.end method

.method public getVarName()Ljava/lang/String;
    .locals 1

    .line 199
    iget-object v0, p0, Ljavax/servlet/jsp/tagext/VariableInfo;->varName:Ljava/lang/String;

    return-object v0
.end method
