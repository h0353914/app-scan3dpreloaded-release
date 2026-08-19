.class public Ljavax/servlet/jsp/tagext/ValidationMessage;
.super Ljava/lang/Object;
.source "ValidationMessage.java"


# instance fields
.field private id:Ljava/lang/String;

.field private message:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    iput-object p1, p0, Ljavax/servlet/jsp/tagext/ValidationMessage;->id:Ljava/lang/String;

    .line 90
    iput-object p2, p0, Ljavax/servlet/jsp/tagext/ValidationMessage;->message:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getId()Ljava/lang/String;
    .locals 1

    .line 101
    iget-object v0, p0, Ljavax/servlet/jsp/tagext/ValidationMessage;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 1

    .line 110
    iget-object v0, p0, Ljavax/servlet/jsp/tagext/ValidationMessage;->message:Ljava/lang/String;

    return-object v0
.end method
