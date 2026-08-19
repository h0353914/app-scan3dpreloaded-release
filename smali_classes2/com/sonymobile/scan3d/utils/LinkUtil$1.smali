.class final Lcom/sonymobile/scan3d/utils/LinkUtil$1;
.super Landroid/text/style/ClickableSpan;
.source "LinkUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonymobile/scan3d/utils/LinkUtil;->createClickableLink(Landroid/content/Context;I[Ljava/lang/Object;[Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;)Landroid/text/SpannableStringBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$inputReducerListener:Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;)V
    .locals 0

    .line 101
    iput-object p1, p0, Lcom/sonymobile/scan3d/utils/LinkUtil$1;->val$inputReducerListener:Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;

    invoke-direct {p0}, Landroid/text/style/ClickableSpan;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 105
    iget-object v0, p0, Lcom/sonymobile/scan3d/utils/LinkUtil$1;->val$inputReducerListener:Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;

    invoke-interface {v0, p1}, Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;->onClick(Landroid/view/View;)V

    return-void
.end method
