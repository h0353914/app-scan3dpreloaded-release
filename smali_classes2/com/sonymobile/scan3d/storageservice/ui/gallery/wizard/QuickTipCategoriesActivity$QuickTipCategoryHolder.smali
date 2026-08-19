.class Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoryHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "QuickTipCategoriesActivity.java"

# interfaces
.implements Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "QuickTipCategoryHolder"
.end annotation


# instance fields
.field private mCategory:Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;

.field private final mContext:Landroid/content/Context;

.field private mDescriptionView:Landroid/widget/TextView;

.field private mExpandedView:Landroid/view/View;

.field private mImageView:Landroid/widget/ImageView;

.field private mItemRoot:Landroid/view/View;

.field private final mTitleSizeCollapsed:I

.field private final mTitleSizeExpanded:I

.field private mTitleView:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity;Landroid/view/View;)V
    .locals 3

    .line 120
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoryHolder;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity;

    .line 121
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 122
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoryHolder;->mContext:Landroid/content/Context;

    .line 123
    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoryHolder;->mItemRoot:Landroid/view/View;

    const v0, 0x7f0901f0

    .line 124
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoryHolder;->mTitleView:Landroid/widget/TextView;

    const v0, 0x7f0900a3

    .line 125
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoryHolder;->mDescriptionView:Landroid/widget/TextView;

    const v0, 0x7f0900f1

    .line 126
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoryHolder;->mImageView:Landroid/widget/ImageView;

    const v0, 0x7f090107

    .line 128
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoryHolder;->mExpandedView:Landroid/view/View;

    const v0, 0x7f0901a5

    .line 129
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 130
    invoke-virtual {p2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const/4 p2, 0x1

    .line 133
    new-array p2, p2, [I

    const/4 v0, 0x0

    const v1, 0x1010095

    aput v1, p2, v0

    const v1, 0x7f110111

    .line 134
    invoke-virtual {p1, v1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v1

    .line 135
    invoke-virtual {v1, v0, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoryHolder;->mTitleSizeExpanded:I

    .line 136
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    const v1, 0x7f110110

    .line 138
    invoke-virtual {p1, v1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 139
    invoke-virtual {p1, v0, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    iput p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoryHolder;->mTitleSizeCollapsed:I

    .line 140
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method

.method public static synthetic lambda$bind$0(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoryHolder;ILandroid/animation/ValueAnimator;)V
    .locals 0

    .line 183
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoryHolder;->mTitleView:Landroid/widget/TextView;

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setTextAppearance(I)V

    return-void
.end method


# virtual methods
.method bind(Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;I)V
    .locals 6

    .line 157
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoryHolder;->mCategory:Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;

    .line 158
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoryHolder;->mTitleView:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->getTitle()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 159
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoryHolder;->mDescriptionView:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->getDescription()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 164
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->getBackgroundColor()I

    move-result v0

    if-eqz v0, :cond_0

    .line 166
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoryHolder;->mItemRoot:Landroid/view/View;

    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoryHolder;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity;

    invoke-virtual {v2, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity;->getColor(I)I

    move-result v0

    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 169
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoryHolder;->getAdapterPosition()I

    move-result v0

    const v1, 0x7f110111

    const v2, 0x7f110110

    const/4 v3, 0x1

    const/4 v4, 0x2

    const/4 v5, 0x0

    if-ne v0, p2, :cond_1

    .line 170
    new-array p2, v4, [F

    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoryHolder;->mTitleSizeCollapsed:I

    int-to-float v0, v0

    aput v0, p2, v5

    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoryHolder;->mTitleSizeExpanded:I

    int-to-float v0, v0

    aput v0, p2, v3

    invoke-static {p2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p2

    .line 172
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoryHolder;->mTitleView:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextAppearance(I)V

    .line 173
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoryHolder;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->getImage()I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 174
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoryHolder;->mExpandedView:Landroid/view/View;

    invoke-virtual {p1, v5}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    .line 176
    :cond_1
    new-array p2, v4, [F

    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoryHolder;->mTitleSizeExpanded:I

    int-to-float v0, v0

    aput v0, p2, v5

    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoryHolder;->mTitleSizeCollapsed:I

    int-to-float v0, v0

    aput v0, p2, v3

    invoke-static {p2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p2

    .line 178
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoryHolder;->mTitleView:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextAppearance(I)V

    .line 179
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoryHolder;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->getImageSmall()I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 180
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoryHolder;->mExpandedView:Landroid/view/View;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    move v1, v2

    .line 183
    :goto_0
    new-instance p1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/-$$Lambda$QuickTipCategoriesActivity$QuickTipCategoryHolder$6J__tgEPtOe9c-txzGgw9IFdAUQ;

    invoke-direct {p1, p0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/-$$Lambda$QuickTipCategoriesActivity$QuickTipCategoryHolder$6J__tgEPtOe9c-txzGgw9IFdAUQ;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoryHolder;I)V

    invoke-virtual {p2, p1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    const-wide/16 v0, 0x14

    .line 184
    invoke-virtual {p2, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    move-result-object p1

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    return-void
.end method

.method public doClick(Landroid/view/View;)V
    .locals 2

    .line 145
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v0, 0x7f0901a5

    if-eq p1, v0, :cond_0

    .line 152
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoryHolder;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity;

    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity;->access$000(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity;)Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoriesAdapter;

    move-result-object p1

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoryHolder;->getAdapterPosition()I

    move-result v0

    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoriesAdapter;->access$100(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoriesAdapter;I)V

    goto :goto_0

    .line 147
    :cond_0
    sget-object p1, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->SCREEN_EVENT_FROM_REFERENS_ID:Lcom/sonymobile/scan3d/analytics/ScreenEvent;

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoryHolder;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity;

    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoryHolder;->mCategory:Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;

    .line 148
    invoke-virtual {v1}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->getScreenEvent()I

    move-result v1

    .line 147
    invoke-virtual {p1, v0, v1}, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->send(Landroid/content/Context;I)V

    .line 149
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoryHolder;->mContext:Landroid/content/Context;

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity$QuickTipCategoryHolder;->mCategory:Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/WizardActivity;->showWizard(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;I)V

    :goto_0
    return-void
.end method
