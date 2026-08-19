.class final Lcom/google/firebase/iid/zzf;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic zzac:Lcom/google/firebase/iid/zze;

.field private final synthetic zzad:Lcom/google/firebase/iid/zzg;


# direct methods
.method constructor <init>(Lcom/google/firebase/iid/zzg;Lcom/google/firebase/iid/zze;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/firebase/iid/zzf;->zzad:Lcom/google/firebase/iid/zzg;

    iput-object p2, p0, Lcom/google/firebase/iid/zzf;->zzac:Lcom/google/firebase/iid/zze;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    const-string v0, "EnhancedIntentService"

    const/4 v1, 0x3

    .line 2
    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "EnhancedIntentService"

    const-string v1, "bg processing of the intent starting now"

    .line 3
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/google/firebase/iid/zzf;->zzad:Lcom/google/firebase/iid/zzg;

    invoke-static {v0}, Lcom/google/firebase/iid/zzg;->zza(Lcom/google/firebase/iid/zzg;)Lcom/google/firebase/iid/zzc;

    move-result-object v0

    iget-object v1, p0, Lcom/google/firebase/iid/zzf;->zzac:Lcom/google/firebase/iid/zze;

    iget-object v1, v1, Lcom/google/firebase/iid/zze;->intent:Landroid/content/Intent;

    invoke-virtual {v0, v1}, Lcom/google/firebase/iid/zzc;->zzd(Landroid/content/Intent;)V

    .line 5
    iget-object v0, p0, Lcom/google/firebase/iid/zzf;->zzac:Lcom/google/firebase/iid/zze;

    invoke-virtual {v0}, Lcom/google/firebase/iid/zze;->finish()V

    return-void
.end method
