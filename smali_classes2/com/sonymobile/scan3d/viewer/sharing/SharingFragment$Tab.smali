.class public final enum Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;
.super Ljava/lang/Enum;
.source "SharingFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Tab"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;

.field public static final enum PRINT:Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;

.field public static final enum SHARE:Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 59
    new-instance v0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;

    const-string v1, "SHARE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;->SHARE:Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;

    new-instance v0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;

    const-string v1, "PRINT"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;->PRINT:Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;

    const/4 v0, 0x2

    .line 58
    new-array v0, v0, [Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;

    sget-object v1, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;->SHARE:Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;->PRINT:Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;

    aput-object v1, v0, v3

    sput-object v0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;->$VALUES:[Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 58
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;
    .locals 1

    .line 58
    const-class v0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;
    .locals 1

    .line 58
    sget-object v0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;->$VALUES:[Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;

    return-object v0
.end method
