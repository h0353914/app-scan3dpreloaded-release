.class public final synthetic Lcom/sonymobile/scan3d/viewer/sharing/tabs/-$$Lambda$TabPageBase$sSvMp2ecyhSUKAM6o4i6NIP_J3Q;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lcom/sonymobile/scan3d/sharing/OnPluginUpdateListener;


# instance fields
.field private final synthetic f$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;

.field private final synthetic f$1:Landroidx/recyclerview/widget/RecyclerView;

.field private final synthetic f$2:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/-$$Lambda$TabPageBase$sSvMp2ecyhSUKAM6o4i6NIP_J3Q;->f$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;

    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/-$$Lambda$TabPageBase$sSvMp2ecyhSUKAM6o4i6NIP_J3Q;->f$1:Landroidx/recyclerview/widget/RecyclerView;

    iput-object p3, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/-$$Lambda$TabPageBase$sSvMp2ecyhSUKAM6o4i6NIP_J3Q;->f$2:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final onPluginsChanged()V
    .locals 3

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/-$$Lambda$TabPageBase$sSvMp2ecyhSUKAM6o4i6NIP_J3Q;->f$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/-$$Lambda$TabPageBase$sSvMp2ecyhSUKAM6o4i6NIP_J3Q;->f$1:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/-$$Lambda$TabPageBase$sSvMp2ecyhSUKAM6o4i6NIP_J3Q;->f$2:Landroid/view/View;

    invoke-static {v0, v1, v2}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->lambda$onCreateView$0(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;)V

    return-void
.end method
