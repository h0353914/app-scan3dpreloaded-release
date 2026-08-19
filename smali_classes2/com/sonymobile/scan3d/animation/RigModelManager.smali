.class public Lcom/sonymobile/scan3d/animation/RigModelManager;
.super Ljava/lang/Object;
.source "RigModelManager.java"

# interfaces
.implements Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$GltfConversionListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;
    }
.end annotation


# static fields
.field private static sRigModelManager:Lcom/sonymobile/scan3d/animation/RigModelManager;


# instance fields
.field private mActiveRigRequests:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/animation/RigModelManager;->mActiveRigRequests:Ljava/util/Queue;

    return-void
.end method

.method public static getInstance()Lcom/sonymobile/scan3d/animation/RigModelManager;
    .locals 1

    .line 32
    sget-object v0, Lcom/sonymobile/scan3d/animation/RigModelManager;->sRigModelManager:Lcom/sonymobile/scan3d/animation/RigModelManager;

    if-nez v0, :cond_0

    .line 33
    new-instance v0, Lcom/sonymobile/scan3d/animation/RigModelManager;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/animation/RigModelManager;-><init>()V

    sput-object v0, Lcom/sonymobile/scan3d/animation/RigModelManager;->sRigModelManager:Lcom/sonymobile/scan3d/animation/RigModelManager;

    .line 35
    :cond_0
    sget-object v0, Lcom/sonymobile/scan3d/animation/RigModelManager;->sRigModelManager:Lcom/sonymobile/scan3d/animation/RigModelManager;

    return-object v0
.end method

.method private getRigRequest(Landroid/net/Uri;)Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;
    .locals 3

    .line 62
    iget-object v0, p0, Lcom/sonymobile/scan3d/animation/RigModelManager;->mActiveRigRequests:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;

    .line 63
    invoke-static {v1}, Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;->access$100(Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-object v1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method static synthetic lambda$onConversionDone$0(Landroid/net/Uri;Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$GltfConversionListener;)V
    .locals 0

    .line 120
    invoke-interface {p1, p0}, Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$GltfConversionListener;->onConversionDone(Landroid/net/Uri;)V

    return-void
.end method

.method static synthetic lambda$onConversionFailed$1(Landroid/net/Uri;Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$GltfConversionListener;)V
    .locals 0

    .line 128
    invoke-interface {p1, p0}, Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$GltfConversionListener;->onConversionFailed(Landroid/net/Uri;)V

    return-void
.end method

.method private removeRigRequest(Landroid/net/Uri;)Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;
    .locals 3

    .line 74
    iget-object v0, p0, Lcom/sonymobile/scan3d/animation/RigModelManager;->mActiveRigRequests:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;

    .line 75
    invoke-static {v1}, Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;->access$100(Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 76
    iget-object p1, p0, Lcom/sonymobile/scan3d/animation/RigModelManager;->mActiveRigRequests:Ljava/util/Queue;

    invoke-interface {p1, v1}, Ljava/util/Queue;->remove(Ljava/lang/Object;)Z

    return-object v1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method


# virtual methods
.method public addListener(Landroid/net/Uri;Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$GltfConversionListener;)V
    .locals 0

    .line 98
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/animation/RigModelManager;->getRigRequest(Landroid/net/Uri;)Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 100
    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;->access$200(Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$GltfConversionListener;)V

    :cond_0
    return-void
.end method

.method public isRigging(Landroid/net/Uri;)Z
    .locals 0

    .line 87
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/animation/RigModelManager;->getRigRequest(Landroid/net/Uri;)Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public onConversionDone(Landroid/net/Uri;)V
    .locals 2

    .line 118
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/animation/RigModelManager;->removeRigRequest(Landroid/net/Uri;)Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 119
    invoke-static {v0}, Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;->access$400(Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;)Ljava/util/Set;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 120
    invoke-static {v0}, Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;->access$400(Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;)Ljava/util/Set;

    move-result-object v0

    new-instance v1, Lcom/sonymobile/scan3d/animation/-$$Lambda$RigModelManager$RJWlpfb3ET730Q74y0a_0VjHQCg;

    invoke-direct {v1, p1}, Lcom/sonymobile/scan3d/animation/-$$Lambda$RigModelManager$RJWlpfb3ET730Q74y0a_0VjHQCg;-><init>(Landroid/net/Uri;)V

    invoke-interface {v0, v1}, Ljava/util/Set;->forEach(Ljava/util/function/Consumer;)V

    :cond_0
    return-void
.end method

.method public onConversionFailed(Landroid/net/Uri;)V
    .locals 2

    .line 126
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/animation/RigModelManager;->removeRigRequest(Landroid/net/Uri;)Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 127
    invoke-static {v0}, Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;->access$400(Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;)Ljava/util/Set;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 128
    invoke-static {v0}, Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;->access$400(Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;)Ljava/util/Set;

    move-result-object v0

    new-instance v1, Lcom/sonymobile/scan3d/animation/-$$Lambda$RigModelManager$cEekP-cjdjCu7t_Fkh7n1_f837k;

    invoke-direct {v1, p1}, Lcom/sonymobile/scan3d/animation/-$$Lambda$RigModelManager$cEekP-cjdjCu7t_Fkh7n1_f837k;-><init>(Landroid/net/Uri;)V

    invoke-interface {v0, v1}, Ljava/util/Set;->forEach(Ljava/util/function/Consumer;)V

    :cond_0
    return-void
.end method

.method public removeListener(Landroid/net/Uri;Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$GltfConversionListener;)V
    .locals 0

    .line 110
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/animation/RigModelManager;->getRigRequest(Landroid/net/Uri;)Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 112
    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;->access$300(Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$GltfConversionListener;)V

    :cond_0
    return-void
.end method

.method public rigModel(Landroid/content/Context;Lcom/sonymobile/scan3d/viewer/SphanRenderer;Landroid/net/Uri;Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$GltfConversionListener;)V
    .locals 7

    .line 48
    invoke-direct {p0, p3}, Lcom/sonymobile/scan3d/animation/RigModelManager;->getRigRequest(Landroid/net/Uri;)Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;

    move-result-object v0

    if-nez v0, :cond_0

    .line 50
    sget-object v0, Lcom/sonymobile/scan3d/analytics/HitEvent;->RIGGING_PROCESS_STARTED:Lcom/sonymobile/scan3d/analytics/HitEvent;

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;)V

    .line 52
    new-instance v0, Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;

    move-object v1, v0

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    invoke-direct/range {v1 .. v6}, Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;-><init>(Lcom/sonymobile/scan3d/animation/RigModelManager;Landroid/content/Context;Lcom/sonymobile/scan3d/viewer/SphanRenderer;Landroid/net/Uri;Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$GltfConversionListener;)V

    .line 53
    iget-object p1, p0, Lcom/sonymobile/scan3d/animation/RigModelManager;->mActiveRigRequests:Ljava/util/Queue;

    invoke-interface {p1, v0}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 54
    invoke-static {v0}, Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;->access$000(Lcom/sonymobile/scan3d/animation/RigModelManager$RigRequest;)V

    :cond_0
    return-void
.end method
