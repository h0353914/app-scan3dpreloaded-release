.class Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService$InitTask;
.super Landroid/os/AsyncTask;
.source "ActionService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "InitTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field private final mServiceRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;",
            ">;"
        }
    .end annotation
.end field

.field private final mStartId:I


# direct methods
.method private constructor <init>(Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;I)V
    .locals 1

    .line 117
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 118
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService$InitTask;->mServiceRef:Ljava/lang/ref/WeakReference;

    .line 119
    iput p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService$InitTask;->mStartId:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;ILcom/sonymobile/scan3d/storageservice/ui/upload/ActionService$1;)V
    .locals 0

    .line 99
    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService$InitTask;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;I)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 99
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService$InitTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 99
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService$InitTask;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 1

    .line 129
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 130
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService$InitTask;->mServiceRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;

    if-eqz p1, :cond_0

    .line 133
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService$InitTask;->mStartId:I

    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;->access$000(Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;I)V

    :cond_0
    return-void
.end method
