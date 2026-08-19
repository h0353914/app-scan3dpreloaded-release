.class public Lorg/apache/avalon/framework/CascadingException;
.super Ljava/lang/Exception;
.source "CascadingException.java"

# interfaces
.implements Lorg/apache/avalon/framework/CascadingThrowable;


# instance fields
.field private final m_throwable:Ljava/lang/Throwable;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 32
    invoke-direct {p0, p1, v0}, Lorg/apache/avalon/framework/CascadingException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 43
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 44
    iput-object p2, p0, Lorg/apache/avalon/framework/CascadingException;->m_throwable:Ljava/lang/Throwable;

    return-void
.end method


# virtual methods
.method public final getCause()Ljava/lang/Throwable;
    .locals 1

    .line 54
    iget-object v0, p0, Lorg/apache/avalon/framework/CascadingException;->m_throwable:Ljava/lang/Throwable;

    return-object v0
.end method
