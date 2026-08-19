.class final Lorg/apache/log4j/chainsaw/ControlPanel$4;
.super Ljava/lang/Object;
.source "ControlPanel.java"

# interfaces
.implements Ljavax/swing/event/DocumentListener;


# instance fields
.field private final synthetic val$aModel:Lorg/apache/log4j/chainsaw/MyTableModel;

.field private final synthetic val$ndcField:Ljavax/swing/JTextField;


# direct methods
.method synthetic constructor <init>(Lorg/apache/log4j/chainsaw/MyTableModel;Ljavax/swing/JTextField;)V
    .locals 0

    .line 145
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/apache/log4j/chainsaw/ControlPanel$4;->val$aModel:Lorg/apache/log4j/chainsaw/MyTableModel;

    iput-object p2, p0, Lorg/apache/log4j/chainsaw/ControlPanel$4;->val$ndcField:Ljavax/swing/JTextField;

    return-void
.end method


# virtual methods
.method public changedUpdate(Ljavax/swing/event/DocumentEvent;)V
    .locals 1

    iget-object p1, p0, Lorg/apache/log4j/chainsaw/ControlPanel$4;->val$aModel:Lorg/apache/log4j/chainsaw/MyTableModel;

    iget-object v0, p0, Lorg/apache/log4j/chainsaw/ControlPanel$4;->val$ndcField:Ljavax/swing/JTextField;

    .line 153
    invoke-virtual {v0}, Ljavax/swing/text/JTextComponent;->getText()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/apache/log4j/chainsaw/MyTableModel;->setNDCFilter(Ljava/lang/String;)V

    return-void
.end method

.method public insertUpdate(Ljavax/swing/event/DocumentEvent;)V
    .locals 1

    iget-object p1, p0, Lorg/apache/log4j/chainsaw/ControlPanel$4;->val$aModel:Lorg/apache/log4j/chainsaw/MyTableModel;

    iget-object v0, p0, Lorg/apache/log4j/chainsaw/ControlPanel$4;->val$ndcField:Ljavax/swing/JTextField;

    .line 147
    invoke-virtual {v0}, Ljavax/swing/text/JTextComponent;->getText()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/apache/log4j/chainsaw/MyTableModel;->setNDCFilter(Ljava/lang/String;)V

    return-void
.end method

.method public removeUpdate(Ljavax/swing/event/DocumentEvent;)V
    .locals 1

    iget-object p1, p0, Lorg/apache/log4j/chainsaw/ControlPanel$4;->val$aModel:Lorg/apache/log4j/chainsaw/MyTableModel;

    iget-object v0, p0, Lorg/apache/log4j/chainsaw/ControlPanel$4;->val$ndcField:Ljavax/swing/JTextField;

    .line 150
    invoke-virtual {v0}, Ljavax/swing/text/JTextComponent;->getText()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/apache/log4j/chainsaw/MyTableModel;->setNDCFilter(Ljava/lang/String;)V

    return-void
.end method
