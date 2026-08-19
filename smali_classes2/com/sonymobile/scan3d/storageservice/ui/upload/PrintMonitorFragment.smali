.class public Lcom/sonymobile/scan3d/storageservice/ui/upload/PrintMonitorFragment;
.super Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;
.source "PrintMonitorFragment.java"

# interfaces
.implements Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;


# static fields
.field private static final KEY_IMAGE:Ljava/lang/String; = "image"

.field private static final KEY_UPLOAD_FAILED:Ljava/lang/String; = "upload_failed"


# instance fields
.field private mDescription:Landroid/widget/TextView;

.field private mProgressBar:Landroid/view/View;

.field private mTitle:Landroid/widget/TextView;

.field private mUploadFailed:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;-><init>()V

    return-void
.end method

.method private gotoGallery()V
    .locals 3

    .line 144
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/PrintMonitorFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 147
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;

    invoke-direct {v1, v0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const v2, 0x10008000

    .line 148
    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 149
    invoke-virtual {v0, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 150
    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    :cond_0
    return-void
.end method

.method public static synthetic lambda$onViewCreated$0(Lcom/sonymobile/scan3d/storageservice/ui/upload/PrintMonitorFragment;Landroid/view/View;)V
    .locals 0

    .line 110
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/PrintMonitorFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentActivity;->finish()V

    return-void
.end method

.method public static newInstance(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;Lcom/sonymobile/scan3d/storageservice/network/Credentials;I)Lcom/sonymobile/scan3d/storageservice/ui/upload/PrintMonitorFragment;
    .locals 1
    .param p3    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 71
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/PrintMonitorFragment;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/PrintMonitorFragment;-><init>()V

    .line 72
    invoke-static {p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/PrintMonitorFragment;->prepareArgs(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;Lcom/sonymobile/scan3d/storageservice/network/Credentials;)Landroid/os/Bundle;

    move-result-object p0

    const-string p1, "image"

    .line 73
    invoke-virtual {p0, p1, p3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 74
    invoke-virtual {v0, p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/PrintMonitorFragment;->setArguments(Landroid/os/Bundle;)V

    return-object v0
.end method

.method private updateViews()V
    .locals 6

    .line 167
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/PrintMonitorFragment;->mUploadFailed:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 168
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/PrintMonitorFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v2, "fileset"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    .line 170
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/PrintMonitorFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string v3, "service_provider"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 171
    invoke-static {v2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    move-result-object v2

    .line 172
    invoke-virtual {v2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->getServiceProviderName()I

    move-result v2

    .line 171
    invoke-virtual {p0, v2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/PrintMonitorFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 174
    iget-object v3, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/PrintMonitorFragment;->mProgressBar:Landroid/view/View;

    const/4 v4, 0x4

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    .line 175
    iget-object v3, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/PrintMonitorFragment;->mTitle:Landroid/widget/TextView;

    const v4, 0x7f100227

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(I)V

    .line 176
    iget-object v3, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/PrintMonitorFragment;->mDescription:Landroid/widget/TextView;

    const v4, 0x7f100226

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    .line 177
    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getName()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v5, v1

    const/4 v0, 0x1

    aput-object v2, v5, v0

    .line 176
    invoke-virtual {p0, v4, v5}, Lcom/sonymobile/scan3d/storageservice/ui/upload/PrintMonitorFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 180
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/PrintMonitorFragment;->mProgressBar:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 181
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/PrintMonitorFragment;->mTitle:Landroid/widget/TextView;

    const v1, 0x7f10033c

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 182
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/PrintMonitorFragment;->mDescription:Landroid/widget/TextView;

    const v1, 0x7f100225

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    :goto_0
    return-void
.end method


# virtual methods
.method public doClick(Landroid/view/View;)V
    .locals 0

    .line 137
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/PrintMonitorFragment;->gotoGallery()V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1
    .param p2    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 82
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/PrintMonitorFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p3

    const-string v0, "image"

    invoke-virtual {p3, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p3

    const/4 v0, 0x0

    if-eqz p3, :cond_0

    const p3, 0x7f0c00c4

    .line 85
    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1

    :cond_0
    const p3, 0x7f0c00c3

    .line 87
    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method protected onHandleNoUploadRecord()V
    .locals 1

    const/4 v0, 0x1

    .line 159
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/PrintMonitorFragment;->mUploadFailed:Z

    .line 160
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/PrintMonitorFragment;->updateViews()V

    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    .line 131
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    const-string v0, "upload_failed"

    .line 132
    iget-boolean v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/PrintMonitorFragment;->mUploadFailed:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 3
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 93
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/PrintMonitorFragment;->getServiceProvider()Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz p2, :cond_0

    const-string v2, "upload_failed"

    .line 96
    invoke-virtual {p2, v2, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result p2

    iput-boolean p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/PrintMonitorFragment;->mUploadFailed:Z

    .line 100
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/PrintMonitorFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p2

    const v2, 0x7f0901f8

    .line 101
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Toolbar;

    .line 102
    invoke-virtual {v0, p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->getServiceProviderName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/Toolbar;->setTitle(Ljava/lang/CharSequence;)V

    .line 105
    invoke-virtual {p2, v2}, Landroid/app/Activity;->setActionBar(Landroid/widget/Toolbar;)V

    const p2, 0x7f0800cb

    .line 108
    invoke-virtual {v2, p2}, Landroid/widget/Toolbar;->setNavigationIcon(I)V

    const p2, 0x7f10002a

    .line 109
    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/PrintMonitorFragment;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v2, p2}, Landroid/widget/Toolbar;->setNavigationContentDescription(Ljava/lang/CharSequence;)V

    .line 110
    new-instance p2, Lcom/sonymobile/scan3d/storageservice/ui/upload/-$$Lambda$PrintMonitorFragment$Mmep7Pgonzs4j5t9bmtfRMJrPsM;

    invoke-direct {p2, p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/-$$Lambda$PrintMonitorFragment$Mmep7Pgonzs4j5t9bmtfRMJrPsM;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/upload/PrintMonitorFragment;)V

    invoke-virtual {v2, p2}, Landroid/widget/Toolbar;->setNavigationOnClickListener(Landroid/view/View$OnClickListener;)V

    const p2, 0x7f09020b

    .line 113
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    invoke-virtual {p2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p2, 0x7f09020d

    .line 115
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/PrintMonitorFragment;->mProgressBar:Landroid/view/View;

    const p2, 0x7f09020e

    .line 116
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/PrintMonitorFragment;->mTitle:Landroid/widget/TextView;

    const p2, 0x7f09020a

    .line 117
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/PrintMonitorFragment;->mDescription:Landroid/widget/TextView;

    .line 119
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/PrintMonitorFragment;->updateViews()V

    .line 121
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/PrintMonitorFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p2

    const-string v0, "image"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p2

    if-eqz p2, :cond_1

    const v0, 0x7f09020c

    .line 123
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    .line 124
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 125
    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    :cond_1
    return-void
.end method
