.class final Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$9;
.super Ljava/lang/Object;
.source "LogBrokerMonitor.java"

# interfaces
.implements Ljava/awt/event/ActionListener;


# instance fields
.field private final synthetic this$0:Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;


# direct methods
.method synthetic constructor <init>(Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;)V
    .locals 0

    .line 727
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$9;->this$0:Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;

    return-void
.end method


# virtual methods
.method public actionPerformed(Ljava/awt/event/ActionEvent;)V
    .locals 1

    iget-object p1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$9;->this$0:Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;

    const/4 v0, 0x0

    .line 729
    invoke-virtual {p1, v0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->selectAllLogLevels(Z)V

    iget-object p1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$9;->this$0:Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;

    .line 730
    iget-object p1, p1, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_table:Lorg/apache/log4j/lf5/viewer/LogTable;

    invoke-virtual {p1}, Lorg/apache/log4j/lf5/viewer/LogTable;->getFilteredLogTableModel()Lorg/apache/log4j/lf5/viewer/FilteredLogTableModel;

    move-result-object p1

    invoke-virtual {p1}, Lorg/apache/log4j/lf5/viewer/FilteredLogTableModel;->refresh()V

    iget-object p1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$9;->this$0:Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;

    .line 731
    invoke-virtual {p1}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->updateStatusLabel()V

    return-void
.end method
