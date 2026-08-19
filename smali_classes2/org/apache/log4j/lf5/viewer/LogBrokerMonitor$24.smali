.class final Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$24;
.super Ljava/lang/Object;
.source "LogBrokerMonitor.java"

# interfaces
.implements Ljava/awt/event/ActionListener;


# instance fields
.field private final synthetic this$0:Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;

.field private final synthetic val$title:Ljava/lang/String;


# direct methods
.method synthetic constructor <init>(Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;Ljava/lang/String;)V
    .locals 0

    .line 1085
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$24;->this$0:Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;

    iput-object p2, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$24;->val$title:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public actionPerformed(Ljava/awt/event/ActionEvent;)V
    .locals 1

    iget-object p1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$24;->this$0:Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;

    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$24;->val$title:Ljava/lang/String;

    .line 1087
    invoke-virtual {p1, v0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->showPropertiesDialog(Ljava/lang/String;)V

    return-void
.end method
