.class final Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$3;
.super Ljava/lang/Object;
.source "LogBrokerMonitor.java"

# interfaces
.implements Lorg/apache/log4j/lf5/LogRecordFilter;


# instance fields
.field private final synthetic this$0:Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;


# direct methods
.method synthetic constructor <init>(Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;)V
    .locals 0

    .line 579
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$3;->this$0:Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;

    return-void
.end method


# virtual methods
.method public passes(Lorg/apache/log4j/lf5/LogRecord;)Z
    .locals 2

    .line 581
    new-instance v0, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryPath;

    invoke-virtual {p1}, Lorg/apache/log4j/lf5/LogRecord;->getCategory()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryPath;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$3;->this$0:Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;

    .line 583
    invoke-virtual {p1}, Lorg/apache/log4j/lf5/LogRecord;->getLevel()Lorg/apache/log4j/lf5/LogLevel;

    move-result-object p1

    invoke-virtual {v1, p1}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->getMenuItem(Lorg/apache/log4j/lf5/LogLevel;)Ljavax/swing/JCheckBoxMenuItem;

    move-result-object p1

    invoke-virtual {p1}, Ljavax/swing/AbstractButton;->isSelected()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$3;->this$0:Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;

    .line 584
    iget-object p1, p1, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_categoryExplorerTree:Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerTree;

    invoke-virtual {p1}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerTree;->getExplorerModel()Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerModel;

    move-result-object p1

    invoke-virtual {p1, v0}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerModel;->isCategoryPathActive(Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryPath;)Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    :goto_1
    return p1
.end method
