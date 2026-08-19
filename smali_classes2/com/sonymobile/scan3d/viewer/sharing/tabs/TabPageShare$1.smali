.class synthetic Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$1;
.super Ljava/lang/Object;
.source "TabPageShare.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$sonymobile$scan3d$viewer$sharing$Shareable$Type:[I

.field static final synthetic $SwitchMap$com$sonymobile$scan3d$viewer$sharing$tabs$TabPageShare$SharingConclusion:[I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 549
    invoke-static {}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;->values()[Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$1;->$SwitchMap$com$sonymobile$scan3d$viewer$sharing$tabs$TabPageShare$SharingConclusion:[I

    const/4 v0, 0x1

    :try_start_0
    sget-object v1, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$1;->$SwitchMap$com$sonymobile$scan3d$viewer$sharing$tabs$TabPageShare$SharingConclusion:[I

    sget-object v2, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;->SEND_OBJ_ZIP:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

    invoke-virtual {v2}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;->ordinal()I

    move-result v2

    aput v0, v1, v2
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    const/4 v1, 0x2

    :try_start_1
    sget-object v2, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$1;->$SwitchMap$com$sonymobile$scan3d$viewer$sharing$tabs$TabPageShare$SharingConclusion:[I

    sget-object v3, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;->SEND_GLTF:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

    invoke-virtual {v3}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;->ordinal()I

    move-result v3

    aput v1, v2, v3
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    const/4 v2, 0x3

    :try_start_2
    sget-object v3, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$1;->$SwitchMap$com$sonymobile$scan3d$viewer$sharing$tabs$TabPageShare$SharingConclusion:[I

    sget-object v4, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;->ASK_TO_ANIMATE:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

    invoke-virtual {v4}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;->ordinal()I

    move-result v4

    aput v2, v3, v4
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    :catch_2
    :try_start_3
    sget-object v3, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$1;->$SwitchMap$com$sonymobile$scan3d$viewer$sharing$tabs$TabPageShare$SharingConclusion:[I

    sget-object v4, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;->ANIMATE_WITHOUT_ASKING:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

    invoke-virtual {v4}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;->ordinal()I

    move-result v4

    const/4 v5, 0x4

    aput v5, v3, v4
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_3

    :catch_3
    :try_start_4
    sget-object v3, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$1;->$SwitchMap$com$sonymobile$scan3d$viewer$sharing$tabs$TabPageShare$SharingConclusion:[I

    sget-object v4, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;->UNSUPPORTED_ERROR:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

    invoke-virtual {v4}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;->ordinal()I

    move-result v4

    const/4 v5, 0x5

    aput v5, v3, v4
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_4

    .line 482
    :catch_4
    invoke-static {}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->values()[Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    move-result-object v3

    array-length v3, v3

    new-array v3, v3, [I

    sput-object v3, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$1;->$SwitchMap$com$sonymobile$scan3d$viewer$sharing$Shareable$Type:[I

    :try_start_5
    sget-object v3, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$1;->$SwitchMap$com$sonymobile$scan3d$viewer$sharing$Shareable$Type:[I

    sget-object v4, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->ANIMATION:Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    invoke-virtual {v4}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->ordinal()I

    move-result v4

    aput v0, v3, v4
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_5

    :catch_5
    :try_start_6
    sget-object v0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$1;->$SwitchMap$com$sonymobile$scan3d$viewer$sharing$Shareable$Type:[I

    sget-object v3, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->PROPS:Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    invoke-virtual {v3}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->ordinal()I

    move-result v3

    aput v1, v0, v3
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_6

    :catch_6
    :try_start_7
    sget-object v0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$1;->$SwitchMap$com$sonymobile$scan3d$viewer$sharing$Shareable$Type:[I

    sget-object v1, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->DEFAULT:Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->ordinal()I

    move-result v1

    aput v2, v0, v1
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_7

    :catch_7
    return-void
.end method
