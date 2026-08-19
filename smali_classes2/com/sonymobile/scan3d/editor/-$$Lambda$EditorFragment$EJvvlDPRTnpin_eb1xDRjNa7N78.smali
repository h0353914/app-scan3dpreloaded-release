.class public final synthetic Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$EJvvlDPRTnpin_eb1xDRjNa7N78;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic f$0:Lcom/sonymobile/scan3d/editor/EditorFragment;

.field private final synthetic f$1:Landroid/app/Activity;

.field private final synthetic f$2:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/sonymobile/scan3d/editor/EditorFragment;Landroid/app/Activity;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$EJvvlDPRTnpin_eb1xDRjNa7N78;->f$0:Lcom/sonymobile/scan3d/editor/EditorFragment;

    iput-object p2, p0, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$EJvvlDPRTnpin_eb1xDRjNa7N78;->f$1:Landroid/app/Activity;

    iput-object p3, p0, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$EJvvlDPRTnpin_eb1xDRjNa7N78;->f$2:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$EJvvlDPRTnpin_eb1xDRjNa7N78;->f$0:Lcom/sonymobile/scan3d/editor/EditorFragment;

    iget-object v1, p0, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$EJvvlDPRTnpin_eb1xDRjNa7N78;->f$1:Landroid/app/Activity;

    iget-object v2, p0, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$EJvvlDPRTnpin_eb1xDRjNa7N78;->f$2:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/sonymobile/scan3d/editor/EditorFragment;->lambda$saveModel$14(Lcom/sonymobile/scan3d/editor/EditorFragment;Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method
