.class Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$InfoHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "TabPageBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "InfoHolder"
.end annotation


# static fields
.field private static final VIEW_TYPE:I = 0x7f0c00b2


# instance fields
.field private final mTextView:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;Landroid/view/View;)V
    .locals 0

    .line 305
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$InfoHolder;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;

    .line 306
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    const p1, 0x7f0900fd

    .line 307
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$InfoHolder;->mTextView:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public bind(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$InfoCard;)V
    .locals 1

    .line 311
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$InfoHolder;->mTextView:Landroid/widget/TextView;

    iget-object p1, p1, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase$InfoCard;->text:Ljava/lang/String;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
