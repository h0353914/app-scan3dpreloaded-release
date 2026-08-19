.class final Lorg/apache/log4j/chainsaw/ControlPanel$6;
.super Ljava/lang/Object;
.source "ControlPanel.java"

# interfaces
.implements Ljava/awt/event/ActionListener;


# instance fields
.field private final synthetic val$aModel:Lorg/apache/log4j/chainsaw/MyTableModel;


# direct methods
.method synthetic constructor <init>(Lorg/apache/log4j/chainsaw/MyTableModel;)V
    .locals 0

    .line 193
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/apache/log4j/chainsaw/ControlPanel$6;->val$aModel:Lorg/apache/log4j/chainsaw/MyTableModel;

    return-void
.end method


# virtual methods
.method public actionPerformed(Ljava/awt/event/ActionEvent;)V
    .locals 0

    iget-object p1, p0, Lorg/apache/log4j/chainsaw/ControlPanel$6;->val$aModel:Lorg/apache/log4j/chainsaw/MyTableModel;

    .line 195
    invoke-virtual {p1}, Lorg/apache/log4j/chainsaw/MyTableModel;->clear()V

    return-void
.end method
