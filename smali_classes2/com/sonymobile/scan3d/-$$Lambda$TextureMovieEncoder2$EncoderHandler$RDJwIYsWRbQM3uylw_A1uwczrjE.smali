.class public final synthetic Lcom/sonymobile/scan3d/-$$Lambda$TextureMovieEncoder2$EncoderHandler$RDJwIYsWRbQM3uylw_A1uwczrjE;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic f$0:Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderListener;


# direct methods
.method public synthetic constructor <init>(Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderListener;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/-$$Lambda$TextureMovieEncoder2$EncoderHandler$RDJwIYsWRbQM3uylw_A1uwczrjE;->f$0:Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderListener;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Lcom/sonymobile/scan3d/-$$Lambda$TextureMovieEncoder2$EncoderHandler$RDJwIYsWRbQM3uylw_A1uwczrjE;->f$0:Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderListener;

    invoke-static {v0}, Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderHandler;->lambda$handleMessage$0(Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderListener;)V

    return-void
.end method
