.class synthetic Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$1;
.super Ljava/lang/Object;
.source "SharingFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$sonymobile$scan3d$viewer$sharing$SharingFragment$Tab:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 63
    invoke-static {}, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;->values()[Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$1;->$SwitchMap$com$sonymobile$scan3d$viewer$sharing$SharingFragment$Tab:[I

    :try_start_0
    sget-object v0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$1;->$SwitchMap$com$sonymobile$scan3d$viewer$sharing$SharingFragment$Tab:[I

    sget-object v1, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;->PRINT:Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :try_start_1
    sget-object v0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$1;->$SwitchMap$com$sonymobile$scan3d$viewer$sharing$SharingFragment$Tab:[I

    sget-object v1, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;->SHARE:Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    return-void
.end method
