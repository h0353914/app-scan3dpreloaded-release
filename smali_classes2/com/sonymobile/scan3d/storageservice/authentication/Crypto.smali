.class interface abstract Lcom/sonymobile/scan3d/storageservice/authentication/Crypto;
.super Ljava/lang/Object;
.source "Crypto.java"


# virtual methods
.method public abstract decrypt(Ljava/lang/String;)Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation
.end method

.method public abstract encrypt(Ljava/lang/String;)Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation
.end method
