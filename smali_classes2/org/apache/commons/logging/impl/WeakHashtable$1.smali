.class final Lorg/apache/commons/logging/impl/WeakHashtable$1;
.super Ljava/lang/Object;
.source "WeakHashtable.java"

# interfaces
.implements Ljava/util/Enumeration;


# instance fields
.field private final synthetic val$enumer:Ljava/util/Enumeration;


# direct methods
.method synthetic constructor <init>(Ljava/util/Enumeration;)V
    .locals 0

    .line 188
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/apache/commons/logging/impl/WeakHashtable$1;->val$enumer:Ljava/util/Enumeration;

    return-void
.end method


# virtual methods
.method public hasMoreElements()Z
    .locals 1

    iget-object v0, p0, Lorg/apache/commons/logging/impl/WeakHashtable$1;->val$enumer:Ljava/util/Enumeration;

    .line 190
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v0

    return v0
.end method

.method public nextElement()Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lorg/apache/commons/logging/impl/WeakHashtable$1;->val$enumer:Ljava/util/Enumeration;

    .line 193
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/logging/impl/WeakHashtable$Referenced;

    .line 194
    invoke-static {v0}, Lorg/apache/commons/logging/impl/WeakHashtable$Referenced;->access$0(Lorg/apache/commons/logging/impl/WeakHashtable$Referenced;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
