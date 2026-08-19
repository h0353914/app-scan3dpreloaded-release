.class final Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$29;
.super Ljava/lang/Object;
.source "LogBrokerMonitor.java"

# interfaces
.implements Ljava/awt/event/ActionListener;


# instance fields
.field private final synthetic this$0:Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;


# direct methods
.method synthetic constructor <init>(Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;)V
    .locals 0

    .line 1225
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$29;->this$0:Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;

    return-void
.end method


# virtual methods
.method public actionPerformed(Ljava/awt/event/ActionEvent;)V
    .locals 0

    iget-object p1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$29;->this$0:Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;

    .line 1227
    iget-object p1, p1, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_table:Lorg/apache/log4j/lf5/viewer/LogTable;

    invoke-virtual {p1}, Lorg/apache/log4j/lf5/viewer/LogTable;->clearLogRecords()V

    iget-object p1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$29;->this$0:Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;

    .line 1228
    iget-object p1, p1, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_categoryExplorerTree:Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerTree;

    invoke-virtual {p1}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerTree;->getExplorerModel()Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerModel;

    move-result-object p1

    invoke-virtual {p1}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerModel;->resetAllNodeCounts()V

    iget-object p1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$29;->this$0:Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;

    .line 1229
    invoke-virtual {p1}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->updateStatusLabel()V

    iget-object p1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$29;->this$0:Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;

    .line 1230
    invoke-virtual {p1}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->clearDetailTextArea()V

    .line 1231
    invoke-static {}, Lorg/apache/log4j/lf5/LogRecord;->resetSequenceNumber()V

    return-void
.end method
