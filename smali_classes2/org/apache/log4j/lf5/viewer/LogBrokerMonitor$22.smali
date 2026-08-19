.class final Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$22;
.super Ljava/lang/Object;
.source "LogBrokerMonitor.java"

# interfaces
.implements Ljava/awt/event/ActionListener;


# instance fields
.field private final synthetic this$0:Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;


# direct methods
.method synthetic constructor <init>(Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;)V
    .locals 0

    .line 1025
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$22;->this$0:Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;

    return-void
.end method


# virtual methods
.method public actionPerformed(Ljava/awt/event/ActionEvent;)V
    .locals 0

    iget-object p1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$22;->this$0:Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;

    .line 1027
    invoke-virtual {p1}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->resetConfiguration()V

    return-void
.end method
