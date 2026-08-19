.class Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout$InternalViewPagerListener;
.super Ljava/lang/Object;
.source "SlidingTabLayout.java"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "InternalViewPagerListener"
.end annotation


# instance fields
.field private mScrollState:I

.field final synthetic this$0:Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;


# direct methods
.method private constructor <init>(Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;)V
    .locals 0

    .line 257
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout$InternalViewPagerListener;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout$1;)V
    .locals 0

    .line 257
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout$InternalViewPagerListener;-><init>(Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;)V

    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .locals 1

    .line 283
    iput p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout$InternalViewPagerListener;->mScrollState:I

    .line 285
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout$InternalViewPagerListener;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;

    invoke-static {v0}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->access$400(Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;)Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 286
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout$InternalViewPagerListener;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;

    invoke-static {v0}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->access$400(Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;)Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;

    move-result-object v0

    invoke-interface {v0, p1}, Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;->onPageScrollStateChanged(I)V

    :cond_0
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 2

    .line 262
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout$InternalViewPagerListener;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;

    invoke-static {v0}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->access$200(Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;)Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;

    move-result-object v0

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->getChildCount()I

    move-result v0

    if-eqz v0, :cond_3

    if-ltz p1, :cond_3

    if-lt p1, v0, :cond_0

    goto :goto_1

    .line 267
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout$InternalViewPagerListener;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;

    invoke-static {v0}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->access$200(Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;)Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->onViewPagerPageChanged(IF)V

    .line 269
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout$InternalViewPagerListener;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;

    invoke-static {v0}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->access$200(Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;)Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 271
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v0

    int-to-float v0, v0

    mul-float/2addr v0, p2

    float-to-int v0, v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 273
    :goto_0
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout$InternalViewPagerListener;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;

    invoke-static {v1, p1, v0}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->access$300(Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;II)V

    .line 275
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout$InternalViewPagerListener;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;

    invoke-static {v0}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->access$400(Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;)Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 276
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout$InternalViewPagerListener;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;

    invoke-static {v0}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->access$400(Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;)Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3}, Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;->onPageScrolled(IFI)V

    :cond_2
    return-void

    :cond_3
    :goto_1
    return-void
.end method

.method public onPageSelected(I)V
    .locals 2

    .line 292
    iget v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout$InternalViewPagerListener;->mScrollState:I

    if-nez v0, :cond_0

    .line 293
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout$InternalViewPagerListener;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;

    invoke-static {v0}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->access$200(Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;)Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->onViewPagerPageChanged(IF)V

    .line 294
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout$InternalViewPagerListener;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->access$300(Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;II)V

    .line 297
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout$InternalViewPagerListener;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;

    invoke-static {v0}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->access$400(Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;)Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 298
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout$InternalViewPagerListener;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;

    invoke-static {v0}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->access$400(Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;)Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;

    move-result-object v0

    invoke-interface {v0, p1}, Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;->onPageSelected(I)V

    :cond_1
    return-void
.end method
