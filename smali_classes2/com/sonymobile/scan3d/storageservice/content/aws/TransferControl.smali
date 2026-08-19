.class public final Lcom/sonymobile/scan3d/storageservice/content/aws/TransferControl;
.super Ljava/lang/Object;
.source "TransferControl.java"


# static fields
.field private static final REFRESH_SAMPLE_DELAY:J = 0x12cL


# instance fields
.field private final mObserver:Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferObserver;

.field private final mUtility:Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferUtility;


# direct methods
.method constructor <init>(Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferUtility;Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferObserver;)V
    .locals 0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/TransferControl;->mUtility:Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferUtility;

    .line 40
    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/TransferControl;->mObserver:Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferObserver;

    return-void
.end method


# virtual methods
.method public cancel()Z
    .locals 2

    .line 68
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/TransferControl;->mObserver:Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferObserver;

    invoke-virtual {v0}, Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferObserver;->getId()I

    move-result v0

    .line 70
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/TransferControl;->mObserver:Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferObserver;

    invoke-virtual {v1}, Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferObserver;->cleanTransferListener()V

    .line 72
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/TransferControl;->mUtility:Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferUtility;

    invoke-virtual {v1, v0}, Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferUtility;->cancel(I)Z

    move-result v0

    return v0
.end method

.method public isRunning()Z
    .locals 2

    .line 98
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/content/aws/TransferControl$1;->$SwitchMap$com$amazonaws$mobileconnectors$s3$transferutility$TransferState:[I

    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/TransferControl;->mObserver:Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferObserver;

    invoke-virtual {v1}, Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferObserver;->getState()Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferState;

    move-result-object v1

    invoke-virtual {v1}, Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    const/4 v0, 0x1

    goto :goto_0

    :pswitch_0
    const/4 v0, 0x0

    :goto_0
    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public monitor(Lcom/sonymobile/scan3d/storageservice/Cancellable;)Z
    .locals 8

    const-wide/16 v0, 0x0

    .line 51
    :cond_0
    :goto_0
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/Cancellable;->isCancelled()Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/content/aws/TransferControl;->isRunning()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 52
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long v4, v2, v0

    const-wide/16 v6, 0x12c

    cmp-long v4, v4, v6

    if-lez v4, :cond_0

    .line 54
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/TransferControl;->mObserver:Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferObserver;

    invoke-virtual {v0}, Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferObserver;->refresh()V

    move-wide v0, v2

    goto :goto_0

    .line 58
    :cond_1
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/TransferControl;->mObserver:Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferObserver;

    invoke-virtual {p1}, Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferObserver;->refresh()V

    .line 59
    sget-object p1, Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferState;->COMPLETED:Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferState;

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/TransferControl;->mObserver:Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferObserver;

    invoke-virtual {v0}, Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferObserver;->getState()Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferState;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferState;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public pause()I
    .locals 2

    .line 81
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/TransferControl;->mObserver:Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferObserver;

    invoke-virtual {v0}, Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferObserver;->getId()I

    move-result v0

    .line 83
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/TransferControl;->mObserver:Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferObserver;

    invoke-virtual {v1}, Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferObserver;->cleanTransferListener()V

    .line 85
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/TransferControl;->mUtility:Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferUtility;

    invoke-virtual {v1, v0}, Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferUtility;->pause(I)Z

    return v0
.end method
