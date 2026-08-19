.class Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$SharingPagerAdapter;
.super Landroidx/fragment/app/FragmentPagerAdapter;
.source "SharingFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SharingPagerAdapter"
.end annotation


# instance fields
.field private mTabs:[Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;

.field final synthetic this$0:Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;Landroidx/fragment/app/FragmentManager;)V
    .locals 2

    .line 193
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$SharingPagerAdapter;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;

    .line 194
    invoke-direct {p0, p2}, Landroidx/fragment/app/FragmentPagerAdapter;-><init>(Landroidx/fragment/app/FragmentManager;)V

    .line 196
    new-instance p2, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "shareable"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;-><init>(Landroid/os/Bundle;)V

    .line 197
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->getScanFormat()I

    move-result p1

    const/4 p2, 0x0

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 198
    new-array p1, v0, [Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;

    sget-object v0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;->SHARE:Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;

    aput-object v0, p1, p2

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$SharingPagerAdapter;->mTabs:[Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;

    goto :goto_0

    :cond_0
    const/4 p1, 0x2

    .line 200
    new-array p1, p1, [Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;

    sget-object v1, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;->SHARE:Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;

    aput-object v1, p1, p2

    sget-object p2, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;->PRINT:Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;

    aput-object p2, p1, v0

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$SharingPagerAdapter;->mTabs:[Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;

    :goto_0
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .line 233
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$SharingPagerAdapter;->mTabs:[Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;

    array-length v0, v0

    return v0
.end method

.method public getItem(I)Landroidx/fragment/app/Fragment;
    .locals 5

    .line 206
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$SharingPagerAdapter;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;

    invoke-static {v0}, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;->access$000(Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;)Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    move-result-object v0

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getScanPolicyMode()I

    move-result v0

    .line 207
    new-instance v1, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$SharingPagerAdapter;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;

    invoke-virtual {v2}, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string v3, "shareable"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;-><init>(Landroid/os/Bundle;)V

    .line 208
    invoke-virtual {v1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->getFileSet()Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v2

    .line 209
    sget-object v3, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$1;->$SwitchMap$com$sonymobile$scan3d$viewer$sharing$SharingFragment$Tab:[I

    iget-object v4, p0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$SharingPagerAdapter;->mTabs:[Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;

    aget-object v4, v4, p1

    invoke-virtual {v4}, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 216
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unsupported tab "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$SharingPagerAdapter;->mTabs:[Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;

    aget-object p1, v2, p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 212
    :pswitch_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$SharingPagerAdapter;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v3, "view_matrix"

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getFloatArray(Ljava/lang/String;)[F

    move-result-object p1

    .line 214
    invoke-static {v2, v0, p1, v1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->newInstance(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;I[FLcom/sonymobile/scan3d/viewer/sharing/Shareable;)Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    move-result-object p1

    return-object p1

    .line 210
    :pswitch_1
    invoke-static {v2, v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint;->newInstance(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;I)Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPagePrint;

    move-result-object p1

    return-object p1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method getPageNumber(Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;)I
    .locals 3

    const/4 v0, 0x0

    .line 248
    :goto_0
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$SharingPagerAdapter;->mTabs:[Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;

    array-length v2, v1

    if-ge v0, v2, :cond_1

    .line 249
    aget-object v1, v1, v0

    if-ne v1, p1, :cond_0

    return v0

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 251
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to find a tab "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getPageTitle(I)Ljava/lang/CharSequence;
    .locals 3

    .line 238
    sget-object v0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$1;->$SwitchMap$com$sonymobile$scan3d$viewer$sharing$SharingFragment$Tab:[I

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$SharingPagerAdapter;->mTabs:[Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;

    aget-object v1, v1, p1

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 242
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to get title for tab "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$SharingPagerAdapter;->mTabs:[Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;

    aget-object p1, v2, p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 240
    :pswitch_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$SharingPagerAdapter;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;

    const v0, 0x7f100280

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 239
    :pswitch_1
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$SharingPagerAdapter;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;

    const v0, 0x7f10027f

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setPrimaryItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 3

    .line 223
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$SharingPagerAdapter;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;

    invoke-static {p1}, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;->access$100(Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;)I

    move-result p1

    if-ne p1, p2, :cond_0

    return-void

    .line 226
    :cond_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$SharingPagerAdapter;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;

    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;->access$102(Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;I)I

    .line 228
    sget-object p1, Lcom/sonymobile/scan3d/analytics/HitEvent;->SHARING_TAB_CLICKED:Lcom/sonymobile/scan3d/analytics/HitEvent;

    iget-object p3, p0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$SharingPagerAdapter;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;

    invoke-virtual {p3}, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;->getContext()Landroid/content/Context;

    move-result-object p3

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$SharingPagerAdapter;->mTabs:[Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;

    aget-object v0, v0, p2

    invoke-static {v0}, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;->tabToString(Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;)Ljava/lang/String;

    move-result-object v0

    int-to-long v1, p2

    invoke-virtual {p1, p3, v0, v1, v2}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;Ljava/lang/String;J)V

    return-void
.end method
