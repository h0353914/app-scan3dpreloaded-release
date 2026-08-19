.class final synthetic Lcom/google/firebase/iid/zzai;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final zzcc:Lcom/google/firebase/iid/zzae;

.field private final zzcj:Lcom/google/firebase/iid/zzaj;


# direct methods
.method constructor <init>(Lcom/google/firebase/iid/zzae;Lcom/google/firebase/iid/zzaj;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/iid/zzai;->zzcc:Lcom/google/firebase/iid/zzae;

    iput-object p2, p0, Lcom/google/firebase/iid/zzai;->zzcj:Lcom/google/firebase/iid/zzaj;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/firebase/iid/zzai;->zzcc:Lcom/google/firebase/iid/zzae;

    iget-object v1, p0, Lcom/google/firebase/iid/zzai;->zzcj:Lcom/google/firebase/iid/zzaj;

    .line 2
    iget v1, v1, Lcom/google/firebase/iid/zzaj;->zzck:I

    invoke-virtual {v0, v1}, Lcom/google/firebase/iid/zzae;->zza(I)V

    return-void
.end method
