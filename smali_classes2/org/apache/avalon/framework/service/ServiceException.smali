.class public Lorg/apache/avalon/framework/service/ServiceException;
.super Lorg/apache/avalon/framework/CascadingException;
.source "ServiceException.java"


# instance fields
.field private final m_role:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 60
    invoke-direct {p0, v0, p1, v0}, Lorg/apache/avalon/framework/service/ServiceException;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 70
    invoke-direct {p0, p1, p2, v0}, Lorg/apache/avalon/framework/service/ServiceException;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 48
    invoke-direct {p0, p2, p3}, Lorg/apache/avalon/framework/CascadingException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 49
    iput-object p1, p0, Lorg/apache/avalon/framework/service/ServiceException;->m_role:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    const/4 v0, 0x0

    .line 37
    invoke-direct {p0, v0, p1, p2}, Lorg/apache/avalon/framework/service/ServiceException;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public getMessage()Ljava/lang/String;
    .locals 2

    .line 87
    iget-object v0, p0, Lorg/apache/avalon/framework/service/ServiceException;->m_role:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 89
    invoke-super {p0}, Lorg/apache/avalon/framework/CascadingException;->getMessage()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 93
    :cond_0
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-super {p0}, Lorg/apache/avalon/framework/CascadingException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v1, " (Role=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget-object v1, p0, Lorg/apache/avalon/framework/service/ServiceException;->m_role:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v1, "\')"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getRole()Ljava/lang/String;
    .locals 1

    .line 78
    iget-object v0, p0, Lorg/apache/avalon/framework/service/ServiceException;->m_role:Ljava/lang/String;

    return-object v0
.end method
