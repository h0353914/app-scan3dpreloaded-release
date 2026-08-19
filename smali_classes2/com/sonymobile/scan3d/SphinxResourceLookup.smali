.class public Lcom/sonymobile/scan3d/SphinxResourceLookup;
.super Ljava/lang/Object;
.source "SphinxResourceLookup.java"


# instance fields
.field private final mButtonIdToResourceLookup:[I

.field private final mMsgIdToResourceLookup:[[I

.field private final mSoundResourceLookup:[I

.field private final mStageIdToResourceLookup:[I


# direct methods
.method public constructor <init>()V
    .locals 17

    move-object/from16 v0, p0

    .line 37
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    const/16 v1, 0x25

    .line 16
    new-array v1, v1, [[I

    iput-object v1, v0, Lcom/sonymobile/scan3d/SphinxResourceLookup;->mMsgIdToResourceLookup:[[I

    const/4 v1, 0x3

    .line 21
    new-array v2, v1, [I

    iput-object v2, v0, Lcom/sonymobile/scan3d/SphinxResourceLookup;->mButtonIdToResourceLookup:[I

    const/4 v2, 0x5

    .line 26
    new-array v3, v2, [I

    iput-object v3, v0, Lcom/sonymobile/scan3d/SphinxResourceLookup;->mStageIdToResourceLookup:[I

    const/16 v3, 0xc

    .line 32
    new-array v4, v3, [I

    iput-object v4, v0, Lcom/sonymobile/scan3d/SphinxResourceLookup;->mSoundResourceLookup:[I

    .line 43
    iget-object v4, v0, Lcom/sonymobile/scan3d/SphinxResourceLookup;->mMsgIdToResourceLookup:[[I

    const/4 v5, 0x1

    new-array v6, v5, [I

    const/4 v7, 0x0

    const v8, 0x7f1000b4

    aput v8, v6, v7

    aput-object v6, v4, v7

    .line 46
    new-array v6, v5, [I

    const v8, 0x7f1000b0

    aput v8, v6, v7

    aput-object v6, v4, v5

    .line 49
    new-array v6, v5, [I

    const v8, 0x7f1000b2

    aput v8, v6, v7

    const/4 v8, 0x2

    aput-object v6, v4, v8

    .line 52
    new-array v6, v5, [I

    const v9, 0x7f10032e

    aput v9, v6, v7

    aput-object v6, v4, v1

    .line 55
    new-array v6, v5, [I

    const v9, 0x7f100317

    aput v9, v6, v7

    const/16 v9, 0x16

    aput-object v6, v4, v9

    .line 58
    new-array v6, v5, [I

    const v9, 0x7f100318

    aput v9, v6, v7

    const/16 v9, 0x17

    aput-object v6, v4, v9

    .line 61
    new-array v6, v5, [I

    const v9, 0x7f10032d

    aput v9, v6, v7

    const/4 v9, 0x4

    aput-object v6, v4, v9

    .line 64
    new-array v6, v5, [I

    const v10, 0x7f10031e

    aput v10, v6, v7

    aput-object v6, v4, v2

    .line 67
    new-array v6, v5, [I

    const v10, 0x7f10031d

    aput v10, v6, v7

    const/4 v10, 0x6

    aput-object v6, v4, v10

    .line 70
    new-array v6, v5, [I

    const v11, 0x7f100324

    aput v11, v6, v7

    const/4 v11, 0x7

    aput-object v6, v4, v11

    .line 73
    new-array v6, v5, [I

    const v12, 0x7f100325

    aput v12, v6, v7

    const/16 v12, 0x8

    aput-object v6, v4, v12

    .line 76
    new-array v6, v5, [I

    const v13, 0x7f100310

    aput v13, v6, v7

    const/16 v14, 0x9

    aput-object v6, v4, v14

    .line 79
    new-array v6, v5, [I

    aput v13, v6, v7

    const/16 v15, 0xb

    aput-object v6, v4, v15

    .line 82
    new-array v6, v5, [I

    const v16, 0x7f100311

    aput v16, v6, v7

    const/16 v16, 0xa

    aput-object v6, v4, v16

    .line 85
    new-array v6, v5, [I

    aput v13, v6, v7

    aput-object v6, v4, v3

    .line 88
    new-array v3, v5, [I

    const v6, 0x7f10031c

    aput v6, v3, v7

    const/16 v6, 0xd

    aput-object v3, v4, v6

    .line 91
    new-array v3, v5, [I

    const v6, 0x7f10031a

    aput v6, v3, v7

    const/16 v6, 0xe

    aput-object v3, v4, v6

    .line 94
    new-array v3, v5, [I

    const v6, 0x7f10032f

    aput v6, v3, v7

    const/16 v6, 0xf

    aput-object v3, v4, v6

    .line 97
    new-array v3, v5, [I

    const v6, 0x7f100330

    aput v6, v3, v7

    const/16 v6, 0x10

    aput-object v3, v4, v6

    .line 100
    new-array v3, v5, [I

    const v6, 0x7f10032c

    aput v6, v3, v7

    const/16 v6, 0x11

    aput-object v3, v4, v6

    .line 103
    new-array v3, v5, [I

    const v6, 0x7f100329

    aput v6, v3, v7

    const/16 v6, 0x18

    aput-object v3, v4, v6

    .line 106
    new-array v3, v5, [I

    const v6, 0x7f100326

    aput v6, v3, v7

    const/16 v6, 0x19

    aput-object v3, v4, v6

    .line 109
    new-array v3, v5, [I

    const v6, 0x7f10030f

    aput v6, v3, v7

    const/16 v6, 0x1a

    aput-object v3, v4, v6

    .line 112
    new-array v3, v5, [I

    const v6, 0x7f100319

    aput v6, v3, v7

    const/16 v6, 0x1b

    aput-object v3, v4, v6

    .line 115
    new-array v3, v5, [I

    const v6, 0x7f100331

    aput v6, v3, v7

    const/16 v6, 0x1c

    aput-object v3, v4, v6

    .line 118
    new-array v3, v1, [I

    fill-array-data v3, :array_0

    const/16 v6, 0x12

    aput-object v3, v4, v6

    .line 123
    new-array v3, v8, [I

    fill-array-data v3, :array_1

    const/16 v6, 0x13

    aput-object v3, v4, v6

    .line 127
    new-array v3, v8, [I

    fill-array-data v3, :array_2

    const/16 v6, 0x14

    aput-object v3, v4, v6

    .line 131
    new-array v3, v1, [I

    fill-array-data v3, :array_3

    const/16 v6, 0x15

    aput-object v3, v4, v6

    .line 136
    new-array v3, v8, [I

    fill-array-data v3, :array_4

    const/16 v6, 0x22

    aput-object v3, v4, v6

    .line 140
    new-array v3, v5, [I

    const v6, 0x7f10032a

    aput v6, v3, v7

    const/16 v6, 0x1d

    aput-object v3, v4, v6

    .line 143
    new-array v3, v5, [I

    const v6, 0x7f1002cf

    aput v6, v3, v7

    const/16 v6, 0x1e

    aput-object v3, v4, v6

    .line 146
    new-array v3, v5, [I

    const v6, 0x7f10032b

    aput v6, v3, v7

    const/16 v6, 0x1f

    aput-object v3, v4, v6

    .line 149
    new-array v3, v5, [I

    const v6, 0x7f100312

    aput v6, v3, v7

    const/16 v6, 0x20

    aput-object v3, v4, v6

    .line 153
    new-array v3, v8, [I

    fill-array-data v3, :array_5

    const/16 v6, 0x23

    aput-object v3, v4, v6

    .line 158
    new-array v3, v8, [I

    fill-array-data v3, :array_6

    const/16 v6, 0x21

    aput-object v3, v4, v6

    .line 167
    iget-object v3, v0, Lcom/sonymobile/scan3d/SphinxResourceLookup;->mSoundResourceLookup:[I

    const v4, 0x7f0f0010

    aput v4, v3, v5

    const v4, 0x7f0f001d

    .line 168
    aput v4, v3, v7

    const v4, 0x7f0f0002

    .line 169
    aput v4, v3, v8

    const v4, 0x7f0f0003

    .line 170
    aput v4, v3, v1

    const v4, 0x7f0f0004

    .line 171
    aput v4, v3, v9

    const v4, 0x7f0f0005

    .line 172
    aput v4, v3, v2

    const v2, 0x7f0f0006

    .line 173
    aput v2, v3, v10

    const v2, 0x7f0f0007

    .line 174
    aput v2, v3, v11

    const v2, 0x7f0f0008

    .line 175
    aput v2, v3, v12

    const v2, 0x7f0f0009

    .line 176
    aput v2, v3, v14

    const v2, 0x7f0f000a

    .line 177
    aput v2, v3, v16

    const v2, 0x7f0f0001

    .line 178
    aput v2, v3, v15

    .line 184
    iget-object v2, v0, Lcom/sonymobile/scan3d/SphinxResourceLookup;->mButtonIdToResourceLookup:[I

    const v3, 0x7f10024d

    aput v3, v2, v7

    const v3, 0x7f10024c

    .line 185
    aput v3, v2, v5

    const v3, 0x7f10024b

    .line 186
    aput v3, v2, v8

    .line 192
    iget-object v2, v0, Lcom/sonymobile/scan3d/SphinxResourceLookup;->mStageIdToResourceLookup:[I

    const v3, 0x7f100292

    aput v3, v2, v7

    const v3, 0x7f100291

    .line 194
    aput v3, v2, v5

    const v3, 0x7f100290

    .line 196
    aput v3, v2, v8

    const v3, 0x7f10028f

    .line 198
    aput v3, v2, v1

    const v1, 0x7f100293

    .line 200
    aput v1, v2, v9

    return-void

    :array_0
    .array-data 4
        0x7f100321
        0x7f100322
        0x7f100323
    .end array-data

    :array_1
    .array-data 4
        0x7f100320
        0x7f100310
    .end array-data

    :array_2
    .array-data 4
        0x7f100321
        0x7f100322
    .end array-data

    :array_3
    .array-data 4
        0x7f100320
        0x7f100315
        0x7f100316
    .end array-data

    :array_4
    .array-data 4
        0x7f100310
        0x7f10031f
    .end array-data

    :array_5
    .array-data 4
        0x7f100313
        0x7f100314
    .end array-data

    :array_6
    .array-data 4
        0x7f100320
        0x7f100311
    .end array-data
.end method


# virtual methods
.method public getButtonResource(I)I
    .locals 3

    if-ltz p1, :cond_0

    const/4 v0, 0x3

    if-ge p1, v0, :cond_0

    .line 234
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxResourceLookup;->mButtonIdToResourceLookup:[I

    aget p1, v0, p1

    return p1

    .line 236
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No mapping for the provided Sphinx button id. Received id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getMsgResources(I)[I
    .locals 3

    if-ltz p1, :cond_0

    const/16 v0, 0x25

    if-ge p1, v0, :cond_0

    .line 216
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxResourceLookup;->mMsgIdToResourceLookup:[[I

    aget-object p1, v0, p1

    return-object p1

    .line 218
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No mapping for the provided Sphinx msg id. Received id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getSoundResource(I)I
    .locals 3

    if-ltz p1, :cond_0

    const/16 v0, 0xc

    if-ge p1, v0, :cond_0

    .line 268
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxResourceLookup;->mSoundResourceLookup:[I

    aget p1, v0, p1

    return p1

    .line 270
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No mapping for the provided Sphinx sound id. Received id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getStageResource(I)I
    .locals 3

    if-ltz p1, :cond_0

    const/4 v0, 0x5

    if-ge p1, v0, :cond_0

    .line 252
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxResourceLookup;->mStageIdToResourceLookup:[I

    aget p1, v0, p1

    return p1

    .line 254
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No mapping for the provided Sphinx stage id. Received id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
