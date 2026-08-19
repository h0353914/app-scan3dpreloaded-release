.class public Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortOrderDialog;
.super Landroidx/fragment/app/DialogFragment;
.source "SortOrderDialog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortOrderDialog$OnSortOrderSelectionListener;
    }
.end annotation


# static fields
.field private static final KEY_SORT_ORDER:Ljava/lang/String; = "KEY_SORT_ORDER"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Landroidx/fragment/app/DialogFragment;-><init>()V

    return-void
.end method

.method public static synthetic lambda$onCreateDialog$0(Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortOrderDialog;[Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;Landroid/content/DialogInterface;I)V
    .locals 1

    .line 61
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortOrderDialog;->getTargetFragment()Landroidx/fragment/app/Fragment;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 62
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortOrderDialog;->getTargetFragment()Landroidx/fragment/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortOrderDialog$OnSortOrderSelectionListener;

    aget-object p1, p1, p3

    invoke-interface {v0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortOrderDialog$OnSortOrderSelectionListener;->onSortOrderSelected(Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;)V

    .line 64
    :cond_0
    invoke-interface {p2}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method

.method static synthetic lambda$onCreateDialog$1(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 66
    invoke-interface {p0}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method

.method public static newInstance(Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;Landroidx/fragment/app/Fragment;)Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortOrderDialog;
    .locals 3

    .line 37
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortOrderDialog;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortOrderDialog;-><init>()V

    .line 38
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "KEY_SORT_ORDER"

    .line 39
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;->ordinal()I

    move-result p0

    invoke-virtual {v1, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 40
    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortOrderDialog;->setArguments(Landroid/os/Bundle;)V

    const/4 p0, 0x0

    .line 41
    invoke-virtual {v0, p1, p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortOrderDialog;->setTargetFragment(Landroidx/fragment/app/Fragment;I)V

    return-object v0
.end method


# virtual methods
.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 5
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 49
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortOrderDialog;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 50
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortOrderDialog;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v1, "KEY_SORT_ORDER"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p1

    goto :goto_0

    :cond_0
    move p1, v0

    .line 52
    :goto_0
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;->values()[Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;

    move-result-object v1

    .line 53
    array-length v2, v1

    new-array v2, v2, [Ljava/lang/CharSequence;

    .line 54
    :goto_1
    array-length v3, v2

    if-ge v0, v3, :cond_1

    .line 55
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortOrderDialog;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    aget-object v4, v1, v0

    invoke-virtual {v4}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;->getLabelId()I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 58
    :cond_1
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortOrderDialog;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v0, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v3, 0x7f10016d

    .line 59
    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 60
    new-instance v3, Lcom/sonymobile/scan3d/storageservice/ui/gallery/-$$Lambda$SortOrderDialog$ACxhvKhr2FxsnFpr7oP4qSrkIng;

    invoke-direct {v3, p0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/-$$Lambda$SortOrderDialog$ACxhvKhr2FxsnFpr7oP4qSrkIng;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortOrderDialog;[Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;)V

    invoke-virtual {v0, v2, p1, v3}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    const/high16 p1, 0x1040000

    .line 66
    sget-object v1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/-$$Lambda$SortOrderDialog$8fAu1Lzfsyy9XlPoeCWqAZBVPgU;->INSTANCE:Lcom/sonymobile/scan3d/storageservice/ui/gallery/-$$Lambda$SortOrderDialog$8fAu1Lzfsyy9XlPoeCWqAZBVPgU;

    invoke-virtual {v0, p1, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 68
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    return-object p1
.end method
