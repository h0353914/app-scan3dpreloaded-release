.class public Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/KeyPair;
.super Ljava/lang/Object;
.source "KeyPair.java"


# instance fields
.field private final mEncryptionKey:Ljava/lang/String;

.field private final mSigningKey:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/KeyPair;->mEncryptionKey:Ljava/lang/String;

    .line 31
    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/KeyPair;->mSigningKey:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getEncryptionKey()Ljava/lang/String;
    .locals 1

    .line 40
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/KeyPair;->mEncryptionKey:Ljava/lang/String;

    return-object v0
.end method

.method public getSigningKey()Ljava/lang/String;
    .locals 1

    .line 49
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/KeyPair;->mSigningKey:Ljava/lang/String;

    return-object v0
.end method
