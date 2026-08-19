.class Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup$EffectDescription;
.super Ljava/lang/Object;
.source "EditorFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "EffectDescription"
.end annotation


# instance fields
.field enabled:Z

.field icon:I

.field label:I

.field longLabel:I

.field ord:I

.field final synthetic this$1:Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;IIIIZ)V
    .locals 0

    .line 257
    iput-object p1, p0, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup$EffectDescription;->this$1:Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 258
    iput p2, p0, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup$EffectDescription;->ord:I

    .line 259
    iput p3, p0, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup$EffectDescription;->label:I

    .line 260
    iput p4, p0, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup$EffectDescription;->longLabel:I

    .line 261
    iput p5, p0, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup$EffectDescription;->icon:I

    .line 262
    iput-boolean p6, p0, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup$EffectDescription;->enabled:Z

    return-void
.end method
