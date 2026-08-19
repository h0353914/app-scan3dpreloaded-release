.class Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;
.super Ljava/lang/Object;
.source "RigModelManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/animation/RigModelManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RigRequest"
.end annotation


# instance fields
.field private final mListener:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$GltfConversionListener;",
            ">;"
        }
    .end annotation
.end field

.field private mRigModelTask:Lcom/sonymobile/scan3d/viewer/asynctasks/RigModelTask;

.field private mUri:Landroid/net/Uri;

.field final synthetic this$0:Lcom/sonymobile/scan3d/animation/RigModelManager;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/animation/RigModelManager;Landroid/content/Context;Lcom/sonymobile/scan3d/viewer/SphanRenderer;Landroid/net/Uri;Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$GltfConversionListener;)V
    .locals 0

    .line 141
    iput-object p1, p0, Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;->this$0:Lcom/sonymobile/scan3d/animation/RigModelManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 142
    iput-object p4, p0, Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;->mUri:Landroid/net/Uri;

    .line 143
    new-instance p4, Ljava/util/HashSet;

    invoke-direct {p4}, Ljava/util/HashSet;-><init>()V

    iput-object p4, p0, Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;->mListener:Ljava/util/Set;

    .line 144
    iget-object p4, p0, Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;->mListener:Ljava/util/Set;

    invoke-interface {p4, p5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 145
    new-instance p4, Lcom/sonymobile/scan3d/viewer/asynctasks/RigModelTask;

    invoke-direct {p4, p2, p3, p1}, Lcom/sonymobile/scan3d/viewer/asynctasks/RigModelTask;-><init>(Landroid/content/Context;Lcom/sonymobile/scan3d/viewer/SphanRenderer;Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$GltfConversionListener;)V

    iput-object p4, p0, Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;->mRigModelTask:Lcom/sonymobile/scan3d/viewer/asynctasks/RigModelTask;

    return-void
.end method

.method static synthetic access$000(Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;)V
    .locals 0

    .line 135
    invoke-direct {p0}, Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;->rigModel()V

    return-void
.end method

.method static synthetic access$100(Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;)Landroid/net/Uri;
    .locals 0

    .line 135
    iget-object p0, p0, Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;->mUri:Landroid/net/Uri;

    return-object p0
.end method

.method static synthetic access$200(Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$GltfConversionListener;)V
    .locals 0

    .line 135
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;->addListener(Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$GltfConversionListener;)V

    return-void
.end method

.method static synthetic access$300(Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$GltfConversionListener;)V
    .locals 0

    .line 135
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;->removeListener(Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$GltfConversionListener;)V

    return-void
.end method

.method static synthetic access$400(Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;)Ljava/util/Set;
    .locals 0

    .line 135
    iget-object p0, p0, Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;->mListener:Ljava/util/Set;

    return-object p0
.end method

.method private addListener(Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$GltfConversionListener;)V
    .locals 1

    .line 153
    iget-object v0, p0, Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;->mListener:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private removeListener(Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$GltfConversionListener;)V
    .locals 1

    .line 157
    iget-object v0, p0, Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;->mListener:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method private rigModel()V
    .locals 4

    .line 149
    iget-object v0, p0, Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;->mRigModelTask:Lcom/sonymobile/scan3d/viewer/asynctasks/RigModelTask;

    const/4 v1, 0x1

    new-array v1, v1, [Landroid/net/Uri;

    iget-object v2, p0, Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;->mUri:Landroid/net/Uri;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/asynctasks/RigModelTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method
