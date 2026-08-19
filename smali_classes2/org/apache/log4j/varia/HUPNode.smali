.class Lorg/apache/log4j/varia/HUPNode;
.super Ljava/lang/Object;
.source "ExternallyRolledFileAppender.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field dis:Ljava/io/DataInputStream;

.field dos:Ljava/io/DataOutputStream;

.field er:Lorg/apache/log4j/varia/ExternallyRolledFileAppender;

.field socket:Ljava/net/Socket;


# direct methods
.method public constructor <init>(Ljava/net/Socket;Lorg/apache/log4j/varia/ExternallyRolledFileAppender;)V
    .locals 1

    .line 141
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 142
    iput-object p1, p0, Lorg/apache/log4j/varia/HUPNode;->socket:Ljava/net/Socket;

    .line 143
    iput-object p2, p0, Lorg/apache/log4j/varia/HUPNode;->er:Lorg/apache/log4j/varia/ExternallyRolledFileAppender;

    .line 145
    :try_start_0
    new-instance p2, Ljava/io/DataInputStream;

    invoke-virtual {p1}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-direct {p2, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object p2, p0, Lorg/apache/log4j/varia/HUPNode;->dis:Ljava/io/DataInputStream;

    .line 146
    new-instance p2, Ljava/io/DataOutputStream;

    invoke-virtual {p1}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object p2, p0, Lorg/apache/log4j/varia/HUPNode;->dos:Ljava/io/DataOutputStream;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 149
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    :goto_0
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 155
    :try_start_0
    iget-object v0, p0, Lorg/apache/log4j/varia/HUPNode;->dis:Ljava/io/DataInputStream;

    invoke-virtual {v0}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Got external roll over signal."

    .line 156
    invoke-static {v1}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    const-string v1, "RollOver"

    .line 157
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 158
    iget-object v0, p0, Lorg/apache/log4j/varia/HUPNode;->er:Lorg/apache/log4j/varia/ExternallyRolledFileAppender;

    monitor-enter v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 159
    :try_start_1
    iget-object v1, p0, Lorg/apache/log4j/varia/HUPNode;->er:Lorg/apache/log4j/varia/ExternallyRolledFileAppender;

    invoke-virtual {v1}, Lorg/apache/log4j/RollingFileAppender;->rollOver()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 158
    :try_start_2
    monitor-exit v0

    .line 161
    iget-object v0, p0, Lorg/apache/log4j/varia/HUPNode;->dos:Ljava/io/DataOutputStream;

    const-string v1, "OK"

    invoke-virtual {v0, v1}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    goto :goto_0

    :catchall_0
    move-exception v1

    .line 158
    monitor-exit v0

    throw v1

    .line 164
    :cond_0
    iget-object v0, p0, Lorg/apache/log4j/varia/HUPNode;->dos:Ljava/io/DataOutputStream;

    const-string v1, "Expecting [RollOver] string."

    invoke-virtual {v0, v1}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 166
    :goto_0
    iget-object v0, p0, Lorg/apache/log4j/varia/HUPNode;->dos:Ljava/io/DataOutputStream;

    invoke-virtual {v0}, Ljava/io/FilterOutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    const-string v1, "Unexpected exception. Exiting HUPNode."

    .line 169
    invoke-static {v1, v0}, Lorg/apache/log4j/helpers/LogLog;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_1
    return-void
.end method
