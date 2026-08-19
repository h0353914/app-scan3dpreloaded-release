.class public Lcom/dd/plist/UID;
.super Lcom/dd/plist/NSObject;
.source "UID.java"


# instance fields
.field private bytes:[B

.field private name:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;[B)V
    .locals 0

    .line 37
    invoke-direct {p0}, Lcom/dd/plist/NSObject;-><init>()V

    .line 38
    iput-object p1, p0, Lcom/dd/plist/UID;->name:Ljava/lang/String;

    .line 39
    iput-object p2, p0, Lcom/dd/plist/UID;->bytes:[B

    return-void
.end method


# virtual methods
.method public getBytes()[B
    .locals 1

    .line 43
    iget-object v0, p0, Lcom/dd/plist/UID;->bytes:[B

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 47
    iget-object v0, p0, Lcom/dd/plist/UID;->name:Ljava/lang/String;

    return-object v0
.end method

.method protected toASCII(Ljava/lang/StringBuilder;I)V
    .locals 2

    .line 78
    invoke-virtual {p0, p1, p2}, Lcom/dd/plist/UID;->indent(Ljava/lang/StringBuilder;I)V

    const-string p2, "\""

    .line 79
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 p2, 0x0

    .line 80
    :goto_0
    iget-object v0, p0, Lcom/dd/plist/UID;->bytes:[B

    array-length v1, v0

    if-ge p2, v1, :cond_1

    .line 81
    aget-byte v0, v0, p2

    const/16 v1, 0x10

    if-ge v0, v1, :cond_0

    const-string v1, "0"

    .line 83
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    :cond_0
    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_1
    const-string p2, "\""

    .line 86
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method

.method protected toASCIIGnuStep(Ljava/lang/StringBuilder;I)V
    .locals 0

    .line 91
    invoke-virtual {p0, p1, p2}, Lcom/dd/plist/UID;->toASCII(Ljava/lang/StringBuilder;I)V

    return-void
.end method

.method toBinary(Lcom/dd/plist/BinaryPropertyListWriter;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 72
    iget-object v0, p0, Lcom/dd/plist/UID;->bytes:[B

    array-length v0, v0

    add-int/lit16 v0, v0, 0x80

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p1, v0}, Lcom/dd/plist/BinaryPropertyListWriter;->write(I)V

    .line 73
    iget-object v0, p0, Lcom/dd/plist/UID;->bytes:[B

    invoke-virtual {p1, v0}, Lcom/dd/plist/BinaryPropertyListWriter;->write([B)V

    return-void
.end method

.method toXML(Ljava/lang/StringBuilder;I)V
    .locals 2

    .line 59
    invoke-virtual {p0, p1, p2}, Lcom/dd/plist/UID;->indent(Ljava/lang/StringBuilder;I)V

    const-string p2, "<string>"

    .line 60
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 p2, 0x0

    .line 61
    :goto_0
    iget-object v0, p0, Lcom/dd/plist/UID;->bytes:[B

    array-length v1, v0

    if-ge p2, v1, :cond_1

    .line 62
    aget-byte v0, v0, p2

    const/16 v1, 0x10

    if-ge v0, v1, :cond_0

    const-string v1, "0"

    .line 64
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    :cond_0
    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_1
    const-string p2, "</string>"

    .line 67
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method
