.class final Lorg/apache/log4j/chainsaw/Main$1;
.super Ljava/awt/event/WindowAdapter;
.source "Main.java"


# direct methods
.method synthetic constructor <init>()V
    .locals 0

    .line 115
    invoke-direct {p0}, Ljava/awt/event/WindowAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public windowClosing(Ljava/awt/event/WindowEvent;)V
    .locals 1

    .line 117
    sget-object p1, Lorg/apache/log4j/chainsaw/ExitAction;->INSTANCE:Lorg/apache/log4j/chainsaw/ExitAction;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lorg/apache/log4j/chainsaw/ExitAction;->actionPerformed(Ljava/awt/event/ActionEvent;)V

    return-void
.end method
