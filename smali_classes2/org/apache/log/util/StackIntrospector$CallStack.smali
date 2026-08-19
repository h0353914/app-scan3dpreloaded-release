.class final Lorg/apache/log/util/StackIntrospector$CallStack;
.super Ljava/lang/SecurityManager;
.source "StackIntrospector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/log/util/StackIntrospector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "CallStack"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 27
    invoke-direct {p0}, Ljava/lang/SecurityManager;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/apache/log/util/StackIntrospector$1;)V
    .locals 0

    .line 27
    invoke-direct {p0}, Lorg/apache/log/util/StackIntrospector$CallStack;-><init>()V

    return-void
.end method


# virtual methods
.method public get()[Ljava/lang/Class;
    .locals 1

    .line 39
    invoke-virtual {p0}, Lorg/apache/log/util/StackIntrospector$CallStack;->getClassContext()[Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method
