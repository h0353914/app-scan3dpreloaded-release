.class public Lorg/apache/log/output/db/ColumnInfo;
.super Ljava/lang/Object;
.source "ColumnInfo.java"


# instance fields
.field private final m_aux:Ljava/lang/String;

.field private final m_name:Ljava/lang/String;

.field private final m_type:I


# direct methods
.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object p1, p0, Lorg/apache/log/output/db/ColumnInfo;->m_name:Ljava/lang/String;

    .line 29
    iput p2, p0, Lorg/apache/log/output/db/ColumnInfo;->m_type:I

    .line 30
    iput-object p3, p0, Lorg/apache/log/output/db/ColumnInfo;->m_aux:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getAux()Ljava/lang/String;
    .locals 1

    .line 45
    iget-object v0, p0, Lorg/apache/log/output/db/ColumnInfo;->m_aux:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 35
    iget-object v0, p0, Lorg/apache/log/output/db/ColumnInfo;->m_name:Ljava/lang/String;

    return-object v0
.end method

.method public getType()I
    .locals 1

    .line 40
    iget v0, p0, Lorg/apache/log/output/db/ColumnInfo;->m_type:I

    return v0
.end method
