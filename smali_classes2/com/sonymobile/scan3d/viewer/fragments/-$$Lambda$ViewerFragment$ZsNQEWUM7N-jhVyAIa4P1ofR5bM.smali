.class public final synthetic Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$ZsNQEWUM7N-jhVyAIa4P1ofR5bM;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;


# instance fields
.field private final synthetic f$0:Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;

.field private final synthetic f$1:[Ljava/lang/String;

.field private final synthetic f$2:I


# direct methods
.method public synthetic constructor <init>(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;[Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$ZsNQEWUM7N-jhVyAIa4P1ofR5bM;->f$0:Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;

    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$ZsNQEWUM7N-jhVyAIa4P1ofR5bM;->f$1:[Ljava/lang/String;

    iput p3, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$ZsNQEWUM7N-jhVyAIa4P1ofR5bM;->f$2:I

    return-void
.end method


# virtual methods
.method public final doClick(Landroid/view/View;)V
    .locals 3

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$ZsNQEWUM7N-jhVyAIa4P1ofR5bM;->f$0:Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$ZsNQEWUM7N-jhVyAIa4P1ofR5bM;->f$1:[Ljava/lang/String;

    iget v2, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$ZsNQEWUM7N-jhVyAIa4P1ofR5bM;->f$2:I

    invoke-static {v0, v1, v2, p1}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->lambda$setupPermissionsButton$15(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;[Ljava/lang/String;ILandroid/view/View;)V

    return-void
.end method
