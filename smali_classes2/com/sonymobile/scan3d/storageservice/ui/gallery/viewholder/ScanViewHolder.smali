.class public Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "ScanViewHolder.java"

# interfaces
.implements Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/GalleryViewHolder;
.implements Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;


# static fields
.field private static final PREVIEW_ALPHA_VALUE_OPAQUE:I = 0xff

.field private static final PREVIEW_ALPHA_VALUE_TRANSPARENT:I = 0x40

.field public static final VIEW_TYPE:I = 0x7f0c006a


# instance fields
.field private mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

.field private mImprovementIndicator:Lcom/sonymobile/scan3d/storageservice/ui/component/ImprovementIndicator;

.field private final mOnScanMenuClicked:Lcom/sonymobile/scan3d/storageservice/ui/IOnScanMenuItemClickListener;

.field private final mPreviewImage:Lcom/facebook/drawee/view/SimpleDraweeView;

.field private mPreviewName:Landroid/widget/TextView;

.field private mScanListener:Lcom/sonymobile/scan3d/storageservice/ui/IScanListener;

.field private final mShowWebShare:Z

.field private mUploadedIndicator:Lcom/sonymobile/scan3d/storageservice/ui/component/UploadIndicator;

.field private final mWebviewButtonListener:Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;


# direct methods
.method constructor <init>(Landroid/view/View;Lcom/sonymobile/scan3d/storageservice/ui/IScanListener;Lcom/sonymobile/scan3d/storageservice/ui/IOnScanMenuItemClickListener;Z)V
    .locals 1

    .line 123
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 80
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder$1;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder$1;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder;->mWebviewButtonListener:Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;

    const v0, 0x7f090157

    .line 124
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/facebook/drawee/view/SimpleDraweeView;

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder;->mPreviewImage:Lcom/facebook/drawee/view/SimpleDraweeView;

    const v0, 0x7f09020f

    .line 125
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/storageservice/ui/component/UploadIndicator;

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder;->mUploadedIndicator:Lcom/sonymobile/scan3d/storageservice/ui/component/UploadIndicator;

    const v0, 0x7f0900f5

    .line 126
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/storageservice/ui/component/ImprovementIndicator;

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder;->mImprovementIndicator:Lcom/sonymobile/scan3d/storageservice/ui/component/ImprovementIndicator;

    const v0, 0x7f090158

    .line 127
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder;->mPreviewName:Landroid/widget/TextView;

    .line 128
    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder;->mScanListener:Lcom/sonymobile/scan3d/storageservice/ui/IScanListener;

    .line 129
    iput-object p3, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder;->mOnScanMenuClicked:Lcom/sonymobile/scan3d/storageservice/ui/IOnScanMenuItemClickListener;

    .line 130
    iput-boolean p4, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder;->mShowWebShare:Z

    return-void
.end method

.method static synthetic access$000(Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder;)Lcom/sonymobile/scan3d/storageservice/ui/IOnScanMenuItemClickListener;
    .locals 0

    .line 35
    iget-object p0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder;->mOnScanMenuClicked:Lcom/sonymobile/scan3d/storageservice/ui/IOnScanMenuItemClickListener;

    return-object p0
.end method

.method private ceaseListeners()V
    .locals 2

    const/4 v0, 0x0

    .line 150
    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder;->mScanListener:Lcom/sonymobile/scan3d/storageservice/ui/IScanListener;

    .line 151
    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    .line 152
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder;->mPreviewImage:Lcom/facebook/drawee/view/SimpleDraweeView;

    invoke-virtual {v1, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private initiateListeners(Lcom/sonymobile/scan3d/storageservice/ui/IScanListener;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V
    .locals 0

    .line 141
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder;->mScanListener:Lcom/sonymobile/scan3d/storageservice/ui/IScanListener;

    .line 142
    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    .line 143
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder;->mPreviewImage:Lcom/facebook/drawee/view/SimpleDraweeView;

    invoke-virtual {p1, p0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public static newInstance(Landroid/content/Context;Landroid/view/ViewGroup;Lcom/sonymobile/scan3d/storageservice/ui/IScanListener;Lcom/sonymobile/scan3d/storageservice/ui/IOnScanMenuItemClickListener;Z)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 2

    .line 109
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p0

    const v0, 0x7f0c006a

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    .line 110
    new-instance p1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder;

    invoke-direct {p1, p0, p2, p3, p4}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder;-><init>(Landroid/view/View;Lcom/sonymobile/scan3d/storageservice/ui/IScanListener;Lcom/sonymobile/scan3d/storageservice/ui/IOnScanMenuItemClickListener;Z)V

    return-object p1
.end method


# virtual methods
.method public bind(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/ui/gallery/item/GalleryItem;Z)V
    .locals 2

    .line 162
    check-cast p2, Lcom/sonymobile/scan3d/storageservice/ui/gallery/item/ScanItem;

    .line 163
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/item/ScanItem;->getFileSet()Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object p1

    .line 164
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getName()Ljava/lang/String;

    move-result-object v0

    .line 166
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder;->mPreviewImage:Lcom/facebook/drawee/view/SimpleDraweeView;

    invoke-static {v1, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/LazyLoader;->load(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V

    .line 168
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder;->mPreviewName:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 170
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder;->mUploadedIndicator:Lcom/sonymobile/scan3d/storageservice/ui/component/UploadIndicator;

    invoke-virtual {v1, p1, p3}, Lcom/sonymobile/scan3d/storageservice/ui/component/UploadIndicator;->onBound(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Z)V

    .line 171
    iget-object p3, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder;->mImprovementIndicator:Lcom/sonymobile/scan3d/storageservice/ui/component/ImprovementIndicator;

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/item/ScanItem;->getImprovement()Lcom/sonymobile/scan3d/storageservice/provider/Improvement;

    move-result-object p2

    invoke-virtual {p3, p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/component/ImprovementIndicator;->onBound(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/provider/Improvement;)V

    .line 172
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder;->mPreviewImage:Lcom/facebook/drawee/view/SimpleDraweeView;

    invoke-virtual {p2, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 175
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->isRemote()Z

    move-result p2

    if-nez p2, :cond_0

    .line 176
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder;->mScanListener:Lcom/sonymobile/scan3d/storageservice/ui/IScanListener;

    invoke-direct {p0, p2, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder;->initiateListeners(Lcom/sonymobile/scan3d/storageservice/ui/IScanListener;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V

    .line 179
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder;->mPreviewImage:Lcom/facebook/drawee/view/SimpleDraweeView;

    const/16 p2, 0xff

    invoke-virtual {p1, p2}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageAlpha(I)V

    goto :goto_0

    .line 182
    :cond_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder;->ceaseListeners()V

    .line 185
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder;->mPreviewImage:Lcom/facebook/drawee/view/SimpleDraweeView;

    const/16 p2, 0x40

    invoke-virtual {p1, p2}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageAlpha(I)V

    :goto_0
    return-void
.end method

.method public doClick(Landroid/view/View;)V
    .locals 1

    .line 157
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder;->mScanListener:Lcom/sonymobile/scan3d/storageservice/ui/IScanListener;

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/viewholder/ScanViewHolder;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    invoke-interface {p1, v0}, Lcom/sonymobile/scan3d/storageservice/ui/IScanListener;->onScanClicked(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V

    return-void
.end method
