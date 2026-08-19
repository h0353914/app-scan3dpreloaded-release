.class Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$ViewHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "TabPageBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ViewHolder"
.end annotation


# static fields
.field private static final VIEW_TYPE:I = 0x7f0c00b0


# instance fields
.field private final mCardContent:Landroid/view/View;

.field private final mImageView:Landroid/widget/ImageView;

.field private final mRootView:Landroid/view/View;

.field private final mTitleView:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;Landroid/view/View;)V
    .locals 0

    .line 248
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$ViewHolder;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;

    .line 249
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 250
    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$ViewHolder;->mRootView:Landroid/view/View;

    const p1, 0x7f090084

    .line 251
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$ViewHolder;->mCardContent:Landroid/view/View;

    const p1, 0x7f0900fc

    .line 252
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$ViewHolder;->mImageView:Landroid/widget/ImageView;

    const p1, 0x7f0900fd

    .line 253
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$ViewHolder;->mTitleView:Landroid/widget/TextView;

    return-void
.end method

.method public static synthetic lambda$bind$0(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$ViewHolder;Landroid/view/View;)V
    .locals 2

    .line 269
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$ViewHolder;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f100281

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p1

    .line 270
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method public static synthetic lambda$bind$1(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$ViewHolder;Lcom/sonymobile/scan3d/sharing/Plugin;Landroid/view/View;)V
    .locals 1

    .line 274
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$ViewHolder;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$ViewHolder;->getAdapterPosition()I

    move-result v0

    invoke-virtual {p2, p1, v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->onClickPlugin(Lcom/sonymobile/scan3d/sharing/Plugin;I)V

    return-void
.end method


# virtual methods
.method public bind(Lcom/sonymobile/scan3d/sharing/Plugin;)V
    .locals 3

    .line 257
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$ViewHolder;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 261
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$ViewHolder;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;

    invoke-static {v1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->access$000(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;)I

    move-result v1

    const/4 v2, -0x1

    if-le v1, v2, :cond_1

    .line 262
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$ViewHolder;->mRootView:Landroid/view/View;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 263
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$ViewHolder;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;

    invoke-static {v1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->access$000(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;)I

    move-result v1

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$ViewHolder;->getAdapterPosition()I

    move-result v2

    if-ne v1, v2, :cond_0

    .line 264
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$ViewHolder;->mRootView:Landroid/view/View;

    check-cast v1, Lcom/sonymobile/scan3d/viewer/sharing/tabs/ShareCardView;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/ShareCardView;->addProgressBar()V

    goto :goto_0

    .line 266
    :cond_0
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$ViewHolder;->mRootView:Landroid/view/View;

    check-cast v1, Lcom/sonymobile/scan3d/viewer/sharing/tabs/ShareCardView;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/ShareCardView;->removeProgressBar()V

    .line 268
    :goto_0
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$ViewHolder;->mRootView:Landroid/view/View;

    new-instance v2, Lcom/sonymobile/scan3d/viewer/sharing/tabs/-$$Lambda$TabPageBase$ViewHolder$-tMYhwYGH-qzp6-eR7rOdHj9cEY;

    invoke-direct {v2, p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/-$$Lambda$TabPageBase$ViewHolder$-tMYhwYGH-qzp6-eR7rOdHj9cEY;-><init>(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$ViewHolder;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_1

    .line 272
    :cond_1
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$ViewHolder;->mRootView:Landroid/view/View;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 273
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$ViewHolder;->mRootView:Landroid/view/View;

    new-instance v2, Lcom/sonymobile/scan3d/viewer/sharing/tabs/-$$Lambda$TabPageBase$ViewHolder$i-sGNic77KD69rRNxUp5npWs8Mg;

    invoke-direct {v2, p0, p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/-$$Lambda$TabPageBase$ViewHolder$i-sGNic77KD69rRNxUp5npWs8Mg;-><init>(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$ViewHolder;Lcom/sonymobile/scan3d/sharing/Plugin;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 277
    :goto_1
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$ViewHolder;->mCardContent:Landroid/view/View;

    invoke-interface {p1}, Lcom/sonymobile/scan3d/sharing/Plugin;->getBackgroundColor()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 278
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$ViewHolder;->mImageView:Landroid/widget/ImageView;

    invoke-interface {p1}, Lcom/sonymobile/scan3d/sharing/Plugin;->getImage()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 279
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$ViewHolder;->mTitleView:Landroid/widget/TextView;

    invoke-interface {p1}, Lcom/sonymobile/scan3d/sharing/Plugin;->getTitle()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 281
    invoke-interface {p1}, Lcom/sonymobile/scan3d/sharing/Plugin;->getBackgroundColor()I

    move-result v1

    const v2, 0x7f0600b9

    invoke-virtual {v0, v2}, Landroid/content/Context;->getColor(I)I

    move-result v2

    if-ne v1, v2, :cond_2

    .line 283
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$ViewHolder;->mTitleView:Landroid/widget/TextView;

    invoke-interface {p1}, Lcom/sonymobile/scan3d/sharing/Plugin;->getBackgroundColor()I

    move-result p1

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setBackgroundColor(I)V

    .line 284
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$ViewHolder;->mTitleView:Landroid/widget/TextView;

    const v1, 0x7f060030

    invoke-virtual {v0, v1}, Landroid/content/Context;->getColor(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_2

    .line 287
    :cond_2
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$ViewHolder;->mTitleView:Landroid/widget/TextView;

    invoke-interface {p1, v0}, Lcom/sonymobile/scan3d/sharing/Plugin;->getTextColor(Landroid/content/Context;)I

    move-result p1

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setBackgroundColor(I)V

    .line 288
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$ViewHolder;->mTitleView:Landroid/widget/TextView;

    const v1, 0x7f060032

    invoke-virtual {v0, v1}, Landroid/content/Context;->getColor(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    :goto_2
    return-void
.end method
