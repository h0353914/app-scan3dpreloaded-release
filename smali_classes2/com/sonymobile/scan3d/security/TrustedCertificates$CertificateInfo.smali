.class Lcom/sonymobile/scan3d/security/TrustedCertificates$CertificateInfo;
.super Ljava/lang/Object;
.source "TrustedCertificates.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/security/TrustedCertificates;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CertificateInfo"
.end annotation


# instance fields
.field private final mIsLive:Z


# direct methods
.method public constructor <init>(Z)V
    .locals 0

    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 83
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/security/TrustedCertificates$CertificateInfo;->mIsLive:Z

    return-void
.end method


# virtual methods
.method public isLive()Z
    .locals 1

    .line 93
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/security/TrustedCertificates$CertificateInfo;->mIsLive:Z

    return v0
.end method
