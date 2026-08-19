.class public final synthetic Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$tlp2tPXkRudNwyf3Cvx8g2m9gmI;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;


# instance fields
.field private final synthetic f$0:Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;

.field private final synthetic f$1:Landroid/content/SharedPreferences;


# direct methods
.method public synthetic constructor <init>(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;Landroid/content/SharedPreferences;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$tlp2tPXkRudNwyf3Cvx8g2m9gmI;->f$0:Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;

    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$tlp2tPXkRudNwyf3Cvx8g2m9gmI;->f$1:Landroid/content/SharedPreferences;

    return-void
.end method


# virtual methods
.method public final doClick(Landroid/view/View;)V
    .locals 2

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$tlp2tPXkRudNwyf3Cvx8g2m9gmI;->f$0:Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$tlp2tPXkRudNwyf3Cvx8g2m9gmI;->f$1:Landroid/content/SharedPreferences;

    invoke-static {v0, v1, p1}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->lambda$handleViewerHint$12(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;Landroid/content/SharedPreferences;Landroid/view/View;)V

    return-void
.end method
