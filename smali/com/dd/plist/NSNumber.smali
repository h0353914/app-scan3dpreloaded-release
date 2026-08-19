.class public Lcom/dd/plist/NSNumber;
.super Lcom/dd/plist/NSObject;
.source "NSNumber.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dd/plist/NSObject;",
        "Ljava/lang/Comparable<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# static fields
.field public static final BOOLEAN:I = 0x2

.field public static final INTEGER:I = 0x0

.field public static final REAL:I = 0x1


# instance fields
.field private boolValue:Z

.field private doubleValue:D

.field private longValue:J

.field private type:I


# direct methods
.method public constructor <init>(D)V
    .locals 0

    .line 149
    invoke-direct {p0}, Lcom/dd/plist/NSObject;-><init>()V

    .line 150
    iput-wide p1, p0, Lcom/dd/plist/NSNumber;->doubleValue:D

    double-to-long p1, p1

    iput-wide p1, p0, Lcom/dd/plist/NSNumber;->longValue:J

    const/4 p1, 0x1

    .line 151
    iput p1, p0, Lcom/dd/plist/NSNumber;->type:I

    return-void
.end method

.method public constructor <init>(I)V
    .locals 2

    .line 129
    invoke-direct {p0}, Lcom/dd/plist/NSObject;-><init>()V

    int-to-long v0, p1

    .line 130
    iput-wide v0, p0, Lcom/dd/plist/NSNumber;->longValue:J

    long-to-double v0, v0

    iput-wide v0, p0, Lcom/dd/plist/NSNumber;->doubleValue:D

    const/4 p1, 0x0

    .line 131
    iput p1, p0, Lcom/dd/plist/NSNumber;->type:I

    return-void
.end method

.method public constructor <init>(J)V
    .locals 0

    .line 139
    invoke-direct {p0}, Lcom/dd/plist/NSObject;-><init>()V

    .line 140
    iput-wide p1, p0, Lcom/dd/plist/NSNumber;->longValue:J

    long-to-double p1, p1

    iput-wide p1, p0, Lcom/dd/plist/NSNumber;->doubleValue:D

    const/4 p1, 0x0

    .line 141
    iput p1, p0, Lcom/dd/plist/NSNumber;->type:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 4

    .line 97
    invoke-direct {p0}, Lcom/dd/plist/NSObject;-><init>()V

    if-eqz p1, :cond_5

    const/4 v0, 0x0

    .line 101
    :try_start_0
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1

    .line 102
    iput-wide v1, p0, Lcom/dd/plist/NSNumber;->longValue:J

    long-to-double v1, v1

    iput-wide v1, p0, Lcom/dd/plist/NSNumber;->doubleValue:D

    .line 103
    iput v0, p0, Lcom/dd/plist/NSNumber;->type:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    const/4 v1, 0x1

    .line 106
    :try_start_1
    invoke-static {p1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p0, Lcom/dd/plist/NSNumber;->doubleValue:D

    .line 107
    iget-wide v2, p0, Lcom/dd/plist/NSNumber;->doubleValue:D

    invoke-static {v2, v3}, Ljava/lang/Math;->round(D)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/dd/plist/NSNumber;->longValue:J

    .line 108
    iput v1, p0, Lcom/dd/plist/NSNumber;->type:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_2

    .line 111
    :catch_1
    :try_start_2
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    const-string v3, "true"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    const-string v3, "yes"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    :cond_0
    move v0, v1

    :cond_1
    iput-boolean v0, p0, Lcom/dd/plist/NSNumber;->boolValue:Z

    .line 112
    iget-boolean v0, p0, Lcom/dd/plist/NSNumber;->boolValue:Z

    if-nez v0, :cond_3

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, "false"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    const-string v0, "no"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_0

    .line 113
    :cond_2
    new-instance p1, Ljava/lang/Exception;

    const-string v0, "not a boolean"

    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_3
    :goto_0
    const/4 p1, 0x2

    .line 115
    iput p1, p0, Lcom/dd/plist/NSNumber;->type:I

    .line 116
    iget-boolean p1, p0, Lcom/dd/plist/NSNumber;->boolValue:Z

    if-eqz p1, :cond_4

    const-wide/16 v0, 0x1

    goto :goto_1

    :cond_4
    const-wide/16 v0, 0x0

    :goto_1
    iput-wide v0, p0, Lcom/dd/plist/NSNumber;->longValue:J

    long-to-double v0, v0

    iput-wide v0, p0, Lcom/dd/plist/NSNumber;->doubleValue:D
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    :goto_2
    return-void

    .line 118
    :catch_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "The given string neither represents a double, an int nor a boolean value."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 99
    :cond_5
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "The given string is null and cannot be parsed as number."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public constructor <init>(Z)V
    .locals 2

    .line 159
    invoke-direct {p0}, Lcom/dd/plist/NSObject;-><init>()V

    .line 160
    iput-boolean p1, p0, Lcom/dd/plist/NSNumber;->boolValue:Z

    if-eqz p1, :cond_0

    const-wide/16 v0, 0x1

    goto :goto_0

    :cond_0
    const-wide/16 v0, 0x0

    .line 161
    :goto_0
    iput-wide v0, p0, Lcom/dd/plist/NSNumber;->longValue:J

    long-to-double v0, v0

    iput-wide v0, p0, Lcom/dd/plist/NSNumber;->doubleValue:D

    const/4 p1, 0x2

    .line 162
    iput p1, p0, Lcom/dd/plist/NSNumber;->type:I

    return-void
.end method

.method public constructor <init>([BI)V
    .locals 2

    .line 70
    invoke-direct {p0}, Lcom/dd/plist/NSObject;-><init>()V

    packed-switch p2, :pswitch_data_0

    .line 82
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Type argument is not valid."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 77
    :pswitch_0
    invoke-static {p1}, Lcom/dd/plist/BinaryPropertyListParser;->parseDouble([B)D

    move-result-wide v0

    iput-wide v0, p0, Lcom/dd/plist/NSNumber;->doubleValue:D

    .line 78
    iget-wide v0, p0, Lcom/dd/plist/NSNumber;->doubleValue:D

    invoke-static {v0, v1}, Ljava/lang/Math;->round(D)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/dd/plist/NSNumber;->longValue:J

    goto :goto_0

    .line 73
    :pswitch_1
    invoke-static {p1}, Lcom/dd/plist/BinaryPropertyListParser;->parseLong([B)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/dd/plist/NSNumber;->longValue:J

    long-to-double v0, v0

    iput-wide v0, p0, Lcom/dd/plist/NSNumber;->doubleValue:D

    .line 85
    :goto_0
    iput p2, p0, Lcom/dd/plist/NSNumber;->type:I

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public boolValue()Z
    .locals 4

    .line 210
    iget v0, p0, Lcom/dd/plist/NSNumber;->type:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 211
    iget-boolean v0, p0, Lcom/dd/plist/NSNumber;->boolValue:Z

    return v0

    .line 213
    :cond_0
    iget-wide v0, p0, Lcom/dd/plist/NSNumber;->longValue:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public compareTo(Ljava/lang/Object;)I
    .locals 8

    .line 394
    invoke-virtual {p0}, Lcom/dd/plist/NSNumber;->doubleValue()D

    move-result-wide v0

    .line 396
    instance-of v2, p1, Lcom/dd/plist/NSNumber;

    const/4 v3, 0x0

    const/4 v4, 0x1

    const/4 v5, -0x1

    if-eqz v2, :cond_2

    .line 397
    check-cast p1, Lcom/dd/plist/NSNumber;

    .line 398
    invoke-virtual {p1}, Lcom/dd/plist/NSNumber;->doubleValue()D

    move-result-wide v6

    cmpg-double p1, v0, v6

    if-gez p1, :cond_0

    move v3, v5

    goto :goto_0

    :cond_0
    cmpl-double p1, v0, v6

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    move v3, v4

    :goto_0
    return v3

    .line 400
    :cond_2
    instance-of v2, p1, Ljava/lang/Number;

    if-eqz v2, :cond_5

    .line 401
    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v6

    cmpg-double p1, v0, v6

    if-gez p1, :cond_3

    move v3, v5

    goto :goto_1

    :cond_3
    cmpl-double p1, v0, v6

    if-nez p1, :cond_4

    goto :goto_1

    :cond_4
    move v3, v4

    :goto_1
    return v3

    :cond_5
    return v5
.end method

.method public doubleValue()D
    .locals 2

    .line 243
    iget-wide v0, p0, Lcom/dd/plist/NSNumber;->doubleValue:D

    return-wide v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 6

    .line 264
    instance-of v0, p1, Lcom/dd/plist/NSNumber;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 265
    :cond_0
    check-cast p1, Lcom/dd/plist/NSNumber;

    .line 266
    iget v0, p0, Lcom/dd/plist/NSNumber;->type:I

    iget v2, p1, Lcom/dd/plist/NSNumber;->type:I

    if-ne v0, v2, :cond_1

    iget-wide v2, p0, Lcom/dd/plist/NSNumber;->longValue:J

    iget-wide v4, p1, Lcom/dd/plist/NSNumber;->longValue:J

    cmp-long v0, v2, v4

    if-nez v0, :cond_1

    iget-wide v2, p0, Lcom/dd/plist/NSNumber;->doubleValue:D

    iget-wide v4, p1, Lcom/dd/plist/NSNumber;->doubleValue:D

    cmpl-double v0, v2, v4

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/dd/plist/NSNumber;->boolValue:Z

    iget-boolean p1, p1, Lcom/dd/plist/NSNumber;->boolValue:Z

    if-ne v0, p1, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method

.method public floatValue()F
    .locals 2

    .line 253
    iget-wide v0, p0, Lcom/dd/plist/NSNumber;->doubleValue:D

    double-to-float v0, v0

    return v0
.end method

.method public hashCode()I
    .locals 6

    .line 271
    iget v0, p0, Lcom/dd/plist/NSNumber;->type:I

    mul-int/lit8 v0, v0, 0x25

    .line 272
    iget-wide v1, p0, Lcom/dd/plist/NSNumber;->longValue:J

    const/16 v3, 0x20

    ushr-long v4, v1, v3

    xor-long/2addr v1, v4

    long-to-int v1, v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x25

    .line 273
    iget-wide v1, p0, Lcom/dd/plist/NSNumber;->doubleValue:D

    invoke-static {v1, v2}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v1

    iget-wide v4, p0, Lcom/dd/plist/NSNumber;->doubleValue:D

    invoke-static {v4, v5}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v4

    ushr-long v3, v4, v3

    xor-long/2addr v1, v3

    long-to-int v1, v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x25

    .line 274
    invoke-virtual {p0}, Lcom/dd/plist/NSNumber;->boolValue()Z

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public intValue()I
    .locals 2

    .line 234
    iget-wide v0, p0, Lcom/dd/plist/NSNumber;->longValue:J

    long-to-int v0, v0

    return v0
.end method

.method public isBoolean()Z
    .locals 2

    .line 183
    iget v0, p0, Lcom/dd/plist/NSNumber;->type:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isInteger()Z
    .locals 1

    .line 192
    iget v0, p0, Lcom/dd/plist/NSNumber;->type:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isReal()Z
    .locals 2

    .line 201
    iget v0, p0, Lcom/dd/plist/NSNumber;->type:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public longValue()J
    .locals 2

    .line 222
    iget-wide v0, p0, Lcom/dd/plist/NSNumber;->longValue:J

    return-wide v0
.end method

.method protected toASCII(Ljava/lang/StringBuilder;I)V
    .locals 1

    .line 359
    invoke-virtual {p0, p1, p2}, Lcom/dd/plist/NSNumber;->indent(Ljava/lang/StringBuilder;I)V

    .line 360
    iget p2, p0, Lcom/dd/plist/NSNumber;->type:I

    const/4 v0, 0x2

    if-ne p2, v0, :cond_1

    .line 361
    iget-boolean p2, p0, Lcom/dd/plist/NSNumber;->boolValue:Z

    if-eqz p2, :cond_0

    const-string p2, "YES"

    goto :goto_0

    :cond_0
    const-string p2, "NO"

    :goto_0
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 363
    :cond_1
    invoke-virtual {p0}, Lcom/dd/plist/NSNumber;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_1
    return-void
.end method

.method protected toASCIIGnuStep(Ljava/lang/StringBuilder;I)V
    .locals 0

    .line 369
    invoke-virtual {p0, p1, p2}, Lcom/dd/plist/NSNumber;->indent(Ljava/lang/StringBuilder;I)V

    .line 370
    iget p2, p0, Lcom/dd/plist/NSNumber;->type:I

    packed-switch p2, :pswitch_data_0

    goto :goto_0

    .line 384
    :pswitch_0
    iget-boolean p2, p0, Lcom/dd/plist/NSNumber;->boolValue:Z

    if-eqz p2, :cond_0

    const-string p2, "<*BY>"

    .line 385
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_0
    const-string p2, "<*BN>"

    .line 387
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :pswitch_1
    const-string p2, "<*R"

    .line 378
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 379
    invoke-virtual {p0}, Lcom/dd/plist/NSNumber;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, ">"

    .line 380
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :pswitch_2
    const-string p2, "<*I"

    .line 372
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 373
    invoke-virtual {p0}, Lcom/dd/plist/NSNumber;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, ">"

    .line 374
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method toBinary(Lcom/dd/plist/BinaryPropertyListWriter;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 325
    invoke-virtual {p0}, Lcom/dd/plist/NSNumber;->type()I

    move-result v0

    const/16 v1, 0x8

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_0

    .line 351
    :pswitch_0
    invoke-virtual {p0}, Lcom/dd/plist/NSNumber;->boolValue()Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v1, 0x9

    :cond_0
    invoke-virtual {p1, v1}, Lcom/dd/plist/BinaryPropertyListWriter;->write(I)V

    goto/16 :goto_0

    :pswitch_1
    const/16 v0, 0x23

    .line 346
    invoke-virtual {p1, v0}, Lcom/dd/plist/BinaryPropertyListWriter;->write(I)V

    .line 347
    invoke-virtual {p0}, Lcom/dd/plist/NSNumber;->doubleValue()D

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Lcom/dd/plist/BinaryPropertyListWriter;->writeDouble(D)V

    goto :goto_0

    .line 327
    :pswitch_2
    invoke-virtual {p0}, Lcom/dd/plist/NSNumber;->longValue()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    const/16 v2, 0x13

    if-gez v0, :cond_1

    .line 328
    invoke-virtual {p1, v2}, Lcom/dd/plist/BinaryPropertyListWriter;->write(I)V

    .line 329
    invoke-virtual {p0}, Lcom/dd/plist/NSNumber;->longValue()J

    move-result-wide v2

    invoke-virtual {p1, v2, v3, v1}, Lcom/dd/plist/BinaryPropertyListWriter;->writeBytes(JI)V

    goto :goto_0

    .line 330
    :cond_1
    invoke-virtual {p0}, Lcom/dd/plist/NSNumber;->longValue()J

    move-result-wide v3

    const-wide/16 v5, 0xff

    cmp-long v0, v3, v5

    if-gtz v0, :cond_2

    const/16 v0, 0x10

    .line 331
    invoke-virtual {p1, v0}, Lcom/dd/plist/BinaryPropertyListWriter;->write(I)V

    .line 332
    invoke-virtual {p0}, Lcom/dd/plist/NSNumber;->longValue()J

    move-result-wide v0

    const/4 v2, 0x1

    invoke-virtual {p1, v0, v1, v2}, Lcom/dd/plist/BinaryPropertyListWriter;->writeBytes(JI)V

    goto :goto_0

    .line 333
    :cond_2
    invoke-virtual {p0}, Lcom/dd/plist/NSNumber;->longValue()J

    move-result-wide v3

    const-wide/32 v5, 0xffff

    cmp-long v0, v3, v5

    if-gtz v0, :cond_3

    const/16 v0, 0x11

    .line 334
    invoke-virtual {p1, v0}, Lcom/dd/plist/BinaryPropertyListWriter;->write(I)V

    .line 335
    invoke-virtual {p0}, Lcom/dd/plist/NSNumber;->longValue()J

    move-result-wide v0

    const/4 v2, 0x2

    invoke-virtual {p1, v0, v1, v2}, Lcom/dd/plist/BinaryPropertyListWriter;->writeBytes(JI)V

    goto :goto_0

    .line 336
    :cond_3
    invoke-virtual {p0}, Lcom/dd/plist/NSNumber;->longValue()J

    move-result-wide v3

    const-wide v5, 0xffffffffL

    cmp-long v0, v3, v5

    if-gtz v0, :cond_4

    const/16 v0, 0x12

    .line 337
    invoke-virtual {p1, v0}, Lcom/dd/plist/BinaryPropertyListWriter;->write(I)V

    .line 338
    invoke-virtual {p0}, Lcom/dd/plist/NSNumber;->longValue()J

    move-result-wide v0

    const/4 v2, 0x4

    invoke-virtual {p1, v0, v1, v2}, Lcom/dd/plist/BinaryPropertyListWriter;->writeBytes(JI)V

    goto :goto_0

    .line 340
    :cond_4
    invoke-virtual {p1, v2}, Lcom/dd/plist/BinaryPropertyListWriter;->write(I)V

    .line 341
    invoke-virtual {p0}, Lcom/dd/plist/NSNumber;->longValue()J

    move-result-wide v2

    invoke-virtual {p1, v2, v3, v1}, Lcom/dd/plist/BinaryPropertyListWriter;->writeBytes(JI)V

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 281
    iget v0, p0, Lcom/dd/plist/NSNumber;->type:I

    packed-switch v0, :pswitch_data_0

    .line 292
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 289
    :pswitch_0
    invoke-virtual {p0}, Lcom/dd/plist/NSNumber;->boolValue()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 286
    :pswitch_1
    invoke-virtual {p0}, Lcom/dd/plist/NSNumber;->doubleValue()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 283
    :pswitch_2
    invoke-virtual {p0}, Lcom/dd/plist/NSNumber;->longValue()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method toXML(Ljava/lang/StringBuilder;I)V
    .locals 2

    .line 299
    invoke-virtual {p0, p1, p2}, Lcom/dd/plist/NSNumber;->indent(Ljava/lang/StringBuilder;I)V

    .line 300
    iget p2, p0, Lcom/dd/plist/NSNumber;->type:I

    packed-switch p2, :pswitch_data_0

    goto :goto_0

    .line 314
    :pswitch_0
    invoke-virtual {p0}, Lcom/dd/plist/NSNumber;->boolValue()Z

    move-result p2

    if-eqz p2, :cond_0

    const-string p2, "<true/>"

    .line 315
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_0
    const-string p2, "<false/>"

    .line 317
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :pswitch_1
    const-string p2, "<real>"

    .line 308
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 309
    invoke-virtual {p0}, Lcom/dd/plist/NSNumber;->doubleValue()D

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string p2, "</real>"

    .line 310
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :pswitch_2
    const-string p2, "<integer>"

    .line 302
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 303
    invoke-virtual {p0}, Lcom/dd/plist/NSNumber;->longValue()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p2, "</integer>"

    .line 304
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public type()I
    .locals 1

    .line 174
    iget v0, p0, Lcom/dd/plist/NSNumber;->type:I

    return v0
.end method
