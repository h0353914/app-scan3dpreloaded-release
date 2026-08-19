.class public final synthetic Lcom/sonymobile/scan3d/sfmc/-$$Lambda$MJEjS6VrKD37He0tSWEpUxkt-S0;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$CameraImageProviderFactory;


# static fields
.field public static final synthetic INSTANCE:Lcom/sonymobile/scan3d/sfmc/-$$Lambda$MJEjS6VrKD37He0tSWEpUxkt-S0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$MJEjS6VrKD37He0tSWEpUxkt-S0;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$MJEjS6VrKD37He0tSWEpUxkt-S0;-><init>()V

    sput-object v0, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$MJEjS6VrKD37He0tSWEpUxkt-S0;->INSTANCE:Lcom/sonymobile/scan3d/sfmc/-$$Lambda$MJEjS6VrKD37He0tSWEpUxkt-S0;

    return-void
.end method

.method private synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final newCameraImageProvider(Landroid/content/Context;Lcom/sonymobile/scan3d/CameraImageProvider$OnCameraStatusListener;Lcom/sonymobile/scan3d/SphinxFocusType;Z)Lcom/sonymobile/scan3d/CameraImageProvider;
    .locals 1

    new-instance v0, Lcom/sonymobile/scan3d/CameraImageProvider;

    invoke-direct {v0, p1, p2, p3, p4}, Lcom/sonymobile/scan3d/CameraImageProvider;-><init>(Landroid/content/Context;Lcom/sonymobile/scan3d/CameraImageProvider$OnCameraStatusListener;Lcom/sonymobile/scan3d/SphinxFocusType;Z)V

    return-object v0
.end method
