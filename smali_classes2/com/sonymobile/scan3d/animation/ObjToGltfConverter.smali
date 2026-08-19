.class public Lcom/sonymobile/scan3d/animation/ObjToGltfConverter;
.super Ljava/lang/Object;
.source "ObjToGltfConverter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$ErrorDialog;,
        Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$GltfConversionListener;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native convert(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/sonymobile/scan3d/viewer/SphanRenderer;)Z
.end method

.method public static native createPreview(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/sonymobile/scan3d/viewer/SphanRenderer;)V
.end method

.method public static showConversionFailedDialog(Landroidx/fragment/app/Fragment;Landroidx/fragment/app/FragmentManager;Landroid/net/Uri;)V
    .locals 1

    .line 58
    invoke-static {p2}, Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$ErrorDialog;->newInstance(Landroid/net/Uri;)Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$ErrorDialog;

    move-result-object p2

    const/4 v0, 0x0

    .line 59
    invoke-virtual {p2, p0, v0}, Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$ErrorDialog;->setTargetFragment(Landroidx/fragment/app/Fragment;I)V

    const/4 p0, 0x0

    .line 60
    invoke-virtual {p2, p1, p0}, Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$ErrorDialog;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method
