.class public final synthetic Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PropsFragment$qjxqZfYjFlIEEfuAY0brgr3NS2I;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lcom/sonymobile/scan3d/viewer/SphanGLTextureView$AnimationListener;


# instance fields
.field private final synthetic f$0:Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;

.field private final synthetic f$1:I


# direct methods
.method public synthetic constructor <init>(Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PropsFragment$qjxqZfYjFlIEEfuAY0brgr3NS2I;->f$0:Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;

    iput p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PropsFragment$qjxqZfYjFlIEEfuAY0brgr3NS2I;->f$1:I

    return-void
.end method


# virtual methods
.method public final onAnimationStopped()V
    .locals 2

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PropsFragment$qjxqZfYjFlIEEfuAY0brgr3NS2I;->f$0:Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;

    iget v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PropsFragment$qjxqZfYjFlIEEfuAY0brgr3NS2I;->f$1:I

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->lambda$startAnimationPlayback$9(Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;I)V

    return-void
.end method
