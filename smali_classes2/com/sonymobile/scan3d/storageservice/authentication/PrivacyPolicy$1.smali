.class final Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy$1;
.super Ljava/lang/Object;
.source "PrivacyPolicy.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 133
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;
    .locals 2

    .line 137
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;-><init>(Landroid/os/Parcel;Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy$1;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0

    .line 133
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy$1;->createFromParcel(Landroid/os/Parcel;)Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;

    move-result-object p1

    return-object p1
.end method

.method public newArray(I)[Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;
    .locals 0

    .line 142
    new-array p1, p1, [Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;

    return-object p1
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    .line 133
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy$1;->newArray(I)[Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;

    move-result-object p1

    return-object p1
.end method
