.class Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment$ClipSequencePlayersController;
.super Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;
.source "SequenceTipFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ClipSequencePlayersController"
.end annotation


# instance fields
.field private mBulletpoint:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/sonymobile/scan3d/storageservice/ui/tips/Clip;",
            "Landroid/widget/TextView;",
            ">;"
        }
    .end annotation
.end field

.field private mOriginalClips:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/ui/tips/Clip;",
            ">;"
        }
    .end annotation
.end field

.field private mSequence:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "Lcom/sonymobile/scan3d/storageservice/ui/tips/Clip;",
            ">;"
        }
    .end annotation
.end field

.field private mZipResourceFile:Lcom/android/vending/expansion/zipfile/ZipResourceFile;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 179
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;-><init>()V

    .line 186
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment$ClipSequencePlayersController;->mBulletpoint:Ljava/util/Map;

    return-void
.end method

.method synthetic constructor <init>(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment$1;)V
    .locals 0

    .line 179
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment$ClipSequencePlayersController;-><init>()V

    return-void
.end method

.method private prepareNextClip()V
    .locals 4

    .line 216
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment$ClipSequencePlayersController;->mSequence:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->size()I

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 217
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment$ClipSequencePlayersController;->mSequence:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Clip;

    .line 218
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Clip;->shouldLoop()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 219
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment$ClipSequencePlayersController;->mSequence:Ljava/util/ArrayDeque;

    invoke-virtual {v1, v0}, Ljava/util/ArrayDeque;->addLast(Ljava/lang/Object;)V

    .line 222
    :cond_1
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment$ClipSequencePlayersController;->mBulletpoint:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    if-eqz v1, :cond_2

    const/4 v2, 0x1

    .line 223
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setSelected(Z)V

    .line 225
    :cond_2
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment$ClipSequencePlayersController;->mZipResourceFile:Lcom/android/vending/expansion/zipfile/ZipResourceFile;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Clip;->getSourcePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/android/vending/expansion/zipfile/ZipResourceFile;->getAssetFileDescriptor(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v1

    if-nez v1, :cond_3

    .line 227
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment;->access$100()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to find "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Clip;->getSourcePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " in Expansion File"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_3
    const/4 v0, 0x0

    .line 230
    invoke-virtual {p0, v1, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment$ClipSequencePlayersController;->setVideoFileResource(Landroid/content/res/AssetFileDescriptor;I)V

    return-void
.end method

.method private reset()V
    .locals 3

    .line 247
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment$ClipSequencePlayersController;->mOriginalClips:Ljava/util/List;

    if-eqz v0, :cond_1

    .line 248
    new-instance v1, Ljava/util/ArrayDeque;

    invoke-direct {v1, v0}, Ljava/util/ArrayDeque;-><init>(Ljava/util/Collection;)V

    iput-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment$ClipSequencePlayersController;->mSequence:Ljava/util/ArrayDeque;

    .line 249
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment$ClipSequencePlayersController;->mBulletpoint:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    const/4 v2, 0x0

    .line 250
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setSelected(Z)V

    goto :goto_0

    .line 252
    :cond_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment$ClipSequencePlayersController;->prepareNextClip()V

    :cond_1
    return-void
.end method


# virtual methods
.method public init(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;Landroid/view/TextureView;Landroid/view/ViewGroup;Ljava/util/concurrent/Executor;Lcom/android/vending/expansion/zipfile/ZipResourceFile;)V
    .locals 6

    const/4 v3, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p3

    move-object v4, p5

    .line 190
    invoke-virtual/range {v0 .. v5}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment$ClipSequencePlayersController;->init(Landroid/content/Context;Landroid/view/TextureView;Landroid/widget/TextView;Ljava/util/concurrent/Executor;Z)V

    .line 191
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->getTitle()I

    move-result p3

    if-nez p3, :cond_1

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->getDescription()I

    move-result p3

    if-nez p3, :cond_1

    const/4 p3, 0x0

    .line 193
    invoke-virtual {p4, p3}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 195
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->getClips()Ljava/util/List;

    move-result-object p5

    invoke-interface {p5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p5

    :cond_0
    :goto_0
    invoke-interface {p5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Clip;

    .line 196
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Clip;->getText()I

    move-result v1

    if-lez v1, :cond_0

    .line 198
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    const v3, 0x7f0c0033

    .line 200
    invoke-virtual {v2, v3, p4, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 201
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(I)V

    .line 202
    invoke-virtual {v2, p3}, Landroid/widget/TextView;->setSelected(Z)V

    .line 203
    invoke-virtual {p4, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 204
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment$ClipSequencePlayersController;->mBulletpoint:Ljava/util/Map;

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 209
    :cond_1
    iput-object p6, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment$ClipSequencePlayersController;->mZipResourceFile:Lcom/android/vending/expansion/zipfile/ZipResourceFile;

    .line 210
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->getClips()Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment$ClipSequencePlayersController;->mOriginalClips:Ljava/util/List;

    .line 211
    new-instance p1, Ljava/util/ArrayDeque;

    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment$ClipSequencePlayersController;->mOriginalClips:Ljava/util/List;

    invoke-direct {p1, p2}, Ljava/util/ArrayDeque;-><init>(Ljava/util/Collection;)V

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment$ClipSequencePlayersController;->mSequence:Ljava/util/ArrayDeque;

    .line 212
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment$ClipSequencePlayersController;->prepareNextClip()V

    return-void
.end method

.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 0

    .line 258
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment$ClipSequencePlayersController;->prepareNextClip()V

    return-void
.end method

.method public setPageSelected(Z)V
    .locals 1

    .line 235
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment$ClipSequencePlayersController;->mPageSelected:Z

    if-ne v0, p1, :cond_0

    return-void

    .line 236
    :cond_0
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->setPageSelected(Z)V

    if-nez p1, :cond_1

    .line 237
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment$ClipSequencePlayersController;->reset()V

    :cond_1
    return-void
.end method

.method public setResumed(Z)V
    .locals 0

    .line 242
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->setResumed(Z)V

    if-nez p1, :cond_0

    .line 243
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/SequenceTipFragment$ClipSequencePlayersController;->reset()V

    :cond_0
    return-void
.end method
