.class synthetic Lcom/sonymobile/scan3d/editor/EditorFragment$2;
.super Ljava/lang/Object;
.source "EditorFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/editor/EditorFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$sonymobile$scan3d$FxType:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 764
    invoke-static {}, Lcom/sonymobile/scan3d/FxType;->values()[Lcom/sonymobile/scan3d/FxType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/sonymobile/scan3d/editor/EditorFragment$2;->$SwitchMap$com$sonymobile$scan3d$FxType:[I

    :try_start_0
    sget-object v0, Lcom/sonymobile/scan3d/editor/EditorFragment$2;->$SwitchMap$com$sonymobile$scan3d$FxType:[I

    sget-object v1, Lcom/sonymobile/scan3d/FxType;->ACTION:Lcom/sonymobile/scan3d/FxType;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/FxType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :try_start_1
    sget-object v0, Lcom/sonymobile/scan3d/editor/EditorFragment$2;->$SwitchMap$com$sonymobile$scan3d$FxType:[I

    sget-object v1, Lcom/sonymobile/scan3d/FxType;->MULTI:Lcom/sonymobile/scan3d/FxType;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/FxType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    :try_start_2
    sget-object v0, Lcom/sonymobile/scan3d/editor/EditorFragment$2;->$SwitchMap$com$sonymobile$scan3d$FxType:[I

    sget-object v1, Lcom/sonymobile/scan3d/FxType;->RADIO:Lcom/sonymobile/scan3d/FxType;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/FxType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    :catch_2
    return-void
.end method
