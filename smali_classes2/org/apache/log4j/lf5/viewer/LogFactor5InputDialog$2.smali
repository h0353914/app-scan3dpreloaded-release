.class final Lorg/apache/log4j/lf5/viewer/LogFactor5InputDialog$2;
.super Ljava/lang/Object;
.source "LogFactor5InputDialog.java"

# interfaces
.implements Ljava/awt/event/ActionListener;


# instance fields
.field private final synthetic this$0:Lorg/apache/log4j/lf5/viewer/LogFactor5InputDialog;


# direct methods
.method synthetic constructor <init>(Lorg/apache/log4j/lf5/viewer/LogFactor5InputDialog;)V
    .locals 0

    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/apache/log4j/lf5/viewer/LogFactor5InputDialog$2;->this$0:Lorg/apache/log4j/lf5/viewer/LogFactor5InputDialog;

    return-void
.end method


# virtual methods
.method public actionPerformed(Ljava/awt/event/ActionEvent;)V
    .locals 0

    iget-object p1, p0, Lorg/apache/log4j/lf5/viewer/LogFactor5InputDialog$2;->this$0:Lorg/apache/log4j/lf5/viewer/LogFactor5InputDialog;

    .line 95
    invoke-virtual {p1}, Ljava/awt/Dialog;->hide()V

    return-void
.end method
