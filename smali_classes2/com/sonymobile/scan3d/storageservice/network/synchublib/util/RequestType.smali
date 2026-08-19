.class public final enum Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;
.super Ljava/lang/Enum;
.source "RequestType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

.field public static final enum REQUEST_DELETE_CONTENT:Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

.field public static final enum REQUEST_DELETE_PUBLIC_CONTENT:Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

.field public static final enum REQUEST_GET_CONTENT:Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

.field public static final enum REQUEST_GET_CONTENT_LIST:Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

.field public static final enum REQUEST_GET_FILE:Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

.field public static final enum REQUEST_HEAD_CONTENT:Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

.field public static final enum REQUEST_POST_CONTENT:Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

.field public static final enum REQUEST_POST_FILE:Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

.field public static final enum REQUEST_POST_PUBLIC_CONTENT:Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

.field public static final enum REQUEST_PUT_UPDATE_CONTENT:Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;


# instance fields
.field private final mId:I


# direct methods
.method static constructor <clinit>()V
    .locals 13

    .line 11
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

    const-string v1, "REQUEST_POST_CONTENT"

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;->REQUEST_POST_CONTENT:Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

    .line 12
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

    const-string v1, "REQUEST_GET_CONTENT"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v3, v4}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;->REQUEST_GET_CONTENT:Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

    .line 13
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

    const-string v1, "REQUEST_DELETE_CONTENT"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v4, v5}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;->REQUEST_DELETE_CONTENT:Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

    .line 14
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

    const-string v1, "REQUEST_HEAD_CONTENT"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v5, v6}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;->REQUEST_HEAD_CONTENT:Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

    .line 15
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

    const-string v1, "REQUEST_POST_FILE"

    const/4 v7, 0x5

    invoke-direct {v0, v1, v6, v7}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;->REQUEST_POST_FILE:Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

    .line 16
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

    const-string v1, "REQUEST_GET_FILE"

    const/4 v8, 0x6

    invoke-direct {v0, v1, v7, v8}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;->REQUEST_GET_FILE:Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

    .line 17
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

    const-string v1, "REQUEST_GET_CONTENT_LIST"

    const/4 v9, 0x7

    invoke-direct {v0, v1, v8, v9}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;->REQUEST_GET_CONTENT_LIST:Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

    .line 18
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

    const-string v1, "REQUEST_POST_PUBLIC_CONTENT"

    const/16 v10, 0x8

    invoke-direct {v0, v1, v9, v10}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;->REQUEST_POST_PUBLIC_CONTENT:Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

    .line 19
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

    const-string v1, "REQUEST_PUT_UPDATE_CONTENT"

    const/16 v11, 0x9

    invoke-direct {v0, v1, v10, v11}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;->REQUEST_PUT_UPDATE_CONTENT:Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

    .line 20
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

    const-string v1, "REQUEST_DELETE_PUBLIC_CONTENT"

    const/16 v12, 0xa

    invoke-direct {v0, v1, v11, v12}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;->REQUEST_DELETE_PUBLIC_CONTENT:Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

    .line 10
    new-array v0, v12, [Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;->REQUEST_POST_CONTENT:Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;->REQUEST_GET_CONTENT:Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;->REQUEST_DELETE_CONTENT:Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;->REQUEST_HEAD_CONTENT:Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;->REQUEST_POST_FILE:Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

    aput-object v1, v0, v6

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;->REQUEST_GET_FILE:Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

    aput-object v1, v0, v7

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;->REQUEST_GET_CONTENT_LIST:Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

    aput-object v1, v0, v8

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;->REQUEST_POST_PUBLIC_CONTENT:Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

    aput-object v1, v0, v9

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;->REQUEST_PUT_UPDATE_CONTENT:Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

    aput-object v1, v0, v10

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;->REQUEST_DELETE_PUBLIC_CONTENT:Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

    aput-object v1, v0, v11

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;->$VALUES:[Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 27
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 28
    iput p3, p0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;->mId:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;
    .locals 1

    .line 10
    const-class v0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;
    .locals 1

    .line 10
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;->$VALUES:[Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

    return-object v0
.end method


# virtual methods
.method public getId()I
    .locals 1

    .line 35
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;->mId:I

    return v0
.end method
