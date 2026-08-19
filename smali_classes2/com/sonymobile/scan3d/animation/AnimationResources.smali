.class public final enum Lcom/sonymobile/scan3d/animation/AnimationResources;
.super Ljava/lang/Enum;
.source "AnimationResources.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/animation/AnimationResources;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/animation/AnimationResources;

.field public static final enum ANGRY:Lcom/sonymobile/scan3d/animation/AnimationResources;

.field public static final enum FROWN:Lcom/sonymobile/scan3d/animation/AnimationResources;

.field public static final enum IDLE:Lcom/sonymobile/scan3d/animation/AnimationResources;

.field public static final enum LAUGH:Lcom/sonymobile/scan3d/animation/AnimationResources;

.field public static final enum NONE:Lcom/sonymobile/scan3d/animation/AnimationResources;

.field public static final enum SAD:Lcom/sonymobile/scan3d/animation/AnimationResources;

.field public static final enum SCARED:Lcom/sonymobile/scan3d/animation/AnimationResources;

.field public static final enum SMILE:Lcom/sonymobile/scan3d/animation/AnimationResources;

.field public static final enum SURPRISED:Lcom/sonymobile/scan3d/animation/AnimationResources;

.field public static final TYPE_DRAWABLE:Ljava/lang/String; = "drawable"

.field public static final TYPE_STRING:Ljava/lang/String; = "string"

.field public static final enum WINK:Lcom/sonymobile/scan3d/animation/AnimationResources;

.field public static final enum YAWN:Lcom/sonymobile/scan3d/animation/AnimationResources;


# instance fields
.field private final mAnimationName:Ljava/lang/String;

.field private final mResourceName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 15

    .line 12
    new-instance v0, Lcom/sonymobile/scan3d/animation/AnimationResources;

    const-string v1, "NONE"

    const-string v2, "animation_face_none"

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-direct {v0, v1, v3, v4, v2}, Lcom/sonymobile/scan3d/animation/AnimationResources;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/animation/AnimationResources;->NONE:Lcom/sonymobile/scan3d/animation/AnimationResources;

    .line 17
    new-instance v0, Lcom/sonymobile/scan3d/animation/AnimationResources;

    const-string v1, "IDLE"

    const-string v2, "Idle"

    const-string v4, "animation_face_idle"

    const/4 v5, 0x1

    invoke-direct {v0, v1, v5, v2, v4}, Lcom/sonymobile/scan3d/animation/AnimationResources;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/animation/AnimationResources;->IDLE:Lcom/sonymobile/scan3d/animation/AnimationResources;

    .line 22
    new-instance v0, Lcom/sonymobile/scan3d/animation/AnimationResources;

    const-string v1, "ANGRY"

    const-string v2, "Angry"

    const-string v4, "animation_face_angry"

    const/4 v6, 0x2

    invoke-direct {v0, v1, v6, v2, v4}, Lcom/sonymobile/scan3d/animation/AnimationResources;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/animation/AnimationResources;->ANGRY:Lcom/sonymobile/scan3d/animation/AnimationResources;

    .line 27
    new-instance v0, Lcom/sonymobile/scan3d/animation/AnimationResources;

    const-string v1, "FROWN"

    const-string v2, "Frown"

    const-string v4, "animation_face_frown"

    const/4 v7, 0x3

    invoke-direct {v0, v1, v7, v2, v4}, Lcom/sonymobile/scan3d/animation/AnimationResources;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/animation/AnimationResources;->FROWN:Lcom/sonymobile/scan3d/animation/AnimationResources;

    .line 32
    new-instance v0, Lcom/sonymobile/scan3d/animation/AnimationResources;

    const-string v1, "LAUGH"

    const-string v2, "Laugh"

    const-string v4, "animation_face_laugh"

    const/4 v8, 0x4

    invoke-direct {v0, v1, v8, v2, v4}, Lcom/sonymobile/scan3d/animation/AnimationResources;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/animation/AnimationResources;->LAUGH:Lcom/sonymobile/scan3d/animation/AnimationResources;

    .line 37
    new-instance v0, Lcom/sonymobile/scan3d/animation/AnimationResources;

    const-string v1, "SAD"

    const-string v2, "Sad"

    const-string v4, "animation_face_sad"

    const/4 v9, 0x5

    invoke-direct {v0, v1, v9, v2, v4}, Lcom/sonymobile/scan3d/animation/AnimationResources;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/animation/AnimationResources;->SAD:Lcom/sonymobile/scan3d/animation/AnimationResources;

    .line 42
    new-instance v0, Lcom/sonymobile/scan3d/animation/AnimationResources;

    const-string v1, "SCARED"

    const-string v2, "Scared"

    const-string v4, "animation_face_scared"

    const/4 v10, 0x6

    invoke-direct {v0, v1, v10, v2, v4}, Lcom/sonymobile/scan3d/animation/AnimationResources;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/animation/AnimationResources;->SCARED:Lcom/sonymobile/scan3d/animation/AnimationResources;

    .line 47
    new-instance v0, Lcom/sonymobile/scan3d/animation/AnimationResources;

    const-string v1, "SMILE"

    const-string v2, "Smile"

    const-string v4, "animation_face_smile"

    const/4 v11, 0x7

    invoke-direct {v0, v1, v11, v2, v4}, Lcom/sonymobile/scan3d/animation/AnimationResources;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/animation/AnimationResources;->SMILE:Lcom/sonymobile/scan3d/animation/AnimationResources;

    .line 52
    new-instance v0, Lcom/sonymobile/scan3d/animation/AnimationResources;

    const-string v1, "SURPRISED"

    const-string v2, "Surprised"

    const-string v4, "animation_face_surprised"

    const/16 v12, 0x8

    invoke-direct {v0, v1, v12, v2, v4}, Lcom/sonymobile/scan3d/animation/AnimationResources;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/animation/AnimationResources;->SURPRISED:Lcom/sonymobile/scan3d/animation/AnimationResources;

    .line 57
    new-instance v0, Lcom/sonymobile/scan3d/animation/AnimationResources;

    const-string v1, "YAWN"

    const-string v2, "Yawn"

    const-string v4, "animation_face_yawn"

    const/16 v13, 0x9

    invoke-direct {v0, v1, v13, v2, v4}, Lcom/sonymobile/scan3d/animation/AnimationResources;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/animation/AnimationResources;->YAWN:Lcom/sonymobile/scan3d/animation/AnimationResources;

    .line 62
    new-instance v0, Lcom/sonymobile/scan3d/animation/AnimationResources;

    const-string v1, "WINK"

    const-string v2, "Wink"

    const-string v4, "animation_face_wink"

    const/16 v14, 0xa

    invoke-direct {v0, v1, v14, v2, v4}, Lcom/sonymobile/scan3d/animation/AnimationResources;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/animation/AnimationResources;->WINK:Lcom/sonymobile/scan3d/animation/AnimationResources;

    const/16 v0, 0xb

    .line 7
    new-array v0, v0, [Lcom/sonymobile/scan3d/animation/AnimationResources;

    sget-object v1, Lcom/sonymobile/scan3d/animation/AnimationResources;->NONE:Lcom/sonymobile/scan3d/animation/AnimationResources;

    aput-object v1, v0, v3

    sget-object v1, Lcom/sonymobile/scan3d/animation/AnimationResources;->IDLE:Lcom/sonymobile/scan3d/animation/AnimationResources;

    aput-object v1, v0, v5

    sget-object v1, Lcom/sonymobile/scan3d/animation/AnimationResources;->ANGRY:Lcom/sonymobile/scan3d/animation/AnimationResources;

    aput-object v1, v0, v6

    sget-object v1, Lcom/sonymobile/scan3d/animation/AnimationResources;->FROWN:Lcom/sonymobile/scan3d/animation/AnimationResources;

    aput-object v1, v0, v7

    sget-object v1, Lcom/sonymobile/scan3d/animation/AnimationResources;->LAUGH:Lcom/sonymobile/scan3d/animation/AnimationResources;

    aput-object v1, v0, v8

    sget-object v1, Lcom/sonymobile/scan3d/animation/AnimationResources;->SAD:Lcom/sonymobile/scan3d/animation/AnimationResources;

    aput-object v1, v0, v9

    sget-object v1, Lcom/sonymobile/scan3d/animation/AnimationResources;->SCARED:Lcom/sonymobile/scan3d/animation/AnimationResources;

    aput-object v1, v0, v10

    sget-object v1, Lcom/sonymobile/scan3d/animation/AnimationResources;->SMILE:Lcom/sonymobile/scan3d/animation/AnimationResources;

    aput-object v1, v0, v11

    sget-object v1, Lcom/sonymobile/scan3d/animation/AnimationResources;->SURPRISED:Lcom/sonymobile/scan3d/animation/AnimationResources;

    aput-object v1, v0, v12

    sget-object v1, Lcom/sonymobile/scan3d/animation/AnimationResources;->YAWN:Lcom/sonymobile/scan3d/animation/AnimationResources;

    aput-object v1, v0, v13

    sget-object v1, Lcom/sonymobile/scan3d/animation/AnimationResources;->WINK:Lcom/sonymobile/scan3d/animation/AnimationResources;

    aput-object v1, v0, v14

    sput-object v0, Lcom/sonymobile/scan3d/animation/AnimationResources;->$VALUES:[Lcom/sonymobile/scan3d/animation/AnimationResources;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 116
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 117
    iput-object p3, p0, Lcom/sonymobile/scan3d/animation/AnimationResources;->mAnimationName:Ljava/lang/String;

    .line 118
    iput-object p4, p0, Lcom/sonymobile/scan3d/animation/AnimationResources;->mResourceName:Ljava/lang/String;

    return-void
.end method

.method public static fromString(Landroid/content/Context;Ljava/lang/String;)Lcom/sonymobile/scan3d/animation/AnimationResources;
    .locals 3
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 86
    :try_start_0
    const-class v1, Lcom/sonymobile/scan3d/animation/AnimationResources;

    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p1

    check-cast p1, Lcom/sonymobile/scan3d/animation/AnimationResources;
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-object p1, v0

    :goto_0
    if-eqz p1, :cond_0

    const-string v1, "string"

    .line 92
    iget-object v2, p1, Lcom/sonymobile/scan3d/animation/AnimationResources;->mResourceName:Ljava/lang/String;

    invoke-direct {p1, p0, v1, v2}, Lcom/sonymobile/scan3d/animation/AnimationResources;->getResource(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    if-lez v1, :cond_0

    const-string v1, "drawable"

    iget-object v2, p1, Lcom/sonymobile/scan3d/animation/AnimationResources;->mResourceName:Ljava/lang/String;

    .line 93
    invoke-direct {p1, p0, v1, v2}, Lcom/sonymobile/scan3d/animation/AnimationResources;->getResource(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    if-lez p0, :cond_0

    return-object p1

    :cond_0
    return-object v0
.end method

.method private getResource(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I
    .locals 1

    .line 140
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 141
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p3, p2, p1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/animation/AnimationResources;
    .locals 1

    .line 7
    const-class v0, Lcom/sonymobile/scan3d/animation/AnimationResources;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/animation/AnimationResources;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/animation/AnimationResources;
    .locals 1

    .line 7
    sget-object v0, Lcom/sonymobile/scan3d/animation/AnimationResources;->$VALUES:[Lcom/sonymobile/scan3d/animation/AnimationResources;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/animation/AnimationResources;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/animation/AnimationResources;

    return-object v0
.end method


# virtual methods
.method public getDrawable(Landroid/content/Context;)I
    .locals 2

    const-string v0, "drawable"

    .line 136
    iget-object v1, p0, Lcom/sonymobile/scan3d/animation/AnimationResources;->mResourceName:Ljava/lang/String;

    invoke-direct {p0, p1, v0, v1}, Lcom/sonymobile/scan3d/animation/AnimationResources;->getResource(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public getNameId(Landroid/content/Context;)I
    .locals 2

    const-string v0, "string"

    .line 127
    iget-object v1, p0, Lcom/sonymobile/scan3d/animation/AnimationResources;->mResourceName:Ljava/lang/String;

    invoke-direct {p0, p1, v0, v1}, Lcom/sonymobile/scan3d/animation/AnimationResources;->getResource(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    return p1
.end method
