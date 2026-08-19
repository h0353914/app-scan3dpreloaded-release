.class Lcom/sonymobile/scan3d/AudioPlayer$HintPlayer;
.super Landroid/media/MediaPlayer;
.source "AudioPlayer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/AudioPlayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "HintPlayer"
.end annotation


# instance fields
.field private final mId:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 121
    invoke-direct {p0}, Landroid/media/MediaPlayer;-><init>()V

    .line 122
    iput p1, p0, Lcom/sonymobile/scan3d/AudioPlayer$HintPlayer;->mId:I

    return-void
.end method


# virtual methods
.method public getId()I
    .locals 1

    .line 126
    iget v0, p0, Lcom/sonymobile/scan3d/AudioPlayer$HintPlayer;->mId:I

    return v0
.end method
