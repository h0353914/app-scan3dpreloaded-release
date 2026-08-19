.class Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;
.super Ljava/lang/Object;
.source "EditorFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/editor/EditorFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "EffectGroup"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup$EffectDescription;
    }
.end annotation


# instance fields
.field private mActionButtonLabel:I

.field private mEffectId:Lcom/sonymobile/scan3d/FxManagerEffects;

.field private mEffects:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup$EffectDescription;",
            ">;"
        }
    .end annotation
.end field

.field private mMainDrawable:I

.field private mMainText:I

.field final synthetic this$0:Lcom/sonymobile/scan3d/editor/EditorFragment;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/editor/EditorFragment;IIILcom/sonymobile/scan3d/FxManagerEffects;)V
    .locals 0

    .line 284
    iput-object p1, p0, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;->this$0:Lcom/sonymobile/scan3d/editor/EditorFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 282
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;->mEffects:Ljava/util/List;

    .line 285
    iput p2, p0, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;->mMainText:I

    .line 286
    iput p3, p0, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;->mMainDrawable:I

    .line 287
    iput p4, p0, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;->mActionButtonLabel:I

    .line 288
    iput-object p5, p0, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;->mEffectId:Lcom/sonymobile/scan3d/FxManagerEffects;

    return-void
.end method

.method static synthetic access$300(Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;)V
    .locals 0

    .line 225
    invoke-direct {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;->addParameters()V

    return-void
.end method

.method private addParameters()V
    .locals 6

    .line 353
    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;->this$0:Lcom/sonymobile/scan3d/editor/EditorFragment;

    invoke-static {v0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->access$000(Lcom/sonymobile/scan3d/editor/EditorFragment;)Landroid/view/ViewGroup;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 354
    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;->this$0:Lcom/sonymobile/scan3d/editor/EditorFragment;

    invoke-static {v0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->access$100(Lcom/sonymobile/scan3d/editor/EditorFragment;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 355
    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;->mEffects:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup$EffectDescription;

    .line 356
    iget-object v2, p0, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;->this$0:Lcom/sonymobile/scan3d/editor/EditorFragment;

    invoke-virtual {v2}, Lcom/sonymobile/scan3d/editor/EditorFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/fragment/app/FragmentActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v2

    const v3, 0x7f0c0055

    iget-object v4, p0, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;->this$0:Lcom/sonymobile/scan3d/editor/EditorFragment;

    .line 357
    invoke-static {v4}, Lcom/sonymobile/scan3d/editor/EditorFragment;->access$000(Lcom/sonymobile/scan3d/editor/EditorFragment;)Landroid/view/ViewGroup;

    move-result-object v4

    const/4 v5, 0x0

    .line 356
    invoke-virtual {v2, v3, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    .line 358
    new-instance v3, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$EffectGroup$95m7rKXM79UfpcXDia6l6HNiClY;

    invoke-direct {v3, p0, v1}, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$EffectGroup$95m7rKXM79UfpcXDia6l6HNiClY;-><init>(Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup$EffectDescription;)V

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v3, 0x7f090104

    .line 360
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 361
    iget v4, v1, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup$EffectDescription;->icon:I

    invoke-virtual {v3, v5, v4, v5, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 362
    iget v1, v1, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup$EffectDescription;->label:I

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(I)V

    const v1, 0x7f09008d

    .line 363
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    const/16 v3, 0x8

    .line 364
    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 365
    iget-object v1, p0, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;->this$0:Lcom/sonymobile/scan3d/editor/EditorFragment;

    invoke-static {v1}, Lcom/sonymobile/scan3d/editor/EditorFragment;->access$000(Lcom/sonymobile/scan3d/editor/EditorFragment;)Landroid/view/ViewGroup;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 366
    iget-object v1, p0, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;->this$0:Lcom/sonymobile/scan3d/editor/EditorFragment;

    invoke-static {v1}, Lcom/sonymobile/scan3d/editor/EditorFragment;->access$100(Lcom/sonymobile/scan3d/editor/EditorFragment;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    return-void
.end method

.method public static synthetic lambda$addParameters$0(Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup$EffectDescription;Landroid/view/View;)V
    .locals 2

    .line 359
    iget-object p2, p0, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;->this$0:Lcom/sonymobile/scan3d/editor/EditorFragment;

    iget v0, p1, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup$EffectDescription;->longLabel:I

    iget v1, p1, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup$EffectDescription;->ord:I

    iget-boolean p1, p1, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup$EffectDescription;->enabled:Z

    invoke-static {p2, p0, v0, v1, p1}, Lcom/sonymobile/scan3d/editor/EditorFragment;->access$200(Lcom/sonymobile/scan3d/editor/EditorFragment;Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;IIZ)V

    return-void
.end method


# virtual methods
.method add(Ljava/lang/Enum;IIIZ)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Enum<",
            "TT;>;>(TT;IIIZ)V"
        }
    .end annotation

    .line 302
    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;->mEffects:Ljava/util/List;

    new-instance v8, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup$EffectDescription;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    move-object v1, v8

    move-object v2, p0

    move v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    invoke-direct/range {v1 .. v7}, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup$EffectDescription;-><init>(Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;IIIIZ)V

    invoke-interface {v0, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method add(Ljava/lang/Enum;IIZ)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Enum<",
            "TT;>;>(TT;IIZ)V"
        }
    .end annotation

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p2

    move v4, p3

    move v5, p4

    .line 314
    invoke-virtual/range {v0 .. v5}, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;->add(Ljava/lang/Enum;IIIZ)V

    return-void
.end method

.method getButtonLabel()I
    .locals 1

    .line 346
    iget v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;->mActionButtonLabel:I

    return v0
.end method

.method getDrawable()I
    .locals 1

    .line 322
    iget v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;->mMainDrawable:I

    return v0
.end method

.method getEffectId()Lcom/sonymobile/scan3d/FxManagerEffects;
    .locals 1

    .line 338
    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;->mEffectId:Lcom/sonymobile/scan3d/FxManagerEffects;

    return-object v0
.end method

.method getText()I
    .locals 1

    .line 330
    iget v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;->mMainText:I

    return v0
.end method
