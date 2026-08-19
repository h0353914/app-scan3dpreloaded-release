.class public final synthetic Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$-aousJgreI-ANVVPJ8LVNwonCzA;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic f$0:Lcom/sonymobile/scan3d/editor/EditorFragment;

.field private final synthetic f$1:Ljava/lang/Runnable;

.field private final synthetic f$2:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Lcom/sonymobile/scan3d/editor/EditorFragment;Ljava/lang/Runnable;Ljava/lang/Runnable;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$-aousJgreI-ANVVPJ8LVNwonCzA;->f$0:Lcom/sonymobile/scan3d/editor/EditorFragment;

    iput-object p2, p0, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$-aousJgreI-ANVVPJ8LVNwonCzA;->f$1:Ljava/lang/Runnable;

    iput-object p3, p0, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$-aousJgreI-ANVVPJ8LVNwonCzA;->f$2:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$-aousJgreI-ANVVPJ8LVNwonCzA;->f$0:Lcom/sonymobile/scan3d/editor/EditorFragment;

    iget-object v1, p0, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$-aousJgreI-ANVVPJ8LVNwonCzA;->f$1:Ljava/lang/Runnable;

    iget-object v2, p0, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$-aousJgreI-ANVVPJ8LVNwonCzA;->f$2:Ljava/lang/Runnable;

    invoke-static {v0, v1, v2}, Lcom/sonymobile/scan3d/editor/EditorFragment;->lambda$runOnGLThenUIThread$15(Lcom/sonymobile/scan3d/editor/EditorFragment;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    return-void
.end method
