.class final Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNodeEditor$2;
.super Ljava/awt/event/MouseAdapter;
.source "CategoryNodeEditor.java"


# instance fields
.field private final synthetic this$0:Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNodeEditor;


# direct methods
.method synthetic constructor <init>(Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNodeEditor;)V
    .locals 0

    .line 71
    invoke-direct {p0}, Ljava/awt/event/MouseAdapter;-><init>()V

    iput-object p1, p0, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNodeEditor$2;->this$0:Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNodeEditor;

    return-void
.end method


# virtual methods
.method public mousePressed(Ljava/awt/event/MouseEvent;)V
    .locals 3

    .line 73
    invoke-virtual {p1}, Ljava/awt/event/InputEvent;->getModifiers()I

    move-result v0

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNodeEditor$2;->this$0:Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNodeEditor;

    .line 74
    iget-object v1, v0, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNodeEditor;->_lastEditedNode:Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNode;

    invoke-virtual {p1}, Ljava/awt/event/MouseEvent;->getX()I

    move-result v2

    invoke-virtual {p1}, Ljava/awt/event/MouseEvent;->getY()I

    move-result p1

    invoke-virtual {v0, v1, v2, p1}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNodeEditor;->showPopup(Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNode;II)V

    :cond_0
    iget-object p1, p0, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNodeEditor$2;->this$0:Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNodeEditor;

    .line 76
    invoke-virtual {p1}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryAbstractCellEditor;->stopCellEditing()Z

    return-void
.end method
