.class final Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$6;
.super Ljava/lang/Object;
.source "LogBrokerMonitor.java"


# instance fields
.field private final synthetic val$model:Lorg/apache/log4j/lf5/viewer/FilteredLogTableModel;


# direct methods
.method synthetic constructor <init>(Lorg/apache/log4j/lf5/viewer/FilteredLogTableModel;)V
    .locals 0

    .line 630
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$6;->val$model:Lorg/apache/log4j/lf5/viewer/FilteredLogTableModel;

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 632
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v1, "Maximum number of displayed LogRecords: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$6;->val$model:Lorg/apache/log4j/lf5/viewer/FilteredLogTableModel;

    .line 633
    iget v1, v1, Lorg/apache/log4j/lf5/viewer/FilteredLogTableModel;->_maxNumberOfLogRecords:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
