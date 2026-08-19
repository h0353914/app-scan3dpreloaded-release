.class public Lorg/apache/avalon/framework/CascadingError;
.super Ljava/lang/Error;
.source "CascadingError.java"

# interfaces
.implements Lorg/apache/avalon/framework/CascadingThrowable;


# instance fields
.field private final m_throwable:Ljava/lang/Throwable;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 30
    invoke-direct {p0, p1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    .line 31
    iput-object p2, p0, Lorg/apache/avalon/framework/CascadingError;->m_throwable:Ljava/lang/Throwable;

    return-void
.end method


# virtual methods
.method public final getCause()Ljava/lang/Throwable;
    .locals 1

    .line 41
    iget-object v0, p0, Lorg/apache/avalon/framework/CascadingError;->m_throwable:Ljava/lang/Throwable;

    return-object v0
.end method
