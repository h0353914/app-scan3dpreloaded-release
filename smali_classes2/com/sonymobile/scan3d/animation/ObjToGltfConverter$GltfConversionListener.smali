.class public interface abstract Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$GltfConversionListener;
.super Ljava/lang/Object;
.source "ObjToGltfConverter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/animation/ObjToGltfConverter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "GltfConversionListener"
.end annotation


# virtual methods
.method public abstract onConversionDone(Landroid/net/Uri;)V
.end method

.method public abstract onConversionFailed(Landroid/net/Uri;)V
.end method
