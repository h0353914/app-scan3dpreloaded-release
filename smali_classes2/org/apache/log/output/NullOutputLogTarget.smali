.class public Lorg/apache/log/output/NullOutputLogTarget;
.super Lorg/apache/log/output/AbstractOutputTarget;
.source "NullOutputLogTarget.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Lorg/apache/log/output/AbstractOutputTarget;-><init>()V

    .line 20
    invoke-virtual {p0}, Lorg/apache/log/output/NullOutputLogTarget;->open()V

    return-void
.end method


# virtual methods
.method protected write(Ljava/lang/String;)V
    .locals 0

    return-void
.end method
