.class public final synthetic Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$oD6IqBGLpMSWOLr-BwIpykW6Gqg;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;


# instance fields
.field private final synthetic f$0:Landroid/content/SharedPreferences;

.field private final synthetic f$1:Landroid/widget/LinearLayout;


# direct methods
.method public synthetic constructor <init>(Landroid/content/SharedPreferences;Landroid/widget/LinearLayout;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$oD6IqBGLpMSWOLr-BwIpykW6Gqg;->f$0:Landroid/content/SharedPreferences;

    iput-object p2, p0, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$oD6IqBGLpMSWOLr-BwIpykW6Gqg;->f$1:Landroid/widget/LinearLayout;

    return-void
.end method


# virtual methods
.method public final doClick(Landroid/view/View;)V
    .locals 2

    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$oD6IqBGLpMSWOLr-BwIpykW6Gqg;->f$0:Landroid/content/SharedPreferences;

    iget-object v1, p0, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$oD6IqBGLpMSWOLr-BwIpykW6Gqg;->f$1:Landroid/widget/LinearLayout;

    invoke-static {v0, v1, p1}, Lcom/sonymobile/scan3d/editor/EditorFragment;->lambda$onCreateView$4(Landroid/content/SharedPreferences;Landroid/widget/LinearLayout;Landroid/view/View;)V

    return-void
.end method
