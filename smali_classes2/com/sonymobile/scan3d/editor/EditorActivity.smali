.class public Lcom/sonymobile/scan3d/editor/EditorActivity;
.super Landroidx/fragment/app/FragmentActivity;
.source "EditorActivity.java"


# static fields
.field public static final EXTRA_FACE_DETECTED:Ljava/lang/String; = "face_detected"

.field public static final EXTRA_MODEL:Ljava/lang/String; = "model"

.field public static final EXTRA_NAME:Ljava/lang/String; = "name"


# instance fields
.field private mOnBackPressListener:Lcom/sonymobile/scan3d/OnBackPressListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Landroidx/fragment/app/FragmentActivity;-><init>()V

    return-void
.end method

.method private showFragment(Landroidx/fragment/app/Fragment;)V
    .locals 2

    .line 38
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/editor/EditorActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    .line 39
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object v0

    const/16 v1, 0x1003

    .line 40
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentTransaction;->setTransition(I)Landroidx/fragment/app/FragmentTransaction;

    const v1, 0x7f0900dc

    .line 41
    invoke-virtual {v0, v1, p1}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 42
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentTransaction;->commit()I

    return-void
.end method


# virtual methods
.method public onAttachFragment(Landroidx/fragment/app/Fragment;)V
    .locals 1

    .line 47
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onAttachFragment(Landroidx/fragment/app/Fragment;)V

    .line 48
    instance-of v0, p1, Lcom/sonymobile/scan3d/OnBackPressListener;

    if-eqz v0, :cond_0

    .line 49
    check-cast p1, Lcom/sonymobile/scan3d/OnBackPressListener;

    iput-object p1, p0, Lcom/sonymobile/scan3d/editor/EditorActivity;->mOnBackPressListener:Lcom/sonymobile/scan3d/OnBackPressListener;

    :cond_0
    return-void
.end method

.method public onBackPressed()V
    .locals 1

    .line 55
    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorActivity;->mOnBackPressListener:Lcom/sonymobile/scan3d/OnBackPressListener;

    if-eqz v0, :cond_0

    .line 56
    invoke-interface {v0}, Lcom/sonymobile/scan3d/OnBackPressListener;->onBackPressed()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 60
    :cond_0
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onBackPressed()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4

    .line 27
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    const v0, 0x7f0c001c

    .line 28
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/editor/EditorActivity;->setContentView(I)V

    if-nez p1, :cond_0

    .line 31
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/editor/EditorActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "model"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Lcom/sonymobile/scan3d/viewer/ModelContainer;

    .line 32
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/editor/EditorActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "name"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 33
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/editor/EditorActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "face_detected"

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    .line 31
    invoke-static {p1, v0, v1}, Lcom/sonymobile/scan3d/editor/EditorFragment;->newInstance(Lcom/sonymobile/scan3d/viewer/ModelContainer;Ljava/lang/String;Z)Landroidx/fragment/app/Fragment;

    move-result-object p1

    .line 30
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/editor/EditorActivity;->showFragment(Landroidx/fragment/app/Fragment;)V

    :cond_0
    return-void
.end method
