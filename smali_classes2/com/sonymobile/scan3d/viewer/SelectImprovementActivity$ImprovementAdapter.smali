.class Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity$ImprovementAdapter;
.super Landroid/widget/BaseAdapter;
.source "SelectImprovementActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ImprovementAdapter"
.end annotation


# static fields
.field private static final OVAL_OUTLINE_PROVIDER:Landroid/view/ViewOutlineProvider;


# instance fields
.field private mCache:Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;

.field private mContext:Landroid/content/Context;

.field private mImprovementFileSet:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 71
    new-instance v0, Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity$ImprovementAdapter$1;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity$ImprovementAdapter$1;-><init>()V

    sput-object v0, Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity$ImprovementAdapter;->OVAL_OUTLINE_PROVIDER:Landroid/view/ViewOutlineProvider;

    return-void
.end method

.method constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 98
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 99
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity$ImprovementAdapter;->mContext:Landroid/content/Context;

    .line 100
    new-instance p1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;

    invoke-direct {p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity$ImprovementAdapter;->mCache:Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;

    return-void
.end method

.method static synthetic access$000(Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity$ImprovementAdapter;)V
    .locals 0

    .line 66
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity$ImprovementAdapter;->release()V

    return-void
.end method

.method static synthetic access$100(Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity$ImprovementAdapter;Ljava/util/List;)V
    .locals 0

    .line 66
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity$ImprovementAdapter;->setImprovedFileSets(Ljava/util/List;)V

    return-void
.end method

.method private release()V
    .locals 1

    .line 117
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity$ImprovementAdapter;->mCache:Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;->stop()V

    return-void
.end method

.method private setImprovedFileSets(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;",
            ">;)V"
        }
    .end annotation

    .line 109
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity$ImprovementAdapter;->mImprovementFileSet:Ljava/util/List;

    .line 110
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity$ImprovementAdapter;->notifyDataSetChanged()V

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .line 122
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity$ImprovementAdapter;->mImprovementFileSet:Ljava/util/List;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getItem(I)Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;
    .locals 1

    .line 127
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity$ImprovementAdapter;->mImprovementFileSet:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    return-object p1
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 66
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity$ImprovementAdapter;->getItem(I)Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object p1

    return-object p1
.end method

.method public getItemId(I)J
    .locals 2

    .line 132
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity$ImprovementAdapter;->getItem(I)Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object p1

    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getId()J

    move-result-wide v0

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    if-nez p2, :cond_0

    .line 138
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity$ImprovementAdapter;->mContext:Landroid/content/Context;

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v0, 0x7f0c0039

    const/4 v1, 0x0

    .line 139
    invoke-virtual {p2, v0, p3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 142
    :cond_0
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity$ImprovementAdapter;->getItem(I)Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object p1

    const p3, 0x7f0900f7

    .line 143
    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/widget/TextView;

    .line 144
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const p3, 0x7f0900f4

    .line 145
    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 146
    sget-object v0, Lcom/sonymobile/scan3d/viewer/SelectImprovementActivity$ImprovementAdapter;->OVAL_OUTLINE_PROVIDER:Landroid/view/ViewOutlineProvider;

    invoke-virtual {p3, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    const/4 v0, 0x1

    .line 147
    invoke-virtual {p3, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setClipToOutline(Z)V

    .line 148
    invoke-static {p3, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/LazyLoader;->load(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V

    return-object p2
.end method
