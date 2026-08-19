.class public Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;
.super Ljava/lang/Object;
.source "MRUFileManager.java"


# static fields
.field private static final CONFIG_FILE_NAME:Ljava/lang/String; = "mru_file_manager"

.field private static final DEFAULT_MAX_SIZE:I = 0x3


# instance fields
.field private _maxSize:I

.field private _mruFileList:Ljava/util/LinkedList;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 48
    iput v0, p0, Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;->_maxSize:I

    .line 55
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;->load()V

    const/4 v0, 0x3

    .line 56
    invoke-virtual {p0, v0}, Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;->setMaxSize(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 48
    iput v0, p0, Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;->_maxSize:I

    .line 60
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;->load()V

    .line 61
    invoke-virtual {p0, p1}, Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;->setMaxSize(I)V

    return-void
.end method

.method public static createConfigurationDirectory()V
    .locals 4

    const-string v0, "user.home"

    .line 174
    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "file.separator"

    .line 175
    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 176
    new-instance v2, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v3, v0}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v0, "lf5"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 177
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    .line 179
    :try_start_0
    invoke-virtual {v2}, Ljava/io/File;->mkdir()Z
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 181
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_0
    :goto_0
    return-void
.end method


# virtual methods
.method public getFile(I)Ljava/lang/Object;
    .locals 1

    .line 97
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 98
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;->_mruFileList:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method protected getFilename()Ljava/lang/String;
    .locals 3

    const-string v0, "user.home"

    .line 259
    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "file.separator"

    .line 260
    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 262
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v0, "lf5"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v0, "mru_file_manager"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getInputStream(I)Ljava/io/InputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 109
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;->size()I

    move-result v0

    if-ge p1, v0, :cond_1

    .line 110
    invoke-virtual {p0, p1}, Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;->getFile(I)Ljava/lang/Object;

    move-result-object p1

    .line 111
    instance-of v0, p1, Ljava/io/File;

    if-eqz v0, :cond_0

    .line 112
    check-cast p1, Ljava/io/File;

    invoke-virtual {p0, p1}, Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;->getInputStream(Ljava/io/File;)Ljava/io/InputStream;

    move-result-object p1

    return-object p1

    .line 114
    :cond_0
    check-cast p1, Ljava/net/URL;

    invoke-virtual {p0, p1}, Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;->getInputStream(Ljava/net/URL;)Ljava/io/InputStream;

    move-result-object p1

    return-object p1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method protected getInputStream(Ljava/io/File;)Ljava/io/InputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 198
    new-instance v0, Ljava/io/BufferedInputStream;

    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    return-object v0
.end method

.method protected getInputStream(Ljava/net/URL;)Ljava/io/InputStream;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 210
    invoke-virtual {p1}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object p1

    return-object p1
.end method

.method public getMRUFileList()[Ljava/lang/String;
    .locals 4

    .line 138
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;->size()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 142
    :cond_0
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    .line 144
    :goto_0
    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;->size()I

    move-result v2

    if-lt v1, v2, :cond_1

    return-object v0

    .line 145
    :cond_1
    invoke-virtual {p0, v1}, Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;->getFile(I)Ljava/lang/Object;

    move-result-object v2

    .line 146
    instance-of v3, v2, Ljava/io/File;

    if-eqz v3, :cond_2

    .line 147
    check-cast v2, Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    goto :goto_1

    .line 150
    :cond_2
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method protected load()V
    .locals 3

    .line 232
    invoke-static {}, Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;->createConfigurationDirectory()V

    .line 233
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;->getFilename()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 234
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 236
    :try_start_0
    new-instance v1, Ljava/io/ObjectInputStream;

    .line 237
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 236
    invoke-direct {v1, v2}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    .line 238
    invoke-virtual {v1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/LinkedList;

    iput-object v0, p0, Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;->_mruFileList:Ljava/util/LinkedList;

    .line 239
    invoke-virtual {v1}, Ljava/io/ObjectInputStream;->close()V

    .line 242
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;->_mruFileList:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/AbstractSequentialList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 243
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_1

    .line 244
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 245
    instance-of v2, v1, Ljava/io/File;

    if-nez v2, :cond_0

    instance-of v1, v1, Ljava/net/URL;

    if-nez v1, :cond_0

    .line 246
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 250
    :catch_0
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;->_mruFileList:Ljava/util/LinkedList;

    goto :goto_1

    .line 253
    :cond_2
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;->_mruFileList:Ljava/util/LinkedList;

    :goto_1
    return-void
.end method

.method public moveToTop(I)V
    .locals 2

    .line 164
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;->_mruFileList:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->remove(I)Ljava/lang/Object;

    move-result-object p1

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Ljava/util/LinkedList;->add(ILjava/lang/Object;)V

    return-void
.end method

.method public save()V
    .locals 3

    .line 71
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;->getFilename()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 74
    :try_start_0
    new-instance v1, Ljava/io/ObjectOutputStream;

    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v2}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 76
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;->_mruFileList:Ljava/util/LinkedList;

    invoke-virtual {v1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 77
    invoke-virtual {v1}, Ljava/io/ObjectOutputStream;->flush()V

    .line 78
    invoke-virtual {v1}, Ljava/io/ObjectOutputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 81
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    :goto_0
    return-void
.end method

.method public set(Ljava/io/File;)V
    .locals 0

    .line 124
    invoke-virtual {p0, p1}, Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;->setMRU(Ljava/lang/Object;)V

    return-void
.end method

.method public set(Ljava/net/URL;)V
    .locals 0

    .line 131
    invoke-virtual {p0, p1}, Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;->setMRU(Ljava/lang/Object;)V

    return-void
.end method

.method protected setMRU(Ljava/lang/Object;)V
    .locals 2

    .line 217
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;->_mruFileList:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 220
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;->_mruFileList:Ljava/util/LinkedList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Ljava/util/LinkedList;->add(ILjava/lang/Object;)V

    .line 221
    iget p1, p0, Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;->_maxSize:I

    invoke-virtual {p0, p1}, Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;->setMaxSize(I)V

    goto :goto_0

    .line 223
    :cond_0
    invoke-virtual {p0, v0}, Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;->moveToTop(I)V

    :goto_0
    return-void
.end method

.method protected setMaxSize(I)V
    .locals 2

    .line 269
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;->_mruFileList:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    if-ge p1, v0, :cond_1

    const/4 v0, 0x0

    .line 270
    :goto_0
    iget-object v1, p0, Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;->_mruFileList:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    sub-int/2addr v1, p1

    if-lt v0, v1, :cond_0

    goto :goto_1

    .line 271
    :cond_0
    iget-object v1, p0, Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;->_mruFileList:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 275
    :cond_1
    :goto_1
    iput p1, p0, Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;->_maxSize:I

    return-void
.end method

.method public size()I
    .locals 1

    .line 89
    iget-object v0, p0, Lorg/apache/log4j/lf5/viewer/configure/MRUFileManager;->_mruFileList:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    return v0
.end method
