.class public Lcom/sonymobile/scan3d/ScanningPermissionsActivity;
.super Landroid/app/Activity;
.source "ScanningPermissionsActivity.java"


# static fields
.field private static final CAMERA_PERMISSIONS:[Ljava/lang/String;

.field private static final REQUEST_CODE_PERMISSIONS:I = 0x3e8

.field public static final RESULT_CODE_PERMISSIONS_APPROVED:I = 0x1

.field public static final RESULT_CODE_PERMISSIONS_DECLINED:I = 0x2


# instance fields
.field private mPermissionsContainer:Landroid/view/ViewGroup;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "android.permission.CAMERA"

    .line 31
    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/sonymobile/scan3d/ScanningPermissionsActivity;->CAMERA_PERMISSIONS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private addCameraPermission()V
    .locals 3

    const v0, 0x7f080118

    const v1, 0x7f1001a1

    const v2, 0x7f1001a0

    .line 93
    invoke-direct {p0, v0, v1, v2}, Lcom/sonymobile/scan3d/ScanningPermissionsActivity;->insertPermissionItem(III)V

    return-void
.end method

.method private insertPermissionItem(III)V
    .locals 4

    .line 98
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/ScanningPermissionsActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    iget-object v1, p0, Lcom/sonymobile/scan3d/ScanningPermissionsActivity;->mPermissionsContainer:Landroid/view/ViewGroup;

    const v2, 0x7f0c0090

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f090149

    .line 99
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 100
    invoke-virtual {v1, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    const p1, 0x7f09014a

    .line 101
    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    .line 102
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    const p1, 0x7f090148

    .line 104
    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    .line 105
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(I)V

    .line 107
    iget-object p1, p0, Lcom/sonymobile/scan3d/ScanningPermissionsActivity;->mPermissionsContainer:Landroid/view/ViewGroup;

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic lambda$onCreate$0(Lcom/sonymobile/scan3d/ScanningPermissionsActivity;Landroid/view/View;)V
    .locals 1

    .line 46
    sget-object p1, Lcom/sonymobile/scan3d/ScanningPermissionsActivity;->CAMERA_PERMISSIONS:[Ljava/lang/String;

    .line 47
    invoke-static {p0, p1}, Lcom/sonymobile/scan3d/PermissionUtil;->shouldShowRequestPermissionRationale(Landroid/app/Activity;[Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 49
    sget-object p1, Lcom/sonymobile/scan3d/ScanningPermissionsActivity;->CAMERA_PERMISSIONS:[Ljava/lang/String;

    const/16 v0, 0x3e8

    invoke-virtual {p0, p1, v0}, Lcom/sonymobile/scan3d/ScanningPermissionsActivity;->requestPermissions([Ljava/lang/String;I)V

    goto :goto_0

    .line 51
    :cond_0
    invoke-static {p0}, Lcom/sonymobile/scan3d/PermissionUtil;->startAppSettings(Landroid/content/Context;)V

    :goto_0
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 41
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0c001f

    .line 42
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/ScanningPermissionsActivity;->setContentView(I)V

    const p1, 0x7f09014d

    .line 43
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/ScanningPermissionsActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    iput-object p1, p0, Lcom/sonymobile/scan3d/ScanningPermissionsActivity;->mPermissionsContainer:Landroid/view/ViewGroup;

    const p1, 0x7f09008c

    .line 45
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/ScanningPermissionsActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    new-instance v0, Lcom/sonymobile/scan3d/-$$Lambda$ScanningPermissionsActivity$MDILJzbhjAsEPBNJrvnAV5s1MLI;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/-$$Lambda$ScanningPermissionsActivity$MDILJzbhjAsEPBNJrvnAV5s1MLI;-><init>(Lcom/sonymobile/scan3d/ScanningPermissionsActivity;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 4
    .param p2    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # [I
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/16 v0, 0x3e8

    if-ne p1, v0, :cond_3

    const/4 p1, 0x0

    const/4 v0, 0x1

    move v1, p1

    move v2, v0

    .line 77
    :goto_0
    array-length v3, p2

    if-ge v1, v3, :cond_1

    .line 78
    aget v3, p3, v1

    if-eqz v3, :cond_0

    move v2, p1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    if-eqz v2, :cond_2

    .line 84
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/ScanningPermissionsActivity;->setResult(I)V

    .line 85
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/ScanningPermissionsActivity;->finish()V

    goto :goto_1

    :cond_2
    const/4 p1, 0x2

    .line 87
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/ScanningPermissionsActivity;->setResult(I)V

    :cond_3
    :goto_1
    return-void
.end method

.method protected onResume()V
    .locals 2

    .line 58
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 59
    iget-object v0, p0, Lcom/sonymobile/scan3d/ScanningPermissionsActivity;->mPermissionsContainer:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 61
    sget-object v0, Lcom/sonymobile/scan3d/ScanningPermissionsActivity;->CAMERA_PERMISSIONS:[Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/PermissionUtil;->hasPermissions(Landroid/content/Context;[Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 62
    invoke-direct {p0}, Lcom/sonymobile/scan3d/ScanningPermissionsActivity;->addCameraPermission()V

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    if-eqz v0, :cond_1

    .line 67
    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/ScanningPermissionsActivity;->setResult(I)V

    .line 68
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/ScanningPermissionsActivity;->finish()V

    :cond_1
    return-void
.end method
