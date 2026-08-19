.class public Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerModel;
.super Ljavax/swing/tree/DefaultTreeModel;
.source "CategoryExplorerModel.java"


# instance fields
.field protected _event:Ljava/awt/event/ActionEvent;

.field protected _listener:Ljava/awt/event/ActionListener;

.field protected _renderFatal:Z


# direct methods
.method public constructor <init>(Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNode;)V
    .locals 2

    .line 64
    invoke-direct {p0, p1}, Ljavax/swing/tree/DefaultTreeModel;-><init>(Ljavax/swing/tree/TreeNode;)V

    const/4 p1, 0x1

    .line 49
    iput-boolean p1, p0, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerModel;->_renderFatal:Z

    const/4 p1, 0x0

    .line 50
    iput-object p1, p0, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerModel;->_listener:Ljava/awt/event/ActionListener;

    .line 51
    new-instance p1, Ljava/awt/event/ActionEvent;

    const-string v0, "Nodes Selection changed"

    const/16 v1, 0x3e9

    invoke-direct {p1, p0, v1, v0}, Ljava/awt/event/ActionEvent;-><init>(Ljava/lang/Object;ILjava/lang/String;)V

    iput-object p1, p0, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerModel;->_event:Ljava/awt/event/ActionEvent;

    return-void
.end method


# virtual methods
.method public declared-synchronized addActionListener(Ljava/awt/event/ActionListener;)V
    .locals 1

    monitor-enter p0

    .line 279
    :try_start_0
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerModel;->_listener:Ljava/awt/event/ActionListener;

    invoke-static {v0, p1}, Ljava/awt/AWTEventMulticaster;->add(Ljava/awt/event/ActionListener;Ljava/awt/event/ActionListener;)Ljava/awt/event/ActionListener;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerModel;->_listener:Ljava/awt/event/ActionListener;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 278
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public addCategory(Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryPath;)Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNode;
    .locals 8

    .line 189
    invoke-virtual {p0}, Ljavax/swing/tree/DefaultTreeModel;->getRoot()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNode;

    const/4 v1, 0x0

    move-object v2, v0

    move v0, v1

    .line 192
    :goto_0
    invoke-virtual {p1}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryPath;->size()I

    move-result v3

    if-lt v0, v3, :cond_0

    return-object v2

    .line 193
    :cond_0
    invoke-virtual {p1, v0}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryPath;->categoryElementAt(I)Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryElement;

    move-result-object v3

    .line 196
    invoke-virtual {v2}, Ljavax/swing/tree/DefaultMutableTreeNode;->children()Ljava/util/Enumeration;

    move-result-object v4

    .line 199
    :cond_1
    invoke-interface {v4}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-nez v5, :cond_2

    move-object v5, v2

    move v2, v1

    goto :goto_1

    .line 200
    :cond_2
    invoke-interface {v4}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNode;

    .line 201
    invoke-virtual {v5}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNode;->getTitle()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    .line 203
    invoke-virtual {v3}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryElement;->getTitle()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v7

    .line 204
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    const/4 v2, 0x1

    :goto_1
    if-nez v2, :cond_3

    .line 214
    new-instance v2, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNode;

    invoke-virtual {v3}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryElement;->getTitle()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNode;-><init>(Ljava/lang/String;)V

    .line 222
    invoke-virtual {v5}, Ljavax/swing/tree/DefaultMutableTreeNode;->getChildCount()I

    move-result v3

    invoke-virtual {p0, v2, v5, v3}, Ljavax/swing/tree/DefaultTreeModel;->insertNodeInto(Ljavax/swing/tree/MutableTreeNode;Ljavax/swing/tree/MutableTreeNode;I)V

    .line 223
    invoke-virtual {p0, v2}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerModel;->refresh(Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNode;)V

    goto :goto_2

    :cond_3
    move-object v2, v5

    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public addLogRecord(Lorg/apache/log4j/lf5/LogRecord;)V
    .locals 5

    .line 71
    new-instance v0, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryPath;

    invoke-virtual {p1}, Lorg/apache/log4j/lf5/LogRecord;->getCategory()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryPath;-><init>(Ljava/lang/String;)V

    .line 72
    invoke-virtual {p0, v0}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerModel;->addCategory(Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryPath;)Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNode;

    .line 73
    invoke-virtual {p0, v0}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerModel;->getCategoryNode(Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryPath;)Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNode;

    move-result-object v0

    .line 74
    invoke-virtual {v0}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNode;->addRecord()V

    .line 75
    iget-boolean v1, p0, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerModel;->_renderFatal:Z

    if-eqz v1, :cond_1

    invoke-virtual {p1}, Lorg/apache/log4j/lf5/LogRecord;->isFatal()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 76
    invoke-virtual {p0, v0}, Ljavax/swing/tree/DefaultTreeModel;->getPathToRoot(Ljavax/swing/tree/TreeNode;)[Ljavax/swing/tree/TreeNode;

    move-result-object p1

    .line 77
    array-length v1, p1

    const/4 v2, 0x1

    move v3, v2

    :goto_0
    add-int/lit8 v4, v1, -0x1

    if-lt v3, v4, :cond_0

    .line 87
    invoke-virtual {v0, v2}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNode;->setHasFatalRecords(Z)V

    .line 88
    invoke-virtual {p0, v0}, Ljavax/swing/tree/DefaultTreeModel;->nodeChanged(Ljavax/swing/tree/TreeNode;)V

    goto :goto_1

    .line 83
    :cond_0
    aget-object v4, p1, v3

    check-cast v4, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNode;

    .line 84
    invoke-virtual {v4, v2}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNode;->setHasFatalChildren(Z)V

    .line 85
    invoke-virtual {p0, v4}, Ljavax/swing/tree/DefaultTreeModel;->nodeChanged(Ljavax/swing/tree/TreeNode;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    return-void
.end method

.method public getCategoryNode(Ljava/lang/String;)Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNode;
    .locals 1

    .line 97
    new-instance v0, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryPath;

    invoke-direct {v0, p1}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryPath;-><init>(Ljava/lang/String;)V

    .line 98
    invoke-virtual {p0, v0}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerModel;->getCategoryNode(Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryPath;)Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNode;

    move-result-object p1

    return-object p1
.end method

.method public getCategoryNode(Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryPath;)Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNode;
    .locals 8

    .line 105
    invoke-virtual {p0}, Ljavax/swing/tree/DefaultTreeModel;->getRoot()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNode;

    const/4 v1, 0x0

    move-object v2, v0

    move v0, v1

    .line 108
    :goto_0
    invoke-virtual {p1}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryPath;->size()I

    move-result v3

    if-lt v0, v3, :cond_0

    return-object v2

    .line 109
    :cond_0
    invoke-virtual {p1, v0}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryPath;->categoryElementAt(I)Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryElement;

    move-result-object v3

    .line 112
    invoke-virtual {v2}, Ljavax/swing/tree/DefaultMutableTreeNode;->children()Ljava/util/Enumeration;

    move-result-object v4

    .line 115
    :cond_1
    invoke-interface {v4}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-nez v5, :cond_2

    move-object v5, v2

    move v2, v1

    goto :goto_1

    .line 116
    :cond_2
    invoke-interface {v4}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNode;

    .line 117
    invoke-virtual {v5}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNode;->getTitle()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    .line 119
    invoke-virtual {v3}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryElement;->getTitle()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v7

    .line 120
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    const/4 v2, 0x1

    :goto_1
    if-nez v2, :cond_3

    const/4 p1, 0x0

    return-object p1

    :cond_3
    add-int/lit8 v0, v0, 0x1

    move-object v2, v5

    goto :goto_0
.end method

.method public getRootCategoryNode()Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNode;
    .locals 1

    .line 93
    invoke-virtual {p0}, Ljavax/swing/tree/DefaultTreeModel;->getRoot()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNode;

    return-object v0
.end method

.method public getTreePathToRoot(Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNode;)Ljavax/swing/tree/TreePath;
    .locals 1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 306
    :cond_0
    new-instance v0, Ljavax/swing/tree/TreePath;

    invoke-virtual {p0, p1}, Ljavax/swing/tree/DefaultTreeModel;->getPathToRoot(Ljavax/swing/tree/TreeNode;)[Ljavax/swing/tree/TreeNode;

    move-result-object p1

    invoke-direct {v0, p1}, Ljavax/swing/tree/TreePath;-><init>([Ljava/lang/Object;)V

    return-object v0
.end method

.method public isCategoryPathActive(Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryPath;)Z
    .locals 9

    .line 141
    invoke-virtual {p0}, Ljavax/swing/tree/DefaultTreeModel;->getRoot()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNode;

    const/4 v1, 0x0

    move-object v2, v0

    move v0, v1

    move v3, v0

    .line 145
    :goto_0
    invoke-virtual {p1}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryPath;->size()I

    move-result v4

    if-lt v0, v4, :cond_0

    return v3

    .line 146
    :cond_0
    invoke-virtual {p1, v0}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryPath;->categoryElementAt(I)Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryElement;

    move-result-object v3

    .line 149
    invoke-virtual {v2}, Ljavax/swing/tree/DefaultMutableTreeNode;->children()Ljava/util/Enumeration;

    move-result-object v4

    .line 154
    :cond_1
    invoke-interface {v4}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    const/4 v6, 0x1

    if-nez v5, :cond_2

    move v3, v1

    move v6, v3

    goto :goto_1

    .line 155
    :cond_2
    invoke-interface {v4}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNode;

    .line 156
    invoke-virtual {v5}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNode;->getTitle()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v7

    .line 158
    invoke-virtual {v3}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryElement;->getTitle()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v8

    .line 159
    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 164
    invoke-virtual {v5}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNode;->isSelected()Z

    move-result v2

    if-eqz v2, :cond_3

    move-object v2, v5

    move v3, v6

    goto :goto_1

    :cond_3
    move v3, v1

    move-object v2, v5

    :goto_1
    if-eqz v3, :cond_5

    if-nez v6, :cond_4

    goto :goto_2

    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_5
    :goto_2
    return v1
.end method

.method protected notifyActionListeners()V
    .locals 2

    .line 313
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerModel;->_listener:Ljava/awt/event/ActionListener;

    if-eqz v0, :cond_0

    .line 314
    iget-object v1, p0, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerModel;->_event:Ljava/awt/event/ActionEvent;

    invoke-interface {v0, v1}, Ljava/awt/event/ActionListener;->actionPerformed(Ljava/awt/event/ActionEvent;)V

    :cond_0
    return-void
.end method

.method protected refresh(Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNode;)V
    .locals 1

    .line 322
    new-instance v0, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerModel$1;

    invoke-direct {v0, p1, p0}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerModel$1;-><init>(Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNode;Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerModel;)V

    invoke-static {v0}, Ljavax/swing/SwingUtilities;->invokeLater(Ljava/lang/Runnable;)V

    return-void
.end method

.method public declared-synchronized removeActionListener(Ljava/awt/event/ActionListener;)V
    .locals 1

    monitor-enter p0

    .line 283
    :try_start_0
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerModel;->_listener:Ljava/awt/event/ActionListener;

    invoke-static {v0, p1}, Ljava/awt/AWTEventMulticaster;->remove(Ljava/awt/event/ActionListener;Ljava/awt/event/ActionListener;)Ljava/awt/event/ActionListener;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerModel;->_listener:Ljava/awt/event/ActionListener;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 282
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public resetAllNodeCounts()V
    .locals 2

    .line 287
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerModel;->getRootCategoryNode()Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNode;

    move-result-object v0

    invoke-virtual {v0}, Ljavax/swing/tree/DefaultMutableTreeNode;->depthFirstEnumeration()Ljava/util/Enumeration;

    move-result-object v0

    .line 289
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    .line 290
    :cond_0
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNode;

    .line 291
    invoke-virtual {v1}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNode;->resetNumberOfContainedRecords()V

    .line 292
    invoke-virtual {p0, v1}, Ljavax/swing/tree/DefaultTreeModel;->nodeChanged(Ljavax/swing/tree/TreeNode;)V

    goto :goto_0
.end method

.method public setDescendantSelection(Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNode;Z)V
    .locals 2

    .line 247
    invoke-virtual {p1}, Ljavax/swing/tree/DefaultMutableTreeNode;->depthFirstEnumeration()Ljava/util/Enumeration;

    move-result-object p1

    .line 249
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v0

    if-nez v0, :cond_1

    .line 257
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerModel;->notifyActionListeners()V

    return-void

    .line 250
    :cond_1
    invoke-interface {p1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNode;

    .line 252
    invoke-virtual {v0}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNode;->isSelected()Z

    move-result v1

    if-eq v1, p2, :cond_0

    .line 253
    invoke-virtual {v0, p2}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNode;->setSelected(Z)V

    .line 254
    invoke-virtual {p0, v0}, Ljavax/swing/tree/DefaultTreeModel;->nodeChanged(Ljavax/swing/tree/TreeNode;)V

    goto :goto_0
.end method

.method public setParentSelection(Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNode;Z)V
    .locals 4

    .line 261
    invoke-virtual {p0, p1}, Ljavax/swing/tree/DefaultTreeModel;->getPathToRoot(Ljavax/swing/tree/TreeNode;)[Ljavax/swing/tree/TreeNode;

    move-result-object p1

    .line 262
    array-length v0, p1

    const/4 v1, 0x1

    :goto_0
    if-lt v1, v0, :cond_0

    .line 274
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerModel;->notifyActionListeners()V

    return-void

    .line 268
    :cond_0
    aget-object v2, p1, v1

    check-cast v2, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNode;

    .line 269
    invoke-virtual {v2}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNode;->isSelected()Z

    move-result v3

    if-eq v3, p2, :cond_1

    .line 270
    invoke-virtual {v2, p2}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNode;->setSelected(Z)V

    .line 271
    invoke-virtual {p0, v2}, Ljavax/swing/tree/DefaultTreeModel;->nodeChanged(Ljavax/swing/tree/TreeNode;)V

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public update(Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNode;Z)V
    .locals 1

    .line 235
    invoke-virtual {p1}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNode;->isSelected()Z

    move-result v0

    if-ne v0, p2, :cond_0

    return-void

    :cond_0
    if-eqz p2, :cond_1

    const/4 p2, 0x1

    .line 240
    invoke-virtual {p0, p1, p2}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerModel;->setParentSelection(Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNode;Z)V

    goto :goto_0

    :cond_1
    const/4 p2, 0x0

    .line 242
    invoke-virtual {p0, p1, p2}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerModel;->setDescendantSelection(Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryNode;Z)V

    :goto_0
    return-void
.end method
