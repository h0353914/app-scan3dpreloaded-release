.class public Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "PromotionItemViewHolder.java"

# interfaces
.implements Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/GalleryViewHolder;
.implements Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder$PromotionItemListener;
    }
.end annotation


# instance fields
.field private mClose:Landroid/widget/ImageView;

.field private final mContext:Landroid/content/Context;

.field private mDescription:Landroid/widget/TextView;

.field private mDescriptionId:I

.field private mImage:Lcom/facebook/drawee/view/SimpleDraweeView;

.field private mLayout:Landroid/view/View;

.field private mLink:Landroid/widget/TextView;

.field private mPromotionItemListener:Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder$PromotionItemListener;

.field private mScanListener:Lcom/sonymobile/scan3d/storageservice/ui/IScanListener;

.field private mTitle:Landroid/widget/TextView;


# direct methods
.method private constructor <init>(Landroid/content/Context;Landroid/view/View;Lcom/sonymobile/scan3d/storageservice/ui/IScanListener;)V
    .locals 0

    .line 89
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 90
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->mContext:Landroid/content/Context;

    .line 91
    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->mLayout:Landroid/view/View;

    const p1, 0x7f090163

    .line 92
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->mTitle:Landroid/widget/TextView;

    const p1, 0x7f090160

    .line 93
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->mDescription:Landroid/widget/TextView;

    const p1, 0x7f090162

    .line 94
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->mLink:Landroid/widget/TextView;

    const p1, 0x7f090161

    .line 95
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/facebook/drawee/view/SimpleDraweeView;

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->mImage:Lcom/facebook/drawee/view/SimpleDraweeView;

    const p1, 0x7f09015f

    .line 96
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->mClose:Landroid/widget/ImageView;

    .line 97
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->mClose:Landroid/widget/ImageView;

    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 98
    iput-object p3, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->mScanListener:Lcom/sonymobile/scan3d/storageservice/ui/IScanListener;

    return-void
.end method

.method public static newInstance(Landroid/content/Context;Landroid/view/ViewGroup;Lcom/sonymobile/scan3d/storageservice/ui/IScanListener;)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 3

    .line 76
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0c00a8

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 78
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;

    invoke-direct {v0, p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;-><init>(Landroid/content/Context;Landroid/view/View;Lcom/sonymobile/scan3d/storageservice/ui/IScanListener;)V

    return-object v0
.end method

.method private startAction(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 267
    :pswitch_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->mContext:Landroid/content/Context;

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/QuickTipCategoriesActivity;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 264
    :pswitch_1
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->mScanListener:Lcom/sonymobile/scan3d/storageservice/ui/IScanListener;

    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/ui/IScanListener;->onFaceMimicPromotionClicked()V

    goto :goto_0

    :pswitch_2
    const-string p1, "extra_whats_new_face_blend_flow"

    .line 270
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->mContext:Landroid/content/Context;

    const v1, 0x7f100109

    .line 271
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 270
    invoke-direct {p0, p1, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->startGallery(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x7f100041
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private startGallery(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 285
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.PICK"

    sget-object v2, Lcom/sonymobile/scan3d/storageservice/provider/Contract$FileRecord;->CONTENT_URI:Landroid/net/Uri;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 286
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "application/vnd.sony.scan3d"

    .line 287
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 288
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v2, 0x100

    invoke-static {v2}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->scanTypeToString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v2, 0x101

    .line 290
    invoke-static {v2}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->scanTypeToString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "extra_whats_new_flow_flow"

    .line 291
    invoke-virtual {v0, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "com.sonymobile.scan3d.intent.extra.SCAN_TYPE"

    .line 292
    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "com.sonymobile.scan3d.intent.extra.EXPLANATORY_TEXT"

    .line 293
    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "pick_internal"

    const/4 p2, 0x1

    .line 294
    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 295
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->mContext:Landroid/content/Context;

    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method


# virtual methods
.method public bind(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/ui/gallery/item/GalleryItem;Z)V
    .locals 0

    return-void
.end method

.method public doClick(Landroid/view/View;)V
    .locals 1

    .line 110
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v0, 0x7f09015f

    if-eq p1, v0, :cond_0

    .line 119
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->mLayout:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 120
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->startAction(I)V

    goto :goto_0

    .line 113
    :cond_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->mPromotionItemListener:Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder$PromotionItemListener;

    if-eqz p1, :cond_1

    .line 114
    invoke-interface {p1, p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder$PromotionItemListener;->onClose(Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public getDescriptionId()I
    .locals 1
    .annotation build Landroidx/annotation/StringRes;
    .end annotation

    .line 161
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->mDescriptionId:I

    return v0
.end method

.method protected setBackgroundColor(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 194
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->mLayout:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    return-void
.end method

.method protected setDescription(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 150
    iput p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->mDescriptionId:I

    .line 151
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->mDescription:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    return-void
.end method

.method protected setImage(I)V
    .locals 3
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 170
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 173
    new-instance v1, Landroid/net/Uri$Builder;

    invoke-direct {v1}, Landroid/net/Uri$Builder;-><init>()V

    const-string v2, "android.resource"

    .line 174
    invoke-virtual {v1, v2}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    .line 175
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getResourcePackageName(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    .line 176
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getResourceTypeName(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    .line 177
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getResourceEntryName(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    .line 178
    invoke-virtual {p1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    .line 181
    invoke-static {}, Lcom/facebook/drawee/backends/pipeline/Fresco;->newDraweeControllerBuilder()Lcom/facebook/drawee/backends/pipeline/PipelineDraweeControllerBuilder;

    move-result-object v0

    .line 182
    invoke-virtual {v0, p1}, Lcom/facebook/drawee/backends/pipeline/PipelineDraweeControllerBuilder;->setUri(Landroid/net/Uri;)Lcom/facebook/drawee/backends/pipeline/PipelineDraweeControllerBuilder;

    move-result-object p1

    const/4 v0, 0x1

    .line 183
    invoke-virtual {p1, v0}, Lcom/facebook/drawee/backends/pipeline/PipelineDraweeControllerBuilder;->setAutoPlayAnimations(Z)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    move-result-object p1

    check-cast p1, Lcom/facebook/drawee/backends/pipeline/PipelineDraweeControllerBuilder;

    .line 184
    invoke-virtual {p1}, Lcom/facebook/drawee/backends/pipeline/PipelineDraweeControllerBuilder;->build()Lcom/facebook/drawee/controller/AbstractDraweeController;

    move-result-object p1

    .line 185
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->mImage:Lcom/facebook/drawee/view/SimpleDraweeView;

    invoke-virtual {v0, p1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setController(Lcom/facebook/drawee/interfaces/DraweeController;)V

    return-void
.end method

.method protected setLink(II)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param
    .param p2    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    if-eqz p1, :cond_0

    .line 206
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->mLink:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 207
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->mLink:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 208
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->mLayout:Landroid/view/View;

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 209
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->mLayout:Landroid/view/View;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    goto :goto_0

    .line 211
    :cond_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->mLink:Landroid/widget/TextView;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 212
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->mLayout:Landroid/view/View;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :goto_0
    return-void
.end method

.method protected setListener(Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder$PromotionItemListener;)V
    .locals 0

    .line 222
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->mPromotionItemListener:Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder$PromotionItemListener;

    return-void
.end method

.method protected setRemovable(Z)V
    .locals 1

    .line 131
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->mClose:Landroid/widget/ImageView;

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/4 p1, 0x4

    :goto_0
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setVisibility(I)V

    return-void
.end method

.method protected setTitle(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 140
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->mTitle:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    return-void
.end method

.method protected updateViewWidth(I)V
    .locals 3

    .line 231
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->mLayout:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;

    const v1, 0x7f070130

    packed-switch p1, :pswitch_data_0

    .line 252
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    float-to-int p1, p1

    iput p1, v0, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;->width:I

    goto :goto_0

    .line 240
    :pswitch_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p1

    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    const/4 v2, 0x2

    if-ne p1, v2, :cond_0

    .line 242
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    div-int/2addr p1, v2

    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->mContext:Landroid/content/Context;

    .line 243
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f07012e

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    float-to-int v1, v1

    sub-int/2addr p1, v1

    iput p1, v0, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;->width:I

    goto :goto_0

    .line 246
    :cond_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/PromotionItemViewHolder;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    float-to-int p1, p1

    iput p1, v0, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;->width:I

    goto :goto_0

    :pswitch_1
    const/4 p1, -0x1

    .line 235
    iput p1, v0, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;->width:I

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
