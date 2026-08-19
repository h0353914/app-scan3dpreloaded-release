.class final enum Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;
.super Ljava/lang/Enum;
.source "TabPageShare.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "TaskState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;

.field public static final enum FINISHED:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;

.field public static final enum IDLE:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;

.field public static final enum RUNNING:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 145
    new-instance v0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;

    const-string v1, "IDLE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;->IDLE:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;

    .line 147
    new-instance v0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;

    const-string v1, "RUNNING"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;->RUNNING:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;

    .line 149
    new-instance v0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;

    const-string v1, "FINISHED"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;->FINISHED:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;

    const/4 v0, 0x3

    .line 143
    new-array v0, v0, [Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;

    sget-object v1, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;->IDLE:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;->RUNNING:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;

    aput-object v1, v0, v3

    sget-object v1, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;->FINISHED:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;

    aput-object v1, v0, v4

    sput-object v0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;->$VALUES:[Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 143
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;
    .locals 1

    .line 143
    const-class v0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;
    .locals 1

    .line 143
    sget-object v0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;->$VALUES:[Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;

    return-object v0
.end method
