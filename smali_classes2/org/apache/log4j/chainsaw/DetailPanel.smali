.class Lorg/apache/log4j/chainsaw/DetailPanel;
.super Ljavax/swing/JPanel;
.source "DetailPanel.java"

# interfaces
.implements Ljavax/swing/event/ListSelectionListener;


# static fields
.field private static final FORMATTER:Ljava/text/MessageFormat;

.field private static final LOG:Lorg/apache/log4j/Logger;

.field static synthetic class$org$apache$log4j$chainsaw$DetailPanel:Ljava/lang/Class;


# instance fields
.field private final mDetails:Ljavax/swing/JEditorPane;

.field private final mModel:Lorg/apache/log4j/chainsaw/MyTableModel;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 42
    sget-object v0, Lorg/apache/log4j/chainsaw/DetailPanel;->class$org$apache$log4j$chainsaw$DetailPanel:Ljava/lang/Class;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const-string v0, "org.apache.log4j.chainsaw.DetailPanel"

    invoke-static {v0}, Lorg/apache/log4j/chainsaw/DetailPanel;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/log4j/chainsaw/DetailPanel;->class$org$apache$log4j$chainsaw$DetailPanel:Ljava/lang/Class;

    :goto_0
    invoke-static {v0}, Lorg/apache/log4j/Logger;->getLogger(Ljava/lang/Class;)Lorg/apache/log4j/Logger;

    move-result-object v0

    .line 41
    sput-object v0, Lorg/apache/log4j/chainsaw/DetailPanel;->LOG:Lorg/apache/log4j/Logger;

    .line 45
    new-instance v0, Ljava/text/MessageFormat;

    const-string v1, "<b>Time:</b> <code>{0,time,medium}</code>&nbsp;&nbsp;<b>Priority:</b> <code>{1}</code>&nbsp;&nbsp;<b>Thread:</b> <code>{2}</code>&nbsp;&nbsp;<b>NDC:</b> <code>{3}</code><br><b>Logger:</b> <code>{4}</code><br><b>Location:</b> <code>{5}</code><br><b>Message:</b><pre>{6}</pre><b>Throwable:</b><pre>{7}</pre>"

    invoke-direct {v0, v1}, Ljava/text/MessageFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/log4j/chainsaw/DetailPanel;->FORMATTER:Ljava/text/MessageFormat;

    return-void
.end method

.method constructor <init>(Ljavax/swing/JTable;Lorg/apache/log4j/chainsaw/MyTableModel;)V
    .locals 1

    .line 68
    invoke-direct {p0}, Ljavax/swing/JPanel;-><init>()V

    .line 69
    iput-object p2, p0, Lorg/apache/log4j/chainsaw/DetailPanel;->mModel:Lorg/apache/log4j/chainsaw/MyTableModel;

    .line 70
    new-instance p2, Ljava/awt/BorderLayout;

    invoke-direct {p2}, Ljava/awt/BorderLayout;-><init>()V

    invoke-virtual {p0, p2}, Ljava/awt/Container;->setLayout(Ljava/awt/LayoutManager;)V

    const-string p2, "Details: "

    .line 71
    invoke-static {p2}, Ljavax/swing/BorderFactory;->createTitledBorder(Ljava/lang/String;)Ljavax/swing/border/TitledBorder;

    move-result-object p2

    invoke-virtual {p0, p2}, Ljavax/swing/JComponent;->setBorder(Ljavax/swing/border/Border;)V

    .line 73
    new-instance p2, Ljavax/swing/JEditorPane;

    invoke-direct {p2}, Ljavax/swing/JEditorPane;-><init>()V

    iput-object p2, p0, Lorg/apache/log4j/chainsaw/DetailPanel;->mDetails:Ljavax/swing/JEditorPane;

    .line 74
    iget-object p2, p0, Lorg/apache/log4j/chainsaw/DetailPanel;->mDetails:Ljavax/swing/JEditorPane;

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Ljavax/swing/text/JTextComponent;->setEditable(Z)V

    .line 75
    iget-object p2, p0, Lorg/apache/log4j/chainsaw/DetailPanel;->mDetails:Ljavax/swing/JEditorPane;

    const-string v0, "text/html"

    invoke-virtual {p2, v0}, Ljavax/swing/JEditorPane;->setContentType(Ljava/lang/String;)V

    .line 76
    new-instance p2, Ljavax/swing/JScrollPane;

    iget-object v0, p0, Lorg/apache/log4j/chainsaw/DetailPanel;->mDetails:Ljavax/swing/JEditorPane;

    invoke-direct {p2, v0}, Ljavax/swing/JScrollPane;-><init>(Ljava/awt/Component;)V

    const-string v0, "Center"

    invoke-virtual {p0, p2, v0}, Ljava/awt/Container;->add(Ljava/awt/Component;Ljava/lang/Object;)V

    .line 78
    invoke-virtual {p1}, Ljavax/swing/JTable;->getSelectionModel()Ljavax/swing/ListSelectionModel;

    move-result-object p1

    .line 79
    invoke-interface {p1, p0}, Ljavax/swing/ListSelectionModel;->addListSelectionListener(Ljavax/swing/event/ListSelectionListener;)V

    return-void
.end method

.method static synthetic class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 1

    .line 36
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

.method private escape(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 146
    :cond_0
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const/4 v1, 0x0

    .line 147
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-lt v1, v2, :cond_1

    .line 167
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 148
    :cond_1
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x22

    if-eq v2, v3, :cond_5

    const/16 v3, 0x26

    if-eq v2, v3, :cond_4

    const/16 v3, 0x3c

    if-eq v2, v3, :cond_3

    const/16 v3, 0x3e

    if-eq v2, v3, :cond_2

    .line 163
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1

    :cond_2
    const-string v2, "&gt;"

    .line 154
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    :cond_3
    const-string v2, "&lt;"

    .line 151
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    :cond_4
    const-string v2, "&amp;"

    .line 160
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    :cond_5
    const-string v2, "&quot;"

    .line 157
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private static getThrowableStrRep(Lorg/apache/log4j/chainsaw/EventDetails;)Ljava/lang/String;
    .locals 3

    .line 122
    invoke-virtual {p0}, Lorg/apache/log4j/chainsaw/EventDetails;->getThrowableStrRep()[Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 127
    :cond_0
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const/4 v1, 0x0

    .line 128
    :goto_0
    array-length v2, p0

    if-lt v1, v2, :cond_1

    .line 132
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 129
    :cond_1
    aget-object v2, p0, v1

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v2, "\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method


# virtual methods
.method public valueChanged(Ljavax/swing/event/ListSelectionEvent;)V
    .locals 4

    .line 85
    invoke-virtual {p1}, Ljavax/swing/event/ListSelectionEvent;->getValueIsAdjusting()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 89
    :cond_0
    invoke-virtual {p1}, Ljava/util/EventObject;->getSource()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljavax/swing/ListSelectionModel;

    .line 90
    invoke-interface {p1}, Ljavax/swing/ListSelectionModel;->isSelectionEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 91
    iget-object p1, p0, Lorg/apache/log4j/chainsaw/DetailPanel;->mDetails:Ljavax/swing/JEditorPane;

    const-string v0, "Nothing selected"

    invoke-virtual {p1, v0}, Ljavax/swing/JEditorPane;->setText(Ljava/lang/String;)V

    goto :goto_0

    .line 93
    :cond_1
    invoke-interface {p1}, Ljavax/swing/ListSelectionModel;->getMinSelectionIndex()I

    move-result p1

    .line 94
    iget-object v0, p0, Lorg/apache/log4j/chainsaw/DetailPanel;->mModel:Lorg/apache/log4j/chainsaw/MyTableModel;

    invoke-virtual {v0, p1}, Lorg/apache/log4j/chainsaw/MyTableModel;->getEventDetails(I)Lorg/apache/log4j/chainsaw/EventDetails;

    move-result-object p1

    const/16 v0, 0x8

    .line 96
    new-array v0, v0, [Ljava/lang/Object;

    .line 97
    new-instance v1, Ljava/util/Date;

    invoke-virtual {p1}, Lorg/apache/log4j/chainsaw/EventDetails;->getTimeStamp()J

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const/4 v1, 0x1

    .line 98
    invoke-virtual {p1}, Lorg/apache/log4j/chainsaw/EventDetails;->getPriority()Lorg/apache/log4j/Priority;

    move-result-object v3

    aput-object v3, v0, v1

    const/4 v1, 0x2

    .line 99
    invoke-virtual {p1}, Lorg/apache/log4j/chainsaw/EventDetails;->getThreadName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/apache/log4j/chainsaw/DetailPanel;->escape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v0, v1

    const/4 v1, 0x3

    .line 100
    invoke-virtual {p1}, Lorg/apache/log4j/chainsaw/EventDetails;->getNDC()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/apache/log4j/chainsaw/DetailPanel;->escape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v0, v1

    const/4 v1, 0x4

    .line 101
    invoke-virtual {p1}, Lorg/apache/log4j/chainsaw/EventDetails;->getCategoryName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/apache/log4j/chainsaw/DetailPanel;->escape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v0, v1

    const/4 v1, 0x5

    .line 102
    invoke-virtual {p1}, Lorg/apache/log4j/chainsaw/EventDetails;->getLocationDetails()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/apache/log4j/chainsaw/DetailPanel;->escape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v0, v1

    const/4 v1, 0x6

    .line 103
    invoke-virtual {p1}, Lorg/apache/log4j/chainsaw/EventDetails;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/apache/log4j/chainsaw/DetailPanel;->escape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v0, v1

    const/4 v1, 0x7

    .line 104
    invoke-static {p1}, Lorg/apache/log4j/chainsaw/DetailPanel;->getThrowableStrRep(Lorg/apache/log4j/chainsaw/EventDetails;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/apache/log4j/chainsaw/DetailPanel;->escape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v0, v1

    .line 106
    iget-object p1, p0, Lorg/apache/log4j/chainsaw/DetailPanel;->mDetails:Ljavax/swing/JEditorPane;

    sget-object v1, Lorg/apache/log4j/chainsaw/DetailPanel;->FORMATTER:Ljava/text/MessageFormat;

    invoke-virtual {v1, v0}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljavax/swing/JEditorPane;->setText(Ljava/lang/String;)V

    .line 107
    iget-object p1, p0, Lorg/apache/log4j/chainsaw/DetailPanel;->mDetails:Ljavax/swing/JEditorPane;

    invoke-virtual {p1, v2}, Ljavax/swing/text/JTextComponent;->setCaretPosition(I)V

    :goto_0
    return-void
.end method
