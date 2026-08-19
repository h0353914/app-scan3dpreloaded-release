.class interface abstract Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$CameraImageProviderFactory;
.super Ljava/lang/Object;
.source "FaceMimicActivity.java"


# annotations
.annotation build Landroidx/annotation/VisibleForTesting;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x608
    name = "CameraImageProviderFactory"
.end annotation


# virtual methods
.method public abstract newCameraImageProvider(Landroid/content/Context;Lcom/sonymobile/scan3d/CameraImageProvider$OnCameraStatusListener;Lcom/sonymobile/scan3d/SphinxFocusType;Z)Lcom/sonymobile/scan3d/CameraImageProvider;
    .annotation build Lcom/sonymobile/scan3d/sfmc/GlThread;
    .end annotation
.end method
