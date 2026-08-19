.class public Lcom/sonymobile/scan3d/sharing/SharingConstants;
.super Ljava/lang/Object;
.source "SharingConstants.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;,
        Lcom/sonymobile/scan3d/sharing/SharingConstants$Meta;
    }
.end annotation


# static fields
.field public static final EXTRA_EXCLUDE_URIS:Ljava/lang/String; = "com.sonymobile.scan3d.intent.extra.EXCLUDE_URIS"

.field public static final EXTRA_EXPLANATORY_TEXT:Ljava/lang/String; = "com.sonymobile.scan3d.intent.extra.EXPLANATORY_TEXT"

.field public static final EXTRA_SCAN_TYPE:Ljava/lang/String; = "com.sonymobile.scan3d.intent.extra.SCAN_TYPE"

.field public static final GLTF_MIME_TYPE:Ljava/lang/String; = "model/gltf-binary"

.field public static final NO_MIME_TYPE_PREFERRED:Ljava/lang/String; = "no_mime_type_preferred"

.field public static final OBJ_MIME_TYPE:Ljava/lang/String; = "application/zip"

.field public static final PICKER_EXTRA_MIME_TYPES:Ljava/lang/String; = "com.sonymobile.scan3d.intent.extra.MIME_TYPES"

.field static final PRIVILEGED_PLUGINS:[Ljava/lang/String;

.field public static final SCAN_3D_MIME_TYPE:Ljava/lang/String; = "application/vnd.sony.scan3d"

.field public static final STL_FILE_EXTENSION:Ljava/lang/String; = "stl"

.field public static final STL_MIME_TYPE:Ljava/lang/String; = "application/sla"


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-string v0, "com.sonymobile.androidapp.cameraaddon.areffect"

    const-string v1, "com.sonymobile.androidapp.machichara"

    .line 137
    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/sonymobile/scan3d/sharing/SharingConstants;->PRIVILEGED_PLUGINS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
