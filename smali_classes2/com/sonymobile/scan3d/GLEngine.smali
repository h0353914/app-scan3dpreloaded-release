.class abstract Lcom/sonymobile/scan3d/GLEngine;
.super Ljava/lang/Object;
.source "GLEngine.java"


# instance fields
.field private mGLHandle:J

.field private mSurface:Landroid/view/Surface;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method render(Lcom/sonymobile/scan3d/Sphinx;)Z
    .locals 4

    .line 44
    iget-wide v0, p0, Lcom/sonymobile/scan3d/GLEngine;->mGLHandle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    .line 45
    :cond_0
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/Sphinx;->render()V

    .line 46
    iget-wide v0, p0, Lcom/sonymobile/scan3d/GLEngine;->mGLHandle:J

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/NativeEGL;->swap(J)V

    const/4 p1, 0x1

    return p1
.end method

.method setSurface(Landroid/view/Surface;)Z
    .locals 6

    .line 24
    iget-object v0, p0, Lcom/sonymobile/scan3d/GLEngine;->mSurface:Landroid/view/Surface;

    const/4 v1, 0x1

    const-wide/16 v2, 0x0

    if-eq v0, p1, :cond_1

    .line 25
    iget-wide v4, p0, Lcom/sonymobile/scan3d/GLEngine;->mGLHandle:J

    cmp-long v0, v4, v2

    if-eqz v0, :cond_0

    .line 26
    invoke-static {v4, v5}, Lcom/sonymobile/scan3d/NativeEGL;->destroyContext(J)V

    .line 27
    iput-wide v2, p0, Lcom/sonymobile/scan3d/GLEngine;->mGLHandle:J

    .line 29
    :cond_0
    iput-object p1, p0, Lcom/sonymobile/scan3d/GLEngine;->mSurface:Landroid/view/Surface;

    .line 30
    iget-object p1, p0, Lcom/sonymobile/scan3d/GLEngine;->mSurface:Landroid/view/Surface;

    if-eqz p1, :cond_1

    .line 31
    invoke-static {p1, v1}, Lcom/sonymobile/scan3d/NativeEGL;->createContext(Landroid/view/Surface;Z)J

    move-result-wide v4

    iput-wide v4, p0, Lcom/sonymobile/scan3d/GLEngine;->mGLHandle:J

    .line 34
    :cond_1
    iget-wide v4, p0, Lcom/sonymobile/scan3d/GLEngine;->mGLHandle:J

    cmp-long p1, v4, v2

    if-eqz p1, :cond_2

    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    :goto_0
    return v1
.end method
