.class final Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$1;
.super Ljava/lang/Object;
.source "LogBrokerMonitor.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic this$0:Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;

.field private final synthetic val$delay:I


# direct methods
.method synthetic constructor <init>(ILorg/apache/log4j/lf5/viewer/LogBrokerMonitor;)V
    .locals 0

    .line 152
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$1;->val$delay:I

    iput-object p2, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$1;->this$0:Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 154
    invoke-static {}, Ljava/lang/Thread;->yield()V

    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$1;->this$0:Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;

    iget v1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$1;->val$delay:I

    .line 155
    invoke-virtual {v0, v1}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->pause(I)V

    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$1;->this$0:Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;

    .line 156
    iget-object v0, v0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_logMonitorFrame:Ljavax/swing/JFrame;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/awt/Component;->setVisible(Z)V

    return-void
.end method
