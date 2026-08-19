.class public Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;
.super Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;
.source "ViewerFragment.java"

# interfaces
.implements Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment$OnYesNoListener;
.implements Lcom/sonymobile/scan3d/viewer/OnNameChangedListener;
.implements Landroidx/loader/app/LoaderManager$LoaderCallbacks;
.implements Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;
.implements Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils$ConnectionListener;
.implements Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$MeshLoadingListener;
.implements Landroid/widget/PopupMenu$OnMenuItemClickListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;",
        "Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment$OnYesNoListener;",
        "Lcom/sonymobile/scan3d/viewer/OnNameChangedListener;",
        "Landroidx/loader/app/LoaderManager$LoaderCallbacks<",
        "Landroid/database/Cursor;",
        ">;",
        "Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;",
        "Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils$ConnectionListener;",
        "Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$MeshLoadingListener;",
        "Landroid/widget/PopupMenu$OnMenuItemClickListener;"
    }
.end annotation


# static fields
.field private static final DIALOG_TAG:Ljava/lang/String; = "dialog_tag"

.field private static final KEY_ANIMATION_TOGGLE:Ljava/lang/String; = "animation_toggle"

.field private static final KEY_HINT_PROMO_DISMISSED:Ljava/lang/String; = "promo_dismissed"

.field private static final KEY_NEW_SCAN:Ljava/lang/String; = "key_new_scan"

.field private static final PERMISSION_REQUEST_CODE_FACE_MIMIC:I = 0x3e8

.field private static final QUESTION_ID_DELETE:I = 0x0

.field private static final QUESTION_ID_DELETE_ANIMATION:I = 0x3

.field private static final QUESTION_ID_UNSHARE:I = 0x2

.field private static final QUESTION_ID_WALLPAPER:I = 0x1

.field private static final REQUEST_CODE_CHANGE_WALLPAPER_FOR_DELETE:I = 0x1f42

.field private static final REQUEST_CODE_EDIT_MODEL:I = 0x1f43

.field private static final REQUEST_CODE_PRIVACY_AGREEMENT:I = 0x1f44

.field private static final REQUEST_CODE_SIGN_IN:I = 0x1f45

.field private static final VIEWER_PREFERENCE_DISMISSED:Ljava/lang/String; = "viewer_hints_dismissed"


# instance fields
.field private mAnimationToggle:I

.field private mAnimationViewSwitcher:Landroid/widget/ViewSwitcher;

.field private mBottomBar:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;

.field private mConnectionUtils:Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;

.field private mFileSetChangeRunnable:Ljava/lang/Runnable;

.field private mHintView:Lcom/sonymobile/scan3d/viewer/HintView;

.field private mImprovements:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/provider/Improvement;",
            ">;"
        }
    .end annotation
.end field

.field private mIsPromoHintDismissed:Z

.field private mModelContainer:Lcom/sonymobile/scan3d/viewer/ModelContainer;

.field private mNameView:Landroid/widget/TextView;

.field private mPermissionsContainer:Landroid/view/View;

.field private mPermissionsHandler:Landroid/os/Handler;

.field private mTextureToggle:Landroid/widget/ToggleButton;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 106
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;)Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;
    .locals 0

    .line 106
    iget-object p0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mBottomBar:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;

    return-object p0
.end method

.method private enableWebviewStatusUpdates()V
    .locals 1

    .line 866
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mFileSetChangeRunnable:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 867
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->enableFileSetObserver()V

    return-void
.end method

.method private getData()Landroid/net/Uri;
    .locals 1

    .line 976
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method private handleHints()V
    .locals 1

    .line 1005
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->handleViewerHint()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->handlePromoDismissedHint()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 1008
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mHintView:Lcom/sonymobile/scan3d/viewer/HintView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/HintView;->hideHint()V

    goto :goto_1

    .line 1006
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mHintView:Lcom/sonymobile/scan3d/viewer/HintView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/HintView;->showHint()V

    :goto_1
    return-void
.end method

.method private handleImprovementHint()Z
    .locals 9

    .line 1118
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    const v0, 0x7f100206

    .line 1120
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 1121
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mIsPromoHintDismissed:Z

    const/4 v1, 0x0

    const/4 v7, 0x1

    if-nez v0, :cond_0

    invoke-interface {v3, v4, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, v7

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    if-eqz v0, :cond_1

    .line 1124
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->isNewScan()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getFileSet()Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v0

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->isImprovable(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1125
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/Config;->isGooglePlayEnabled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1126
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mHintView:Lcom/sonymobile/scan3d/viewer/HintView;

    const v1, 0x7f0c0036

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/HintView;->addHintLayout(I)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f09008e

    .line 1128
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Landroid/widget/CheckBox;

    .line 1130
    new-instance v8, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$eFIA7eXVYi-6zVg1qjvU1JxFIUk;

    move-object v1, v8

    move-object v2, p0

    move-object v6, v0

    invoke-direct/range {v1 .. v6}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$eFIA7eXVYi-6zVg1qjvU1JxFIUk;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;Landroid/content/SharedPreferences;Ljava/lang/String;Landroid/widget/CheckBox;Landroid/view/View;)V

    const v1, 0x7f090081

    .line 1156
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v8}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v1, 0x7f09007d

    .line 1157
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v8}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v1, 0x7f09007b

    .line 1158
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v8}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    move v1, v7

    :cond_1
    return v1
.end method

.method private handleOngoingImprovement()Z
    .locals 8

    .line 1019
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mImprovements:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 1023
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mConnectionUtils:Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;

    if-nez v0, :cond_1

    .line 1024
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mConnectionUtils:Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;

    .line 1028
    :cond_1
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mImprovements:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;

    .line 1029
    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mHintView:Lcom/sonymobile/scan3d/viewer/HintView;

    const v3, 0x7f0c0034

    invoke-virtual {v2, v3}, Lcom/sonymobile/scan3d/viewer/HintView;->addHintLayout(I)Landroid/view/View;

    move-result-object v2

    const v3, 0x7f0901df

    .line 1030
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    const v4, 0x7f090079

    .line 1031
    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/Button;

    const v5, 0x7f09007a

    .line 1032
    invoke-virtual {v2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    .line 1034
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->isFailed()Z

    move-result v5

    const/16 v6, 0x8

    if-eqz v5, :cond_3

    .line 1036
    iget-object v5, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mConnectionUtils:Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;

    invoke-virtual {v5}, Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;->removeListener()V

    .line 1038
    invoke-virtual {v4, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 1039
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->getFailState()I

    move-result v5

    const/4 v7, 0x2

    if-eq v5, v7, :cond_2

    const v5, 0x7f100241

    .line 1049
    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setText(I)V

    .line 1050
    invoke-virtual {v2, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 1051
    new-instance v1, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$HTpefr3W9s6IesGN03UwXDn3Se0;

    invoke-direct {v1, p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$HTpefr3W9s6IesGN03UwXDn3Se0;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;Lcom/sonymobile/scan3d/storageservice/provider/Improvement;)V

    invoke-virtual {v2, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f100243

    .line 1053
    invoke-virtual {v4, v0}, Landroid/widget/Button;->setText(I)V

    .line 1054
    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$H3lfPniEtJeL4EH3pkfC3MI9X4M;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$H3lfPniEtJeL4EH3pkfC3MI9X4M;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;)V

    invoke-virtual {v4, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_1

    :cond_2
    const v1, 0x7f100240

    .line 1041
    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(I)V

    .line 1042
    invoke-virtual {v2, v6}, Landroid/widget/Button;->setVisibility(I)V

    const v1, 0x104000a

    .line 1043
    invoke-virtual {v4, v1}, Landroid/widget/Button;->setText(I)V

    .line 1044
    new-instance v1, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$BPAGbj5icFfo6ozQ56cpl_umKO4;

    invoke-direct {v1, p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$BPAGbj5icFfo6ozQ56cpl_umKO4;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;Lcom/sonymobile/scan3d/storageservice/provider/Improvement;)V

    invoke-virtual {v4, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_1

    .line 1057
    :cond_3
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->isImproved()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 1059
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mConnectionUtils:Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;->removeListener()V

    .line 1061
    invoke-virtual {v2, v6}, Landroid/widget/Button;->setVisibility(I)V

    const v0, 0x7f100358

    .line 1062
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(I)V

    .line 1063
    invoke-virtual {v4, v1}, Landroid/widget/Button;->setVisibility(I)V

    const v0, 0x7f10035a

    .line 1064
    invoke-virtual {v4, v0}, Landroid/widget/Button;->setText(I)V

    .line 1065
    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$90JFKQbHyzqfS4CV2KkUN96_GS8;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$90JFKQbHyzqfS4CV2KkUN96_GS8;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;)V

    invoke-virtual {v4, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_1

    .line 1069
    :cond_4
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->isWaiting()Z

    move-result v5

    if-nez v5, :cond_5

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->isDownloadable()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 1070
    :cond_5
    invoke-virtual {v2, v6}, Landroid/widget/Button;->setVisibility(I)V

    .line 1071
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mConnectionUtils:Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;->hasWifiConnection()Z

    move-result v0

    if-eqz v0, :cond_6

    const v0, 0x7f100357

    .line 1072
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    :cond_6
    const v0, 0x7f100359

    .line 1074
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(I)V

    :goto_0
    const/16 v0, 0x24

    .line 1076
    invoke-virtual {v3, v1, v1, v1, v0}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 1077
    invoke-virtual {v4, v6}, Landroid/widget/Button;->setVisibility(I)V

    .line 1079
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mConnectionUtils:Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;

    invoke-virtual {v0, p0}, Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;->addWifiListener(Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils$ConnectionListener;)V

    :cond_7
    :goto_1
    const/4 v0, 0x1

    return v0
.end method

.method private handlePromoDismissedHint()Z
    .locals 5

    .line 1173
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const v1, 0x7f1001ee

    .line 1174
    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 1175
    iget-boolean v2, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mIsPromoHintDismissed:Z

    const/4 v3, 0x1

    if-eqz v2, :cond_0

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    if-eqz v3, :cond_1

    .line 1178
    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mHintView:Lcom/sonymobile/scan3d/viewer/HintView;

    const v4, 0x7f0c0035

    invoke-virtual {v2, v4}, Lcom/sonymobile/scan3d/viewer/HintView;->addHintLayout(I)Landroid/view/View;

    move-result-object v2

    const v4, 0x7f09007e

    .line 1180
    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    new-instance v4, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$nT5lOaPFp28BV1KpI7Dj1JS7LD8;

    invoke-direct {v4, p0, v0, v1}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$nT5lOaPFp28BV1KpI7Dj1JS7LD8;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;Landroid/content/SharedPreferences;Ljava/lang/String;)V

    invoke-virtual {v2, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_1
    return v3
.end method

.method private handleViewerHint()Z
    .locals 3

    .line 1100
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "viewer_hints_dismissed"

    const/4 v2, 0x0

    .line 1101
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1102
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mHintView:Lcom/sonymobile/scan3d/viewer/HintView;

    const v2, 0x7f0c0038

    invoke-virtual {v1, v2}, Lcom/sonymobile/scan3d/viewer/HintView;->addHintLayout(I)Landroid/view/View;

    move-result-object v1

    const v2, 0x7f0900e3

    .line 1103
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    new-instance v2, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$tlp2tPXkRudNwyf3Cvx8g2m9gmI;

    invoke-direct {v2, p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$tlp2tPXkRudNwyf3Cvx8g2m9gmI;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;Landroid/content/SharedPreferences;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const/4 v0, 0x1

    return v0

    :cond_0
    return v2
.end method

.method private isImprovementOngoing(Ljava/util/List;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/provider/Improvement;",
            ">;)Z"
        }
    .end annotation

    .line 1244
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;

    .line 1245
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->isImproved()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->isFailed()Z

    move-result v0

    if-eqz v0, :cond_0

    :cond_1
    const/4 p1, 0x0

    return p1

    :cond_2
    const/4 p1, 0x1

    return p1
.end method

.method private isNewScan()Z
    .locals 2

    .line 1090
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "key_new_scan"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static synthetic lambda$cKL64aApPxF7uNvLPryAxLf7-7s(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->updateAnimationState()V

    return-void
.end method

.method public static synthetic lambda$doClick$4(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;Z)V
    .locals 1

    .line 692
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mUseUntexturedShading:Z

    .line 693
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->setUntexturedShading(Z)V

    .line 694
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->requestRender()V

    return-void
.end method

.method public static synthetic lambda$handleImprovementHint$13(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;Landroid/content/SharedPreferences;Ljava/lang/String;Landroid/widget/CheckBox;Landroid/view/View;Landroid/view/View;)V
    .locals 2

    .line 1131
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 1132
    invoke-virtual {p5}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f09007b

    if-eq v0, v1, :cond_2

    const p4, 0x7f09007d

    const/4 p5, 0x1

    if-eq v0, p4, :cond_1

    const p4, 0x7f090081

    if-eq v0, p4, :cond_0

    goto :goto_0

    .line 1134
    :cond_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->startImprovementJob()V

    .line 1135
    invoke-virtual {p3}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p3

    xor-int/2addr p3, p5

    invoke-interface {p1, p2, p3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    .line 1138
    :cond_1
    invoke-virtual {p3}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p3

    xor-int/2addr p3, p5

    invoke-interface {p1, p2, p3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 1139
    iput-boolean p5, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mIsPromoHintDismissed:Z

    .line 1140
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->handleHints()V

    goto :goto_0

    :cond_2
    const/16 p2, 0x8

    .line 1144
    invoke-virtual {p5, p2}, Landroid/view/View;->setVisibility(I)V

    const p2, 0x7f0900a3

    .line 1145
    invoke-virtual {p4, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    const/4 p3, 0x0

    .line 1146
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1152
    :goto_0
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public static synthetic lambda$handleOngoingImprovement$10(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;Landroid/view/View;)V
    .locals 0

    .line 1054
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->startImprovementJob()V

    return-void
.end method

.method public static synthetic lambda$handleOngoingImprovement$11(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;Landroid/view/View;)V
    .locals 1

    .line 1066
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getData()Landroid/net/Uri;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/viewer/ProxyReceiver;->getImprovementIntent(Landroid/content/Context;Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object p1

    .line 1067
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroidx/fragment/app/FragmentActivity;->sendBroadcast(Landroid/content/Intent;)V

    return-void
.end method

.method public static synthetic lambda$handleOngoingImprovement$8(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;Lcom/sonymobile/scan3d/storageservice/provider/Improvement;Landroid/view/View;)V
    .locals 0

    .line 1045
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p2

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->getUri()Landroid/net/Uri;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/sonymobile/scan3d/storageservice/provider/FileTasks;->delete(Landroid/content/Context;Landroid/net/Uri;)V

    return-void
.end method

.method public static synthetic lambda$handleOngoingImprovement$9(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;Lcom/sonymobile/scan3d/storageservice/provider/Improvement;Landroid/view/View;)V
    .locals 0

    .line 1052
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p2

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->getUri()Landroid/net/Uri;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/sonymobile/scan3d/storageservice/provider/FileTasks;->delete(Landroid/content/Context;Landroid/net/Uri;)V

    return-void
.end method

.method public static synthetic lambda$handlePromoDismissedHint$14(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;Landroid/content/SharedPreferences;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1181
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const/4 p3, 0x0

    invoke-interface {p1, p2, p3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 1182
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->handleHints()V

    return-void
.end method

.method public static synthetic lambda$handleViewerHint$12(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;Landroid/content/SharedPreferences;Landroid/view/View;)V
    .locals 1

    .line 1104
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string p2, "viewer_hints_dismissed"

    const/4 v0, 0x1

    invoke-interface {p1, p2, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 1105
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->handleHints()V

    return-void
.end method

.method public static synthetic lambda$lhCIkmXwrlP69KbpbQZH_m-WDyI(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->handleHints()V

    return-void
.end method

.method public static synthetic lambda$null$6(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;)V
    .locals 2

    .line 910
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->startAnimation(I)Z

    .line 911
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->requestRender()V

    return-void
.end method

.method public static synthetic lambda$onCreateView$0(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;Landroid/view/View;)V
    .locals 0

    .line 297
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->onNavigationClick()V

    return-void
.end method

.method public static synthetic lambda$onCreateView$1(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;)V
    .locals 1

    .line 315
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mModelContainer:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    if-eqz v0, :cond_0

    .line 316
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getFileSet()Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    .line 317
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->updateAnimationState()V

    :cond_0
    return-void
.end method

.method public static synthetic lambda$onPause$2(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;)V
    .locals 1

    .line 369
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    if-eqz v0, :cond_0

    .line 370
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->stopIdleAnimation()V

    :cond_0
    return-void
.end method

.method public static synthetic lambda$onPositiveAnswer$3(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;)V
    .locals 2

    .line 620
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->onGLContextDestroyed()V

    .line 621
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->removeMeshes()V

    .line 622
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->loadMeshIntoSphan()Z

    .line 623
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->onGLContextCreated()V

    .line 624
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->requestRender()V

    .line 625
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$cKL64aApPxF7uNvLPryAxLf7-7s;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$cKL64aApPxF7uNvLPryAxLf7-7s;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public static synthetic lambda$setupPermissionsButton$15(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;[Ljava/lang/String;ILandroid/view/View;)V
    .locals 1

    .line 1265
    iget-object p3, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mPermissionsContainer:Landroid/view/View;

    const/4 v0, 0x4

    invoke-virtual {p3, v0}, Landroid/view/View;->setVisibility(I)V

    .line 1266
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p3

    invoke-static {p3, p1}, Lcom/sonymobile/scan3d/PermissionUtil;->shouldShowRequestPermissionRationale(Landroid/app/Activity;[Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_0

    .line 1268
    invoke-virtual {p0, p1, p2}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->requestPermissions([Ljava/lang/String;I)V

    goto :goto_0

    .line 1270
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/sonymobile/scan3d/PermissionUtil;->startAppSettings(Landroid/content/Context;)V

    :goto_0
    return-void
.end method

.method public static synthetic lambda$updateAnimationState$5(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;)V
    .locals 1

    .line 904
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->stopIdleAnimation()V

    .line 905
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->showStaticMesh()V

    return-void
.end method

.method public static synthetic lambda$updateAnimationState$7(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;)V
    .locals 2

    .line 909
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    new-instance v1, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$EEGAJhiZHWVAOMGdzTlAve5ZJJA;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$EEGAJhiZHWVAOMGdzTlAve5ZJJA;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;)V

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->setAnimationListener(Lcom/sonymobile/scan3d/viewer/SphanGLTextureView$AnimationListener;)V

    .line 913
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->showRiggedMesh()V

    .line 914
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->startAnimation(I)Z

    .line 915
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->requestRender()V

    return-void
.end method

.method private launchFaceMimic()V
    .locals 6

    .line 1280
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getFileSet()Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v0

    .line 1281
    new-instance v1, Landroid/content/ComponentName;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    .line 1283
    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->isRigged()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1284
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getContext()Landroid/content/Context;

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {v3, v0, v1, v2, v4}, Lcom/sonymobile/scan3d/storageservice/provider/FileTasks;->shareGltfMesh(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Landroid/content/ComponentName;ILandroid/os/Handler;)V

    goto :goto_0

    .line 1287
    :cond_0
    new-instance v3, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    invoke-direct {v3}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;-><init>()V

    .line 1288
    invoke-virtual {v3, v1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setRecipient(Landroid/content/ComponentName;)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    move-result-object v1

    .line 1289
    invoke-virtual {v1, v2}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setTextureSize(I)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    move-result-object v1

    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setScanFormat(I)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    move-result-object v1

    sget-object v5, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->ANIMATION:Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    .line 1290
    invoke-virtual {v1, v5}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setShareType(Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setFileSet(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    .line 1292
    invoke-static {v3, v4, v2}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->newInstance(Lcom/sonymobile/scan3d/viewer/sharing/Shareable;ZZ)Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;

    move-result-object v0

    .line 1293
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object v1

    const/16 v2, 0x1003

    .line 1294
    invoke-virtual {v1, v2}, Landroidx/fragment/app/FragmentTransaction;->setTransition(I)Landroidx/fragment/app/FragmentTransaction;

    const v2, 0x7f0900dc

    .line 1295
    invoke-virtual {v1, v2, v0}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 1296
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroidx/fragment/app/FragmentTransaction;->addToBackStack(Ljava/lang/String;)Landroidx/fragment/app/FragmentTransaction;

    .line 1297
    invoke-virtual {v1}, Landroidx/fragment/app/FragmentTransaction;->commit()I

    :goto_0
    return-void
.end method

.method public static newInstance()Landroidx/fragment/app/Fragment;
    .locals 1

    const/4 v0, 0x0

    .line 259
    invoke-static {v0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->newInstance(Z)Landroidx/fragment/app/Fragment;

    move-result-object v0

    return-object v0
.end method

.method public static newInstance(Z)Landroidx/fragment/app/Fragment;
    .locals 3

    .line 246
    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;-><init>()V

    .line 247
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "key_new_scan"

    .line 248
    invoke-virtual {v1, v2, p0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 249
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    return-object v0
.end method

.method private notifyLoadFinished()V
    .locals 1

    .line 993
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mImprovements:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mModelContainer:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mConnectionUtils:Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    .line 994
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->hasLoadedMeshes()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 995
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->dismissProgressDialog()V

    .line 996
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->updateAnimationState()V

    .line 997
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->handleHints()V

    :cond_0
    return-void
.end method

.method private setupBottomBar(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .locals 1

    const/4 v0, 0x1

    .line 836
    invoke-static {p1, p2, v0}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;->inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mBottomBar:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;

    .line 837
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mBottomBar:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;

    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment$1;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment$1;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;)V

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;->addOnRebindCallback(Landroidx/databinding/OnRebindCallback;)V

    const p1, 0x7f090042

    .line 845
    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p1, 0x7f090036

    .line 846
    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p1, 0x7f09002a

    .line 847
    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p1, 0x7f090037

    .line 848
    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private setupPermissionsButton(I[Ljava/lang/String;I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 1261
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mPermissionsContainer:Landroid/view/View;

    const v1, 0x7f09014e

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 1262
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 1263
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mPermissionsContainer:Landroid/view/View;

    const v0, 0x7f09014b

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    .line 1264
    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$ZsNQEWUM7N-jhVyAIa4P1ofR5bM;

    invoke-direct {v0, p0, p2, p3}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$ZsNQEWUM7N-jhVyAIa4P1ofR5bM;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;[Ljava/lang/String;I)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private showChangeWallpaperDialog()V
    .locals 6

    .line 956
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    const/4 v1, 0x1

    const v2, 0x7f1000bf

    const v3, 0x7f1000bd

    const v4, 0x7f1000be

    const/4 v5, 0x0

    .line 957
    invoke-static {v1, v2, v3, v4, v5}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->newInstance(IIIILandroid/os/Parcelable;)Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;

    move-result-object v1

    const/4 v2, 0x0

    .line 961
    invoke-virtual {v1, p0, v2}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->setTargetFragment(Landroidx/fragment/app/Fragment;I)V

    const-string v2, "dialog_tag"

    .line 962
    invoke-virtual {v1, v0, v2}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method private showDeleteDialog(III)V
    .locals 1

    .line 878
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    .line 880
    invoke-static {p1, p2, p3}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->newInstance(III)Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;

    move-result-object p1

    const/4 p2, 0x0

    .line 882
    invoke-virtual {p1, p0, p2}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->setTargetFragment(Landroidx/fragment/app/Fragment;I)V

    const-string p2, "dialog_tag"

    .line 883
    invoke-virtual {p1, v0, p2}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method private showDetailsDialog()V
    .locals 3

    .line 1214
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mModelContainer:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    .line 1215
    invoke-virtual {v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getFileSet()Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v1

    .line 1214
    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment;->newInstance(Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment;

    move-result-object v0

    .line 1216
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    const-string v2, "dialog_tag"

    invoke-virtual {v0, v1, v2}, Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method private showEditNameDialog()V
    .locals 3

    .line 969
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    .line 970
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getName()Ljava/lang/String;

    move-result-object v1

    const v2, 0x7f1000ca

    invoke-static {v1, v2, p0}, Lcom/sonymobile/scan3d/viewer/fragments/EditNameFragment;->newInstance(Ljava/lang/String;ILandroidx/fragment/app/Fragment;)Lcom/sonymobile/scan3d/viewer/fragments/EditNameFragment;

    move-result-object v1

    const-string v2, "dialog_tag"

    .line 972
    invoke-virtual {v1, v0, v2}, Lcom/sonymobile/scan3d/viewer/fragments/EditNameFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method private showUnshareDialog()V
    .locals 6

    .line 855
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    const/4 v1, 0x2

    const v2, 0x7f1000e7

    const v3, 0x7f1000e6

    const v4, 0x7f1002af

    const/4 v5, 0x0

    .line 857
    invoke-static {v1, v2, v3, v4, v5}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->newInstance(IIIILandroid/os/Parcelable;)Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;

    move-result-object v1

    const/4 v2, 0x0

    .line 861
    invoke-virtual {v1, p0, v2}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->setTargetFragment(Landroidx/fragment/app/Fragment;I)V

    const-string v2, "dialog_tag"

    .line 862
    invoke-virtual {v1, v0, v2}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method private startImprovementJob()V
    .locals 5

    .line 1193
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 1194
    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->isSignedIn(Landroid/content/Context;)Z

    move-result v1

    .line 1195
    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->isPostProcessAccepted(Landroid/content/Context;)Z

    move-result v2

    if-eqz v1, :cond_0

    if-eqz v2, :cond_0

    .line 1197
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getFileSet()Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v1

    .line 1198
    new-instance v2, Lcom/sonymobile/scan3d/viewer/asynctasks/ImproveTask;

    const-string v3, "refinement"

    invoke-direct {v2, v0, v3}, Lcom/sonymobile/scan3d/viewer/asynctasks/ImproveTask;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    sget-object v0, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v3, 0x1

    new-array v3, v3, [Landroid/net/Uri;

    const/4 v4, 0x0

    .line 1199
    invoke-interface {v1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getUri()Landroid/net/Uri;

    move-result-object v1

    aput-object v1, v3, v4

    invoke-virtual {v2, v0, v3}, Lcom/sonymobile/scan3d/viewer/asynctasks/ImproveTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0

    :cond_0
    if-nez v2, :cond_1

    .line 1201
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicies;->getPostProcessPrivacy()Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;

    move-result-object v1

    .line 1202
    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyActivity;

    invoke-direct {v2, v0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v0, "com.sonymobile.scan3d.extras.PRIVACY"

    .line 1203
    invoke-virtual {v2, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const/16 v0, 0x1f44

    .line 1204
    invoke-virtual {p0, v2, v0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0

    .line 1206
    :cond_1
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicies;->getPostProcessSigninPrivacy()Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;

    move-result-object v1

    .line 1207
    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;

    invoke-direct {v2, v0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v0, "com.sonymobile.scan3d.extras.PRIVACY"

    .line 1208
    invoke-virtual {v2, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const/16 v0, 0x1f45

    .line 1209
    invoke-virtual {p0, v2, v0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->startActivityForResult(Landroid/content/Intent;I)V

    :goto_0
    return-void
.end method

.method private updateAnimationState()V
    .locals 4

    .line 891
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    if-nez v0, :cond_0

    goto :goto_3

    .line 895
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->getMeshCount()I

    move-result v0

    .line 896
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mAnimationViewSwitcher:Landroid/widget/ViewSwitcher;

    const/4 v2, 0x1

    if-le v0, v2, :cond_1

    const/4 v3, 0x0

    goto :goto_0

    :cond_1
    const/16 v3, 0x8

    :goto_0
    invoke-virtual {v1, v3}, Landroid/widget/ViewSwitcher;->setVisibility(I)V

    .line 897
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mBottomBar:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;

    if-le v0, v2, :cond_2

    const v0, 0x7f100355

    .line 898
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_2
    const v0, 0x7f100351

    .line 899
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 897
    :goto_1
    invoke-virtual {v1, v0}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;->setAnimText(Ljava/lang/String;)V

    .line 901
    iget v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mAnimationToggle:I

    if-nez v0, :cond_3

    .line 902
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->setAnimationListener(Lcom/sonymobile/scan3d/viewer/SphanGLTextureView$AnimationListener;)V

    .line 903
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    new-instance v1, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$jXN-rcyH7vB3Tw5BArqMTUOCUWc;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$jXN-rcyH7vB3Tw5BArqMTUOCUWc;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;)V

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->queueEvent(Ljava/lang/Runnable;)V

    goto :goto_2

    .line 908
    :cond_3
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    new-instance v1, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$o_g5WrMv8Cp_fWH9UclXtLPIZf8;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$o_g5WrMv8Cp_fWH9UclXtLPIZf8;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;)V

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->queueEvent(Ljava/lang/Runnable;)V

    :goto_2
    return-void

    :cond_4
    :goto_3
    return-void
.end method

.method private updateImproveDrawable()V
    .locals 3

    .line 1224
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mImprovements:Ljava/util/List;

    if-eqz v0, :cond_3

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mBottomBar:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;

    if-nez v1, :cond_0

    goto :goto_2

    .line 1226
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mImprovements:Ljava/util/List;

    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->isImprovementOngoing(Ljava/util/List;)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    .line 1231
    :cond_1
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0800f5

    .line 1232
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v2

    .line 1231
    invoke-virtual {v0, v1, v2}, Landroid/content/res/Resources;->getDrawable(ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/AnimationDrawable;

    .line 1233
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mBottomBar:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;

    invoke-virtual {v1, v0}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;->setImproveDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_1

    .line 1227
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0800f6

    .line 1228
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v2

    .line 1227
    invoke-virtual {v0, v1, v2}, Landroid/content/res/Resources;->getDrawable(ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 1229
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mBottomBar:Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;

    invoke-virtual {v1, v0}, Lcom/sonymobile/scan3d/databinding/ComponentSharingBarBinding;->setImproveDrawable(Landroid/graphics/drawable/Drawable;)V

    :goto_1
    return-void

    :cond_3
    :goto_2
    return-void
.end method

.method private updateSharingBarItemWidths()V
    .locals 6

    .line 929
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_3

    const v1, 0x7f0901a0

    .line 931
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    move v2, v1

    move v3, v2

    .line 934
    :goto_0
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v4

    if-ge v2, v4, :cond_1

    .line 935
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    move-result v4

    if-nez v4, :cond_0

    add-int/lit8 v3, v3, 0x1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 940
    :cond_1
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    const/4 v4, 0x5

    if-lt v3, v4, :cond_2

    .line 943
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v4

    iget v4, v4, Landroid/content/res/Configuration;->orientation:I

    const/4 v5, 0x1

    if-ne v4, v5, :cond_2

    int-to-float v2, v2

    int-to-float v3, v3

    const/high16 v4, 0x3f000000    # 0.5f

    sub-float/2addr v3, v4

    div-float/2addr v2, v3

    float-to-int v2, v2

    goto :goto_1

    .line 946
    :cond_2
    div-int/2addr v2, v3

    .line 949
    :goto_1
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v3

    if-ge v1, v3, :cond_3

    .line 950
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    iput v2, v3, Landroid/view/ViewGroup$LayoutParams;->width:I

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_3
    return-void
.end method


# virtual methods
.method public doClick(Landroid/view/View;)V
    .locals 6

    .line 649
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f0900dc

    const/4 v2, 0x1

    sparse-switch v0, :sswitch_data_0

    .line 747
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unsupported View: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 668
    :sswitch_0
    new-instance v0, Landroid/widget/PopupMenu;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroid/widget/PopupMenu;-><init>(Landroid/content/Context;Landroid/view/View;)V

    .line 669
    invoke-virtual {v0}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object p1

    .line 670
    invoke-virtual {v0}, Landroid/widget/PopupMenu;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v1

    const v3, 0x7f0d0001

    .line 671
    invoke-virtual {v1, v3, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 672
    invoke-virtual {v0, p0}, Landroid/widget/PopupMenu;->setOnMenuItemClickListener(Landroid/widget/PopupMenu$OnMenuItemClickListener;)V

    .line 673
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getFileSet()Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 675
    invoke-interface {v1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getSharedMeshes()I

    move-result v1

    const v3, 0x7f090122

    .line 677
    invoke-interface {p1, v3}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    int-to-long v4, v1

    invoke-static {v4, v5}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v1

    .line 678
    invoke-virtual {v1, v2}, Ljava/math/BigInteger;->testBit(I)Z

    move-result v1

    .line 677
    invoke-interface {v3, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    const v1, 0x7f090120

    .line 680
    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    invoke-static {v4, v5}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v2

    const/4 v3, 0x4

    .line 681
    invoke-virtual {v2, v3}, Ljava/math/BigInteger;->testBit(I)Z

    move-result v2

    .line 680
    invoke-interface {v1, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    const v1, 0x7f090121

    .line 683
    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    invoke-static {v4, v5}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v1

    const/4 v2, 0x5

    .line 684
    invoke-virtual {v1, v2}, Ljava/math/BigInteger;->testBit(I)Z

    move-result v1

    .line 683
    invoke-interface {p1, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 686
    :cond_0
    invoke-virtual {v0}, Landroid/widget/PopupMenu;->show()V

    goto/16 :goto_1

    .line 698
    :sswitch_1
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mAnimationViewSwitcher:Landroid/widget/ViewSwitcher;

    invoke-virtual {p1}, Landroid/widget/ViewSwitcher;->showNext()V

    .line 699
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mAnimationViewSwitcher:Landroid/widget/ViewSwitcher;

    invoke-virtual {p1}, Landroid/widget/ViewSwitcher;->getDisplayedChild()I

    move-result p1

    iput p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mAnimationToggle:I

    .line 700
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->updateAnimationState()V

    goto/16 :goto_1

    .line 689
    :sswitch_2
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mTextureToggle:Landroid/widget/ToggleButton;

    invoke-virtual {p1}, Landroid/widget/ToggleButton;->isChecked()Z

    move-result p1

    xor-int/2addr p1, v2

    .line 690
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mTextureToggle:Landroid/widget/ToggleButton;

    invoke-virtual {v0, p1}, Landroid/widget/ToggleButton;->setChecked(Z)V

    .line 691
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    new-instance v1, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$aJb392WyOWb-EGi3-m3nf2D3VkM;

    invoke-direct {v1, p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$aJb392WyOWb-EGi3-m3nf2D3VkM;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;Z)V

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->queueEvent(Ljava/lang/Runnable;)V

    goto/16 :goto_1

    .line 652
    :sswitch_3
    new-instance v0, Landroid/widget/PopupMenu;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroid/widget/PopupMenu;-><init>(Landroid/content/Context;Landroid/view/View;)V

    .line 653
    invoke-virtual {v0}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object p1

    .line 654
    invoke-virtual {v0}, Landroid/widget/PopupMenu;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v1

    const v3, 0x7f0d0002

    .line 655
    invoke-virtual {v1, v3, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 656
    invoke-virtual {v0, p0}, Landroid/widget/PopupMenu;->setOnMenuItemClickListener(Landroid/widget/PopupMenu$OnMenuItemClickListener;)V

    const v1, 0x7f09011a

    .line 659
    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    .line 660
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getFileSet()Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 662
    invoke-interface {v1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getRiggedFileUrl()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    xor-int/2addr v1, v2

    invoke-interface {p1, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 665
    :cond_1
    invoke-virtual {v0}, Landroid/widget/PopupMenu;->show()V

    goto/16 :goto_1

    .line 711
    :sswitch_4
    sget-object p1, Lcom/sonymobile/scan3d/analytics/HitEvent;->SHARE_BUTTON_CLICKED:Lcom/sonymobile/scan3d/analytics/HitEvent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;)V

    .line 713
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->getViewMatrix()[F

    move-result-object p1

    .line 714
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getFileSet()Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v0

    sget-object v2, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;->SHARE:Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;

    invoke-static {v0, p1, v2}, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;->newInstance(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;[FLcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;)Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;

    move-result-object p1

    .line 716
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object v0

    .line 717
    invoke-virtual {v0, v1, p1}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 718
    const-class p1, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroidx/fragment/app/FragmentTransaction;->addToBackStack(Ljava/lang/String;)Landroidx/fragment/app/FragmentTransaction;

    .line 719
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentTransaction;->commit()I

    goto/16 :goto_1

    .line 736
    :sswitch_5
    sget-object p1, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->CAMERA:Lcom/sonymobile/scan3d/PermissionUtil$Permissions;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/PermissionUtil$Permissions;->getPermissions()[Ljava/lang/String;

    move-result-object p1

    .line 737
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/sonymobile/scan3d/PermissionUtil;->getMissingPermissions(Landroid/content/Context;[Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    .line 739
    array-length v0, p1

    if-lez v0, :cond_2

    const v0, 0x7f10011d

    const/16 v1, 0x3e8

    .line 740
    invoke-direct {p0, v0, p1, v1}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->setupPermissionsButton(I[Ljava/lang/String;I)V

    .line 741
    invoke-virtual {p0, p1, v1}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->requestPermissions([Ljava/lang/String;I)V

    goto/16 :goto_1

    .line 743
    :cond_2
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->launchFaceMimic()V

    goto :goto_1

    .line 703
    :sswitch_6
    new-instance p1, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const-class v1, Lcom/sonymobile/scan3d/editor/EditorActivity;

    invoke-direct {p1, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v0, "model"

    .line 704
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mModelContainer:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const-string v0, "name"

    .line 705
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, "face_detected"

    .line 706
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    .line 707
    invoke-virtual {v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getFileSet()Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v1

    invoke-interface {v1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->isRiggable()Z

    move-result v1

    .line 706
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const/16 v0, 0x1f43

    .line 708
    invoke-virtual {p0, p1, v0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_1

    .line 722
    :sswitch_7
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getFileSet()Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object p1

    .line 723
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getRiggedFileUrl()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 724
    sget-object p1, Lcom/sonymobile/scan3d/analytics/HitEvent;->ANIMATE_MODEL_CLICKED:Lcom/sonymobile/scan3d/analytics/HitEvent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;)V

    goto :goto_0

    .line 726
    :cond_3
    sget-object p1, Lcom/sonymobile/scan3d/analytics/HitEvent;->PLAY_WITH_ANIMATIONS_CLICKED:Lcom/sonymobile/scan3d/analytics/HitEvent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;)V

    :goto_0
    const/4 p1, 0x0

    const/4 v0, 0x0

    .line 728
    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->newInstance(Lcom/sonymobile/scan3d/viewer/sharing/Shareable;Z)Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;

    move-result-object p1

    .line 729
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    .line 730
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object v0

    .line 731
    invoke-virtual {v0, v1, p1}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 732
    const-class p1, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroidx/fragment/app/FragmentTransaction;->addToBackStack(Ljava/lang/String;)Landroidx/fragment/app/FragmentTransaction;

    .line 733
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentTransaction;->commit()I

    :goto_1
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        0x7f09002a -> :sswitch_7
        0x7f090036 -> :sswitch_6
        0x7f090037 -> :sswitch_5
        0x7f090042 -> :sswitch_4
        0x7f090140 -> :sswitch_3
        0x7f0901e6 -> :sswitch_2
        0x7f0901f7 -> :sswitch_1
        0x7f090226 -> :sswitch_0
    .end sparse-switch
.end method

.method public getContentLayout()I
    .locals 1

    const v0, 0x7f0c0074

    return v0
.end method

.method getControlsView()I
    .locals 1

    const v0, 0x7f090135

    return v0
.end method

.method public getTextureViewId()I
    .locals 1

    const v0, 0x7f0900e1

    return v0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 2
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 264
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 267
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-static {p1}, Landroidx/loader/app/LoaderManager;->getInstance(Landroidx/lifecycle/LifecycleOwner;)Landroidx/loader/app/LoaderManager;

    move-result-object p1

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 268
    invoke-virtual {p1, v0, v1, p0}, Landroidx/loader/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroidx/loader/app/LoaderManager$LoaderCallbacks;)Landroidx/loader/content/Loader;

    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 2

    .line 412
    invoke-super {p0, p1, p2, p3}, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->onActivityResult(IILandroid/content/Intent;)V

    const/4 v0, 0x1

    const/4 v1, -0x1

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    if-ne p2, v1, :cond_1

    .line 437
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    .line 439
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->acceptPostProcessing(Landroid/content/Context;)V

    goto :goto_0

    :pswitch_1
    if-ne p2, v1, :cond_1

    .line 423
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 425
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p2

    .line 426
    invoke-static {p2, p1}, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->getViewerModeIntent(Landroid/content/Context;Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object p1

    .line 427
    invoke-virtual {p2, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 428
    invoke-virtual {p2}, Landroid/app/Activity;->finish()V

    goto :goto_0

    .line 430
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    const p2, 0x7f1000fc

    invoke-static {p1, p2, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p1

    .line 431
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 415
    :pswitch_2
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getData()Landroid/net/Uri;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;->isCurrentWallpaper(Landroid/content/Context;Landroid/net/Uri;)Z

    move-result p1

    if-nez p1, :cond_1

    .line 416
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getData()Landroid/net/Uri;

    move-result-object p2

    invoke-static {p1, p2, v0}, Lcom/sonymobile/scan3d/storageservice/provider/FileTasks;->deleteFileSet(Landroid/content/Context;Landroid/net/Uri;Z)V

    .line 417
    sget-object p1, Lcom/sonymobile/scan3d/analytics/HitEvent;->DELETE:Lcom/sonymobile/scan3d/analytics/HitEvent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getContext()Landroid/content/Context;

    move-result-object p2

    const-wide/16 v0, 0x1

    invoke-virtual {p1, p2, v0, v1}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;J)V

    .line 418
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentActivity;->finish()V

    :cond_1
    :goto_0
    :pswitch_3
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1f42
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 273
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->onCreate(Landroid/os/Bundle;)V

    .line 274
    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mPermissionsHandler:Landroid/os/Handler;

    return-void
.end method

.method public onCreateLoader(ILandroid/os/Bundle;)Landroidx/loader/content/Loader;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/os/Bundle;",
            ")",
            "Landroidx/loader/content/Loader<",
            "Landroid/database/Cursor;",
            ">;"
        }
    .end annotation

    .line 798
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    invoke-static {p1}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide p1

    .line 799
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "parent_id=?"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    .line 800
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    aput-object p1, v2, p2

    .line 799
    invoke-static {v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->createImprovementLoader(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;)Landroidx/loader/content/CursorLoader;

    move-result-object p1

    return-object p1
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2

    .line 279
    invoke-super {p0, p1, p2, p3}, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object p2

    const v0, 0x7f10024a

    const/4 v1, 0x1

    .line 280
    invoke-virtual {p0, v0, v1}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->showProgressDialog(IZ)V

    .line 282
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v0, p0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->setMeshLoadingListener(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$MeshLoadingListener;)V

    const v0, 0x7f0900e8

    .line 283
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/viewer/HintView;

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mHintView:Lcom/sonymobile/scan3d/viewer/HintView;

    if-eqz p3, :cond_0

    const-string v0, "promo_dismissed"

    const/4 v1, 0x0

    .line 286
    invoke-virtual {p3, v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mIsPromoHintDismissed:Z

    const-string v0, "animation_toggle"

    .line 287
    invoke-virtual {p3, v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result p3

    iput p3, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mAnimationToggle:I

    :cond_0
    const p3, 0x7f09005f

    .line 290
    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/view/ViewGroup;

    if-eqz p3, :cond_1

    .line 292
    invoke-direct {p0, p1, p3}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->setupBottomBar(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V

    :cond_1
    const p1, 0x7f09012f

    .line 296
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .line 297
    new-instance p3, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$GS4kwag8FvL4qM-WhBpyraqBIZE;

    invoke-direct {p3, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$GS4kwag8FvL4qM-WhBpyraqBIZE;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;)V

    invoke-virtual {p1, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 298
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getNavigationAccessibility()I

    move-result p3

    invoke-virtual {p0, p3}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    const p1, 0x7f090220

    .line 300
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mNameView:Landroid/widget/TextView;

    const p1, 0x7f090140

    .line 303
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .line 304
    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p3, 0x7f100038

    .line 305
    invoke-virtual {p0, p3}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    const p1, 0x7f0901e5

    .line 307
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ToggleButton;

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mTextureToggle:Landroid/widget/ToggleButton;

    const p1, 0x7f0901e6

    .line 308
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p1, 0x7f0901f7

    .line 310
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ViewSwitcher;

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mAnimationViewSwitcher:Landroid/widget/ViewSwitcher;

    .line 311
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mAnimationViewSwitcher:Landroid/widget/ViewSwitcher;

    iget p3, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mAnimationToggle:I

    invoke-virtual {p1, p3}, Landroid/widget/ViewSwitcher;->setDisplayedChild(I)V

    .line 312
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mAnimationViewSwitcher:Landroid/widget/ViewSwitcher;

    invoke-virtual {p1, p0}, Landroid/widget/ViewSwitcher;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 314
    new-instance p1, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$CqTpdsMAW7bWuQ9wws_-8C2kKRI;

    invoke-direct {p1, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$CqTpdsMAW7bWuQ9wws_-8C2kKRI;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;)V

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mFileSetChangeRunnable:Ljava/lang/Runnable;

    const p1, 0x7f09014c

    .line 321
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mPermissionsContainer:Landroid/view/View;

    return-object p2
.end method

.method public onDetach()V
    .locals 1

    .line 384
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    if-eqz v0, :cond_0

    .line 385
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->disableFileSetObserver()V

    .line 387
    :cond_0
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->onDetach()V

    return-void
.end method

.method public onLoadFinished(Landroidx/loader/content/Loader;Landroid/database/Cursor;)V
    .locals 0
    .param p1    # Landroidx/loader/content/Loader;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/loader/content/Loader<",
            "Landroid/database/Cursor;",
            ">;",
            "Landroid/database/Cursor;",
            ")V"
        }
    .end annotation

    .line 805
    invoke-static {p2}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->createImprovementRecords(Landroid/database/Cursor;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mImprovements:Ljava/util/List;

    .line 807
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentActivity;->reportFullyDrawn()V

    .line 808
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->notifyLoadFinished()V

    return-void
.end method

.method public bridge synthetic onLoadFinished(Landroidx/loader/content/Loader;Ljava/lang/Object;)V
    .locals 0
    .param p1    # Landroidx/loader/content/Loader;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 106
    check-cast p2, Landroid/database/Cursor;

    invoke-virtual {p0, p1, p2}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->onLoadFinished(Landroidx/loader/content/Loader;Landroid/database/Cursor;)V

    return-void
.end method

.method public onLoaderReset(Landroidx/loader/content/Loader;)V
    .locals 0
    .param p1    # Landroidx/loader/content/Loader;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/loader/content/Loader<",
            "Landroid/database/Cursor;",
            ">;)V"
        }
    .end annotation

    return-void
.end method

.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 3

    .line 497
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    packed-switch p1, :pswitch_data_0

    :pswitch_0
    goto :goto_0

    .line 518
    :pswitch_1
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->WEBVIEWER:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getFileSet()Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v1

    sget-object v2, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->DEFAULT:Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    invoke-virtual {p1, v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->view(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;)V

    goto :goto_0

    .line 526
    :pswitch_2
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->WEBVIEWER:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getFileSet()Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v1

    sget-object v2, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->PROPS:Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    invoke-virtual {p1, v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->view(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;)V

    goto :goto_0

    .line 522
    :pswitch_3
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->WEBVIEWER:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getFileSet()Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v1

    sget-object v2, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->ANIMATION:Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    invoke-virtual {p1, v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->view(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;)V

    goto :goto_0

    .line 503
    :pswitch_4
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->showUnshareDialog()V

    goto :goto_0

    .line 500
    :pswitch_5
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->showEditNameDialog()V

    goto :goto_0

    .line 506
    :pswitch_6
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->showDetailsDialog()V

    goto :goto_0

    :pswitch_7
    const/4 p1, 0x3

    const v0, 0x7f1000c5

    const v1, 0x7f1002ae

    .line 513
    invoke-direct {p0, p1, v0, v1}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->showDeleteDialog(III)V

    goto :goto_0

    :pswitch_8
    const/4 p1, 0x0

    const v0, 0x7f1000c6

    const v1, 0x7f1002ac

    .line 509
    invoke-direct {p0, p1, v0, v1}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->showDeleteDialog(III)V

    :goto_0
    const/4 p1, 0x1

    return p1

    nop

    :pswitch_data_0
    .packed-switch 0x7f090119
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_0
        :pswitch_0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public onMeshLoadFailed(Landroid/net/Uri;)V
    .locals 0

    .line 586
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->handleFailedMesh()V

    return-void
.end method

.method public onMeshLoaded(Landroid/net/Uri;Lcom/sonymobile/scan3d/viewer/ModelContainer;)V
    .locals 4

    .line 541
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 543
    invoke-static {}, Lcom/sonymobile/scan3d/animation/RigModelManager;->getInstance()Lcom/sonymobile/scan3d/animation/RigModelManager;

    move-result-object v0

    if-eqz p1, :cond_0

    .line 544
    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/animation/RigModelManager;->isRigging(Landroid/net/Uri;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 545
    invoke-virtual {v0, p1, p0}, Lcom/sonymobile/scan3d/animation/RigModelManager;->addListener(Landroid/net/Uri;Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$GltfConversionListener;)V

    .line 547
    :cond_0
    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mModelContainer:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    .line 548
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mNameView:Landroid/widget/TextView;

    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 549
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->isResumed()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 550
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mFileSetChangeRunnable:Ljava/lang/Runnable;

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->setFileSetChangeRunnable(Ljava/lang/Runnable;)V

    .line 551
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mFileSetChangeRunnable:Ljava/lang/Runnable;

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 553
    :cond_1
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->enableWebviewStatusUpdates()V

    .line 555
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getFileSet()Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object p1

    .line 556
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getView()Landroid/view/View;

    move-result-object p2

    if-eqz p2, :cond_6

    .line 559
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->isRiggable()Z

    move-result v0

    const/16 v1, 0x8

    const v2, 0x7f09002a

    const/4 v3, 0x0

    if-eqz v0, :cond_2

    .line 560
    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    .line 562
    :cond_2
    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 565
    :goto_0
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getScanType()I

    move-result p1

    const/16 v0, 0x100

    if-eq p1, v0, :cond_4

    const/16 v0, 0x101

    if-ne p1, v0, :cond_3

    goto :goto_1

    :cond_3
    move p1, v3

    goto :goto_2

    :cond_4
    :goto_1
    const/4 p1, 0x1

    :goto_2
    const v0, 0x7f090037

    if-eqz p1, :cond_5

    .line 567
    invoke-static {}, Lcom/sonymobile/scan3d/Scan3DApp;->isCustomFaceMimicEnabled()Z

    move-result p1

    if-eqz p1, :cond_5

    .line 568
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_3

    .line 570
    :cond_5
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 573
    :goto_3
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->updateSharingBarItemWidths()V

    .line 575
    :cond_6
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->notifyLoadFinished()V

    :cond_7
    return-void
.end method

.method public onMeshLoading(Landroid/net/Uri;)V
    .locals 0

    return-void
.end method

.method public onMeshesLoadedIntoSphan(ZZ)V
    .locals 0

    if-eqz p1, :cond_0

    .line 484
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mTextureToggle:Landroid/widget/ToggleButton;

    iget-boolean p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mUseUntexturedShading:Z

    invoke-virtual {p1, p2}, Landroid/widget/ToggleButton;->setChecked(Z)V

    .line 485
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->notifyLoadFinished()V

    goto :goto_0

    .line 487
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->handleFailedMesh()V

    :goto_0
    return-void
.end method

.method public onNameChanged(Ljava/lang/String;)V
    .locals 1

    .line 787
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->setName(Ljava/lang/String;)V

    .line 788
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mNameView:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public onNegativeAnswer(ILandroid/os/Parcelable;)V
    .locals 0

    return-void
.end method

.method public onPause()V
    .locals 3

    .line 356
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->onPause()V

    .line 357
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 358
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->setFileSetChangeRunnable(Ljava/lang/Runnable;)V

    .line 362
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    if-eqz v0, :cond_0

    .line 363
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v2}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->getViewMatrix()[F

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->setViewerViewMatrix([F)V

    .line 368
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    new-instance v2, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$eb3-WwV41NEuMVuDcvvuZtkmB1c;

    invoke-direct {v2, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$eb3-WwV41NEuMVuDcvvuZtkmB1c;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;)V

    invoke-virtual {v0, v2}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->queueEvent(Ljava/lang/Runnable;)V

    .line 375
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mConnectionUtils:Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;

    if-eqz v0, :cond_1

    .line 376
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;->removeListener()V

    .line 377
    iput-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mConnectionUtils:Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;

    .line 379
    :cond_1
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->dismissProgressDialog()V

    return-void
.end method

.method public onPositiveAnswer(ILandroid/os/Parcelable;)V
    .locals 2

    packed-switch p1, :pswitch_data_0

    .line 629
    new-instance p2, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "YesNoDialog with id = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " is not supported"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 613
    :pswitch_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getData()Landroid/net/Uri;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/storageservice/provider/FileTasks;->deleteAnimation(Landroid/content/Context;Landroid/net/Uri;)V

    const/4 p1, 0x0

    .line 615
    iput p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mAnimationToggle:I

    .line 619
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    new-instance p2, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$uwBrGAkHATOKFKyXqEPAK0VD2Mw;

    invoke-direct {p2, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$uwBrGAkHATOKFKyXqEPAK0VD2Mw;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;)V

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->queueEvent(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 597
    :pswitch_1
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->WEBVIEWER:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getContext()Landroid/content/Context;

    move-result-object p2

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getFileSet()Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->unshare(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V

    goto :goto_0

    .line 609
    :pswitch_2
    new-instance p1, Landroid/content/Intent;

    const-string p2, "android.intent.action.SET_WALLPAPER"

    invoke-direct {p1, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/16 p2, 0x1f42

    .line 610
    invoke-virtual {p0, p1, p2}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0

    .line 600
    :pswitch_3
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getData()Landroid/net/Uri;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;->isCurrentWallpaper(Landroid/content/Context;Landroid/net/Uri;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 601
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->showChangeWallpaperDialog()V

    goto :goto_0

    .line 603
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getData()Landroid/net/Uri;

    move-result-object p2

    const/4 v0, 0x1

    invoke-static {p1, p2, v0}, Lcom/sonymobile/scan3d/storageservice/provider/FileTasks;->deleteFileSet(Landroid/content/Context;Landroid/net/Uri;Z)V

    .line 604
    sget-object p1, Lcom/sonymobile/scan3d/analytics/HitEvent;->DELETE:Lcom/sonymobile/scan3d/analytics/HitEvent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getContext()Landroid/content/Context;

    move-result-object p2

    const-wide/16 v0, 0x1

    invoke-virtual {p1, p2, v0, v1}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;J)V

    .line 605
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentActivity;->finish()V

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 3
    .param p2    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # [I
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    move v1, v0

    .line 755
    :goto_0
    array-length v2, p2

    if-ge v1, v2, :cond_1

    .line 756
    aget v2, p3, v1

    if-eqz v2, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x1

    :goto_1
    const/16 p2, 0x3e8

    if-ne p1, p2, :cond_4

    .line 765
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mPermissionsHandler:Landroid/os/Handler;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    if-eqz v0, :cond_3

    .line 767
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mPermissionsContainer:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result p1

    if-nez p1, :cond_2

    .line 768
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mPermissionsHandler:Landroid/os/Handler;

    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mPermissionsContainer:Landroid/view/View;

    invoke-static {p2}, Lcom/sonymobile/scan3d/PermissionUtil;->removePermissionsContainer(Landroid/view/View;)Ljava/lang/Runnable;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 771
    :cond_2
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->launchFaceMimic()V

    goto :goto_2

    .line 773
    :cond_3
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mPermissionsHandler:Landroid/os/Handler;

    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mPermissionsContainer:Landroid/view/View;

    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/PermissionUtil;->showPermissionsSnackbar(Landroid/os/Handler;Landroid/view/View;)V

    :goto_2
    return-void

    .line 777
    :cond_4
    new-instance p2, Ljava/lang/IllegalStateException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Unexpected permission result code, "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public onResume()V
    .locals 2

    .line 329
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getViewerViewMatrix()[F

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mViewMatrix:[F

    .line 331
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->onResume()V

    .line 333
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mFileSetChangeRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->setFileSetChangeRunnable(Ljava/lang/Runnable;)V

    .line 334
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mFileSetChangeRunnable:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 341
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->updateAnimationState()V

    .line 343
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mConnectionUtils:Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;

    if-nez v0, :cond_0

    .line 344
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mConnectionUtils:Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;

    .line 350
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->notifyLoadFinished()V

    :cond_0
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    .line 405
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    const-string v0, "promo_dismissed"

    .line 406
    iget-boolean v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mIsPromoHintDismissed:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v0, "animation_toggle"

    .line 407
    iget v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mAnimationToggle:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    return-void
.end method

.method public onStart(Lcom/sonymobile/scan3d/SimpleLifecycle$SimpleLifecycleOwner;)V
    .locals 1

    .line 392
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->setBackground(I)V

    .line 393
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->setPlainShading(Z)V

    .line 394
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->isEffectActive()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 395
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->stopEffect()V

    :cond_0
    return-void
.end method

.method public onStop(Lcom/sonymobile/scan3d/SimpleLifecycle$SimpleLifecycleOwner;)V
    .locals 0

    return-void
.end method

.method public onWifiConnected()V
    .locals 2

    .line 823
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mHintView:Lcom/sonymobile/scan3d/viewer/HintView;

    new-instance v1, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$lhCIkmXwrlP69KbpbQZH_m-WDyI;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$lhCIkmXwrlP69KbpbQZH_m-WDyI;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;)V

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/HintView;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public onWifiDisconnected()V
    .locals 2

    .line 828
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->mHintView:Lcom/sonymobile/scan3d/viewer/HintView;

    new-instance v1, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$lhCIkmXwrlP69KbpbQZH_m-WDyI;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$lhCIkmXwrlP69KbpbQZH_m-WDyI;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;)V

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/HintView;->post(Ljava/lang/Runnable;)Z

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
