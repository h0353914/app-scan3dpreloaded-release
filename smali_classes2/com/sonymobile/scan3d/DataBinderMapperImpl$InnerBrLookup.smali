.class Lcom/sonymobile/scan3d/DataBinderMapperImpl$InnerBrLookup;
.super Ljava/lang/Object;
.source "DataBinderMapperImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/DataBinderMapperImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "InnerBrLookup"
.end annotation


# static fields
.field static final sKeys:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 133
    new-instance v0, Landroid/util/SparseArray;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Landroid/util/SparseArray;-><init>(I)V

    sput-object v0, Lcom/sonymobile/scan3d/DataBinderMapperImpl$InnerBrLookup;->sKeys:Landroid/util/SparseArray;

    .line 136
    sget-object v0, Lcom/sonymobile/scan3d/DataBinderMapperImpl$InnerBrLookup;->sKeys:Landroid/util/SparseArray;

    const-string v1, "_all"

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 137
    sget-object v0, Lcom/sonymobile/scan3d/DataBinderMapperImpl$InnerBrLookup;->sKeys:Landroid/util/SparseArray;

    const-string v1, "improveDrawable"

    const/4 v2, 0x1

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 138
    sget-object v0, Lcom/sonymobile/scan3d/DataBinderMapperImpl$InnerBrLookup;->sKeys:Landroid/util/SparseArray;

    const-string v1, "drawable"

    const/4 v2, 0x2

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 139
    sget-object v0, Lcom/sonymobile/scan3d/DataBinderMapperImpl$InnerBrLookup;->sKeys:Landroid/util/SparseArray;

    const-string v1, "socleDrawable"

    const/4 v2, 0x3

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 140
    sget-object v0, Lcom/sonymobile/scan3d/DataBinderMapperImpl$InnerBrLookup;->sKeys:Landroid/util/SparseArray;

    const-string v1, "animText"

    const/4 v2, 0x4

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 141
    sget-object v0, Lcom/sonymobile/scan3d/DataBinderMapperImpl$InnerBrLookup;->sKeys:Landroid/util/SparseArray;

    const-string v1, "text"

    const/4 v2, 0x5

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 132
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
