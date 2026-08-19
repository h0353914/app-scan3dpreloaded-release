.class final Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$31;
.super Ljava/lang/Object;
.source "LogBrokerMonitor.java"

# interfaces
.implements Ljava/awt/event/ActionListener;


# instance fields
.field private final synthetic this$0:Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;


# direct methods
.method synthetic constructor <init>(Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;)V
    .locals 0

    .line 1277
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$31;->this$0:Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;

    return-void
.end method


# virtual methods
.method public actionPerformed(Ljava/awt/event/ActionEvent;)V
    .locals 1

    .line 1279
    invoke-virtual {p1}, Ljava/util/EventObject;->getSource()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljavax/swing/JComboBox;

    .line 1280
    invoke-virtual {p1}, Ljavax/swing/JComboBox;->getSelectedItem()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 1281
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$31;->this$0:Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;

    .line 1283
    invoke-virtual {v0, p1}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->setFontSizeSilently(I)V

    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$31;->this$0:Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;

    .line 1284
    invoke-virtual {v0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->refreshDetailTextArea()V

    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$31;->this$0:Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;

    .line 1285
    iput p1, v0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_fontSize:I

    return-void
.end method
