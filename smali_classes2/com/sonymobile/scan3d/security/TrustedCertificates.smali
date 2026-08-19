.class public final Lcom/sonymobile/scan3d/security/TrustedCertificates;
.super Ljava/lang/Object;
.source "TrustedCertificates.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/security/TrustedCertificates$CertificateInfo;
    }
.end annotation


# static fields
.field private static final SHA1_CERT_ANDROID_DEBUG:Ljava/lang/String; = "A40BA32043DE84305BD5723CB19562079118AA4E"

.field private static final SHA1_CERT_ANDROID_VANILLA_PLATFORM_SIGNING_TEST:Ljava/lang/String; = "27196E386B875E76ADF700E7EA84E4C6EEE33DFA"

.field private static final SHA1_CERT_ANDROID_VANILLA_TESTKEY_SIGNING_TEST:Ljava/lang/String; = "61ED377E85D386A8DFEE6B864BD85B0BFAA5AF81"

.field private static final SHA1_CERT_SONY_ERICSSON_E_APPLICATION_SIGNING_LIVE_864F_1:Ljava/lang/String; = "330DF1D4F77968C397FF53D444089BB46DC330F1"

.field private static final SHA1_CERT_SONY_ERICSSON_E_APPLICATION_SIGNING_TEST_DC70_1:Ljava/lang/String; = "9E18A094A301AE2A09631635538F5D0D10D43393"

.field private static final SHA1_CERT_SONY_ERICSSON_E_PLATFORM_SIGNING_LIVE_864F_3:Ljava/lang/String; = "80D0156E14EFA9B2BE949ACC1791720CC58CB6E3"

.field private static final SHA1_CERT_SONY_ERICSSON_E_PLATFORM_SIGNING_TEST_DC70_3:Ljava/lang/String; = "176BABB1F2FCB7150877887596599D5730B168C0"

.field private static final SHA1_CERT_SONY_ERICSSON_IA_SIGNING_LIVE_A989_1:Ljava/lang/String; = "6D5C3554B9B301A17B437F98F917A9A44ADADFF9"

.field private static final SHA1_CERT_SONY_ERICSSON_IA_SIGNING_TEST_CD42_1:Ljava/lang/String; = "5985C78613CA8B0077004BCC183ABAE6A9B990A4"

.field private static TRUSTED_CERTS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/sonymobile/scan3d/security/TrustedCertificates$CertificateInfo;",
            ">;"
        }
    .end annotation
.end field

.field private static sOwnPackageCertificateInfo:Lcom/sonymobile/scan3d/security/TrustedCertificates$CertificateInfo;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 62
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/sonymobile/scan3d/security/TrustedCertificates;->TRUSTED_CERTS:Ljava/util/Map;

    const/4 v0, 0x0

    .line 69
    sput-object v0, Lcom/sonymobile/scan3d/security/TrustedCertificates;->sOwnPackageCertificateInfo:Lcom/sonymobile/scan3d/security/TrustedCertificates$CertificateInfo;

    .line 98
    sget-object v0, Lcom/sonymobile/scan3d/security/TrustedCertificates;->TRUSTED_CERTS:Ljava/util/Map;

    const-string v1, "6D5C3554B9B301A17B437F98F917A9A44ADADFF9"

    new-instance v2, Lcom/sonymobile/scan3d/security/TrustedCertificates$CertificateInfo;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Lcom/sonymobile/scan3d/security/TrustedCertificates$CertificateInfo;-><init>(Z)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    sget-object v0, Lcom/sonymobile/scan3d/security/TrustedCertificates;->TRUSTED_CERTS:Ljava/util/Map;

    const-string v1, "5985C78613CA8B0077004BCC183ABAE6A9B990A4"

    new-instance v2, Lcom/sonymobile/scan3d/security/TrustedCertificates$CertificateInfo;

    const/4 v4, 0x0

    invoke-direct {v2, v4}, Lcom/sonymobile/scan3d/security/TrustedCertificates$CertificateInfo;-><init>(Z)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    sget-object v0, Lcom/sonymobile/scan3d/security/TrustedCertificates;->TRUSTED_CERTS:Ljava/util/Map;

    const-string v1, "330DF1D4F77968C397FF53D444089BB46DC330F1"

    new-instance v2, Lcom/sonymobile/scan3d/security/TrustedCertificates$CertificateInfo;

    invoke-direct {v2, v3}, Lcom/sonymobile/scan3d/security/TrustedCertificates$CertificateInfo;-><init>(Z)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    sget-object v0, Lcom/sonymobile/scan3d/security/TrustedCertificates;->TRUSTED_CERTS:Ljava/util/Map;

    const-string v1, "9E18A094A301AE2A09631635538F5D0D10D43393"

    new-instance v2, Lcom/sonymobile/scan3d/security/TrustedCertificates$CertificateInfo;

    invoke-direct {v2, v4}, Lcom/sonymobile/scan3d/security/TrustedCertificates$CertificateInfo;-><init>(Z)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    sget-object v0, Lcom/sonymobile/scan3d/security/TrustedCertificates;->TRUSTED_CERTS:Ljava/util/Map;

    const-string v1, "80D0156E14EFA9B2BE949ACC1791720CC58CB6E3"

    new-instance v2, Lcom/sonymobile/scan3d/security/TrustedCertificates$CertificateInfo;

    invoke-direct {v2, v3}, Lcom/sonymobile/scan3d/security/TrustedCertificates$CertificateInfo;-><init>(Z)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    sget-object v0, Lcom/sonymobile/scan3d/security/TrustedCertificates;->TRUSTED_CERTS:Ljava/util/Map;

    const-string v1, "176BABB1F2FCB7150877887596599D5730B168C0"

    new-instance v2, Lcom/sonymobile/scan3d/security/TrustedCertificates$CertificateInfo;

    invoke-direct {v2, v4}, Lcom/sonymobile/scan3d/security/TrustedCertificates$CertificateInfo;-><init>(Z)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    sget-object v0, Lcom/sonymobile/scan3d/security/TrustedCertificates;->TRUSTED_CERTS:Ljava/util/Map;

    const-string v1, "61ED377E85D386A8DFEE6B864BD85B0BFAA5AF81"

    new-instance v2, Lcom/sonymobile/scan3d/security/TrustedCertificates$CertificateInfo;

    invoke-direct {v2, v4}, Lcom/sonymobile/scan3d/security/TrustedCertificates$CertificateInfo;-><init>(Z)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    sget-object v0, Lcom/sonymobile/scan3d/security/TrustedCertificates;->TRUSTED_CERTS:Ljava/util/Map;

    const-string v1, "27196E386B875E76ADF700E7EA84E4C6EEE33DFA"

    new-instance v2, Lcom/sonymobile/scan3d/security/TrustedCertificates$CertificateInfo;

    invoke-direct {v2, v4}, Lcom/sonymobile/scan3d/security/TrustedCertificates$CertificateInfo;-><init>(Z)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    sget-object v0, Lcom/sonymobile/scan3d/security/TrustedCertificates;->TRUSTED_CERTS:Ljava/util/Map;

    const-string v1, "A40BA32043DE84305BD5723CB19562079118AA4E"

    new-instance v2, Lcom/sonymobile/scan3d/security/TrustedCertificates$CertificateInfo;

    invoke-direct {v2, v4}, Lcom/sonymobile/scan3d/security/TrustedCertificates$CertificateInfo;-><init>(Z)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 118
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static isOwnPackageLiveSigned(Landroid/content/Context;)Z
    .locals 3

    .line 186
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 187
    sget-object v1, Lcom/sonymobile/scan3d/security/TrustedCertificates;->sOwnPackageCertificateInfo:Lcom/sonymobile/scan3d/security/TrustedCertificates$CertificateInfo;

    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 191
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    const/16 v1, 0x40

    invoke-virtual {v0, p0, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 195
    invoke-static {p0}, Lcom/sonymobile/scan3d/security/TrustedCertificates;->lookup(Landroid/content/pm/PackageInfo;)Lcom/sonymobile/scan3d/security/TrustedCertificates$CertificateInfo;

    move-result-object p0

    sput-object p0, Lcom/sonymobile/scan3d/security/TrustedCertificates;->sOwnPackageCertificateInfo:Lcom/sonymobile/scan3d/security/TrustedCertificates$CertificateInfo;

    goto :goto_0

    :catch_0
    return v2

    .line 197
    :cond_0
    :goto_0
    sget-object p0, Lcom/sonymobile/scan3d/security/TrustedCertificates;->sOwnPackageCertificateInfo:Lcom/sonymobile/scan3d/security/TrustedCertificates$CertificateInfo;

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/security/TrustedCertificates$CertificateInfo;->isLive()Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 v2, 0x1

    :cond_1
    return v2
.end method

.method public static isPackageTrusted(Landroid/content/Context;Ljava/lang/String;Ljava/lang/StringBuilder;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/SecurityException;
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p1, :cond_1

    if-eqz p2, :cond_0

    const-string p0, "null callingPackage"

    .line 135
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    return v0

    .line 140
    :cond_1
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const/16 v2, 0x40

    .line 145
    :try_start_0
    invoke-virtual {v1, p1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v3

    .line 146
    invoke-static {v3}, Lcom/sonymobile/scan3d/security/TrustedCertificates;->lookup(Landroid/content/pm/PackageInfo;)Lcom/sonymobile/scan3d/security/TrustedCertificates$CertificateInfo;

    move-result-object v3

    if-eqz p2, :cond_2

    if-nez v3, :cond_2

    const-string p0, "null PackageInfo for calling package: \'"

    .line 148
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "\'"

    .line 149
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return v0

    .line 152
    :cond_2
    sget-object v4, Lcom/sonymobile/scan3d/security/TrustedCertificates;->sOwnPackageCertificateInfo:Lcom/sonymobile/scan3d/security/TrustedCertificates$CertificateInfo;

    if-nez v4, :cond_3

    .line 153
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p1

    .line 154
    invoke-virtual {v1, p1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p0

    .line 155
    invoke-static {p0}, Lcom/sonymobile/scan3d/security/TrustedCertificates;->lookup(Landroid/content/pm/PackageInfo;)Lcom/sonymobile/scan3d/security/TrustedCertificates$CertificateInfo;

    move-result-object p0

    sput-object p0, Lcom/sonymobile/scan3d/security/TrustedCertificates;->sOwnPackageCertificateInfo:Lcom/sonymobile/scan3d/security/TrustedCertificates$CertificateInfo;

    if-eqz p2, :cond_3

    .line 156
    sget-object p0, Lcom/sonymobile/scan3d/security/TrustedCertificates;->sOwnPackageCertificateInfo:Lcom/sonymobile/scan3d/security/TrustedCertificates$CertificateInfo;

    if-nez p0, :cond_3

    const-string p0, "null PackageInfo for own package: \'"

    .line 157
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "\'"

    .line 158
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :cond_3
    if-eqz p2, :cond_5

    .line 170
    invoke-virtual {v3}, Lcom/sonymobile/scan3d/security/TrustedCertificates$CertificateInfo;->isLive()Z

    move-result p0

    if-nez p0, :cond_5

    .line 171
    sget-object p0, Lcom/sonymobile/scan3d/security/TrustedCertificates;->sOwnPackageCertificateInfo:Lcom/sonymobile/scan3d/security/TrustedCertificates$CertificateInfo;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/security/TrustedCertificates$CertificateInfo;->isLive()Z

    move-result p0

    if-eqz p0, :cond_4

    const-string p0, "live"

    goto :goto_0

    :cond_4
    const-string p0, "not live"

    :goto_0
    const-string p1, "Non-live priv certificate, unpriv is: "

    .line 172
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_5
    if-eqz v3, :cond_7

    .line 175
    sget-object p0, Lcom/sonymobile/scan3d/security/TrustedCertificates;->sOwnPackageCertificateInfo:Lcom/sonymobile/scan3d/security/TrustedCertificates$CertificateInfo;

    if-eqz p0, :cond_7

    .line 176
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/security/TrustedCertificates$CertificateInfo;->isLive()Z

    move-result p0

    if-eqz p0, :cond_6

    invoke-virtual {v3}, Lcom/sonymobile/scan3d/security/TrustedCertificates$CertificateInfo;->isLive()Z

    move-result p0

    if-eqz p0, :cond_7

    :cond_6
    const/4 v0, 0x1

    :cond_7
    return v0

    :catch_0
    if-eqz p2, :cond_8

    const-string p0, "NameNotFoundException for \'"

    .line 164
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "\'"

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_8
    return v0
.end method

.method private static lookup(Landroid/content/pm/PackageInfo;)Lcom/sonymobile/scan3d/security/TrustedCertificates$CertificateInfo;
    .locals 3

    const/4 v0, 0x0

    .line 213
    :try_start_0
    iget-object p0, p0, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    .line 214
    array-length v1, p0

    const/4 v2, 0x1

    if-lt v1, v2, :cond_0

    const/4 v1, 0x0

    .line 215
    aget-object p0, p0, v1

    invoke-static {p0}, Lcom/sonymobile/scan3d/security/TrustedCertificates;->lookup(Landroid/content/pm/Signature;)Lcom/sonymobile/scan3d/security/TrustedCertificates$CertificateInfo;

    move-result-object p0
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, p0

    :catch_0
    :cond_0
    return-object v0
.end method

.method private static lookup(Landroid/content/pm/Signature;)Lcom/sonymobile/scan3d/security/TrustedCertificates$CertificateInfo;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 201
    invoke-virtual {p0}, Landroid/content/pm/Signature;->toByteArray()[B

    move-result-object p0

    const-string v0, "SHA1"

    .line 202
    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 203
    invoke-virtual {v0, p0}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object p0

    .line 204
    new-instance v0, Ljava/math/BigInteger;

    const/4 v1, 0x1

    invoke-direct {v0, v1, p0}, Ljava/math/BigInteger;-><init>(I[B)V

    const/16 p0, 0x10

    .line 205
    invoke-virtual {v0, p0}, Ljava/math/BigInteger;->toString(I)Ljava/lang/String;

    move-result-object p0

    .line 207
    sget-object v0, Lcom/sonymobile/scan3d/security/TrustedCertificates;->TRUSTED_CERTS:Ljava/util/Map;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/security/TrustedCertificates$CertificateInfo;

    return-object p0
.end method
