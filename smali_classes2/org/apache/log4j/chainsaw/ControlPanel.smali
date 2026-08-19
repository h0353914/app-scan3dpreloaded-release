.class Lorg/apache/log4j/chainsaw/ControlPanel;
.super Ljavax/swing/JPanel;
.source "ControlPanel.java"


# static fields
.field private static final LOG:Lorg/apache/log4j/Logger;

.field static synthetic class$org$apache$log4j$chainsaw$ControlPanel:Ljava/lang/Class;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 41
    sget-object v0, Lorg/apache/log4j/chainsaw/ControlPanel;->class$org$apache$log4j$chainsaw$ControlPanel:Ljava/lang/Class;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const-string v0, "org.apache.log4j.chainsaw.ControlPanel"

    invoke-static {v0}, Lorg/apache/log4j/chainsaw/ControlPanel;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/log4j/chainsaw/ControlPanel;->class$org$apache$log4j$chainsaw$ControlPanel:Ljava/lang/Class;

    :goto_0
    invoke-static {v0}, Lorg/apache/log4j/Logger;->getLogger(Ljava/lang/Class;)Lorg/apache/log4j/Logger;

    move-result-object v0

    .line 40
    sput-object v0, Lorg/apache/log4j/chainsaw/ControlPanel;->LOG:Lorg/apache/log4j/Logger;

    return-void
.end method

.method constructor <init>(Lorg/apache/log4j/chainsaw/MyTableModel;)V
    .locals 9

    .line 48
    invoke-direct {p0}, Ljavax/swing/JPanel;-><init>()V

    const-string v0, "Controls: "

    .line 49
    invoke-static {v0}, Ljavax/swing/BorderFactory;->createTitledBorder(Ljava/lang/String;)Ljavax/swing/border/TitledBorder;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljavax/swing/JComponent;->setBorder(Ljavax/swing/border/Border;)V

    .line 50
    new-instance v0, Ljava/awt/GridBagLayout;

    invoke-direct {v0}, Ljava/awt/GridBagLayout;-><init>()V

    .line 51
    new-instance v1, Ljava/awt/GridBagConstraints;

    invoke-direct {v1}, Ljava/awt/GridBagConstraints;-><init>()V

    .line 52
    invoke-virtual {p0, v0}, Ljava/awt/Container;->setLayout(Ljava/awt/LayoutManager;)V

    const/4 v2, 0x5

    .line 55
    iput v2, v1, Ljava/awt/GridBagConstraints;->ipadx:I

    .line 56
    iput v2, v1, Ljava/awt/GridBagConstraints;->ipady:I

    const/4 v2, 0x0

    .line 59
    iput v2, v1, Ljava/awt/GridBagConstraints;->gridx:I

    const/16 v3, 0xd

    .line 60
    iput v3, v1, Ljava/awt/GridBagConstraints;->anchor:I

    .line 62
    iput v2, v1, Ljava/awt/GridBagConstraints;->gridy:I

    .line 63
    new-instance v4, Ljavax/swing/JLabel;

    const-string v5, "Filter Level:"

    invoke-direct {v4, v5}, Ljavax/swing/JLabel;-><init>(Ljava/lang/String;)V

    .line 64
    invoke-virtual {v0, v4, v1}, Ljava/awt/GridBagLayout;->setConstraints(Ljava/awt/Component;Ljava/awt/GridBagConstraints;)V

    .line 65
    invoke-virtual {p0, v4}, Ljava/awt/Container;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 67
    iget v4, v1, Ljava/awt/GridBagConstraints;->gridy:I

    const/4 v5, 0x1

    add-int/2addr v4, v5

    iput v4, v1, Ljava/awt/GridBagConstraints;->gridy:I

    .line 68
    new-instance v4, Ljavax/swing/JLabel;

    const-string v6, "Filter Thread:"

    invoke-direct {v4, v6}, Ljavax/swing/JLabel;-><init>(Ljava/lang/String;)V

    .line 69
    invoke-virtual {v0, v4, v1}, Ljava/awt/GridBagLayout;->setConstraints(Ljava/awt/Component;Ljava/awt/GridBagConstraints;)V

    .line 70
    invoke-virtual {p0, v4}, Ljava/awt/Container;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 72
    iget v4, v1, Ljava/awt/GridBagConstraints;->gridy:I

    add-int/2addr v4, v5

    iput v4, v1, Ljava/awt/GridBagConstraints;->gridy:I

    .line 73
    new-instance v4, Ljavax/swing/JLabel;

    const-string v6, "Filter Logger:"

    invoke-direct {v4, v6}, Ljavax/swing/JLabel;-><init>(Ljava/lang/String;)V

    .line 74
    invoke-virtual {v0, v4, v1}, Ljava/awt/GridBagLayout;->setConstraints(Ljava/awt/Component;Ljava/awt/GridBagConstraints;)V

    .line 75
    invoke-virtual {p0, v4}, Ljava/awt/Container;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 77
    iget v4, v1, Ljava/awt/GridBagConstraints;->gridy:I

    add-int/2addr v4, v5

    iput v4, v1, Ljava/awt/GridBagConstraints;->gridy:I

    .line 78
    new-instance v4, Ljavax/swing/JLabel;

    const-string v6, "Filter NDC:"

    invoke-direct {v4, v6}, Ljavax/swing/JLabel;-><init>(Ljava/lang/String;)V

    .line 79
    invoke-virtual {v0, v4, v1}, Ljava/awt/GridBagLayout;->setConstraints(Ljava/awt/Component;Ljava/awt/GridBagConstraints;)V

    .line 80
    invoke-virtual {p0, v4}, Ljava/awt/Container;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 82
    iget v4, v1, Ljava/awt/GridBagConstraints;->gridy:I

    add-int/2addr v4, v5

    iput v4, v1, Ljava/awt/GridBagConstraints;->gridy:I

    .line 83
    new-instance v4, Ljavax/swing/JLabel;

    const-string v6, "Filter Message:"

    invoke-direct {v4, v6}, Ljavax/swing/JLabel;-><init>(Ljava/lang/String;)V

    .line 84
    invoke-virtual {v0, v4, v1}, Ljava/awt/GridBagLayout;->setConstraints(Ljava/awt/Component;Ljava/awt/GridBagConstraints;)V

    .line 85
    invoke-virtual {p0, v4}, Ljava/awt/Container;->add(Ljava/awt/Component;)Ljava/awt/Component;

    const-wide/high16 v6, 0x3ff0000000000000L    # 1.0

    .line 88
    iput-wide v6, v1, Ljava/awt/GridBagConstraints;->weightx:D

    .line 90
    iput v5, v1, Ljava/awt/GridBagConstraints;->gridx:I

    const/16 v4, 0x11

    .line 91
    iput v4, v1, Ljava/awt/GridBagConstraints;->anchor:I

    .line 93
    iput v2, v1, Ljava/awt/GridBagConstraints;->gridy:I

    .line 94
    invoke-static {}, Lorg/apache/log4j/Priority;->getAllPossiblePriorities()[Lorg/apache/log4j/Priority;

    move-result-object v4

    .line 95
    new-instance v6, Ljavax/swing/JComboBox;

    invoke-direct {v6, v4}, Ljavax/swing/JComboBox;-><init>([Ljava/lang/Object;)V

    .line 96
    array-length v7, v4

    sub-int/2addr v7, v5

    aget-object v4, v4, v7

    .line 97
    invoke-virtual {v6, v4}, Ljavax/swing/JComboBox;->setSelectedItem(Ljava/lang/Object;)V

    .line 98
    invoke-virtual {p1, v4}, Lorg/apache/log4j/chainsaw/MyTableModel;->setPriorityFilter(Lorg/apache/log4j/Priority;)V

    .line 99
    invoke-virtual {v0, v6, v1}, Ljava/awt/GridBagLayout;->setConstraints(Ljava/awt/Component;Ljava/awt/GridBagConstraints;)V

    .line 100
    invoke-virtual {p0, v6}, Ljava/awt/Container;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 101
    invoke-virtual {v6, v2}, Ljavax/swing/JComboBox;->setEditable(Z)V

    .line 102
    new-instance v4, Lorg/apache/log4j/chainsaw/ControlPanel$1;

    invoke-direct {v4, p1, v6}, Lorg/apache/log4j/chainsaw/ControlPanel$1;-><init>(Lorg/apache/log4j/chainsaw/MyTableModel;Ljavax/swing/JComboBox;)V

    invoke-virtual {v6, v4}, Ljavax/swing/JComboBox;->addActionListener(Ljava/awt/event/ActionListener;)V

    const/4 v4, 0x2

    .line 110
    iput v4, v1, Ljava/awt/GridBagConstraints;->fill:I

    .line 111
    iget v6, v1, Ljava/awt/GridBagConstraints;->gridy:I

    add-int/2addr v6, v5

    iput v6, v1, Ljava/awt/GridBagConstraints;->gridy:I

    .line 112
    new-instance v6, Ljavax/swing/JTextField;

    const-string v7, ""

    invoke-direct {v6, v7}, Ljavax/swing/JTextField;-><init>(Ljava/lang/String;)V

    .line 113
    invoke-virtual {v6}, Ljavax/swing/text/JTextComponent;->getDocument()Ljavax/swing/text/Document;

    move-result-object v7

    new-instance v8, Lorg/apache/log4j/chainsaw/ControlPanel$2;

    invoke-direct {v8, p1, v6}, Lorg/apache/log4j/chainsaw/ControlPanel$2;-><init>(Lorg/apache/log4j/chainsaw/MyTableModel;Ljavax/swing/JTextField;)V

    invoke-interface {v7, v8}, Ljavax/swing/text/Document;->addDocumentListener(Ljavax/swing/event/DocumentListener;)V

    .line 124
    invoke-virtual {v0, v6, v1}, Ljava/awt/GridBagLayout;->setConstraints(Ljava/awt/Component;Ljava/awt/GridBagConstraints;)V

    .line 125
    invoke-virtual {p0, v6}, Ljava/awt/Container;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 127
    iget v6, v1, Ljava/awt/GridBagConstraints;->gridy:I

    add-int/2addr v6, v5

    iput v6, v1, Ljava/awt/GridBagConstraints;->gridy:I

    .line 128
    new-instance v6, Ljavax/swing/JTextField;

    const-string v7, ""

    invoke-direct {v6, v7}, Ljavax/swing/JTextField;-><init>(Ljava/lang/String;)V

    .line 129
    invoke-virtual {v6}, Ljavax/swing/text/JTextComponent;->getDocument()Ljavax/swing/text/Document;

    move-result-object v7

    new-instance v8, Lorg/apache/log4j/chainsaw/ControlPanel$3;

    invoke-direct {v8, p1, v6}, Lorg/apache/log4j/chainsaw/ControlPanel$3;-><init>(Lorg/apache/log4j/chainsaw/MyTableModel;Ljavax/swing/JTextField;)V

    invoke-interface {v7, v8}, Ljavax/swing/text/Document;->addDocumentListener(Ljavax/swing/event/DocumentListener;)V

    .line 140
    invoke-virtual {v0, v6, v1}, Ljava/awt/GridBagLayout;->setConstraints(Ljava/awt/Component;Ljava/awt/GridBagConstraints;)V

    .line 141
    invoke-virtual {p0, v6}, Ljava/awt/Container;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 143
    iget v6, v1, Ljava/awt/GridBagConstraints;->gridy:I

    add-int/2addr v6, v5

    iput v6, v1, Ljava/awt/GridBagConstraints;->gridy:I

    .line 144
    new-instance v6, Ljavax/swing/JTextField;

    const-string v7, ""

    invoke-direct {v6, v7}, Ljavax/swing/JTextField;-><init>(Ljava/lang/String;)V

    .line 145
    invoke-virtual {v6}, Ljavax/swing/text/JTextComponent;->getDocument()Ljavax/swing/text/Document;

    move-result-object v7

    new-instance v8, Lorg/apache/log4j/chainsaw/ControlPanel$4;

    invoke-direct {v8, p1, v6}, Lorg/apache/log4j/chainsaw/ControlPanel$4;-><init>(Lorg/apache/log4j/chainsaw/MyTableModel;Ljavax/swing/JTextField;)V

    invoke-interface {v7, v8}, Ljavax/swing/text/Document;->addDocumentListener(Ljavax/swing/event/DocumentListener;)V

    .line 156
    invoke-virtual {v0, v6, v1}, Ljava/awt/GridBagLayout;->setConstraints(Ljava/awt/Component;Ljava/awt/GridBagConstraints;)V

    .line 157
    invoke-virtual {p0, v6}, Ljava/awt/Container;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 159
    iget v6, v1, Ljava/awt/GridBagConstraints;->gridy:I

    add-int/2addr v6, v5

    iput v6, v1, Ljava/awt/GridBagConstraints;->gridy:I

    .line 160
    new-instance v6, Ljavax/swing/JTextField;

    const-string v7, ""

    invoke-direct {v6, v7}, Ljavax/swing/JTextField;-><init>(Ljava/lang/String;)V

    .line 161
    invoke-virtual {v6}, Ljavax/swing/text/JTextComponent;->getDocument()Ljavax/swing/text/Document;

    move-result-object v7

    new-instance v8, Lorg/apache/log4j/chainsaw/ControlPanel$5;

    invoke-direct {v8, p1, v6}, Lorg/apache/log4j/chainsaw/ControlPanel$5;-><init>(Lorg/apache/log4j/chainsaw/MyTableModel;Ljavax/swing/JTextField;)V

    invoke-interface {v7, v8}, Ljavax/swing/text/Document;->addDocumentListener(Ljavax/swing/event/DocumentListener;)V

    .line 174
    invoke-virtual {v0, v6, v1}, Ljava/awt/GridBagLayout;->setConstraints(Ljava/awt/Component;Ljava/awt/GridBagConstraints;)V

    .line 175
    invoke-virtual {p0, v6}, Ljava/awt/Container;->add(Ljava/awt/Component;)Ljava/awt/Component;

    const-wide/16 v6, 0x0

    .line 178
    iput-wide v6, v1, Ljava/awt/GridBagConstraints;->weightx:D

    .line 179
    iput v4, v1, Ljava/awt/GridBagConstraints;->fill:I

    .line 180
    iput v3, v1, Ljava/awt/GridBagConstraints;->anchor:I

    .line 181
    iput v4, v1, Ljava/awt/GridBagConstraints;->gridx:I

    .line 183
    iput v2, v1, Ljava/awt/GridBagConstraints;->gridy:I

    .line 184
    new-instance v2, Ljavax/swing/JButton;

    const-string v3, "Exit"

    invoke-direct {v2, v3}, Ljavax/swing/JButton;-><init>(Ljava/lang/String;)V

    const/16 v3, 0x78

    .line 185
    invoke-virtual {v2, v3}, Ljavax/swing/AbstractButton;->setMnemonic(C)V

    .line 186
    sget-object v3, Lorg/apache/log4j/chainsaw/ExitAction;->INSTANCE:Lorg/apache/log4j/chainsaw/ExitAction;

    invoke-virtual {v2, v3}, Ljavax/swing/AbstractButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 187
    invoke-virtual {v0, v2, v1}, Ljava/awt/GridBagLayout;->setConstraints(Ljava/awt/Component;Ljava/awt/GridBagConstraints;)V

    .line 188
    invoke-virtual {p0, v2}, Ljava/awt/Container;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 190
    iget v2, v1, Ljava/awt/GridBagConstraints;->gridy:I

    add-int/2addr v2, v5

    iput v2, v1, Ljava/awt/GridBagConstraints;->gridy:I

    .line 191
    new-instance v2, Ljavax/swing/JButton;

    const-string v3, "Clear"

    invoke-direct {v2, v3}, Ljavax/swing/JButton;-><init>(Ljava/lang/String;)V

    const/16 v3, 0x63

    .line 192
    invoke-virtual {v2, v3}, Ljavax/swing/AbstractButton;->setMnemonic(C)V

    .line 193
    new-instance v3, Lorg/apache/log4j/chainsaw/ControlPanel$6;

    invoke-direct {v3, p1}, Lorg/apache/log4j/chainsaw/ControlPanel$6;-><init>(Lorg/apache/log4j/chainsaw/MyTableModel;)V

    invoke-virtual {v2, v3}, Ljavax/swing/AbstractButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 198
    invoke-virtual {v0, v2, v1}, Ljava/awt/GridBagLayout;->setConstraints(Ljava/awt/Component;Ljava/awt/GridBagConstraints;)V

    .line 199
    invoke-virtual {p0, v2}, Ljava/awt/Container;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 201
    iget v2, v1, Ljava/awt/GridBagConstraints;->gridy:I

    add-int/2addr v2, v5

    iput v2, v1, Ljava/awt/GridBagConstraints;->gridy:I

    .line 202
    new-instance v2, Ljavax/swing/JButton;

    const-string v3, "Pause"

    invoke-direct {v2, v3}, Ljavax/swing/JButton;-><init>(Ljava/lang/String;)V

    const/16 v3, 0x70

    .line 203
    invoke-virtual {v2, v3}, Ljavax/swing/AbstractButton;->setMnemonic(C)V

    .line 204
    new-instance v3, Lorg/apache/log4j/chainsaw/ControlPanel$7;

    invoke-direct {v3, p1, v2}, Lorg/apache/log4j/chainsaw/ControlPanel$7;-><init>(Lorg/apache/log4j/chainsaw/MyTableModel;Ljavax/swing/JButton;)V

    invoke-virtual {v2, v3}, Ljavax/swing/AbstractButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 211
    invoke-virtual {v0, v2, v1}, Ljava/awt/GridBagLayout;->setConstraints(Ljava/awt/Component;Ljava/awt/GridBagConstraints;)V

    .line 212
    invoke-virtual {p0, v2}, Ljava/awt/Container;->add(Ljava/awt/Component;)Ljava/awt/Component;

    return-void
.end method

.method static synthetic class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 1

    .line 38
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
