.class public Lcom/sonymobile/scan3d/NativeEGL;
.super Ljava/lang/Object;
.source "NativeEGL.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native createContext(Landroid/view/Surface;Z)J
.end method

.method public static native destroyContext(J)V
.end method

.method public static makeCurrent(J)V
    .locals 0

    .line 12
    invoke-static {p0, p1, p0, p1}, Lcom/sonymobile/scan3d/NativeEGL;->makeCurrent(JJ)V

    return-void
.end method

.method public static native makeCurrent(JJ)V
.end method

.method public static native querySurface(JI)I
.end method

.method public static native setPresentationTime(JJ)V
.end method

.method public static native swap(J)V
.end method
