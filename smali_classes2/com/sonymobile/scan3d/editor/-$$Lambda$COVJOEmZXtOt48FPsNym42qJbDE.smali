.class public final synthetic Lcom/sonymobile/scan3d/editor/-$$Lambda$COVJOEmZXtOt48FPsNym42qJbDE;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic f$0:Lcom/sonymobile/scan3d/editor/FxManager;


# direct methods
.method public synthetic constructor <init>(Lcom/sonymobile/scan3d/editor/FxManager;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/editor/-$$Lambda$COVJOEmZXtOt48FPsNym42qJbDE;->f$0:Lcom/sonymobile/scan3d/editor/FxManager;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/-$$Lambda$COVJOEmZXtOt48FPsNym42qJbDE;->f$0:Lcom/sonymobile/scan3d/editor/FxManager;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/editor/FxManager;->doAction()V

    return-void
.end method
