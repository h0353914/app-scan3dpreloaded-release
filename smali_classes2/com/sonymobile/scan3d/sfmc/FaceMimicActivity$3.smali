.class Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$3;
.super Ljava/lang/Object;
.source "FaceMimicActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->showTimer()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final mStart:J

.field final synthetic this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)V
    .locals 2

    .line 715
    iput-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$3;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 719
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$3;->mStart:J

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 724
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$3;->mStart:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    const-wide/16 v2, 0xe10

    .line 725
    div-long v2, v0, v2

    .line 726
    iget-object v4, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$3;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    const v5, 0x7f090167

    invoke-virtual {v4, v5}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    sget-object v5, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v6, "%02d:%02d:%02d"

    const/4 v7, 0x3

    new-array v7, v7, [Ljava/lang/Object;

    .line 727
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    const/4 v9, 0x0

    aput-object v8, v7, v9

    const-wide/16 v8, 0x3c

    mul-long/2addr v2, v8

    mul-long/2addr v2, v8

    sub-long v2, v0, v2

    div-long/2addr v2, v8

    .line 728
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v7, v3

    rem-long/2addr v0, v8

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    const/4 v1, 0x2

    aput-object v0, v7, v1

    .line 727
    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 726
    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 729
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$3;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    invoke-static {v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->access$200(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)Landroid/os/Handler;

    move-result-object v0

    const-wide/16 v1, 0x1f4

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
