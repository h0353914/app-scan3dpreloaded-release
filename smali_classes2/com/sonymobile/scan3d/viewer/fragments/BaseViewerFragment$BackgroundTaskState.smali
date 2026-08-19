.class public final enum Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;
.super Ljava/lang/Enum;
.source "BaseViewerFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "BackgroundTaskState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;

.field public static final enum FINISHED:Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;

.field public static final enum IDLE:Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;

.field public static final enum RUNNING:Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 64
    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;

    const-string v1, "IDLE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;->IDLE:Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;

    .line 65
    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;

    const-string v1, "RUNNING"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;->RUNNING:Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;

    .line 66
    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;

    const-string v1, "FINISHED"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;->FINISHED:Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;

    const/4 v0, 0x3

    .line 63
    new-array v0, v0, [Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;

    sget-object v1, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;->IDLE:Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;->RUNNING:Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;

    aput-object v1, v0, v3

    sget-object v1, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;->FINISHED:Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;

    aput-object v1, v0, v4

    sput-object v0, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;->$VALUES:[Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 63
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;
    .locals 1

    .line 63
    const-class v0, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;
    .locals 1

    .line 63
    sget-object v0, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;->$VALUES:[Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment$BackgroundTaskState;

    return-object v0
.end method
