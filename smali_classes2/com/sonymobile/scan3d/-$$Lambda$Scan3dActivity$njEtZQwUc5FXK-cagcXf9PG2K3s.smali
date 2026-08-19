.class public final synthetic Lcom/sonymobile/scan3d/-$$Lambda$Scan3dActivity$njEtZQwUc5FXK-cagcXf9PG2K3s;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final synthetic f$0:Lcom/sonymobile/scan3d/Scan3dActivity;

.field private final synthetic f$1:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Lcom/sonymobile/scan3d/Scan3dActivity;Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/-$$Lambda$Scan3dActivity$njEtZQwUc5FXK-cagcXf9PG2K3s;->f$0:Lcom/sonymobile/scan3d/Scan3dActivity;

    iput-object p2, p0, Lcom/sonymobile/scan3d/-$$Lambda$Scan3dActivity$njEtZQwUc5FXK-cagcXf9PG2K3s;->f$1:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    iget-object v0, p0, Lcom/sonymobile/scan3d/-$$Lambda$Scan3dActivity$njEtZQwUc5FXK-cagcXf9PG2K3s;->f$0:Lcom/sonymobile/scan3d/Scan3dActivity;

    iget-object v1, p0, Lcom/sonymobile/scan3d/-$$Lambda$Scan3dActivity$njEtZQwUc5FXK-cagcXf9PG2K3s;->f$1:Landroid/content/Context;

    invoke-static {v0, v1, p1, p2}, Lcom/sonymobile/scan3d/Scan3dActivity;->lambda$confirmCancelScan$3(Lcom/sonymobile/scan3d/Scan3dActivity;Landroid/content/Context;Landroid/content/DialogInterface;I)V

    return-void
.end method
