.class public final enum Lcom/sonymobile/scan3d/PermissionUtil$Permissions;
.super Ljava/lang/Enum;
.source "PermissionUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/PermissionUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Permissions"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/PermissionUtil$Permissions;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/PermissionUtil$Permissions;

.field public static final enum AUDIO:Lcom/sonymobile/scan3d/PermissionUtil$Permissions;

.field public static final enum CAMERA:Lcom/sonymobile/scan3d/PermissionUtil$Permissions;

.field public static final enum STORAGE:Lcom/sonymobile/scan3d/PermissionUtil$Permissions;

.field public static final enum VIDEO_RECORDING:Lcom/sonymobile/scan3d/PermissionUtil$Permissions;


# instance fields
.field private final mOptionalPermissions:[Ljava/lang/String;

.field private final mPermission:[Ljava/lang/String;

.field private final mRequestCode:I


# direct methods
.method static constructor <clinit>()V
    .locals 13

    .line 31
    new-instance v6, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;

    const-string v1, "STORAGE"

    const-string v0, "android.permission.WRITE_EXTERNAL_STORAGE"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v3

    const/4 v2, 0x0

    const/4 v4, 0x0

    const/16 v5, 0x3e8

    move-object v0, v6

    invoke-direct/range {v0 .. v5}, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;-><init>(Ljava/lang/String;I[Ljava/lang/String;[Ljava/lang/String;I)V

    sput-object v6, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->STORAGE:Lcom/sonymobile/scan3d/PermissionUtil$Permissions;

    .line 36
    new-instance v0, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;

    const-string v8, "CAMERA"

    const-string v1, "android.permission.CAMERA"

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v10

    const/4 v9, 0x1

    const/4 v11, 0x0

    const/16 v12, 0x7d0

    move-object v7, v0

    invoke-direct/range {v7 .. v12}, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;-><init>(Ljava/lang/String;I[Ljava/lang/String;[Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->CAMERA:Lcom/sonymobile/scan3d/PermissionUtil$Permissions;

    .line 40
    new-instance v0, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;

    const-string v2, "AUDIO"

    const-string v1, "android.permission.RECORD_AUDIO"

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v4

    const/4 v3, 0x2

    const/4 v5, 0x0

    const/16 v6, 0xbb8

    move-object v1, v0

    invoke-direct/range {v1 .. v6}, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;-><init>(Ljava/lang/String;I[Ljava/lang/String;[Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->AUDIO:Lcom/sonymobile/scan3d/PermissionUtil$Permissions;

    .line 44
    new-instance v0, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;

    const-string v8, "VIDEO_RECORDING"

    const-string v1, "android.permission.WRITE_EXTERNAL_STORAGE"

    const-string v2, "android.permission.CAMERA"

    const-string v3, "android.permission.RECORD_AUDIO"

    filled-new-array {v1, v2, v3}, [Ljava/lang/String;

    move-result-object v10

    const-string v1, "android.permission.RECORD_AUDIO"

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v11

    const/4 v9, 0x3

    const/16 v12, 0xfa0

    move-object v7, v0

    invoke-direct/range {v7 .. v12}, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;-><init>(Ljava/lang/String;I[Ljava/lang/String;[Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->VIDEO_RECORDING:Lcom/sonymobile/scan3d/PermissionUtil$Permissions;

    const/4 v0, 0x4

    .line 29
    new-array v0, v0, [Lcom/sonymobile/scan3d/PermissionUtil$Permissions;

    sget-object v1, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->STORAGE:Lcom/sonymobile/scan3d/PermissionUtil$Permissions;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->CAMERA:Lcom/sonymobile/scan3d/PermissionUtil$Permissions;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->AUDIO:Lcom/sonymobile/scan3d/PermissionUtil$Permissions;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->VIDEO_RECORDING:Lcom/sonymobile/scan3d/PermissionUtil$Permissions;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sput-object v0, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->$VALUES:[Lcom/sonymobile/scan3d/PermissionUtil$Permissions;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I[Ljava/lang/String;[Ljava/lang/String;I)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # I
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            "I)V"
        }
    .end annotation

    .line 53
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 54
    iput-object p3, p0, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->mPermission:[Ljava/lang/String;

    .line 55
    iput p5, p0, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->mRequestCode:I

    .line 56
    iput-object p4, p0, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->mOptionalPermissions:[Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/PermissionUtil$Permissions;
    .locals 1

    .line 29
    const-class v0, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/PermissionUtil$Permissions;
    .locals 1

    .line 29
    sget-object v0, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->$VALUES:[Lcom/sonymobile/scan3d/PermissionUtil$Permissions;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/PermissionUtil$Permissions;

    return-object v0
.end method


# virtual methods
.method public getOptionalPermissions()[Ljava/lang/String;
    .locals 1

    .line 64
    iget-object v0, p0, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->mOptionalPermissions:[Ljava/lang/String;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    :goto_0
    return-object v0
.end method

.method public getPermissions()[Ljava/lang/String;
    .locals 1

    .line 60
    iget-object v0, p0, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->mPermission:[Ljava/lang/String;

    invoke-virtual {v0}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    return-object v0
.end method

.method public getRequestCode()I
    .locals 1

    .line 68
    iget v0, p0, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->mRequestCode:I

    return v0
.end method
