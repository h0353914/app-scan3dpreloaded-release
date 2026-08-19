.class public final synthetic Lcom/sonymobile/scan3d/-$$Lambda$Scan3dActivity$o3pw3OHZS3kw-qMovhUopdzCc9I;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final synthetic f$0:Lcom/sonymobile/scan3d/Scan3dActivity;

.field private final synthetic f$1:Z


# direct methods
.method public synthetic constructor <init>(Lcom/sonymobile/scan3d/Scan3dActivity;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/-$$Lambda$Scan3dActivity$o3pw3OHZS3kw-qMovhUopdzCc9I;->f$0:Lcom/sonymobile/scan3d/Scan3dActivity;

    iput-boolean p2, p0, Lcom/sonymobile/scan3d/-$$Lambda$Scan3dActivity$o3pw3OHZS3kw-qMovhUopdzCc9I;->f$1:Z

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    iget-object v0, p0, Lcom/sonymobile/scan3d/-$$Lambda$Scan3dActivity$o3pw3OHZS3kw-qMovhUopdzCc9I;->f$0:Lcom/sonymobile/scan3d/Scan3dActivity;

    iget-boolean v1, p0, Lcom/sonymobile/scan3d/-$$Lambda$Scan3dActivity$o3pw3OHZS3kw-qMovhUopdzCc9I;->f$1:Z

    invoke-static {v0, v1, p1, p2}, Lcom/sonymobile/scan3d/Scan3dActivity;->lambda$showCameraTooHotDialog$1(Lcom/sonymobile/scan3d/Scan3dActivity;ZLandroid/content/DialogInterface;I)V

    return-void
.end method
