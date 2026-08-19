.class public Lcom/sonymobile/scan3d/viewer/fragments/GoodJobFragment;
.super Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;
.source "GoodJobFragment.java"

# interfaces
.implements Landroid/view/View$OnApplyWindowInsetsListener;


# static fields
.field private static final KEY_MODE:Ljava/lang/String; = "mode"

.field private static final KEY_TOO_LONG:Ljava/lang/String; = "too_long"

.field public static final MODE_FACE_SCAN:I = 0x0

.field public static final MODE_FOOD_SCAN:I = 0x2

.field public static final MODE_HEAD_SCAN:I = 0x1

.field public static final MODE_SELFIE_SCAN:I = 0x3

.field private static final OPEN_NEXT_TUTORIAL:Ljava/lang/String; = "open_next_tutorial"

.field private static final TWO_FINGERS:I = 0x2


# instance fields
.field private mTextContainer:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 37
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;-><init>()V

    return-void
.end method

.method private isFreeFormScanModeUnlocked()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public static synthetic lambda$onCreateView$0(Lcom/sonymobile/scan3d/viewer/fragments/GoodJobFragment;Landroid/view/View;)V
    .locals 0

    .line 129
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/GoodJobFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentActivity;->finish()V

    return-void
.end method

.method public static newInstance(IZZ)Landroidx/fragment/app/Fragment;
    .locals 3

    .line 93
    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/GoodJobFragment;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/viewer/fragments/GoodJobFragment;-><init>()V

    .line 94
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "mode"

    .line 95
    invoke-virtual {v1, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p0, "too_long"

    .line 96
    invoke-virtual {v1, p0, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string p0, "open_next_tutorial"

    .line 97
    invoke-virtual {v1, p0, p2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 98
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    return-object v0
.end method

.method private showMesh()V
    .locals 4

    .line 256
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/GoodJobFragment;->getRenderer()Lcom/sonymobile/scan3d/viewer/MeshRenderer;

    move-result-object v0

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/GoodJobFragment;->mModelContainer:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    sget-object v2, Lcom/sonymobile/scan3d/MeshVariant;->MESH_VARIANT_ORIGINAL:Lcom/sonymobile/scan3d/MeshVariant;

    sget-object v3, Lcom/sonymobile/scan3d/MeshType;->TYPE_ORIGINAL:Lcom/sonymobile/scan3d/MeshType;

    invoke-virtual {v0, v1, v2, v3}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->addMesh(Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/MeshVariant;Lcom/sonymobile/scan3d/MeshType;)V

    .line 258
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/GoodJobFragment;->requestRenderGLTextureView()V

    return-void
.end method


# virtual methods
.method public allowMotion(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 228
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result p1

    const/4 v0, 0x2

    if-eq p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method allowProgressDialogCancellation()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getContentLayout()I
    .locals 1

    const v0, 0x7f0c0075

    return v0
.end method

.method public onApplyWindowInsets(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .locals 1

    .line 238
    invoke-virtual {p2}, Landroid/view/WindowInsets;->hasSystemWindowInsets()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 240
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/GoodJobFragment;->mTextContainer:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 241
    invoke-virtual {p2}, Landroid/view/WindowInsets;->getSystemWindowInsetRight()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    .line 242
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/GoodJobFragment;->mTextContainer:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 245
    :cond_0
    invoke-virtual {p2}, Landroid/view/WindowInsets;->consumeSystemWindowInsets()Landroid/view/WindowInsets;

    move-result-object p1

    return-object p1
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 104
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onCreate(Landroid/os/Bundle;)V

    .line 107
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/GoodJobFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    const/4 v0, 0x0

    .line 108
    invoke-virtual {p1, v0}, Landroid/app/Activity;->setRequestedOrientation(I)V

    .line 111
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/16 v0, 0x200

    .line 112
    invoke-virtual {p1, v0, v0}, Landroid/view/Window;->setFlags(II)V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 3

    .line 118
    invoke-super {p0, p1, p2, p3}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f090098

    .line 121
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/GoodJobFragment;->mTextContainer:Landroid/view/View;

    .line 122
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/GoodJobFragment;->mTextContainer:Landroid/view/View;

    invoke-virtual {p2, p0}, Landroid/view/View;->setOnApplyWindowInsetsListener(Landroid/view/View$OnApplyWindowInsetsListener;)V

    const p2, 0x7f0900a4

    .line 124
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    const p3, 0x7f0901ef

    .line 125
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/widget/TextView;

    .line 126
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/GoodJobFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "too_long"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/16 v0, 0x8

    :goto_0
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setVisibility(I)V

    const p3, 0x7f09005a

    .line 128
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/widget/ImageView;

    const v0, 0x7f0900b7

    .line 129
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$GoodJobFragment$fT-j2TRLHrEa6CGUvZ364L-XJnc;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$GoodJobFragment$fT-j2TRLHrEa6CGUvZ364L-XJnc;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/GoodJobFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 131
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/GoodJobFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "mode"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 132
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const v2, 0x7f0800c4

    if-eqz v0, :cond_1

    packed-switch v0, :pswitch_data_0

    const v0, 0x7f0800c6

    .line 154
    invoke-virtual {p3, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    const p3, 0x7f10014c

    .line 155
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(I)V

    goto :goto_1

    .line 147
    :pswitch_0
    invoke-virtual {p3, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 148
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/GoodJobFragment;->getContext()Landroid/content/Context;

    move-result-object p3

    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    const v0, 0x7f100157

    .line 149
    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object p3

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 150
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    :pswitch_1
    const v0, 0x7f0800c5

    .line 142
    invoke-virtual {p3, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    const p3, 0x7f10013f

    .line 143
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(I)V

    goto :goto_1

    .line 135
    :cond_1
    invoke-virtual {p3, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 136
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/GoodJobFragment;->getContext()Landroid/content/Context;

    move-result-object p3

    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    const v0, 0x7f100137

    .line 137
    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object p3

    .line 136
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 138
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 159
    :goto_1
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/GoodJobFragment;->showFullscreen()V

    return-object p1

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public bridge synthetic onDestroy()V
    .locals 0

    .line 37
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onDestroy()V

    return-void
.end method

.method public onDetach()V
    .locals 2

    .line 166
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onDetach()V

    .line 168
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/GoodJobFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x200

    .line 169
    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    return-void
.end method

.method public bridge synthetic onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 0

    .line 37
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onMenuItemClick(Landroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method

.method public bridge synthetic onMeshLoadFailed(Landroid/net/Uri;)V
    .locals 0

    .line 37
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onMeshLoadFailed(Landroid/net/Uri;)V

    return-void
.end method

.method public onMeshLoaded(Landroid/net/Uri;Lcom/sonymobile/scan3d/viewer/ModelContainer;)V
    .locals 0

    .line 204
    invoke-super {p0, p1, p2}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onMeshLoaded(Landroid/net/Uri;Lcom/sonymobile/scan3d/viewer/ModelContainer;)V

    .line 205
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/GoodJobFragment;->isAdded()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 206
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/GoodJobFragment;->showMesh()V

    .line 207
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/GoodJobFragment;->dismissProgressDialog()V

    :cond_0
    return-void
.end method

.method public bridge synthetic onMeshLoading(Landroid/net/Uri;)V
    .locals 0

    .line 37
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onMeshLoading(Landroid/net/Uri;)V

    return-void
.end method

.method public bridge synthetic onPause()V
    .locals 0

    .line 37
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onPause()V

    return-void
.end method

.method public bridge synthetic onResume()V
    .locals 0

    .line 37
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onResume()V

    return-void
.end method

.method public bridge synthetic onScenographyChanged(Lcom/sonymobile/scan3d/ScenoID;)V
    .locals 0

    .line 37
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onScenographyChanged(Lcom/sonymobile/scan3d/ScenoID;)V

    return-void
.end method

.method public onSingleTouch()V
    .locals 1

    .line 218
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/GoodJobFragment;->isFullScreen()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 219
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/GoodJobFragment;->exitFullscreen()V

    goto :goto_0

    .line 221
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/GoodJobFragment;->showFullscreen()V

    :goto_0
    return-void
.end method

.method protected requiresFullScreen()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method protected showToolbar()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
