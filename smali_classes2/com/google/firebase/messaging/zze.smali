.class final synthetic Lcom/google/firebase/messaging/zze;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field private final zzed:Lcom/google/firebase/messaging/zzd;


# direct methods
.method constructor <init>(Lcom/google/firebase/messaging/zzd;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/messaging/zze;->zzed:Lcom/google/firebase/messaging/zzd;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/messaging/zze;->zzed:Lcom/google/firebase/messaging/zzd;

    invoke-virtual {v0}, Lcom/google/firebase/messaging/zzd;->zzat()Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method
