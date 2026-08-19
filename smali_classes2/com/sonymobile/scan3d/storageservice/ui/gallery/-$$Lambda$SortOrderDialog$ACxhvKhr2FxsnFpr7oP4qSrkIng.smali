.class public final synthetic Lcom/sonymobile/scan3d/storageservice/ui/gallery/-$$Lambda$SortOrderDialog$ACxhvKhr2FxsnFpr7oP4qSrkIng;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final synthetic f$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortOrderDialog;

.field private final synthetic f$1:[Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;


# direct methods
.method public synthetic constructor <init>(Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortOrderDialog;[Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/-$$Lambda$SortOrderDialog$ACxhvKhr2FxsnFpr7oP4qSrkIng;->f$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortOrderDialog;

    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/-$$Lambda$SortOrderDialog$ACxhvKhr2FxsnFpr7oP4qSrkIng;->f$1:[Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/-$$Lambda$SortOrderDialog$ACxhvKhr2FxsnFpr7oP4qSrkIng;->f$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortOrderDialog;

    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/-$$Lambda$SortOrderDialog$ACxhvKhr2FxsnFpr7oP4qSrkIng;->f$1:[Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;

    invoke-static {v0, v1, p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortOrderDialog;->lambda$onCreateDialog$0(Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortOrderDialog;[Lcom/sonymobile/scan3d/storageservice/ui/gallery/SortType;Landroid/content/DialogInterface;I)V

    return-void
.end method
