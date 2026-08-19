.class final Lorg/apache/log4j/lf5/viewer/LF5SwingUtils$1;
.super Ljava/lang/Object;
.source "LF5SwingUtils.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic val$component:Ljavax/swing/JComponent;


# direct methods
.method synthetic constructor <init>(Ljavax/swing/JComponent;)V
    .locals 0

    .line 133
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/apache/log4j/lf5/viewer/LF5SwingUtils$1;->val$component:Ljavax/swing/JComponent;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LF5SwingUtils$1;->val$component:Ljavax/swing/JComponent;

    .line 135
    invoke-virtual {v0}, Ljava/awt/Component;->repaint()V

    return-void
.end method
