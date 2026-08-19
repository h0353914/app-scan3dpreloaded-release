.class Lorg/apache/log4j/chainsaw/MyTableModel$Processor;
.super Ljava/lang/Object;
.source "MyTableModel.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/log4j/chainsaw/MyTableModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Processor"
.end annotation


# instance fields
.field private final synthetic this$0:Lorg/apache/log4j/chainsaw/MyTableModel;


# direct methods
.method constructor <init>(Lorg/apache/log4j/chainsaw/MyTableModel;)V
    .locals 0

    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Lorg/apache/log4j/chainsaw/MyTableModel$Processor;->this$0:Lorg/apache/log4j/chainsaw/MyTableModel;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    :goto_0
    const-wide/16 v0, 0x3e8

    .line 79
    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 84
    :catch_0
    iget-object v0, p0, Lorg/apache/log4j/chainsaw/MyTableModel$Processor;->this$0:Lorg/apache/log4j/chainsaw/MyTableModel;

    invoke-static {v0}, Lorg/apache/log4j/chainsaw/MyTableModel;->access$0(Lorg/apache/log4j/chainsaw/MyTableModel;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    .line 85
    :try_start_1
    iget-object v1, p0, Lorg/apache/log4j/chainsaw/MyTableModel$Processor;->this$0:Lorg/apache/log4j/chainsaw/MyTableModel;

    invoke-static {v1}, Lorg/apache/log4j/chainsaw/MyTableModel;->access$1(Lorg/apache/log4j/chainsaw/MyTableModel;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_2

    .line 91
    :cond_0
    iget-object v1, p0, Lorg/apache/log4j/chainsaw/MyTableModel$Processor;->this$0:Lorg/apache/log4j/chainsaw/MyTableModel;

    invoke-static {v1}, Lorg/apache/log4j/chainsaw/MyTableModel;->access$2(Lorg/apache/log4j/chainsaw/MyTableModel;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    move v4, v2

    move v5, v3

    .line 92
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_2

    .line 98
    iget-object v1, p0, Lorg/apache/log4j/chainsaw/MyTableModel$Processor;->this$0:Lorg/apache/log4j/chainsaw/MyTableModel;

    invoke-static {v1}, Lorg/apache/log4j/chainsaw/MyTableModel;->access$2(Lorg/apache/log4j/chainsaw/MyTableModel;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->clear()V

    if-eqz v4, :cond_1

    .line 101
    iget-object v1, p0, Lorg/apache/log4j/chainsaw/MyTableModel$Processor;->this$0:Lorg/apache/log4j/chainsaw/MyTableModel;

    invoke-static {v1, v5}, Lorg/apache/log4j/chainsaw/MyTableModel;->access$5(Lorg/apache/log4j/chainsaw/MyTableModel;Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 84
    :cond_1
    :goto_2
    monitor-exit v0

    goto :goto_0

    .line 93
    :cond_2
    :try_start_2
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/apache/log4j/chainsaw/EventDetails;

    .line 94
    iget-object v7, p0, Lorg/apache/log4j/chainsaw/MyTableModel$Processor;->this$0:Lorg/apache/log4j/chainsaw/MyTableModel;

    invoke-static {v7}, Lorg/apache/log4j/chainsaw/MyTableModel;->access$3(Lorg/apache/log4j/chainsaw/MyTableModel;)Ljava/util/SortedSet;

    move-result-object v7

    invoke-interface {v7, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    if-eqz v5, :cond_4

    .line 95
    iget-object v5, p0, Lorg/apache/log4j/chainsaw/MyTableModel$Processor;->this$0:Lorg/apache/log4j/chainsaw/MyTableModel;

    invoke-static {v5}, Lorg/apache/log4j/chainsaw/MyTableModel;->access$3(Lorg/apache/log4j/chainsaw/MyTableModel;)Ljava/util/SortedSet;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/SortedSet;->first()Ljava/lang/Object;

    move-result-object v5

    if-eq v6, v5, :cond_3

    goto :goto_3

    :cond_3
    move v5, v3

    goto :goto_4

    :cond_4
    :goto_3
    move v5, v2

    :goto_4
    if-nez v4, :cond_5

    .line 96
    iget-object v4, p0, Lorg/apache/log4j/chainsaw/MyTableModel$Processor;->this$0:Lorg/apache/log4j/chainsaw/MyTableModel;

    invoke-static {v4, v6}, Lorg/apache/log4j/chainsaw/MyTableModel;->access$4(Lorg/apache/log4j/chainsaw/MyTableModel;Lorg/apache/log4j/chainsaw/EventDetails;)Z

    move-result v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-nez v4, :cond_5

    move v4, v2

    goto :goto_1

    :cond_5
    move v4, v3

    goto :goto_1

    :catchall_0
    move-exception v1

    .line 84
    monitor-exit v0

    throw v1
.end method
