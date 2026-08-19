.class Lorg/apache/log4j/lf5/viewer/LogTable$LogTableListSelectionListener;
.super Ljava/lang/Object;
.source "LogTable.java"

# interfaces
.implements Ljavax/swing/event/ListSelectionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/log4j/lf5/viewer/LogTable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "LogTableListSelectionListener"
.end annotation


# instance fields
.field protected _table:Ljavax/swing/JTable;

.field private final synthetic this$0:Lorg/apache/log4j/lf5/viewer/LogTable;


# direct methods
.method public constructor <init>(Lorg/apache/log4j/lf5/viewer/LogTable;Ljavax/swing/JTable;)V
    .locals 0

    .line 211
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p1, p0, Lorg/apache/log4j/lf5/viewer/LogTable$LogTableListSelectionListener;->this$0:Lorg/apache/log4j/lf5/viewer/LogTable;

    .line 212
    iput-object p2, p0, Lorg/apache/log4j/lf5/viewer/LogTable$LogTableListSelectionListener;->_table:Ljavax/swing/JTable;

    return-void
.end method


# virtual methods
.method public valueChanged(Ljavax/swing/event/ListSelectionEvent;)V
    .locals 5

    .line 217
    invoke-virtual {p1}, Ljavax/swing/event/ListSelectionEvent;->getValueIsAdjusting()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 221
    :cond_0
    invoke-virtual {p1}, Ljava/util/EventObject;->getSource()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljavax/swing/ListSelectionModel;

    .line 222
    invoke-interface {p1}, Ljavax/swing/ListSelectionModel;->isSelectionEmpty()Z

    move-result v0

    if-nez v0, :cond_8

    .line 225
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 226
    invoke-interface {p1}, Ljavax/swing/ListSelectionModel;->getMinSelectionIndex()I

    move-result p1

    const/4 v1, 0x0

    .line 228
    :goto_0
    iget-object v2, p0, Lorg/apache/log4j/lf5/viewer/LogTable$LogTableListSelectionListener;->this$0:Lorg/apache/log4j/lf5/viewer/LogTable;

    iget v2, v2, Lorg/apache/log4j/lf5/viewer/LogTable;->_numCols:I

    add-int/lit8 v2, v2, -0x1

    if-lt v1, v2, :cond_2

    .line 254
    new-instance v1, Ljava/lang/StringBuffer;

    iget-object v2, p0, Lorg/apache/log4j/lf5/viewer/LogTable$LogTableListSelectionListener;->this$0:Lorg/apache/log4j/lf5/viewer/LogTable;

    iget-object v2, v2, Lorg/apache/log4j/lf5/viewer/LogTable;->_colNames:[Lorg/apache/log4j/lf5/viewer/LogTableColumn;

    iget-object v3, p0, Lorg/apache/log4j/lf5/viewer/LogTable$LogTableListSelectionListener;->this$0:Lorg/apache/log4j/lf5/viewer/LogTable;

    iget v3, v3, Lorg/apache/log4j/lf5/viewer/LogTable;->_numCols:I

    add-int/lit8 v3, v3, -0x1

    aget-object v2, v2, v3

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    const-string v2, ":\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 255
    iget-object v1, p0, Lorg/apache/log4j/lf5/viewer/LogTable$LogTableListSelectionListener;->_table:Ljavax/swing/JTable;

    invoke-virtual {v1}, Ljavax/swing/JTable;->getModel()Ljavax/swing/table/TableModel;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/log4j/lf5/viewer/LogTable$LogTableListSelectionListener;->this$0:Lorg/apache/log4j/lf5/viewer/LogTable;

    iget v2, v2, Lorg/apache/log4j/lf5/viewer/LogTable;->_numCols:I

    add-int/lit8 v2, v2, -0x1

    invoke-interface {v1, p1, v2}, Ljavax/swing/table/TableModel;->getValueAt(II)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 257
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 260
    :cond_1
    iget-object p1, p0, Lorg/apache/log4j/lf5/viewer/LogTable$LogTableListSelectionListener;->this$0:Lorg/apache/log4j/lf5/viewer/LogTable;

    iget-object p1, p1, Lorg/apache/log4j/lf5/viewer/LogTable;->_detailTextArea:Ljavax/swing/JTextArea;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljavax/swing/text/JTextComponent;->setText(Ljava/lang/String;)V

    goto :goto_1

    :cond_2
    const-string v2, ""

    .line 230
    iget-object v3, p0, Lorg/apache/log4j/lf5/viewer/LogTable$LogTableListSelectionListener;->_table:Ljavax/swing/JTable;

    invoke-virtual {v3}, Ljavax/swing/JTable;->getModel()Ljavax/swing/table/TableModel;

    move-result-object v3

    invoke-interface {v3, p1, v1}, Ljavax/swing/table/TableModel;->getValueAt(II)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_3

    .line 232
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 235
    :cond_3
    new-instance v3, Ljava/lang/StringBuffer;

    iget-object v4, p0, Lorg/apache/log4j/lf5/viewer/LogTable$LogTableListSelectionListener;->this$0:Lorg/apache/log4j/lf5/viewer/LogTable;

    iget-object v4, v4, Lorg/apache/log4j/lf5/viewer/LogTable;->_colNames:[Lorg/apache/log4j/lf5/viewer/LogTableColumn;

    aget-object v4, v4, v1

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v3, "\t"

    .line 236
    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 238
    iget-object v3, p0, Lorg/apache/log4j/lf5/viewer/LogTable$LogTableListSelectionListener;->this$0:Lorg/apache/log4j/lf5/viewer/LogTable;

    iget v3, v3, Lorg/apache/log4j/lf5/viewer/LogTable;->_colThread:I

    if-eq v1, v3, :cond_4

    iget-object v3, p0, Lorg/apache/log4j/lf5/viewer/LogTable$LogTableListSelectionListener;->this$0:Lorg/apache/log4j/lf5/viewer/LogTable;

    iget v3, v3, Lorg/apache/log4j/lf5/viewer/LogTable;->_colMessage:I

    if-eq v1, v3, :cond_4

    iget-object v3, p0, Lorg/apache/log4j/lf5/viewer/LogTable$LogTableListSelectionListener;->this$0:Lorg/apache/log4j/lf5/viewer/LogTable;

    iget v3, v3, Lorg/apache/log4j/lf5/viewer/LogTable;->_colLevel:I

    if-ne v1, v3, :cond_5

    :cond_4
    const-string v3, "\t"

    .line 239
    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 242
    :cond_5
    iget-object v3, p0, Lorg/apache/log4j/lf5/viewer/LogTable$LogTableListSelectionListener;->this$0:Lorg/apache/log4j/lf5/viewer/LogTable;

    iget v3, v3, Lorg/apache/log4j/lf5/viewer/LogTable;->_colDate:I

    if-eq v1, v3, :cond_6

    iget-object v3, p0, Lorg/apache/log4j/lf5/viewer/LogTable$LogTableListSelectionListener;->this$0:Lorg/apache/log4j/lf5/viewer/LogTable;

    iget v3, v3, Lorg/apache/log4j/lf5/viewer/LogTable;->_colNDC:I

    if-ne v1, v3, :cond_7

    :cond_6
    const-string v3, "\t\t"

    .line 243
    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 251
    :cond_7
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v2, "\n"

    .line 252
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    :cond_8
    :goto_1
    return-void
.end method
