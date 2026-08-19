.class public Lcom/sonymobile/scan3d/EnvironmentError;
.super Ljava/lang/Object;
.source "EnvironmentError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;
    }
.end annotation


# instance fields
.field public critical:Z

.field public primaryImage:Landroid/graphics/Bitmap;

.field public secondaryImage:Landroid/graphics/Bitmap;

.field public type:Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
