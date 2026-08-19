.class public final synthetic Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$eFIA7eXVYi-6zVg1qjvU1JxFIUk;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;


# instance fields
.field private final synthetic f$0:Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;

.field private final synthetic f$1:Landroid/content/SharedPreferences;

.field private final synthetic f$2:Ljava/lang/String;

.field private final synthetic f$3:Landroid/widget/CheckBox;

.field private final synthetic f$4:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;Landroid/content/SharedPreferences;Ljava/lang/String;Landroid/widget/CheckBox;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$eFIA7eXVYi-6zVg1qjvU1JxFIUk;->f$0:Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;

    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$eFIA7eXVYi-6zVg1qjvU1JxFIUk;->f$1:Landroid/content/SharedPreferences;

    iput-object p3, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$eFIA7eXVYi-6zVg1qjvU1JxFIUk;->f$2:Ljava/lang/String;

    iput-object p4, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$eFIA7eXVYi-6zVg1qjvU1JxFIUk;->f$3:Landroid/widget/CheckBox;

    iput-object p5, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$eFIA7eXVYi-6zVg1qjvU1JxFIUk;->f$4:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final doClick(Landroid/view/View;)V
    .locals 6

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$eFIA7eXVYi-6zVg1qjvU1JxFIUk;->f$0:Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$eFIA7eXVYi-6zVg1qjvU1JxFIUk;->f$1:Landroid/content/SharedPreferences;

    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$eFIA7eXVYi-6zVg1qjvU1JxFIUk;->f$2:Ljava/lang/String;

    iget-object v3, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$eFIA7eXVYi-6zVg1qjvU1JxFIUk;->f$3:Landroid/widget/CheckBox;

    iget-object v4, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ViewerFragment$eFIA7eXVYi-6zVg1qjvU1JxFIUk;->f$4:Landroid/view/View;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->lambda$handleImprovementHint$13(Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;Landroid/content/SharedPreferences;Ljava/lang/String;Landroid/widget/CheckBox;Landroid/view/View;Landroid/view/View;)V

    return-void
.end method
