.class public final synthetic Lcom/sonymobile/scan3d/storageservice/ui/activity/-$$Lambda$GalleryActivity$dMgU-L2PaZoWkYVEGkwyJojHVqw;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic f$0:Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;

.field private final synthetic f$1:I

.field private final synthetic f$2:Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$OnIdleListener;

.field private final synthetic f$3:I


# direct methods
.method public synthetic constructor <init>(Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;ILcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$OnIdleListener;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/-$$Lambda$GalleryActivity$dMgU-L2PaZoWkYVEGkwyJojHVqw;->f$0:Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;

    iput p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/-$$Lambda$GalleryActivity$dMgU-L2PaZoWkYVEGkwyJojHVqw;->f$1:I

    iput-object p3, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/-$$Lambda$GalleryActivity$dMgU-L2PaZoWkYVEGkwyJojHVqw;->f$2:Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$OnIdleListener;

    iput p4, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/-$$Lambda$GalleryActivity$dMgU-L2PaZoWkYVEGkwyJojHVqw;->f$3:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/-$$Lambda$GalleryActivity$dMgU-L2PaZoWkYVEGkwyJojHVqw;->f$0:Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;

    iget v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/-$$Lambda$GalleryActivity$dMgU-L2PaZoWkYVEGkwyJojHVqw;->f$1:I

    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/-$$Lambda$GalleryActivity$dMgU-L2PaZoWkYVEGkwyJojHVqw;->f$2:Lcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$OnIdleListener;

    iget v3, p0, Lcom/sonymobile/scan3d/storageservice/ui/activity/-$$Lambda$GalleryActivity$dMgU-L2PaZoWkYVEGkwyJojHVqw;->f$3:I

    invoke-static {v0, v1, v2, v3}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->lambda$addIdleListener$0(Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;ILcom/sonymobile/scan3d/storageservice/ui/activity/IdleMonitor$OnIdleListener;I)V

    return-void
.end method
