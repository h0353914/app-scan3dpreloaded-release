.class public abstract Lcom/sonymobile/scan3d/storageservice/authentication/CustomDriveActions;
.super Ljava/lang/Object;
.source "CustomDriveActions.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getKeys()Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;
    .locals 1

    .line 13
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;->newKeyPair()Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;

    move-result-object v0

    return-object v0
.end method
