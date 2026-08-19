.class public Lcom/sonymobile/scan3d/SphinxService$LocalBinder;
.super Landroid/os/Binder;
.source "SphinxService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/SphinxService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "LocalBinder"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/SphinxService;


# direct methods
.method public constructor <init>(Lcom/sonymobile/scan3d/SphinxService;)V
    .locals 0

    .line 75
    iput-object p1, p0, Lcom/sonymobile/scan3d/SphinxService$LocalBinder;->this$0:Lcom/sonymobile/scan3d/SphinxService;

    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    return-void
.end method


# virtual methods
.method getSphinxManager()Lcom/sonymobile/scan3d/ISphinxManager;
    .locals 1

    .line 83
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxService$LocalBinder;->this$0:Lcom/sonymobile/scan3d/SphinxService;

    return-object v0
.end method
