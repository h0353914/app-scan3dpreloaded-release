.class public final synthetic Lcom/sonymobile/scan3d/storageservice/content/-$$Lambda$DYxCPdvdj3LHfHcx-PYvCbd9sxE;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field private final synthetic f$0:Landroid/app/job/JobParameters;


# direct methods
.method public synthetic constructor <init>(Landroid/app/job/JobParameters;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/content/-$$Lambda$DYxCPdvdj3LHfHcx-PYvCbd9sxE;->f$0:Landroid/app/job/JobParameters;

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 1

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/-$$Lambda$DYxCPdvdj3LHfHcx-PYvCbd9sxE;->f$0:Landroid/app/job/JobParameters;

    check-cast p1, Landroid/app/job/JobWorkItem;

    invoke-virtual {v0, p1}, Landroid/app/job/JobParameters;->completeWork(Landroid/app/job/JobWorkItem;)V

    return-void
.end method
