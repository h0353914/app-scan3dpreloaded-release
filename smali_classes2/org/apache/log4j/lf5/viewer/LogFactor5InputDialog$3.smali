.class final Lorg/apache/log4j/lf5/viewer/LogFactor5InputDialog$3;
.super Ljava/lang/Object;
.source "LogFactor5InputDialog.java"

# interfaces
.implements Ljava/awt/event/ActionListener;


# instance fields
.field private final synthetic this$0:Lorg/apache/log4j/lf5/viewer/LogFactor5InputDialog;


# direct methods
.method synthetic constructor <init>(Lorg/apache/log4j/lf5/viewer/LogFactor5InputDialog;)V
    .locals 0

    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/apache/log4j/lf5/viewer/LogFactor5InputDialog$3;->this$0:Lorg/apache/log4j/lf5/viewer/LogFactor5InputDialog;

    return-void
.end method


# virtual methods
.method public actionPerformed(Ljava/awt/event/ActionEvent;)V
    .locals 1

    iget-object p1, p0, Lorg/apache/log4j/lf5/viewer/LogFactor5InputDialog$3;->this$0:Lorg/apache/log4j/lf5/viewer/LogFactor5InputDialog;

    .line 102
    invoke-virtual {p1}, Ljava/awt/Dialog;->hide()V

    iget-object p1, p0, Lorg/apache/log4j/lf5/viewer/LogFactor5InputDialog$3;->this$0:Lorg/apache/log4j/lf5/viewer/LogFactor5InputDialog;

    .line 106
    invoke-static {p1}, Lorg/apache/log4j/lf5/viewer/LogFactor5InputDialog;->access$0(Lorg/apache/log4j/lf5/viewer/LogFactor5InputDialog;)Ljavax/swing/JTextField;

    move-result-object p1

    const-string v0, ""

    invoke-virtual {p1, v0}, Ljavax/swing/text/JTextComponent;->setText(Ljava/lang/String;)V

    return-void
.end method
