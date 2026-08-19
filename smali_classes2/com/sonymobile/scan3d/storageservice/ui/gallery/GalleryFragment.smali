.class public Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;
.super Lcom/sonymobile/scan3d/storageservice/ui/fragment/SyncFragment;
.source "GalleryFragment.java"

# interfaces
.implements Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$OnRefreshListener;
.implements Landroidx/loader/app/LoaderManager$LoaderCallbacks;
.implements Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;
.implements Landroid/view/ScaleGestureDetector$OnScaleGestureListener;
.implements Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$IScanChoiceListener;
.implements Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortOrderDialog$OnSortOrderSelectionListener;
.implements Lcom/sonymobile/scan3d/storageservice/ui/IOnScanMenuItemClickListener;
.implements Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment$OnYesNoListener;
.implements Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$OnIdleListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/sonymobile/scan3d/storageservice/ui/fragment/SyncFragment;",
        "Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$OnRefreshListener;",
        "Landroidx/loader/app/LoaderManager$LoaderCallbacks<",
        "Landroid/database/Cursor;",
        ">;",
        "Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;",
        "Landroid/view/ScaleGestureDetector$OnScaleGestureListener;",
        "Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$IScanChoiceListener;",
        "Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortOrderDialog$OnSortOrderSelectionListener;",
        "Lcom/sonymobile/scan3d/storageservice/ui/IOnScanMenuItemClickListener;",
        "Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment$OnYesNoListener;",
        "Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$OnIdleListener;"
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final COACH_MARK_START_SCAN:I = 0x0

.field public static final DEFAULT_MAX_NUMBER_OF_FAB_TIP_PRESENTATIONS:I = 0x3

.field private static final DEFAULT_SPAN_COUNT_LANDSCAPE:I = 0x3

.field static final DEFAULT_SPAN_COUNT_PORTRAIT:I = 0x2

.field private static final DIALOG_TAG:Ljava/lang/String; = "dialog_tag"

.field private static final FILESET_LOADER_ID:I = 0x0

.field private static final IMPROVEMENT_LOADER_ID:I = 0x1

.field public static final INTENT_ACTION_SHORTCUT:Ljava/lang/String; = "com.sonymobile.scan3d.ACTION_SHORTCUT"

.field private static final KEY_EXCLUDED_URIS:Ljava/lang/String; = "exclude_uris"

.field private static final KEY_EXPLANATORY_TEXT:Ljava/lang/String; = "explanatory_text"

.field private static final KEY_SCAN_TYPES:Ljava/lang/String; = "scan_types"

.field private static final KEY_SHOW_PROMOTIONS:Ljava/lang/String; = "show_promotions"

.field private static final LOG_TAG:Ljava/lang/String; = "com.sonymobile.scan3d.storageservice.ui.gallery.GalleryFragment"

.field private static final PERMISSION_REQUEST_CODE_SCAN:I = 0x2328

.field private static final QUESTION_ID_UNSHARE:I = 0x2

.field private static final REQUEST_CODE_ADV_SCAN:I = 0x7d2

.field private static final REQUEST_CODE_ANY_SCAN_FROM_APP_SHORTCUT:I = 0x7d5

.field private static final REQUEST_CODE_CONFIRM_PERMISSIONS:I = 0x1f40

.field private static final REQUEST_CODE_FACE_SCAN:I = 0x7d1

.field private static final REQUEST_CODE_FIRST_TIME_ADVANCE_SCAN:I = 0x89b

.field private static final REQUEST_CODE_FIRST_TIME_FOOD_SCAN:I = 0x89a

.field private static final REQUEST_CODE_FIRST_TIME_TUTORIAL_FACE_SCAN:I = 0x899

.field private static final REQUEST_CODE_FIRST_TIME_TUTORIAL_HEAD_SCAN:I = 0x898

.field private static final REQUEST_CODE_FIRST_TIME_TUTORIAL_SELFIE_SCAN:I = 0x89c

.field private static final REQUEST_CODE_FOOD_SCAN:I = 0x7d3

.field private static final REQUEST_CODE_GOOD_JOB_FACE_SCAN:I = 0x8fd

.field private static final REQUEST_CODE_GOOD_JOB_FOOD_SCAN:I = 0x8fe

.field private static final REQUEST_CODE_GOOD_JOB_HEAD_SCAN:I = 0x8fc

.field private static final REQUEST_CODE_GOOD_JOB_SELFIE_SCAN:I = 0x8ff

.field private static final REQUEST_CODE_HEAD_SCAN:I = 0x7d0

.field private static final REQUEST_CODE_PRACTICE_FACE_SCAN:I = 0x835

.field private static final REQUEST_CODE_PRACTICE_FOOD_SCAN:I = 0x836

.field private static final REQUEST_CODE_PRACTICE_HEAD_SCAN:I = 0x834

.field private static final REQUEST_CODE_PRACTICE_SELFIE_SCAN:I = 0x837

.field private static final REQUEST_CODE_SELFIE_SCAN:I = 0x7d4

.field private static final REQUEST_CODE_SIGN_IN:I = 0x2710

.field private static final SCAN_PERMISSIONS:[Ljava/lang/String;

.field private static final SECONDS_BETWEEN_FAB_TIP_PRESENTATIONS:I = 0x1e

.field private static final SHARED_MESHES_LOADER_ID:I = 0x2

.field private static final SHARED_SCAN:Ljava/lang/String; = "1"


# instance fields
.field private mCache:Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;

.field private mConfig:Landroid/content/res/Configuration;

.field private mFab:Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;

.field private mGalleryAdapter:Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;

.field private mGestureDetector:Landroid/view/ScaleGestureDetector;

.field private mIsPicker:Z

.field private mPermissionsContainer:Landroid/view/View;

.field private mPermissionsHandler:Landroid/os/Handler;

.field private mPreferences:Landroid/content/SharedPreferences;

.field private mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

.field private mRefreshLayout:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

.field private mScaleStart:F

.field private mShowPromotions:Z

.field private mSortType:Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "android.permission.CAMERA"

    .line 253
    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->SCAN_PERMISSIONS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 381
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SyncFragment;-><init>()V

    .line 382
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mCache:Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;

    const/4 v0, 0x1

    .line 383
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->setHasOptionsMenu(Z)V

    return-void
.end method

.method static synthetic access$000(Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;)Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;
    .locals 0

    .line 90
    iget-object p0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mGalleryAdapter:Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;

    return-object p0
.end method

.method private addCoachMarkIdleListener()V
    .locals 3

    .line 1028
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    .line 1030
    instance-of v1, v0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;

    if-eqz v1, :cond_0

    .line 1031
    check-cast v0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;

    const/4 v1, 0x0

    const/4 v2, 0x5

    .line 1032
    invoke-virtual {v0, v1, p0, v2}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->addIdleListener(ILcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$OnIdleListener;I)V

    :cond_0
    return-void
.end method

.method private canShowTip(Z)Z
    .locals 3

    const v0, 0x7f1001e9

    .line 1055
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 1056
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mPreferences:Landroid/content/SharedPreferences;

    const/4 v2, 0x3

    invoke-interface {v1, v0, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 1058
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    const/4 v2, 0x1

    if-lez v1, :cond_0

    if-eqz p1, :cond_1

    .line 1063
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mPreferences:Landroid/content/SharedPreferences;

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    sub-int/2addr v1, v2

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :cond_1
    :goto_0
    return v2
.end method

.method private disableTip()V
    .locals 3

    .line 1076
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const v1, 0x7f1001e9

    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method private firstTimeInsertExampleScans()V
    .locals 4

    .line 928
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mPreferences:Landroid/content/SharedPreferences;

    const v1, 0x7f1001d1

    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 929
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/provider/FileTasks;->insertExampleScans(Landroid/content/Context;)V

    .line 930
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_0
    return-void
.end method

.method private getDefaultSpanCount()I
    .locals 2

    .line 896
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mConfig:Landroid/content/res/Configuration;

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x2

    goto :goto_0

    :cond_0
    const/4 v0, 0x3

    :goto_0
    return v0
.end method

.method private getSavedSpanCount(Landroid/content/Context;)I
    .locals 2

    .line 1263
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mPreferences:Landroid/content/SharedPreferences;

    const v1, 0x7f1001d6

    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    .line 1264
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getDefaultSpanCount()I

    move-result v1

    .line 1263
    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    return p1
.end method

.method private getStoredSortType()Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;
    .locals 3

    const v0, 0x7f1001d5

    .line 1273
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 1274
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mPreferences:Landroid/content/SharedPreferences;

    sget-object v2, Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;->DATE:Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;

    invoke-virtual {v2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;->name()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;->valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;

    move-result-object v0

    return-object v0
.end method

.method public static synthetic lambda$onCreateView$0(Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1

    .line 632
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result p1

    const/4 v0, 0x2

    if-ne p1, v0, :cond_0

    .line 633
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mGestureDetector:Landroid/view/ScaleGestureDetector;

    invoke-virtual {p1, p2}, Landroid/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public static synthetic lambda$onCreateView$1(Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1

    .line 642
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getHeight()I

    move-result p1

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getPaddingBottom()I

    move-result v0

    sub-int/2addr p1, v0

    .line 643
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p2

    int-to-float p1, p1

    div-float/2addr p2, p1

    .line 644
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I

    move-result p1

    int-to-float p1, p1

    mul-float/2addr p2, p1

    float-to-int p1, p2

    .line 645
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p2, p1}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    const/4 p1, 0x1

    return p1
.end method

.method public static synthetic lambda$onCreateView$2(Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;Landroid/view/View;)V
    .locals 1

    .line 663
    sget-object p1, Lcom/sonymobile/scan3d/analytics/HitEvent;->GALLERY_3D_BUTTON_CLICKED:Lcom/sonymobile/scan3d/analytics/HitEvent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;)V

    .line 665
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    sget-object v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->SCAN_PERMISSIONS:[Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/PermissionUtil;->getMissingPermissions(Landroid/content/Context;[Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    .line 667
    array-length v0, p1

    if-lez v0, :cond_0

    const/16 v0, 0x2328

    .line 668
    invoke-virtual {p0, p1, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->requestPermissions([Ljava/lang/String;I)V

    goto :goto_0

    .line 670
    :cond_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->openScanModeSelection()V

    :goto_0
    return-void
.end method

.method public static synthetic lambda$setupPermissionsButton$3(Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;[Ljava/lang/String;ILandroid/view/View;)V
    .locals 1

    .line 1537
    iget-object p3, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mPermissionsContainer:Landroid/view/View;

    const/4 v0, 0x4

    invoke-virtual {p3, v0}, Landroid/view/View;->setVisibility(I)V

    .line 1538
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p3

    invoke-static {p3, p1}, Lcom/sonymobile/scan3d/PermissionUtil;->shouldShowRequestPermissionRationale(Landroid/app/Activity;[Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_0

    .line 1540
    invoke-virtual {p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->requestPermissions([Ljava/lang/String;I)V

    goto :goto_0

    .line 1542
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/sonymobile/scan3d/PermissionUtil;->startAppSettings(Landroid/content/Context;)V

    :goto_0
    return-void
.end method

.method public static newInstance([ILjava/util/ArrayList;Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;
    .locals 3
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([I",
            "Ljava/util/ArrayList<",
            "Landroid/net/Uri;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;"
        }
    .end annotation

    .line 372
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;-><init>()V

    .line 373
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "scan_types"

    .line 374
    invoke-virtual {v1, v2, p0}, Landroid/os/Bundle;->putIntArray(Ljava/lang/String;[I)V

    const-string p0, "exclude_uris"

    .line 375
    invoke-virtual {v1, p0, p1}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    const-string p0, "explanatory_text"

    .line 376
    invoke-virtual {v1, p0, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 377
    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->setArguments(Landroid/os/Bundle;)V

    return-object v0
.end method

.method private onScanCreated()V
    .locals 0

    .line 1113
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->disableTip()V

    .line 1114
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->removeCoachMarkIdleListener()V

    return-void
.end method

.method private openScanModeSelection()V
    .locals 3

    .line 1103
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mFab:Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->hide()V

    .line 1104
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->disableTip()V

    .line 1105
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment;->newInstance(Landroidx/fragment/app/Fragment;)Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment;

    move-result-object v0

    .line 1106
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    const-class v2, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroidx/fragment/app/DialogFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method private removeCoachMarkIdleListener()V
    .locals 2

    .line 1040
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    .line 1042
    instance-of v1, v0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;

    if-eqz v1, :cond_0

    .line 1043
    check-cast v0, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;

    const/4 v1, 0x0

    .line 1044
    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->removeIdleListener(I)V

    :cond_0
    return-void
.end method

.method private setSortType(Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;)V
    .locals 2

    .line 940
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mSortType:Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;

    if-eq v0, p1, :cond_0

    .line 941
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mSortType:Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;

    const p1, 0x7f1001d5

    .line 944
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getString(I)Ljava/lang/String;

    move-result-object p1

    .line 945
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 946
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mSortType:Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;->name()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 949
    invoke-static {p0}, Landroidx/loader/app/LoaderManager;->getInstance(Landroidx/lifecycle/LifecycleOwner;)Landroidx/loader/app/LoaderManager;

    move-result-object p1

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 950
    invoke-virtual {p1, v0, v1, p0}, Landroidx/loader/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroidx/loader/app/LoaderManager$LoaderCallbacks;)Landroidx/loader/content/Loader;

    :cond_0
    return-void
.end method

.method private setupPermissionsButton(I[Ljava/lang/String;I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 1533
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mPermissionsContainer:Landroid/view/View;

    const v1, 0x7f09014e

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 1534
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 1535
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mPermissionsContainer:Landroid/view/View;

    const v0, 0x7f09014b

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    .line 1536
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/-$$Lambda$GalleryFragment$SrVsFaMxF6-a8VWcZeJ-z5H-FJA;

    invoke-direct {v0, p0, p2, p3}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/-$$Lambda$GalleryFragment$SrVsFaMxF6-a8VWcZeJ-z5H-FJA;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;[Ljava/lang/String;I)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private showFragment(Landroidx/fragment/app/Fragment;)V
    .locals 3

    .line 918
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    .line 919
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object v0

    const/high16 v1, 0x10b0000

    const v2, 0x10b0001

    .line 920
    invoke-virtual {v0, v1, v2}, Landroidx/fragment/app/FragmentTransaction;->setCustomAnimations(II)Landroidx/fragment/app/FragmentTransaction;

    .line 921
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const v2, 0x7f090096

    invoke-virtual {v0, v2, p1, v1}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/FragmentTransaction;

    const/4 p1, 0x0

    .line 922
    invoke-virtual {v0, p1}, Landroidx/fragment/app/FragmentTransaction;->addToBackStack(Ljava/lang/String;)Landroidx/fragment/app/FragmentTransaction;

    .line 923
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentTransaction;->commit()I

    return-void
.end method

.method private showUnshareDialog(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V
    .locals 4

    const/4 v0, 0x2

    const v1, 0x7f1000e7

    const v2, 0x7f1000e6

    const v3, 0x7f1002af

    .line 1283
    invoke-static {v0, v1, v2, v3, p1}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->newInstance(IIIILandroid/os/Parcelable;)Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;

    move-result-object p1

    const/4 v0, 0x0

    .line 1288
    invoke-virtual {p1, p0, v0}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->setTargetFragment(Landroidx/fragment/app/Fragment;I)V

    .line 1289
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    const-string v1, "dialog_tag"

    invoke-virtual {p1, v0, v1}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method private signIn()V
    .locals 3

    .line 904
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 907
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;

    invoke-direct {v1, v0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/16 v0, 0x2710

    invoke-virtual {p0, v1, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->startActivityForResult(Landroid/content/Intent;I)V

    :cond_0
    return-void
.end method

.method private startAdvScan()V
    .locals 3

    .line 1121
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    const-class v2, Lcom/sonymobile/scan3d/Scan3dActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "policy"

    const/4 v2, 0x2

    .line 1122
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const/16 v1, 0x7d2

    .line 1123
    invoke-virtual {p0, v0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method private startConfirmPermissions()V
    .locals 3

    .line 1252
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/sonymobile/scan3d/ScanningPermissionsActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/16 v1, 0x1f40

    .line 1253
    invoke-virtual {p0, v0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method private startFaceScan()V
    .locals 3

    .line 1139
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    const-class v2, Lcom/sonymobile/scan3d/Scan3dActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "policy"

    const/4 v2, 0x0

    .line 1140
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const/16 v1, 0x7d1

    .line 1141
    invoke-virtual {p0, v0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method private startFaceScanPractice()V
    .locals 3

    .line 1166
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    const-class v2, Lcom/sonymobile/scan3d/Scan3dActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "policy"

    const/16 v2, 0xa

    .line 1167
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const/16 v1, 0x835

    .line 1168
    invoke-virtual {p0, v0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method private startFoodScan()V
    .locals 3

    .line 1148
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    const-class v2, Lcom/sonymobile/scan3d/Scan3dActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "policy"

    const/4 v2, 0x3

    .line 1149
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const/16 v1, 0x7d3

    .line 1150
    invoke-virtual {p0, v0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method private startFoodScanPractice()V
    .locals 3

    .line 1184
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    const-class v2, Lcom/sonymobile/scan3d/Scan3dActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "policy"

    const/16 v2, 0xd

    .line 1185
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const/16 v1, 0x836

    .line 1186
    invoke-virtual {p0, v0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method private startHeadScan()V
    .locals 3

    .line 1130
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    const-class v2, Lcom/sonymobile/scan3d/Scan3dActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "policy"

    const/4 v2, 0x1

    .line 1131
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const/16 v1, 0x7d0

    .line 1132
    invoke-virtual {p0, v0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method private startHeadScanPractice()V
    .locals 3

    .line 1175
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    const-class v2, Lcom/sonymobile/scan3d/Scan3dActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "policy"

    const/16 v2, 0xb

    .line 1176
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const/16 v1, 0x834

    .line 1177
    invoke-virtual {p0, v0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method private startSelfieScan()V
    .locals 3

    .line 1157
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    const-class v2, Lcom/sonymobile/scan3d/Scan3dActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "policy"

    const/4 v2, 0x4

    .line 1158
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const/16 v1, 0x7d4

    .line 1159
    invoke-virtual {p0, v0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method private startSelfieScanPractice()V
    .locals 3

    .line 1193
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    const-class v2, Lcom/sonymobile/scan3d/Scan3dActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "policy"

    const/16 v2, 0xe

    .line 1194
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const/16 v1, 0x837

    .line 1195
    invoke-virtual {p0, v0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method private startTutorial(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;I)V
    .locals 4

    .line 1086
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    .line 1087
    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->getTipCategory(Landroid/content/Context;)Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;

    move-result-object v1

    .line 1089
    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity;

    invoke-direct {v2, v0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v3, "com.sonymobile.scan3d.extras.TIP_CATEGORY"

    .line 1090
    invoke-virtual {v2, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1091
    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->isTrainingModeCompleted(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "com.sonymobile.scan3d.extras.HAS_RUN"

    const/4 p2, 0x1

    .line 1092
    invoke-virtual {v2, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1093
    invoke-virtual {p0, v2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 1095
    :cond_0
    invoke-virtual {p0, v2, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->startActivityForResult(Landroid/content/Intent;I)V

    :goto_0
    return-void
.end method

.method private viewTutorialFaceScan(Landroid/net/Uri;ZZ)V
    .locals 1

    .line 1206
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0, p1, p2, p3}, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->getGoodJobFaceScanViewIntent(Landroid/content/Context;Landroid/net/Uri;ZZ)Landroid/content/Intent;

    move-result-object p1

    const/16 p2, 0x8fd

    .line 1208
    invoke-virtual {p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method private viewTutorialFoodScan(Landroid/net/Uri;Z)V
    .locals 1

    .line 1231
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0, p1, p2}, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->getGoodJobFoodScanViewIntent(Landroid/content/Context;Landroid/net/Uri;Z)Landroid/content/Intent;

    move-result-object p1

    const/16 p2, 0x8fe

    .line 1232
    invoke-virtual {p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method private viewTutorialHeadScan(Landroid/net/Uri;ZZ)V
    .locals 1

    .line 1219
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0, p1, p2, p3}, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->getGoodJobHeadScanViewIntent(Landroid/content/Context;Landroid/net/Uri;ZZ)Landroid/content/Intent;

    move-result-object p1

    const/16 p2, 0x8fc

    .line 1221
    invoke-virtual {p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method private viewTutorialSelfieScan(Landroid/net/Uri;ZZ)V
    .locals 1

    .line 1243
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0, p1, p2, p3}, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->getGoodJobSelfieScanViewIntent(Landroid/content/Context;Landroid/net/Uri;ZZ)Landroid/content/Intent;

    move-result-object p1

    const/16 p2, 0x8ff

    .line 1245
    invoke-virtual {p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 4

    .line 445
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SyncFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 447
    invoke-static {p0}, Landroidx/loader/app/LoaderManager;->getInstance(Landroidx/lifecycle/LifecycleOwner;)Landroidx/loader/app/LoaderManager;

    move-result-object p1

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 448
    invoke-virtual {p1, v1, v0, p0}, Landroidx/loader/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroidx/loader/app/LoaderManager$LoaderCallbacks;)Landroidx/loader/content/Loader;

    const/4 v1, 0x1

    .line 449
    invoke-virtual {p1, v1, v0, p0}, Landroidx/loader/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroidx/loader/app/LoaderManager$LoaderCallbacks;)Landroidx/loader/content/Loader;

    .line 451
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    const v3, 0x7f1001e8

    .line 455
    invoke-virtual {p0, v3}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 454
    invoke-interface {v2, v3, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x2

    .line 456
    invoke-virtual {p1, v1, v0, p0}, Landroidx/loader/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroidx/loader/app/LoaderManager$LoaderCallbacks;)Landroidx/loader/content/Loader;

    :cond_0
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 9

    .line 697
    invoke-super {p0, p1, p2, p3}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SyncFragment;->onActivityResult(IILandroid/content/Intent;)V

    const/16 v0, 0x1f40

    const/4 v1, 0x1

    if-eq p1, v0, :cond_6

    const/16 v0, 0x2710

    const/4 v2, -0x1

    if-eq p1, v0, :cond_5

    const/4 v0, 0x0

    packed-switch p1, :pswitch_data_0

    packed-switch p1, :pswitch_data_1

    packed-switch p1, :pswitch_data_2

    goto/16 :goto_0

    :pswitch_0
    if-eq p2, v2, :cond_0

    goto/16 :goto_0

    .line 704
    :cond_0
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->SELFIE:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->setSlideshowCompleted(Landroid/content/Context;)Z

    .line 705
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->startSelfieScanPractice()V

    goto/16 :goto_0

    :pswitch_1
    if-eq p2, v2, :cond_1

    goto/16 :goto_0

    .line 749
    :cond_1
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->ADVANCE:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->setSlideshowCompleted(Landroid/content/Context;)Z

    .line 750
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->startAdvScan()V

    goto/16 :goto_0

    :pswitch_2
    if-eq p2, v2, :cond_2

    goto/16 :goto_0

    .line 739
    :cond_2
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->FOOD:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->setSlideshowCompleted(Landroid/content/Context;)Z

    .line 740
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->startFoodScanPractice()V

    goto/16 :goto_0

    :pswitch_3
    if-eq p2, v2, :cond_3

    goto/16 :goto_0

    .line 716
    :cond_3
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->FACE:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->setSlideshowCompleted(Landroid/content/Context;)Z

    .line 717
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->startFaceScanPractice()V

    goto/16 :goto_0

    :pswitch_4
    if-eq p2, v2, :cond_4

    goto/16 :goto_0

    .line 728
    :cond_4
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->HEAD:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->setSlideshowCompleted(Landroid/content/Context;)Z

    .line 729
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->startHeadScanPractice()V

    goto/16 :goto_0

    :pswitch_5
    packed-switch p2, :pswitch_data_3

    goto/16 :goto_0

    .line 855
    :pswitch_6
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->startConfirmPermissions()V

    goto/16 :goto_0

    .line 848
    :pswitch_7
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->SELFIE:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->setTrainingModeCompleted(Landroid/content/Context;)Z

    move-result p1

    .line 849
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p2

    const-string v1, "long_scan"

    .line 850
    invoke-virtual {p3, v1, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p3

    .line 849
    invoke-direct {p0, p2, p3, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->viewTutorialSelfieScan(Landroid/net/Uri;ZZ)V

    .line 852
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->onScanCreated()V

    goto/16 :goto_0

    :pswitch_8
    packed-switch p2, :pswitch_data_4

    goto/16 :goto_0

    .line 836
    :pswitch_9
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->startConfirmPermissions()V

    goto/16 :goto_0

    .line 830
    :pswitch_a
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->FOOD:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->setTrainingModeCompleted(Landroid/content/Context;)Z

    .line 831
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    const-string p2, "long_scan"

    .line 832
    invoke-virtual {p3, p2, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p2

    .line 831
    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->viewTutorialFoodScan(Landroid/net/Uri;Z)V

    .line 833
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->onScanCreated()V

    goto/16 :goto_0

    :pswitch_b
    packed-switch p2, :pswitch_data_5

    goto/16 :goto_0

    .line 799
    :pswitch_c
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->startConfirmPermissions()V

    goto/16 :goto_0

    .line 792
    :pswitch_d
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->FACE:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->setTrainingModeCompleted(Landroid/content/Context;)Z

    move-result p1

    .line 793
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p2

    const-string v1, "long_scan"

    .line 794
    invoke-virtual {p3, v1, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p3

    .line 793
    invoke-direct {p0, p2, p3, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->viewTutorialFaceScan(Landroid/net/Uri;ZZ)V

    .line 796
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->onScanCreated()V

    goto/16 :goto_0

    :pswitch_e
    packed-switch p2, :pswitch_data_6

    goto/16 :goto_0

    .line 818
    :pswitch_f
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->startConfirmPermissions()V

    goto/16 :goto_0

    .line 811
    :pswitch_10
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->HEAD:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->setTrainingModeCompleted(Landroid/content/Context;)Z

    .line 812
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    const-string p2, "long_scan"

    .line 813
    invoke-virtual {p3, p2, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p2

    .line 812
    invoke-direct {p0, p1, p2, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->viewTutorialHeadScan(Landroid/net/Uri;ZZ)V

    .line 815
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->onScanCreated()V

    goto :goto_0

    :pswitch_11
    packed-switch p2, :pswitch_data_7

    goto :goto_0

    .line 780
    :pswitch_12
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->startConfirmPermissions()V

    goto :goto_0

    .line 765
    :pswitch_13
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    if-eqz p1, :cond_8

    const-string p1, "short_scan"

    .line 767
    invoke-virtual {p3, p1, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v5

    const-string p1, "long_scan"

    .line 769
    invoke-virtual {p3, p1, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v6

    const-string p1, "env_error"

    .line 771
    invoke-virtual {p3, p1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object p1

    move-object v7, p1

    check-cast v7, Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;

    const-string p1, "policy"

    .line 773
    invoke-virtual {p3, p1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v8

    .line 774
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v4

    invoke-static/range {v3 .. v8}, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->showInKeepDiscardMode(Landroid/content/Context;Landroid/net/Uri;ZZLcom/sonymobile/scan3d/EnvironmentError$ErrorType;I)V

    .line 776
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->onScanCreated()V

    goto :goto_0

    :cond_5
    if-ne p2, v2, :cond_8

    .line 877
    new-instance p1, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;

    invoke-direct {p1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/BackupSyncSettings;-><init>()V

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->showFragment(Landroidx/fragment/app/Fragment;)V

    .line 879
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->sync()V

    .line 881
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mGalleryAdapter:Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;

    invoke-virtual {p1, v1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->setIsSignedIn(Z)V

    .line 882
    sget-object p1, Lcom/sonymobile/scan3d/analytics/HitEvent;->USER_SIGNED_IN:Lcom/sonymobile/scan3d/analytics/HitEvent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getContext()Landroid/content/Context;

    move-result-object p2

    const-wide/16 v0, 0x1

    invoke-virtual {p1, p2, v0, v1}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;J)V

    goto :goto_0

    :cond_6
    if-eq p2, v1, :cond_7

    goto :goto_0

    .line 866
    :cond_7
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->openScanModeSelection()V

    :cond_8
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x7d0
        :pswitch_11
        :pswitch_11
        :pswitch_11
        :pswitch_11
        :pswitch_11
        :pswitch_11
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x834
        :pswitch_e
        :pswitch_b
        :pswitch_8
        :pswitch_5
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x898
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
    .end packed-switch

    :pswitch_data_4
    .packed-switch 0x1
        :pswitch_a
        :pswitch_9
    .end packed-switch

    :pswitch_data_5
    .packed-switch 0x1
        :pswitch_d
        :pswitch_c
    .end packed-switch

    :pswitch_data_6
    .packed-switch 0x1
        :pswitch_10
        :pswitch_f
    .end packed-switch

    :pswitch_data_7
    .packed-switch 0x1
        :pswitch_13
        :pswitch_12
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 8

    .line 388
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SyncFragment;->onCreate(Landroid/os/Bundle;)V

    .line 391
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 394
    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 397
    :goto_0
    instance-of v2, v1, Lcom/sonymobile/scan3d/storageservice/ui/IScanListener;

    if-eqz v2, :cond_4

    .line 398
    move-object v2, v1

    check-cast v2, Lcom/sonymobile/scan3d/storageservice/ui/IScanListener;

    .line 405
    invoke-static {v1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    iput-object v3, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mPreferences:Landroid/content/SharedPreferences;

    .line 406
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getStoredSortType()Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;

    move-result-object v3

    iput-object v3, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mSortType:Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;

    if-nez p1, :cond_1

    .line 409
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipParser;->isPromotionListPopulated(Landroid/content/Context;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mShowPromotions:Z

    const-string p1, "com.sonymobile.scan3d.ACTION_SHORTCUT"

    .line 410
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 412
    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v3, "com.sonymobile.scan3d.INTENT_EXTRA_SHORTCUT_POLICY_MODE"

    const/4 v4, -0x1

    invoke-virtual {p1, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    .line 414
    new-instance v3, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v4

    const-class v5, Lcom/sonymobile/scan3d/Scan3dActivity;

    invoke-direct {v3, v4, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v4, "policy"

    .line 415
    invoke-virtual {v3, v4, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const/16 p1, 0x7d5

    .line 416
    invoke-virtual {p0, v3, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_1

    :cond_1
    const-string v3, "show_promotions"

    .line 419
    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mShowPromotions:Z

    :cond_2
    :goto_1
    const-string p1, "android.intent.action.PICK"

    .line 422
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mIsPicker:Z

    .line 423
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "scan_types"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    move-result-object v6

    .line 424
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "exclude_uris"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v7

    .line 426
    new-instance p1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;

    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mIsPicker:Z

    if-nez v0, :cond_3

    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mShowPromotions:Z

    if-eqz v0, :cond_3

    const/4 v0, 0x1

    goto :goto_2

    :cond_3
    const/4 v0, 0x0

    :goto_2
    move v4, v0

    iget-boolean v5, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mIsPicker:Z

    move-object v0, p1

    move-object v3, p0

    invoke-direct/range {v0 .. v7}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;-><init>(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/ui/IScanListener;Lcom/sonymobile/scan3d/storageservice/ui/IOnScanMenuItemClickListener;ZZ[ILjava/util/ArrayList;)V

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mGalleryAdapter:Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;

    .line 432
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->firstTimeInsertExampleScans()V

    .line 434
    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mPermissionsHandler:Landroid/os/Handler;

    return-void

    .line 401
    :cond_4
    new-instance p1, Ljava/lang/ClassCastException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " must implement IScanListener"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/ClassCastException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public onCreateLoader(ILandroid/os/Bundle;)Landroidx/loader/content/Loader;
    .locals 2
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
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

    const/4 p2, 0x0

    packed-switch p1, :pswitch_data_0

    return-object p2

    :pswitch_0
    const-string p1, "visible=? AND (shared_meshes IS NULL OR shared_meshes = \'\' OR shared_meshes = 0)"

    const-string v0, "1"

    .line 976
    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    .line 977
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    invoke-static {v1, p1, v0, p2}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->createFileRecordLoader(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroidx/loader/content/CursorLoader;

    move-result-object p1

    return-object p1

    .line 970
    :pswitch_1
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-static {p1, p2, p2}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->createImprovementLoader(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;)Landroidx/loader/content/CursorLoader;

    move-result-object p1

    return-object p1

    .line 968
    :pswitch_2
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mSortType:Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;->getSqlExpression()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->createFileRecordLoader(Landroid/content/Context;Ljava/lang/String;)Landroidx/loader/content/CursorLoader;

    move-result-object p1

    return-object p1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 1

    const/high16 v0, 0x7f0d0000

    .line 530
    invoke-virtual {p2, v0, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 4

    .line 592
    sget-object p3, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->LOG_TAG:Ljava/lang/String;

    const-string v0, "onCreateView(): begin"

    invoke-static {p3, v0}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 593
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p3

    .line 595
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mConfig:Landroid/content/res/Configuration;

    const/4 v0, 0x0

    const v1, 0x7f0c0071

    .line 597
    invoke-virtual {p1, v1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f09010f

    .line 598
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroidx/recyclerview/widget/RecyclerView;

    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    const p2, 0x7f0900c5

    .line 600
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    .line 601
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "explanatory_text"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 602
    iget-boolean v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mIsPicker:Z

    const/16 v3, 0x8

    if-eqz v2, :cond_0

    if-eqz v1, :cond_0

    .line 603
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 604
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    .line 606
    :cond_0
    invoke-virtual {p2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 610
    :goto_0
    invoke-direct {p0, p3}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getSavedSpanCount(Landroid/content/Context;)I

    move-result p2

    .line 611
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mConfig:Landroid/content/res/Configuration;

    iget v1, v1, Landroid/content/res/Configuration;->orientation:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    const/4 v1, 0x2

    .line 612
    invoke-static {p2, v1}, Ljava/lang/Math;->min(II)I

    move-result p2

    .line 614
    :cond_1
    new-instance v1, Landroidx/recyclerview/widget/GridLayoutManager;

    invoke-direct {v1, p3, p2}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 615
    new-instance v2, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment$1;

    invoke-direct {v2, p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment$1;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;)V

    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/GridLayoutManager;->setSpanSizeLookup(Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;)V

    .line 623
    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mGalleryAdapter:Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;

    invoke-virtual {v2, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->setSpanCount(I)V

    .line 626
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p2, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 627
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mGalleryAdapter:Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;

    invoke-virtual {p2, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 630
    new-instance p2, Landroid/view/ScaleGestureDetector;

    invoke-direct {p2, p3, p0}, Landroid/view/ScaleGestureDetector;-><init>(Landroid/content/Context;Landroid/view/ScaleGestureDetector$OnScaleGestureListener;)V

    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mGestureDetector:Landroid/view/ScaleGestureDetector;

    .line 631
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    new-instance p3, Lcom/sonymobile/scan3d/storageservice/ui/gallery/-$$Lambda$GalleryFragment$pgcmGLXBkbg_tmsncaVTXS00E0w;

    invoke-direct {p3, p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/-$$Lambda$GalleryFragment$pgcmGLXBkbg_tmsncaVTXS00E0w;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;)V

    invoke-virtual {p2, p3}, Landroidx/recyclerview/widget/RecyclerView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    const p2, 0x7f0900de

    .line 640
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    new-instance p3, Lcom/sonymobile/scan3d/storageservice/ui/gallery/-$$Lambda$GalleryFragment$eBVjkjbnQPoswAFffWdA0bm362Q;

    invoke-direct {p3, p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/-$$Lambda$GalleryFragment$eBVjkjbnQPoswAFffWdA0bm362Q;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;)V

    invoke-virtual {p2, p3}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    const p2, 0x7f09014c

    .line 649
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mPermissionsContainer:Landroid/view/View;

    .line 652
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p2

    invoke-virtual {p2}, Landroidx/fragment/app/FragmentActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object p2

    if-eqz p2, :cond_2

    const p3, 0x7f10005c

    .line 654
    invoke-virtual {p2, p3}, Landroid/app/ActionBar;->setTitle(I)V

    .line 655
    invoke-virtual {p2, v0}, Landroid/app/ActionBar;->setHomeButtonEnabled(Z)V

    .line 656
    invoke-virtual {p2, v0}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    :cond_2
    const p2, 0x7f0900c6

    .line 660
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;

    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mFab:Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;

    .line 661
    iget-boolean p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mIsPicker:Z

    if-nez p2, :cond_3

    .line 662
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mFab:Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;

    new-instance p3, Lcom/sonymobile/scan3d/storageservice/ui/gallery/-$$Lambda$GalleryFragment$cG1EbWVsegr2EUsdq1P6Jnwd9aM;

    invoke-direct {p3, p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/-$$Lambda$GalleryFragment$cG1EbWVsegr2EUsdq1P6Jnwd9aM;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;)V

    invoke-virtual {p2, p3}, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 674
    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->canShowTip(Z)Z

    move-result p2

    if-eqz p2, :cond_4

    .line 676
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->addCoachMarkIdleListener()V

    goto :goto_1

    .line 679
    :cond_3
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mFab:Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;

    invoke-virtual {p2, v3}, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->setVisibility(I)V

    .line 682
    :cond_4
    :goto_1
    sget-object p2, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->LOG_TAG:Ljava/lang/String;

    const-string p3, "onCreateView(): end"

    invoke-static {p2, p3}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-object p1
.end method

.method public onDestroy()V
    .locals 1

    .line 462
    invoke-super {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SyncFragment;->onDestroy()V

    .line 464
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mCache:Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;->stop()V

    return-void
.end method

.method public onIdle(III)I
    .locals 0

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    .line 1504
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->canShowTip(Z)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 1505
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mFab:Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->showTip()V

    const/16 p1, 0x1e

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, -0x1

    :goto_1
    return p1
.end method

.method public onLoadFinished(Landroidx/loader/content/Loader;Landroid/database/Cursor;)V
    .locals 3
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

    .line 985
    invoke-virtual {p1}, Landroidx/loader/content/Loader;->getId()I

    move-result p1

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 997
    :pswitch_0
    invoke-interface {p2}, Landroid/database/Cursor;->getCount()I

    move-result p1

    if-lez p1, :cond_0

    .line 1000
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->sync()V

    goto :goto_0

    .line 1004
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    .line 1005
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const p2, 0x7f1001e8

    .line 1006
    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getString(I)Ljava/lang/String;

    move-result-object p2

    const/4 v0, 0x0

    .line 1005
    invoke-interface {p1, p2, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 1006
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_0

    .line 994
    :pswitch_1
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mGalleryAdapter:Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;

    invoke-static {p2}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->createImprovementRecords(Landroid/database/Cursor;)Ljava/util/List;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->setImprovements(Ljava/util/List;)V

    goto :goto_0

    .line 987
    :pswitch_2
    sget-object p1, Lcom/sonymobile/scan3d/analytics/HitEvent;->SCAN_COUNT:Lcom/sonymobile/scan3d/analytics/HitEvent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-interface {p2}, Landroid/database/Cursor;->getCount()I

    move-result v1

    int-to-long v1, v1

    invoke-virtual {p1, v0, v1, v2}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;J)V

    .line 988
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mGalleryAdapter:Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;

    invoke-static {p2}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->createFileRecords(Landroid/database/Cursor;)Ljava/util/List;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->setFileSets(Ljava/util/List;)V

    .line 991
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentActivity;->reportFullyDrawn()V

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public bridge synthetic onLoadFinished(Landroidx/loader/content/Loader;Ljava/lang/Object;)V
    .locals 0
    .param p1    # Landroidx/loader/content/Loader;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 90
    check-cast p2, Landroid/database/Cursor;

    invoke-virtual {p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->onLoadFinished(Landroidx/loader/content/Loader;Landroid/database/Cursor;)V

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

.method public onNegativeAnswer(ILandroid/os/Parcelable;)V
    .locals 0

    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 3

    .line 535
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const/4 v1, 0x1

    sparse-switch v0, :sswitch_data_0

    .line 550
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SyncFragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result p1

    return p1

    .line 537
    :sswitch_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mSortType:Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;

    invoke-static {p1, p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortOrderDialog;->newInstance(Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;Landroidx/fragment/app/Fragment;)Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortOrderDialog;

    move-result-object p1

    .line 538
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    const-class v2, Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortOrderDialog;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v0, v2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortOrderDialog;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    return v1

    .line 547
    :sswitch_1
    new-instance p1, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;

    invoke-direct {p1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SettingsFragment;-><init>()V

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->showFragment(Landroidx/fragment/app/Fragment;)V

    return v1

    .line 544
    :sswitch_2
    new-instance p1, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    const-class v2, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity;

    invoke-direct {p1, v0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->startActivity(Landroid/content/Intent;)V

    return v1

    .line 541
    :sswitch_3
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentActivity;->finish()V

    return v1

    nop

    :sswitch_data_0
    .sparse-switch
        0x102002c -> :sswitch_3
        0x7f09011d -> :sswitch_2
        0x7f09011e -> :sswitch_1
        0x7f0901b1 -> :sswitch_0
    .end sparse-switch
.end method

.method public onPause()V
    .locals 1

    .line 511
    invoke-super {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SyncFragment;->onPause()V

    .line 512
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mFab:Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;

    if-eqz v0, :cond_0

    .line 513
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->onPause()V

    :cond_0
    return-void
.end method

.method public onPositiveAnswer(ILandroid/os/Parcelable;)V
    .locals 2

    const/4 v0, 0x2

    if-ne p1, v0, :cond_0

    .line 1296
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->WEBVIEWER:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast p2, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    invoke-virtual {p1, v0, p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->unshare(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V

    return-void

    .line 1299
    :cond_0
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
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)V
    .locals 5

    .line 519
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SyncFragment;->onPrepareOptionsMenu(Landroid/view/Menu;)V

    .line 520
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mIsPicker:Z

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    move v1, v0

    .line 521
    :goto_0
    invoke-interface {p1}, Landroid/view/Menu;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 522
    invoke-interface {p1, v1}, Landroid/view/Menu;->getItem(I)Landroid/view/MenuItem;

    move-result-object v2

    .line 523
    invoke-interface {v2}, Landroid/view/MenuItem;->getItemId()I

    move-result v3

    const v4, 0x7f0901b1

    if-ne v3, v4, :cond_0

    const/4 v3, 0x1

    goto :goto_1

    :cond_0
    move v3, v0

    :goto_1
    invoke-interface {v2, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public onRefresh()V
    .locals 0

    .line 1323
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->sync()V

    return-void
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

    .line 559
    :goto_0
    array-length v2, p2

    if-ge v1, v2, :cond_1

    .line 560
    aget v2, p3, v1

    if-eqz v2, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x1

    :goto_1
    const/16 p2, 0x2328

    if-eq p1, p2, :cond_4

    .line 575
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mPermissionsHandler:Landroid/os/Handler;

    const/4 p3, 0x0

    invoke-virtual {p2, p3}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    if-eqz v0, :cond_3

    .line 577
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mPermissionsContainer:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    move-result p2

    if-nez p2, :cond_2

    .line 578
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mPermissionsHandler:Landroid/os/Handler;

    iget-object p3, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mPermissionsContainer:Landroid/view/View;

    invoke-static {p3}, Lcom/sonymobile/scan3d/PermissionUtil;->removePermissionsContainer(Landroid/view/View;)Ljava/lang/Runnable;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 581
    :cond_2
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p2

    check-cast p2, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;

    invoke-virtual {p2, p1}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->permissionRequestAccepted(I)V

    goto :goto_2

    .line 583
    :cond_3
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mPermissionsHandler:Landroid/os/Handler;

    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mPermissionsContainer:Landroid/view/View;

    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/PermissionUtil;->showPermissionsSnackbar(Landroid/os/Handler;Landroid/view/View;)V

    goto :goto_2

    :cond_4
    if-eqz v0, :cond_5

    .line 568
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->openScanModeSelection()V

    goto :goto_2

    .line 570
    :cond_5
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->startConfirmPermissions()V

    :goto_2
    return-void
.end method

.method public onResume()V
    .locals 3

    .line 483
    invoke-super {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SyncFragment;->onResume()V

    .line 484
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->LOG_TAG:Ljava/lang/String;

    const-string v1, "onResume(): begin"

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 486
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    const-class v1, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 487
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mFab:Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->hide()V

    goto :goto_0

    .line 489
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mFab:Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->show()V

    .line 492
    :goto_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->isSignedIn(Landroid/content/Context;)Z

    move-result v0

    .line 493
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mGalleryAdapter:Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;

    invoke-virtual {v1, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->setIsSignedIn(Z)V

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 497
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mRefreshLayout:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    iget-boolean v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mIsPicker:Z

    if-eqz v2, :cond_1

    goto :goto_1

    :cond_1
    move-object v1, p0

    :goto_1
    invoke-virtual {v0, v1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setOnRefreshListener(Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$OnRefreshListener;)V

    .line 498
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mRefreshLayout:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    iget-boolean v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mIsPicker:Z

    xor-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setEnabled(Z)V

    goto :goto_2

    .line 500
    :cond_2
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mRefreshLayout:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    invoke-virtual {v0, v1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setOnRefreshListener(Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$OnRefreshListener;)V

    .line 501
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mRefreshLayout:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setEnabled(Z)V

    .line 503
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/Config;->isSigninMandatory(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 504
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->signIn()V

    :cond_3
    :goto_2
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    .line 439
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SyncFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    const-string v0, "show_promotions"

    .line 440
    iget-boolean v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mShowPromotions:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method public onScale(Landroid/view/ScaleGestureDetector;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public onScaleBegin(Landroid/view/ScaleGestureDetector;)Z
    .locals 0

    .line 1349
    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getScaleFactor()F

    move-result p1

    iput p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mScaleStart:F

    const/4 p1, 0x1

    return p1
.end method

.method public onScaleEnd(Landroid/view/ScaleGestureDetector;)V
    .locals 5

    .line 1360
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v0

    check-cast v0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 1361
    invoke-virtual {v0}, Landroidx/recyclerview/widget/GridLayoutManager;->getSpanCount()I

    move-result v1

    .line 1362
    iget v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mScaleStart:F

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getScaleFactor()F

    move-result p1

    cmpl-float p1, v2, p1

    const/4 v2, 0x2

    const/4 v3, 0x3

    const/4 v4, 0x1

    if-lez p1, :cond_2

    add-int/lit8 p1, v1, 0x1

    .line 1365
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mConfig:Landroid/content/res/Configuration;

    iget v1, v1, Landroid/content/res/Configuration;->orientation:I

    if-ne v1, v4, :cond_0

    if-le p1, v2, :cond_0

    goto :goto_0

    :cond_0
    if-le p1, v3, :cond_1

    move v2, v3

    goto :goto_0

    :cond_1
    move v2, p1

    goto :goto_0

    :cond_2
    add-int/lit8 v2, v1, -0x1

    if-ge v2, v4, :cond_3

    move v2, v4

    .line 1378
    :cond_3
    :goto_0
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/GridLayoutManager;->setSpanCount(I)V

    .line 1379
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 1382
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    .line 1383
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const v0, 0x7f1001d6

    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public onScanMenuClick(Landroid/view/MenuItem;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)Z
    .locals 2

    if-nez p2, :cond_0

    const/4 p1, 0x0

    return p1

    .line 1475
    :cond_0
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 1478
    :pswitch_0
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->WEBVIEWER:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->DEFAULT:Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    invoke-virtual {p1, v0, p2, v1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->view(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;)V

    goto :goto_0

    .line 1484
    :pswitch_1
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->WEBVIEWER:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->PROPS:Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    invoke-virtual {p1, v0, p2, v1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->view(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;)V

    goto :goto_0

    .line 1481
    :pswitch_2
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->WEBVIEWER:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->ANIMATION:Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    invoke-virtual {p1, v0, p2, v1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->view(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;)V

    goto :goto_0

    .line 1487
    :pswitch_3
    invoke-direct {p0, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->showUnshareDialog(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V

    :goto_0
    const/4 p1, 0x1

    return p1

    nop

    :pswitch_data_0
    .packed-switch 0x7f09011f
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onScanModeSelected(Landroidx/fragment/app/DialogFragment;Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;)V
    .locals 2

    .line 1392
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment$2;->$SwitchMap$com$sonymobile$scan3d$storageservice$ui$fragment$SelectScanModeFragment$ScanMode:[I

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_0

    .line 1422
    :pswitch_0
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;->getTutorial()Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

    move-result-object p2

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->isTrainingModeCompleted(Landroid/content/Context;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 1423
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->startFoodScan()V

    .line 1424
    invoke-virtual {p1}, Landroidx/fragment/app/DialogFragment;->dismiss()V

    goto :goto_0

    .line 1426
    :cond_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->startFoodScanPractice()V

    goto :goto_0

    .line 1418
    :pswitch_1
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->startAdvScan()V

    .line 1419
    invoke-virtual {p1}, Landroidx/fragment/app/DialogFragment;->dismiss()V

    goto :goto_0

    .line 1410
    :pswitch_2
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;->getTutorial()Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

    move-result-object p2

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->isTrainingModeCompleted(Landroid/content/Context;)Z

    move-result p2

    if-eqz p2, :cond_1

    .line 1411
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->startHeadScan()V

    .line 1412
    invoke-virtual {p1}, Landroidx/fragment/app/DialogFragment;->dismiss()V

    goto :goto_0

    .line 1414
    :cond_1
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->startHeadScanPractice()V

    goto :goto_0

    .line 1402
    :pswitch_3
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;->getTutorial()Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

    move-result-object p2

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->isTrainingModeCompleted(Landroid/content/Context;)Z

    move-result p2

    if-eqz p2, :cond_2

    .line 1403
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->startFaceScan()V

    .line 1404
    invoke-virtual {p1}, Landroidx/fragment/app/DialogFragment;->dismiss()V

    goto :goto_0

    .line 1406
    :cond_2
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->startFaceScanPractice()V

    goto :goto_0

    .line 1394
    :pswitch_4
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;->getTutorial()Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

    move-result-object p2

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->isTrainingModeCompleted(Landroid/content/Context;)Z

    move-result p2

    if-eqz p2, :cond_3

    .line 1395
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->startSelfieScan()V

    .line 1396
    invoke-virtual {p1}, Landroidx/fragment/app/DialogFragment;->dismiss()V

    goto :goto_0

    .line 1398
    :cond_3
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->startSelfieScanPractice()V

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onSelectScanModeDialogDismissed()V
    .locals 1

    .line 1465
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mFab:Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->show()V

    return-void
.end method

.method public onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 2

    .line 1332
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_1

    const v0, 0x7f1001e5

    .line 1333
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1334
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipParser;->isPromotionListPopulated(Landroid/content/Context;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mShowPromotions:Z

    .line 1335
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mGalleryAdapter:Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;

    iget-boolean p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mShowPromotions:Z

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->setShowPromotions(Z)V

    goto :goto_0

    :cond_0
    const v0, 0x7f1001d6

    .line 1336
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1337
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mGalleryAdapter:Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;

    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getDefaultSpanCount()I

    move-result v1

    invoke-interface {p1, p2, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->setSpanCount(I)V

    :cond_1
    :goto_0
    return-void
.end method

.method public onSortOrderSelected(Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;)V
    .locals 0

    .line 956
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->setSortType(Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;)V

    return-void
.end method

.method public onStart()V
    .locals 1

    .line 469
    invoke-super {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SyncFragment;->onStart()V

    .line 470
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v0, p0}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 472
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mGalleryAdapter:Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method public onStop()V
    .locals 1

    .line 477
    invoke-super {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SyncFragment;->onStop()V

    .line 478
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v0, p0}, Landroid/content/SharedPreferences;->unregisterOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    return-void
.end method

.method public onSyncChanged(Z)V
    .locals 1

    .line 1314
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mRefreshLayout:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    if-eqz p1, :cond_0

    iget-boolean p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mIsPicker:Z

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    invoke-virtual {v0, p1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    return-void
.end method

.method public onTutorialSelected(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;)V
    .locals 2

    .line 1439
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment$2;->$SwitchMap$com$sonymobile$scan3d$storageservice$ui$gallery$wizard$ScanTutorial:[I

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    const/4 v0, -0x1

    goto :goto_0

    :pswitch_0
    const/16 v0, 0x89b

    goto :goto_0

    :pswitch_1
    const/16 v0, 0x89a

    goto :goto_0

    :pswitch_2
    const/16 v0, 0x898

    goto :goto_0

    :pswitch_3
    const/16 v0, 0x899

    goto :goto_0

    :pswitch_4
    const/16 v0, 0x89c

    .line 1460
    :goto_0
    invoke-direct {p0, p1, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->startTutorial(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;I)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 2

    .line 688
    invoke-super {p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SyncFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    const p2, 0x7f0901cc

    .line 691
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mRefreshLayout:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    .line 692
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->mRefreshLayout:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    const/4 p2, 0x1

    new-array p2, p2, [I

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f060097

    invoke-virtual {v0, v1}, Landroid/content/Context;->getColor(I)I

    move-result v0

    const/4 v1, 0x0

    aput v0, p2, v1

    invoke-virtual {p1, p2}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setColorSchemeColors([I)V

    return-void
.end method

.method public showPermissionRequest([Ljava/lang/String;II)V
    .locals 0
    .param p2    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 1524
    invoke-direct {p0, p2, p1, p3}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->setupPermissionsButton(I[Ljava/lang/String;I)V

    .line 1525
    invoke-virtual {p0, p1, p3}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/GalleryFragment;->requestPermissions([Ljava/lang/String;I)V

    return-void
.end method
