.class public final synthetic Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$9Rbw_EM5OyHXQR64vdXnRHzZCJs;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic f$0:Lcom/sonymobile/scan3d/editor/EditorFragment;

.field private final synthetic f$1:Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;


# direct methods
.method public synthetic constructor <init>(Lcom/sonymobile/scan3d/editor/EditorFragment;Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$9Rbw_EM5OyHXQR64vdXnRHzZCJs;->f$0:Lcom/sonymobile/scan3d/editor/EditorFragment;

    iput-object p2, p0, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$9Rbw_EM5OyHXQR64vdXnRHzZCJs;->f$1:Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$9Rbw_EM5OyHXQR64vdXnRHzZCJs;->f$0:Lcom/sonymobile/scan3d/editor/EditorFragment;

    iget-object v1, p0, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$9Rbw_EM5OyHXQR64vdXnRHzZCJs;->f$1:Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/editor/EditorFragment;->lambda$gotoEffectGroup$12(Lcom/sonymobile/scan3d/editor/EditorFragment;Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;)V

    return-void
.end method
