.class public Lcom/sonymobile/scan3d/ToastAnimationSet$Builder;
.super Ljava/lang/Object;
.source "ToastAnimationSet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/ToastAnimationSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field mAnimationQueue:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/ToastAnimationSet$IAsyncAction;",
            ">;"
        }
    .end annotation
.end field

.field private mListener:Lcom/sonymobile/scan3d/ToastAnimationSet$ToastAnimationListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 96
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/ToastAnimationSet$Builder;->mAnimationQueue:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public addAnimation(Landroid/view/View;Landroid/view/animation/Animation;)Lcom/sonymobile/scan3d/ToastAnimationSet$Builder;
    .locals 3

    .line 115
    iget-object v0, p0, Lcom/sonymobile/scan3d/ToastAnimationSet$Builder;->mAnimationQueue:Ljava/util/List;

    new-instance v1, Lcom/sonymobile/scan3d/ToastAnimationSet$AnimationAction;

    const/4 v2, 0x0

    invoke-direct {v1, p1, p2, v2}, Lcom/sonymobile/scan3d/ToastAnimationSet$AnimationAction;-><init>(Landroid/view/View;Landroid/view/animation/Animation;Lcom/sonymobile/scan3d/ToastAnimationSet$1;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public addDelay(J)Lcom/sonymobile/scan3d/ToastAnimationSet$Builder;
    .locals 3

    .line 126
    iget-object v0, p0, Lcom/sonymobile/scan3d/ToastAnimationSet$Builder;->mAnimationQueue:Ljava/util/List;

    new-instance v1, Lcom/sonymobile/scan3d/ToastAnimationSet$DelayAction;

    const/4 v2, 0x0

    invoke-direct {v1, p1, p2, v2}, Lcom/sonymobile/scan3d/ToastAnimationSet$DelayAction;-><init>(JLcom/sonymobile/scan3d/ToastAnimationSet$1;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public build()Lcom/sonymobile/scan3d/ToastAnimationSet;
    .locals 3

    .line 136
    new-instance v0, Lcom/sonymobile/scan3d/ToastAnimationSet;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/sonymobile/scan3d/ToastAnimationSet;-><init>(Lcom/sonymobile/scan3d/ToastAnimationSet$1;)V

    .line 139
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/sonymobile/scan3d/ToastAnimationSet$Builder;->mAnimationQueue:Ljava/util/List;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v1, v0, Lcom/sonymobile/scan3d/ToastAnimationSet;->mAnimationQueue:Ljava/util/List;

    .line 140
    iget-object v1, p0, Lcom/sonymobile/scan3d/ToastAnimationSet$Builder;->mListener:Lcom/sonymobile/scan3d/ToastAnimationSet$ToastAnimationListener;

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/ToastAnimationSet;->access$302(Lcom/sonymobile/scan3d/ToastAnimationSet;Lcom/sonymobile/scan3d/ToastAnimationSet$ToastAnimationListener;)Lcom/sonymobile/scan3d/ToastAnimationSet$ToastAnimationListener;

    return-object v0
.end method

.method public setListener(Lcom/sonymobile/scan3d/ToastAnimationSet$ToastAnimationListener;)V
    .locals 0

    .line 105
    iput-object p1, p0, Lcom/sonymobile/scan3d/ToastAnimationSet$Builder;->mListener:Lcom/sonymobile/scan3d/ToastAnimationSet$ToastAnimationListener;

    return-void
.end method
