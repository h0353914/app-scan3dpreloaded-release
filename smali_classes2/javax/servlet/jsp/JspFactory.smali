.class public abstract Ljavax/servlet/jsp/JspFactory;
.super Ljava/lang/Object;
.source "JspFactory.java"


# static fields
.field private static deflt:Ljavax/servlet/jsp/JspFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized getDefaultFactory()Ljavax/servlet/jsp/JspFactory;
    .locals 2

    const-class v0, Ljavax/servlet/jsp/JspFactory;

    monitor-enter v0

    .line 104
    :try_start_0
    sget-object v1, Ljavax/servlet/jsp/JspFactory;->deflt:Ljavax/servlet/jsp/JspFactory;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static declared-synchronized setDefaultFactory(Ljavax/servlet/jsp/JspFactory;)V
    .locals 1

    const-class v0, Ljavax/servlet/jsp/JspFactory;

    monitor-enter v0

    .line 96
    :try_start_0
    sput-object p0, Ljavax/servlet/jsp/JspFactory;->deflt:Ljavax/servlet/jsp/JspFactory;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 97
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method


# virtual methods
.method public abstract getEngineInfo()Ljavax/servlet/jsp/JspEngineInfo;
.end method

.method public abstract getPageContext(Ljavax/servlet/Servlet;Ljavax/servlet/ServletRequest;Ljavax/servlet/ServletResponse;Ljava/lang/String;ZIZ)Ljavax/servlet/jsp/PageContext;
.end method

.method public abstract releasePageContext(Ljavax/servlet/jsp/PageContext;)V
.end method
