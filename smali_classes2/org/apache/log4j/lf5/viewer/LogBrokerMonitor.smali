.class public Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;
.super Ljava/lang/Object;
.source "LogBrokerMonitor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$LogBrokerMonitorWindowAdaptor;
    }
.end annotation


# static fields
.field public static final DETAILED_VIEW:Ljava/lang/String; = "Detailed"


# instance fields
.field protected _NDCTextFilter:Ljava/lang/String;

.field protected _callSystemExitOnClose:Z

.field protected _categoryExplorerTree:Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerTree;

.field protected _columns:Ljava/util/List;

.field protected _configurationManager:Lorg/apache/log4j/lf5/viewer/configure/ConfigurationManager;

.field protected _currentView:Ljava/lang/String;

.field protected _displayedLogBrokerProperties:Ljava/util/List;

.field protected _fileLocation:Ljava/io/File;

.field protected _fontName:Ljava/lang/String;

.field protected _fontSize:I

.field protected _fontSizeCombo:Ljavax/swing/JComboBox;

.field protected _isDisposed:Z

.field protected _lastTableViewportSize:Ljava/awt/Dimension;

.field protected _leastSevereDisplayedLogLevel:Lorg/apache/log4j/lf5/LogLevel;

.field protected _levels:Ljava/util/List;

.field protected _loadSystemFonts:Z

.field protected _lock:Ljava/lang/Object;

.field protected _logLevelMenuItems:Ljava/util/Map;

.field protected _logMonitorFrame:Ljavax/swing/JFrame;

.field protected _logMonitorFrameHeight:I

.field protected _logMonitorFrameWidth:I

.field protected _logTableColumnMenuItems:Ljava/util/Map;

.field protected _logTableScrollPane:Ljavax/swing/JScrollPane;

.field protected _mruFileManager:Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;

.field protected _searchText:Ljava/lang/String;

.field protected _statusLabel:Ljavax/swing/JLabel;

.field protected _table:Lorg/apache/log4j/lf5/viewer/LogTable;

.field protected _trackTableScrollPane:Z


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 3

    .line 113
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x226

    .line 68
    iput v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_logMonitorFrameWidth:I

    const/16 v0, 0x1f4

    .line 69
    iput v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_logMonitorFrameHeight:I

    const-string v0, ""

    .line 73
    iput-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_NDCTextFilter:Ljava/lang/String;

    .line 74
    sget-object v0, Lorg/apache/log4j/lf5/LogLevel;->DEBUG:Lorg/apache/log4j/lf5/LogLevel;

    iput-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_leastSevereDisplayedLogLevel:Lorg/apache/log4j/lf5/LogLevel;

    .line 78
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_lock:Ljava/lang/Object;

    const/16 v0, 0xa

    .line 81
    iput v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_fontSize:I

    const-string v0, "Dialog"

    .line 82
    iput-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_fontName:Ljava/lang/String;

    const-string v0, "Detailed"

    .line 83
    iput-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_currentView:Ljava/lang/String;

    const/4 v0, 0x0

    .line 85
    iput-boolean v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_loadSystemFonts:Z

    const/4 v1, 0x1

    .line 86
    iput-boolean v1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_trackTableScrollPane:Z

    .line 88
    iput-boolean v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_callSystemExitOnClose:Z

    .line 89
    new-instance v2, Ljava/util/Vector;

    invoke-direct {v2}, Ljava/util/Vector;-><init>()V

    iput-object v2, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_displayedLogBrokerProperties:Ljava/util/List;

    .line 91
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_logLevelMenuItems:Ljava/util/Map;

    .line 92
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_logTableColumnMenuItems:Ljava/util/Map;

    const/4 v2, 0x0

    .line 94
    iput-object v2, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_levels:Ljava/util/List;

    .line 95
    iput-object v2, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_columns:Ljava/util/List;

    .line 96
    iput-boolean v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_isDisposed:Z

    .line 98
    iput-object v2, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_configurationManager:Lorg/apache/log4j/lf5/viewer/configure/ConfigurationManager;

    .line 99
    iput-object v2, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_mruFileManager:Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;

    .line 100
    iput-object v2, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_fileLocation:Ljava/io/File;

    .line 115
    iput-object p1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_levels:Ljava/util/List;

    .line 116
    invoke-static {}, Lorg/apache/log4j/lf5/viewer/LogTableColumn;->getLogTableColumns()Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_columns:Ljava/util/List;

    const-string p1, "monitor.exit"

    .line 121
    invoke-static {p1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    const-string p1, "false"

    .line 125
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    const-string v0, "true"

    .line 127
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 128
    iput-boolean v1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_callSystemExitOnClose:Z

    .line 131
    :cond_1
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->initComponents()V

    .line 134
    iget-object p1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_logMonitorFrame:Ljavax/swing/JFrame;

    .line 135
    new-instance v0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$LogBrokerMonitorWindowAdaptor;

    invoke-direct {v0, p0, p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$LogBrokerMonitorWindowAdaptor;-><init>(Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;)V

    .line 134
    invoke-virtual {p1, v0}, Ljava/awt/Window;->addWindowListener(Ljava/awt/event/WindowListener;)V

    return-void
.end method


# virtual methods
.method public addDisplayedProperty(Ljava/lang/Object;)V
    .locals 1

    .line 265
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_displayedLogBrokerProperties:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public addMessage(Lorg/apache/log4j/lf5/LogRecord;)V
    .locals 2

    .line 220
    iget-boolean v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_isDisposed:Z

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    return-void

    .line 226
    :cond_0
    new-instance v0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$2;

    invoke-direct {v0, p1, p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$2;-><init>(Lorg/apache/log4j/lf5/LogRecord;Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;)V

    invoke-static {v0}, Ljavax/swing/SwingUtilities;->invokeLater(Ljava/lang/Runnable;)V

    return-void
.end method

.method protected addTableModelProperties()V
    .locals 2

    .line 623
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_table:Lorg/apache/log4j/lf5/viewer/LogTable;

    invoke-virtual {v0}, Lorg/apache/log4j/lf5/viewer/LogTable;->getFilteredLogTableModel()Lorg/apache/log4j/lf5/viewer/FilteredLogTableModel;

    move-result-object v0

    .line 625
    new-instance v1, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$5;

    invoke-direct {v1, p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$5;-><init>(Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;)V

    invoke-virtual {p0, v1}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->addDisplayedProperty(Ljava/lang/Object;)V

    .line 630
    new-instance v1, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$6;

    invoke-direct {v1, v0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$6;-><init>(Lorg/apache/log4j/lf5/viewer/FilteredLogTableModel;)V

    invoke-virtual {p0, v1}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->addDisplayedProperty(Ljava/lang/Object;)V

    return-void
.end method

.method protected centerFrame(Ljavax/swing/JFrame;)V
    .locals 4

    .line 1374
    invoke-static {}, Ljava/awt/Toolkit;->getDefaultToolkit()Ljava/awt/Toolkit;

    move-result-object v0

    invoke-virtual {v0}, Ljava/awt/Toolkit;->getScreenSize()Ljava/awt/Dimension;

    move-result-object v0

    .line 1375
    invoke-virtual {p1}, Ljava/awt/Component;->getSize()Ljava/awt/Dimension;

    move-result-object v1

    .line 1377
    iget v2, v0, Ljava/awt/Dimension;->width:I

    iget v3, v1, Ljava/awt/Dimension;->width:I

    sub-int/2addr v2, v3

    div-int/lit8 v2, v2, 0x2

    .line 1378
    iget v0, v0, Ljava/awt/Dimension;->height:I

    iget v1, v1, Ljava/awt/Dimension;->height:I

    sub-int/2addr v0, v1

    div-int/lit8 v0, v0, 0x2

    .line 1377
    invoke-virtual {p1, v2, v0}, Ljava/awt/Component;->setLocation(II)V

    return-void
.end method

.method protected changeFontSizeCombo(Ljavax/swing/JComboBox;I)I
    .locals 6

    .line 434
    invoke-virtual {p1}, Ljavax/swing/JComboBox;->getItemCount()I

    move-result v0

    const/4 v1, 0x0

    .line 437
    invoke-virtual {p1, v1}, Ljavax/swing/JComboBox;->getItemAt(I)Ljava/lang/Object;

    move-result-object v2

    .line 438
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    :goto_0
    if-lt v1, v0, :cond_0

    .line 447
    invoke-virtual {p1, v2}, Ljavax/swing/JComboBox;->setSelectedItem(Ljava/lang/Object;)V

    return v3

    .line 440
    :cond_0
    invoke-virtual {p1, v1}, Ljavax/swing/JComboBox;->getItemAt(I)Ljava/lang/Object;

    move-result-object v4

    .line 441
    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    if-ge v3, v5, :cond_1

    if-gt v5, p2, :cond_1

    move-object v2, v4

    move v3, v5

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method protected clearDetailTextArea()V
    .locals 2

    .line 425
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_table:Lorg/apache/log4j/lf5/viewer/LogTable;

    iget-object v0, v0, Lorg/apache/log4j/lf5/viewer/LogTable;->_detailTextArea:Ljavax/swing/JTextArea;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljavax/swing/text/JTextComponent;->setText(Ljava/lang/String;)V

    return-void
.end method

.method protected closeAfterConfirm()V
    .locals 8

    .line 1487
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 1489
    iget-boolean v1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_callSystemExitOnClose:Z

    if-nez v1, :cond_0

    const-string v1, "Are you sure you want to close the logging "

    .line 1490
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v1, "console?\n"

    .line 1491
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v1, "(Note: This will not shut down the Virtual Machine,\n"

    .line 1492
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v1, "or the Swing event thread.)"

    .line 1493
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    :cond_0
    const-string v1, "Are you sure you want to exit?\n"

    .line 1495
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v1, "This will shut down the Virtual Machine.\n"

    .line 1496
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    :goto_0
    const-string v1, "Are you sure you want to dispose of the Logging Console?"

    .line 1502
    iget-boolean v2, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_callSystemExitOnClose:Z

    const/4 v3, 0x1

    if-ne v2, v3, :cond_1

    const-string v1, "Are you sure you want to exit?"

    move-object v4, v1

    goto :goto_1

    :cond_1
    move-object v4, v1

    .line 1506
    :goto_1
    iget-object v2, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_logMonitorFrame:Ljavax/swing/JFrame;

    .line 1507
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x2

    const/4 v6, 0x3

    const/4 v7, 0x0

    .line 1505
    invoke-static/range {v2 .. v7}, Ljavax/swing/JOptionPane;->showConfirmDialog(Ljava/awt/Component;Ljava/lang/Object;Ljava/lang/String;IILjavax/swing/Icon;)I

    move-result v0

    if-nez v0, :cond_2

    .line 1515
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->dispose()V

    :cond_2
    return-void
.end method

.method protected createAllLogLevelsMenuItem()Ljavax/swing/JMenuItem;
    .locals 2

    .line 712
    new-instance v0, Ljavax/swing/JMenuItem;

    const-string v1, "Show all LogLevels"

    invoke-direct {v0, v1}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;)V

    const/16 v1, 0x73

    .line 713
    invoke-virtual {v0, v1}, Ljavax/swing/AbstractButton;->setMnemonic(C)V

    .line 714
    new-instance v1, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$8;

    invoke-direct {v1, p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$8;-><init>(Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;)V

    invoke-virtual {v0, v1}, Ljavax/swing/AbstractButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    return-object v0
.end method

.method protected createAllLogTableColumnsMenuItem()Ljavax/swing/JMenuItem;
    .locals 2

    .line 876
    new-instance v0, Ljavax/swing/JMenuItem;

    const-string v1, "Show all Columns"

    invoke-direct {v0, v1}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;)V

    const/16 v1, 0x73

    .line 877
    invoke-virtual {v0, v1}, Ljavax/swing/AbstractButton;->setMnemonic(C)V

    .line 878
    new-instance v1, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$14;

    invoke-direct {v1, p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$14;-><init>(Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;)V

    invoke-virtual {v0, v1}, Ljavax/swing/AbstractButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    return-object v0
.end method

.method protected createCloseMI()Ljavax/swing/JMenuItem;
    .locals 2

    .line 955
    new-instance v0, Ljavax/swing/JMenuItem;

    const-string v1, "Close"

    invoke-direct {v0, v1}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;)V

    const/16 v1, 0x63

    .line 956
    invoke-virtual {v0, v1}, Ljavax/swing/AbstractButton;->setMnemonic(C)V

    const-string v1, "control Q"

    .line 957
    invoke-static {v1}, Ljavax/swing/KeyStroke;->getKeyStroke(Ljava/lang/String;)Ljavax/swing/KeyStroke;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/swing/JMenuItem;->setAccelerator(Ljavax/swing/KeyStroke;)V

    .line 958
    new-instance v1, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$18;

    invoke-direct {v1, p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$18;-><init>(Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;)V

    invoke-virtual {v0, v1}, Ljavax/swing/AbstractButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    return-object v0
.end method

.method protected createConfigureMaxRecords()Ljavax/swing/JMenuItem;
    .locals 2

    .line 1035
    new-instance v0, Ljavax/swing/JMenuItem;

    const-string v1, "Set Max Number of Records"

    invoke-direct {v0, v1}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;)V

    const/16 v1, 0x6d

    .line 1036
    invoke-virtual {v0, v1}, Ljavax/swing/AbstractButton;->setMnemonic(C)V

    .line 1037
    new-instance v1, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$23;

    invoke-direct {v1, p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$23;-><init>(Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;)V

    invoke-virtual {v0, v1}, Ljavax/swing/AbstractButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    return-object v0
.end method

.method protected createConfigureMenu()Ljavax/swing/JMenu;
    .locals 2

    .line 1001
    new-instance v0, Ljavax/swing/JMenu;

    const-string v1, "Configure"

    invoke-direct {v0, v1}, Ljavax/swing/JMenu;-><init>(Ljava/lang/String;)V

    const/16 v1, 0x63

    .line 1002
    invoke-virtual {v0, v1}, Ljavax/swing/AbstractButton;->setMnemonic(C)V

    .line 1003
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->createConfigureSave()Ljavax/swing/JMenuItem;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 1004
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->createConfigureReset()Ljavax/swing/JMenuItem;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 1005
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->createConfigureMaxRecords()Ljavax/swing/JMenuItem;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    return-object v0
.end method

.method protected createConfigureReset()Ljavax/swing/JMenuItem;
    .locals 2

    .line 1023
    new-instance v0, Ljavax/swing/JMenuItem;

    const-string v1, "Reset"

    invoke-direct {v0, v1}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;)V

    const/16 v1, 0x72

    .line 1024
    invoke-virtual {v0, v1}, Ljavax/swing/AbstractButton;->setMnemonic(C)V

    .line 1025
    new-instance v1, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$22;

    invoke-direct {v1, p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$22;-><init>(Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;)V

    invoke-virtual {v0, v1}, Ljavax/swing/AbstractButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    return-object v0
.end method

.method protected createConfigureSave()Ljavax/swing/JMenuItem;
    .locals 2

    .line 1011
    new-instance v0, Ljavax/swing/JMenuItem;

    const-string v1, "Save"

    invoke-direct {v0, v1}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;)V

    const/16 v1, 0x73

    .line 1012
    invoke-virtual {v0, v1}, Ljavax/swing/AbstractButton;->setMnemonic(C)V

    .line 1013
    new-instance v1, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$21;

    invoke-direct {v1, p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$21;-><init>(Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;)V

    invoke-virtual {v0, v1}, Ljavax/swing/AbstractButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    return-object v0
.end method

.method protected createDetailTextArea()Ljavax/swing/JTextArea;
    .locals 5

    .line 673
    new-instance v0, Ljavax/swing/JTextArea;

    invoke-direct {v0}, Ljavax/swing/JTextArea;-><init>()V

    .line 674
    new-instance v1, Ljava/awt/Font;

    const-string v2, "Monospaced"

    const/4 v3, 0x0

    const/16 v4, 0xe

    invoke-direct {v1, v2, v3, v4}, Ljava/awt/Font;-><init>(Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljavax/swing/JTextArea;->setFont(Ljava/awt/Font;)V

    const/4 v1, 0x3

    .line 675
    invoke-virtual {v0, v1}, Ljavax/swing/JTextArea;->setTabSize(I)V

    const/4 v1, 0x1

    .line 676
    invoke-virtual {v0, v1}, Ljavax/swing/JTextArea;->setLineWrap(Z)V

    .line 677
    invoke-virtual {v0, v3}, Ljavax/swing/JTextArea;->setWrapStyleWord(Z)V

    return-object v0
.end method

.method protected createEditFindMI()Ljavax/swing/JMenuItem;
    .locals 2

    .line 1126
    new-instance v0, Ljavax/swing/JMenuItem;

    const-string v1, "Find"

    invoke-direct {v0, v1}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;)V

    const/16 v1, 0x66

    .line 1127
    invoke-virtual {v0, v1}, Ljavax/swing/AbstractButton;->setMnemonic(C)V

    const-string v1, "control F"

    .line 1128
    invoke-static {v1}, Ljavax/swing/KeyStroke;->getKeyStroke(Ljava/lang/String;)Ljavax/swing/KeyStroke;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/swing/JMenuItem;->setAccelerator(Ljavax/swing/KeyStroke;)V

    .line 1131
    new-instance v1, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$26;

    invoke-direct {v1, p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$26;-><init>(Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;)V

    .line 1130
    invoke-virtual {v0, v1}, Ljavax/swing/AbstractButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    return-object v0
.end method

.method protected createEditFindNextMI()Ljavax/swing/JMenuItem;
    .locals 2

    .line 1114
    new-instance v0, Ljavax/swing/JMenuItem;

    const-string v1, "Find Next"

    invoke-direct {v0, v1}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;)V

    const/16 v1, 0x6e

    .line 1115
    invoke-virtual {v0, v1}, Ljavax/swing/AbstractButton;->setMnemonic(C)V

    const-string v1, "F3"

    .line 1116
    invoke-static {v1}, Ljavax/swing/KeyStroke;->getKeyStroke(Ljava/lang/String;)Ljavax/swing/KeyStroke;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/swing/JMenuItem;->setAccelerator(Ljavax/swing/KeyStroke;)V

    .line 1117
    new-instance v1, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$25;

    invoke-direct {v1, p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$25;-><init>(Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;)V

    invoke-virtual {v0, v1}, Ljavax/swing/AbstractButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    return-object v0
.end method

.method protected createEditMenu()Ljavax/swing/JMenu;
    .locals 2

    .line 1103
    new-instance v0, Ljavax/swing/JMenu;

    const-string v1, "Edit"

    invoke-direct {v0, v1}, Ljavax/swing/JMenu;-><init>(Ljava/lang/String;)V

    const/16 v1, 0x65

    .line 1104
    invoke-virtual {v0, v1}, Ljavax/swing/AbstractButton;->setMnemonic(C)V

    .line 1105
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->createEditFindMI()Ljavax/swing/JMenuItem;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 1106
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->createEditFindNextMI()Ljavax/swing/JMenuItem;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 1107
    invoke-virtual {v0}, Ljavax/swing/JMenu;->addSeparator()V

    .line 1108
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->createEditSortNDCMI()Ljavax/swing/JMenuItem;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 1109
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->createEditRestoreAllNDCMI()Ljavax/swing/JMenuItem;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    return-object v0
.end method

.method protected createEditRestoreAllNDCMI()Ljavax/swing/JMenuItem;
    .locals 2

    .line 1179
    new-instance v0, Ljavax/swing/JMenuItem;

    const-string v1, "Restore all NDCs"

    invoke-direct {v0, v1}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;)V

    const/16 v1, 0x72

    .line 1180
    invoke-virtual {v0, v1}, Ljavax/swing/AbstractButton;->setMnemonic(C)V

    .line 1182
    new-instance v1, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$28;

    invoke-direct {v1, p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$28;-><init>(Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;)V

    .line 1181
    invoke-virtual {v0, v1}, Ljavax/swing/AbstractButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    return-object v0
.end method

.method protected createEditSortNDCMI()Ljavax/swing/JMenuItem;
    .locals 2

    .line 1153
    new-instance v0, Ljavax/swing/JMenuItem;

    const-string v1, "Sort by NDC"

    invoke-direct {v0, v1}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;)V

    const/16 v1, 0x73

    .line 1154
    invoke-virtual {v0, v1}, Ljavax/swing/AbstractButton;->setMnemonic(C)V

    .line 1156
    new-instance v1, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$27;

    invoke-direct {v1, p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$27;-><init>(Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;)V

    .line 1155
    invoke-virtual {v0, v1}, Ljavax/swing/AbstractButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    return-object v0
.end method

.method protected createExitMI()Ljavax/swing/JMenuItem;
    .locals 2

    .line 990
    new-instance v0, Ljavax/swing/JMenuItem;

    const-string v1, "Exit"

    invoke-direct {v0, v1}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;)V

    const/16 v1, 0x78

    .line 991
    invoke-virtual {v0, v1}, Ljavax/swing/AbstractButton;->setMnemonic(C)V

    .line 992
    new-instance v1, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$20;

    invoke-direct {v1, p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$20;-><init>(Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;)V

    invoke-virtual {v0, v1}, Ljavax/swing/AbstractButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    return-object v0
.end method

.method protected createFileMenu()Ljavax/swing/JMenu;
    .locals 2

    .line 911
    new-instance v0, Ljavax/swing/JMenu;

    const-string v1, "File"

    invoke-direct {v0, v1}, Ljavax/swing/JMenu;-><init>(Ljava/lang/String;)V

    const/16 v1, 0x66

    .line 912
    invoke-virtual {v0, v1}, Ljavax/swing/AbstractButton;->setMnemonic(C)V

    .line 914
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->createOpenMI()Ljavax/swing/JMenuItem;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 915
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->createOpenURLMI()Ljavax/swing/JMenuItem;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 916
    invoke-virtual {v0}, Ljavax/swing/JMenu;->addSeparator()V

    .line 917
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->createCloseMI()Ljavax/swing/JMenuItem;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 918
    invoke-virtual {p0, v0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->createMRUFileListMI(Ljavax/swing/JMenu;)V

    .line 919
    invoke-virtual {v0}, Ljavax/swing/JMenu;->addSeparator()V

    .line 920
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->createExitMI()Ljavax/swing/JMenuItem;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    return-object v0
.end method

.method protected createHelpMenu()Ljavax/swing/JMenu;
    .locals 2

    .line 1075
    new-instance v0, Ljavax/swing/JMenu;

    const-string v1, "Help"

    invoke-direct {v0, v1}, Ljavax/swing/JMenu;-><init>(Ljava/lang/String;)V

    const/16 v1, 0x68

    .line 1076
    invoke-virtual {v0, v1}, Ljavax/swing/AbstractButton;->setMnemonic(C)V

    .line 1077
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->createHelpProperties()Ljavax/swing/JMenuItem;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    return-object v0
.end method

.method protected createHelpProperties()Ljavax/swing/JMenuItem;
    .locals 3

    const-string v0, "LogFactor5 Properties"

    .line 1083
    new-instance v1, Ljavax/swing/JMenuItem;

    const-string v2, "LogFactor5 Properties"

    invoke-direct {v1, v2}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;)V

    const/16 v2, 0x6c

    .line 1084
    invoke-virtual {v1, v2}, Ljavax/swing/AbstractButton;->setMnemonic(C)V

    .line 1085
    new-instance v2, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$24;

    invoke-direct {v2, p0, v0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$24;-><init>(Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljavax/swing/AbstractButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    return-object v1
.end method

.method protected createLogLevelColorMenu()Ljavax/swing/JMenu;
    .locals 3

    .line 738
    new-instance v0, Ljavax/swing/JMenu;

    const-string v1, "Configure LogLevel Colors"

    invoke-direct {v0, v1}, Ljavax/swing/JMenu;-><init>(Ljava/lang/String;)V

    const/16 v1, 0x63

    .line 739
    invoke-virtual {v0, v1}, Ljavax/swing/AbstractButton;->setMnemonic(C)V

    .line 740
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->getLogLevels()Ljava/util/Iterator;

    move-result-object v1

    .line 741
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    return-object v0

    .line 742
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/log4j/lf5/LogLevel;

    invoke-virtual {p0, v2}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->createSubMenuItem(Lorg/apache/log4j/lf5/LogLevel;)Ljavax/swing/JMenuItem;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    goto :goto_0
.end method

.method protected createLogLevelCombo()Ljavax/swing/JComboBox;
    .locals 3

    .line 1332
    new-instance v0, Ljavax/swing/JComboBox;

    invoke-direct {v0}, Ljavax/swing/JComboBox;-><init>()V

    .line 1333
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->getLogLevels()Ljava/util/Iterator;

    move-result-object v1

    .line 1334
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 1337
    iget-object v1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_leastSevereDisplayedLogLevel:Lorg/apache/log4j/lf5/LogLevel;

    invoke-virtual {v0, v1}, Ljavax/swing/JComboBox;->setSelectedItem(Ljava/lang/Object;)V

    .line 1339
    new-instance v1, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$32;

    invoke-direct {v1, p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$32;-><init>(Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;)V

    invoke-virtual {v0, v1}, Ljavax/swing/JComboBox;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 1346
    invoke-virtual {v0}, Ljavax/swing/JComponent;->getPreferredSize()Ljava/awt/Dimension;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/swing/JComponent;->setMaximumSize(Ljava/awt/Dimension;)V

    return-object v0

    .line 1335
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljavax/swing/JComboBox;->addItem(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method protected createLogLevelMenu()Ljavax/swing/JMenu;
    .locals 3

    .line 694
    new-instance v0, Ljavax/swing/JMenu;

    const-string v1, "Log Level"

    invoke-direct {v0, v1}, Ljavax/swing/JMenu;-><init>(Ljava/lang/String;)V

    const/16 v1, 0x6c

    .line 695
    invoke-virtual {v0, v1}, Ljavax/swing/AbstractButton;->setMnemonic(C)V

    .line 696
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->getLogLevels()Ljava/util/Iterator;

    move-result-object v1

    .line 697
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 701
    invoke-virtual {v0}, Ljavax/swing/JMenu;->addSeparator()V

    .line 702
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->createAllLogLevelsMenuItem()Ljavax/swing/JMenuItem;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 703
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->createNoLogLevelsMenuItem()Ljavax/swing/JMenuItem;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 704
    invoke-virtual {v0}, Ljavax/swing/JMenu;->addSeparator()V

    .line 705
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->createLogLevelColorMenu()Ljavax/swing/JMenu;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 706
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->createResetLogLevelColorMenuItem()Ljavax/swing/JMenuItem;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    return-object v0

    .line 698
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/log4j/lf5/LogLevel;

    invoke-virtual {p0, v2}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->getMenuItem(Lorg/apache/log4j/lf5/LogLevel;)Ljavax/swing/JCheckBoxMenuItem;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    goto :goto_0
.end method

.method protected createLogRecordFilter()Lorg/apache/log4j/lf5/LogRecordFilter;
    .locals 1

    .line 579
    new-instance v0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$3;

    invoke-direct {v0, p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$3;-><init>(Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;)V

    return-object v0
.end method

.method protected createLogTableColumnMenuItem(Lorg/apache/log4j/lf5/viewer/LogTableColumn;)Ljavax/swing/JCheckBoxMenuItem;
    .locals 2

    .line 846
    new-instance v0, Ljavax/swing/JCheckBoxMenuItem;

    invoke-virtual {p1}, Lorg/apache/log4j/lf5/viewer/LogTableColumn;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavax/swing/JCheckBoxMenuItem;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x1

    .line 848
    invoke-virtual {v0, v1}, Ljavax/swing/AbstractButton;->setSelected(Z)V

    .line 849
    invoke-virtual {p1}, Lorg/apache/log4j/lf5/viewer/LogTableColumn;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result p1

    invoke-virtual {v0, p1}, Ljavax/swing/AbstractButton;->setMnemonic(C)V

    .line 850
    new-instance p1, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$13;

    invoke-direct {p1, p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$13;-><init>(Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;)V

    invoke-virtual {v0, p1}, Ljavax/swing/AbstractButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    return-object v0
.end method

.method protected createMRUFileListMI(Ljavax/swing/JMenu;)V
    .locals 6

    .line 972
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_mruFileManager:Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;

    invoke-virtual {v0}, Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;->getMRUFileList()[Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 975
    invoke-virtual {p1}, Ljavax/swing/JMenu;->addSeparator()V

    const/4 v1, 0x0

    .line 976
    :goto_0
    array-length v2, v0

    if-lt v1, v2, :cond_0

    goto :goto_1

    .line 977
    :cond_0
    new-instance v2, Ljavax/swing/JMenuItem;

    new-instance v3, Ljava/lang/StringBuffer;

    add-int/lit8 v4, v1, 0x1

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    const-string v5, " "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    aget-object v1, v0, v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;)V

    .line 978
    invoke-virtual {v2, v4}, Ljavax/swing/AbstractButton;->setMnemonic(I)V

    .line 979
    new-instance v1, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$19;

    invoke-direct {v1, p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$19;-><init>(Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;)V

    invoke-virtual {v2, v1}, Ljavax/swing/AbstractButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 984
    invoke-virtual {p1, v2}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    move v1, v4

    goto :goto_0

    :cond_1
    :goto_1
    return-void
.end method

.method protected createMenuBar()Ljavax/swing/JMenuBar;
    .locals 2

    .line 682
    new-instance v0, Ljavax/swing/JMenuBar;

    invoke-direct {v0}, Ljavax/swing/JMenuBar;-><init>()V

    .line 683
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->createFileMenu()Ljavax/swing/JMenu;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/swing/JMenuBar;->add(Ljavax/swing/JMenu;)Ljavax/swing/JMenu;

    .line 684
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->createEditMenu()Ljavax/swing/JMenu;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/swing/JMenuBar;->add(Ljavax/swing/JMenu;)Ljavax/swing/JMenu;

    .line 685
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->createLogLevelMenu()Ljavax/swing/JMenu;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/swing/JMenuBar;->add(Ljavax/swing/JMenu;)Ljavax/swing/JMenu;

    .line 686
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->createViewMenu()Ljavax/swing/JMenu;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/swing/JMenuBar;->add(Ljavax/swing/JMenu;)Ljavax/swing/JMenu;

    .line 687
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->createConfigureMenu()Ljavax/swing/JMenu;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/swing/JMenuBar;->add(Ljavax/swing/JMenu;)Ljavax/swing/JMenu;

    .line 688
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->createHelpMenu()Ljavax/swing/JMenu;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/swing/JMenuBar;->add(Ljavax/swing/JMenu;)Ljavax/swing/JMenu;

    return-object v0
.end method

.method protected createMenuItem(Lorg/apache/log4j/lf5/LogLevel;)Ljavax/swing/JCheckBoxMenuItem;
    .locals 2

    .line 809
    new-instance v0, Ljavax/swing/JCheckBoxMenuItem;

    invoke-virtual {p1}, Lorg/apache/log4j/lf5/LogLevel;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavax/swing/JCheckBoxMenuItem;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x1

    .line 810
    invoke-virtual {v0, v1}, Ljavax/swing/AbstractButton;->setSelected(Z)V

    .line 811
    invoke-virtual {p1}, Lorg/apache/log4j/lf5/LogLevel;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result p1

    invoke-virtual {v0, p1}, Ljavax/swing/AbstractButton;->setMnemonic(C)V

    .line 812
    new-instance p1, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$12;

    invoke-direct {p1, p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$12;-><init>(Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;)V

    invoke-virtual {v0, p1}, Ljavax/swing/AbstractButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    return-object v0
.end method

.method protected createNDCLogRecordFilter(Ljava/lang/String;)Lorg/apache/log4j/lf5/LogRecordFilter;
    .locals 0

    .line 593
    iput-object p1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_NDCTextFilter:Ljava/lang/String;

    .line 594
    new-instance p1, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$4;

    invoke-direct {p1, p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$4;-><init>(Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;)V

    return-object p1
.end method

.method protected createNoLogLevelsMenuItem()Ljavax/swing/JMenuItem;
    .locals 2

    .line 725
    new-instance v0, Ljavax/swing/JMenuItem;

    const-string v1, "Hide all LogLevels"

    invoke-direct {v0, v1}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;)V

    const/16 v1, 0x68

    .line 726
    invoke-virtual {v0, v1}, Ljavax/swing/AbstractButton;->setMnemonic(C)V

    .line 727
    new-instance v1, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$9;

    invoke-direct {v1, p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$9;-><init>(Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;)V

    invoke-virtual {v0, v1}, Ljavax/swing/AbstractButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    return-object v0
.end method

.method protected createNoLogTableColumnsMenuItem()Ljavax/swing/JMenuItem;
    .locals 2

    .line 890
    new-instance v0, Ljavax/swing/JMenuItem;

    const-string v1, "Hide all Columns"

    invoke-direct {v0, v1}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;)V

    const/16 v1, 0x68

    .line 891
    invoke-virtual {v0, v1}, Ljavax/swing/AbstractButton;->setMnemonic(C)V

    .line 892
    new-instance v1, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$15;

    invoke-direct {v1, p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$15;-><init>(Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;)V

    invoke-virtual {v0, v1}, Ljavax/swing/AbstractButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    return-object v0
.end method

.method protected createOpenMI()Ljavax/swing/JMenuItem;
    .locals 2

    .line 929
    new-instance v0, Ljavax/swing/JMenuItem;

    const-string v1, "Open..."

    invoke-direct {v0, v1}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;)V

    const/16 v1, 0x6f

    .line 930
    invoke-virtual {v0, v1}, Ljavax/swing/AbstractButton;->setMnemonic(C)V

    .line 931
    new-instance v1, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$16;

    invoke-direct {v1, p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$16;-><init>(Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;)V

    invoke-virtual {v0, v1}, Ljavax/swing/AbstractButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    return-object v0
.end method

.method protected createOpenURLMI()Ljavax/swing/JMenuItem;
    .locals 2

    .line 944
    new-instance v0, Ljavax/swing/JMenuItem;

    const-string v1, "Open URL..."

    invoke-direct {v0, v1}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;)V

    const/16 v1, 0x75

    .line 945
    invoke-virtual {v0, v1}, Ljavax/swing/AbstractButton;->setMnemonic(C)V

    .line 946
    new-instance v1, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$17;

    invoke-direct {v1, p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$17;-><init>(Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;)V

    invoke-virtual {v0, v1}, Ljavax/swing/AbstractButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    return-object v0
.end method

.method protected createResetLogLevelColorMenuItem()Ljavax/swing/JMenuItem;
    .locals 2

    .line 749
    new-instance v0, Ljavax/swing/JMenuItem;

    const-string v1, "Reset LogLevel Colors"

    invoke-direct {v0, v1}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;)V

    const/16 v1, 0x72

    .line 750
    invoke-virtual {v0, v1}, Ljavax/swing/AbstractButton;->setMnemonic(C)V

    .line 751
    new-instance v1, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$10;

    invoke-direct {v1, p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$10;-><init>(Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;)V

    invoke-virtual {v0, v1}, Ljavax/swing/AbstractButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    return-object v0
.end method

.method protected createStatusArea()Ljavax/swing/JPanel;
    .locals 4

    .line 659
    new-instance v0, Ljavax/swing/JPanel;

    invoke-direct {v0}, Ljavax/swing/JPanel;-><init>()V

    .line 661
    new-instance v1, Ljavax/swing/JLabel;

    const-string v2, "No log records to display."

    invoke-direct {v1, v2}, Ljavax/swing/JLabel;-><init>(Ljava/lang/String;)V

    .line 662
    iput-object v1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_statusLabel:Ljavax/swing/JLabel;

    const/4 v2, 0x2

    .line 663
    invoke-virtual {v1, v2}, Ljavax/swing/JLabel;->setHorizontalAlignment(I)V

    .line 665
    invoke-static {}, Ljavax/swing/BorderFactory;->createEtchedBorder()Ljavax/swing/border/Border;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljavax/swing/JComponent;->setBorder(Ljavax/swing/border/Border;)V

    .line 666
    new-instance v2, Ljava/awt/FlowLayout;

    const/4 v3, 0x0

    invoke-direct {v2, v3, v3, v3}, Ljava/awt/FlowLayout;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/awt/Container;->setLayout(Ljava/awt/LayoutManager;)V

    .line 667
    invoke-virtual {v0, v1}, Ljava/awt/Container;->add(Ljava/awt/Component;)Ljava/awt/Component;

    return-object v0
.end method

.method protected createSubMenuItem(Lorg/apache/log4j/lf5/LogLevel;)Ljavax/swing/JMenuItem;
    .locals 3

    .line 780
    new-instance v0, Ljavax/swing/JMenuItem;

    invoke-virtual {p1}, Lorg/apache/log4j/lf5/LogLevel;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;)V

    .line 782
    invoke-virtual {p1}, Lorg/apache/log4j/lf5/LogLevel;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-virtual {v0, v1}, Ljavax/swing/AbstractButton;->setMnemonic(C)V

    .line 783
    new-instance v1, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$11;

    invoke-direct {v1, p1, v0, p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$11;-><init>(Lorg/apache/log4j/lf5/LogLevel;Ljavax/swing/JMenuItem;Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;)V

    invoke-virtual {v0, v1}, Ljavax/swing/AbstractButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    return-object v0
.end method

.method protected createToolBar()Ljavax/swing/JToolBar;
    .locals 7

    .line 1196
    new-instance v0, Ljavax/swing/JToolBar;

    invoke-direct {v0}, Ljavax/swing/JToolBar;-><init>()V

    const-string v1, "JToolBar.isRollover"

    .line 1197
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1, v2}, Ljavax/swing/JComponent;->putClientProperty(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1198
    new-instance v1, Ljavax/swing/JComboBox;

    invoke-direct {v1}, Ljavax/swing/JComboBox;-><init>()V

    .line 1199
    new-instance v2, Ljavax/swing/JComboBox;

    invoke-direct {v2}, Ljavax/swing/JComboBox;-><init>()V

    .line 1200
    iput-object v2, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_fontSizeCombo:Ljavax/swing/JComboBox;

    .line 1202
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    if-nez v3, :cond_0

    .line 1204
    invoke-static {}, Ljava/lang/ClassLoader;->getSystemClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    :cond_0
    const-string v4, "org/apache/log4j/lf5/viewer/images/channelexplorer_new.gif"

    .line 1206
    invoke-virtual {v3, v4}, Ljava/lang/ClassLoader;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v3

    const/4 v4, 0x0

    if-eqz v3, :cond_1

    .line 1212
    new-instance v4, Ljavax/swing/ImageIcon;

    invoke-direct {v4, v3}, Ljavax/swing/ImageIcon;-><init>(Ljava/net/URL;)V

    .line 1215
    :cond_1
    new-instance v3, Ljavax/swing/JButton;

    const-string v5, "Clear Log Table"

    invoke-direct {v3, v5}, Ljavax/swing/JButton;-><init>(Ljava/lang/String;)V

    if-eqz v4, :cond_2

    .line 1218
    invoke-virtual {v3, v4}, Ljavax/swing/AbstractButton;->setIcon(Ljavax/swing/Icon;)V

    :cond_2
    const-string v4, "Clear Log Table."

    .line 1221
    invoke-virtual {v3, v4}, Ljavax/swing/JComponent;->setToolTipText(Ljava/lang/String;)V

    .line 1225
    new-instance v4, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$29;

    invoke-direct {v4, p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$29;-><init>(Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;)V

    .line 1224
    invoke-virtual {v3, v4}, Ljavax/swing/AbstractButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 1236
    invoke-static {}, Ljava/awt/Toolkit;->getDefaultToolkit()Ljava/awt/Toolkit;

    move-result-object v4

    .line 1241
    iget-boolean v5, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_loadSystemFonts:Z

    if-eqz v5, :cond_3

    .line 1243
    invoke-static {}, Ljava/awt/GraphicsEnvironment;->getLocalGraphicsEnvironment()Ljava/awt/GraphicsEnvironment;

    move-result-object v4

    invoke-virtual {v4}, Ljava/awt/GraphicsEnvironment;->getAvailableFontFamilyNames()[Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    .line 1245
    :cond_3
    invoke-virtual {v4}, Ljava/awt/Toolkit;->getFontList()[Ljava/lang/String;

    move-result-object v4

    :goto_0
    const/4 v5, 0x0

    .line 1248
    :goto_1
    array-length v6, v4

    if-lt v5, v6, :cond_4

    .line 1252
    iget-object v4, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_fontName:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljavax/swing/JComboBox;->setSelectedItem(Ljava/lang/Object;)V

    .line 1256
    new-instance v4, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$30;

    invoke-direct {v4, p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$30;-><init>(Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;)V

    .line 1254
    invoke-virtual {v1, v4}, Ljavax/swing/JComboBox;->addActionListener(Ljava/awt/event/ActionListener;)V

    const-string v4, "8"

    .line 1266
    invoke-virtual {v2, v4}, Ljavax/swing/JComboBox;->addItem(Ljava/lang/Object;)V

    const-string v4, "9"

    .line 1267
    invoke-virtual {v2, v4}, Ljavax/swing/JComboBox;->addItem(Ljava/lang/Object;)V

    const-string v4, "10"

    .line 1268
    invoke-virtual {v2, v4}, Ljavax/swing/JComboBox;->addItem(Ljava/lang/Object;)V

    const-string v4, "12"

    .line 1269
    invoke-virtual {v2, v4}, Ljavax/swing/JComboBox;->addItem(Ljava/lang/Object;)V

    const-string v4, "14"

    .line 1270
    invoke-virtual {v2, v4}, Ljavax/swing/JComboBox;->addItem(Ljava/lang/Object;)V

    const-string v4, "16"

    .line 1271
    invoke-virtual {v2, v4}, Ljavax/swing/JComboBox;->addItem(Ljava/lang/Object;)V

    const-string v4, "18"

    .line 1272
    invoke-virtual {v2, v4}, Ljavax/swing/JComboBox;->addItem(Ljava/lang/Object;)V

    const-string v4, "24"

    .line 1273
    invoke-virtual {v2, v4}, Ljavax/swing/JComboBox;->addItem(Ljava/lang/Object;)V

    .line 1275
    iget v4, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_fontSize:I

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljavax/swing/JComboBox;->setSelectedItem(Ljava/lang/Object;)V

    .line 1277
    new-instance v4, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$31;

    invoke-direct {v4, p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$31;-><init>(Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;)V

    .line 1276
    invoke-virtual {v2, v4}, Ljavax/swing/JComboBox;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 1290
    new-instance v4, Ljavax/swing/JLabel;

    const-string v5, " Font: "

    invoke-direct {v4, v5}, Ljavax/swing/JLabel;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v4}, Ljava/awt/Container;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 1291
    invoke-virtual {v0, v1}, Ljava/awt/Container;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 1292
    invoke-virtual {v0, v2}, Ljava/awt/Container;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 1293
    invoke-virtual {v0}, Ljavax/swing/JToolBar;->addSeparator()V

    .line 1294
    invoke-virtual {v0}, Ljavax/swing/JToolBar;->addSeparator()V

    .line 1295
    invoke-virtual {v0, v3}, Ljava/awt/Container;->add(Ljava/awt/Component;)Ljava/awt/Component;

    const/high16 v4, 0x3f000000    # 0.5f

    .line 1297
    invoke-virtual {v3, v4}, Ljavax/swing/JComponent;->setAlignmentY(F)V

    .line 1298
    invoke-virtual {v3, v4}, Ljavax/swing/JComponent;->setAlignmentX(F)V

    .line 1300
    invoke-virtual {v1}, Ljavax/swing/JComponent;->getPreferredSize()Ljava/awt/Dimension;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljavax/swing/JComponent;->setMaximumSize(Ljava/awt/Dimension;)V

    .line 1302
    invoke-virtual {v2}, Ljavax/swing/JComponent;->getPreferredSize()Ljava/awt/Dimension;

    move-result-object v1

    .line 1301
    invoke-virtual {v2, v1}, Ljavax/swing/JComponent;->setMaximumSize(Ljava/awt/Dimension;)V

    return-object v0

    .line 1249
    :cond_4
    aget-object v6, v4, v5

    invoke-virtual {v1, v6}, Ljavax/swing/JComboBox;->addItem(Ljava/lang/Object;)V

    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_1
.end method

.method protected createViewMenu()Ljavax/swing/JMenu;
    .locals 3

    .line 823
    new-instance v0, Ljavax/swing/JMenu;

    const-string v1, "View"

    invoke-direct {v0, v1}, Ljavax/swing/JMenu;-><init>(Ljava/lang/String;)V

    const/16 v1, 0x76

    .line 824
    invoke-virtual {v0, v1}, Ljavax/swing/AbstractButton;->setMnemonic(C)V

    .line 825
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->getLogTableColumns()Ljava/util/Iterator;

    move-result-object v1

    .line 826
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 830
    invoke-virtual {v0}, Ljavax/swing/JMenu;->addSeparator()V

    .line 831
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->createAllLogTableColumnsMenuItem()Ljavax/swing/JMenuItem;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 832
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->createNoLogTableColumnsMenuItem()Ljavax/swing/JMenuItem;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    return-object v0

    .line 827
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/log4j/lf5/viewer/LogTableColumn;

    invoke-virtual {p0, v2}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->getLogTableColumnMenuItem(Lorg/apache/log4j/lf5/viewer/LogTableColumn;)Ljavax/swing/JCheckBoxMenuItem;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    goto :goto_0
.end method

.method public dispose()V
    .locals 2

    .line 169
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_logMonitorFrame:Ljavax/swing/JFrame;

    invoke-virtual {v0}, Ljava/awt/Window;->dispose()V

    const/4 v0, 0x1

    .line 170
    iput-boolean v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_isDisposed:Z

    .line 172
    iget-boolean v1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_callSystemExitOnClose:Z

    if-ne v1, v0, :cond_0

    const/4 v0, 0x0

    .line 173
    invoke-static {v0}, Ljava/lang/System;->exit(I)V

    :cond_0
    return-void
.end method

.method protected findRecord(ILjava/lang/String;Ljava/util/List;)I
    .locals 4

    const/4 v0, 0x0

    if-gez p1, :cond_0

    move p1, v0

    goto :goto_0

    :cond_0
    add-int/lit8 p1, p1, 0x1

    .line 372
    :goto_0
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v1

    move v2, p1

    :goto_1
    if-lt v2, v1, :cond_3

    :goto_2
    if-lt v0, p1, :cond_1

    const/4 p1, -0x1

    return p1

    .line 382
    :cond_1
    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/log4j/lf5/LogRecord;

    invoke-virtual {p0, v1, p2}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->matches(Lorg/apache/log4j/lf5/LogRecord;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    return v0

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 375
    :cond_3
    invoke-interface {p3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/log4j/lf5/LogRecord;

    invoke-virtual {p0, v3, p2}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->matches(Lorg/apache/log4j/lf5/LogRecord;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    return v2

    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method protected findSearchText()V
    .locals 3

    .line 331
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_searchText:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 332
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 335
    :cond_0
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->getFirstSelectedRow()I

    move-result v1

    .line 339
    iget-object v2, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_table:Lorg/apache/log4j/lf5/viewer/LogTable;

    invoke-virtual {v2}, Lorg/apache/log4j/lf5/viewer/LogTable;->getFilteredLogTableModel()Lorg/apache/log4j/lf5/viewer/FilteredLogTableModel;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/log4j/lf5/viewer/FilteredLogTableModel;->getFilteredRecords()Ljava/util/List;

    move-result-object v2

    .line 336
    invoke-virtual {p0, v1, v0, v2}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->findRecord(ILjava/lang/String;Ljava/util/List;)I

    move-result v0

    .line 341
    invoke-virtual {p0, v0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->selectRow(I)V

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method public getBaseFrame()Ljavax/swing/JFrame;
    .locals 1

    .line 240
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_logMonitorFrame:Ljavax/swing/JFrame;

    return-object v0
.end method

.method public getCallSystemExitOnClose()Z
    .locals 1

    .line 203
    iget-boolean v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_callSystemExitOnClose:Z

    return v0
.end method

.method public getCategoryExplorerTree()Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerTree;
    .locals 1

    .line 281
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_categoryExplorerTree:Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerTree;

    return-object v0
.end method

.method public getDateFormatManager()Lorg/apache/log4j/lf5/util/DateFormatManager;
    .locals 1

    .line 188
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_table:Lorg/apache/log4j/lf5/viewer/LogTable;

    invoke-virtual {v0}, Lorg/apache/log4j/lf5/viewer/LogTable;->getDateFormatManager()Lorg/apache/log4j/lf5/util/DateFormatManager;

    move-result-object v0

    return-object v0
.end method

.method protected getFirstSelectedRow()I
    .locals 1

    .line 345
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_table:Lorg/apache/log4j/lf5/viewer/LogTable;

    invoke-virtual {v0}, Ljavax/swing/JTable;->getSelectionModel()Ljavax/swing/ListSelectionModel;

    move-result-object v0

    invoke-interface {v0}, Ljavax/swing/ListSelectionModel;->getMinSelectionIndex()I

    move-result v0

    return v0
.end method

.method public getLogLevelMenuItems()Ljava/util/Map;
    .locals 1

    .line 269
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_logLevelMenuItems:Ljava/util/Map;

    return-object v0
.end method

.method protected getLogLevels()Ljava/util/Iterator;
    .locals 1

    .line 1520
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_levels:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method protected getLogTableColumnMenuItem(Lorg/apache/log4j/lf5/viewer/LogTableColumn;)Ljavax/swing/JCheckBoxMenuItem;
    .locals 2

    .line 837
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_logTableColumnMenuItems:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavax/swing/JCheckBoxMenuItem;

    if-nez v0, :cond_0

    .line 839
    invoke-virtual {p0, p1}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->createLogTableColumnMenuItem(Lorg/apache/log4j/lf5/viewer/LogTableColumn;)Ljavax/swing/JCheckBoxMenuItem;

    move-result-object v0

    .line 840
    iget-object v1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_logTableColumnMenuItems:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-object v0
.end method

.method public getLogTableColumnMenuItems()Ljava/util/Map;
    .locals 1

    .line 273
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_logTableColumnMenuItems:Ljava/util/Map;

    return-object v0
.end method

.method protected getLogTableColumns()Ljava/util/Iterator;
    .locals 1

    .line 1524
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_columns:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method protected getMenuItem(Lorg/apache/log4j/lf5/LogLevel;)Ljavax/swing/JCheckBoxMenuItem;
    .locals 2

    .line 771
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_logLevelMenuItems:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavax/swing/JCheckBoxMenuItem;

    if-nez v0, :cond_0

    .line 773
    invoke-virtual {p0, p1}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->createMenuItem(Lorg/apache/log4j/lf5/LogLevel;)Ljavax/swing/JCheckBoxMenuItem;

    move-result-object v0

    .line 774
    iget-object v1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_logLevelMenuItems:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-object v0
.end method

.method public getNDCTextFilter()Ljava/lang/String;
    .locals 1

    .line 287
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_NDCTextFilter:Ljava/lang/String;

    return-object v0
.end method

.method protected getRecordsDisplayedMessage()Ljava/lang/String;
    .locals 2

    .line 618
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_table:Lorg/apache/log4j/lf5/viewer/LogTable;

    invoke-virtual {v0}, Lorg/apache/log4j/lf5/viewer/LogTable;->getFilteredLogTableModel()Lorg/apache/log4j/lf5/viewer/FilteredLogTableModel;

    move-result-object v0

    .line 619
    invoke-virtual {v0}, Lorg/apache/log4j/lf5/viewer/FilteredLogTableModel;->getRowCount()I

    move-result v1

    invoke-virtual {v0}, Lorg/apache/log4j/lf5/viewer/FilteredLogTableModel;->getTotalRowCount()I

    move-result v0

    invoke-virtual {p0, v1, v0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->getStatusText(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getStatusText(II)Ljava/lang/String;
    .locals 2

    .line 639
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "Displaying: "

    .line 640
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 641
    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    const-string p1, " records out of a total of: "

    .line 642
    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 643
    invoke-virtual {v0, p2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    const-string p1, " records."

    .line 644
    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 645
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getTableColumnMenuItem(Lorg/apache/log4j/lf5/viewer/LogTableColumn;)Ljavax/swing/JCheckBoxMenuItem;
    .locals 0

    .line 277
    invoke-virtual {p0, p1}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->getLogTableColumnMenuItem(Lorg/apache/log4j/lf5/viewer/LogTableColumn;)Ljavax/swing/JCheckBoxMenuItem;

    move-result-object p1

    return-object p1
.end method

.method public hide()V
    .locals 2

    .line 181
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_logMonitorFrame:Ljavax/swing/JFrame;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/awt/Component;->setVisible(Z)V

    return-void
.end method

.method protected initComponents()V
    .locals 6

    .line 485
    new-instance v0, Ljavax/swing/JFrame;

    const-string v1, "LogFactor5"

    invoke-direct {v0, v1}, Ljavax/swing/JFrame;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_logMonitorFrame:Ljavax/swing/JFrame;

    .line 487
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_logMonitorFrame:Ljavax/swing/JFrame;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljavax/swing/JFrame;->setDefaultCloseOperation(I)V

    const-string v0, "/org/apache/log4j/lf5/viewer/images/lf5_small_icon.gif"

    .line 491
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/Class;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 494
    iget-object v2, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_logMonitorFrame:Ljavax/swing/JFrame;

    new-instance v3, Ljavax/swing/ImageIcon;

    invoke-direct {v3, v0}, Ljavax/swing/ImageIcon;-><init>(Ljava/net/URL;)V

    invoke-virtual {v3}, Ljavax/swing/ImageIcon;->getImage()Ljava/awt/Image;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/awt/Frame;->setIconImage(Ljava/awt/Image;)V

    .line 496
    :cond_0
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->updateFrameSize()V

    .line 501
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->createDetailTextArea()Ljavax/swing/JTextArea;

    move-result-object v0

    .line 502
    new-instance v2, Ljavax/swing/JScrollPane;

    invoke-direct {v2, v0}, Ljavax/swing/JScrollPane;-><init>(Ljava/awt/Component;)V

    .line 503
    new-instance v3, Lorg/apache/log4j/lf5/viewer/LogTable;

    invoke-direct {v3, v0}, Lorg/apache/log4j/lf5/viewer/LogTable;-><init>(Ljavax/swing/JTextArea;)V

    iput-object v3, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_table:Lorg/apache/log4j/lf5/viewer/LogTable;

    .line 504
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_currentView:Ljava/lang/String;

    iget-object v3, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_table:Lorg/apache/log4j/lf5/viewer/LogTable;

    invoke-virtual {p0, v0, v3}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->setView(Ljava/lang/String;Lorg/apache/log4j/lf5/viewer/LogTable;)V

    .line 505
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_table:Lorg/apache/log4j/lf5/viewer/LogTable;

    new-instance v3, Ljava/awt/Font;

    iget-object v4, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_fontName:Ljava/lang/String;

    iget v5, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_fontSize:I

    invoke-direct {v3, v4, v1, v5}, Ljava/awt/Font;-><init>(Ljava/lang/String;II)V

    invoke-virtual {v0, v3}, Lorg/apache/log4j/lf5/viewer/LogTable;->setFont(Ljava/awt/Font;)V

    .line 506
    new-instance v0, Ljavax/swing/JScrollPane;

    iget-object v3, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_table:Lorg/apache/log4j/lf5/viewer/LogTable;

    invoke-direct {v0, v3}, Ljavax/swing/JScrollPane;-><init>(Ljava/awt/Component;)V

    iput-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_logTableScrollPane:Ljavax/swing/JScrollPane;

    .line 508
    iget-boolean v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_trackTableScrollPane:Z

    if-eqz v0, :cond_1

    .line 509
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_logTableScrollPane:Ljavax/swing/JScrollPane;

    invoke-virtual {v0}, Ljavax/swing/JScrollPane;->getVerticalScrollBar()Ljavax/swing/JScrollBar;

    move-result-object v0

    .line 510
    new-instance v3, Lorg/apache/log4j/lf5/viewer/TrackingAdjustmentListener;

    invoke-direct {v3}, Lorg/apache/log4j/lf5/viewer/TrackingAdjustmentListener;-><init>()V

    .line 509
    invoke-virtual {v0, v3}, Ljavax/swing/JScrollBar;->addAdjustmentListener(Ljava/awt/event/AdjustmentListener;)V

    .line 518
    :cond_1
    new-instance v0, Ljavax/swing/JSplitPane;

    invoke-direct {v0}, Ljavax/swing/JSplitPane;-><init>()V

    const/4 v3, 0x1

    .line 519
    invoke-virtual {v0, v3}, Ljavax/swing/JSplitPane;->setOneTouchExpandable(Z)V

    .line 520
    invoke-virtual {v0, v1}, Ljavax/swing/JSplitPane;->setOrientation(I)V

    .line 521
    iget-object v1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_logTableScrollPane:Ljavax/swing/JScrollPane;

    invoke-virtual {v0, v1}, Ljavax/swing/JSplitPane;->setLeftComponent(Ljava/awt/Component;)V

    .line 522
    invoke-virtual {v0, v2}, Ljavax/swing/JSplitPane;->setRightComponent(Ljava/awt/Component;)V

    const/16 v1, 0x15e

    .line 530
    invoke-virtual {v0, v1}, Ljavax/swing/JSplitPane;->setDividerLocation(I)V

    .line 536
    new-instance v1, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerTree;

    invoke-direct {v1}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerTree;-><init>()V

    iput-object v1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_categoryExplorerTree:Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerTree;

    .line 538
    iget-object v1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_table:Lorg/apache/log4j/lf5/viewer/LogTable;

    invoke-virtual {v1}, Lorg/apache/log4j/lf5/viewer/LogTable;->getFilteredLogTableModel()Lorg/apache/log4j/lf5/viewer/FilteredLogTableModel;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->createLogRecordFilter()Lorg/apache/log4j/lf5/LogRecordFilter;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/log4j/lf5/viewer/FilteredLogTableModel;->setLogRecordFilter(Lorg/apache/log4j/lf5/LogRecordFilter;)V

    .line 541
    new-instance v1, Ljavax/swing/JScrollPane;

    iget-object v2, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_categoryExplorerTree:Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerTree;

    invoke-direct {v1, v2}, Ljavax/swing/JScrollPane;-><init>(Ljava/awt/Component;)V

    .line 542
    new-instance v2, Ljava/awt/Dimension;

    const/16 v4, 0x190

    const/16 v5, 0x82

    invoke-direct {v2, v5, v4}, Ljava/awt/Dimension;-><init>(II)V

    invoke-virtual {v1, v2}, Ljavax/swing/JComponent;->setPreferredSize(Ljava/awt/Dimension;)V

    .line 545
    new-instance v2, Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;

    invoke-direct {v2}, Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;-><init>()V

    iput-object v2, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_mruFileManager:Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;

    .line 551
    new-instance v2, Ljavax/swing/JSplitPane;

    invoke-direct {v2}, Ljavax/swing/JSplitPane;-><init>()V

    .line 552
    invoke-virtual {v2, v3}, Ljavax/swing/JSplitPane;->setOneTouchExpandable(Z)V

    .line 553
    invoke-virtual {v2, v0}, Ljavax/swing/JSplitPane;->setRightComponent(Ljava/awt/Component;)V

    .line 554
    invoke-virtual {v2, v1}, Ljavax/swing/JSplitPane;->setLeftComponent(Ljava/awt/Component;)V

    .line 556
    invoke-virtual {v2, v5}, Ljavax/swing/JSplitPane;->setDividerLocation(I)V

    .line 561
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_logMonitorFrame:Ljavax/swing/JFrame;

    invoke-virtual {v0}, Ljavax/swing/JFrame;->getRootPane()Ljavax/swing/JRootPane;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->createMenuBar()Ljavax/swing/JMenuBar;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/swing/JRootPane;->setJMenuBar(Ljavax/swing/JMenuBar;)V

    .line 562
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_logMonitorFrame:Ljavax/swing/JFrame;

    invoke-virtual {v0}, Ljavax/swing/JFrame;->getContentPane()Ljava/awt/Container;

    move-result-object v0

    const-string v1, "Center"

    invoke-virtual {v0, v2, v1}, Ljava/awt/Container;->add(Ljava/awt/Component;Ljava/lang/Object;)V

    .line 563
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_logMonitorFrame:Ljavax/swing/JFrame;

    invoke-virtual {v0}, Ljavax/swing/JFrame;->getContentPane()Ljava/awt/Container;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->createToolBar()Ljavax/swing/JToolBar;

    move-result-object v1

    const-string v2, "North"

    invoke-virtual {v0, v1, v2}, Ljava/awt/Container;->add(Ljava/awt/Component;Ljava/lang/Object;)V

    .line 565
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_logMonitorFrame:Ljavax/swing/JFrame;

    invoke-virtual {v0}, Ljavax/swing/JFrame;->getContentPane()Ljava/awt/Container;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->createStatusArea()Ljavax/swing/JPanel;

    move-result-object v1

    const-string v2, "South"

    invoke-virtual {v0, v1, v2}, Ljava/awt/Container;->add(Ljava/awt/Component;Ljava/lang/Object;)V

    .line 568
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->makeLogTableListenToCategoryExplorer()V

    .line 569
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->addTableModelProperties()V

    .line 574
    new-instance v0, Lorg/apache/log4j/lf5/viewer/configure/ConfigurationManager;

    iget-object v1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_table:Lorg/apache/log4j/lf5/viewer/LogTable;

    invoke-direct {v0, p0, v1}, Lorg/apache/log4j/lf5/viewer/configure/ConfigurationManager;-><init>(Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;Lorg/apache/log4j/lf5/viewer/LogTable;)V

    iput-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_configurationManager:Lorg/apache/log4j/lf5/viewer/configure/ConfigurationManager;

    return-void
.end method

.method protected loadLogFile(Ljava/io/File;)Z
    .locals 4

    .line 1533
    :try_start_0
    new-instance v0, Lorg/apache/log4j/lf5/util/LogFileParser;

    invoke-direct {v0, p1}, Lorg/apache/log4j/lf5/util/LogFileParser;-><init>(Ljava/io/File;)V

    .line 1534
    invoke-virtual {v0, p0}, Lorg/apache/log4j/lf5/util/LogFileParser;->parse(Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p1, 0x1

    goto :goto_0

    .line 1537
    :catch_0
    new-instance v0, Lorg/apache/log4j/lf5/viewer/LogFactor5ErrorDialog;

    .line 1538
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->getBaseFrame()Ljavax/swing/JFrame;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuffer;

    const-string v3, "Error reading "

    invoke-direct {v2, v3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1537
    invoke-direct {v0, v1, p1}, Lorg/apache/log4j/lf5/viewer/LogFactor5ErrorDialog;-><init>(Ljavax/swing/JFrame;Ljava/lang/String;)V

    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method protected loadLogFile(Ljava/net/URL;)Z
    .locals 4

    .line 1550
    :try_start_0
    new-instance v0, Lorg/apache/log4j/lf5/util/LogFileParser;

    invoke-virtual {p1}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/log4j/lf5/util/LogFileParser;-><init>(Ljava/io/InputStream;)V

    .line 1551
    invoke-virtual {v0, p0}, Lorg/apache/log4j/lf5/util/LogFileParser;->parse(Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p1, 0x1

    goto :goto_0

    .line 1554
    :catch_0
    new-instance v0, Lorg/apache/log4j/lf5/viewer/LogFactor5ErrorDialog;

    .line 1555
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->getBaseFrame()Ljavax/swing/JFrame;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuffer;

    const-string v3, "Error reading URL:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/net/URL;->getFile()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1554
    invoke-direct {v0, v1, p1}, Lorg/apache/log4j/lf5/viewer/LogFactor5ErrorDialog;-><init>(Ljavax/swing/JFrame;Ljava/lang/String;)V

    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method protected makeLogTableListenToCategoryExplorer()V
    .locals 2

    .line 649
    new-instance v0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$7;

    invoke-direct {v0, p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$7;-><init>(Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;)V

    .line 655
    iget-object v1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_categoryExplorerTree:Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerTree;

    invoke-virtual {v1}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerTree;->getExplorerModel()Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerModel;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/apache/log4j/lf5/viewer/categoryexplorer/CategoryExplorerModel;->addActionListener(Ljava/awt/event/ActionListener;)V

    return-void
.end method

.method protected matches(Lorg/apache/log4j/lf5/LogRecord;Ljava/lang/String;)Z
    .locals 3

    .line 395
    invoke-virtual {p1}, Lorg/apache/log4j/lf5/LogRecord;->getMessage()Ljava/lang/String;

    move-result-object v0

    .line 396
    invoke-virtual {p1}, Lorg/apache/log4j/lf5/LogRecord;->getNDC()Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x0

    if-nez v0, :cond_0

    if-eqz p1, :cond_1

    :cond_0
    if-nez p2, :cond_2

    :cond_1
    return v1

    .line 401
    :cond_2
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v2, -0x1

    if-ne v0, v2, :cond_3

    .line 402
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p1

    if-ne p1, v2, :cond_3

    return v1

    :cond_3
    const/4 p1, 0x1

    return p1
.end method

.method protected pause(I)V
    .locals 2

    int-to-long v0, p1

    .line 475
    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method protected refresh(Ljavax/swing/JTextArea;)V
    .locals 2

    .line 415
    invoke-virtual {p1}, Ljavax/swing/text/JTextComponent;->getText()Ljava/lang/String;

    move-result-object v0

    const-string v1, ""

    .line 416
    invoke-virtual {p1, v1}, Ljavax/swing/text/JTextComponent;->setText(Ljava/lang/String;)V

    .line 417
    invoke-virtual {p1, v0}, Ljavax/swing/text/JTextComponent;->setText(Ljava/lang/String;)V

    return-void
.end method

.method protected refreshDetailTextArea()V
    .locals 1

    .line 421
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_table:Lorg/apache/log4j/lf5/viewer/LogTable;

    iget-object v0, v0, Lorg/apache/log4j/lf5/viewer/LogTable;->_detailTextArea:Ljavax/swing/JTextArea;

    invoke-virtual {p0, v0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->refresh(Ljavax/swing/JTextArea;)V

    return-void
.end method

.method protected requestClose()V
    .locals 1

    const/4 v0, 0x0

    .line 1450
    invoke-virtual {p0, v0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->setCallSystemExitOnClose(Z)V

    .line 1451
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->closeAfterConfirm()V

    return-void
.end method

.method protected requestExit()V
    .locals 1

    .line 1481
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_mruFileManager:Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;

    invoke-virtual {v0}, Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;->save()V

    const/4 v0, 0x1

    .line 1482
    invoke-virtual {p0, v0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->setCallSystemExitOnClose(Z)V

    .line 1483
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->closeAfterConfirm()V

    return-void
.end method

.method protected requestOpen()V
    .locals 3

    .line 1389
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_fileLocation:Ljava/io/File;

    if-nez v0, :cond_0

    .line 1390
    new-instance v0, Ljavax/swing/JFileChooser;

    invoke-direct {v0}, Ljavax/swing/JFileChooser;-><init>()V

    goto :goto_0

    .line 1392
    :cond_0
    new-instance v1, Ljavax/swing/JFileChooser;

    invoke-direct {v1, v0}, Ljavax/swing/JFileChooser;-><init>(Ljava/io/File;)V

    move-object v0, v1

    .line 1395
    :goto_0
    iget-object v1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_logMonitorFrame:Ljavax/swing/JFrame;

    invoke-virtual {v0, v1}, Ljavax/swing/JFileChooser;->showOpenDialog(Ljava/awt/Component;)I

    move-result v1

    if-nez v1, :cond_1

    .line 1397
    invoke-virtual {v0}, Ljavax/swing/JFileChooser;->getSelectedFile()Ljava/io/File;

    move-result-object v1

    .line 1398
    invoke-virtual {p0, v1}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->loadLogFile(Ljava/io/File;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1399
    invoke-virtual {v0}, Ljavax/swing/JFileChooser;->getSelectedFile()Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_fileLocation:Ljava/io/File;

    .line 1400
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_mruFileManager:Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;

    invoke-virtual {v0, v1}, Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;->set(Ljava/io/File;)V

    .line 1401
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->updateMRUList()V

    :cond_1
    return-void
.end method

.method protected requestOpenMRU(Ljava/awt/event/ActionEvent;)V
    .locals 4

    .line 1458
    invoke-virtual {p1}, Ljava/awt/event/ActionEvent;->getActionCommand()Ljava/lang/String;

    move-result-object p1

    .line 1459
    new-instance v0, Ljava/util/StringTokenizer;

    invoke-direct {v0, p1}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;)V

    .line 1460
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    const-string v1, "\n"

    .line 1461
    invoke-virtual {v0, v1}, Ljava/util/StringTokenizer;->nextToken(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1464
    :try_start_0
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    .line 1466
    iget-object v1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_mruFileManager:Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;

    invoke-virtual {v1, p1}, Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;->getInputStream(I)Ljava/io/InputStream;

    move-result-object v1

    .line 1467
    new-instance v2, Lorg/apache/log4j/lf5/util/LogFileParser;

    invoke-direct {v2, v1}, Lorg/apache/log4j/lf5/util/LogFileParser;-><init>(Ljava/io/InputStream;)V

    .line 1468
    invoke-virtual {v2, p0}, Lorg/apache/log4j/lf5/util/LogFileParser;->parse(Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;)V

    .line 1470
    iget-object v1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_mruFileManager:Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;

    invoke-virtual {v1, p1}, Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;->moveToTop(I)V

    .line 1471
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->updateMRUList()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1474
    :catch_0
    new-instance p1, Lorg/apache/log4j/lf5/viewer/LogFactor5ErrorDialog;

    .line 1475
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->getBaseFrame()Ljavax/swing/JFrame;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuffer;

    const-string v3, "Unable to load file "

    invoke-direct {v2, v3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1474
    invoke-direct {p1, v1, v0}, Lorg/apache/log4j/lf5/viewer/LogFactor5ErrorDialog;-><init>(Ljavax/swing/JFrame;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method protected requestOpenURL()V
    .locals 4

    .line 1411
    new-instance v0, Lorg/apache/log4j/lf5/viewer/LogFactor5InputDialog;

    .line 1412
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->getBaseFrame()Ljavax/swing/JFrame;

    move-result-object v1

    const-string v2, "Open URL"

    const-string v3, "URL:"

    .line 1411
    invoke-direct {v0, v1, v2, v3}, Lorg/apache/log4j/lf5/viewer/LogFactor5InputDialog;-><init>(Ljavax/swing/JFrame;Ljava/lang/String;Ljava/lang/String;)V

    .line 1413
    invoke-virtual {v0}, Lorg/apache/log4j/lf5/viewer/LogFactor5InputDialog;->getText()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    const-string v1, "://"

    .line 1416
    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    .line 1417
    new-instance v1, Ljava/lang/StringBuffer;

    const-string v2, "http://"

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1421
    :cond_0
    :try_start_0
    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 1422
    invoke-virtual {p0, v1}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->loadLogFile(Ljava/net/URL;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1423
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_mruFileManager:Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;

    invoke-virtual {v0, v1}, Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;->set(Ljava/net/URL;)V

    .line 1424
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->updateMRUList()V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1427
    :catch_0
    new-instance v0, Lorg/apache/log4j/lf5/viewer/LogFactor5ErrorDialog;

    .line 1428
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->getBaseFrame()Ljavax/swing/JFrame;

    move-result-object v1

    const-string v2, "Error reading URL."

    .line 1427
    invoke-direct {v0, v1, v2}, Lorg/apache/log4j/lf5/viewer/LogFactor5ErrorDialog;-><init>(Ljavax/swing/JFrame;Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void
.end method

.method protected resetConfiguration()V
    .locals 1

    .line 1052
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_configurationManager:Lorg/apache/log4j/lf5/viewer/configure/ConfigurationManager;

    invoke-virtual {v0}, Lorg/apache/log4j/lf5/viewer/configure/ConfigurationManager;->reset()V

    return-void
.end method

.method protected saveConfiguration()V
    .locals 1

    .line 1048
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_configurationManager:Lorg/apache/log4j/lf5/viewer/configure/ConfigurationManager;

    invoke-virtual {v0}, Lorg/apache/log4j/lf5/viewer/configure/ConfigurationManager;->save()V

    return-void
.end method

.method protected selectAllLogLevels(Z)V
    .locals 2

    .line 764
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->getLogLevels()Ljava/util/Iterator;

    move-result-object v0

    .line 765
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    .line 766
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/log4j/lf5/LogLevel;

    invoke-virtual {p0, v1}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->getMenuItem(Lorg/apache/log4j/lf5/LogLevel;)Ljavax/swing/JCheckBoxMenuItem;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljavax/swing/AbstractButton;->setSelected(Z)V

    goto :goto_0
.end method

.method protected selectAllLogTableColumns(Z)V
    .locals 2

    .line 904
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->getLogTableColumns()Ljava/util/Iterator;

    move-result-object v0

    .line 905
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    .line 906
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/log4j/lf5/viewer/LogTableColumn;

    invoke-virtual {p0, v1}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->getLogTableColumnMenuItem(Lorg/apache/log4j/lf5/viewer/LogTableColumn;)Ljavax/swing/JCheckBoxMenuItem;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljavax/swing/AbstractButton;->setSelected(Z)V

    goto :goto_0
.end method

.method protected selectRow(I)V
    .locals 3

    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    .line 350
    new-instance p1, Ljava/lang/StringBuffer;

    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_searchText:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    const-string v0, " not found."

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    .line 352
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_logMonitorFrame:Ljavax/swing/JFrame;

    const-string v1, "Text not found"

    const/4 v2, 0x1

    .line 351
    invoke-static {v0, p1, v1, v2}, Ljavax/swing/JOptionPane;->showMessageDialog(Ljava/awt/Component;Ljava/lang/Object;Ljava/lang/String;I)V

    return-void

    .line 359
    :cond_0
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_table:Lorg/apache/log4j/lf5/viewer/LogTable;

    iget-object v1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_logTableScrollPane:Ljavax/swing/JScrollPane;

    invoke-static {p1, v0, v1}, Lorg/apache/log4j/lf5/viewer/LF5SwingUtils;->selectRow(ILjavax/swing/JTable;Ljavax/swing/JScrollPane;)V

    return-void
.end method

.method public setCallSystemExitOnClose(Z)V
    .locals 0

    .line 211
    iput-boolean p1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_callSystemExitOnClose:Z

    return-void
.end method

.method public setDateFormatManager(Lorg/apache/log4j/lf5/util/DateFormatManager;)V
    .locals 1

    .line 195
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_table:Lorg/apache/log4j/lf5/viewer/LogTable;

    invoke-virtual {v0, p1}, Lorg/apache/log4j/lf5/viewer/LogTable;->setDateFormatManager(Lorg/apache/log4j/lf5/util/DateFormatManager;)V

    return-void
.end method

.method public setFontSize(I)V
    .locals 1

    .line 259
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_fontSizeCombo:Ljavax/swing/JComboBox;

    invoke-virtual {p0, v0, p1}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->changeFontSizeCombo(Ljavax/swing/JComboBox;I)I

    return-void
.end method

.method protected setFontSize(Ljava/awt/Component;I)V
    .locals 3

    .line 462
    invoke-virtual {p1}, Ljava/awt/Component;->getFont()Ljava/awt/Font;

    move-result-object v0

    .line 464
    new-instance v1, Ljava/awt/Font;

    invoke-virtual {v0}, Ljava/awt/Font;->getFontName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Ljava/awt/Font;->getStyle()I

    move-result v0

    invoke-direct {v1, v2, v0, p2}, Ljava/awt/Font;-><init>(Ljava/lang/String;II)V

    .line 465
    invoke-virtual {p1, v1}, Ljava/awt/Component;->setFont(Ljava/awt/Font;)V

    return-void
.end method

.method protected setFontSizeSilently(I)V
    .locals 1

    .line 455
    iput p1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_fontSize:I

    .line 456
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_table:Lorg/apache/log4j/lf5/viewer/LogTable;

    iget-object v0, v0, Lorg/apache/log4j/lf5/viewer/LogTable;->_detailTextArea:Ljavax/swing/JTextArea;

    invoke-virtual {p0, v0, p1}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->setFontSize(Ljava/awt/Component;I)V

    const/4 v0, 0x0

    .line 457
    invoke-virtual {p0, v0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->selectRow(I)V

    .line 458
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_table:Lorg/apache/log4j/lf5/viewer/LogTable;

    invoke-virtual {p0, v0, p1}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->setFontSize(Ljava/awt/Component;I)V

    return-void
.end method

.method public setFrameSize(II)V
    .locals 2

    .line 248
    invoke-static {}, Ljava/awt/Toolkit;->getDefaultToolkit()Ljava/awt/Toolkit;

    move-result-object v0

    invoke-virtual {v0}, Ljava/awt/Toolkit;->getScreenSize()Ljava/awt/Dimension;

    move-result-object v0

    if-lez p1, :cond_0

    .line 249
    iget v1, v0, Ljava/awt/Dimension;->width:I

    if-ge p1, v1, :cond_0

    .line 250
    iput p1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_logMonitorFrameWidth:I

    :cond_0
    if-lez p2, :cond_1

    .line 252
    iget p1, v0, Ljava/awt/Dimension;->height:I

    if-ge p2, p1, :cond_1

    .line 253
    iput p2, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_logMonitorFrameHeight:I

    .line 255
    :cond_1
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->updateFrameSize()V

    return-void
.end method

.method protected setLeastSevereDisplayedLogLevel(Lorg/apache/log4j/lf5/LogLevel;)V
    .locals 1

    if-eqz p1, :cond_1

    .line 1351
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_leastSevereDisplayedLogLevel:Lorg/apache/log4j/lf5/LogLevel;

    if-ne v0, p1, :cond_0

    goto :goto_0

    .line 1354
    :cond_0
    iput-object p1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_leastSevereDisplayedLogLevel:Lorg/apache/log4j/lf5/LogLevel;

    .line 1355
    iget-object p1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_table:Lorg/apache/log4j/lf5/viewer/LogTable;

    invoke-virtual {p1}, Lorg/apache/log4j/lf5/viewer/LogTable;->getFilteredLogTableModel()Lorg/apache/log4j/lf5/viewer/FilteredLogTableModel;

    move-result-object p1

    invoke-virtual {p1}, Lorg/apache/log4j/lf5/viewer/FilteredLogTableModel;->refresh()V

    .line 1356
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->updateStatusLabel()V

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method public setMaxNumberOfLogRecords(I)V
    .locals 1

    .line 236
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_table:Lorg/apache/log4j/lf5/viewer/LogTable;

    invoke-virtual {v0}, Lorg/apache/log4j/lf5/viewer/LogTable;->getFilteredLogTableModel()Lorg/apache/log4j/lf5/viewer/FilteredLogTableModel;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/log4j/lf5/viewer/FilteredLogTableModel;->setMaxNumberOfLogRecords(I)V

    return-void
.end method

.method protected setMaxRecordConfiguration()V
    .locals 5

    .line 1056
    new-instance v0, Lorg/apache/log4j/lf5/viewer/LogFactor5InputDialog;

    .line 1057
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->getBaseFrame()Ljavax/swing/JFrame;

    move-result-object v1

    const-string v2, "Set Max Number of Records"

    const-string v3, ""

    const/16 v4, 0xa

    .line 1056
    invoke-direct {v0, v1, v2, v3, v4}, Lorg/apache/log4j/lf5/viewer/LogFactor5InputDialog;-><init>(Ljavax/swing/JFrame;Ljava/lang/String;Ljava/lang/String;I)V

    .line 1059
    invoke-virtual {v0}, Lorg/apache/log4j/lf5/viewer/LogFactor5InputDialog;->getText()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1063
    :try_start_0
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p0, v1}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->setMaxNumberOfLogRecords(I)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1065
    :catch_0
    new-instance v1, Lorg/apache/log4j/lf5/viewer/LogFactor5ErrorDialog;

    .line 1066
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->getBaseFrame()Ljavax/swing/JFrame;

    move-result-object v2

    .line 1067
    new-instance v3, Ljava/lang/StringBuffer;

    const-string v4, "\'"

    invoke-direct {v3, v4}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v0, "\' is an invalid parameter.\nPlease try again."

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1065
    invoke-direct {v1, v2, v0}, Lorg/apache/log4j/lf5/viewer/LogFactor5ErrorDialog;-><init>(Ljavax/swing/JFrame;Ljava/lang/String;)V

    .line 1068
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->setMaxRecordConfiguration()V

    :cond_0
    :goto_0
    return-void
.end method

.method public setNDCLogRecordFilter(Ljava/lang/String;)V
    .locals 1

    .line 294
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_table:Lorg/apache/log4j/lf5/viewer/LogTable;

    invoke-virtual {v0}, Lorg/apache/log4j/lf5/viewer/LogTable;->getFilteredLogTableModel()Lorg/apache/log4j/lf5/viewer/FilteredLogTableModel;

    move-result-object v0

    .line 295
    invoke-virtual {p0, p1}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->createNDCLogRecordFilter(Ljava/lang/String;)Lorg/apache/log4j/lf5/LogRecordFilter;

    move-result-object p1

    invoke-virtual {v0, p1}, Lorg/apache/log4j/lf5/viewer/FilteredLogTableModel;->setLogRecordFilter(Lorg/apache/log4j/lf5/LogRecordFilter;)V

    return-void
.end method

.method protected setNDCTextFilter(Ljava/lang/String;)V
    .locals 0

    if-nez p1, :cond_0

    const-string p1, ""

    .line 310
    iput-object p1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_NDCTextFilter:Ljava/lang/String;

    goto :goto_0

    .line 312
    :cond_0
    iput-object p1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_NDCTextFilter:Ljava/lang/String;

    :goto_0
    return-void
.end method

.method protected setSearchText(Ljava/lang/String;)V
    .locals 0

    .line 302
    iput-object p1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_searchText:Ljava/lang/String;

    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 2

    .line 244
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_logMonitorFrame:Ljavax/swing/JFrame;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    const-string p1, " - LogFactor5"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/awt/Frame;->setTitle(Ljava/lang/String;)V

    return-void
.end method

.method protected setView(Ljava/lang/String;Lorg/apache/log4j/lf5/viewer/LogTable;)V
    .locals 1

    const-string v0, "Detailed"

    .line 1322
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1323
    invoke-virtual {p2}, Lorg/apache/log4j/lf5/viewer/LogTable;->setDetailedView()V

    .line 1328
    iput-object p1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_currentView:Ljava/lang/String;

    return-void

    .line 1325
    :cond_0
    new-instance p2, Ljava/lang/StringBuffer;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    const-string p1, "does not match a supported view."

    invoke-virtual {p2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1326
    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public show()V
    .locals 1

    const/4 v0, 0x0

    .line 162
    invoke-virtual {p0, v0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->show(I)V

    return-void
.end method

.method public show(I)V
    .locals 1

    .line 148
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_logMonitorFrame:Ljavax/swing/JFrame;

    invoke-virtual {v0}, Ljava/awt/Component;->isVisible()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 152
    :cond_0
    new-instance v0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$1;

    invoke-direct {v0, p1, p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor$1;-><init>(ILorg/apache/log4j/lf5/viewer/LogBrokerMonitor;)V

    invoke-static {v0}, Ljavax/swing/SwingUtilities;->invokeLater(Ljava/lang/Runnable;)V

    return-void
.end method

.method protected showLogLevelColorChangeDialog(Ljavax/swing/JMenuItem;Lorg/apache/log4j/lf5/LogLevel;)V
    .locals 2

    .line 796
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_logMonitorFrame:Ljavax/swing/JFrame;

    const-string v1, "Choose LogLevel Color"

    .line 798
    invoke-virtual {p1}, Ljava/awt/Component;->getForeground()Ljava/awt/Color;

    move-result-object p1

    .line 795
    invoke-static {v0, v1, p1}, Ljavax/swing/JColorChooser;->showDialog(Ljava/awt/Component;Ljava/lang/String;Ljava/awt/Color;)Ljava/awt/Color;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 802
    invoke-virtual {p2, p2, p1}, Lorg/apache/log4j/lf5/LogLevel;->setLogLevelColorMap(Lorg/apache/log4j/lf5/LogLevel;Ljava/awt/Color;)V

    .line 803
    iget-object p1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_table:Lorg/apache/log4j/lf5/viewer/LogTable;

    invoke-virtual {p1}, Lorg/apache/log4j/lf5/viewer/LogTable;->getFilteredLogTableModel()Lorg/apache/log4j/lf5/viewer/FilteredLogTableModel;

    move-result-object p1

    invoke-virtual {p1}, Lorg/apache/log4j/lf5/viewer/FilteredLogTableModel;->refresh()V

    :cond_0
    return-void
.end method

.method protected showPropertiesDialog(Ljava/lang/String;)V
    .locals 3

    .line 1095
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_logMonitorFrame:Ljavax/swing/JFrame;

    .line 1096
    iget-object v1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_displayedLogBrokerProperties:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v1

    const/4 v2, -0x1

    .line 1094
    invoke-static {v0, v1, p1, v2}, Ljavax/swing/JOptionPane;->showMessageDialog(Ljava/awt/Component;Ljava/lang/Object;Ljava/lang/String;I)V

    return-void
.end method

.method protected sortByNDC()V
    .locals 2

    .line 320
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_NDCTextFilter:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 321
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 326
    :cond_0
    iget-object v1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_table:Lorg/apache/log4j/lf5/viewer/LogTable;

    invoke-virtual {v1}, Lorg/apache/log4j/lf5/viewer/LogTable;->getFilteredLogTableModel()Lorg/apache/log4j/lf5/viewer/FilteredLogTableModel;

    move-result-object v1

    .line 327
    invoke-virtual {p0, v0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->createNDCLogRecordFilter(Ljava/lang/String;)Lorg/apache/log4j/lf5/LogRecordFilter;

    move-result-object v0

    invoke-virtual {v1, v0}, Lorg/apache/log4j/lf5/viewer/FilteredLogTableModel;->setLogRecordFilter(Lorg/apache/log4j/lf5/LogRecordFilter;)V

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method protected trackTableScrollPane()V
    .locals 0

    return-void
.end method

.method protected updateFrameSize()V
    .locals 3

    .line 469
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_logMonitorFrame:Ljavax/swing/JFrame;

    iget v1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_logMonitorFrameWidth:I

    iget v2, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_logMonitorFrameHeight:I

    invoke-virtual {v0, v1, v2}, Ljava/awt/Component;->setSize(II)V

    .line 470
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_logMonitorFrame:Ljavax/swing/JFrame;

    invoke-virtual {p0, v0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->centerFrame(Ljavax/swing/JFrame;)V

    return-void
.end method

.method protected updateMRUList()V
    .locals 2

    .line 1438
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_logMonitorFrame:Ljavax/swing/JFrame;

    invoke-virtual {v0}, Ljavax/swing/JFrame;->getJMenuBar()Ljavax/swing/JMenuBar;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljavax/swing/JMenuBar;->getMenu(I)Ljavax/swing/JMenu;

    move-result-object v0

    .line 1439
    invoke-virtual {v0}, Ljavax/swing/JMenu;->removeAll()V

    .line 1440
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->createOpenMI()Ljavax/swing/JMenuItem;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 1441
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->createOpenURLMI()Ljavax/swing/JMenuItem;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 1442
    invoke-virtual {v0}, Ljavax/swing/JMenu;->addSeparator()V

    .line 1443
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->createCloseMI()Ljavax/swing/JMenuItem;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 1444
    invoke-virtual {p0, v0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->createMRUFileListMI(Ljavax/swing/JMenu;)V

    .line 1445
    invoke-virtual {v0}, Ljavax/swing/JMenu;->addSeparator()V

    .line 1446
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->createExitMI()Ljavax/swing/JMenuItem;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    return-void
.end method

.method protected updateStatusLabel()V
    .locals 2

    .line 614
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_statusLabel:Ljavax/swing/JLabel;

    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->getRecordsDisplayedMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/swing/JLabel;->setText(Ljava/lang/String;)V

    return-void
.end method

.method protected updateView()Ljava/util/List;
    .locals 4

    .line 861
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 862
    iget-object v1, p0, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->_columns:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 863
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    return-object v0

    .line 864
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/log4j/lf5/viewer/LogTableColumn;

    .line 865
    invoke-virtual {p0, v2}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->getLogTableColumnMenuItem(Lorg/apache/log4j/lf5/viewer/LogTableColumn;)Ljavax/swing/JCheckBoxMenuItem;

    move-result-object v3

    .line 867
    invoke-virtual {v3}, Ljavax/swing/AbstractButton;->isSelected()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 868
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method
