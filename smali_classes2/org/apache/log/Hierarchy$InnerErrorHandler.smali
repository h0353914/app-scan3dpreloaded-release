.class Lorg/apache/log/Hierarchy$InnerErrorHandler;
.super Ljava/lang/Object;
.source "Hierarchy.java"

# interfaces
.implements Lorg/apache/log/ErrorHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/log/Hierarchy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "InnerErrorHandler"
.end annotation


# instance fields
.field private final synthetic this$0:Lorg/apache/log/Hierarchy;


# direct methods
.method private constructor <init>(Lorg/apache/log/Hierarchy;)V
    .locals 0

    .line 176
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/apache/log/Hierarchy$InnerErrorHandler;->this$0:Lorg/apache/log/Hierarchy;

    return-void
.end method

.method synthetic constructor <init>(Lorg/apache/log/Hierarchy;Lorg/apache/log/Hierarchy$1;)V
    .locals 0

    .line 176
    invoke-direct {p0, p1}, Lorg/apache/log/Hierarchy$InnerErrorHandler;-><init>(Lorg/apache/log/Hierarchy;)V

    return-void
.end method


# virtual methods
.method public error(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/log/LogEvent;)V
    .locals 1

    .line 190
    iget-object v0, p0, Lorg/apache/log/Hierarchy$InnerErrorHandler;->this$0:Lorg/apache/log/Hierarchy;

    invoke-static {v0}, Lorg/apache/log/Hierarchy;->access$100(Lorg/apache/log/Hierarchy;)Lorg/apache/log/ErrorHandler;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3}, Lorg/apache/log/ErrorHandler;->error(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/log/LogEvent;)V

    return-void
.end method
