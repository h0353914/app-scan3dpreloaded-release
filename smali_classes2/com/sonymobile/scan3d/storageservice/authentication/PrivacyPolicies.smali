.class public final Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicies;
.super Ljava/lang/Object;
.source "PrivacyPolicies.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getPersonalDataInfoPrivacy()Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;
    .locals 3

    .line 115
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;-><init>()V

    const v1, 0x7f1001ab

    .line 116
    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->setTitle(I)V

    const v1, 0x7f100289

    .line 117
    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->setDescription(I)V

    const-string v1, "scan3d"

    const-string v2, "labs"

    .line 118
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const v1, 0x7f10001c

    .line 119
    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->setDisclaimer(I)V

    const v1, 0x7f0800e2

    const v2, 0x7f1001aa

    .line 121
    invoke-virtual {v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->addPersonalData(II)V

    const v1, 0x7f0800e1

    const v2, 0x7f1001a9

    .line 124
    invoke-virtual {v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->addPersonalData(II)V

    goto :goto_0

    .line 127
    :cond_0
    invoke-static {}, Lcom/sonymobile/scan3d/utils/LinkUtil;->isUSVariant()Z

    move-result v1

    if-eqz v1, :cond_1

    const v1, 0x7f100349

    .line 128
    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->setDisclaimer(I)V

    goto :goto_0

    :cond_1
    const v1, 0x7f10001b

    .line 130
    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->setDisclaimer(I)V

    :goto_0
    const v1, 0x7f0800e0

    const v2, 0x7f1001a7

    .line 134
    invoke-virtual {v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->addPersonalData(II)V

    const v1, 0x7f0800df

    const v2, 0x7f1001a6

    .line 136
    invoke-virtual {v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->addPersonalData(II)V

    const v1, 0x7f0800e3

    const v2, 0x7f1001a8

    .line 138
    invoke-virtual {v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->addPersonalData(II)V

    return-object v0
.end method

.method public static getPostProcessPrivacy()Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;
    .locals 3

    .line 29
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;-><init>()V

    const v1, 0x7f1001af

    .line 30
    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->setTitle(I)V

    const v1, 0x7f1001ad

    .line 31
    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->setDescription(I)V

    .line 32
    invoke-static {}, Lcom/sonymobile/scan3d/utils/LinkUtil;->isUSVariant()Z

    move-result v1

    if-eqz v1, :cond_0

    const v1, 0x7f10034b

    .line 33
    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->setDisclaimer(I)V

    goto :goto_0

    :cond_0
    const v1, 0x7f1001ae

    .line 35
    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->setDisclaimer(I)V

    :goto_0
    const v1, 0x7f0800e2

    const v2, 0x7f1001aa

    .line 38
    invoke-virtual {v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->addPersonalData(II)V

    const v1, 0x7f0800e1

    const v2, 0x7f1001a9

    .line 41
    invoke-virtual {v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->addPersonalData(II)V

    return-object v0
.end method

.method public static getPostProcessSigninPrivacy()Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;
    .locals 3

    .line 53
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;-><init>()V

    const v1, 0x7f100288

    .line 54
    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->setTitle(I)V

    const v1, 0x7f100289

    .line 55
    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->setDescription(I)V

    const-string v1, "scan3d"

    const-string v2, "labs"

    .line 56
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const v1, 0x7f10001c

    .line 57
    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->setDisclaimer(I)V

    goto :goto_0

    .line 59
    :cond_0
    invoke-static {}, Lcom/sonymobile/scan3d/utils/LinkUtil;->isUSVariant()Z

    move-result v1

    if-eqz v1, :cond_1

    const v1, 0x7f100349

    .line 60
    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->setDisclaimer(I)V

    goto :goto_0

    :cond_1
    const v1, 0x7f10001b

    .line 62
    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->setDisclaimer(I)V

    :goto_0
    const v1, 0x7f0800e0

    const v2, 0x7f1001a7

    .line 66
    invoke-virtual {v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->addPersonalData(II)V

    const v1, 0x7f0800df

    const v2, 0x7f1001a6

    .line 68
    invoke-virtual {v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->addPersonalData(II)V

    const v1, 0x7f0800e3

    const v2, 0x7f1001a8

    .line 70
    invoke-virtual {v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->addPersonalData(II)V

    return-object v0
.end method

.method static getSigninPrivacy()Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;
    .locals 3

    .line 81
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;-><init>()V

    const v1, 0x7f10028b

    .line 82
    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->setTitle(I)V

    const v1, 0x7f100289

    .line 83
    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->setDescription(I)V

    const-string v1, "scan3d"

    const-string v2, "labs"

    .line 84
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const v1, 0x7f10001c

    .line 85
    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->setDisclaimer(I)V

    const v1, 0x7f0800e2

    const v2, 0x7f1001aa

    .line 87
    invoke-virtual {v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->addPersonalData(II)V

    const v1, 0x7f0800e1

    const v2, 0x7f1001a9

    .line 90
    invoke-virtual {v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->addPersonalData(II)V

    goto :goto_0

    .line 93
    :cond_0
    invoke-static {}, Lcom/sonymobile/scan3d/utils/LinkUtil;->isUSVariant()Z

    move-result v1

    if-eqz v1, :cond_1

    const v1, 0x7f100349

    .line 94
    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->setDisclaimer(I)V

    goto :goto_0

    :cond_1
    const v1, 0x7f10001b

    .line 96
    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->setDisclaimer(I)V

    :goto_0
    const v1, 0x7f0800e0

    const v2, 0x7f1001a7

    .line 100
    invoke-virtual {v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->addPersonalData(II)V

    const v1, 0x7f0800df

    const v2, 0x7f1001a6

    .line 102
    invoke-virtual {v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->addPersonalData(II)V

    const v1, 0x7f0800e3

    const v2, 0x7f1001a8

    .line 104
    invoke-virtual {v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->addPersonalData(II)V

    return-object v0
.end method
