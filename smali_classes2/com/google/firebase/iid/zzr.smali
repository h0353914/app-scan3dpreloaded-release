.class final synthetic Lcom/google/firebase/iid/zzr;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final zzbn:Lcom/google/firebase/iid/zzs;

.field private final zzbo:Landroid/os/Bundle;

.field private final zzbp:Lcom/google/android/gms/tasks/TaskCompletionSource;


# direct methods
.method constructor <init>(Lcom/google/firebase/iid/zzs;Landroid/os/Bundle;Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/iid/zzr;->zzbn:Lcom/google/firebase/iid/zzs;

    iput-object p2, p0, Lcom/google/firebase/iid/zzr;->zzbo:Landroid/os/Bundle;

    iput-object p3, p0, Lcom/google/firebase/iid/zzr;->zzbp:Lcom/google/android/gms/tasks/TaskCompletionSource;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget-object v0, p0, Lcom/google/firebase/iid/zzr;->zzbn:Lcom/google/firebase/iid/zzs;

    iget-object v1, p0, Lcom/google/firebase/iid/zzr;->zzbo:Landroid/os/Bundle;

    iget-object v2, p0, Lcom/google/firebase/iid/zzr;->zzbp:Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-virtual {v0, v1, v2}, Lcom/google/firebase/iid/zzs;->zza(Landroid/os/Bundle;Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    return-void
.end method
