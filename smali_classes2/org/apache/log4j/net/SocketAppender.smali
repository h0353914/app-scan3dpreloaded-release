.class public Lorg/apache/log4j/net/SocketAppender;
.super Lorg/apache/log4j/AppenderSkeleton;
.source "SocketAppender.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/log4j/net/SocketAppender$Connector;
    }
.end annotation


# static fields
.field static final DEFAULT_PORT:I = 0x11d0

.field static final DEFAULT_RECONNECTION_DELAY:I = 0x7530

.field private static final RESET_FREQUENCY:I = 0x1


# instance fields
.field address:Ljava/net/InetAddress;

.field private connector:Lorg/apache/log4j/net/SocketAppender$Connector;

.field counter:I

.field locationInfo:Z

.field oos:Ljava/io/ObjectOutputStream;

.field port:I

.field reconnectionDelay:I

.field remoteHost:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 133
    invoke-direct {p0}, Lorg/apache/log4j/AppenderSkeleton;-><init>()V

    const/16 v0, 0x11d0

    .line 119
    iput v0, p0, Lorg/apache/log4j/net/SocketAppender;->port:I

    const/16 v0, 0x7530

    .line 121
    iput v0, p0, Lorg/apache/log4j/net/SocketAppender;->reconnectionDelay:I

    const/4 v0, 0x0

    .line 122
    iput-boolean v0, p0, Lorg/apache/log4j/net/SocketAppender;->locationInfo:Z

    .line 126
    iput v0, p0, Lorg/apache/log4j/net/SocketAppender;->counter:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 1

    .line 149
    invoke-direct {p0}, Lorg/apache/log4j/AppenderSkeleton;-><init>()V

    const/16 v0, 0x11d0

    .line 119
    iput v0, p0, Lorg/apache/log4j/net/SocketAppender;->port:I

    const/16 v0, 0x7530

    .line 121
    iput v0, p0, Lorg/apache/log4j/net/SocketAppender;->reconnectionDelay:I

    const/4 v0, 0x0

    .line 122
    iput-boolean v0, p0, Lorg/apache/log4j/net/SocketAppender;->locationInfo:Z

    .line 126
    iput v0, p0, Lorg/apache/log4j/net/SocketAppender;->counter:I

    .line 150
    iput p2, p0, Lorg/apache/log4j/net/SocketAppender;->port:I

    .line 151
    invoke-static {p1}, Lorg/apache/log4j/net/SocketAppender;->getAddressByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/log4j/net/SocketAppender;->address:Ljava/net/InetAddress;

    .line 152
    iput-object p1, p0, Lorg/apache/log4j/net/SocketAppender;->remoteHost:Ljava/lang/String;

    .line 153
    iget-object p1, p0, Lorg/apache/log4j/net/SocketAppender;->address:Ljava/net/InetAddress;

    invoke-virtual {p0, p1, p2}, Lorg/apache/log4j/net/SocketAppender;->connect(Ljava/net/InetAddress;I)V

    return-void
.end method

.method public constructor <init>(Ljava/net/InetAddress;I)V
    .locals 1

    .line 139
    invoke-direct {p0}, Lorg/apache/log4j/AppenderSkeleton;-><init>()V

    const/16 v0, 0x11d0

    .line 119
    iput v0, p0, Lorg/apache/log4j/net/SocketAppender;->port:I

    const/16 v0, 0x7530

    .line 121
    iput v0, p0, Lorg/apache/log4j/net/SocketAppender;->reconnectionDelay:I

    const/4 v0, 0x0

    .line 122
    iput-boolean v0, p0, Lorg/apache/log4j/net/SocketAppender;->locationInfo:Z

    .line 126
    iput v0, p0, Lorg/apache/log4j/net/SocketAppender;->counter:I

    .line 140
    iput-object p1, p0, Lorg/apache/log4j/net/SocketAppender;->address:Ljava/net/InetAddress;

    .line 141
    invoke-virtual {p1}, Ljava/net/InetAddress;->getHostName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/log4j/net/SocketAppender;->remoteHost:Ljava/lang/String;

    .line 142
    iput p2, p0, Lorg/apache/log4j/net/SocketAppender;->port:I

    .line 143
    invoke-virtual {p0, p1, p2}, Lorg/apache/log4j/net/SocketAppender;->connect(Ljava/net/InetAddress;I)V

    return-void
.end method

.method static synthetic access$0(Lorg/apache/log4j/net/SocketAppender;)Lorg/apache/log4j/net/SocketAppender$Connector;
    .locals 0

    .line 124
    iget-object p0, p0, Lorg/apache/log4j/net/SocketAppender;->connector:Lorg/apache/log4j/net/SocketAppender$Connector;

    return-object p0
.end method

.method static synthetic access$1(Lorg/apache/log4j/net/SocketAppender;Lorg/apache/log4j/net/SocketAppender$Connector;)V
    .locals 0

    .line 124
    iput-object p1, p0, Lorg/apache/log4j/net/SocketAppender;->connector:Lorg/apache/log4j/net/SocketAppender$Connector;

    return-void
.end method

.method static getAddressByName(Ljava/lang/String;)Ljava/net/InetAddress;
    .locals 3

    .line 265
    :try_start_0
    invoke-static {p0}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception v0

    .line 267
    new-instance v1, Ljava/lang/StringBuffer;

    const-string v2, "Could not find address of ["

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string p0, "]."

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v0}, Lorg/apache/log4j/helpers/LogLog;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public activateOptions()V
    .locals 2

    .line 160
    iget-object v0, p0, Lorg/apache/log4j/net/SocketAppender;->address:Ljava/net/InetAddress;

    iget v1, p0, Lorg/apache/log4j/net/SocketAppender;->port:I

    invoke-virtual {p0, v0, v1}, Lorg/apache/log4j/net/SocketAppender;->connect(Ljava/net/InetAddress;I)V

    return-void
.end method

.method public append(Lorg/apache/log4j/spi/LoggingEvent;)V
    .locals 2

    if-nez p1, :cond_0

    return-void

    .line 221
    :cond_0
    iget-object v0, p0, Lorg/apache/log4j/net/SocketAppender;->address:Ljava/net/InetAddress;

    if-nez v0, :cond_1

    .line 222
    iget-object p1, p0, Lorg/apache/log4j/AppenderSkeleton;->errorHandler:Lorg/apache/log4j/spi/ErrorHandler;

    new-instance v0, Ljava/lang/StringBuffer;

    const-string v1, "No remote host is set for SocketAppender named \""

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 223
    iget-object v1, p0, Lorg/apache/log4j/AppenderSkeleton;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v1, "\"."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 222
    invoke-interface {p1, v0}, Lorg/apache/log4j/spi/ErrorHandler;->error(Ljava/lang/String;)V

    return-void

    .line 227
    :cond_1
    iget-object v0, p0, Lorg/apache/log4j/net/SocketAppender;->oos:Ljava/io/ObjectOutputStream;

    if-eqz v0, :cond_3

    .line 229
    :try_start_0
    iget-boolean v0, p0, Lorg/apache/log4j/net/SocketAppender;->locationInfo:Z

    if-eqz v0, :cond_2

    .line 230
    invoke-virtual {p1}, Lorg/apache/log4j/spi/LoggingEvent;->getLocationInformation()Lorg/apache/log4j/spi/LocationInfo;

    .line 232
    :cond_2
    iget-object v0, p0, Lorg/apache/log4j/net/SocketAppender;->oos:Ljava/io/ObjectOutputStream;

    invoke-virtual {v0, p1}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 234
    iget-object p1, p0, Lorg/apache/log4j/net/SocketAppender;->oos:Ljava/io/ObjectOutputStream;

    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->flush()V

    .line 235
    iget p1, p0, Lorg/apache/log4j/net/SocketAppender;->counter:I

    const/4 v0, 0x1

    add-int/2addr p1, v0

    iput p1, p0, Lorg/apache/log4j/net/SocketAppender;->counter:I

    if-lt p1, v0, :cond_3

    const/4 p1, 0x0

    .line 236
    iput p1, p0, Lorg/apache/log4j/net/SocketAppender;->counter:I

    .line 240
    iget-object p1, p0, Lorg/apache/log4j/net/SocketAppender;->oos:Ljava/io/ObjectOutputStream;

    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->reset()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const/4 v0, 0x0

    .line 243
    iput-object v0, p0, Lorg/apache/log4j/net/SocketAppender;->oos:Ljava/io/ObjectOutputStream;

    .line 244
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v1, "Detected problem with connection: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lorg/apache/log4j/helpers/LogLog;->warn(Ljava/lang/String;)V

    .line 245
    iget p1, p0, Lorg/apache/log4j/net/SocketAppender;->reconnectionDelay:I

    if-lez p1, :cond_3

    .line 246
    invoke-virtual {p0}, Lorg/apache/log4j/net/SocketAppender;->fireConnector()V

    :cond_3
    :goto_0
    return-void
.end method

.method public cleanUp()V
    .locals 3

    .line 182
    iget-object v0, p0, Lorg/apache/log4j/net/SocketAppender;->oos:Ljava/io/ObjectOutputStream;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 184
    :try_start_0
    invoke-virtual {v0}, Ljava/io/ObjectOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v2, "Could not close oos."

    .line 186
    invoke-static {v2, v0}, Lorg/apache/log4j/helpers/LogLog;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 188
    :goto_0
    iput-object v1, p0, Lorg/apache/log4j/net/SocketAppender;->oos:Ljava/io/ObjectOutputStream;

    .line 190
    :cond_0
    iget-object v0, p0, Lorg/apache/log4j/net/SocketAppender;->connector:Lorg/apache/log4j/net/SocketAppender$Connector;

    if-eqz v0, :cond_1

    const/4 v2, 0x1

    .line 192
    iput-boolean v2, v0, Lorg/apache/log4j/net/SocketAppender$Connector;->interrupted:Z

    .line 193
    iput-object v1, p0, Lorg/apache/log4j/net/SocketAppender;->connector:Lorg/apache/log4j/net/SocketAppender$Connector;

    :cond_1
    return-void
.end method

.method public declared-synchronized close()V
    .locals 1

    monitor-enter p0

    .line 170
    :try_start_0
    iget-boolean v0, p0, Lorg/apache/log4j/AppenderSkeleton;->closed:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    .line 171
    monitor-exit p0

    return-void

    :cond_0
    const/4 v0, 0x1

    .line 173
    :try_start_1
    iput-boolean v0, p0, Lorg/apache/log4j/AppenderSkeleton;->closed:Z

    .line 174
    invoke-virtual {p0}, Lorg/apache/log4j/net/SocketAppender;->cleanUp()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 169
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method connect(Ljava/net/InetAddress;I)V
    .locals 2

    .line 198
    iget-object v0, p0, Lorg/apache/log4j/net/SocketAppender;->address:Ljava/net/InetAddress;

    if-nez v0, :cond_0

    return-void

    .line 202
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/log4j/net/SocketAppender;->cleanUp()V

    .line 203
    new-instance v0, Ljava/io/ObjectOutputStream;

    new-instance v1, Ljava/net/Socket;

    invoke-direct {v1, p1, p2}, Ljava/net/Socket;-><init>(Ljava/net/InetAddress;I)V

    invoke-virtual {v1}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object p2

    invoke-direct {v0, p2}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v0, p0, Lorg/apache/log4j/net/SocketAppender;->oos:Ljava/io/ObjectOutputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p2

    .line 206
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v1, "Could not connect to remote log4j server at ["

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 207
    invoke-virtual {p1}, Ljava/net/InetAddress;->getHostName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string p1, "]."

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    .line 208
    iget v0, p0, Lorg/apache/log4j/net/SocketAppender;->reconnectionDelay:I

    if-lez v0, :cond_1

    .line 209
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    const-string p1, " We will try again later."

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    .line 210
    invoke-virtual {p0}, Lorg/apache/log4j/net/SocketAppender;->fireConnector()V

    .line 212
    :cond_1
    invoke-static {p1, p2}, Lorg/apache/log4j/helpers/LogLog;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method fireConnector()V
    .locals 2

    .line 253
    iget-object v0, p0, Lorg/apache/log4j/net/SocketAppender;->connector:Lorg/apache/log4j/net/SocketAppender$Connector;

    if-nez v0, :cond_0

    const-string v0, "Starting a new connector thread."

    .line 254
    invoke-static {v0}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    .line 255
    new-instance v0, Lorg/apache/log4j/net/SocketAppender$Connector;

    invoke-direct {v0, p0}, Lorg/apache/log4j/net/SocketAppender$Connector;-><init>(Lorg/apache/log4j/net/SocketAppender;)V

    iput-object v0, p0, Lorg/apache/log4j/net/SocketAppender;->connector:Lorg/apache/log4j/net/SocketAppender$Connector;

    .line 256
    iget-object v0, p0, Lorg/apache/log4j/net/SocketAppender;->connector:Lorg/apache/log4j/net/SocketAppender$Connector;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 257
    iget-object v0, p0, Lorg/apache/log4j/net/SocketAppender;->connector:Lorg/apache/log4j/net/SocketAppender$Connector;

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setPriority(I)V

    .line 258
    iget-object v0, p0, Lorg/apache/log4j/net/SocketAppender;->connector:Lorg/apache/log4j/net/SocketAppender$Connector;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    :cond_0
    return-void
.end method

.method public getLocationInfo()Z
    .locals 1

    .line 325
    iget-boolean v0, p0, Lorg/apache/log4j/net/SocketAppender;->locationInfo:Z

    return v0
.end method

.method public getPort()I
    .locals 1

    .line 309
    iget v0, p0, Lorg/apache/log4j/net/SocketAppender;->port:I

    return v0
.end method

.method public getReconnectionDelay()I
    .locals 1

    .line 345
    iget v0, p0, Lorg/apache/log4j/net/SocketAppender;->reconnectionDelay:I

    return v0
.end method

.method public getRemoteHost()Ljava/lang/String;
    .locals 1

    .line 294
    iget-object v0, p0, Lorg/apache/log4j/net/SocketAppender;->remoteHost:Ljava/lang/String;

    return-object v0
.end method

.method public requiresLayout()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public setLocationInfo(Z)V
    .locals 0

    .line 318
    iput-boolean p1, p0, Lorg/apache/log4j/net/SocketAppender;->locationInfo:Z

    return-void
.end method

.method public setPort(I)V
    .locals 0

    .line 302
    iput p1, p0, Lorg/apache/log4j/net/SocketAppender;->port:I

    return-void
.end method

.method public setReconnectionDelay(I)V
    .locals 0

    .line 338
    iput p1, p0, Lorg/apache/log4j/net/SocketAppender;->reconnectionDelay:I

    return-void
.end method

.method public setRemoteHost(Ljava/lang/String;)V
    .locals 1

    .line 286
    invoke-static {p1}, Lorg/apache/log4j/net/SocketAppender;->getAddressByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/log4j/net/SocketAppender;->address:Ljava/net/InetAddress;

    .line 287
    iput-object p1, p0, Lorg/apache/log4j/net/SocketAppender;->remoteHost:Ljava/lang/String;

    return-void
.end method
