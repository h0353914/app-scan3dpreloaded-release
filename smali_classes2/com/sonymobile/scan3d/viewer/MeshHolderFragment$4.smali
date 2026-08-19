.class synthetic Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$4;
.super Ljava/lang/Object;
.source "MeshHolderFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$sonymobile$scan3d$viewer$MeshHolderFragment$LoadTaskState:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 158
    invoke-static {}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;->values()[Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$4;->$SwitchMap$com$sonymobile$scan3d$viewer$MeshHolderFragment$LoadTaskState:[I

    :try_start_0
    sget-object v0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$4;->$SwitchMap$com$sonymobile$scan3d$viewer$MeshHolderFragment$LoadTaskState:[I

    sget-object v1, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;->STATE_LOADED:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :try_start_1
    sget-object v0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$4;->$SwitchMap$com$sonymobile$scan3d$viewer$MeshHolderFragment$LoadTaskState:[I

    sget-object v1, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;->STATE_FAILED:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    return-void
.end method
