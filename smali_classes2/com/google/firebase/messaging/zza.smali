.class public final Lcom/google/firebase/messaging/zza;
.super Ljava/lang/Object;


# instance fields
.field public final id:I

.field public final tag:Ljava/lang/String;

.field public final zzds:Landroidx/core/app/NotificationCompat$Builder;


# direct methods
.method constructor <init>(Landroidx/core/app/NotificationCompat$Builder;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/google/firebase/messaging/zza;->zzds:Landroidx/core/app/NotificationCompat$Builder;

    .line 3
    iput-object p2, p0, Lcom/google/firebase/messaging/zza;->tag:Ljava/lang/String;

    const/4 p1, 0x0

    .line 4
    iput p1, p0, Lcom/google/firebase/messaging/zza;->id:I

    return-void
.end method
