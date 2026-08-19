.class final Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$1;
.super Ljava/util/HashMap;
.source "FaceMimicActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/HashMap<",
        "Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 3

    .line 178
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 179
    sget-object v0, Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;->IDLE:Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;

    const v1, 0x7f100120

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    sget-object v0, Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;->SEARCHING:Lcom/sonymobile/scan3d/sfmc/MimickingEngine$StateListener$State;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
