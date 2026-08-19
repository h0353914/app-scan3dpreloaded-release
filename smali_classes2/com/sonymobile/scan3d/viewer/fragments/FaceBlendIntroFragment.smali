.class public Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendIntroFragment;
.super Landroidx/fragment/app/Fragment;
.source "FaceBlendIntroFragment.java"


# static fields
.field private static final KEY_FILESET:Ljava/lang/String; = "fileset"

.field private static final REQUEST_CODE_FACEBLEND:I = 0x1


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 40
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    return-void
.end method

.method public static synthetic lambda$onCreateView$0(Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendIntroFragment;Landroid/view/View;)V
    .locals 0

    .line 86
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendIntroFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->popBackStack()V

    return-void
.end method

.method public static synthetic lambda$onCreateView$1(Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendIntroFragment;Landroid/net/Uri;Landroid/view/View;)V
    .locals 2

    .line 90
    new-instance p2, Landroid/content/Intent;

    const-string v0, "android.intent.action.PICK"

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/provider/Contract$FileRecord;->CONTENT_URI:Landroid/net/Uri;

    invoke-direct {p2, v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 91
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendIntroFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, "application/vnd.sony.scan3d"

    .line 92
    invoke-virtual {p2, v0}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 93
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v1, 0x100

    invoke-static {v1}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->scanTypeToString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x101

    .line 95
    invoke-static {v1}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->scanTypeToString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.sonymobile.scan3d.intent.extra.SCAN_TYPE"

    .line 96
    invoke-virtual {p2, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, "com.sonymobile.scan3d.intent.extra.EXPLANATORY_TEXT"

    const v1, 0x7f100108

    .line 97
    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendIntroFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 98
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 99
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string p1, "com.sonymobile.scan3d.intent.extra.EXCLUDE_URIS"

    .line 100
    invoke-virtual {p2, p1, v0}, Landroid/content/Intent;->putParcelableArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    const-string p1, "pick_internal"

    const/4 v0, 0x1

    .line 101
    invoke-virtual {p2, p1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 102
    invoke-virtual {p0, p2, v0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendIntroFragment;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method static synthetic lambda$onCreateView$2(Landroid/widget/ScrollView;)V
    .locals 1

    const/16 v0, 0x82

    .line 107
    invoke-virtual {p0, v0}, Landroid/widget/ScrollView;->fullScroll(I)Z

    return-void
.end method

.method public static newInstance(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendIntroFragment;
    .locals 2
    .param p0    # Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    if-eqz p0, :cond_0

    .line 61
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "fileset"

    .line 62
    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 63
    new-instance p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendIntroFragment;

    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendIntroFragment;-><init>()V

    .line 64
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendIntroFragment;->setArguments(Landroid/os/Bundle;)V

    return-object p0

    .line 59
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Fileset was not provided"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 0

    .line 114
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    const/4 p2, 0x1

    if-ne p1, p2, :cond_0

    if-eqz p3, :cond_0

    .line 118
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    invoke-static {p1}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->newInstance(Landroid/net/Uri;)Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;

    move-result-object p1

    .line 119
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendIntroFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p2

    .line 120
    invoke-virtual {p2}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object p2

    const/16 p3, 0x1003

    .line 121
    invoke-virtual {p2, p3}, Landroidx/fragment/app/FragmentTransaction;->setTransition(I)Landroidx/fragment/app/FragmentTransaction;

    const p3, 0x7f0900dc

    .line 122
    invoke-virtual {p2, p3, p1}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 123
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroidx/fragment/app/FragmentTransaction;->addToBackStack(Ljava/lang/String;)Landroidx/fragment/app/FragmentTransaction;

    .line 124
    invoke-virtual {p2}, Landroidx/fragment/app/FragmentTransaction;->commit()I

    :cond_0
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1
    .param p1    # Landroid/view/LayoutInflater;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const p3, 0x7f0c0069

    const/4 v0, 0x0

    .line 72
    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 75
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendIntroFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p2

    if-eqz p2, :cond_0

    .line 76
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendIntroFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p2

    const-string p3, "fileset"

    invoke-virtual {p2, p3}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p2

    check-cast p2, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    if-eqz p2, :cond_1

    .line 81
    invoke-interface {p2}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getUri()Landroid/net/Uri;

    move-result-object p3

    const v0, 0x7f0901f8

    .line 83
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Toolbar;

    .line 84
    invoke-interface {p2}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Landroid/widget/Toolbar;->setTitle(Ljava/lang/CharSequence;)V

    .line 85
    new-instance p2, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$FaceBlendIntroFragment$MCqKkHass1dxn_4HDgiX_SSSj4s;

    invoke-direct {p2, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$FaceBlendIntroFragment$MCqKkHass1dxn_4HDgiX_SSSj4s;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendIntroFragment;)V

    invoke-virtual {v0, p2}, Landroid/widget/Toolbar;->setNavigationOnClickListener(Landroid/view/View$OnClickListener;)V

    const p2, 0x7f09006d

    .line 88
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/Button;

    .line 89
    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$FaceBlendIntroFragment$4P2EeAuYLOQnA4x0Z-g0rx1Sj-c;

    invoke-direct {v0, p0, p3}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$FaceBlendIntroFragment$4P2EeAuYLOQnA4x0Z-g0rx1Sj-c;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendIntroFragment;Landroid/net/Uri;)V

    invoke-virtual {p2, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p2, 0x7f090184

    .line 106
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ScrollView;

    .line 107
    new-instance p3, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$FaceBlendIntroFragment$baR3Q-9pRpdfb9ouklq9oHOCHhk;

    invoke-direct {p3, p2}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$FaceBlendIntroFragment$baR3Q-9pRpdfb9ouklq9oHOCHhk;-><init>(Landroid/widget/ScrollView;)V

    invoke-virtual {p2, p3}, Landroid/widget/ScrollView;->post(Ljava/lang/Runnable;)Z

    return-object p1

    .line 79
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Missing fileset."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
