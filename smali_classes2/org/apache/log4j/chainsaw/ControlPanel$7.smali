.class final Lorg/apache/log4j/chainsaw/ControlPanel$7;
.super Ljava/lang/Object;
.source "ControlPanel.java"

# interfaces
.implements Ljava/awt/event/ActionListener;


# instance fields
.field private final synthetic val$aModel:Lorg/apache/log4j/chainsaw/MyTableModel;

.field private final synthetic val$toggleButton:Ljavax/swing/JButton;


# direct methods
.method synthetic constructor <init>(Lorg/apache/log4j/chainsaw/MyTableModel;Ljavax/swing/JButton;)V
    .locals 0

    .line 204
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/apache/log4j/chainsaw/ControlPanel$7;->val$aModel:Lorg/apache/log4j/chainsaw/MyTableModel;

    iput-object p2, p0, Lorg/apache/log4j/chainsaw/ControlPanel$7;->val$toggleButton:Ljavax/swing/JButton;

    return-void
.end method


# virtual methods
.method public actionPerformed(Ljava/awt/event/ActionEvent;)V
    .locals 1

    iget-object p1, p0, Lorg/apache/log4j/chainsaw/ControlPanel$7;->val$aModel:Lorg/apache/log4j/chainsaw/MyTableModel;

    .line 206
    invoke-virtual {p1}, Lorg/apache/log4j/chainsaw/MyTableModel;->toggle()V

    iget-object p1, p0, Lorg/apache/log4j/chainsaw/ControlPanel$7;->val$toggleButton:Ljavax/swing/JButton;

    iget-object v0, p0, Lorg/apache/log4j/chainsaw/ControlPanel$7;->val$aModel:Lorg/apache/log4j/chainsaw/MyTableModel;

    .line 208
    invoke-virtual {v0}, Lorg/apache/log4j/chainsaw/MyTableModel;->isPaused()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "Resume"

    goto :goto_0

    :cond_0
    const-string v0, "Pause"

    .line 207
    :goto_0
    invoke-virtual {p1, v0}, Ljavax/swing/AbstractButton;->setText(Ljava/lang/String;)V

    return-void
.end method
