.class final synthetic Lcom/google/firebase/iid/zzad;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/Handler$Callback;


# instance fields
.field private final zzcc:Lcom/google/firebase/iid/zzae;


# direct methods
.method constructor <init>(Lcom/google/firebase/iid/zzae;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/iid/zzad;->zzcc:Lcom/google/firebase/iid/zzae;

    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)Z
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/iid/zzad;->zzcc:Lcom/google/firebase/iid/zzae;

    invoke-virtual {v0, p1}, Lcom/google/firebase/iid/zzae;->zza(Landroid/os/Message;)Z

    move-result p1

    return p1
.end method
