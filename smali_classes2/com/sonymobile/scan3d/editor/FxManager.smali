.class public Lcom/sonymobile/scan3d/editor/FxManager;
.super Ljava/lang/Object;
.source "FxManager.java"


# instance fields
.field private mNativeHandle:J


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 170
    invoke-static {}, Lcom/sonymobile/scan3d/editor/FxManager;->classInit()V

    return-void
.end method

.method public constructor <init>(Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/MeshRenderer;)V
    .locals 2

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->getNativeHandle()J

    move-result-wide v0

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->getNativeHandle()J

    move-result-wide p1

    invoke-static {v0, v1, p1, p2}, Lcom/sonymobile/scan3d/editor/FxManager;->create(JJ)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/sonymobile/scan3d/editor/FxManager;->mNativeHandle:J

    return-void
.end method

.method private native beginImpl(I)V
.end method

.method private static native classInit()V
.end method

.method private static native create(JJ)J
.end method

.method private native destroy()V
.end method

.method private native getTypeImpl()I
.end method


# virtual methods
.method public begin(Lcom/sonymobile/scan3d/FxManagerEffects;)V
    .locals 0

    .line 75
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/FxManagerEffects;->ordinal()I

    move-result p1

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/editor/FxManager;->beginImpl(I)V

    return-void
.end method

.method public native doAction()V
.end method

.method public native end(Z)V
.end method

.method public native getEffectCount()I
.end method

.method public native getParamCount()I
.end method

.method public native getParamValue(I)F
.end method

.method public getType()Lcom/sonymobile/scan3d/FxType;
    .locals 2

    .line 88
    invoke-static {}, Lcom/sonymobile/scan3d/FxType;->values()[Lcom/sonymobile/scan3d/FxType;

    move-result-object v0

    invoke-direct {p0}, Lcom/sonymobile/scan3d/editor/FxManager;->getTypeImpl()I

    move-result v1

    aget-object v0, v0, v1

    return-object v0
.end method

.method public native isChanged()Z
.end method

.method public native isParamChanged(I)Z
.end method

.method public release()V
    .locals 2

    .line 57
    invoke-direct {p0}, Lcom/sonymobile/scan3d/editor/FxManager;->destroy()V

    const-wide/16 v0, 0x0

    .line 58
    iput-wide v0, p0, Lcom/sonymobile/scan3d/editor/FxManager;->mNativeHandle:J

    return-void
.end method

.method public native restoreParams()V
.end method

.method public native saveParams()V
.end method

.method public native setParamValue(IF)V
.end method

.method public native updateModel()V
.end method
