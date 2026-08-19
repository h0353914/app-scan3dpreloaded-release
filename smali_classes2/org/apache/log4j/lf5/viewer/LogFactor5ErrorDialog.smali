.class public Lorg/apache/log4j/lf5/viewer/LogFactor5ErrorDialog;
.super Lorg/apache/log4j/lf5/viewer/LogFactor5Dialog;
.source "LogFactor5ErrorDialog.java"


# direct methods
.method public constructor <init>(Ljavax/swing/JFrame;Ljava/lang/String;)V
    .locals 2

    const-string v0, "Error"

    const/4 v1, 0x1

    .line 49
    invoke-direct {p0, p1, v0, v1}, Lorg/apache/log4j/lf5/viewer/LogFactor5Dialog;-><init>(Ljavax/swing/JFrame;Ljava/lang/String;Z)V

    .line 51
    new-instance p1, Ljavax/swing/JButton;

    const-string v0, "Ok"

    invoke-direct {p1, v0}, Ljavax/swing/JButton;-><init>(Ljava/lang/String;)V

    .line 52
    new-instance v0, Lorg/apache/log4j/lf5/viewer/LogFactor5ErrorDialog$1;

    invoke-direct {v0, p0}, Lorg/apache/log4j/lf5/viewer/LogFactor5ErrorDialog$1;-><init>(Lorg/apache/log4j/lf5/viewer/LogFactor5ErrorDialog;)V

    invoke-virtual {p1, v0}, Ljavax/swing/AbstractButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 58
    new-instance v0, Ljavax/swing/JPanel;

    invoke-direct {v0}, Ljavax/swing/JPanel;-><init>()V

    .line 59
    new-instance v1, Ljava/awt/FlowLayout;

    invoke-direct {v1}, Ljava/awt/FlowLayout;-><init>()V

    invoke-virtual {v0, v1}, Ljava/awt/Container;->setLayout(Ljava/awt/LayoutManager;)V

    .line 60
    invoke-virtual {v0, p1}, Ljava/awt/Container;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 62
    new-instance p1, Ljavax/swing/JPanel;

    invoke-direct {p1}, Ljavax/swing/JPanel;-><init>()V

    .line 63
    new-instance v1, Ljava/awt/GridBagLayout;

    invoke-direct {v1}, Ljava/awt/GridBagLayout;-><init>()V

    invoke-virtual {p1, v1}, Ljava/awt/Container;->setLayout(Ljava/awt/LayoutManager;)V

    .line 64
    invoke-virtual {p0, p2, p1}, Lorg/apache/log4j/lf5/viewer/LogFactor5Dialog;->wrapStringOnPanel(Ljava/lang/String;Ljava/awt/Container;)V

    .line 66
    invoke-virtual {p0}, Ljavax/swing/JDialog;->getContentPane()Ljava/awt/Container;

    move-result-object p2

    const-string v1, "Center"

    invoke-virtual {p2, p1, v1}, Ljava/awt/Container;->add(Ljava/awt/Component;Ljava/lang/Object;)V

    .line 67
    invoke-virtual {p0}, Ljavax/swing/JDialog;->getContentPane()Ljava/awt/Container;

    move-result-object p1

    const-string p2, "South"

    invoke-virtual {p1, v0, p2}, Ljava/awt/Container;->add(Ljava/awt/Component;Ljava/lang/Object;)V

    .line 68
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogFactor5Dialog;->show()V

    return-void
.end method
