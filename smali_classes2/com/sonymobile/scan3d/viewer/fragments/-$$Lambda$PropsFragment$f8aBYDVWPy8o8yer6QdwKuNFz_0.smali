.class public final synthetic Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PropsFragment$f8aBYDVWPy8o8yer6QdwKuNFz_0;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic f$0:Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;

.field private final synthetic f$1:Z

.field private final synthetic f$2:Ljava/io/File;


# direct methods
.method public synthetic constructor <init>(Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;ZLjava/io/File;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PropsFragment$f8aBYDVWPy8o8yer6QdwKuNFz_0;->f$0:Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;

    iput-boolean p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PropsFragment$f8aBYDVWPy8o8yer6QdwKuNFz_0;->f$1:Z

    iput-object p3, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PropsFragment$f8aBYDVWPy8o8yer6QdwKuNFz_0;->f$2:Ljava/io/File;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PropsFragment$f8aBYDVWPy8o8yer6QdwKuNFz_0;->f$0:Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;

    iget-boolean v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PropsFragment$f8aBYDVWPy8o8yer6QdwKuNFz_0;->f$1:Z

    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PropsFragment$f8aBYDVWPy8o8yer6QdwKuNFz_0;->f$2:Ljava/io/File;

    invoke-static {v0, v1, v2}, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->lambda$null$2(Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;ZLjava/io/File;)V

    return-void
.end method
