.class Lcom/sonymobile/scan3d/ToastAnimationSet$AnimationAction;
.super Ljava/lang/Object;
.source "ToastAnimationSet.java"

# interfaces
.implements Lcom/sonymobile/scan3d/ToastAnimationSet$IAsyncAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/ToastAnimationSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AnimationAction"
.end annotation


# instance fields
.field private mAnimation:Landroid/view/animation/Animation;

.field private mView:Landroid/view/View;


# direct methods
.method private constructor <init>(Landroid/view/View;Landroid/view/animation/Animation;)V
    .locals 0

    .line 182
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 183
    iput-object p1, p0, Lcom/sonymobile/scan3d/ToastAnimationSet$AnimationAction;->mView:Landroid/view/View;

    .line 184
    iput-object p2, p0, Lcom/sonymobile/scan3d/ToastAnimationSet$AnimationAction;->mAnimation:Landroid/view/animation/Animation;

    return-void
.end method

.method synthetic constructor <init>(Landroid/view/View;Landroid/view/animation/Animation;Lcom/sonymobile/scan3d/ToastAnimationSet$1;)V
    .locals 0

    .line 164
    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/ToastAnimationSet$AnimationAction;-><init>(Landroid/view/View;Landroid/view/animation/Animation;)V

    return-void
.end method

.method static synthetic access$400(Lcom/sonymobile/scan3d/ToastAnimationSet$AnimationAction;)Landroid/view/View;
    .locals 0

    .line 164
    iget-object p0, p0, Lcom/sonymobile/scan3d/ToastAnimationSet$AnimationAction;->mView:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$500(Lcom/sonymobile/scan3d/ToastAnimationSet$AnimationAction;)Landroid/view/animation/Animation;
    .locals 0

    .line 164
    iget-object p0, p0, Lcom/sonymobile/scan3d/ToastAnimationSet$AnimationAction;->mAnimation:Landroid/view/animation/Animation;

    return-object p0
.end method


# virtual methods
.method public execute(Lcom/sonymobile/scan3d/ToastAnimationSet;)V
    .locals 2

    .line 192
    iget-object v0, p0, Lcom/sonymobile/scan3d/ToastAnimationSet$AnimationAction;->mAnimation:Landroid/view/animation/Animation;

    new-instance v1, Lcom/sonymobile/scan3d/ToastAnimationSet$AnimationAction$1;

    invoke-direct {v1, p0, p1}, Lcom/sonymobile/scan3d/ToastAnimationSet$AnimationAction$1;-><init>(Lcom/sonymobile/scan3d/ToastAnimationSet$AnimationAction;Lcom/sonymobile/scan3d/ToastAnimationSet;)V

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 221
    iget-object p1, p0, Lcom/sonymobile/scan3d/ToastAnimationSet$AnimationAction;->mView:Landroid/view/View;

    iget-object v0, p0, Lcom/sonymobile/scan3d/ToastAnimationSet$AnimationAction;->mAnimation:Landroid/view/animation/Animation;

    invoke-virtual {p1, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    return-void
.end method
