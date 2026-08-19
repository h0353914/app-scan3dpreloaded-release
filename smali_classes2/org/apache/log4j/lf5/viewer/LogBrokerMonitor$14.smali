.class final Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$14;
.super Ljava/lang/Object;
.source "LogBrokerMonitor.java"

# interfaces
.implements Ljava/awt/event/ActionListener;


# instance fields
.field private final synthetic this$0:Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;


# direct methods
.method synthetic constructor <init>(Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;)V
    .locals 0

    .line 878
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$14;->this$0:Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;

    return-void
.end method


# virtual methods
.method public actionPerformed(Ljava/awt/event/ActionEvent;)V
    .locals 1

    iget-object p1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$14;->this$0:Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;

    const/4 v0, 0x1

    .line 880
    invoke-virtual {p1, v0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->selectAllLogTableColumns(Z)V

    iget-object p1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$14;->this$0:Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;

    .line 882
    invoke-virtual {p1}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->updateView()Ljava/util/List;

    move-result-object p1

    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$14;->this$0:Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;

    .line 883
    iget-object v0, v0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_table:Lorg/apache/log4j/lf5/viewer/LogTable;

    invoke-virtual {v0, p1}, Lorg/apache/log4j/lf5/viewer/LogTable;->setView(Ljava/util/List;)V

    return-void
.end method
