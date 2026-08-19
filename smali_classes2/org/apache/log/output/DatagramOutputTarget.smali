.class public Lorg/apache/log/output/DatagramOutputTarget;
.super Lorg/apache/log/output/net/DatagramOutputTarget;
.source "DatagramOutputTarget.java"


# direct methods
.method public constructor <init>(Ljava/net/InetAddress;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 49
    invoke-direct {p0, p1, p2}, Lorg/apache/log/output/net/DatagramOutputTarget;-><init>(Ljava/net/InetAddress;I)V

    return-void
.end method

.method public constructor <init>(Ljava/net/InetAddress;ILorg/apache/log/format/Formatter;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 36
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/log/output/net/DatagramOutputTarget;-><init>(Ljava/net/InetAddress;ILorg/apache/log/format/Formatter;)V

    return-void
.end method
