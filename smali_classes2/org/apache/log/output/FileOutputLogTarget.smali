.class public Lorg/apache/log/output/FileOutputLogTarget;
.super Lorg/apache/log/output/DefaultOutputLogTarget;
.source "FileOutputLogTarget.java"


# instance fields
.field private m_append:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 27
    invoke-direct {p0}, Lorg/apache/log/output/DefaultOutputLogTarget;-><init>()V

    const/4 v0, 0x0

    .line 24
    iput-boolean v0, p0, Lorg/apache/log/output/FileOutputLogTarget;->m_append:Z

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 32
    invoke-direct {p0}, Lorg/apache/log/output/DefaultOutputLogTarget;-><init>()V

    const/4 v0, 0x0

    .line 24
    iput-boolean v0, p0, Lorg/apache/log/output/FileOutputLogTarget;->m_append:Z

    .line 33
    invoke-virtual {p0, p1}, Lorg/apache/log/output/FileOutputLogTarget;->setFilename(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 38
    invoke-direct {p0}, Lorg/apache/log/output/DefaultOutputLogTarget;-><init>()V

    const/4 v0, 0x0

    .line 24
    iput-boolean v0, p0, Lorg/apache/log/output/FileOutputLogTarget;->m_append:Z

    .line 39
    iput-boolean p2, p0, Lorg/apache/log/output/FileOutputLogTarget;->m_append:Z

    .line 40
    invoke-virtual {p0, p1}, Lorg/apache/log/output/FileOutputLogTarget;->setFilename(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public setAppend(Z)V
    .locals 0

    .line 45
    iput-boolean p1, p0, Lorg/apache/log/output/FileOutputLogTarget;->m_append:Z

    return-void
.end method

.method public setFilename(Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 59
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 60
    invoke-virtual {v0}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    .line 61
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 63
    :cond_0
    new-instance v0, Ljava/io/FileWriter;

    iget-boolean v1, p0, Lorg/apache/log/output/FileOutputLogTarget;->m_append:Z

    invoke-direct {v0, p1, v1}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;Z)V

    iput-object v0, p0, Lorg/apache/log/output/FileOutputLogTarget;->m_output:Ljava/io/Writer;

    return-void
.end method
