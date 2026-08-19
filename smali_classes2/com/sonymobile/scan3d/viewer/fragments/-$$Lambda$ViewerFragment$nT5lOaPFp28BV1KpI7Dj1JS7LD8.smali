.class public final synthetic Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$nT5lOaPFp28BV1KpI7Dj1JS7LD8;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;


# instance fields
.field private final synthetic f$0:Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;

.field private final synthetic f$1:Landroid/content/SharedPreferences;

.field private final synthetic f$2:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$nT5lOaPFp28BV1KpI7Dj1JS7LD8;->f$0:Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;

    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$nT5lOaPFp28BV1KpI7Dj1JS7LD8;->f$1:Landroid/content/SharedPreferences;

    iput-object p3, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$nT5lOaPFp28BV1KpI7Dj1JS7LD8;->f$2:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final doClick(Landroid/view/View;)V
    .locals 3

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$nT5lOaPFp28BV1KpI7Dj1JS7LD8;->f$0:Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$nT5lOaPFp28BV1KpI7Dj1JS7LD8;->f$1:Landroid/content/SharedPreferences;

    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$nT5lOaPFp28BV1KpI7Dj1JS7LD8;->f$2:Ljava/lang/String;

    invoke-static {v0, v1, v2, p1}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->lambda$handlePromoDismissedHint$14(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;Landroid/content/SharedPreferences;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
