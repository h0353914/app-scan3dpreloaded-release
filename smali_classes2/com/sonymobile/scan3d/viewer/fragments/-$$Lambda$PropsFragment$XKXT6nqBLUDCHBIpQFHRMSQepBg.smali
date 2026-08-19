.class public final synthetic Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PropsFragment$XKXT6nqBLUDCHBIpQFHRMSQepBg;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic f$0:Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;

.field private final synthetic f$1:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PropsFragment$XKXT6nqBLUDCHBIpQFHRMSQepBg;->f$0:Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;

    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PropsFragment$XKXT6nqBLUDCHBIpQFHRMSQepBg;->f$1:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PropsFragment$XKXT6nqBLUDCHBIpQFHRMSQepBg;->f$0:Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PropsFragment$XKXT6nqBLUDCHBIpQFHRMSQepBg;->f$1:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->lambda$loadProp$8(Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;Ljava/lang/String;)V

    return-void
.end method
