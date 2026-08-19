.class final Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerTree$1;
.super Lorg/apache/log4j/lf5/viewer/categoryexplorer/TreeModelAdapter;
.source "CategoryExplorerTree.java"


# instance fields
.field private final synthetic this$0:Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerTree;


# direct methods
.method synthetic constructor <init>(Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerTree;)V
    .locals 0

    .line 133
    invoke-direct {p0}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/TreeModelAdapter;-><init>()V

    iput-object p1, p0, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerTree$1;->this$0:Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerTree;

    return-void
.end method


# virtual methods
.method public treeNodesInserted(Ljavax/swing/event/TreeModelEvent;)V
    .locals 0

    iget-object p1, p0, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerTree$1;->this$0:Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerTree;

    .line 135
    invoke-virtual {p1}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerTree;->expandRootNode()V

    return-void
.end method
