.class final Lorg/apache/log4j/lf5/viewer/LogFactor5InputDialog$1;
.super Ljava/awt/event/KeyAdapter;
.source "LogFactor5InputDialog.java"


# instance fields
.field private final synthetic this$0:Lorg/apache/log4j/lf5/viewer/LogFactor5InputDialog;


# direct methods
.method synthetic constructor <init>(Lorg/apache/log4j/lf5/viewer/LogFactor5InputDialog;)V
    .locals 0

    .line 84
    invoke-direct {p0}, Ljava/awt/event/KeyAdapter;-><init>()V

    iput-object p1, p0, Lorg/apache/log4j/lf5/viewer/LogFactor5InputDialog$1;->this$0:Lorg/apache/log4j/lf5/viewer/LogFactor5InputDialog;

    return-void
.end method


# virtual methods
.method public keyPressed(Ljava/awt/event/KeyEvent;)V
    .locals 1

    .line 86
    invoke-virtual {p1}, Ljava/awt/event/KeyEvent;->getKeyCode()I

    move-result p1

    const/16 v0, 0xa

    if-ne p1, v0, :cond_0

    iget-object p1, p0, Lorg/apache/log4j/lf5/viewer/LogFactor5InputDialog$1;->this$0:Lorg/apache/log4j/lf5/viewer/LogFactor5InputDialog;

    .line 87
    invoke-virtual {p1}, Ljava/awt/Dialog;->hide()V

    :cond_0
    return-void
.end method
