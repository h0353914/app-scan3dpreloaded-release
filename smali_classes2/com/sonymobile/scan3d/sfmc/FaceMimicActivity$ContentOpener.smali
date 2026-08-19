.class interface abstract Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$ContentOpener;
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
    name = "ContentOpener"
.end annotation


# virtual methods
.method public abstract openInputStream(Landroid/content/Context;Landroid/net/Uri;)Ljava/io/InputStream;
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
