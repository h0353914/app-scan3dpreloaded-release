.class public final synthetic Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$2$L6aVZEvTD36-IYv4YfH1UFxXxy4;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderListener;


# instance fields
.field private final synthetic f$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

.field private final synthetic f$1:Ljava/io/File;

.field private final synthetic f$2:Ljava/io/File;

.field private final synthetic f$3:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$VideoRecorder$RecordingListener;


# direct methods
.method public synthetic constructor <init>(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Ljava/io/File;Ljava/io/File;Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$VideoRecorder$RecordingListener;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$2$L6aVZEvTD36-IYv4YfH1UFxXxy4;->f$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    iput-object p2, p0, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$2$L6aVZEvTD36-IYv4YfH1UFxXxy4;->f$1:Ljava/io/File;

    iput-object p3, p0, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$2$L6aVZEvTD36-IYv4YfH1UFxXxy4;->f$2:Ljava/io/File;

    iput-object p4, p0, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$2$L6aVZEvTD36-IYv4YfH1UFxXxy4;->f$3:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$VideoRecorder$RecordingListener;

    return-void
.end method


# virtual methods
.method public final onEncoderFinished()V
    .locals 4

    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$2$L6aVZEvTD36-IYv4YfH1UFxXxy4;->f$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    iget-object v1, p0, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$2$L6aVZEvTD36-IYv4YfH1UFxXxy4;->f$1:Ljava/io/File;

    iget-object v2, p0, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$2$L6aVZEvTD36-IYv4YfH1UFxXxy4;->f$2:Ljava/io/File;

    iget-object v3, p0, Lcom/sonymobile/scan3d/sfmc/-$$Lambda$FaceMimicActivity$2$L6aVZEvTD36-IYv4YfH1UFxXxy4;->f$3:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$VideoRecorder$RecordingListener;

    invoke-static {v0, v1, v2, v3}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$2;->lambda$start$0(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Ljava/io/File;Ljava/io/File;Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$VideoRecorder$RecordingListener;)V

    return-void
.end method
