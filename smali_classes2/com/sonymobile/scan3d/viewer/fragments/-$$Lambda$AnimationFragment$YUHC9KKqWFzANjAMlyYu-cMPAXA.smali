.class public final synthetic Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$AnimationFragment$YUHC9KKqWFzANjAMlyYu-cMPAXA;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/util/function/Predicate;


# instance fields
.field private final synthetic f$0:Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;


# direct methods
.method public synthetic constructor <init>(Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$AnimationFragment$YUHC9KKqWFzANjAMlyYu-cMPAXA;->f$0:Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;

    return-void
.end method


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .locals 1

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$AnimationFragment$YUHC9KKqWFzANjAMlyYu-cMPAXA;->f$0:Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;

    check-cast p1, Lcom/sonymobile/scan3d/viewer/fragments/component/Pickable;

    invoke-static {v0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->lambda$populateAnimationMenu$4(Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;Lcom/sonymobile/scan3d/viewer/fragments/component/Pickable;)Z

    move-result p1

    return p1
.end method
