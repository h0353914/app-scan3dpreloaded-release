.class Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$1;
.super Landroidx/fragment/app/FragmentPagerAdapter;
.source "SelectScanModeFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment;Landroidx/fragment/app/FragmentManager;I)V
    .locals 0

    .line 255
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$1;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment;

    invoke-direct {p0, p2, p3}, Landroidx/fragment/app/FragmentPagerAdapter;-><init>(Landroidx/fragment/app/FragmentManager;I)V

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .line 263
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;->values()[Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;

    move-result-object v0

    array-length v0, v0

    return v0
.end method

.method public getItem(I)Landroidx/fragment/app/Fragment;
    .locals 1

    .line 258
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$1;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment;

    invoke-static {v0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment;->access$100(Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment;I)I

    move-result p1

    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanModeItemFragment;->newInstance(I)Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanModeItemFragment;

    move-result-object p1

    return-object p1
.end method
