.class public Lorg/apache/log4j/chainsaw/Main;
.super Ljavax/swing/JFrame;
.source "Main.java"


# static fields
.field private static final DEFAULT_PORT:I = 0x115d

.field private static final LOG:Lorg/apache/log4j/Logger;

.field public static final PORT_PROP_NAME:Ljava/lang/String; = "chainsaw.port"

.field static synthetic class$org$apache$log4j$chainsaw$Main:Ljava/lang/Class;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 53
    sget-object v0, Lorg/apache/log4j/chainsaw/Main;->class$org$apache$log4j$chainsaw$Main:Ljava/lang/Class;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const-string v0, "org.apache.log4j.chainsaw.Main"

    invoke-static {v0}, Lorg/apache/log4j/chainsaw/Main;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/log4j/chainsaw/Main;->class$org$apache$log4j$chainsaw$Main:Ljava/lang/Class;

    :goto_0
    invoke-static {v0}, Lorg/apache/log4j/Logger;->getLogger(Ljava/lang/Class;)Lorg/apache/log4j/Logger;

    move-result-object v0

    sput-object v0, Lorg/apache/log4j/chainsaw/Main;->LOG:Lorg/apache/log4j/Logger;

    return-void
.end method

.method private constructor <init>()V
    .locals 7

    const-string v0, "CHAINSAW - Log4J Log Viewer"

    .line 60
    invoke-direct {p0, v0}, Ljavax/swing/JFrame;-><init>(Ljava/lang/String;)V

    .line 62
    new-instance v0, Lorg/apache/log4j/chainsaw/MyTableModel;

    invoke-direct {v0}, Lorg/apache/log4j/chainsaw/MyTableModel;-><init>()V

    .line 65
    new-instance v1, Ljavax/swing/JMenuBar;

    invoke-direct {v1}, Ljavax/swing/JMenuBar;-><init>()V

    .line 66
    invoke-virtual {p0, v1}, Ljavax/swing/JFrame;->setJMenuBar(Ljavax/swing/JMenuBar;)V

    .line 67
    new-instance v2, Ljavax/swing/JMenu;

    const-string v3, "File"

    invoke-direct {v2, v3}, Ljavax/swing/JMenu;-><init>(Ljava/lang/String;)V

    .line 68
    invoke-virtual {v1, v2}, Ljavax/swing/JMenuBar;->add(Ljavax/swing/JMenu;)Ljavax/swing/JMenu;

    const/4 v1, 0x0

    .line 71
    :try_start_0
    new-instance v3, Lorg/apache/log4j/chainsaw/LoadXMLAction;

    invoke-direct {v3, p0, v0}, Lorg/apache/log4j/chainsaw/LoadXMLAction;-><init>(Ljavax/swing/JFrame;Lorg/apache/log4j/chainsaw/MyTableModel;)V

    .line 72
    new-instance v4, Ljavax/swing/JMenuItem;

    const-string v5, "Load file..."

    invoke-direct {v4, v5}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;)V

    .line 73
    invoke-virtual {v2, v4}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 74
    invoke-virtual {v4, v3}, Ljavax/swing/AbstractButton;->addActionListener(Ljava/awt/event/ActionListener;)V
    :try_end_0
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v3

    .line 83
    sget-object v4, Lorg/apache/log4j/chainsaw/Main;->LOG:Lorg/apache/log4j/Logger;

    const-string v5, "Unable to create the action to load XML files"

    invoke-virtual {v4, v5, v3}, Lorg/apache/log4j/Category;->info(Ljava/lang/Object;Ljava/lang/Throwable;)V

    const-string v3, "Unable to create a XML parser - unable to load XML events."

    const-string v4, "CHAINSAW"

    .line 84
    invoke-static {p0, v3, v4, v1}, Ljavax/swing/JOptionPane;->showMessageDialog(Ljava/awt/Component;Ljava/lang/Object;Ljava/lang/String;I)V

    goto :goto_0

    :catch_1
    move-exception v3

    .line 76
    sget-object v4, Lorg/apache/log4j/chainsaw/Main;->LOG:Lorg/apache/log4j/Logger;

    const-string v5, "Missing classes for XML parser"

    invoke-virtual {v4, v5, v3}, Lorg/apache/log4j/Category;->info(Ljava/lang/Object;Ljava/lang/Throwable;)V

    const-string v3, "XML parser not in classpath - unable to load XML events."

    const-string v4, "CHAINSAW"

    .line 77
    invoke-static {p0, v3, v4, v1}, Ljavax/swing/JOptionPane;->showMessageDialog(Ljava/awt/Component;Ljava/lang/Object;Ljava/lang/String;I)V

    .line 91
    :goto_0
    new-instance v3, Ljavax/swing/JMenuItem;

    const-string v4, "Exit"

    invoke-direct {v3, v4}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;)V

    .line 92
    invoke-virtual {v2, v3}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 93
    sget-object v2, Lorg/apache/log4j/chainsaw/ExitAction;->INSTANCE:Lorg/apache/log4j/chainsaw/ExitAction;

    invoke-virtual {v3, v2}, Ljavax/swing/AbstractButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 96
    new-instance v2, Lorg/apache/log4j/chainsaw/ControlPanel;

    invoke-direct {v2, v0}, Lorg/apache/log4j/chainsaw/ControlPanel;-><init>(Lorg/apache/log4j/chainsaw/MyTableModel;)V

    .line 97
    invoke-virtual {p0}, Ljavax/swing/JFrame;->getContentPane()Ljava/awt/Container;

    move-result-object v3

    const-string v4, "North"

    invoke-virtual {v3, v2, v4}, Ljava/awt/Container;->add(Ljava/awt/Component;Ljava/lang/Object;)V

    .line 100
    new-instance v2, Ljavax/swing/JTable;

    invoke-direct {v2, v0}, Ljavax/swing/JTable;-><init>(Ljavax/swing/table/TableModel;)V

    .line 101
    invoke-virtual {v2, v1}, Ljavax/swing/JTable;->setSelectionMode(I)V

    .line 102
    new-instance v3, Ljavax/swing/JScrollPane;

    invoke-direct {v3, v2}, Ljavax/swing/JScrollPane;-><init>(Ljava/awt/Component;)V

    const-string v4, "Events: "

    .line 103
    invoke-static {v4}, Ljavax/swing/BorderFactory;->createTitledBorder(Ljava/lang/String;)Ljavax/swing/border/TitledBorder;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljavax/swing/JComponent;->setBorder(Ljavax/swing/border/Border;)V

    .line 104
    new-instance v4, Ljava/awt/Dimension;

    const/16 v5, 0x12c

    const/16 v6, 0x384

    invoke-direct {v4, v6, v5}, Ljava/awt/Dimension;-><init>(II)V

    invoke-virtual {v3, v4}, Ljavax/swing/JComponent;->setPreferredSize(Ljava/awt/Dimension;)V

    .line 107
    new-instance v4, Lorg/apache/log4j/chainsaw/DetailPanel;

    invoke-direct {v4, v2, v0}, Lorg/apache/log4j/chainsaw/DetailPanel;-><init>(Ljavax/swing/JTable;Lorg/apache/log4j/chainsaw/MyTableModel;)V

    .line 108
    new-instance v2, Ljava/awt/Dimension;

    invoke-direct {v2, v6, v5}, Ljava/awt/Dimension;-><init>(II)V

    invoke-virtual {v4, v2}, Ljavax/swing/JComponent;->setPreferredSize(Ljava/awt/Dimension;)V

    .line 112
    new-instance v2, Ljavax/swing/JSplitPane;

    invoke-direct {v2, v1, v3, v4}, Ljavax/swing/JSplitPane;-><init>(ILjava/awt/Component;Ljava/awt/Component;)V

    .line 113
    invoke-virtual {p0}, Ljavax/swing/JFrame;->getContentPane()Ljava/awt/Container;

    move-result-object v1

    const-string v3, "Center"

    invoke-virtual {v1, v2, v3}, Ljava/awt/Container;->add(Ljava/awt/Component;Ljava/lang/Object;)V

    .line 115
    new-instance v1, Lorg/apache/log4j/chainsaw/Main$1;

    invoke-direct {v1}, Lorg/apache/log4j/chainsaw/Main$1;-><init>()V

    invoke-virtual {p0, v1}, Ljava/awt/Window;->addWindowListener(Ljava/awt/event/WindowListener;)V

    .line 121
    invoke-virtual {p0}, Ljava/awt/Window;->pack()V

    const/4 v1, 0x1

    .line 122
    invoke-virtual {p0, v1}, Ljava/awt/Component;->setVisible(Z)V

    .line 124
    invoke-direct {p0, v0}, Lorg/apache/log4j/chainsaw/Main;->setupReceiver(Lorg/apache/log4j/chainsaw/MyTableModel;)V

    return-void
.end method

.method static synthetic class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 1

    .line 43
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    new-instance v0, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static initLog4J()V
    .locals 3

    .line 173
    new-instance v0, Ljava/util/Properties;

    invoke-direct {v0}, Ljava/util/Properties;-><init>()V

    const-string v1, "log4j.rootLogger"

    const-string v2, "DEBUG, A1"

    .line 174
    invoke-virtual {v0, v1, v2}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    const-string v1, "log4j.appender.A1"

    const-string v2, "org.apache.log4j.ConsoleAppender"

    .line 175
    invoke-virtual {v0, v1, v2}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    const-string v1, "log4j.appender.A1.layout"

    const-string v2, "org.apache.log4j.TTCCLayout"

    .line 177
    invoke-virtual {v0, v1, v2}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 179
    invoke-static {v0}, Lorg/apache/log4j/PropertyConfigurator;->configure(Ljava/util/Properties;)V

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .locals 0

    .line 188
    invoke-static {}, Lorg/apache/log4j/chainsaw/Main;->initLog4J()V

    .line 189
    new-instance p0, Lorg/apache/log4j/chainsaw/Main;

    invoke-direct {p0}, Lorg/apache/log4j/chainsaw/Main;-><init>()V

    return-void
.end method

.method private setupReceiver(Lorg/apache/log4j/chainsaw/MyTableModel;)V
    .locals 6

    const-string v0, "chainsaw.port"

    .line 134
    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    .line 137
    :try_start_0
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 139
    :catch_0
    sget-object v3, Lorg/apache/log4j/chainsaw/Main;->LOG:Lorg/apache/log4j/Logger;

    new-instance v4, Ljava/lang/StringBuffer;

    const-string v5, "Unable to parse chainsaw.port property with value "

    invoke-direct {v4, v5}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 140
    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v5, "."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 139
    invoke-virtual {v3, v4}, Lorg/apache/log4j/Category;->fatal(Ljava/lang/Object;)V

    .line 143
    new-instance v3, Ljava/lang/StringBuffer;

    const-string v4, "Unable to parse port number from \'"

    invoke-direct {v3, v4}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v0, "\', quitting."

    .line 144
    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 143
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v3, "CHAINSAW"

    .line 141
    invoke-static {p0, v0, v3, v2}, Ljavax/swing/JOptionPane;->showMessageDialog(Ljava/awt/Component;Ljava/lang/Object;Ljava/lang/String;I)V

    .line 147
    invoke-static {v1}, Ljava/lang/System;->exit(I)V

    :cond_0
    const/16 v0, 0x115d

    .line 152
    :goto_0
    :try_start_1
    new-instance v3, Lorg/apache/log4j/chainsaw/LoggingReceiver;

    invoke-direct {v3, p1, v0}, Lorg/apache/log4j/chainsaw/LoggingReceiver;-><init>(Lorg/apache/log4j/chainsaw/MyTableModel;I)V

    .line 153
    invoke-virtual {v3}, Ljava/lang/Thread;->start()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception p1

    .line 155
    sget-object v3, Lorg/apache/log4j/chainsaw/Main;->LOG:Lorg/apache/log4j/Logger;

    const-string v4, "Unable to connect to socket server, quiting"

    invoke-virtual {v3, v4, p1}, Lorg/apache/log4j/Category;->fatal(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 158
    new-instance p1, Ljava/lang/StringBuffer;

    const-string v3, "Unable to create socket on port "

    invoke-direct {p1, v3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    const-string v0, ", quitting."

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "CHAINSAW"

    .line 156
    invoke-static {p0, p1, v0, v2}, Ljavax/swing/JOptionPane;->showMessageDialog(Ljava/awt/Component;Ljava/lang/Object;Ljava/lang/String;I)V

    .line 161
    invoke-static {v1}, Ljava/lang/System;->exit(I)V

    :goto_1
    return-void
.end method
