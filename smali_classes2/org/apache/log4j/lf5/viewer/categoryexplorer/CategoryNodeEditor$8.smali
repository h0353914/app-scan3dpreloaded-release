.class final Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNodeEditor$8;
.super Ljava/lang/Object;
.source "CategoryNodeEditor.java"

# interfaces
.implements Ljava/awt/event/ActionListener;


# instance fields
.field private final synthetic this$0:Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNodeEditor;


# direct methods
.method synthetic constructor <init>(Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNodeEditor;)V
    .locals 0

    .line 220
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNodeEditor$8;->this$0:Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNodeEditor;

    return-void
.end method


# virtual methods
.method public actionPerformed(Ljava/awt/event/ActionEvent;)V
    .locals 0

    .line 222
    :cond_0
    iget-object p1, p0, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNodeEditor$8;->this$0:Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNodeEditor;

    invoke-virtual {p1}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNodeEditor;->removeUnusedNodes()I

    move-result p1

    if-gtz p1, :cond_0

    return-void
.end method
