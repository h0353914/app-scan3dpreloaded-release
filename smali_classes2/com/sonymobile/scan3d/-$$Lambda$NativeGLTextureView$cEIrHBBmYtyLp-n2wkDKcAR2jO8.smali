.class public final synthetic Lcom/sonymobile/scan3d/-$$Lambda$NativeGLTextureView$cEIrHBBmYtyLp-n2wkDKcAR2jO8;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic f$0:Lcom/sonymobile/scan3d/NativeGLTextureView;


# direct methods
.method public synthetic constructor <init>(Lcom/sonymobile/scan3d/NativeGLTextureView;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/-$$Lambda$NativeGLTextureView$cEIrHBBmYtyLp-n2wkDKcAR2jO8;->f$0:Lcom/sonymobile/scan3d/NativeGLTextureView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Lcom/sonymobile/scan3d/-$$Lambda$NativeGLTextureView$cEIrHBBmYtyLp-n2wkDKcAR2jO8;->f$0:Lcom/sonymobile/scan3d/NativeGLTextureView;

    invoke-static {v0}, Lcom/sonymobile/scan3d/NativeGLTextureView;->lambda$stopEncoder$0(Lcom/sonymobile/scan3d/NativeGLTextureView;)V

    return-void
.end method
