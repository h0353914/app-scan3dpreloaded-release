.class public final synthetic Lcom/sonymobile/scan3d/animation/-$$Lambda$RigModelManager$cEekP-cjdjCu7t_Fkh7n1_f837k;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field private final synthetic f$0:Landroid/net/Uri;


# direct methods
.method public synthetic constructor <init>(Landroid/net/Uri;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/animation/-$$Lambda$RigModelManager$cEekP-cjdjCu7t_Fkh7n1_f837k;->f$0:Landroid/net/Uri;

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 1

    iget-object v0, p0, Lcom/sonymobile/scan3d/animation/-$$Lambda$RigModelManager$cEekP-cjdjCu7t_Fkh7n1_f837k;->f$0:Landroid/net/Uri;

    check-cast p1, Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$GltfConversionListener;

    invoke-static {v0, p1}, Lcom/sonymobile/scan3d/animation/RigModelManager;->lambda$onConversionFailed$1(Landroid/net/Uri;Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$GltfConversionListener;)V

    return-void
.end method
