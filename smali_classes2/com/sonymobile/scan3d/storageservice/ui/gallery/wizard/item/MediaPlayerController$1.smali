.class Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController$1;
.super Landroid/os/AsyncTask;
.source "MediaPlayerController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->setVideoFileResource(Landroid/content/res/AssetFileDescriptor;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;

.field final synthetic val$afd:Landroid/content/res/AssetFileDescriptor;

.field final synthetic val$subtitleResId:I


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;Landroid/content/res/AssetFileDescriptor;I)V
    .locals 0

    .line 135
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController$1;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;

    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController$1;->val$afd:Landroid/content/res/AssetFileDescriptor;

    iput p3, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController$1;->val$subtitleResId:I

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 135
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController$1;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 6

    .line 139
    :try_start_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController$1;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;

    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->access$000(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;)Landroid/media/MediaPlayer;

    move-result-object p1

    if-nez p1, :cond_0

    .line 140
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController$1;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;

    new-instance v0, Landroid/media/MediaPlayer;

    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->access$002(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;Landroid/media/MediaPlayer;)Landroid/media/MediaPlayer;

    .line 141
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController$1;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;

    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->access$000(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;)Landroid/media/MediaPlayer;

    move-result-object p1

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController$1;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;

    invoke-virtual {p1, v0}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 143
    :cond_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController$1;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;

    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->access$000(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;)Landroid/media/MediaPlayer;

    move-result-object p1

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->reset()V

    .line 144
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController$1;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;

    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->access$000(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;)Landroid/media/MediaPlayer;

    move-result-object v0

    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController$1;->val$afd:Landroid/content/res/AssetFileDescriptor;

    invoke-virtual {p1}, Landroid/content/res/AssetFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v1

    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController$1;->val$afd:Landroid/content/res/AssetFileDescriptor;

    invoke-virtual {p1}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v2

    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController$1;->val$afd:Landroid/content/res/AssetFileDescriptor;

    invoke-virtual {p1}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    move-result-wide v4

    invoke-virtual/range {v0 .. v5}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;JJ)V

    .line 145
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController$1;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;

    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->access$000(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;)Landroid/media/MediaPlayer;

    move-result-object p1

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->prepare()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p1, 0x0

    return-object p1

    :catch_0
    move-exception p1

    .line 147
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to start a video["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController$1;->val$afd:Landroid/content/res/AssetFileDescriptor;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, "] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected bridge synthetic onCancelled(Ljava/lang/Object;)V
    .locals 0

    .line 135
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController$1;->onCancelled(Ljava/lang/Void;)V

    return-void
.end method

.method protected onCancelled(Ljava/lang/Void;)V
    .locals 1

    .line 165
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController$1;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;

    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->access$110(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;)I

    .line 167
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController$1;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;

    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->access$100(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;)I

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController$1;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;

    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->access$000(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;)Landroid/media/MediaPlayer;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 168
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController$1;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;

    const/4 v0, 0x1

    iput-boolean v0, p1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mIsMediaPlayerPrepared:Z

    .line 169
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->access$400(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;)V

    :cond_0
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 135
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController$1;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 1

    .line 154
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController$1;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;

    const/4 v0, 0x0

    iput-boolean v0, p1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mSurfaceSet:Z

    .line 155
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->access$110(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;)I

    .line 156
    iget p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController$1;->val$subtitleResId:I

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController$1;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;

    invoke-static {v0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->access$200(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;I)V

    .line 157
    :cond_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController$1;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;

    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->access$100(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;)I

    move-result p1

    if-nez p1, :cond_1

    .line 158
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController$1;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;

    const/4 v0, 0x1

    iput-boolean v0, p1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mIsMediaPlayerPrepared:Z

    .line 159
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->access$300(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;)V

    :cond_1
    return-void
.end method
